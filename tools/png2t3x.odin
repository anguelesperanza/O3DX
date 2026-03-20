package image_tex

/*
    Converts a PNG / JPEG to a .t3x file compatible with:
      - Tex3DS_TextureImportStdio / Tex3DS_TextureImport  (libcitro3d)
      - C2D_SpriteSheetLoad / C2D_SpriteSheetLoadFromHandle (citro2d)

    Usage: png2t3x <input.png> <output.t3x>

    ---------------------------------------------------------------
    .t3x Binary Layout (Tex3DS format — no magic bytes)
    ---------------------------------------------------------------

    HEADER  (5 bytes)
      0x00  u16 LE   numSubTextures  — always 1 for a single image
      0x02  u8       texture_params:
                       bits [2:0] = log2(tex_width)  − 3   (8→0, 16→1, … 1024→7)
                       bits [5:3] = log2(tex_height) − 3
                       bit  [6]   = 0  (not a cubemap)
                       bit  [7]   = 0  (unused)
      0x03  u8       format          — GPU_TEXCOLOR: 0x00 = RGBA8
      0x04  u8       mipmapLevels    — 0  (base level only, no mipmaps)

    SUB-TEXTURE ENTRIES  (12 bytes × numSubTextures, immediately after header)
      +0   u16 LE   pixel width      (actual image width,  ≤ tex_width)
      +2   u16 LE   pixel height     (actual image height, ≤ tex_height)
      +4   u16 LE   left  UV × 1024  = 0
      +6   u16 LE   top   UV × 1024  = 1024  (V=1.0, top of image after Y-flip)
      +8   u16 LE   right UV × 1024  = img_width  × 1024 / tex_width
      +10  u16 LE   bottom UV × 1024 = (tex_height − img_height) × 1024 / tex_height

    PIXEL DATA BLOCK  (immediately after last sub-texture entry)
      +0   u8       compression type = 0x00 (none / raw)
      +1   u24 LE   uncompressed byte count  (= tex_width × tex_height × 4)
      +4   []u8     RGBA8 pixels, Morton (Z-curve) swizzled 8×8 tiles, Y-flipped
                    Image zero-padded to tex_width × tex_height before swizzling.

    ---------------------------------------------------------------
    Key differences from the old custom format:
      • No "TX30" magic — the file starts directly with numSubTextures.
      • Width/height stored as log2 exponents in a bit-packed byte, not raw u32.
      • GPU_RGBA8 format byte = 0x00 (NOT 0x0A which is the C3D TexInit enum value).
      • Sub-texture UV entries (12 bytes) precede the pixel data.
      • A 4-byte BIOS compression header wraps the pixel data (type 0 = no compression).
      • Dimensions are rounded up to the nearest power-of-two ≥ 8 and zero-padded.
    ---------------------------------------------------------------
*/

import "core:os"
import "core:fmt"
import "core:image"
import _ "core:image/png"
import _ "core:image/jpeg"

// GPU_TEXCOLOR value for RGBA8 as stored in the .t3x format byte (= 0, not 0x0A).
T3X_GPU_RGBA8 :: u8(0)

// Smallest power-of-two integer ≥ v and ≥ 8.
next_pow2 :: proc(v: int) -> int {
    r := 8
    for r < v do r *= 2
    return r
}

// Integer log₂ of a power-of-two value.
ilog2 :: proc(v: int) -> int {
    n, x := 0, v
    for x > 1 { x >>= 1; n += 1 }
    return n
}

load_image :: proc(path: string) -> image.Image {
    img, err := image.load_from_file(path, options = {.alpha_add_if_missing})
    if err != nil {
        fmt.eprintf("Could not load '%s': %v\n", path, err)
        os.exit(1)
    }
    return img^
}

// Convert image pixels to ABGR byte order (GPU_RGBA8 in-memory layout on 3DS).
// The 3DS stores GPU_RGBA8 as a little-endian 32-bit word with R in the MSB,
// so the byte order in memory is: A, B, G, R (offset 0..3 per pixel).
to_abgr8 :: proc(img: image.Image) -> []u8 {
    w, h := img.width, img.height
    src  := img.pixels.buf[:]
    bpp  := len(src) / (w * h)
    dst  := make([]u8, w * h * 4)
    for i in 0 ..< w * h {
        s := i * bpp
        d := i * 4
        switch bpp {
        case 4:
            dst[d+0] = src[s+3] // A
            dst[d+1] = src[s+2] // B
            dst[d+2] = src[s+1] // G
            dst[d+3] = src[s+0] // R
        case 3:
            dst[d+0] = 0xFF
            dst[d+1] = src[s+2] // B
            dst[d+2] = src[s+1] // G
            dst[d+3] = src[s+0] // R
        case:
            g := src[s]
            dst[d+0] = 0xFF; dst[d+1] = g; dst[d+2] = g; dst[d+3] = g
        }
    }
    return dst
}

