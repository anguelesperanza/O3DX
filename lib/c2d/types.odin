package c2d

// ============================================================
// Citro2D type definitions
// ============================================================

// ----------------------------------------
// citro2d constants
// ----------------------------------------

C2D_DEFAULT_MAX_OBJECTS :: u32(4096)

// ----------------------------------------
// Citro3D types used by Citro2D
//
// C3D_Tex and Tex3DS_SubTexture are defined here as opaque / simple
// value types so that lib/c2d has no hard dependency on lib/c3d.
// The full structural definitions live in lib/c3d/types.odin; both
// represent the identical memory layout.
// ----------------------------------------

// C3D_Tex — opaque 24-byte block matching sizeof(C3D_Tex) on ARM32.
// Never access fields directly from Odin; always pass by pointer to C.
C3D_Tex :: [24]u8

// Tex3DS_SubTexture — UV region within a C3D_Tex used by citro2d.
// Fields must match the C layout exactly (packed u16 + four f32).
Tex3DS_SubTexture :: struct #packed {
    width, height:       u16,
    left, top, right, bottom: f32,
}

// ----------------------------------------
// Core image type
// ----------------------------------------

// C2D_Image — a texture region ready to draw.
// tex and subtex are rawptr so examples can assign &C3D_Tex and
// &Tex3DS_SubTexture without a cross-package type dependency.
C2D_Image :: struct {
    tex:    rawptr, // ^C3D_Tex
    subtex: rawptr, // ^Tex3DS_SubTexture
}

// ----------------------------------------
// Tint types  (Phase 2)
// ----------------------------------------

// C2D_Corner — corner index used with C2D_ImageTint.
C2D_Corner :: enum u32 {
    TopLeft  = 0,
    TopRight = 1,
    BotLeft  = 2,
    BotRight = 3,
}

// C2D_Tint — per-corner color tint.
// color: packed RGBA8 color to blend.
// blend: blending strength [0.0 = no tint, 1.0 = full tint].
C2D_Tint :: struct {
    color: u32,
    blend: f32,
}

// C2D_ImageTint — one C2D_Tint for each corner of an image.
C2D_ImageTint :: struct {
    corners: [4]C2D_Tint,
}

// ----------------------------------------
// Draw params  (Phase 2)
// ----------------------------------------

// C2D_DrawParams — full transform description for C2D_DrawImage.
// pos:    top-left position in screen space.
// dims:   width and height in pixels.
// center: rotation pivot, normalized [0,1] relative to dims.
// depth:  Z-depth for ordering.
// angle:  rotation in radians.
C2D_DrawParams :: struct {
    pos:    struct { x, y: f32 },
    dims:   struct { w, h: f32 },
    center: struct { x, y: f32 },
    depth:  f32,
    angle:  f32,
}

// ----------------------------------------
// Text / font types  (Phase 3 / 4)
// ----------------------------------------

// C2D_TextBuf — opaque handle to a glyph buffer allocated on the heap.
C2D_TextBuf :: rawptr

// C2D_Font — opaque handle to a loaded .bcfnt font.
C2D_Font :: rawptr

// C2D_Text — a parsed text object referencing a C2D_TextBuf.
// Layout mirrors the C struct; fields are read-only from Odin.
C2D_Text :: struct {
    buf:   C2D_TextBuf,
    begin: uint,
    end:   uint,
    width: f32,
    lines: u32,
    words: u32,
    font:  C2D_Font,
}

// C2D_TextFlags — bitfield passed to C2D_DrawText.
C2D_TextFlags :: distinct u32

// Alignment — bits 2-3 (BIT(2) must be set to activate, low bits select kind).
// AlignLeft is 0 (no bit set = default left).
C2D_AlignLeft      :: C2D_TextFlags(0 << 2) // = 0  left-justify (default)
C2D_AlignRight     :: C2D_TextFlags(1 << 2) // = 4  right edge at x
C2D_AlignCenter    :: C2D_TextFlags(2 << 2) // = 8  centred on x
C2D_AlignJustified :: C2D_TextFlags(3 << 2) // = 12 justified
// Modifier flags
C2D_AtBaseline     :: C2D_TextFlags(1 << 0) // = 1  y is baseline, not top
C2D_WithColor      :: C2D_TextFlags(1 << 1) // = 2  pass u32 color as extra arg
C2D_WordWrap       :: C2D_TextFlags(1 << 4) // = 16 pass f32 wrap width as extra arg

// ----------------------------------------
// Sprite types  (Phase 4)
// ----------------------------------------

// C2D_SpriteSheet — opaque handle to a loaded .t3x sprite sheet.
C2D_SpriteSheet :: rawptr

// C2D_Sprite — position + image bundled together.
C2D_Sprite :: struct {
    image:  C2D_Image,
    params: C2D_DrawParams,
}

// ----------------------------------------
// Tint mode  (Phase 2)
// ----------------------------------------

C2D_TintMode :: enum u32 {
    Solid = 0,
    Mult  = 1,
    Luma  = 2,
}

// ── Short aliases (strip C2D_ prefix) ──────────────────────────────────────

// Constants
DEFAULT_MAX_OBJECTS :: C2D_DEFAULT_MAX_OBJECTS

// Core image type
Image          :: C2D_Image

// Tint types
Corner         :: C2D_Corner
Tint           :: C2D_Tint
ImageTint      :: C2D_ImageTint

// Draw params
DrawParams     :: C2D_DrawParams

// Text / font types
TextBuf        :: C2D_TextBuf
Font           :: C2D_Font
Text           :: C2D_Text
TextFlags      :: C2D_TextFlags

AlignLeft      :: C2D_AlignLeft
AlignRight     :: C2D_AlignRight
AlignCenter    :: C2D_AlignCenter
AlignJustified :: C2D_AlignJustified
AtBaseline     :: C2D_AtBaseline
WithColor      :: C2D_WithColor
WordWrap       :: C2D_WordWrap

// Sprite types
SpriteSheet    :: C2D_SpriteSheet
Sprite         :: C2D_Sprite

// Tint mode
TintMode       :: C2D_TintMode
