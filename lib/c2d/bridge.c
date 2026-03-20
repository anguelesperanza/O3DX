// lib/c2d/bridge.c
//
// ABI bridge: soft-float Odin → hard-float citro2d.
//
// The 3DS toolchain uses hard-float ABI; Odin targets soft-float.
// Any citro2d function that takes a float directly (not inside a struct)
// cannot be called from Odin without a bridge.  Each wrapper here:
//   1. Receives the float arguments as uint32_t (integer registers).
//   2. Reinterprets them with u2f() to recover the original bit-pattern.
//   3. Calls the real citro2d function with proper float args.
//
// Functions that return float wrap the result with f2u() so the bits
// land in r0 where soft-float Odin expects them.

#include <citro2d.h>
#include <string.h>
#include "../bridge_utils.h"

// ----------------------------------------------------------------
// Scene
// C2D_SceneBegin is a macro / static inline in some versions.
// ----------------------------------------------------------------

void c2d_scene_begin(C3D_RenderTarget* target) {
    C2D_SceneBegin(target);
}

// ----------------------------------------------------------------
// Shape drawing
// ----------------------------------------------------------------

bool c2d_draw_triangle(
    uint32_t ax, uint32_t ay, uint32_t clr0,
    uint32_t bx, uint32_t by, uint32_t clr1,
    uint32_t cx, uint32_t cy, uint32_t clr2,
    uint32_t depth)
{
    return C2D_DrawTriangle(
        u2f(ax), u2f(ay), clr0,
        u2f(bx), u2f(by), clr1,
        u2f(cx), u2f(cy), clr2,
        u2f(depth));
}

bool c2d_draw_line(
    uint32_t x0, uint32_t y0, uint32_t clr0,
    uint32_t x1, uint32_t y1, uint32_t clr1,
    uint32_t thickness, uint32_t depth)
{
    return C2D_DrawLine(
        u2f(x0), u2f(y0), clr0,
        u2f(x1), u2f(y1), clr1,
        u2f(thickness), u2f(depth));
}

bool c2d_draw_rectangle(
    uint32_t x, uint32_t y, uint32_t z, uint32_t w, uint32_t h,
    uint32_t clr0, uint32_t clr1, uint32_t clr2, uint32_t clr3)
{
    return C2D_DrawRectangle(
        u2f(x), u2f(y), u2f(z), u2f(w), u2f(h),
        clr0, clr1, clr2, clr3);
}

bool c2d_draw_rect_solid(
    uint32_t x, uint32_t y, uint32_t z, uint32_t w, uint32_t h,
    uint32_t clr)
{
    return C2D_DrawRectSolid(u2f(x), u2f(y), u2f(z), u2f(w), u2f(h), clr);
}

bool c2d_draw_ellipse(
    uint32_t x, uint32_t y, uint32_t z, uint32_t w, uint32_t h,
    uint32_t clr0, uint32_t clr1, uint32_t clr2, uint32_t clr3)
{
    return C2D_DrawEllipse(
        u2f(x), u2f(y), u2f(z), u2f(w), u2f(h),
        clr0, clr1, clr2, clr3);
}

bool c2d_draw_ellipse_solid(
    uint32_t x, uint32_t y, uint32_t z, uint32_t w, uint32_t h,
    uint32_t clr)
{
    return C2D_DrawEllipseSolid(u2f(x), u2f(y), u2f(z), u2f(w), u2f(h), clr);
}

bool c2d_draw_circle(
    uint32_t x, uint32_t y, uint32_t z, uint32_t radius,
    uint32_t clr0, uint32_t clr1, uint32_t clr2, uint32_t clr3)
{
    return C2D_DrawCircle(
        u2f(x), u2f(y), u2f(z), u2f(radius),
        clr0, clr1, clr2, clr3);
}

bool c2d_draw_circle_solid(
    uint32_t x, uint32_t y, uint32_t z, uint32_t radius, uint32_t clr)
{
    return C2D_DrawCircleSolid(u2f(x), u2f(y), u2f(z), u2f(radius), clr);
}

// ----------------------------------------------------------------
// Image drawing
// C2D_DrawImageAt: struct-by-value arg followed by hard-float params.
// ----------------------------------------------------------------

bool c2d_draw_image_at(
    C2D_Image img,
    uint32_t x, uint32_t y, uint32_t depth,
    const C2D_ImageTint* tint,
    uint32_t scaleX, uint32_t scaleY)
{
    return C2D_DrawImageAt(
        img,
        u2f(x), u2f(y), u2f(depth),
        tint,
        u2f(scaleX), u2f(scaleY));
}

bool c2d_draw_image_at_rotated(
    C2D_Image img,
    uint32_t x, uint32_t y, uint32_t depth,
    uint32_t angle,
    const C2D_ImageTint* tint,
    uint32_t scaleX, uint32_t scaleY)
{
    return C2D_DrawImageAtRotated(
        img,
        u2f(x), u2f(y), u2f(depth),
        u2f(angle),
        tint,
        u2f(scaleX), u2f(scaleY));
}

