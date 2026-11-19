package primitives_example

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Tests the GPU_Primitive_t fix and the uniform/immediate-mode bridges.
//
// GPU_Primitive_t.TRIANGLE_STRIP and .TRIANGLE_FAN used to be 1 and 2;
// citro3d expects 0x100 and 0x200. Each shape below names what it should
// look like, so a wrong primitive type is easy to spot.
//
//   left   TRIANGLE_STRIP (C3D_DrawArrays)  a solid 4-segment ribbon, red to yellow
//   middle TRIANGLE_FAN   (C3D_DrawArrays)  a solid hexagon, white centre, blue rim
//   right  C3D_ImmDrawBegin(.TRIANGLE_STRIP) + C3D_ImmDrawRestartPrim:
//          two separate green squares; without the restart they are joined
//          by a sliver
//
// The projection matrix is uploaded with C3D_FVUnifWritePtr (bridged in
// this branch; it failed to link before).
//
// Controls:
//   A      toggle the restart in the immediate-mode strip
//   START  exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

STRIP_COUNT :: 10
FAN_COUNT   :: 8

// Ribbon: 5 columns, zig-zagging between y=60 and y=180.
strip_vertices := [STRIP_COUNT]Vertex{
    { 20.0,  60.0, 0.5,  1.0, 0.0, 0.0, 1.0},
    { 20.0, 180.0, 0.5,  1.0, 0.0, 0.0, 1.0},
    { 45.0,  60.0, 0.5,  1.0, 0.3, 0.0, 1.0},
    { 45.0, 180.0, 0.5,  1.0, 0.3, 0.0, 1.0},
    { 70.0,  60.0, 0.5,  1.0, 0.6, 0.0, 1.0},
    { 70.0, 180.0, 0.5,  1.0, 0.6, 0.0, 1.0},
    { 95.0,  60.0, 0.5,  1.0, 0.8, 0.0, 1.0},
    { 95.0, 180.0, 0.5,  1.0, 0.8, 0.0, 1.0},
    {120.0,  60.0, 0.5,  1.0, 1.0, 0.0, 1.0},
    {120.0, 180.0, 0.5,  1.0, 1.0, 0.0, 1.0},
}

// Hexagon around (200, 120): centre, six rim points, then the first rim
// point again to close it.
fan_vertices := [FAN_COUNT]Vertex{
    {200.0, 120.0, 0.5,  1.0, 1.0, 1.0, 1.0},
    {260.0, 120.0, 0.5,  0.0, 0.2, 1.0, 1.0},
    {230.0,  68.0, 0.5,  0.0, 0.2, 1.0, 1.0},
    {170.0,  68.0, 0.5,  0.0, 0.2, 1.0, 1.0},
    {140.0, 120.0, 0.5,  0.0, 0.2, 1.0, 1.0},
    {170.0, 172.0, 0.5,  0.0, 0.2, 1.0, 1.0},
    {230.0, 172.0, 0.5,  0.0, 0.2, 1.0, 1.0},
    {260.0, 120.0, 0.5,  0.0, 0.2, 1.0, 1.0},
}

imm_vertex :: proc "contextless" (x, y: f32) {
    c3d.C3D_ImmSendAttrib(x, y, 0.5, 1.0)  // v0 position
    c3d.C3D_ImmSendAttrib(0.1, 0.9, 0.2, 1.0) // v1 colour
}

