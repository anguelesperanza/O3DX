package proctex_example

import "base:runtime"
import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// ProcTex-Example — Phase 9: C3D_ProcTex* / ProcTexLut_*.
//
// A spinning cube whose faces are painted with a procedurally generated
// rainbow ring pattern.  The pattern comes entirely from the GPU — no
// texture image is loaded.
//
// ProcTex pipeline summary:
//   1. Each vertex carries a UV coordinate in [1, 3].
//   2. GPU clamps/mirrors UV per MIRRORED_REPEAT: effective range [0, 1].
//   3. SQRT2 combiner: scalar = sqrt(U² + V²).  Center of face → 0,
//      corners → sqrt(2).  Creates concentric rings on each face.
//   4. RGBMAP LUT (128-entry): maps scalar → palette index (linear ramp).
//   5. Color LUT (8 entries): RGBA8 rainbow palette (format 0xAABBGGRR).
//   6. Result fed into TEXTURE3 → TexEnv REPLACE → fragment color.
//
// Controls: START — exit.

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

// ─── Geometry ────────────────────────────────────────────────────────────────
//
// UV range [1, 3]: with MIRRORED_REPEAT the fold point is at each integer
// boundary.  UV=1 → effective 0, UV=2 → effective 1→mirrored→0 (center),
// UV=3 → effective 0 again.  So the effective UV at the face centre is (0,0)
// → SQRT2 = 0 → palette index 0, and corners are (±1, ±1) → SQRT2 = √2 ≈
// 1.414 → wraps in palette → periodic ring pattern.

Vertex :: struct {
    x, y, z: f32,
    u, v:    f32,
}

// Quad helper — two CCW triangles.  UV corners [1,1]→[3,3].
// Faces winding: we use CCW with back-face culling disabled.
//
// Each face pair is (BL, BR, TR), (BL, TR, TL) in local face space
// with UV (1,1)=BL, (3,1)=BR, (3,3)=TR, (1,3)=TL.

vertex_list := [36]Vertex{
    // Front face  (z=+1)
    {-1,-1,+1, 1,1}, {+1,-1,+1, 3,1}, {+1,+1,+1, 3,3},
    {-1,-1,+1, 1,1}, {+1,+1,+1, 3,3}, {-1,+1,+1, 1,3},
    // Back face   (z=-1)
    {+1,-1,-1, 1,1}, {-1,-1,-1, 3,1}, {-1,+1,-1, 3,3},
    {+1,-1,-1, 1,1}, {-1,+1,-1, 3,3}, {+1,+1,-1, 1,3},
    // Left face   (x=-1)
    {-1,-1,-1, 1,1}, {-1,-1,+1, 3,1}, {-1,+1,+1, 3,3},
    {-1,-1,-1, 1,1}, {-1,+1,+1, 3,3}, {-1,+1,-1, 1,3},
    // Right face  (x=+1)
    {+1,-1,+1, 1,1}, {+1,-1,-1, 3,1}, {+1,+1,-1, 3,3},
    {+1,-1,+1, 1,1}, {+1,+1,-1, 3,3}, {+1,+1,+1, 1,3},
    // Top face    (y=+1)
    {-1,+1,+1, 1,1}, {+1,+1,+1, 3,1}, {+1,+1,-1, 3,3},
    {-1,+1,+1, 1,1}, {+1,+1,-1, 3,3}, {-1,+1,-1, 1,3},
    // Bottom face (y=-1)
    {-1,-1,-1, 1,1}, {+1,-1,-1, 3,1}, {+1,-1,+1, 3,3},
    {-1,-1,-1, 1,1}, {+1,-1,+1, 3,3}, {-1,-1,+1, 1,3},
}

// ─── Rainbow palette — 8 entries, format 0xAABBGGRR ──────────────────────────
// (A=high byte, R=low byte — opposite of the clear-color 0xRRGGBBAA format)
rainbow_colors := [8]u32{
    0xFF0000FF, // Red     A=FF B=00 G=00 R=FF
    0xFF007FFF, // Orange  A=FF B=00 G=7F R=FF
    0xFF00FFFF, // Yellow  A=FF B=00 G=FF R=FF
    0xFF00FF00, // Green   A=FF B=00 G=FF R=00
    0xFFFFFF00, // Cyan    A=FF B=FF G=FF R=00
    0xFFFF0000, // Blue    A=FF B=FF G=00 R=00
    0xFFFF007F, // Indigo  A=FF B=FF G=00 R=7F
    0xFFFF00FF, // Violet  A=FF B=FF G=00 R=FF
}