// ----------------------------------------------------------------
// View transforms
// ----------------------------------------------------------------

void c2d_view_translate(uint32_t x, uint32_t y) {
    C2D_ViewTranslate(u2f(x), u2f(y));
}

void c2d_view_rotate(uint32_t rotation) {
    C2D_ViewRotate(u2f(rotation));
}

void c2d_view_rotate_degrees(uint32_t rotation) {
    C2D_ViewRotateDegrees(u2f(rotation));
}

void c2d_view_shear(uint32_t x, uint32_t y) {
    C2D_ViewShear(u2f(x), u2f(y));
}

void c2d_view_scale(uint32_t x, uint32_t y) {
    C2D_ViewScale(u2f(x), u2f(y));
}

// ----------------------------------------------------------------
// Color helpers
// ----------------------------------------------------------------

uint32_t c2d_color32f(uint32_t r, uint32_t g, uint32_t b, uint32_t a) {
    return C2D_Color32f(u2f(r), u2f(g), u2f(b), u2f(a));
}

// ----------------------------------------------------------------
// Tint helpers
// ----------------------------------------------------------------

void c2d_plain_image_tint(C2D_ImageTint* tint, uint32_t color, uint32_t blend) {
    C2D_PlainImageTint(tint, color, u2f(blend));
}

void c2d_alpha_image_tint(C2D_ImageTint* tint, uint32_t alpha) {
    C2D_AlphaImageTint(tint, u2f(alpha));
}

void c2d_set_image_tint(C2D_ImageTint* tint, C2D_Corner corner, uint32_t color, uint32_t blend) {
    C2D_SetImageTint(tint, corner, color, u2f(blend));
}

void c2d_top_image_tint(C2D_ImageTint* tint, uint32_t color, uint32_t blend) {
    C2D_TopImageTint(tint, color, u2f(blend));
}

void c2d_bottom_image_tint(C2D_ImageTint* tint, uint32_t color, uint32_t blend) {
    C2D_BottomImageTint(tint, color, u2f(blend));
}

void c2d_left_image_tint(C2D_ImageTint* tint, uint32_t color, uint32_t blend) {
    C2D_LeftImageTint(tint, color, u2f(blend));
}

void c2d_right_image_tint(C2D_ImageTint* tint, uint32_t color, uint32_t blend) {
    C2D_RightImageTint(tint, color, u2f(blend));
}

// ----------------------------------------------------------------
// Text rendering (Phase 3)
//
// C2D_DrawText is a variadic C function.  On ARM32, the AAPCS-VFP
// spec requires that variadic functions are called using the base
// AAPCS — ALL arguments (including the named floats before '...')
// are passed through GP registers.  Odin soft-float also puts f32
// bit-patterns in GP registers, so they naturally match.
//
// We still use bridge wrappers here for two reasons:
//   1. We need distinct entry points for each call form (no extra
//      varargs / with-color / with-wrap / with-both).
//   2. The wrapWidth vararg is a float that citro2d reads back with
//      va_arg(ap, double), so we must promote it to double when
//      forwarding from the bridge.
// ----------------------------------------------------------------

void c2d_text_get_dimensions(
    const C2D_Text* text,
    uint32_t scaleX, uint32_t scaleY,
    float* outWidth, float* outHeight)
{
    C2D_TextGetDimensions(text, u2f(scaleX), u2f(scaleY), outWidth, outHeight);
}

// Basic draw — no optional varargs.
void c2d_draw_text(
    const C2D_Text* text, uint32_t flags,
    uint32_t x, uint32_t y, uint32_t z,
    uint32_t scaleX, uint32_t scaleY)
{
    C2D_DrawText(text, flags,
        u2f(x), u2f(y), u2f(z),
        u2f(scaleX), u2f(scaleY));
}

// Draw with explicit colour (C2D_WithColor flag).
// color is u32 — already an integer, no conversion needed.
void c2d_draw_text_color(
    const C2D_Text* text, uint32_t flags,
    uint32_t x, uint32_t y, uint32_t z,
    uint32_t scaleX, uint32_t scaleY,
    uint32_t color)
{
    C2D_DrawText(text, flags,
        u2f(x), u2f(y), u2f(z),
        u2f(scaleX), u2f(scaleY),
        color);
}

// Draw with word-wrap (C2D_WordWrap flag).
// citro2d reads wrapWidth with va_arg(ap, double), so promote here.
void c2d_draw_text_wrap(
    const C2D_Text* text, uint32_t flags,
    uint32_t x, uint32_t y, uint32_t z,
    uint32_t scaleX, uint32_t scaleY,
    uint32_t wrapWidth)
{
    C2D_DrawText(text, flags,
        u2f(x), u2f(y), u2f(z),
        u2f(scaleX), u2f(scaleY),
        (double)u2f(wrapWidth));
}

