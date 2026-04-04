package ctru

// ============================================================
// Thread — 3ds/thread.h
// High-level libctru thread wrapper around SVC thread primitives.
// ============================================================

// ── Types ─────────────────────────────────────────────────────

/// Opaque libctru thread handle (internally a pointer to Thread_tag).
Thread :: distinct rawptr

/// Entry-point signature for a new thread.
ThreadFunc :: #type proc "c" (arg: rawptr)

/// Exception handler — must be an ARM function that does not return.
ExceptionHandler :: #type proc "c" (excep: rawptr, regs: rawptr)

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // Creates a new libctru thread.
    //
    // entrypoint  — function called when the thread starts
    // arg         — passed to entrypoint
    // stack_size  — stack byte count (rounded to multiple of 8)
    // prio        — priority in [0x18, 0x3F]; lower value = higher priority
    //               (main thread is usually 0x30 — use svcGetThreadPriority
    //                if you need to be relative to the main thread)
    // core_id     — 0 = app core, 1 = sys core (needs APT_SetAppCpuTimeLimit),
    //               2/3 = New 3DS only; pass -1 for all CPUs, -2 for default
    // detached    — if true, thread is freed automatically when it finishes
    //
    // Returns the thread handle, or nil on failure.
    threadCreate :: proc(entrypoint: ThreadFunc, arg: rawptr, stack_size: uint,
                         prio: i32, core_id: i32, detached: bool) -> Thread ---

    // Returns the OS-level Handle for a libctru thread.
    threadGetHandle :: proc(thread: Thread) -> Handle ---

    // Returns the exit code set by threadExit (only valid after thread finishes).
    threadGetExitCode :: proc(thread: Thread) -> i32 ---

    // Frees a finished, non-detached thread.  Do not call on detached threads.
    threadFree :: proc(thread: Thread) ---

    // Waits for a thread to finish.  Pass max(u64) for no timeout.
    threadJoin :: proc(thread: Thread, timeout_ns: u64) -> Result ---

    // Changes a thread from attached to detached (it will free itself on exit).
    threadDetach :: proc(thread: Thread) ---

    // Returns the libctru Thread handle for the calling thread, or nil for main.
    threadGetCurrent :: proc() -> Thread ---

    // Exits the current thread with exit code rc.  Must not be called from main.
    @(link_name = "threadExit")
    threadExit :: proc(rc: i32) -> ! ---
}

// ── Bridge (static-inline wrappers) ────────────────────────────

foreign import ctru_bridge "system:ctru_bridge"

@(default_calling_convention = "c")
foreign ctru_bridge {

    // Sets the exception handler for the current thread.
    // handler        — ARM function that handles the exception and does not return
    // stack_top      — top of the handler's stack (nil = use faulting thread's stack as-is)
    // exception_data — buffer to receive exception info (nil = push on handler stack)
    @(link_name = "thread_on_exception")
    threadOnException :: proc(handler: ExceptionHandler, stack_top: rawptr, exception_data: rawptr) ---
}
