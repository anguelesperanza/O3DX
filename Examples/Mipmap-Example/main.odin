package mipmap_example

import "core:math"

import ctru "../../lib/ctru"
import c3d  "../../lib/c3d"

// Tests the texture changes:
//   - C3D_TexInitWithParams with the new C3D_TexInitParams layout (a
//     bit_field, 8-byte aligned; citro3d got the wrong bytes before);
//   - C3D_Tex2DGetImagePtr with a level and size;
//   - C3D_TexInitMipmap, C3D_TexGenerateMipmap, C3D_TexSetFilterMipmap;
//   - C3D_TexCalcMaxLevel / C3D_TexCalcLevelSize / C3D_TexCalcTotalSize;
//   - Tex3DS_TextureImportStdio into linear memory and into VRAM, plus the
//     Tex3DS_SubTexture corner helpers.
//
// A textured square grows and shrinks. A cycles through four textures:
//   1. Level colours: each mipmap level is one solid colour
//      (0 red, 1 yellow, 2 green, 3 blue). As the square shrinks the colour
//      steps red -> yellow -> green -> blue. All red: mipmaps not used.
//   2. Generated mipmaps: a fine black/white checkerboard. Shrunk, it turns
//      an even grey instead of flickering moire.
//   3. sprite.t3x imported with Tex3DS into linear memory.
//   4. The same file imported into VRAM.
//
// Controls:
//   A      next texture
//   Up/Down  hold to stop the animation and size the square by hand
//   START  exit

DISPLAY_TRANSFER_FLAGS :: u32(0x1000)

TEX_SIZE :: 64

// Index of pixel (x, y) in a Morton-tiled (8x8 tiles) texture.
morton_index :: proc "contextless" (x, y, width: int) -> int {
    px := x % 8
    py := y % 8
    morton := (px & 1) | (py & 1) << 1 | (px & 2) << 1 | (py & 2) << 2 | (px & 4) << 2 | (py & 4) << 3
    tile := (y / 8) * (width / 8) + x / 8
    return tile * 64 + morton
}

// RGBA8 texels are stored as a little-endian u32 0xRRGGBBAA.
LEVEL_COLOURS := [4]u32{
    0xFF0000FF, // red
    0xFFFF00FF, // yellow
    0x00FF00FF, // green
    0x0000FFFF, // blue
}

Mode :: enum {
    LEVEL_COLOURS,
    GENERATED,
    T3X_LINEAR,
    T3X_VRAM,
}

MODE_NAMES := [Mode]cstring{
    .LEVEL_COLOURS = "level colours (InitWithParams)",
    .GENERATED     = "generated mipmaps (InitMipmap)",
    .T3X_LINEAR    = "Tex3DS import, linear memory",
    .T3X_VRAM      = "Tex3DS import, VRAM",
}

// Send one vertex of the textured quad: position, then UV.
quad_vertex :: proc "contextless" (x, y, u, v: f32) {
    c3d.C3D_ImmSendAttrib(x, y, 0.5, 1.0)
    c3d.C3D_ImmSendAttrib(u, v, 0.0, 0.0)
}

load_t3x :: proc "contextless" (path: cstring, tex: ^c3d.C3D_Tex, sub: ^c3d.Tex3DS_SubTexture, vram: bool) -> bool {
    f := ctru.fopen(path, "rb")
    if f == nil do return false
    t3x := c3d.Tex3DS_TextureImportStdio(f, tex, nil, vram)
    ctru.fclose(f)
    if t3x == nil do return false
    count := c3d.Tex3DS_GetNumSubTextures(t3x)
    if count > 0 do sub^ = c3d.Tex3DS_GetSubTexture(t3x, 0)^
    c3d.Tex3DS_TextureFree(t3x)
    return count > 0
}

ok_fail :: proc "contextless" (ok: bool) -> cstring {
    if ok do return "ok  "
    return "FAIL"
}

