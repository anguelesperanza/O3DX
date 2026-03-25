package lighting_example

import "base:runtime"
import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// STEP F: Hardware lighting.
// Vertex format: pos(3f)+normal(3f) = 24 bytes.
// Shader outputs: outpos (clip), outnq (normalquat), outview (view-space pos).
// CPU side: C3D_LightEnv + C3D_Light + LUT bound before the loop;
//           TexEnv reads FRAGMENT_PRIMARY (the lit colour from the lighting unit).

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

Vertex :: struct {
    x,  y,  z:  f32,
    nx, ny, nz: f32,
}

vertex_list := [36]Vertex{
    // Front  (z=+1)  normal  0, 0,+1
    {-1,-1,+1, 0,0,+1}, {+1,-1,+1, 0,0,+1}, {+1,+1,+1, 0,0,+1},
    {-1,-1,+1, 0,0,+1}, {+1,+1,+1, 0,0,+1}, {-1,+1,+1, 0,0,+1},
    // Back   (z=-1)  normal  0, 0,-1
    {+1,-1,-1, 0,0,-1}, {-1,-1,-1, 0,0,-1}, {-1,+1,-1, 0,0,-1},
    {+1,-1,-1, 0,0,-1}, {-1,+1,-1, 0,0,-1}, {+1,+1,-1, 0,0,-1},
    // Left   (x=-1)  normal -1, 0, 0
    {-1,-1,-1, -1,0,0}, {-1,-1,+1, -1,0,0}, {-1,+1,+1, -1,0,0},
    {-1,-1,-1, -1,0,0}, {-1,+1,+1, -1,0,0}, {-1,+1,-1, -1,0,0},
    // Right  (x=+1)  normal +1, 0, 0
    {+1,-1,+1, +1,0,0}, {+1,-1,-1, +1,0,0}, {+1,+1,-1, +1,0,0},
    {+1,-1,+1, +1,0,0}, {+1,+1,-1, +1,0,0}, {+1,+1,+1, +1,0,0},
    // Top    (y=+1)  normal  0,+1, 0
    {-1,+1,+1, 0,+1,0}, {+1,+1,+1, 0,+1,0}, {+1,+1,-1, 0,+1,0},
    {-1,+1,+1, 0,+1,0}, {+1,+1,-1, 0,+1,0}, {-1,+1,-1, 0,+1,0},
    // Bottom (y=-1)  normal  0,-1, 0
    {-1,-1,-1, 0,-1,0}, {+1,-1,-1, 0,-1,0}, {+1,-1,+1, 0,-1,0},
    {-1,-1,-1, 0,-1,0}, {+1,-1,+1, 0,-1,0}, {-1,-1,+1, 0,-1,0},
}

@(export, link_name = "odin_main")
lighting_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    context = runtime.default_context()

    romfs_rc := ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)
    ctru.printf("\x1b[5;1HromfsInit rc: 0x%08lX", romfs_rc)

    top := c3d.C3D_RenderTargetCreate(240, 400, .RGBA8, c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top, ctru.GFX_TOP, ctru.GFX_LEFT, DISPLAY_TRANSFER_FLAGS)

    sf := ctru.fopen("romfs:/vshader.shbin", "rb")
    ctru.fseek(sf, 0, ctru.SEEK_END)
    sh_size := ctru.ftell(sf)
    ctru.fseek(sf, 0, ctru.SEEK_SET)
    sh_buf := ctru.malloc(uint(sh_size))
    ctru.fread(sh_buf, 1, uint(sh_size), sf)
    ctru.fclose(sf)
    ctru.printf("\x1b[3;1Hsh_size: %d    ", sh_size)

    dvlb := ctru.DVLB_ParseFile(cast(^u32)sh_buf, u32(sh_size))
    prog: ctru.shaderProgram_s
    ctru.shaderProgramInit(&prog)
    ctru.shaderProgramSetVsh(&prog, dvlb.DVLE)
    c3d.C3D_BindProgram(&prog)

    uLoc_mvp := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "mvp"))
    uLoc_mv  := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "modelView"))
    ctru.printf("\x1b[6;1Hmvp=%d  mv=%d    ", uLoc_mvp, uLoc_mv)

    // Vertex attributes: pos float3, normal float3 — 24-byte stride.
    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 = position
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 3) // v1 = normal

    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    // ── TexEnv: output the hardware-lit fragment primary colour ──────────────
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .FRAGMENT_PRIMARY, .FRAGMENT_PRIMARY, .FRAGMENT_PRIMARY)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Hardware lighting setup ───────────────────────────────────────────────
    lightEnv: c3d.C3D_LightEnv
    light:    c3d.C3D_Light
    lut:      c3d.C3D_LightLut

    c3d.C3D_LightEnvInit(&lightEnv)
    c3d.C3D_LightEnvBind(&lightEnv)

    // Phong diffuse distribution LUT — D0 slot, indexed by L·N dot product.
    c3d.LightLut_Phong(&lut, 16.0)
    c3d.C3D_LightEnvLut(&lightEnv, .D0, .LN, false, &lut)

    // Light: white diffuse, no per-light ambient.
    _ = c3d.C3D_LightInit(&light, &lightEnv)
    c3d.C3D_LightDiffuse(&light, 1.0, 1.0, 1.0)
    c3d.C3D_LightAmbient(&light, 0.0, 0.0, 0.0)

    // Positional light (w=1) at (4, 4, 4) in world/view space.
    lightPos := c3d.C3D_FVec{x=4.0, y=4.0, z=4.0, w=1.0}
    c3d.C3D_LightPosition(&light, &lightPos)

    // Scene ambient keeps dark faces visible.
    c3d.C3D_LightEnvAmbient(&lightEnv, 0.3, 0.3, 0.3)

    // Material: neutral white so light colours dominate.
    mtl := c3d.C3D_Material{
        ambient   = {1.0, 1.0, 1.0},
        diffuse   = {1.0, 1.0, 1.0},
        specular0 = {0.0, 0.0, 0.0},
        specular1 = {0.0, 0.0, 0.0},
        emission  = {0.0, 0.0, 0.0},
    }
    c3d.C3D_LightEnvMaterial(&lightEnv, &mtl)

    proj: c3d.C3D_Mtx
    c3d.Mtx_PerspTilt_Bridge(&proj,
                              c3d.C3D_AngleFromDegrees(40.0),
                              c3d.C3D_AspectRatioTop,
                              0.01, 1000.0,
                              false)

    ctru.printf("\x1b[1;1HStep F: hardware lighting")
    ctru.printf("\x1b[2;1HPress START to exit")

    angleX: f32 = 0.0
    angleY: f32 = 0.0

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        angleX += 0.005
        angleY += 0.010
        if angleX >= c3d.C3D_TAU do angleX -= c3d.C3D_TAU
        if angleY >= c3d.C3D_TAU do angleY -= c3d.C3D_TAU

        model: c3d.C3D_Mtx
        c3d.Mtx_Identity(&model)
        c3d.Mtx_Translate(&model, 0.0, 0.0, -6.0, true)
        c3d.Mtx_RotateX(&model, angleX, true)
        c3d.Mtx_RotateY(&model, angleY, true)

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        // mvp = proj*model → clip-space.  modelView = model → view-space normal/pos.
        mvp: c3d.C3D_Mtx
        c3d.Mtx_Multiply(&mvp, &proj, &model)
        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uLoc_mvp, &mvp)
        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uLoc_mv,  &model)

        c3d.C3D_DrawArrays(.TRIANGLES, 0, 36)
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
