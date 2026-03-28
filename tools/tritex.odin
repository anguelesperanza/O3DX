package image_tex

/*
    tritex — drop-in tex3ds replacement
    Converts PNG / JPEG images to .t3x files compatible with:
      - Tex3DS_TextureImportStdio / Tex3DS_TextureImport  (libcitro3d)
      - C2D_SpriteSheetLoad / C2D_SpriteSheetLoadFromHandle (citro2d)

    Single-image (legacy positional form):
      tritex input.png output.t3x

    Single-image with flags:
      tritex -o output.t3x input.png

    Texture atlas:
      tritex -a -o atlas.t3x sprite1.png sprite2.png sprite3.png
      tritex -a -o atlas.t3x -i sprites.t3s

    .t3s include files are whitespace-tokenised plain text:
      # comment
      -f rgba8
      -z none
      sprite1.png
      sprite2.png
      "path with spaces/sprite3.png"

    ---------------------------------------------------------------
    .t3x Binary Layout (Tex3DS format — no magic bytes)
    ---------------------------------------------------------------

    HEADER  (5 bytes)
      0x00  u16 LE   numSubTextures
      0x02  u8       texture_params:
                       bits [2:0] = log2(tex_width)  − 3   (8→0 … 1024→7)
                       bits [5:3] = log2(tex_height) − 3
                       bit  [6]   = 0  (not a cubemap)
                       bit  [7]   = 0  (unused)
      0x03  u8       format          — GPU_TEXCOLOR: 0x00 = RGBA8
      0x04  u8       mipmapLevels    — 0  (base level only)

    SUB-TEXTURE ENTRIES  (12 bytes × numSubTextures)
      +0   u16 LE   pixel width
      +2   u16 LE   pixel height
      +4   u16 LE   left  UV × 1024
      +6   u16 LE   top   UV × 1024   (V=1.0 = top after Y-flip)
      +8   u16 LE   right UV × 1024
      +10  u16 LE   bottom UV × 1024

    PIXEL DATA BLOCK
      +0   u8       compression type = 0x00 (none)
      +1   u24 LE   uncompressed byte count  (= tex_w × tex_h × 4)
      +4   []u8     RGBA8 pixels, Morton (Z-curve) swizzled 8×8 tiles, Y-flipped
                    Canvas zero-padded to tex_w × tex_h before swizzling.
    ---------------------------------------------------------------
*/

import "core:os"
import "core:fmt"
import "core:strings"
import "core:path/filepath"
import "core:image"
import _ "core:image/png"
import _ "core:image/jpeg"

// GPU_TEXCOLOR value for RGBA8 as stored in the .t3x format byte.
T3X_GPU_RGBA8 :: u8(0)

VERSION :: "1.0.0"

// ── Math helpers ──────────────────────────────────────────────────────────────

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

// ── Image loading ─────────────────────────────────────────────────────────────

// Returns the heap-allocated image pointer directly from image.load_from_file.
load_image :: proc(path: string) -> ^image.Image {
    img, err := image.load_from_file(path, options = {.alpha_add_if_missing})
    if err != nil {
        fmt.eprintf("Could not load '%s': %v\n", path, err)
        os.exit(1)
    }
    return img
}

// ── Pixel format conversion ───────────────────────────────────────────────────