// Draw with both colour and word-wrap (C2D_WithColor | C2D_WordWrap).
// citro2d reads color first, then wrapWidth.
void c2d_draw_text_color_wrap(
    const C2D_Text* text, uint32_t flags,
    uint32_t x, uint32_t y, uint32_t z,
    uint32_t scaleX, uint32_t scaleY,
    uint32_t color, uint32_t wrapWidth)
{
    C2D_DrawText(text, flags,
        u2f(x), u2f(y), u2f(z),
        u2f(scaleX), u2f(scaleY),
        color,
        (double)u2f(wrapWidth));
}

// ----------------------------------------------------------------
// Font (Phase 4)
// C2D_FontCalcGlyphPos takes float scaleX, scaleY.
// fontGlyphPos_s is defined in <3ds/font.h>, included via <citro2d.h>.
// ----------------------------------------------------------------

void c2d_font_calc_glyph_pos(
    C2D_Font font, fontGlyphPos_s* out, int glyphIndex,
    uint32_t flags, uint32_t scaleX, uint32_t scaleY)
{
    C2D_FontCalcGlyphPos(font, out, glyphIndex, flags, u2f(scaleX), u2f(scaleY));
}

// ----------------------------------------------------------------
// SpriteSheet (Phase 4)
// C2D_SpriteSheetCount and C2D_SpriteSheetGetImage are static inline
// in spritesheet.h — they need bridge wrappers even though neither
// takes float parameters.
// C2D_SpriteSheetGetImage returns C2D_Image by value; we use an out-
// pointer to avoid any struct-return ABI ambiguity across toolchains.
// ----------------------------------------------------------------

size_t c2d_sprite_sheet_count(C2D_SpriteSheet sheet) {
    return C2D_SpriteSheetCount(sheet);
}

void c2d_sprite_sheet_get_image(C2D_SpriteSheet sheet, size_t index, C2D_Image* out) {
    *out = C2D_SpriteSheetGetImage(sheet, index);
}

// ----------------------------------------------------------------
// Sprite helpers (Phase 4)
// Every C2D_Sprite* function is static inline in sprite.h, so all
// require bridge wrappers.  Float params are received as uint32_t
// and reinterpreted with u2f() before forwarding.
// ----------------------------------------------------------------

// Draw helpers — static inline in base.h, forward to C2D_DrawImage.
bool c2d_draw_sprite(const C2D_Sprite* sprite)
    { return C2D_DrawSprite(sprite); }

bool c2d_draw_sprite_tinted(const C2D_Sprite* sprite, const C2D_ImageTint* tint)
    { return C2D_DrawSpriteTinted(sprite, tint); }

void c2d_sprite_from_image(C2D_Sprite* sprite, C2D_Image image)
    { C2D_SpriteFromImage(sprite, image); }

void c2d_sprite_from_sheet(C2D_Sprite* sprite, C2D_SpriteSheet sheet, size_t index)
    { C2D_SpriteFromSheet(sprite, sheet, index); }

void c2d_sprite_set_pos(C2D_Sprite* sprite, uint32_t x, uint32_t y)
    { C2D_SpriteSetPos(sprite, u2f(x), u2f(y)); }

void c2d_sprite_set_scale(C2D_Sprite* sprite, uint32_t x, uint32_t y)
    { C2D_SpriteSetScale(sprite, u2f(x), u2f(y)); }

void c2d_sprite_set_rotation(C2D_Sprite* sprite, uint32_t radians)
    { C2D_SpriteSetRotation(sprite, u2f(radians)); }

void c2d_sprite_set_rotation_degrees(C2D_Sprite* sprite, uint32_t degrees)
    { C2D_SpriteSetRotationDegrees(sprite, u2f(degrees)); }

void c2d_sprite_set_center(C2D_Sprite* sprite, uint32_t x, uint32_t y)
    { C2D_SpriteSetCenter(sprite, u2f(x), u2f(y)); }

void c2d_sprite_set_center_raw(C2D_Sprite* sprite, uint32_t x, uint32_t y)
    { C2D_SpriteSetCenterRaw(sprite, u2f(x), u2f(y)); }

void c2d_sprite_set_depth(C2D_Sprite* sprite, uint32_t depth)
    { C2D_SpriteSetDepth(sprite, u2f(depth)); }

void c2d_sprite_move(C2D_Sprite* sprite, uint32_t x, uint32_t y)
    { C2D_SpriteMove(sprite, u2f(x), u2f(y)); }

void c2d_sprite_scale(C2D_Sprite* sprite, uint32_t x, uint32_t y)
    { C2D_SpriteScale(sprite, u2f(x), u2f(y)); }

void c2d_sprite_rotate(C2D_Sprite* sprite, uint32_t radians)
    { C2D_SpriteRotate(sprite, u2f(radians)); }

void c2d_sprite_rotate_degrees(C2D_Sprite* sprite, uint32_t degrees)
    { C2D_SpriteRotateDegrees(sprite, u2f(degrees)); }