// Zero-pad an img_w × img_h ABGR8 buffer to tex_w × tex_h.
// The image occupies the top-left; all other pixels are transparent black.
pad_to_pow2 :: proc(src: []u8, img_w, img_h, tex_w, tex_h: int) -> []u8 {
    dst := make([]u8, tex_w * tex_h * 4)
    for y in 0 ..< img_h {
        copy(dst[y * tex_w * 4:], src[y * img_w * 4 : (y+1) * img_w * 4])
    }
    return dst
}

// Morton (Z-curve) swizzle with Y-flip for RGBA8.
// src: tex_w × tex_h × 4 bytes; dimensions must be multiples of 8.
// Y-flip: PNG row 0 (top) → V ≈ 1.0 in 3DS texture space (V-origin at bottom).
swizzle_rgba8 :: proc(src: []u8, tex_w, tex_h: int) -> []u8 {
    tiles_x := tex_w / 8
    tiles_y := tex_h / 8
    dst     := make([]u8, tex_w * tex_h * 4)
    for tile_y in 0 ..< tiles_y {
        for tile_x in 0 ..< tiles_x {
            ti := tile_y * tiles_x + tile_x
            for py in 0 ..< 8 {
                for px in 0 ..< 8 {
                    src_y := (tex_h - 1) - (tile_y*8 + py)
                    src_x := tile_x*8 + px
                    si    := (src_y * tex_w + src_x) * 4
                    morton := (px & 1)        |
                              ((py & 1) << 1) |
                              ((px & 2) << 1) |
                              ((py & 2) << 2) |
                              ((px & 4) << 2) |
                              ((py & 4) << 3)
                    di := (ti*64 + morton) * 4
                    dst[di+0] = src[si+0]
                    dst[di+1] = src[si+1]
                    dst[di+2] = src[si+2]
                    dst[di+3] = src[si+3]
                }
            }
        }
    }
    return dst
}

// Build the complete .t3x binary for a single image.
build_t3x :: proc(img: image.Image) -> []u8 {
    img_w := img.width
    img_h := img.height
    tex_w := next_pow2(img_w)
    tex_h := next_pow2(img_h)

    w_log2 := ilog2(tex_w)
    h_log2 := ilog2(tex_h)

    // UV coordinates stored as u16 (float × 1024).
    // After Y-flip, rows 0..img_h-1 map to V in [uv_bottom, 1.0].
    uv_top    := u16(1024)
    uv_bottom := u16((tex_h - img_h) * 1024 / tex_h)
    uv_right  := u16(img_w * 1024 / tex_w)

    // Build swizzled pixel block.
    abgr      := to_abgr8(img)
    padded    := pad_to_pow2(abgr, img_w, img_h, tex_w, tex_h)
    pixels    := swizzle_rgba8(padded, tex_w, tex_h)
    data_size := u32(len(pixels))

    buf := make([dynamic]u8, 0, 17 + int(data_size))

    // ---- Header (5 bytes) ----
    // numSubTextures (u16 LE)
    append(&buf, u8(1), u8(0))
    // texture_params: bits[2:0]=log2(w)-3, bits[5:3]=log2(h)-3, bits[6:7]=0
    append(&buf, u8((w_log2 - 3) | ((h_log2 - 3) << 3)))
    // format, mipmapLevels
    append(&buf, T3X_GPU_RGBA8)
    append(&buf, u8(0))

    // ---- Sub-texture entry (12 bytes) ----
    // pixel width
    append(&buf, u8(img_w), u8(img_w >> 8))
    // pixel height
    append(&buf, u8(img_h), u8(img_h >> 8))
    // left UV × 1024 = 0
    append(&buf, u8(0), u8(0))
    // top UV × 1024 = 1024
    append(&buf, u8(uv_top), u8(uv_top >> 8))
    // right UV × 1024
    append(&buf, u8(uv_right), u8(uv_right >> 8))
    // bottom UV × 1024
    append(&buf, u8(uv_bottom), u8(uv_bottom >> 8))

    // ---- Compression header (4 bytes, type = 0x00 / no compression) ----
    append(&buf, u8(0x00))                    // type: none
    append(&buf, u8(data_size))               // uncompressed size, 24-bit LE
    append(&buf, u8(data_size >>  8))
    append(&buf, u8(data_size >> 16))

    // ---- Pixel data ----
    append(&buf, ..pixels)

    return buf[:]
}

main :: proc() {
    args := os.args
    if len(args) != 3 {
        fmt.eprintfln("Usage: %s <input> <output.t3x>", args[0])
        os.exit(1)
    }

    input  := args[1]
    output := args[2]

    fmt.printfln("Converting '%s' -> '%s'", input, output)

    img   := load_image(input)
    tex_w := next_pow2(img.width)
    tex_h := next_pow2(img.height)
    data  := build_t3x(img)

    if err := os.write_entire_file(output, data); err != nil {
        fmt.eprintfln("Failed to write '%s': %v", output, err)
        os.exit(1)
    }

    fmt.printfln("Done: %dx%d RGBA8  (texture %dx%d,  %d bytes)",
        img.width, img.height, tex_w, tex_h, len(data))
}
