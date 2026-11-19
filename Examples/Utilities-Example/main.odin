package utilities_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Self-checking tests for newly bound libctru utilities and the small
// helpers that were rewritten in Odin. Every line prints PASS or FAIL, and
// the last line counts the failures. Nothing to press but START.
//
//   decompress   RLE and LZ10 data built by hand, through decompress() and
//                decompressHeader()
//   utf          utf8_to_utf16 / utf16_to_utf8 round trip, decode_utf8,
//                encode_utf16 with a surrogate pair
//   rbtree       insert, size, min / max, find, in-order walk
//   font         the system font: fontEnsureMapped, fontGetSystemFont,
//                fontGetInfo, fontGlyphIndexFromCodePoint,
//                fontGetCharWidthInfo
//   byte order   htons / htonl / ntohs / ntohl (Odin now)
//   helpers      C2D_Clamp, C2D_FloatToU8, IVec_Pack, FogLut_CalcZ
//   matrices     Mtx_Multiply, Mtx_Translate, Mtx_MultiplyFVec4, Mtx_Transpose
//   time         osGetTime and svcGetSystemTick move forward

failures: int

check :: proc "contextless" (ok: bool, name: cstring) {
    if ok {
        ctru.printf("PASS %s\n", name)
    } else {
        ctru.printf("FAIL %s\n", name)
        failures += 1
    }
}

bytes_equal :: proc "contextless" (a, b: [^]u8, n: int) -> bool {
    for i in 0 ..< n {
        if a[i] != b[i] do return false
    }
    return true
}

// ── decompress ────────────────────────────────────────────────────

test_decompress :: proc "contextless" () {
    // RLE: header 0x30 | size << 8, then
    //   0x87 'A'            run of 0x07 + 3 = 10 'A'
    //   0x04 'H' 'e' 'l' 'l' 'o'   0x04 + 1 = 5 literal bytes
    rle := [?]u8{0x30, 15, 0, 0, 0x87, 'A', 0x04, 'H', 'e', 'l', 'l', 'o'}
    want_rle := "AAAAAAAAAAHello"

    type: ctru.decompressType
    size: uint
    header_len := ctru.decompressHeader(&type, &size, nil, &rle[0], len(rle))
    check(header_len == 4 && type == .RLE && size == 15, "decompressHeader reads RLE, 15 bytes")

    out: [32]u8
    ok := ctru.decompress(&out[0], 15, nil, &rle[0], len(rle))
    check(ok && bytes_equal(&out[0], raw_data(want_rle), len(want_rle)), "decompress RLE")

    // LZ10: header 0x10 | size << 8, flag byte 0x10 (4th block is a
    // back-reference), literals 'A' 'B' 'C', then length 9 / distance 3:
    // ((9 - 3) << 4 | (3 - 1) >> 8), (3 - 1) & 0xFF.
    lz := [?]u8{0x10, 12, 0, 0, 0x10, 'A', 'B', 'C', 0x60, 0x02}
    want_lz := "ABCABCABCABC"
    out = {}
    ok = ctru.decompress(&out[0], 12, nil, &lz[0], len(lz))
    check(ok && bytes_equal(&out[0], raw_data(want_lz), len(want_lz)), "decompress LZ10")
}

// ── utf ───────────────────────────────────────────────────────────

