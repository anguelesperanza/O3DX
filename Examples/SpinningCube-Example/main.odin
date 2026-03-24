package spinning_cube_example

import "base:runtime"
import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// SpinningCube-Example — Phase 8 demo.
// Exercises the Citro3D math library (Phase 8):
//   • Mtx_PerspTilt  — native Odin perspective projection (RH convention)
//   • Mtx_Identity   — Odin-native identity matrix
//   • Mtx_RotateY    — Odin-native Y-axis rotation (incremented each frame)
//   • Mtx_Translate  — Odin-native translation
//   • Mtx_Multiply   — Odin-native matrix multiply
//
// Uses right-handed (RH) convention matching citro3d textured_cube example:
//   camera at origin looking −Z, cube placed at z=−2.
//
// The cube has 6 colour-coded faces (red, green, blue, yellow, cyan, magenta).
// It rotates continuously around the Y axis.
//
// Controls:
//   START — exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

// Vertex: position (3 floats) + colour (4 floats) = 28 bytes.
Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

// ── Cube geometry ─────────────────────────────────────────────────────────
// 36 vertices (6 faces × 2 triangles × 3 vertices).
// Object space: –1 to +1 on each axis.
// Each face has a distinct colour so rotation is clearly visible.
// Winding order is CCW when viewed from outside (culling disabled below).
vertex_list := [36]Vertex{
    // Front face (z=+1) — Red
    {-1, -1, +1,  1,0,0,1},  {+1, -1, +1,  1,0,0,1},  {+1, +1, +1,  1,0,0,1},
    {-1, -1, +1,  1,0,0,1},  {+1, +1, +1,  1,0,0,1},  {-1, +1, +1,  1,0,0,1},

    // Back face (z=–1) — Green
    {+1, -1, -1,  0,1,0,1},  {-1, -1, -1,  0,1,0,1},  {-1, +1, -1,  0,1,0,1},
    {+1, -1, -1,  0,1,0,1},  {-1, +1, -1,  0,1,0,1},  {+1, +1, -1,  0,1,0,1},

    // Left face (x=–1) — Blue
    {-1, -1, -1,  0,0,1,1},  {-1, -1, +1,  0,0,1,1},  {-1, +1, +1,  0,0,1,1},
    {-1, -1, -1,  0,0,1,1},  {-1, +1, +1,  0,0,1,1},  {-1, +1, -1,  0,0,1,1},

    // Right face (x=+1) — Yellow
    {+1, -1, +1,  1,1,0,1},  {+1, -1, -1,  1,1,0,1},  {+1, +1, -1,  1,1,0,1},
    {+1, -1, +1,  1,1,0,1},  {+1, +1, -1,  1,1,0,1},  {+1, +1, +1,  1,1,0,1},

    // Top face (y=+1) — Cyan
    {-1, +1, +1,  0,1,1,1},  {+1, +1, +1,  0,1,1,1},  {+1, +1, -1,  0,1,1,1},
    {-1, +1, +1,  0,1,1,1},  {+1, +1, -1,  0,1,1,1},  {-1, +1, -1,  0,1,1,1},

    // Bottom face (y=–1) — Magenta
    {-1, -1, -1,  1,0,1,1},  {+1, -1, -1,  1,0,1,1},  {+1, -1, +1,  1,0,1,1},
    {-1, -1, -1,  1,0,1,1},  {+1, -1, +1,  1,0,1,1},  {-1, -1, +1,  1,0,1,1},
}