// Convert image pixels to ABGR byte order (GPU_RGBA8 in-memory layout on 3DS).
// The 3DS stores GPU_RGBA8 as a little-endian 32-bit word with R in the MSB,
// so the byte order in memory is: A, B, G, R (offset 0..3 per pixel).
to_abgr8 :: proc(img: ^image.Image) -> []u8 {
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

// ── Canvas helpers ────────────────────────────────────────────────────────────

// Zero-pad an img_w × img_h ABGR8 buffer to tex_w × tex_h.
// The image occupies the top-left; all other pixels are transparent black.
pad_canvas :: proc(src: []u8, img_w, img_h, tex_w, tex_h: int) -> []u8 {
    dst := make([]u8, tex_w * tex_h * 4)
    for y in 0 ..< img_h {
        copy(dst[y * tex_w * 4:], src[y * img_w * 4 : (y+1) * img_w * 4])
    }
    return dst
}

// ── Morton swizzle with Y-flip ────────────────────────────────────────────────

// Morton (Z-curve) swizzle for RGBA8.
// src: tex_w × tex_h × 4 bytes; both dimensions must be multiples of 8.
// No Y-flip: the 3DS GPU maps V=1.0 to tile_y=0 (the first tiles in memory),
// so image row 0 (top) must sit at tile_y=0 to be correctly sampled at uv_top=1.0.
// Verified against tex3ds -z none output — byte-for-byte identical pixel layout.
swizzle_rgba8 :: proc(src: []u8, tex_w, tex_h: int) -> []u8 {
    tiles_x := tex_w / 8
    tiles_y := tex_h / 8
    dst     := make([]u8, tex_w * tex_h * 4)
    for tile_y in 0 ..< tiles_y {
        for tile_x in 0 ..< tiles_x {
            ti := tile_y * tiles_x + tile_x
            for py in 0 ..< 8 {
                for px in 0 ..< 8 {
                    src_y := tile_y*8 + py
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

// ── Single-image .t3x builder ─────────────────────────────────────────────────

// Build the complete .t3x binary for a single image.
build_t3x_single :: proc(img: ^image.Image) -> []u8 {
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

    abgr      := to_abgr8(img)
    padded    := pad_canvas(abgr, img_w, img_h, tex_w, tex_h)
    pixels    := swizzle_rgba8(padded, tex_w, tex_h)
    data_size := u32(len(pixels))

    buf := make([dynamic]u8, 0, 17 + int(data_size))

    // ---- Header (5 bytes) ----
    append(&buf, u8(1), u8(0))                                     // numSubTextures
    append(&buf, u8((w_log2 - 3) | ((h_log2 - 3) << 3)))          // texture_params
    append(&buf, T3X_GPU_RGBA8)                                     // format
    append(&buf, u8(0))                                             // mipmapLevels

    // ---- Sub-texture entry (12 bytes) ----
    append(&buf, u8(img_w), u8(img_w >> 8))                        // pixel width
    append(&buf, u8(img_h), u8(img_h >> 8))                        // pixel height
    append(&buf, u8(0), u8(0))                                      // left UV × 1024 = 0
    append(&buf, u8(uv_top), u8(uv_top >> 8))                      // top UV × 1024
    append(&buf, u8(uv_right), u8(uv_right >> 8))                  // right UV × 1024
    append(&buf, u8(uv_bottom), u8(uv_bottom >> 8))                // bottom UV × 1024

    // ---- Compression header (4 bytes, type = 0x00 / no compression) ----
    append(&buf, u8(0x00))
    append(&buf, u8(data_size), u8(data_size >> 8), u8(data_size >> 16))

    // ---- Pixel data ----
    append(&buf, ..pixels)

    return buf[:]
}

// ── Atlas types ───────────────────────────────────────────────────────────────

// One image to be packed into an atlas, with its canvas placement.
PlacedImage :: struct {
    path:   string,
    img:    ^image.Image,
    orig_i: int, // original input index — controls sub-texture entry order
    x, y:  int,  // top-left pixel position on the shared canvas
}

// ── Shelf-packing atlas ───────────────────────────────────────────────────────

// Attempt to shelf-pack all entries into a canvas of size cw × ch.
// Writes x/y into each entry on success.
// entries must already be sorted by height descending for best results.
// Returns true if all images fit, false otherwise.
shelf_pack_try :: proc(entries: []PlacedImage, cw, ch: int) -> bool {
    sx, sy, sh := 0, 0, 0
    for &e in entries {
        if e.img.width > cw || e.img.height > ch do return false
        if sx + e.img.width > cw {
            sx  = 0
            sy += sh
            sh  = 0
        }
        if sy + e.img.height > ch do return false
        e.x  = sx
        e.y  = sy
        sx  += e.img.width
        if e.img.height > sh do sh = e.img.height
    }
    return true
}

// Sort entries by height descending (simple insertion sort — avoids core:slice dependency).
sort_by_height_desc :: proc(entries: []PlacedImage) {
    n := len(entries)
    for i in 1 ..< n {
        key := entries[i]
        j   := i - 1
        for j >= 0 && entries[j].img.height < key.img.height {
            entries[j + 1] = entries[j]
            j -= 1
        }
        entries[j + 1] = key
    }
}

// Sort entries by orig_i ascending (for writing sub-texture entries in input order).
sort_by_orig_i :: proc(entries: []PlacedImage) {
    n := len(entries)
    for i in 1 ..< n {
        key := entries[i]
        j   := i - 1
        for j >= 0 && entries[j].orig_i > key.orig_i {
            entries[j + 1] = entries[j]
            j -= 1
        }
        entries[j + 1] = key
    }
}

// Find the smallest power-of-two canvas (up to 1024×1024) that can hold all
// entries using shelf packing sorted by height descending.
// Returns (canvas_w, canvas_h, ok).
// On success, every entry has its x/y fields set to its canvas position.
find_and_pack :: proc(entries: []PlacedImage) -> (cw, ch: int, ok: bool) {
    // Sort by height descending for tighter shelf packing.
    sort_by_height_desc(entries)

    // Try every power-of-two canvas up to 1024 × 1024.
    for w_exp in 3 ..= 10 { // 8 .. 1024
        for h_exp in 3 ..= 10 {
            w := 1 << uint(w_exp)
            h := 1 << uint(h_exp)
            if shelf_pack_try(entries, w, h) {
                return w, h, true
            }
        }
    }
    return 0, 0, false
}

// ── Atlas .t3x builder ────────────────────────────────────────────────────────

// Composite all placed images onto a single cw × ch ABGR8 canvas.
make_canvas :: proc(entries: []PlacedImage, cw, ch: int) -> []u8 {
    canvas := make([]u8, cw * ch * 4) // zeroed = transparent black
    for e in entries {
        abgr := to_abgr8(e.img)
        defer delete(abgr)
        for row in 0 ..< e.img.height {
            src_off := row * e.img.width * 4
            dst_off := (e.y + row) * cw * 4 + e.x * 4
            copy(canvas[dst_off:], abgr[src_off : src_off + e.img.width * 4])
        }
    }
    return canvas
}

// Build a .t3x with multiple sub-textures from pre-packed PlacedImages.
//
// Sub-texture UV coordinates (with Y-flip):
//   For an image at pixel (px, py) with size (pw, ph) on a canvas (cw, ch):
//     uv_left   = px * 1024 / cw
//     uv_right  = (px + pw) * 1024 / cw
//     uv_top    = (ch - py) * 1024 / ch          ← V=1.0 is bottom of canvas after flip
//     uv_bottom = (ch - py - ph) * 1024 / ch
//
// Sub-texture entries are written in ORIGINAL INPUT ORDER (sorted by orig_i)
// so that C2D_SpriteSheetGetImage(sheet, N) returns the Nth input image —
// matching the behaviour of the real tex3ds tool.
build_t3x_atlas :: proc(entries: []PlacedImage, cw, ch: int) -> []u8 {
    canvas    := make_canvas(entries, cw, ch)
    defer delete(canvas)
    pixels    := swizzle_rgba8(canvas, cw, ch)
    data_size := u32(len(pixels))
    n         := len(entries)

    w_log2 := ilog2(cw)
    h_log2 := ilog2(ch)

    buf := make([dynamic]u8, 0, 5 + n * 12 + 4 + int(data_size))

    // ---- Header (5 bytes) ----
    append(&buf, u8(n), u8(n >> 8))                                // numSubTextures
    append(&buf, u8((w_log2 - 3) | ((h_log2 - 3) << 3)))          // texture_params
    append(&buf, T3X_GPU_RGBA8)                                     // format
    append(&buf, u8(0))                                             // mipmapLevels

    // Sort a working copy by orig_i so entries are written in input order.
    ordered := make([]PlacedImage, n)
    copy(ordered, entries)
    sort_by_orig_i(ordered)

    // ---- Sub-texture entries (12 bytes each) ----
    for e in ordered {
        pw := e.img.width
        ph := e.img.height
        ul := u16(e.x * 1024 / cw)
        ur := u16((e.x + pw) * 1024 / cw)
        ut := u16((ch - e.y) * 1024 / ch)
        ub := u16((ch - e.y - ph) * 1024 / ch)
        append(&buf, u8(pw), u8(pw >> 8))                          // pixel width
        append(&buf, u8(ph), u8(ph >> 8))                          // pixel height
        append(&buf, u8(ul), u8(ul >> 8))                          // left UV × 1024
        append(&buf, u8(ut), u8(ut >> 8))                          // top UV × 1024
        append(&buf, u8(ur), u8(ur >> 8))                          // right UV × 1024
        append(&buf, u8(ub), u8(ub >> 8))                          // bottom UV × 1024
    }

    // ---- Compression header (4 bytes, type = 0x00 / no compression) ----
    append(&buf, u8(0x00))
    append(&buf, u8(data_size), u8(data_size >> 8), u8(data_size >> 16))

    // ---- Pixel data ----
    append(&buf, ..pixels)

    return buf[:]
}

// ── .t3s include file tokenizer ───────────────────────────────────────────────

// Tokenize a .t3s include file into a flat list of string tokens.
// Rules (matching tex3ds behaviour):
//   • Tokens are separated by ASCII whitespace.
//   • A '#' begins a comment that runs to end of line.
//   • Single or double quotes allow whitespace inside a token.
//   • Tokens that do not start with '-' are treated as input filenames;
//     relative paths are resolved against base_dir (the .t3s file's directory).
tokenize_t3s :: proc(content: string, base_dir: string) -> []string {
    result : [dynamic]string
    i, n   := 0, len(content)

    for i < n {
        // Skip whitespace.
        for i < n && (content[i] == ' ' || content[i] == '\t' ||
                      content[i] == '\r' || content[i] == '\n') {
            i += 1
        }
        if i >= n do break

        // Comment: skip to end of line.
        if content[i] == '#' {
            for i < n && content[i] != '\n' { i += 1 }
            continue
        }

        // Quoted token.
        if content[i] == '"' || content[i] == '\'' {
            q     := content[i]
            i     += 1
            start := i
            for i < n && content[i] != q { i += 1 }
            tok := content[start:i]
            if i < n do i += 1 // consume closing quote
            append(&result, resolve_token(tok, base_dir))
            continue
        }

        // Unquoted token — runs until whitespace or '#'.
        start := i
        for i < n && content[i] != ' ' && content[i] != '\t' &&
            content[i] != '\r' && content[i] != '\n' && content[i] != '#' {
            i += 1
        }
        tok := content[start:i]
        if len(tok) > 0 {
            append(&result, resolve_token(tok, base_dir))
        }
    }
    return result[:]
}

// Resolve a single .t3s token: flags are cloned as-is; filenames are resolved
// relative to base_dir (unless they are already absolute).
resolve_token :: proc(tok: string, base_dir: string) -> string {
    if len(tok) > 0 && tok[0] == '-' {
        return strings.clone(tok)
    }
    // It's a filename.
    if base_dir != "" && !filepath.is_abs(tok) {
        joined, _ := filepath.join([]string{base_dir, tok}, context.allocator)
        return joined
    }
    return strings.clone(tok)
}

// ── Include expansion ─────────────────────────────────────────────────────────

// Walk the raw argument list and replace every "-i <file>" pair with the
// tokens tokenized from that file.  The result is a flat []string that the
// main argument parser can process uniformly.
expand_includes :: proc(raw: []string) -> []string {
    result: [dynamic]string
    i := 0
    for i < len(raw) {
        arg := raw[i]
        if (arg == "-i" || arg == "--include") && i + 1 < len(raw) {
            i += 1
            inc_path := raw[i]
            data, read_err := os.read_entire_file_from_path(inc_path, context.allocator)
            if read_err != nil {
                fmt.eprintf("Error: cannot read include file '%s': %v\n", inc_path, read_err)
                os.exit(1)
            }
            base_dir := filepath.dir(inc_path)
            tokens   := tokenize_t3s(string(data), base_dir)
            for t in tokens { append(&result, t) }
        } else {
            append(&result, arg)
        }
        i += 1
    }
    return result[:]
}

// ── Usage ─────────────────────────────────────────────────────────────────────

print_usage :: proc(prog: string) {
    fmt.printf(
`Usage: %s [OPTIONS...] <input>
  Options:
    -a, --atlas              Pack inputs into a texture atlas
    -o, --output <file>      Output .t3x file
    -i, --include <file>     Read additional options/inputs from a .t3s file
    -f, --format <format>    Texture format (only rgba8 output supported)
    -z, --compress <comp>    Compression (only none/uncompressed supported)
    -m, --mipmap <filter>    Mipmap filter (accepted but ignored; no mipmaps)
    -d, --depends <file>     Dependency file output (ignored)
    -H, --header <file>      C header output (ignored)
    -p, --preview <file>     Preview image output (ignored)
    -q, --quality <quality>  ETC1 quality (ignored)
    -r, --raw                Raw output (ignored)
    -t, --trim               Trim whitespace (ignored)
    -b, --border <type>      Border type (ignored)
    -h, --help               Show this help message
    -v, --version            Show version
    <input>                  Input PNG/JPEG file(s)
`, prog)
}

// ── Main ──────────────────────────────────────────────────────────────────────

main :: proc() {
    // Expand any -i include files into the argument stream first so the
    // main parser sees a uniform flat list.
    args := expand_includes(os.args[1:])

    output     : string
    atlas_mode := false
    inputs     : [dynamic]string

    i := 0
    for i < len(args) {
        arg := args[i]
        switch arg {

        // ── Informational ──────────────────────────────────────────────────
        case "-h", "--help":
            print_usage(os.args[0])
            os.exit(0)
        case "-v", "--version":
            fmt.printf("tritex %s\n", VERSION)
            os.exit(0)

        // ── Mode flags ────────────────────────────────────────────────────
        case "-a", "--atlas":
            atlas_mode = true

        // ── Output ────────────────────────────────────────────────────────
        case "-o", "--output":
            i += 1
            if i >= len(args) {
                fmt.eprintln("Error: -o requires a filename argument")
                os.exit(1)
            }
            output = args[i]

        // ── Flags that consume one argument (accepted, output ignored) ────
        case "-f", "--format",
             "-z", "--compress",
             "-m", "--mipmap",
             "-d", "--depends",
             "-H", "--header",
             "-p", "--preview",
             "-q", "--quality",
             "-b", "--border":
            i += 1 // consume the argument value

        // ── Boolean flags (accepted, ignored) ────────────────────────────
        case "-r", "--raw",
             "-t", "--trim",
             "-c", "--cubemap",
             "-s", "--skybox":
            // intentionally ignored

        // ── Positional or unknown ─────────────────────────────────────────
        case:
            if len(arg) > 1 && arg[0] == '-' {
                fmt.eprintf("Warning: unknown option '%s' — ignored\n", arg)
            } else {
                append(&inputs, arg)
            }
        }
        i += 1
    }

    // ── Backward-compat: png2t3x input.png output.t3x ────────────────────
    // If no -o was given and there are exactly two positional args, treat
    // the last one as the output path (legacy form).
    if output == "" && len(inputs) == 2 && !atlas_mode {
        output = inputs[len(inputs) - 1]
        resize(&inputs, len(inputs) - 1)
    }

    // ── Validation ────────────────────────────────────────────────────────
    if len(inputs) == 0 {
        fmt.eprintln("Error: no input files specified.")
        print_usage(os.args[0])
        os.exit(1)
    }
    if output == "" {
        fmt.eprintln("Error: no output file specified.  Use -o <file.t3x>.")
        os.exit(1)
    }

    // ── Single-image mode ─────────────────────────────────────────────────
    if len(inputs) == 1 && !atlas_mode {
        path := inputs[0]
        fmt.printf("Converting '%s' -> '%s'\n", path, output)

        img   := load_image(path)
        tex_w := next_pow2(img.width)
        tex_h := next_pow2(img.height)

        if tex_w > 1024 || tex_h > 1024 {
            fmt.eprintf(
                "Error: image %dx%d requires a %dx%d texture, exceeding the 3DS GPU limit of 1024x1024.\n",
                img.width, img.height, tex_w, tex_h)
            fmt.eprintln("Resize the image to fit within 1024x1024 before converting.")
            os.exit(1)
        }

        data := build_t3x_single(img)
        if err := os.write_entire_file(output, data); err != nil {
            fmt.eprintf("Failed to write '%s': %v\n", output, err)
            os.exit(1)
        }
        fmt.printf("Done: %dx%d RGBA8  (texture %dx%d, %d bytes)\n",
            img.width, img.height, tex_w, tex_h, len(data))
        return
    }

    // ── Atlas mode ────────────────────────────────────────────────────────
    fmt.printf("Building atlas: %d image(s) -> '%s'\n", len(inputs), output)

    entries := make([]PlacedImage, len(inputs))
    for path, idx in inputs {
        img := load_image(path)
        if img.width > 1024 || img.height > 1024 {
            fmt.eprintf("Error: '%s' (%dx%d) exceeds the 3DS GPU limit of 1024x1024.\n",
                path, img.width, img.height)
            os.exit(1)
        }
        entries[idx] = PlacedImage{path = path, img = img, orig_i = idx}
        fmt.printf("  [%d] %-40s  %dx%d\n", idx, path, img.width, img.height)
    }

    cw, ch, ok := find_and_pack(entries)
    if !ok {
        fmt.eprintln("Error: images do not fit in any power-of-two canvas up to 1024x1024.")
        fmt.eprintln("       Reduce the number or size of input images.")
        os.exit(1)
    }
    fmt.printf("Atlas canvas: %dx%d\n", cw, ch)

    data := build_t3x_atlas(entries, cw, ch)
    if err := os.write_entire_file(output, data); err != nil {
        fmt.eprintf("Failed to write '%s': %v\n", output, err)
        os.exit(1)
    }
    fmt.printf("Done: atlas %dx%d, %d sub-texture(s), %d bytes total.\n",
        cw, ch, len(entries), len(data))
}