test_utf :: proc "contextless" () {
    // "h", e-acute (2 bytes), "llo ", euro sign (3 bytes), then the NUL the
    // converters stop at: 10 bytes, 7 UTF-16 units.
    text_bytes := [?]u8{'h', 0xC3, 0xA9, 'l', 'l', 'o', ' ', 0xE2, 0x82, 0xAC, 0}
    text := &text_bytes[0]
    utf16: [16]u16
    units := ctru.utf8_to_utf16(&utf16[0], text, len(utf16))
    check(units == 7 && utf16[1] == 0x00E9 && utf16[6] == 0x20AC, "utf8_to_utf16")

    back: [16]u8
    n := ctru.utf16_to_utf8(&back[0], &utf16[0], len(back))
    check(n == 10 && bytes_equal(&back[0], cast([^]u8)text, 10), "utf16_to_utf8 round trip")

    code: u32
    euro := [?]u8{0xE2, 0x82, 0xAC, 0}
    consumed := ctru.decode_utf8(&code, &euro[0])
    check(consumed == 3 && code == 0x20AC, "decode_utf8 U+20AC")

    pair: [2]u16
    written := ctru.encode_utf16(&pair[0], 0x1F600)
    check(written == 2 && pair[0] == 0xD83D && pair[1] == 0xDE00, "encode_utf16 surrogate pair")
}

// ── rbtree ────────────────────────────────────────────────────────

// The node comes first, so a ^rbtree_node_t is also a ^Item.
Item :: struct {
    node: ctru.rbtree_node_t,
    key:  i32,
}

compare_items :: proc "c" (lhs, rhs: ^ctru.rbtree_node_t) -> i32 {
    a := (cast(^Item)lhs).key
    b := (cast(^Item)rhs).key
    if a < b do return -1
    if a > b do return 1
    return 0
}

test_rbtree :: proc "contextless" () {
    tree: ctru.rbtree_t
    ctru.rbtree_init(&tree, compare_items)
    check(ctru.rbtree_empty(&tree) != 0, "rbtree_init gives an empty tree")

    items := [5]Item{{key = 5}, {key = 1}, {key = 9}, {key = 3}, {key = 7}}
    for &item in items do ctru.rbtree_insert(&tree, &item.node)
    check(ctru.rbtree_size(&tree) == 5, "rbtree_size == 5")

    lo := cast(^Item)ctru.rbtree_min(&tree)
    hi := cast(^Item)ctru.rbtree_max(&tree)
    check(lo.key == 1 && hi.key == 9, "rbtree_min / rbtree_max")

    probe := Item{key = 3}
    found := cast(^Item)ctru.rbtree_find(&tree, &probe.node)
    check(found == &items[3], "rbtree_find finds 3")
    probe.key = 4
    check(ctru.rbtree_find(&tree, &probe.node) == nil, "rbtree_find misses 4")

    want := [5]i32{1, 3, 5, 7, 9}
    ordered := true
    i := 0
    for node := ctru.rbtree_min(&tree); node != nil; node = ctru.rbtree_node_next(node) {
        if i >= 5 || (cast(^Item)node).key != want[i] do ordered = false
        i += 1
    }
    check(ordered && i == 5, "in-order walk 1 3 5 7 9")
}

// ── font ──────────────────────────────────────────────────────────

test_font :: proc "contextless" () {
    rc := ctru.fontEnsureMapped()
    check(rc >= 0, "fontEnsureMapped")
    font := ctru.fontGetSystemFont()
    check(font != nil, "fontGetSystemFont")
    if font == nil do return

    info := ctru.fontGetInfo(font)
    check(info != nil && info.lineFeed > 0 && info.height > 0, "fontGetInfo line feed / height")
    if info != nil {
        ctru.printf("     lineFeed %d height %d ascent %d\n", i32(info.lineFeed), i32(info.height), i32(info.ascent))
    }

    glyph := ctru.fontGlyphIndexFromCodePoint(font, 'A')
    width := ctru.fontGetCharWidthInfo(font, glyph)
    check(glyph >= 0 && width != nil && width.charWidth > 0, "glyph and width of 'A'")
    if width != nil {
        ctru.printf("     'A' glyph %d charWidth %d\n", glyph, i32(width.charWidth))
    }
}

// ── small helpers ─────────────────────────────────────────────────

