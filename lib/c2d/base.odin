package c2d

// ============================================================
// Citro2D — core scene / drawing bindings
// Source: citro2d/include/c2d/base.h
// ============================================================

// ============================================================
// citro2d — functions with no float parameters.
// Callable directly from soft-float Odin with no ABI bridge.
// ============================================================

foreign import citro2d "system:citro2d"

@(default_calling_convention = "c")
foreign citro2d {
    // --- Init / shutdown ---
    C2D_Init               :: proc(maxObjects: u32) -> bool ---
    C2D_Fini               :: proc() ---

    // --- Per-frame ---
    C2D_Prepare            :: proc() ---
    C2D_Flush              :: proc() ---

    // --- Render targets ---
    C2D_CreateScreenTarget :: proc(screen: u32, side: u32) -> rawptr ---
    C2D_TargetClear        :: proc(target: rawptr, color: u32) ---

    // --- Environment (no float params) ---
    C2D_Fade               :: proc(color: u32) -> bool ---
    C2D_SetTintMode        :: proc(mode: C2D_TintMode) -> bool ---

    // --- Scene (no float params) ---
    C2D_SceneSize          :: proc(width: u32, height: u32, tilt: bool) ---
    C2D_SceneTarget        :: proc(target: rawptr) ---

    // --- Draw (no float params — takes C2D_DrawParams by pointer) ---
    // C2D_DrawImage passes floats inside a struct pointer, which
    // is safe for soft-float Odin (struct layout is identical).
    C2D_DrawImage          :: proc(img: C2D_Image, params: ^C2D_DrawParams, tint: ^C2D_ImageTint) -> bool ---

    // --- Sprite draw (no float params in the call itself) ---
    C2D_DrawSprite         :: proc(sprite: ^C2D_Sprite) -> bool ---
    C2D_DrawSpriteTinted   :: proc(sprite: ^C2D_Sprite, tint: ^C2D_ImageTint) -> bool ---

    // --- View transform (no float params) ---
    // NOTE: 'matrix' is a reserved keyword in Odin; parameter renamed to 'mtx'.
    C2D_ViewReset   :: proc() ---
    C2D_ViewSave    :: proc(mtx: rawptr) --- // rawptr = ^C3D_Mtx
    C2D_ViewRestore :: proc(mtx: rawptr) --- // rawptr = ^C3D_Mtx
}

// ============================================================
// c2d_bridge — wrappers for citro2d functions whose signatures
// contain float parameters passed directly (not in a struct).
//
// Soft-float Odin puts f32 bit-patterns in integer registers.
// The C bridge receives them as uint32_t, reinterprets with u2f(),
// and forwards to the real hard-float citro2d function.
//
// Implemented in lib/c2d/bridge.c.
// ============================================================

foreign import c2d_bridge "system:c2d_bridge"

