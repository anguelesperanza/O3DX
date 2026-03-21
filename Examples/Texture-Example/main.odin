package texture_example

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Demonstrates the Citro3D texture pipeline:
//   C3D_TexInit  →  write Morton-tiled pixels directly into tex.data
//   →  C3D_TexFlush  →  C3D_TexSetFilter / C3D_TexSetWrap
//   →  C3D_TexBind  →  TexEnv TEXTURE0  →  C3D_DrawArrays
//
// The texture is generated procedurally: a 64×64 RGBA8 image split into four
// colour quadrants so UV mapping errors are immediately obvious.
//
// Pixel data is written in PICA200 Morton (Z-curve tiled) order, which is the
// format the GPU requires.  See swizzle_rgba8 in tools/png2t3x.odin for the
// same algorithm used to convert external images.
//
// Controls:
//   START — exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

// Vertex layout: position (xyz) then texture coordinate (uv).
Vertex :: struct {
    x, y, z: f32,
    u, v:    f32,
}

// Textured quad centred on the 400×240 screen (100,20)–(300,220).
// Six vertices: two CCW triangles sharing a diagonal.
// UV V=0 is the bottom of the texture, V=1 is the top (3DS / OpenGL convention).
vertex_list := [6]Vertex{
    // Triangle 1
    { 100.0,  20.0, 0.5,  0.0, 1.0 }, // top-left
    { 100.0, 220.0, 0.5,  0.0, 0.0 }, // bottom-left
    { 300.0, 220.0, 0.5,  1.0, 0.0 }, // bottom-right
    // Triangle 2
    { 100.0,  20.0, 0.5,  0.0, 1.0 }, // top-left
    { 300.0, 220.0, 0.5,  1.0, 0.0 }, // bottom-right
    { 300.0,  20.0, 0.5,  1.0, 1.0 }, // top-right
}

@(export, link_name = "odin_main")
texture_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

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

    // ── Shader loading ────────────────────────────────────────────
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
    // v0 = xyz position (3 floats), v1 = uv texcoord (2 floats).
    // permutation 0x10: attr 0 → reg v0, attr 1 → reg v1.
    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3)
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 2)

    vbo_size := uint(size_of(vertex_list))
    vbo_data := ctru.linearAlloc(vbo_size)
    ctru.memcpy(vbo_data, &vertex_list, vbo_size)

    buf_info := c3d.C3D_GetBufInfo()
    c3d.BufInfo_Init(buf_info)
    c3d.BufInfo_Add(buf_info, vbo_data, size_of(Vertex), 2, 0x10)

    // ── Procedural 64×64 checkerboard texture ─────────────────────
    //
    // PICA200 texture format:
    //   Pixels are stored in Morton (Z-curve) order within 8×8 tiles.
    //   Tiles are arranged in row-major order across the texture.
    //   Byte order within each RGBA8 pixel: [A, B, G, R] at [+0,+1,+2,+3].
    //
    // Colour quadrants (by UV coordinate after upload):
    //   U<0.5, V<0.5  (x<32, y<32)  → red
    //   U>0.5, V<0.5  (x≥32, y<32)  → green
    //   U<0.5, V>0.5  (x<32, y≥32)  → blue
    //   U>0.5, V>0.5  (x≥32, y≥32)  → yellow
    //
    // C3D_TexInit allocates the GPU-visible buffer; C3D_Tex2DGetImagePtr
    // returns a pointer to it so we can write directly.  C3D_TexFlush then
    // flushes CPU caches so the GPU DMA sees the written data.
    tex: c3d.C3D_Tex
    {
        TEX_W     :: 64
        TEX_H     :: 64

        c3d.C3D_TexInit(&tex, u16(TEX_W), u16(TEX_H), .RGBA8)
        pixels := cast([^]u8)c3d.C3D_Tex2DGetImagePtr(&tex)

        for y in 0..<TEX_H {
            for x in 0..<TEX_W {
                // Morton swizzle: interleave 3-bit x and y into a 6-bit index.
                px := x % 8;  py := y % 8
                morton :=  (px & 1)        |
                           ((py & 1) << 1) |
                           ((px & 2) << 1) |
                           ((py & 2) << 2) |
                           ((px & 4) << 2) |
                           ((py & 4) << 3)

                tile_x := x / 8;  tile_y := y / 8
                ti  := tile_y * (TEX_W / 8) + tile_x
                idx := (ti * 64 + morton) * 4

                // ABGR byte order: A at +0, B at +1, G at +2, R at +3.
                a, r, g, b : u8 = 0xFF, 0, 0, 0
                switch {
                case x < TEX_W/2 && y < TEX_H/2:   r = 0xFF             // red
                case x >= TEX_W/2 && y < TEX_H/2:  g = 0xFF             // green
                case x < TEX_W/2 && y >= TEX_H/2:  b = 0xFF             // blue
                case:                               r = 0xFF; g = 0xFF   // yellow
                }

                pixels[idx + 0] = a
                pixels[idx + 1] = b
                pixels[idx + 2] = g
                pixels[idx + 3] = r
            }
        }

        // Flush CPU caches so the GPU sees the freshly written pixels.
        c3d.C3D_TexFlush(&tex)
    }

    // Smooth filtering and edge clamping.
    c3d.C3D_TexSetFilter(&tex, .LINEAR, .LINEAR)
    c3d.C3D_TexSetWrap(&tex, .CLAMP_TO_EDGE, .CLAMP_TO_EDGE)

    // ── TexEnv: sample texture unit 0, output directly ────────────
    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both,
                      .TEXTURE0, .TEXTURE0, .TEXTURE0)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    // ── Projection matrix ─────────────────────────────────────────
    // Manual OrthoTilt for 400×240 landscape space (same as Triangle-Example).
    // C3D_FVec memory layout: {w,z,y,x} at offsets {0,4,8,12};
    // Odin positional literal {x,y,z,w} maps to those offsets.
    projection: c3d.C3D_Mtx
    // Row 0 – screen-Y → GPU-X
    projection.r[0] = c3d.C3D_FVec{ 1.0, 0.0, -2.0/240.0,  0.0}
    // Row 1 – screen-X → GPU-Y
    projection.r[1] = c3d.C3D_FVec{ 1.0, 0.0,  0.0, -2.0/400.0}
    // Row 2 – Z transform
    projection.r[2] = c3d.C3D_FVec{-1.0, 1.0,  0.0,  0.0}
    // Row 3 – homogeneous W
    projection.r[3] = c3d.C3D_FVec{ 1.0, 0.0,  0.0,  0.0}

    // ── GPU state ─────────────────────────────────────────────────
    c3d.C3D_DepthTest(false, .ALWAYS, .ALL)
    c3d.C3D_CullFace(.NONE)

    // ── Main loop ─────────────────────────────────────────────────
    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        ctru.printf("\x1b[1;1HTexture Example")
        ctru.printf("\x1b[2;1HPress START to exit")
        ctru.printf("\x1b[3;1HPhase 6: C3D texture pipeline")

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)

        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        c3d.C3D_TexBind(0, &tex)
        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_proj, &projection)
        c3d.C3D_DrawArrays(.TRIANGLES, 0, 6)

        c3d.C3D_FrameEnd(0)
    }

    // ── Cleanup ───────────────────────────────────────────────────
    c3d.C3D_TexDelete(&tex)
    ctru.linearFree(vbo_data)
    ctru.shaderProgramFree(&prog)
    ctru.DVLB_Free(dvlb)
    ctru.free(sh_buf)
    c3d.C3D_Fini()
    ctru.gfxExit()
    ctru.romfsExit()
    return 0
}