test_helpers :: proc "contextless" () {
    check(ctru.htons(0x1234) == 0x3412 && ctru.ntohs(0x3412) == 0x1234, "htons / ntohs")
    check(ctru.htonl(0x11223344) == 0x44332211 && ctru.ntohl(0x44332211) == 0x11223344, "htonl / ntohl")
    check(c2d.C2D_Clamp(2.0, 0.0, 1.0) == 1.0 && c2d.C2D_Clamp(-1.0, 0.0, 1.0) == 0.0, "C2D_Clamp")
    check(c2d.C2D_FloatToU8(0.5) == 128 && c2d.C2D_FloatToU8(2.0) == 255, "C2D_FloatToU8")
    check(c3d.IVec_Pack(1, 2, 3, 4) == 0x04030201, "IVec_Pack")
    check(c3d.FogLut_CalcZ(0.0, 0.5, 25.0) == 25.0 && c3d.FogLut_CalcZ(1.0, 0.5, 25.0) == 0.5, "FogLut_CalcZ ends")
}

// ── matrices ──────────────────────────────────────────────────────

// Logical (x, y, z, w) of a vector; FVec4_New stores them reversed.
vec_is :: proc "contextless" (v: c3d.C3D_FVec, x, y, z, w: f32) -> bool {
    want := c3d.FVec4_New(x, y, z, w)
    return v == want
}

test_matrix :: proc "contextless" () {
    // a: a matrix with no symmetry, so a swapped row or column shows.
    a: c3d.C3D_Mtx
    a.r[0] = c3d.FVec4_New(1, 2, 3, 4)
    a.r[1] = c3d.FVec4_New(5, 6, 7, 8)
    a.r[2] = c3d.FVec4_New(9, 10, 11, 12)
    a.r[3] = c3d.FVec4_New(13, 14, 15, 16)

    id: c3d.C3D_Mtx
    c3d.Mtx_Identity(&id)
    out: c3d.C3D_Mtx
    c3d.Mtx_Multiply(&out, &a, &id)
    check(out == a, "Mtx_Multiply(a, identity) == a")
    c3d.Mtx_Multiply(&out, &id, &a)
    check(out == a, "Mtx_Multiply(identity, a) == a")

    // A translate moves the origin to (1, 2, 3).
    t: c3d.C3D_Mtx
    c3d.Mtx_Identity(&t)
    c3d.Mtx_Translate(&t, 1, 2, 3, true)
    moved := c3d.Mtx_MultiplyFVec4(&t, c3d.FVec4_New(0, 0, 0, 1))
    check(vec_is(moved, 1, 2, 3, 1), "Mtx_Translate + Mtx_MultiplyFVec4")

    // Row 0 of a times (1, 0, 0, 0) is a's first column: (1, 5, 9, 13).
    col := c3d.Mtx_MultiplyFVec4(&a, c3d.FVec4_New(1, 0, 0, 0))
    check(vec_is(col, 1, 5, 9, 13), "Mtx_MultiplyFVec4 picks a column")

    c3d.Mtx_Transpose(&a)
    check(vec_is(a.r[0], 1, 5, 9, 13), "Mtx_Transpose")
}

test_time :: proc "contextless" () {
    t0 := ctru.osGetTime()
    tick0 := ctru.svcGetSystemTick()
    ctru.svcSleepThread(20_000_000) // 20 ms
    t1 := ctru.osGetTime()
    tick1 := ctru.svcGetSystemTick()
    check(t1 - t0 >= 15 && t1 - t0 < 1000, "osGetTime advances ~20 ms")
    check(tick1 > tick0, "svcGetSystemTick advances")
}

@(export, link_name = "odin_main")
utilities_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    ctru.consoleInit(ctru.GFX_TOP, nil)

    ctru.printf("Utilities-Example\n")
    test_decompress()
    test_utf()
    test_rbtree()
    test_font()
    test_helpers()
    test_matrix()
    test_time()
    ctru.printf("\n%d failure(s).  START: exit\n", i32(failures))

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break
        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.gspWaitForEvent(.VBLANK0, true)
    }

    ctru.gfxExit()
    return 0
}