@(export, link_name = "odin_main")
cube_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    // Required so Odin-native procs (math helpers, etc.) can be called
    // from within this "c" calling-convention entry point.
    context = runtime.default_context()

    // ── Init ─────────────────────────────────────────────────────────────
    romfs_rc := ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)
    ctru.printf("\x1b[5;1HromfsInit rc: 0x%08lX", romfs_rc)

    // ── Render target ─────────────────────────────────────────────────────
    top := c3d.C3D_RenderTargetCreate(240, 400, .RGBA8, c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top, ctru.GFX_TOP, ctru.GFX_LEFT, DISPLAY_TRANSFER_FLAGS)

    // ── Shader ───────────────────────────────────────────────────────────
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

    uloc_mvp := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "mvp"))
    ctru.printf("uloc_mvp = %d\n", uloc_mvp)
    ctru.printf("\x1b[6;1Huloc_mvp: %d    ", uloc_mvp)

    // ── Vertex attributes ─────────────────────────────────────────────────
    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 = position (xyz)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 4) // v1 = colour   (rgba)

    // ── VBO ───────────────────────────────────────────────────────────────
    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    // ── TexEnv: pass vertex colour through ───────────────────────────────
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .PRIMARY_COLOR, .PRIMARY_COLOR, .PRIMARY_COLOR)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    // ── GPU state ─────────────────────────────────────────────────────────
    // Depth test: PICA200 reverse-Z (zScale=-1, zOffset=0), GEQUAL, clear to 0.
    c3d.C3D_DepthMap(true, -1.0, 0.0)
    c3d.C3D_DepthTest(true, .GEQUAL, .ALL)
    // Culling disabled — winding may need adjustment for your scene.
    c3d.C3D_CullFace(.NONE)

    // ── Projection matrix (set once) ──────────────────────────────────────
    // Mtx_PerspTilt: perspective with 90° tilt for the portrait framebuffer.
    //   fovy = 60°, aspect = 400/240, near = 0.01, far = 100, right-handed.
    // RH convention: camera at origin looking −Z; cube placed at z=−2.
    // Matches citro3d textured_cube example (isLeftHanded=false, z=−2).
    proj: c3d.C3D_Mtx
    // Use citro3d's own Mtx_PerspTilt via the C bridge (definitive reference).
    c3d.Mtx_PerspTilt_Bridge(&proj,
                              c3d.C3D_AngleFromDegrees(60.0),
                              c3d.C3D_AspectRatioTop,
                              0.01, 100.0,
                              false)

    // ── Status on bottom screen ───────────────────────────────────────────
    ctru.printf("\x1b[1;1HSpinningCube - Phase 8 (RH)")
    ctru.printf("\x1b[2;1HPress START to exit")
    ctru.printf("\x1b[4;1HCitro3D math library demo")

    // ── Main loop ─────────────────────────────────────────────────────────
    angle: f32 = 0.0

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        // Advance rotation angle (~1.1 degrees per frame at 60 FPS).
        angle += 0.02
        if angle >= c3d.C3D_TAU do angle -= c3d.C3D_TAU

        // ── Build model matrix ─────────────────────────────────────────────
        // RH convention: camera looks −Z, cube at z=−2.
        // Build model = Translate(0,0,−2) × RotateY(angle) by applying right-side:
        //   1. Start with identity.
        //   2. Translate 2 units along −Z  (model = I × T = T).
        //   3. Rotate around Y             (model = T × Ry).
        // Result: for vertex v, world_pos = T × Ry × v
        //   → first rotate in place, then translate to z=−2 (in front of camera).
        model: c3d.C3D_Mtx

        c3d.Mtx_Identity(&model)
        c3d.Mtx_Translate(&model, 0.0, 0.0, -2.0, true)
        c3d.Mtx_RotateY(&model, angle, true)
        
        // ── Compute MVP = projection × model ──────────────────────────────
        mvp: c3d.C3D_Mtx
        c3d.Mtx_Multiply(&mvp, &proj, &model)

        // ── Render ────────────────────────────────────────────────────────
        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)

        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_mvp, &mvp)
        c3d.C3D_DrawArrays(.TRIANGLES, 0, 36)

        c3d.C3D_FrameEnd(0)
    }

    // ── Cleanup ───────────────────────────────────────────────────────────
    ctru.linearFree(vbo_data)
    ctru.shaderProgramFree(&prog)
    ctru.DVLB_Free(dvlb)
    ctru.free(sh_buf)
    c3d.C3D_Fini()
    ctru.gfxExit()
    ctru.romfsExit()
    return 0
}