@(export, link_name = "odin_main")
mipmap_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.romfsInit()
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

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

    uloc_proj := i32(ctru.shaderInstanceGetUniformLocation(prog.vertexShader, "projection"))

    attr_info := c3d.C3D_GetAttrInfo()
    c3d.AttrInfo_Init(attr_info)
    c3d.AttrInfo_AddLoader(attr_info, 0, .FLOAT, 3) // v0 position
    c3d.AttrInfo_AddLoader(attr_info, 1, .FLOAT, 2) // v1 uv

    ctru.printf("\x1b[1;1HMipmap-Example")

    // ── Size helpers ──────────────────────────────────────────────
    max_level := c3d.C3D_TexCalcMaxLevel(TEX_SIZE, TEX_SIZE)
    level1    := c3d.C3D_TexCalcLevelSize(TEX_SIZE * TEX_SIZE * 4, 1)
    total     := c3d.C3D_TexCalcTotalSize(TEX_SIZE * TEX_SIZE * 4, max_level)
    ctru.printf("\x1b[3;1HCalcMaxLevel(64,64)   = %ld (expect 3)", max_level)
    ctru.printf("\x1b[4;1HCalcLevelSize(16K, 1) = %lu (4096)", level1)
    ctru.printf("\x1b[5;1HCalcTotalSize(16K, 3) = %lu (21760)", total)

    // ── 1. One solid colour per level, via C3D_TexInitWithParams ──
    tex_levels: c3d.C3D_Tex
    params := c3d.C3D_TexInitParams{width = TEX_SIZE, height = TEX_SIZE}
    params.maxLevel = u8(max_level)
    params.format = .RGBA8
    params.type_ = .TEX2D
    params.onVram = false
    ok_levels := c3d.C3D_TexInitWithParams(&tex_levels, nil, params)
    for level in 0 ..= max_level {
        size: u32
        pixels := cast([^]u32)c3d.C3D_Tex2DGetImagePtr(&tex_levels, level, &size)
        for i in 0 ..< int(size / 4) do pixels[i] = LEVEL_COLOURS[level]
        if level == 1 do ctru.printf("\x1b[6;1HGetImagePtr level 1 size = %lu (4096)", size)
    }
    c3d.C3D_TexFlush(&tex_levels)
    c3d.C3D_TexSetFilter(&tex_levels, .LINEAR, .NEAREST)
    c3d.C3D_TexSetFilterMipmap(&tex_levels, .NEAREST)
    c3d.C3D_TexSetWrap(&tex_levels, .CLAMP_TO_EDGE, .CLAMP_TO_EDGE)

    // ── 2. Checkerboard with generated mipmaps ────────────────────
    tex_checker: c3d.C3D_Tex
    ok_checker := c3d.C3D_TexInitMipmap(&tex_checker, TEX_SIZE, TEX_SIZE, .RGBA8)
    {
        pixels := cast([^]u32)c3d.C3D_Tex2DGetImagePtr(&tex_checker)
        for y in 0 ..< TEX_SIZE {
            for x in 0 ..< TEX_SIZE {
                colour := u32(0x000000FF)
                if (x ~ y) & 1 != 0 do colour = 0xFFFFFFFF
                pixels[morton_index(x, y, TEX_SIZE)] = colour
            }
        }
        c3d.C3D_TexFlush(&tex_checker)
        c3d.C3D_TexGenerateMipmap(&tex_checker, .TEXFACE_2D)
    }
    c3d.C3D_TexSetFilter(&tex_checker, .LINEAR, .LINEAR)
    c3d.C3D_TexSetFilterMipmap(&tex_checker, .LINEAR)

    // ── 3 and 4. Tex3DS imports ───────────────────────────────────
    tex_t3x:      c3d.C3D_Tex
    tex_t3x_vram: c3d.C3D_Tex
    sub_t3x:      c3d.Tex3DS_SubTexture
    sub_t3x_vram: c3d.Tex3DS_SubTexture
    ok_t3x := load_t3x("romfs:/gfx/sprite.t3x", &tex_t3x, &sub_t3x, false)
    ok_t3x_vram := load_t3x("romfs:/gfx/sprite.t3x", &tex_t3x_vram, &sub_t3x_vram, true)
    c3d.C3D_TexSetFilter(&tex_t3x, .LINEAR, .LINEAR)
    c3d.C3D_TexSetFilter(&tex_t3x_vram, .LINEAR, .LINEAR)

    ctru.printf("\x1b[8;1HTexInitWithParams: %s", ok_fail(ok_levels))
    ctru.printf("\x1b[9;1HTexInitMipmap:     %s", ok_fail(ok_checker))
    ctru.printf("\x1b[10;1HTex3DS linear:     %s %dx%d", ok_fail(ok_t3x), i32(sub_t3x.width), i32(sub_t3x.height))
    ctru.printf("\x1b[11;1HTex3DS VRAM:       %s %dx%d", ok_fail(ok_t3x_vram), i32(sub_t3x_vram.width), i32(sub_t3x_vram.height))
    ctru.printf("\x1b[17;1HA: next texture  Up/Down: size")
    ctru.printf("\x1b[18;1HSTART: exit")

    env := c3d.C3D_GetTexEnv(0)
    c3d.C3D_TexEnvInit(env)
    c3d.C3D_TexEnvSrc(env, c3d.C3D_Both, .TEXTURE0, .TEXTURE0, .TEXTURE0)
    c3d.C3D_TexEnvFunc(env, c3d.C3D_Both, .REPLACE)

    c3d.C3D_DepthTest(false, .ALWAYS, .ALL)
    c3d.C3D_CullFace(.NONE)

    projection: c3d.C3D_Mtx
    projection.r[0] = c3d.C3D_FVec{ 1.0, 0.0, -2.0 / 240.0, 0.0}
    projection.r[1] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, -2.0 / 400.0}
    projection.r[2] = c3d.C3D_FVec{-1.0, 1.0, 0.0, 0.0}
    projection.r[3] = c3d.C3D_FVec{ 1.0, 0.0, 0.0, 0.0}

    mode := Mode.LEVEL_COLOURS
    t: f32 = 0.0
    size: f32 = 200.0
    animate := true

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        held := ctru.hidKeysHeld()
        if down & ctru.KEY_START != 0 do break
        if down & ctru.KEY_A != 0 {
            mode = Mode((int(mode) + 1) % len(Mode))
        }
        if held & (ctru.KEY_UP | ctru.KEY_DOWN) != 0 do animate = false
        if held & ctru.KEY_UP != 0 do size += 1.0
        if held & ctru.KEY_DOWN != 0 do size -= 1.0

        if animate {
            t += 0.01
            size = 4.0 + 106.0 * (1.0 + math.sin(t))
        }
        size = clamp(size, 2.0, 220.0)

        ctru.printf("\x1b[13;1HTexture: %-32s", MODE_NAMES[mode])
        ctru.printf("\x1b[14;1HSize: %5.1f px   ", f64(size))

        tex := &tex_levels
        u0: f32 = 0.0
        v0: f32 = 1.0 // top
        u1: f32 = 1.0
        v1: f32 = 0.0 // bottom
        switch mode {
        case .LEVEL_COLOURS:
        case .GENERATED:
            tex = &tex_checker
        case .T3X_LINEAR:
            tex = &tex_t3x
            c3d.Tex3DS_SubTextureTopLeft(&sub_t3x, &u0, &v0)
            c3d.Tex3DS_SubTextureBottomRight(&sub_t3x, &u1, &v1)
        case .T3X_VRAM:
            tex = &tex_t3x_vram
            c3d.Tex3DS_SubTextureTopLeft(&sub_t3x_vram, &u0, &v0)
            c3d.Tex3DS_SubTextureBottomRight(&sub_t3x_vram, &u1, &v1)
        }

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, 0x1A1A2EFF, 0)
        c3d.C3D_FrameDrawOn(top)

        c3d.C3D_TexBind(0, tex)
        c3d.C3D_FVUnifMtx4x4(.VERTEX_SHADER, uloc_proj, &projection)

        left   := 200.0 - size / 2.0
        right  := 200.0 + size / 2.0
        top_y  := 120.0 - size / 2.0
        bottom := 120.0 + size / 2.0
        c3d.C3D_ImmDrawBegin(.TRIANGLE_STRIP)
        quad_vertex(left, top_y, u0, v0)
        quad_vertex(left, bottom, u0, v1)
        quad_vertex(right, top_y, u1, v0)
        quad_vertex(right, bottom, u1, v1)
        c3d.C3D_ImmDrawEnd()

        c3d.C3D_FrameEnd(0)
    }

    c3d.C3D_TexDelete(&tex_levels)
    c3d.C3D_TexDelete(&tex_checker)
    c3d.C3D_TexDelete(&tex_t3x)
    c3d.C3D_TexDelete(&tex_t3x_vram)
    ctru.shaderProgramFree(&prog)
    ctru.DVLB_Free(dvlb)
    ctru.free(sh_buf)
    c3d.C3D_Fini()
    ctru.gfxExit()
    ctru.romfsExit()
    return 0
}