@(export, link_name = "odin_main")
proctex_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    context = runtime.default_context()

    romfs_rc := ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)
    ctru.printf("\x1b[5;1HromfsInit rc: 0x%08lX", romfs_rc)

    top := c3d.C3D_RenderTargetCreate(240, 400, .RGBA8, c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top, ctru.GFX_TOP, ctru.GFX_LEFT, DISPLAY_TRANSFER_FLAGS)

    // ── Shader ───────────────────────────────────────────────────────────────
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

    // ── Attribute / buffer info ───────────────────────────────────────────────
    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 = position  (xyz)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 2) // v1 = texcoord  (uv)

    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    // ── Rasterizer state ──────────────────────────────────────────────────────
    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Procedural texture setup ──────────────────────────────────────────────
    //
    // C3D_ProcTexInit(pt, offset, numColors)
    //   offset    — start index within the Color LUT (0-based)
    //   numColors — number of Color LUT entries used
    pt: c3d.C3D_ProcTex
    c3d.C3D_ProcTexInit(&pt, 0, 8)

    // UV wrap: MIRRORED_REPEAT folds [0,1,2,3] → [0,1,0,1] → effective [0,1,0].
    c3d.C3D_ProcTexClamp(&pt, .MIRRORED_REPEAT, .MIRRORED_REPEAT)

    // Combiner: SQRT2 = sqrt(U²+V²).  Produces concentric rings on each face.
    // separate=false → same function for RGB and alpha channels.
    c3d.C3D_ProcTexCombiner(&pt, false, .SQRT2, .SQRT2)

    // No noise modulation.
    c3d.C3D_ProcTexNoiseEnable(&pt, false)

    // No row/column offset shifting.
    c3d.C3D_ProcTexShift(&pt, .NONE, .NONE)

    // Linear interpolation between adjacent Color LUT entries.
    c3d.C3D_ProcTexFilter(&pt, .LINEAR)

    // Bind to texcoord slot 0 (the slot that receives our UV attribute).
    c3d.C3D_ProcTexBind(0, &pt)

    // ── RGBMAP LUT — linear ramp: scalar → palette index ─────────────────────
    // 129 floats: entry i = i/128.0 (indices 0–128, inclusive).
    // ProcTexLut_FromArray packs pairs into 12-bit value + 12-bit diff.
    rgbmap_lut: c3d.C3D_ProcTexLut
    rgbmap_data: [129]f32
    for i in 0..=128 {
        rgbmap_data[i] = f32(i) / 128.0
    }
    c3d.ProcTexLut_FromArray(&rgbmap_lut, &rgbmap_data[0])
    c3d.C3D_ProcTexLutBind(.RGBMAP, &rgbmap_lut)

    // ── Noise LUT — smoothstep curve (bound even when noise is disabled) ───────
    noise_lut: c3d.C3D_ProcTexLut
    noise_data: [129]f32
    for i in 0..=128 {
        x := f32(i) / 128.0
        noise_data[i] = x * x * (3.0 - 2.0 * x) // x²(3-2x)
    }
    c3d.ProcTexLut_FromArray(&noise_lut, &noise_data[0])
    c3d.C3D_ProcTexLutBind(.NOISE, &noise_lut)

    // ── Color LUT — 8-entry rainbow palette ───────────────────────────────────
    color_lut: c3d.C3D_ProcTexColorLut
    c3d.ProcTexColorLut_Write(&color_lut, &rainbow_colors[0], 0, 8)
    c3d.C3D_ProcTexColorLutBind(&color_lut)

    // ── TexEnv — output TEXTURE3 (ProcTex result) directly ───────────────────
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .TEXTURE3, .TEXTURE3, .TEXTURE3)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    // ── Projection matrix ──────────────────────────────────────────────────────
    proj: c3d.C3D_Mtx
    c3d.Mtx_PerspTilt_Bridge(&proj,
                              c3d.C3D_AngleFromDegrees(60.0),
                              c3d.C3D_AspectRatioTop,
                              0.5, 25.0,
                              false)

    ctru.printf("\x1b[1;1HProcTex-Example (Phase 9)")
    ctru.printf("\x1b[2;1HPress START to exit")

    angle: f32 = 0.0

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        angle += 0.02
        if angle >= c3d.C3D_TAU do angle -= c3d.C3D_TAU

        // Build MVP
        model: c3d.C3D_Mtx
        c3d.Mtx_Identity(&model)
        c3d.Mtx_Translate(&model, 0.0, 0.0, -5.0, true)
        c3d.Mtx_RotateY(&model, angle, true)
        c3d.Mtx_RotateX(&model, angle * 0.5, true)

        mvp: c3d.C3D_Mtx
        c3d.Mtx_Multiply(&mvp, &proj, &model)

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x000000FF, 0)
        c3d.C3D_FrameDrawOn(top)

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
