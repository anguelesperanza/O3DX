package c2d

// ============================================================
// Citro2D — sprite helper functions
// Source: citro2d/include/c2d/sprite.h
//
// Every function in sprite.h is static inline in C, so NONE have
// exported linker symbols.  All of them must go through bridge
// wrappers in lib/c2d/bridge.c.
//
// C2D_DrawSprite and C2D_DrawSpriteTinted are already declared in
// base.odin — they are NOT static inline and call into citro2d
// directly.
// ============================================================

foreign import c2d_bridge "system:c2d_bridge"

@(default_calling_convention = "c")
foreign c2d_bridge {

    // ---- Drawing (static inline — forward to C2D_DrawImage internally) ----

    // Draw a sprite using its stored position, scale, rotation, and depth.
    @(link_name = "c2d_draw_sprite")
    C2D_DrawSprite :: proc(sprite: ^C2D_Sprite) -> bool ---

    // Draw a sprite with an image tint applied.
    @(link_name = "c2d_draw_sprite_tinted")
    C2D_DrawSpriteTinted :: proc(sprite: ^C2D_Sprite, tint: ^C2D_ImageTint) -> bool ---

    // ---- Sprite initialisation ----

    // Initialise a sprite from a standalone C2D_Image.
    // Sets pivot to top-left (0,0), position to (0,0), rotation to 0,
    // depth to 0, and dimensions from the image's subtexture.
    @(link_name = "c2d_sprite_from_image")
    C2D_SpriteFromImage :: proc(sprite: ^C2D_Sprite, image: C2D_Image) ---

    // Initialise a sprite from the image at 'index' inside a sprite sheet.
    // Equivalent to: C2D_SpriteFromImage(sprite, C2D_SpriteSheetGetImage(sheet, index))
    @(link_name = "c2d_sprite_from_sheet")
    C2D_SpriteFromSheet :: proc(sprite: ^C2D_Sprite, sheet: C2D_SpriteSheet, index: uint) ---

    // ---- Transform setters (absolute) ----

    // Set the sprite's screen position (top-left corner or pivot, in pixels).
    @(link_name = "c2d_sprite_set_pos")
    C2D_SpriteSetPos :: proc(sprite: ^C2D_Sprite, x, y: f32) ---

    // Set the sprite's scale.  1.0 = original size.
    @(link_name = "c2d_sprite_set_scale")
    C2D_SpriteSetScale :: proc(sprite: ^C2D_Sprite, x, y: f32) ---

    // Set the rotation pivot as a fraction of the sprite dimensions.
    // (0.0, 0.0) = top-left  (0.5, 0.5) = centre  (1.0, 1.0) = bottom-right.
    @(link_name = "c2d_sprite_set_center")
    C2D_SpriteSetCenter :: proc(sprite: ^C2D_Sprite, x, y: f32) ---

    // Set the rotation pivot in raw pixel offsets from the top-left corner.
    @(link_name = "c2d_sprite_set_center_raw")
    C2D_SpriteSetCenterRaw :: proc(sprite: ^C2D_Sprite, x, y: f32) ---

    // Set the rotation angle in radians (replaces current value).
    @(link_name = "c2d_sprite_set_rotation")
    C2D_SpriteSetRotation :: proc(sprite: ^C2D_Sprite, radians: f32) ---

    // Set the rotation angle in degrees (replaces current value).
    @(link_name = "c2d_sprite_set_rotation_degrees")
    C2D_SpriteSetRotationDegrees :: proc(sprite: ^C2D_Sprite, degrees: f32) ---

    // Set the Z-depth (draw order).  0.0 = front, 1.0 = back.
    @(link_name = "c2d_sprite_set_depth")
    C2D_SpriteSetDepth :: proc(sprite: ^C2D_Sprite, depth: f32) ---

    // ---- Transform modifiers (delta / relative) ----

    // Translate the sprite by (dx, dy) pixels.
    @(link_name = "c2d_sprite_move")
    C2D_SpriteMove :: proc(sprite: ^C2D_Sprite, dx, dy: f32) ---

    // Multiply the current scale by (sx, sy).
    @(link_name = "c2d_sprite_scale")
    C2D_SpriteScale :: proc(sprite: ^C2D_Sprite, sx, sy: f32) ---

    // Add 'radians' to the current rotation angle.
    @(link_name = "c2d_sprite_rotate")
    C2D_SpriteRotate :: proc(sprite: ^C2D_Sprite, radians: f32) ---

    // Add 'degrees' to the current rotation angle.
    @(link_name = "c2d_sprite_rotate_degrees")
    C2D_SpriteRotateDegrees :: proc(sprite: ^C2D_Sprite, degrees: f32) ---
}

// ── Short aliases (strip C2D_ prefix) ──────────────────────────────────────
DrawSprite               :: C2D_DrawSprite
DrawSpriteTinted         :: C2D_DrawSpriteTinted
SpriteFromImage          :: C2D_SpriteFromImage
SpriteFromSheet          :: C2D_SpriteFromSheet
SpriteSetPos             :: C2D_SpriteSetPos
SpriteSetScale           :: C2D_SpriteSetScale
SpriteSetCenter          :: C2D_SpriteSetCenter
SpriteSetCenterRaw       :: C2D_SpriteSetCenterRaw
SpriteSetRotation        :: C2D_SpriteSetRotation
SpriteSetRotationDegrees :: C2D_SpriteSetRotationDegrees
SpriteSetDepth           :: C2D_SpriteSetDepth
SpriteMove               :: C2D_SpriteMove
SpriteScale              :: C2D_SpriteScale
SpriteRotate             :: C2D_SpriteRotate
SpriteRotateDegrees      :: C2D_SpriteRotateDegrees
