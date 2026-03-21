package triangle_example

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Demonstrates the full Citro3D core pipeline:
//   PICA200 vertex shader  →  linearAlloc VBO  →  AttrInfo/BufInfo
//   →  Mtx_OrthoTilt projection  →  C3D_DrawArrays
//
// The vertex shader (vshader.v.pica) is compiled by picasso during the build
// into romfs/vshader.shbin and loaded at runtime from romfs.
//
// Controls:
//   START — exit

// DISPLAY_TRANSFER_FLAGS: GX_TRANSFER_OUT_FORMAT(GX_TRANSFER_FMT_RGB8) = 1 << 12.
// Tells the display-transfer hardware to interpret the RGBA8 framebuffer as
// RGB8 output to the LCD.
DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

// Vertex layout: position (x, y, z) followed by colour (r, g, b, a).
// Both components are registered with AttrInfo_AddLoader (3 floats + 4 floats).
Vertex :: struct {
    x, y, z:    f32,
    r, g, b, a: f32,
}

// Three vertices forming a coloured triangle in 400×240 screen space.
// Coordinates are in the same space that Mtx_OrthoTilt maps to the screen:
//   x: 0 (left) → 400 (right)
//   y: 0 (top)  → 240 (bottom)
vertex_list := [3]Vertex{
    { 200.0,  20.0, 0.5,  1.0, 0.0, 0.0, 1.0 }, // top-centre   — red
    {  20.0, 220.0, 0.5,  0.0, 1.0, 0.0, 1.0 }, // bottom-left  — green
    { 380.0, 220.0, 0.5,  0.0, 0.0, 1.0, 1.0 }, // bottom-right — blue
}

@(export, link_name = "odin_main")
triangle_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    // ── Init ─────────────────────────────────────────────────────
    romfs_rc := ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)
    ctru.printf("\x1b[5;1HromfsInit rc: 0x%08lX", romfs_rc)

    // ── Render target ─────────────────────────────────────────────
    // The GPU framebuffer is stored in portrait orientation (240 × 400).
    // C3D_RenderTargetSetOutput tells the hardware to display it on
    // the top screen in landscape mode.
    top := c3d.C3D_RenderTargetCreate(240, 400,
                                      .RGBA8,
                                      c3d.C3D_DEPTHTYPE_DEPTH24_STENCIL8)
    c3d.C3D_RenderTargetSetOutput(top,
                                  ctru.GFX_TOP, ctru.GFX_LEFT,
                                  DISPLAY_TRANSFER_FLAGS)

    // ── Shader loading ────────────────────────────────────────────
    // Open the pre-compiled shader binary from romfs.
    sf := ctru.fopen("romfs:/vshader.shbin", "rb")
    ctru.fseek(sf, 0, ctru.SEEK_END)
    sh_size := ctru.ftell(sf)
    ctru.fseek(sf, 0, ctru.SEEK_SET)
    sh_buf := ctru.malloc(uint(sh_size))
    ctru.fread(sh_buf, 1, uint(sh_size), sf)
    ctru.fclose(sf)
    ctru.printf("\x1b[3;1Hsh_size: %d    ", sh_size) // expect 252

    // Parse the binary.  sh_buf must stay valid while dvlb is in use.
    dvlb := ctru.DVLB_ParseFile(cast(^u32)sh_buf, u32(sh_size))

    // Create, link, and bind the shader program.
    prog: ctru.shaderProgram_s
    ctru.shaderProgramInit(&prog)
    ctru.shaderProgramSetVsh(&prog, dvlb.DVLE) // dvlb.DVLE points to DVLE[0]
    c3d.C3D_BindProgram(&prog)

    // Look up the projection uniform register index.
    uloc_proj := i32(ctru.shaderInstanceGetUniformLocation(
        prog.vertexShader, "projection"))
    ctru.printf("\x1b[6;1Huloc_proj: %d    ", uloc_proj)

    // ── Vertex attributes ─────────────────────────────────────────
    // Register two loaders: position (3 floats → v0) and colour (4 floats → v1).
    // permutation 0x10: attribute 0 → register 0 (v0), attribute 1 → register 1 (v1).
    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 = position (xyz)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 4) // v1 = colour   (rgba)

    // ── VBO in linear memory ──────────────────────────────────────
    // The GPU DMA engine requires vertex data in the 3DS linear heap.
    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    // ── TexEnv: pass vertex colour through to output ──────────────────────────
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .PRIMARY_COLOR, .PRIMARY_COLOR, .PRIMARY_COLOR)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    // ── Projection matrix ─────────────────────────────────────────
    // Mtx_OrthoTilt bridge writes nothing at runtime (verified: matrix stays
    // all-zero after calling it, yet a direct Odin write works fine).
    // Work-around: set the matrix manually using values derived by tracing
    // the Mtx_OrthoTilt disassembly for (left=0, right=400, bottom=0,
    // top=240, near=0, far=1, leftHanded=true).
    //
    // C3D_FVec memory layout: { w, z, y, x } at offsets { 0, 4, 8, 12 }.
    // Odin declares the fields as { x, y, z, w } at the same offsets, so
    //   Odin .x  =  C .w  (offset  0)
    //   Odin .y  =  C .z  (offset  4)
    //   Odin .z  =  C .y  (offset  8)
    //   Odin .w  =  C .x  (offset 12)
    // Struct literal order is positional: {x, y, z, w}.
    projection: c3d.C3D_Mtx
    // Row 0 – screen-Y → GPU-X:  C(w,z,y,x) = ( 1,  0, -2/240,  0)
    projection.r[0] = c3d.C3D_FVec{ 1.0, 0.0, -2.0/240.0, 0.0}
    // Row 1 – screen-X → GPU-Y:  C(w,z,y,x) = ( 1,  0,  0, −2/400)
    projection.r[1] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, -2.0/400.0}
    // Row 2 – Z transform:        C(w,z,y,x) = (−1,  1,  0,  0)
    projection.r[2] = c3d.C3D_FVec{-1.0, 1.0, 0.0, 0.0}
    // Row 3 – homogeneous W:      C(w,z,y,x) = ( 1,  0,  0,  0)
    projection.r[3] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, 0.0}
    r00 := transmute(u32)(projection.r[0].x)
    r01 := transmute(u32)(projection.r[0].y)
    ctru.printf("\x1b[7;1Hm[0]=%08X %08X", r00, r01)

    // ── Explicit GPU state ────────────────────────────────────────
    // Ensure color + depth writes are enabled (default GPU state
    // after C3D_Init may have write mask = 0).
    c3d.C3D_DepthTest(false, .ALWAYS, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Main loop ─────────────────────────────────────────────────
    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        ctru.printf("\x1b[1;1HTriangle Example")
        ctru.printf("\x1b[2;1HPress START to exit")
        ctru.printf("\x1b[4;1HCitro3D phase 5 demo")

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)

        // Clear: dark-blue background, reset depth to far plane.
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        // Upload the projection matrix and draw the triangle.
        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_proj, &projection)

        
        c3d.C3D_DrawArrays(.TRIANGLES, 0, 3)

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
