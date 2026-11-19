package ctru

// ============================================================
// Mappable memory allocator
// 3ds/allocator/mappable.h
//
// Reserves address space for mapping shared memory blocks into.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes the mappable allocator.
    mappableInit :: proc(addrMin: u32, addrMax: u32) ---

    // Finds a mappable memory area.
    mappableAlloc :: proc(size: uint) -> rawptr ---

    // Frees a mappable area (stubbed).
    mappableFree :: proc(mem: rawptr) ---
}
