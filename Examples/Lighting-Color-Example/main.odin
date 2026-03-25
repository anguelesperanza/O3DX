package lighting_color_example

import "base:runtime"
import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Lighting-Color-Example — same hardware lighting pipeline as Lighting-Example,
// but with a distinct colour palette:
//   • Warm gold diffuse light  (1.0, 0.8, 0.2)
//   • Cool blue scene ambient  (0.05, 0.1, 0.35)
//   • Teal material diffuse    (0.2, 0.85, 0.75)
//   • Deep indigo background   (0x0D0820FF)
//   • Light positioned to the upper-left  (-5, 4, -3)

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
lighting_color_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
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

    dvlb := ctru.DVLB_ParseFile(cast(^u32)sh_buf, u32(sh_size))
    prog: ctru.shaderProgram_s
    ctru.shaderProgramInit(&prog)
    ctru.shaderProgramSetVsh(&prog, dvlb.DVLE)
    c3d.C3D_BindProgram(&prog)

    uLoc_mvp := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "mvp"))
    uLoc_mv  := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "modelView"))

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

    // TexEnv: pass hardware-lit fragment colour through unchanged.
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .FRAGMENT_PRIMARY, .FRAGMENT_PRIMARY, .FRAGMENT_PRIMARY)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Hardware lighting ─────────────────────────────────────────────────────
    lightEnv: c3d.C3D_LightEnv
    light:    c3d.C3D_Light
    lut:      c3d.C3D_LightLut

    c3d.C3D_LightEnvInit(&lightEnv)
    c3d.C3D_LightEnvBind(&lightEnv)

    c3d.LightLut_Phong(&lut, 16.0)
    c3d.C3D_LightEnvLut(&lightEnv, .D0, .LN, false, &lut)

    _ = c3d.C3D_LightInit(&light, &lightEnv)

    // Warm gold diffuse light.
    c3d.C3D_LightDiffuse(&light, 1.0, 0.8, 0.2)
    c3d.C3D_LightAmbient(&light, 0.0, 0.0, 0.0)

    // Upper-left positional light (w=1).
    lightPos := c3d.C3D_FVec{x=-5.0, y=4.0, z=-3.0, w=1.0}
    c3d.C3D_LightPosition(&light, &lightPos)

    // Cool blue scene ambient — keeps shadow faces tinted blue rather than grey.
    c3d.C3D_LightEnvAmbient(&lightEnv, 0.05, 0.1, 0.35)

    // Teal material — faces lit by the gold light blend toward warm teal;
    // faces in shadow show the cool blue ambient tint.
    mtl := c3d.C3D_Material{
        ambient   = {1.0, 1.0, 1.0},
        diffuse   = {0.2, 0.85, 0.75},
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

    ctru.printf("\x1b[1;1HLighting-Color-Example")
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
        // Deep indigo background.
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x0D0820FF, 0)
        c3d.C3D_FrameDrawOn(top)

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
