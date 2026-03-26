package fog_example

import "base:runtime"
import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Fog-Example — Phase 9: C3D_FogGasMode / FogLut_Exp.
//
// The cube slides toward and away from the camera so the fog fading is
// clearly visible.  The background colour matches the fog colour so
// objects at maximum fog depth blend seamlessly into the background.
//
// Fog setup (called once before the render loop):
//   FogLut_Exp   — fills the 128-entry LUT with an exponential fog curve
//   C3D_FogGasMode(.FOG, .PLAIN_DENSITY, false) — enable standard depth fog
//   C3D_FogColor — RGB colour the fog converges to (must match clear colour)
//   C3D_FogLutBind — makes the LUT active
//
// Controls: START — exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

// Fog colour used for both C3D_FogColor and the render-target clear colour.
// 24-bit RGB for the GPU register; RGBA8 (alpha=FF) for the clear call.
FOG_RGB  :: u32(0x708090)       // slate grey-blue
FOG_RGBA :: u32(0x708090FF)     // same + full alpha for RenderTargetClear

Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

vertex_list := [36]Vertex{
    // Front (z=+1) — Red
    {-1,-1,+1, 1,0,0,1}, {+1,-1,+1, 1,0,0,1}, {+1,+1,+1, 1,0,0,1},
    {-1,-1,+1, 1,0,0,1}, {+1,+1,+1, 1,0,0,1}, {-1,+1,+1, 1,0,0,1},
    // Back (z=-1) — Green
    {+1,-1,-1, 0,1,0,1}, {-1,-1,-1, 0,1,0,1}, {-1,+1,-1, 0,1,0,1},
    {+1,-1,-1, 0,1,0,1}, {-1,+1,-1, 0,1,0,1}, {+1,+1,-1, 0,1,0,1},
    // Left (x=-1) — Blue
    {-1,-1,-1, 0,0,1,1}, {-1,-1,+1, 0,0,1,1}, {-1,+1,+1, 0,0,1,1},
    {-1,-1,-1, 0,0,1,1}, {-1,+1,+1, 0,0,1,1}, {-1,+1,-1, 0,0,1,1},
    // Right (x=+1) — Yellow
    {+1,-1,+1, 1,1,0,1}, {+1,-1,-1, 1,1,0,1}, {+1,+1,-1, 1,1,0,1},
    {+1,-1,+1, 1,1,0,1}, {+1,+1,-1, 1,1,0,1}, {+1,+1,+1, 1,1,0,1},
    // Top (y=+1) — Cyan
    {-1,+1,+1, 0,1,1,1}, {+1,+1,+1, 0,1,1,1}, {+1,+1,-1, 0,1,1,1},
    {-1,+1,+1, 0,1,1,1}, {+1,+1,-1, 0,1,1,1}, {-1,+1,-1, 0,1,1,1},
    // Bottom (y=-1) — Magenta
    {-1,-1,-1, 1,0,1,1}, {+1,-1,-1, 1,0,1,1}, {+1,-1,+1, 1,0,1,1},
    {-1,-1,-1, 1,0,1,1}, {+1,-1,+1, 1,0,1,1}, {-1,-1,+1, 1,0,1,1},
}

@(export, link_name = "odin_main")
fog_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
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

    uloc_mvp := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "mvp"))

    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 = position
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 4) // v1 = colour

    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .PRIMARY_COLOR, .PRIMARY_COLOR, .PRIMARY_COLOR)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Fog LUT (CPU-side fill only — no GPU writes yet) ──────────────────
    fogLut: c3d.C3D_FogLut

    // FogLut_Exp(lut, density, gradient, near, far)
    //   density  — controls how quickly fog builds with distance
    //   gradient — curve shape (1.0 = linear-exp, 2.0 = squared-exp)
    //   near/far — MUST match the projection clip planes (NOT an output clamp).
    //              Internally, FogLut_Exp uses FogLut_CalcZ(i/128, near, far)
    //              to convert each LUT index to an eye-space distance.
    //              Passing near=0.0 causes 0/0 and fills every entry with 1.0
    //              (= no fog), which is why the old code had zero effect.
    //
    // Depth range note:
    //   With C3D_DepthMap(true, -1.0, 0.0) the PICA200 stores
    //   depth ≈ near_clip / camera_distance.  The 128-entry fog LUT is
    //   indexed by this depth value, so the cube's travel range must map
    //   across a useful number of entries.  With near=0.01 the cube at
    //   z=-3 … -15 all collapsed to entry 0 (no variation).  near=0.5
    //   spreads them across entries ~2–19, giving clear fog graduation.
    c3d.FogLut_Exp(&fogLut, 0.12, 2.0, 0.5, 25.0)

    // NOTE: C3D_FogGasMode / C3D_FogColor / C3D_FogLutBind must be called
    // INSIDE the render loop (after C3D_FrameDrawOn).  Unlike DepthTest /
    // CullFace which use dirty flags, C3D_FogLutBind writes the LUT data
    // directly to the GPU command buffer.  C3D_FrameBegin resets that buffer,
    // so any LUT data written before the loop is discarded before the GPU
    // ever sees it.

    proj: c3d.C3D_Mtx
    // near=0.5, far=25.0 — matches FogLut_Exp above.
    // A near clip plane of 0.5 puts the cube's z=-3…-15 travel range
    // across LUT entries ~2–19, producing visible fog graduation.
    c3d.Mtx_PerspTilt_Bridge(&proj,
                              c3d.C3D_AngleFromDegrees(60.0),
                              c3d.C3D_AspectRatioTop,
                              0.5, 25.0,
                              false)

    ctru.printf("\x1b[1;1HFog-Example (Phase 9)")
    ctru.printf("\x1b[2;1HPress START to exit")

    angle: f32 = 0.0
    zPos:  f32 = -3.0
    zDir:  f32 = -1.0  // start moving away from camera

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        angle += 0.02
        if angle >= c3d.C3D_TAU do angle -= c3d.C3D_TAU

        // Slide cube toward/away from camera to show fog fading in and out.
        zPos += zDir * 0.05
        if zPos <= -15.0 { zDir =  1.0 }
        if zPos >= -3.0  { zDir = -1.0 }

        ctru.printf("\x1b[3;1Hz = %6.2f    ", zPos)

        model: c3d.C3D_Mtx
        c3d.Mtx_Identity(&model)
        c3d.Mtx_Translate(&model, 0.0, 0.0, zPos, true)
        c3d.Mtx_RotateY(&model, angle, true)

        mvp: c3d.C3D_Mtx
        c3d.Mtx_Multiply(&mvp, &proj, &model)

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, FOG_RGBA, 0)
        c3d.C3D_FrameDrawOn(top)

        // Fog state submitted here so it lands in the active command buffer.
        c3d.C3D_FogGasMode(.FOG, .PLAIN_DENSITY, false)
        c3d.C3D_FogColor(FOG_RGB)
        c3d.C3D_FogLutBind(&fogLut)

        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_mvp, &mvp)
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
