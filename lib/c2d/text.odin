package c2d

// ============================================================
// Citro2D — text rendering
// Source: citro2d/include/c2d/text.h
// ============================================================
//
// USAGE OVERVIEW
// ─────────────
//  1.  Allocate a text buffer:
//        buf := C2D_TextBufNew(512)   -- 512 glyph slots
//
//  2.  Parse strings into C2D_Text objects (once, outside the loop
//      for static text):
//        text: C2D_Text
//        C2D_TextParse(&text, buf, "Hello, world!")
//        C2D_TextOptimize(&text)      -- optional, improves draw perf
//
//      For per-frame dynamic text, call C2D_TextBufClear(buf) first,
//      then re-parse each frame.
//
//  3.  Draw inside the frame loop:
//        C2D_DrawText(&text, C2D_AlignLeft, x, y, z, scaleX, scaleY)
//        C2D_DrawTextColor(&text, C2D_WithColor, x, y, z, scX, scY, color)
//        C2D_DrawTextWrap(&text, C2D_WordWrap, x, y, z, scX, scY, wrapPx)
//
//  4.  Free when done:
//        C2D_TextBufDelete(buf)
//
// FLAGS (C2D_TextFlags)
// ─────────────────────
//   C2D_AlignLeft      (0)       — left-justified (default)
//   C2D_AlignCenter    (1)       — horizontally centred on x
//   C2D_AlignRight     (2)       — right edge at x
//   C2D_AlignJustified (3)       — justified (multi-word lines)
//   C2D_WithColor      (1 << 2)  — pass u32 color after scaleY
//   C2D_AtBaseline     (1 << 3)  — y is baseline, not top of glyphs
//   C2D_WordWrap       (1 << 4)  — pass f32 wrap width after scaleY
//                                   (or after color if C2D_WithColor)
// ============================================================

foreign import citro2d "system:citro2d"
foreign import c2d_bridge "system:c2d_bridge"

// ── Direct bindings (no float params) ────────────────────────────────────────

@(default_calling_convention = "c")
foreign citro2d {

    // --- Text buffer management ---

    // Allocate a text buffer capable of holding maxGlyphs rendered glyphs.
    // Returns nil on allocation failure.
    C2D_TextBufNew :: proc(maxGlyphs: uint) -> C2D_TextBuf ---

    // Resize an existing text buffer to a new glyph capacity.
    // The old pointer is invalidated; use the returned value.
    C2D_TextBufResize :: proc(buf: C2D_TextBuf, maxGlyphs: uint) -> C2D_TextBuf ---

    // Free a text buffer and all glyphs it owns.
    C2D_TextBufDelete :: proc(buf: C2D_TextBuf) ---

    // Reset the buffer's glyph count to zero (does not free memory).
    // Call before re-parsing text each frame for dynamic strings.
    C2D_TextBufClear :: proc(buf: C2D_TextBuf) ---

    // Return the number of glyphs currently stored in the buffer.
    C2D_TextBufGetNumGlyphs :: proc(buf: C2D_TextBuf) -> uint ---

    // --- Text parsing ---

    // Parse one line of text using the built-in system font.
    // lineNo is used for multi-line layout (start at 0 for the first line).
    // Returns a pointer to the next line of the source string, or nil if done.
    C2D_TextParseLine :: proc(
        text:   ^C2D_Text,
        buf:    C2D_TextBuf,
        str:    cstring,
        lineNo: u32) -> cstring ---

    // Parse one line of text using a loaded custom C2D_Font.
    C2D_TextFontParseLine :: proc(
        text:   ^C2D_Text,
        font:   C2D_Font,
        buf:    C2D_TextBuf,
        str:    cstring,
        lineNo: u32) -> cstring ---

    // Parse an entire string (all lines) using the system font.
    // Internally calls C2D_TextParseLine for each '\n'-delimited segment.
    C2D_TextParse :: proc(text: ^C2D_Text, buf: C2D_TextBuf, str: cstring) ---

    // Parse an entire string using a loaded custom C2D_Font.
    C2D_TextFontParse :: proc(
        text: ^C2D_Text,
        font: C2D_Font,
        buf:  C2D_TextBuf,
        str:  cstring) ---

    // Optimize a parsed text object for repeated drawing.
    // Call once after parsing, before the main render loop.
    C2D_TextOptimize :: proc(text: ^C2D_Text) ---
}

// ── Bridge bindings (float params → bridge.c) ────────────────────────────────

@(default_calling_convention = "c")
foreign c2d_bridge {

    // Query the bounding box of a text object at the given scale.
    // Both outWidth and outHeight may be nil if you don't need that dimension.
    @(link_name = "c2d_text_get_dimensions")
    C2D_TextGetDimensions :: proc(
        text:      ^C2D_Text,
        scaleX:    f32,
        scaleY:    f32,
        outWidth:  ^f32,
        outHeight: ^f32) ---

    // Draw text with no optional varargs (most common case).
    // Use C2D_AlignLeft / C2D_AlignCenter / C2D_AlignRight in flags.
    @(link_name = "c2d_draw_text")
    C2D_DrawText :: proc(
        text:   ^C2D_Text,
        flags:  C2D_TextFlags,
        x, y, z:         f32,
        scaleX, scaleY:  f32) ---

    // Draw text with an explicit RGBA colour.
    // Pass C2D_WithColor (optionally OR'd with an alignment) in flags.
    @(link_name = "c2d_draw_text_color")
    C2D_DrawTextColor :: proc(
        text:   ^C2D_Text,
        flags:  C2D_TextFlags,
        x, y, z:         f32,
        scaleX, scaleY:  f32,
        color:  u32) ---

    // Draw text with automatic word-wrap at wrapWidth pixels.
    // Pass C2D_WordWrap (optionally OR'd with an alignment) in flags.
    @(link_name = "c2d_draw_text_wrap")
    C2D_DrawTextWrap :: proc(
        text:      ^C2D_Text,
        flags:     C2D_TextFlags,
        x, y, z:          f32,
        scaleX, scaleY:   f32,
        wrapWidth: f32) ---

    // Draw text with both a colour and word-wrap.
    // Pass C2D_WithColor | C2D_WordWrap (+ optional alignment) in flags.
    // The color argument is read before wrapWidth by citro2d.
    @(link_name = "c2d_draw_text_color_wrap")
    C2D_DrawTextColorWrap :: proc(
        text:      ^C2D_Text,
        flags:     C2D_TextFlags,
        x, y, z:          f32,
        scaleX, scaleY:   f32,
        color:     u32,
        wrapWidth: f32) ---
}

// ── Short aliases (strip C2D_ prefix) ──────────────────────────────────────
TextBufNew           :: C2D_TextBufNew
TextBufResize        :: C2D_TextBufResize
TextBufDelete        :: C2D_TextBufDelete
TextBufClear         :: C2D_TextBufClear
TextBufGetNumGlyphs  :: C2D_TextBufGetNumGlyphs
TextParseLine        :: C2D_TextParseLine
TextFontParseLine    :: C2D_TextFontParseLine
TextParse            :: C2D_TextParse
TextFontParse        :: C2D_TextFontParse
TextOptimize         :: C2D_TextOptimize
TextGetDimensions    :: C2D_TextGetDimensions
DrawText             :: C2D_DrawText
DrawTextColor        :: C2D_DrawTextColor
DrawTextWrap         :: C2D_DrawTextWrap
DrawTextColorWrap    :: C2D_DrawTextColorWrap