@(export, link_name = "odin_main")
primitives_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c3d.C3D_RenderTargetCreate(240, 400, .RGBA8, c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top, ctru.GFX_TOP, ctru.GFX_LEFT, DISPLAY_TRANSFER_FLAGS)

    sf := ctru.fopen("romfs:/vshader.shbin", "rb")
    ctru.fseek(sf, 0, ctru.SEEK_END)
    sh_size := ctru.ftell(sf)
    ctru.fseek(sf, 0, ctru.SEEK_SET)
    sh_buf := ctru.malloc(uint(sh_size))
    ctru.fread(sh_buf, 1, uint(sh_size), sf)
    ctru.fclose(sf)

    dvlb := ctru.DVLB_ParseFile(cast(^u32)sh_buf, u32(sh_size))
    prog: ctru.shaderProgram_s
    ctru.shaderProgramInit(&prog)
    ctru.shaderProgramSetVsh(&prog, dvlb.DVLE)
    c3d.C3D_BindProgram(&prog)

    uloc_proj := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "projection"))

    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 4)

    // One VBO holding the strip, then the fan.
    vbo_size := uint(size_of(strip_vertices) + size_of(fan_vertices))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &strip_vertices, size_of(strip_vertices))
    ctru.memcpy(rawptr(uintptr(vbo_data) + size_of(strip_vertices)), &fan_vertices, size_of(fan_vertices))

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both, .PRIMARY_COLOR, .PRIMARY_COLOR, .PRIMARY_COLOR)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    c3d.C3D_DepthTest(false, .ALWAYS, .ALL)
    c3d.C3D_CullFace(.NONE)

    // Same orthographic matrix as Triangle-Example (C3D_FVec is stored w, z, y, x).
    projection: c3d.C3D_Mtx
    projection.r[0] = c3d.C3D_FVec{ 1.0, 0.0, -2.0 / 240.0, 0.0}
    projection.r[1] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, -2.0 / 400.0}
    projection.r[2] = c3d.C3D_FVec{-1.0, 1.0, 0.0, 0.0}
    projection.r[3] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, 0.0}

    restart := true

    ctru.printf("\x1b[1;1HPrimitives-Example")
    ctru.printf("\x1b[3;1HLeft:   strip  - solid ribbon")
    ctru.printf("\x1b[4;1HMiddle: fan    - solid hexagon")
    ctru.printf("\x1b[5;1HRight:  imm strip - 2 squares")
    ctru.printf("\x1b[7;1HGPU_Primitive_t values:")
    ctru.printf("\x1b[8;1H  STRIP=0x%03X FAN=0x%03X", u32(c3d.GPU_Primitive_t.TRIANGLE_STRIP), u32(c3d.GPU_Primitive_t.TRIANGLE_FAN))
    ctru.printf("\x1b[9;1H  (expect 0x100 and 0x200)")
    ctru.printf("\x1b[12;1HA: toggle restart   START: exit")

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        if down & ctru.KEY_START != 0 do break
        if down & ctru.KEY_A != 0 do restart = !restart

        if restart {
            ctru.printf("\x1b[10;1HRestart: ON  (squares apart)  ")
        } else {
            ctru.printf("\x1b[10;1HRestart: OFF (squares joined) ")
        }

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        // Write the four matrix rows straight into citro3d's uniform storage.
        rows := cast([^]c3d.C3D_FVec)c3d.C3D_FVUnifWritePtr(.VERTEX_SHADER, uloc_proj, 4)
        for i in 0 ..< 4 do rows[i] = projection.r[i]

        c3d.C3D_DrawArrays(.TRIANGLE_STRIP, 0, STRIP_COUNT)
        c3d.C3D_DrawArrays(.TRIANGLE_FAN, STRIP_COUNT, FAN_COUNT)

        c3d.C3D_ImmDrawBegin(.TRIANGLE_STRIP)
        imm_vertex(300.0,  60.0)
        imm_vertex(300.0, 110.0)
        imm_vertex(350.0,  60.0)
        imm_vertex(350.0, 110.0)
        if restart do c3d.C3D_ImmDrawRestartPrim()
        imm_vertex(300.0, 130.0)
        imm_vertex(300.0, 180.0)
        imm_vertex(350.0, 130.0)
        imm_vertex(350.0, 180.0)
        c3d.C3D_ImmDrawEnd()

        c3d.C3D_FrameEnd(0)
    }

    ctru.linearFree(vbo_data)
    ctru.shaderProgramFree(&prog)
    ctru.DVLB_Free(dvlb)
    ctru.free(sh_buf)
    c3d.C3D_Fini()
    ctru.gfxExit()
    ctru.romfsExit()
    return 0
}