@(default_calling_convention = "c")
foreign c2d_bridge {

    // --- Scene begin (wraps C2D_SceneBegin which is a macro/inline) ---
    @(link_name = "c2d_scene_begin")
    C2D_SceneBegin :: proc(target: rawptr) ---

    // --- Draw shapes ---
    @(link_name = "c2d_draw_triangle")
    C2D_DrawTriangle :: proc(
        ax, ay: f32, clr0: u32,
        bx, by: f32, clr1: u32,
        cx, cy: f32, clr2: u32,
        depth: f32) -> bool ---

    @(link_name = "c2d_draw_line")
    C2D_DrawLine :: proc(
        x0, y0: f32, clr0: u32,
        x1, y1: f32, clr1: u32,
        thickness, depth: f32) -> bool ---

    @(link_name = "c2d_draw_rectangle")
    C2D_DrawRectangle :: proc(
        x, y, z, w, h: f32,
        clr0, clr1, clr2, clr3: u32) -> bool ---

    @(link_name = "c2d_draw_rect_solid")
    C2D_DrawRectSolid :: proc(
        x, y, z, w, h: f32,
        clr: u32) -> bool ---

    @(link_name = "c2d_draw_ellipse")
    C2D_DrawEllipse :: proc(
        x, y, z, w, h: f32,
        clr0, clr1, clr2, clr3: u32) -> bool ---

    @(link_name = "c2d_draw_ellipse_solid")
    C2D_DrawEllipseSolid :: proc(
        x, y, z, w, h: f32,
        clr: u32) -> bool ---

    @(link_name = "c2d_draw_circle")
    C2D_DrawCircle :: proc(
        x, y, z, radius: f32,
        clr0, clr1, clr2, clr3: u32) -> bool ---

    @(link_name = "c2d_draw_circle_solid")
    C2D_DrawCircleSolid :: proc(
        x, y, z, radius: f32,
        clr: u32) -> bool ---

    // --- Draw image (float params follow struct-by-value arg) ---
    @(link_name = "c2d_draw_image_at")
    C2D_DrawImageAt :: proc(
        img: C2D_Image,
        x, y, depth: f32,
        tint: ^C2D_ImageTint,
        scaleX, scaleY: f32) -> bool ---

    @(link_name = "c2d_draw_image_at_rotated")
    C2D_DrawImageAtRotated :: proc(
        img: C2D_Image,
        x, y, depth: f32,
        angle: f32,
        tint: ^C2D_ImageTint,
        scaleX, scaleY: f32) -> bool ---

    // --- View transforms ---
    @(link_name = "c2d_view_translate")
    C2D_ViewTranslate :: proc(x, y: f32) ---

    @(link_name = "c2d_view_rotate")
    C2D_ViewRotate :: proc(rotation: f32) ---

    @(link_name = "c2d_view_rotate_degrees")
    C2D_ViewRotateDegrees :: proc(rotation: f32) ---

    @(link_name = "c2d_view_shear")
    C2D_ViewShear :: proc(x, y: f32) ---

    @(link_name = "c2d_view_scale")
    C2D_ViewScale :: proc(x, y: f32) ---

    // --- Color helpers ---
    // C2D_Color32 has no float params — declared directly:
    // (see Color32 proc below)

    @(link_name = "c2d_color32f")
    C2D_Color32f :: proc(r, g, b, a: f32) -> u32 ---

    // --- Tint helpers ---
    @(link_name = "c2d_plain_image_tint")
    C2D_PlainImageTint :: proc(tint: ^C2D_ImageTint, color: u32, blend: f32) ---

    @(link_name = "c2d_alpha_image_tint")
    C2D_AlphaImageTint :: proc(tint: ^C2D_ImageTint, alpha: f32) ---

    @(link_name = "c2d_set_image_tint")
    C2D_SetImageTint :: proc(tint: ^C2D_ImageTint, corner: C2D_Corner, color: u32, blend: f32) ---

    @(link_name = "c2d_top_image_tint")
    C2D_TopImageTint :: proc(tint: ^C2D_ImageTint, color: u32, blend: f32) ---

    @(link_name = "c2d_bottom_image_tint")
    C2D_BottomImageTint :: proc(tint: ^C2D_ImageTint, color: u32, blend: f32) ---

    @(link_name = "c2d_left_image_tint")
    C2D_LeftImageTint :: proc(tint: ^C2D_ImageTint, color: u32, blend: f32) ---

    @(link_name = "c2d_right_image_tint")
    C2D_RightImageTint :: proc(tint: ^C2D_ImageTint, color: u32, blend: f32) ---
}

// ============================================================
// C2D_Color32 — pure integer arithmetic, implement in Odin
// directly so no foreign call is needed.
// Matches the C macro: (r | g<<8 | b<<16 | a<<24)
// ============================================================

C2D_Color32 :: #force_inline proc "c" (r, g, b, a: u8) -> u32 {
    return u32(r) | (u32(g) << 8) | (u32(b) << 16) | (u32(a) << 24)
}
