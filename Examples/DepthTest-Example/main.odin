package depth_test_example

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Demonstrates C3D_DepthTest with the PICA200 reverse-Z setup.
//
// Two quads are drawn in the WRONG order to prove that depth test is the
// thing determining occlusion — not draw order:
//
//   Draw call 1: GREEN quad at z=0.2  (NEAR — closer to camera)
//   Draw call 2: RED   quad at z=0.8  (FAR  — farther from camera)
//
// Without depth test the red quad (drawn second) would cover the green one.
// With depth test enabled the green quad stays on top because its geometry
// is physically nearer, regardless of when it was submitted.
//
// PICA200 depth conventions:
//   Our projection maps vertex-z ∈ [0, 1] to z_clip ∈ [-1, 0].
//   C3D_DepthMap(true, -1.0, 0.0) converts z_clip to a depth buffer value:
//     depth_value = -z_clip  →  near (z=0) → depth 1,  far (z=1) → depth 0
//   C3D_DepthTest with GPU_GEQUAL means "pass if new_depth >= stored_depth".
//   Near geometry (high depth_value) beats far geometry (low depth_value). ✓
//   The depth buffer is cleared to 0 (= far) at the start of each frame.
//
// Controls:
//   START — exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

// Green quad (z=0.2, NEAR) drawn first — centred on screen.
// Red quad   (z=0.8, FAR)  drawn second — larger, fully covering green.
// Depth test keeps green visible despite being submitted first.
vertex_list := [12]Vertex{
    // ── Green quad (z=0.2, near) — vertices 0–5 ──────────────────
    { 125.0,  50.0, 0.2,  0.0, 0.75, 0.0, 1.0 },
    { 125.0, 190.0, 0.2,  0.0, 0.75, 0.0, 1.0 },
    { 275.0, 190.0, 0.2,  0.0, 0.75, 0.0, 1.0 },
    { 125.0,  50.0, 0.2,  0.0, 0.75, 0.0, 1.0 },
    { 275.0, 190.0, 0.2,  0.0, 0.75, 0.0, 1.0 },
    { 275.0,  50.0, 0.2,  0.0, 0.75, 0.0, 1.0 },

    // ── Red quad (z=0.8, far) — vertices 6–11, covers green on screen ──
    {  60.0,  20.0, 0.8,  0.75, 0.0, 0.0, 1.0 },
    {  60.0, 220.0, 0.8,  0.75, 0.0, 0.0, 1.0 },
    { 340.0, 220.0, 0.8,  0.75, 0.0, 0.0, 1.0 },
    {  60.0,  20.0, 0.8,  0.75, 0.0, 0.0, 1.0 },
    { 340.0, 220.0, 0.8,  0.75, 0.0, 0.0, 1.0 },
    { 340.0,  20.0, 0.8,  0.75, 0.0, 0.0, 1.0 },
}

@(export, link_name = "odin_main")
depth_test_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

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

    // ── TexEnv: pass vertex colour (including alpha) through ───────
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

    // ── Depth test setup ──────────────────────────────────────────
    // C3D_DepthMap(zBuffer=true, zScale=-1.0, zOffset=0.0):
    //   Maps z_clip ∈ [-1, 0] to depth_value ∈ [1, 0].
    //   Near geometry (small vertex-z) gets a HIGH depth_value.
    //   Far  geometry (large vertex-z) gets a LOW  depth_value.
    // GPU_GEQUAL: pass if new_depth >= stored_depth.
    //   Near (high depth) beats far (low depth). ✓
    // Depth buffer cleared to 0 (= far) each frame via C3D_CLEAR_ALL.
    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Main loop ─────────────────────────────────────────────────
    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        ctru.printf("\x1b[1;1HDepth Test Example")
        ctru.printf("\x1b[2;1HPress START to exit")
        ctru.printf("\x1b[3;1HDraw order: green(near) THEN red(far)")
        ctru.printf("\x1b[4;1HDepth test keeps green on top.")

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)

        // clearDepth=0 resets the depth buffer to 0 (= far plane).
        // Every pixel starts with the lowest possible depth so the first
        // geometry drawn always passes the GEQUAL test.
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_proj, &projection)
        c3d.C3D_DrawArrays(.TRIANGLES, 0, 12)

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
