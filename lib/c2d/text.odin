package c2d

// ============================================================
// Citro2D — text rendering
// Source: citro2d/include/c2d/text.h
//
// TODO (Phase 3): Implement these bindings.
//
// Direct foreign bindings needed (no float params):
//   C2D_TextBufNew(maxGlyphs: uint) -> C2D_TextBuf
//   C2D_TextBufResize(buf: C2D_TextBuf, maxGlyphs: uint) -> C2D_TextBuf
//   C2D_TextBufDelete(buf: C2D_TextBuf)
//   C2D_TextBufClear(buf: C2D_TextBuf)
//   C2D_TextBufGetNumGlyphs(buf: C2D_TextBuf) -> uint
//   C2D_TextParseLine(text: ^C2D_Text, buf: C2D_TextBuf, str: cstring, lineNo: u32) -> cstring
//   C2D_TextFontParseLine(text: ^C2D_Text, font: C2D_Font, buf: C2D_TextBuf, str: cstring, lineNo: u32) -> cstring
//   C2D_TextParse(text: ^C2D_Text, buf: C2D_TextBuf, str: cstring) -> cstring
//   C2D_TextFontParse(text: ^C2D_Text, font: C2D_Font, buf: C2D_TextBuf, str: cstring) -> cstring
//   C2D_TextOptimize(text: ^C2D_Text)
//
// ABI bridge wrappers needed (float params):
//   c2d_text_get_dimensions(text, scaleX, scaleY, outW, outH)
//     -> C2D_TextGetDimensions(text: ^C2D_Text, scaleX, scaleY: f32, outW, outH: ^f32)
//   c2d_draw_text(text, flags, x, y, z, scaleX, scaleY, ...)
//     -> C2D_DrawText(text: ^C2D_Text, flags: u32, x, y, z, scaleX, scaleY: f32, ...)
//        varargs: optional u32 color (with C2D_WithColor flag)
//                 optional f32 wrapWidth (with C2D_WordWrap flag)
// ============================================================
