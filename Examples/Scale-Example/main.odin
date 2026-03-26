package scale_example

import "base:runtime"
import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Scale-Example — Mtx_Scale showcase.
//
// Three identical cubes are drawn side by side, each translated to a
// different X position and scaled to a different size:
//
//   Left   x=-3  scale=0.5   (half size)
//   Centre x= 0  scale=1.0   (normal)
//   Right  x=+3  scale=1.5   (one-and-a-half)
//
// All three spin at the same angular rate.  Because the scale is applied
// AFTER the translation (out = Translate * Scale), the old broken
// implementation would have caused the scaled cubes to orbit the camera
// origin rather than staying in place.  This example confirms the fix:
// each cube stays anchored to its translation and simply changes size.
//
// Controls: START — exit.

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

// One shared cube mesh — 6 faces × 2 triangles × 3 verts = 36 vertices.
// Each face has a distinct colour so rotation is clearly visible.
vertex_list := [36]Vertex{
    // Front  (z=+1) — Red
    {-1,-1,+1, 1,0,0,1}, {+1,-1,+1, 1,0,0,1}, {+1,+1,+1, 1,0,0,1},
    {-1,-1,+1, 1,0,0,1}, {+1,+1,+1, 1,0,0,1}, {-1,+1,+1, 1,0,0,1},
    // Back   (z=-1) — Green
    {+1,-1,-1, 0,1,0,1}, {-1,-1,-1, 0,1,0,1}, {-1,+1,-1, 0,1,0,1},
    {+1,-1,-1, 0,1,0,1}, {-1,+1,-1, 0,1,0,1}, {+1,+1,-1, 0,1,0,1},
    // Left   (x=-1) — Blue
    {-1,-1,-1, 0,0,1,1}, {-1,-1,+1, 0,0,1,1}, {-1,+1,+1, 0,0,1,1},
    {-1,-1,-1, 0,0,1,1}, {-1,+1,+1, 0,0,1,1}, {-1,+1,-1, 0,0,1,1},
    // Right  (x=+1) — Yellow
    {+1,-1,+1, 1,1,0,1}, {+1,-1,-1, 1,1,0,1}, {+1,+1,-1, 1,1,0,1},
    {+1,-1,+1, 1,1,0,1}, {+1,+1,-1, 1,1,0,1}, {+1,+1,+1, 1,1,0,1},
    // Top    (y=+1) — Cyan
    {-1,+1,+1, 0,1,1,1}, {+1,+1,+1, 0,1,1,1}, {+1,+1,-1, 0,1,1,1},
    {-1,+1,+1, 0,1,1,1}, {+1,+1,-1, 0,1,1,1}, {-1,+1,-1, 0,1,1,1},
    // Bottom (y=-1) — Magenta
    {-1,-1,-1, 1,0,1,1}, {+1,-1,-1, 1,0,1,1}, {+1,-1,+1, 1,0,1,1},
    {-1,-1,-1, 1,0,1,1}, {+1,-1,+1, 1,0,1,1}, {-1,-1,+1, 1,0,1,1},
}

// draw_cube — build a model matrix for one cube and issue the draw call.
// tx: X translation, scale: uniform scale factor.
@(private)
draw_cube :: proc "contextless" (
    proj:     ^c3d.C3D_Mtx,
    uloc_mvp: i32,
    tx, scale, angle: f32,
) {
    model: c3d.C3D_Mtx
    c3d.Mtx_Identity(&model)
    c3d.Mtx_Translate(&model, tx, 0.0, -8.0, true)
    c3d.Mtx_RotateY(&model, angle, true)
    c3d.Mtx_RotateX(&model, angle * 0.5, true)
    c3d.Mtx_Scale(&model, scale, scale, scale)

    mvp: c3d.C3D_Mtx
    c3d.Mtx_Multiply(&mvp, proj, &model)

    c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_mvp, &mvp)
    c3d.C3D_DrawArrays(.TRIANGLES, 0, 36)
}

@(export, link_name = "odin_main")
scale_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    context = runtime.default_context()

    romfs_rc := ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)
    ctru.printf("\x1b[5;1HromfsInit rc: 0x%08lX", romfs_rc)

    top := c3d.C3D_RenderTargetCreate(240, 400, .RGBA8, c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top, ctru.GFX_TOP, ctru.GFX_LEFT, DISPLAY_TRANSFER_FLAGS)

    // ── Shader ────────────────────────────────────────────────────────────────
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

    // ── Vertex attributes ─────────────────────────────────────────────────────
    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 = position (xyz)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 4) // v1 = colour   (rgba)

    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    // ── Rasterizer state ──────────────────────────────────────────────────────
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .PRIMARY_COLOR, .PRIMARY_COLOR, .PRIMARY_COLOR)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Projection ────────────────────────────────────────────────────────────
    proj: c3d.C3D_Mtx
    c3d.Mtx_PerspTilt_Bridge(&proj,
                              c3d.C3D_AngleFromDegrees(60.0),
                              c3d.C3D_AspectRatioTop,
                              0.5, 25.0,
                              false)

    ctru.printf("\x1b[1;1HScale-Example")
    ctru.printf("\x1b[2;1HLeft=0.5x  Centre=1.0x  Right=1.5x")
    ctru.printf("\x1b[3;1HPress START to exit")

    angle: f32 = 0.0

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        angle += 0.02
        if angle >= c3d.C3D_TAU do angle -= c3d.C3D_TAU

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        // Three cubes: translate to different X positions, then scale.
        // The bug would have caused the translated cubes to orbit the origin
        // after scaling — confirmed fixed when all three stay in place.
        draw_cube(&proj, uloc_mvp, -3.0, 0.5,  angle)   // small
        draw_cube(&proj, uloc_mvp,  0.0, 1.0,  angle)   // normal
        draw_cube(&proj, uloc_mvp, +3.0, 1.5,  angle)   // large

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
