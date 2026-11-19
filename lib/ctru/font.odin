package ctru

// ============================================================
// System font
// 3ds/font.h
//
// The shared system font: glyph information and the texture sheets it is drawn from. citro2d's
// C2D_Font wraps this; use these to read the font directly.
// ============================================================

charWidthInfo_s :: struct {
    left:       i8, // Horizontal offset to draw the glyph with.
    glyphWidth: u8, // Width of the glyph.
    charWidth:  u8, // Width of the character, that is, horizontal distance to advance.
}

// Font texture sheet information.
TGLP_s :: struct {
    cellWidth:    u8, // Width of a glyph cell.
    cellHeight:   u8, // Height of a glyph cell.
    baselinePos:  u8, // Vertical position of the baseline.
    maxCharWidth: u8, // Maximum character width.
    sheetSize:    u32, // Size in bytes of a texture sheet.
    nSheets:      u16, // Number of texture sheets.
    sheetFmt:     u16, // GPU texture format (GPU_TEXCOLOR).
    nRows:        u16, // Number of glyphs per row per sheet.
    nLines:       u16, // Number of glyph rows per sheet.
    sheetWidth:   u16, // Texture sheet width.
    sheetHeight:  u16, // Texture sheet height.
    sheetData:    ^u8, // Pointer to texture sheet data.
}

// Font character width information block type.
CWDH_s :: tag_CWDH_s

// Font character width information block structure.
tag_CWDH_s :: struct {
    startIndex: u16, // First Unicode codepoint the block applies to.
    endIndex:   u16, // Last Unicode codepoint the block applies to.
    next:       ^CWDH_s, // Pointer to the next block.
    widths:     [0]charWidthInfo_s, // Table of character width information structures.
}

// Font character map methods.
CMAP_TYPE_DIRECT :: 0 // Identity mapping.
CMAP_TYPE_TABLE  :: 1 // Mapping using a table.
CMAP_TYPE_SCAN   :: 2 // Mapping using a list of mapped characters.

// Font character map type.
CMAP_s :: tag_CMAP_s

// Font character map structure.
// Opaque here: the C type has a nested struct/union. 16 bytes.
tag_CMAP_s :: struct #align(4) {
    _: [16]u8,
}

// Font information structure.
FINF_s :: struct {
    signature:      u32, // Signature (FINF).
    sectionSize:    u32, // Section size.
    fontType:       u8, // Font type
    lineFeed:       u8, // Line feed vertical distance.
    alterCharIndex: u16, // Glyph index of the replacement character.
    defaultWidth:   charWidthInfo_s, // Default character width information.
    encoding:       u8, // Font encoding (?)
    tglp:           ^TGLP_s, // Pointer to texture sheet information.
    cwdh:           ^CWDH_s, // Pointer to the first character width information block.
    cmap:           ^CMAP_s, // Pointer to the first character map.
    height:         u8, // Font height.
    width:          u8, // Font width.
    ascent:         u8, // Font ascent.
    padding:        u8,
}

// Font structure.
CFNT_s :: struct {
    signature:  u32, // Signature (CFNU).
    endianness: u16, // Endianness constant (0xFEFF).
    headerSize: u16, // Header size.
    version:    u32, // Format version.
    fileSize:   u32, // File size.
    nBlocks:    u32, // Number of blocks.
    finf:       FINF_s, // Font information.
}

// Font glyph position structure.
// Opaque here: the C type has a nested struct/union. 48 bytes.
fontGlyphPos_s :: struct #align(4) {
    _: [48]u8,
}

// Flags for use with fontCalcGlyphPos.
GLYPH_POS_CALC_VTXCOORD :: 1 // Calculates vertex coordinates in addition to texture coordinates.
GLYPH_POS_AT_BASELINE   :: 2 // Position the glyph at the baseline instead of at the top-left corner.
GLYPH_POS_Y_POINTS_UP   :: 4 // Indicates that the Y axis points up instead of down.

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    fontEnsureMapped :: proc() -> Result ---

    // Fixes the pointers internal to a just-loaded font
    fontFixPointers :: proc(font: ^CFNT_s) ---

    // Retrieves the glyph index of the specified Unicode codepoint.
    fontGlyphIndexFromCodePoint :: proc(font: ^CFNT_s, codePoint: u32) -> i32 ---

    // Retrieves character width information of the specified glyph.
    fontGetCharWidthInfo :: proc(font: ^CFNT_s, glyphIndex: i32) -> ^charWidthInfo_s ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Gets the currently loaded system font
    @(link_name = "ctru_font_get_system_font")
    fontGetSystemFont :: proc() -> ^CFNT_s ---

    // Retrieves the font information structure of a font.
    @(link_name = "ctru_font_get_info")
    fontGetInfo :: proc(font: ^CFNT_s) -> ^FINF_s ---

    // Retrieves the texture sheet information of a font.
    @(link_name = "ctru_font_get_glyph_info")
    fontGetGlyphInfo :: proc(font: ^CFNT_s) -> ^TGLP_s ---

    // Retrieves the pointer to texture data for the specified texture sheet.
    @(link_name = "ctru_font_get_glyph_sheet_tex")
    fontGetGlyphSheetTex :: proc(font: ^CFNT_s, sheetIndex: i32) -> rawptr ---

    // Calculates position information for the specified glyph.
    @(link_name = "ctru_font_calc_glyph_pos")
    fontCalcGlyphPos :: proc(out: ^fontGlyphPos_s, font: ^CFNT_s, glyphIndex: i32, flags: u32, scaleX: f32, scaleY: f32) ---
}
