package c2d

// ============================================================
// Citro2D — font loading and glyph metrics
// Source: citro2d/include/c2d/font.h
//
// TODO (Phase 4): Implement these bindings.
//
// Direct foreign bindings needed (no float params):
//   C2D_FontLoad(filename: cstring) -> C2D_Font
//   C2D_FontLoadFromMem(data: rawptr, size: uint) -> C2D_Font
//   C2D_FontLoadFromFD(fd: i32) -> C2D_Font
//   C2D_FontLoadFromHandle(f: rawptr) -> C2D_Font    // FILE*
//   C2D_FontLoadSystem(region: u32) -> C2D_Font      // CFG_Region
//   C2D_FontFree(font: C2D_Font)
//   C2D_FontSetFilter(font: C2D_Font, magFilter: u32, minFilter: u32)
//   C2D_FontGlyphIndexFromCodePoint(font: C2D_Font, codepoint: u32) -> i32
//   C2D_FontGetCharWidthInfo(font: C2D_Font, glyphIndex: i32) -> rawptr  // charWidthInfo_s*
//   C2D_FontGetInfo(font: C2D_Font) -> rawptr                            // FINF_s*
//
// ABI bridge wrappers needed (float params):
//   c2d_font_calc_glyph_pos(font, out, glyphIndex, flags, scaleX, scaleY)
//     -> C2D_FontCalcGlyphPos(font: C2D_Font, out: rawptr, glyphIndex: i32,
//                             flags: u32, scaleX, scaleY: f32)
// ============================================================
