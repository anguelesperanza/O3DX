package c2d

// ============================================================
// Citro2D — sprite helpers
// Source: citro2d/include/c2d/sprite.h
//
// All functions in this header are static inline in C, so they
// have no exported symbols.  Each one needs a bridge wrapper.
//
// TODO (Phase 4): Add wrappers to lib/c2d/bridge.c and declare them here.
//
// ABI bridge wrappers needed (all have float params):
//
//   c2d_sprite_from_image(sprite, image)
//     -> C2D_SpriteFromImage(sprite: ^C2D_Sprite, image: C2D_Image)
//        [no float — but image is struct-by-value, needs bridge]
//
//   c2d_sprite_from_sheet(sprite, sheet, index)
//     -> C2D_SpriteFromSheet(sprite: ^C2D_Sprite, sheet: C2D_SpriteSheet, index: uint)
//        [no float params, but static inline so still needs bridge]
//
//   c2d_sprite_set_pos(sprite, x, y)
//   c2d_sprite_set_scale(sprite, x, y)
//   c2d_sprite_set_rotation(sprite, radians)
//   c2d_sprite_set_rotation_degrees(sprite, degrees)
//   c2d_sprite_set_center(sprite, x, y)         [normalized 0..1]
//   c2d_sprite_set_center_raw(sprite, x, y)     [pixel coords]
//   c2d_sprite_set_depth(sprite, depth)
//   c2d_sprite_move(sprite, x, y)
//   c2d_sprite_scale(sprite, x, y)              [multiply current scale]
//   c2d_sprite_rotate(sprite, radians)          [add to rotation]
//   c2d_sprite_rotate_degrees(sprite, degrees)
//
// C2D_DrawSprite and C2D_DrawSpriteTinted are already declared in base.odin
// (they forward to the non-inline C2D_DrawImage internally, and their
// pointer-only signatures are safe for direct foreign import).
// ============================================================
