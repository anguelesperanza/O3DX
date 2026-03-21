package alpha_blend_example

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Demonstrates C3D_AlphaBlend with standard src-alpha / one-minus-src-alpha
// blending.
//
// Four quads are drawn back-to-front (depth test disabled; order matters):
//
//   1. White  background (alpha=1.0) — full screen, drawn first
//   2. Red    quad       (alpha=0.5) — left half
//   3. Blue   quad       (alpha=0.5) — right half, overlaps red in centre
//   4. Green  quad       (alpha=0.5) — centre strip, overlaps both
//
// Expected visible colours:
//   Far left   (white + red blend)                  → pink
//   Far right  (white + blue blend)                 → light blue
//   Centre left  (white + red + green blend)        → yellow-green tint
//   Centre right (white + blue + green blend)       → cyan tint
//   Centre strip where only green overlaps white    → light green
//
// The vertex alpha value flows through the vertex shader (out1 color.w) and
// the TexEnv (PRIMARY_COLOR / REPLACE) into the fragment stage, where
// C3D_AlphaBlend picks it up for the blend equation:
//   out_rgb = src_alpha * src_rgb + (1 - src_alpha) * dst_rgb
//
// Controls:
//   START — exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

vertex_list := [24]Vertex{
    // ── 1. White background (opaque) — drawn first (back) ─────────
    {  20.0,  20.0, 0.5,  1.0, 1.0, 1.0, 1.0 },
    {  20.0, 220.0, 0.5,  1.0, 1.0, 1.0, 1.0 },
    { 380.0, 220.0, 0.5,  1.0, 1.0, 1.0, 1.0 },
    {  20.0,  20.0, 0.5,  1.0, 1.0, 1.0, 1.0 },
    { 380.0, 220.0, 0.5,  1.0, 1.0, 1.0, 1.0 },
    { 380.0,  20.0, 0.5,  1.0, 1.0, 1.0, 1.0 },

    // ── 2. Red quad (50% alpha) — left half ───────────────────────
    {  20.0,  20.0, 0.5,  1.0, 0.0, 0.0, 0.5 },
    {  20.0, 220.0, 0.5,  1.0, 0.0, 0.0, 0.5 },
    { 210.0, 220.0, 0.5,  1.0, 0.0, 0.0, 0.5 },
    {  20.0,  20.0, 0.5,  1.0, 0.0, 0.0, 0.5 },
    { 210.0, 220.0, 0.5,  1.0, 0.0, 0.0, 0.5 },
    { 210.0,  20.0, 0.5,  1.0, 0.0, 0.0, 0.5 },

    // ── 3. Blue quad (50% alpha) — right half ─────────────────────
    { 190.0,  20.0, 0.5,  0.0, 0.0, 1.0, 0.5 },
    { 190.0, 220.0, 0.5,  0.0, 0.0, 1.0, 0.5 },
    { 380.0, 220.0, 0.5,  0.0, 0.0, 1.0, 0.5 },
    { 190.0,  20.0, 0.5,  0.0, 0.0, 1.0, 0.5 },
    { 380.0, 220.0, 0.5,  0.0, 0.0, 1.0, 0.5 },
    { 380.0,  20.0, 0.5,  0.0, 0.0, 1.0, 0.5 },

    // ── 4. Green quad (50% alpha) — centre strip, top layer ───────
    { 155.0,  20.0, 0.5,  0.0, 0.85, 0.0, 0.5 },
    { 155.0, 220.0, 0.5,  0.0, 0.85, 0.0, 0.5 },
    { 245.0, 220.0, 0.5,  0.0, 0.85, 0.0, 0.5 },
    { 155.0,  20.0, 0.5,  0.0, 0.85, 0.0, 0.5 },
    { 245.0, 220.0, 0.5,  0.0, 0.85, 0.0, 0.5 },
    { 245.0,  20.0, 0.5,  0.0, 0.85, 0.0, 0.5 },
}

@(export, link_name = "odin_main")
alpha_blend_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    // ── Init ─────────────────────────────────────────────────────
    ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    // ── Render target ─────────────────────────────────────────────
    top := c3d.C3D_RenderTargetCreate(240, 400,
                                      .RGBA8,
                                      c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top,
                                  ctru.GFX_TOP, ctru.GFX_LEFT,
                                  DISPLAY_TRANSFER_FLAGS)

    // ── Shader ────────────────────────────────────────────────────
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

    uloc_proj := i32(ctru.shaderInstanceGetUniformLocation(
        prog.vertexShader, "projection"))

    // ── Vertex attributes ─────────────────────────────────────────
    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 = xyz
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 4) // v1 = rgba

    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    // ── TexEnv: pass vertex colour and alpha through ───────────────
    // C3D_Both applies REPLACE to both RGB and Alpha channels, so the
    // full RGBA from the vertex reaches the fragment blend stage.
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .PRIMARY_COLOR, .PRIMARY_COLOR, .PRIMARY_COLOR)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    // ── Projection matrix ─────────────────────────────────────────
    projection: c3d.C3D_Mtx
    projection.r[0] = c3d.C3D_FVec{ 1.0, 0.0, -2.0/240.0,  0.0}
    projection.r[1] = c3d.C3D_FVec{ 1.0, 0.0,  0.0, -2.0/400.0}
    projection.r[2] = c3d.C3D_FVec{-1.0, 1.0,  0.0,  0.0}
    projection.r[3] = c3d.C3D_FVec{ 1.0, 0.0,  0.0,  0.0}

    // ── Alpha blend + GPU state ────────────────────────────────────
    // Depth test is disabled: back-to-front draw order handles occlusion.
    // Standard src-alpha / one-minus-src-alpha blend equation:
    //   out_rgb   = src_alpha   * src_rgb   + (1 - src_alpha) * dst_rgb
    //   out_alpha = src_alpha_f * src_alpha + (1 - src_alpha_f) * dst_alpha
    c3d.C3D_DepthTest(false, .ALWAYS, .ALL)
    c3d.C3D_AlphaBlend(.ADD, .ADD,
                       .SRC_ALPHA, .ONE_MINUS_SRC_ALPHA,
                       .SRC_ALPHA, .ONE_MINUS_SRC_ALPHA)
    c3d.C3D_CullFace(.NONE)

    // ── Main loop ─────────────────────────────────────────────────
    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        ctru.printf("\x1b[1;1HAlpha Blend Example")
        ctru.printf("\x1b[2;1HPress START to exit")
        ctru.printf("\x1b[3;1HWhite bg + red(L) + blue(R) + green(C)")

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)

        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_proj, &projection)
        // All 24 vertices in back-to-front order: white → red → blue → green.
        c3d.C3D_DrawArrays(.TRIANGLES, 0, 24)

        c3d.C3D_FrameEnd(0)
    }

    // ── Cleanup ───────────────────────────────────────────────────
    ctru.linearFree(vbo_data)
    ctru.shaderProgramFree(&prog)
    ctru.DVLB_Free(dvlb)
    ctru.free(sh_buf)
    c3d.C3D_Fini()
    ctru.gfxExit()
    ctru.romfsExit()
    return 0
}
