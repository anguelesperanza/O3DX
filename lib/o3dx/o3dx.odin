// The Odin runtime pieces that `freestanding_arm32` does not provide on the
// 3DS: a heap allocator, a temp allocator, a logger, an assertion handler
// and print helpers.
//
// Without this package `new`, `make`, `append`, maps, `strings.Builder`,
// `fmt.tprintf` and `core:log` all silently do nothing on the 3DS (Odin's
// default allocator on this target is the nil allocator), and a failed
// `assert` traps without printing anything.
//
//   import o3dx "../lib/o3dx"
//
//   @(export, link_name = "odin_main")
//   game_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
//       context = o3dx.init()          // once, on the main thread
//       defer o3dx.shutdown()
//       ...
//       for ctru.aptMainLoop() {
//           ...
//           free_all(context.temp_allocator)   // once per frame
//       }
//   }
//
// In any other `proc "c"` (a thread entry, a callback) use
// `context = o3dx.thread_context()`.
//
// The build must also compile lib/libm/bridge.c and run objcopy with
// lib/libm/redefine.syms on the Odin object (see any build.bat), because
// core:fmt and core:strconv call libgcc float helpers that are hard-float in
// devkitARM.
//
// Ported from vito's lib/vito (the PS Vita bindings).
package o3dx

import "base:runtime"

// Size of the first block of the temp allocator. It grows in blocks of at
// least this size when a frame needs more. Override with
// -define:O3DX_TEMP_ARENA_SIZE=<bytes>.
TEMP_ARENA_SIZE :: #config(O3DX_TEMP_ARENA_SIZE, 1 * runtime.Megabyte)

@(private) temp_arena:  runtime.Arena
@(private) initialised: bool

// Sets up the runtime and returns the context to use on the main thread.
// Call it once, first thing in the entry procedure.
init :: proc "contextless" () -> runtime.Context {
    context = base_context()
    if !initialised {
        initialised = true
        // Runs global initialisers and @(init) procedures. Nothing calls this
        // for us because the program is built with -no-entry-point.
        runtime._startup_runtime()
        if runtime.arena_init(&temp_arena, uint(TEMP_ARENA_SIZE), context.allocator) != .None {
            debug_write("[o3dx] could not allocate the temp arena\n")
        }
    }
    context.temp_allocator = runtime.arena_allocator(&temp_arena)
    return context
}

// Context for the main thread after init() has run: same as what init()
// returned. Use it in callbacks that run on the main thread.
main_context :: proc "contextless" () -> runtime.Context {
    context = base_context()
    context.temp_allocator = runtime.arena_allocator(&temp_arena)
    return context
}

// Context for any other thread. The heap allocator is shared and thread-safe
// (libctru gives newlib's malloc a lock). The temp allocator is NOT shared:
// the arena is not thread-safe, so this context's temp allocator is the heap
// allocator. Anything a thread allocates with context.temp_allocator must be
// freed by hand, or give the thread its own runtime.Arena.
thread_context :: proc "contextless" () -> runtime.Context {
    context = base_context()
    context.temp_allocator = context.allocator
    return context
}

// Runs @(fini) procedures and releases the temp arena. Optional before
// returning from odin_main, which frees everything anyway.
shutdown :: proc "contextless" () {
    if !initialised do return
    context = base_context()
    runtime.arena_destroy(&temp_arena)
    runtime._cleanup_runtime()
    initialised = false
}

@(private)
base_context :: proc "contextless" () -> runtime.Context {
    c := runtime.default_context()
    c.allocator              = heap_allocator()
    c.assertion_failure_proc = assertion_failure_proc
    c.logger                 = logger()
    return c
}
