package c2d

// ============================================================
// Citro2D — font loading and glyph metrics
// Source: citro2d/include/c2d/font.h
// ============================================================

// CFG_Region — 3DS system region identifiers.
// Passed to C2D_FontLoadSystem to select which region's system font to load.
CFG_Region :: enum u32 {
    JPN = 0,
    USA = 1,
    EUR = 2,
    AUS = 3,
    CHN = 4,
    KOR = 5,
    TWN = 6,
}

// GPU texture filter constants (used with C2D_FontSetFilter).
GPU_TEXTURE_FILTER_NEAREST :: u32(0x0)
GPU_TEXTURE_FILTER_LINEAR  :: u32(0x1)

foreign import citro2d   "system:citro2d"
foreign import c2d_bridge "system:c2d_bridge"

// ---- Direct foreign bindings (no float parameters) ----

@(default_calling_convention = "c")
foreign citro2d {
    // Load a .bcfnt font file from a romfs path.
    @(link_name = "C2D_FontLoad")
    C2D_FontLoad :: proc(filename: cstring) -> C2D_Font ---

    // Load a .bcfnt font from a memory buffer.
    @(link_name = "C2D_FontLoadFromMem")
    C2D_FontLoadFromMem :: proc(data: rawptr, size: uint) -> C2D_Font ---

    // Load a .bcfnt font from an open file descriptor.
    @(link_name = "C2D_FontLoadFromFD")
    C2D_FontLoadFromFD :: proc(fd: i32) -> C2D_Font ---

    // Load a .bcfnt font from an open FILE* handle.
    @(link_name = "C2D_FontLoadFromHandle")
    C2D_FontLoadFromHandle :: proc(f: rawptr) -> C2D_Font --- // FILE*

    // Load the 3DS system font for a given region (e.g. CFG_Region.USA).
    // The returned handle can be passed to C2D_TextFontParse / C2D_TextFontParseLine.
    // Call C2D_FontFree when done to release memory.
    @(link_name = "C2D_FontLoadSystem")
    C2D_FontLoadSystem :: proc(region: CFG_Region) -> C2D_Font ---

    // Free a font loaded with any of the above load functions.
    @(link_name = "C2D_FontFree")
    C2D_FontFree :: proc(font: C2D_Font) ---

    // Set the magnification / minification filter for the font's texture atlas.
    // magFilter / minFilter: GPU_TEXTURE_FILTER_NEAREST or GPU_TEXTURE_FILTER_LINEAR.
    @(link_name = "C2D_FontSetFilter")
    C2D_FontSetFilter :: proc(font: C2D_Font, magFilter: u32, minFilter: u32) ---

    // Return the internal glyph index for a Unicode code point.
    // Returns -1 if the glyph is absent from the font.
    @(link_name = "C2D_FontGlyphIndexFromCodePoint")
    C2D_FontGlyphIndexFromCodePoint :: proc(font: C2D_Font, codepoint: u32) -> i32 ---

    // Return a pointer to the charWidthInfo_s for a given glyph index.
    // Cast the rawptr to charWidthInfo_s* as defined in <3ds/font.h>.
    @(link_name = "C2D_FontGetCharWidthInfo")
    C2D_FontGetCharWidthInfo :: proc(font: C2D_Font, glyphIndex: i32) -> rawptr ---

    // Return a pointer to the font's FINF_s header block.
    // Cast the rawptr to FINF_s* as defined in <3ds/font.h>.
    @(link_name = "C2D_FontGetInfo")
    C2D_FontGetInfo :: proc(font: C2D_Font) -> rawptr ---
}

// ---- ABI bridge binding (float parameters) ----

@(default_calling_convention = "c")
foreign c2d_bridge {
    // Calculate the screen-space position and UV coords of a single glyph.
    // out: pointer to a fontGlyphPos_s (from <3ds/font.h>) — pass as rawptr.
    // flags: 0 = normal, 1 = no scaling, 2 = use generic advance width.
    @(link_name = "c2d_font_calc_glyph_pos")
    C2D_FontCalcGlyphPos :: proc(
        font:       C2D_Font,
        out:        rawptr,   // ^fontGlyphPos_s
        glyphIndex: i32,
        flags:      u32,
        scaleX:     f32,
        scaleY:     f32) ---
}

// ── Short aliases (strip C2D_ prefix) ──────────────────────────────────────
FontLoad                   :: C2D_FontLoad
FontLoadFromMem            :: C2D_FontLoadFromMem
FontLoadFromFD             :: C2D_FontLoadFromFD
FontLoadFromHandle         :: C2D_FontLoadFromHandle
FontLoadSystem             :: C2D_FontLoadSystem
FontFree                   :: C2D_FontFree
FontSetFilter              :: C2D_FontSetFilter
FontGlyphIndexFromCodePoint :: C2D_FontGlyphIndexFromCodePoint
FontGetCharWidthInfo       :: C2D_FontGetCharWidthInfo
FontGetInfo                :: C2D_FontGetInfo
FontCalcGlyphPos           :: C2D_FontCalcGlyphPos
