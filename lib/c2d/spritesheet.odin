package c2d

// ============================================================
// Citro2D — sprite sheet loading
// Source: citro2d/include/c2d/spritesheet.h
//
// C2D_SpriteSheetLoad / Free / LoadFromMem / FromFD / LoadFromHandle
// are exported symbols — callable directly from Odin foreign.
//
// C2D_SpriteSheetCount and C2D_SpriteSheetGetImage are static inline
// in the citro2d header — they have no exported linker symbol and
// MUST be called through bridge wrappers in lib/c2d/bridge.c.
// ============================================================

foreign import citro2d    "system:citro2d"
foreign import c2d_bridge "system:c2d_bridge"

// ---- Direct foreign bindings (exported, no float params) ----

@(default_calling_convention = "c")
foreign citro2d {
    // Load a .t3x sprite sheet from a romfs path.
    // Returns nil on failure.
    @(link_name = "C2D_SpriteSheetLoad")
    C2D_SpriteSheetLoad :: proc(filename: cstring) -> C2D_SpriteSheet ---

    // Load a .t3x sprite sheet from a memory buffer.
    @(link_name = "C2D_SpriteSheetLoadFromMem")
    C2D_SpriteSheetLoadFromMem :: proc(data: rawptr, size: uint) -> C2D_SpriteSheet ---

    // Load a .t3x sprite sheet from an open file descriptor.
    @(link_name = "C2D_SpriteSheetFromFD")
    C2D_SpriteSheetFromFD :: proc(fd: i32) -> C2D_SpriteSheet ---

    // Load a .t3x sprite sheet from an open FILE* handle.
    @(link_name = "C2D_SpriteSheetLoadFromHandle")
    C2D_SpriteSheetLoadFromHandle :: proc(f: rawptr) -> C2D_SpriteSheet --- // FILE*

    // Free a sprite sheet and release all associated texture memory.
    @(link_name = "C2D_SpriteSheetFree")
    C2D_SpriteSheetFree :: proc(sheet: C2D_SpriteSheet) ---
}

// ---- Bridge bindings (static inline — no exported symbol) ----

@(default_calling_convention = "c")
foreign c2d_bridge {
    // Return the number of sprites stored in the sheet.
    @(link_name = "c2d_sprite_sheet_count")
    C2D_SpriteSheetCount :: proc(sheet: C2D_SpriteSheet) -> uint ---

    // Fill *out with the C2D_Image at the given index.
    // Use instead of C2D_SpriteSheetGetImage to avoid struct-return ABI issues.
    @(link_name = "c2d_sprite_sheet_get_image")
    C2D_SpriteSheetGetImage :: proc(sheet: C2D_SpriteSheet, index: uint, out: ^C2D_Image) ---
}

// ── Short aliases (strip C2D_ prefix) ──────────────────────────────────────
SpriteSheetLoad           :: C2D_SpriteSheetLoad
SpriteSheetLoadFromMem    :: C2D_SpriteSheetLoadFromMem
SpriteSheetFromFD         :: C2D_SpriteSheetFromFD
SpriteSheetLoadFromHandle :: C2D_SpriteSheetLoadFromHandle
SpriteSheetFree           :: C2D_SpriteSheetFree
SpriteSheetCount          :: C2D_SpriteSheetCount
SpriteSheetGetImage       :: C2D_SpriteSheetGetImage
