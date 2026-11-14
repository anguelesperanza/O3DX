package o3dx

import "base:runtime"

// Heap allocator on top of devkitARM's newlib (malloc and friends). libctru
// sets the heap up at start-up from the application's memory, minus the
// linear heap (linearAlloc, for GPU and audio buffers). To change the split,
// define `u32 __ctru_heap_size` and/or `u32 __ctru_linear_heap_size` in
// main.c (both are weak symbols in libctru; see 3ds/env.h).
//
// All of these take and return integers and pointers only, so they are called
// directly, with no float bridge. libctru supplies newlib's locks, so they
// are safe to call from several threads.

foreign import libc "system:c"

@(default_calling_convention = "c")
foreign libc {
    @(link_name = "malloc")   c_malloc   :: proc(size: uint) -> rawptr ---
    @(link_name = "calloc")   c_calloc   :: proc(count, size: uint) -> rawptr ---
    @(link_name = "realloc")  c_realloc  :: proc(ptr: rawptr, size: uint) -> rawptr ---
    @(link_name = "memalign") c_memalign :: proc(alignment, size: uint) -> rawptr ---
    @(link_name = "free")     c_free     :: proc(ptr: rawptr) ---
}

// newlib's malloc returns memory aligned to 8 bytes on this target.
@(private) MALLOC_ALIGNMENT :: 8

heap_allocator :: proc "contextless" () -> runtime.Allocator {
    return {procedure = heap_allocator_proc, data = nil}
}

heap_allocator_proc :: proc(allocator_data: rawptr, mode: runtime.Allocator_Mode,
                            size, alignment: int,
                            old_memory: rawptr, old_size: int,
                            loc := #caller_location) -> ([]byte, runtime.Allocator_Error) {
    alloc :: proc "contextless" (size, alignment: int, zero: bool) -> ([]byte, runtime.Allocator_Error) {
        if size <= 0 do return nil, nil
        ptr: rawptr
        if alignment <= MALLOC_ALIGNMENT {
            ptr = c_calloc(1, uint(size)) if zero else c_malloc(uint(size))
        } else {
            // memalign memory can be passed to free() in newlib.
            ptr = c_memalign(uint(alignment), uint(size))
            if ptr != nil && zero do runtime.mem_zero(ptr, size)
        }
        if ptr == nil do return nil, .Out_Of_Memory
        return ([^]byte)(ptr)[:size], nil
    }

    resize :: proc "contextless" (old_memory: rawptr, old_size, size, alignment: int, zero: bool) -> ([]byte, runtime.Allocator_Error) {
        if old_memory == nil do return alloc(size, alignment, zero)
        if size <= 0 {
            c_free(old_memory)
            return nil, nil
        }
        ptr: rawptr
        if alignment <= MALLOC_ALIGNMENT {
            ptr = c_realloc(old_memory, uint(size))
            if ptr == nil do return nil, .Out_Of_Memory
        } else {
            // realloc does not keep an alignment above 8, so move by hand.
            ptr = c_memalign(uint(alignment), uint(size))
            if ptr == nil do return nil, .Out_Of_Memory
            runtime.mem_copy_non_overlapping(ptr, old_memory, min(old_size, size))
            c_free(old_memory)
        }
        if zero && size > old_size {
            runtime.mem_zero(rawptr(uintptr(ptr) + uintptr(old_size)), size - old_size)
        }
        return ([^]byte)(ptr)[:size], nil
    }

    switch mode {
    case .Alloc:
        return alloc(size, alignment, true)
    case .Alloc_Non_Zeroed:
        return alloc(size, alignment, false)
    case .Free:
        if old_memory != nil do c_free(old_memory)
        return nil, nil
    case .Free_All:
        return nil, .Mode_Not_Implemented
    case .Resize:
        return resize(old_memory, old_size, size, alignment, true)
    case .Resize_Non_Zeroed:
        return resize(old_memory, old_size, size, alignment, false)
    case .Query_Features:
        set := (^runtime.Allocator_Mode_Set)(old_memory)
        if set != nil {
            set^ = {.Alloc, .Alloc_Non_Zeroed, .Free, .Resize, .Resize_Non_Zeroed, .Query_Features}
        }
        return nil, nil
    case .Query_Info:
        return nil, .Mode_Not_Implemented
    }
    return nil, nil
}
