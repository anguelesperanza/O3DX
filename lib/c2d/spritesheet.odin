package c2d

// ============================================================
// Citro2D — sprite sheet loading
// Source: citro2d/include/c2d/spritesheet.h
//
// TODO (Phase 4): Implement these bindings.
//
// Direct foreign bindings needed (no float params):
//   C2D_SpriteSheetLoad(filename: cstring) -> C2D_SpriteSheet
//   C2D_SpriteSheetLoadFromMem(data: rawptr, size: uint) -> C2D_SpriteSheet
//   C2D_SpriteSheetFromFD(fd: i32) -> C2D_SpriteSheet
//   C2D_SpriteSheetLoadFromHandle(f: rawptr) -> C2D_SpriteSheet  // FILE*
//   C2D_SpriteSheetFree(sheet: C2D_SpriteSheet)
//   C2D_SpriteSheetCount(sheet: C2D_SpriteSheet) -> uint
//   C2D_SpriteSheetGetImage(sheet: C2D_SpriteSheet, index: uint) -> C2D_Image
//
// None of these require an ABI bridge (all integer / pointer params).
// ============================================================
