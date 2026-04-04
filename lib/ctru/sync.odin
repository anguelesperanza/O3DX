package ctru

// ============================================================
// Synchronization — 3ds/synchronization.h
// User-mode locks, condition variables, events and semaphores
// built on the SVC address-arbitration mechanism.
//
// ArbitrationType and ResetType are declared in svc.odin and
// are available here because both files share package ctru.
// ============================================================

// ── Constants ─────────────────────────────────────────────────

/// Pass to CondVar_WakeUp / condvarBroadcast to wake all waiters.
ARBITRATION_SIGNAL_ALL :: i32(-1)

// ── Types ──────────────────────────────────────────────────────
//
// These must match the C layout exactly so that pointers passed
// to libctru functions refer to the right memory.
//
// From <sys/lock.h>:
//   _LOCK_T            = int32_t        (4 bytes)
//   _LOCK_RECURSIVE_T  = struct { int32_t lock; uint32_t thread_tag; uint32_t counter; }  (12 bytes)

/// Lightweight non-recursive mutex.
LightLock :: distinct i32

/// Recursive mutex — can be locked multiple times by the same thread.
RecursiveLock :: struct {
    lock:       i32,
    thread_tag: u32,
    counter:    u32,
}

/// Condition variable — a signed 32-bit arbitration value.
CondVar :: distinct i32

/// Lightweight event (can be oneshot or sticky).
LightEvent :: struct {
    state: i32,      // -2=cleared sticky, -1=cleared oneshot, 0=signaled oneshot, 1=signaled sticky
    lock:  LightLock,
}

/// Lightweight counting semaphore.
LightSemaphore :: struct {
    current_count:   i32,
    num_threads_acq: i16,
    max_count:       i16,
}

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Low-level arbitration ─────────────────────────────────

    // Wait or signal on an arbitrary address (no timeout).
    syncArbitrateAddress :: proc(addr: ^i32, type: ArbitrationType, value: i32) -> Result ---

    // Wait or signal on an arbitrary address with a nanosecond timeout.
    syncArbitrateAddressWithTimeout :: proc(addr: ^i32, type: ArbitrationType, value: i32, timeout_ns: i64) -> Result ---

    // ── LightLock ─────────────────────────────────────────────

    LightLock_Init    :: proc(lock: ^LightLock) ---
    LightLock_Lock    :: proc(lock: ^LightLock) ---
    LightLock_TryLock :: proc(lock: ^LightLock) -> i32 --- // 0 = acquired, non-zero = failed
    LightLock_Unlock  :: proc(lock: ^LightLock) ---

    // ── RecursiveLock ─────────────────────────────────────────

    RecursiveLock_Init    :: proc(lock: ^RecursiveLock) ---
    RecursiveLock_Lock    :: proc(lock: ^RecursiveLock) ---
    RecursiveLock_TryLock :: proc(lock: ^RecursiveLock) -> i32 --- // 0 = acquired
    RecursiveLock_Unlock  :: proc(lock: ^RecursiveLock) ---

    // ── CondVar ───────────────────────────────────────────────

    CondVar_Init        :: proc(cv: ^CondVar) ---
    CondVar_Wait        :: proc(cv: ^CondVar, lock: ^LightLock) ---
    CondVar_WaitTimeout :: proc(cv: ^CondVar, lock: ^LightLock, timeout_ns: i64) -> i32 --- // 0 = ok
    // Wake up to num_threads waiters.  Pass ARBITRATION_SIGNAL_ALL to wake all.
    CondVar_WakeUp      :: proc(cv: ^CondVar, num_threads: i32) ---

    // ── LightEvent ────────────────────────────────────────────

    LightEvent_Init       :: proc(event: ^LightEvent, reset_type: ResetType) ---
    LightEvent_Clear      :: proc(event: ^LightEvent) ---
    // Pulse: wake sticky waiters without fully signaling; if already signaled, clear instead.
    LightEvent_Pulse      :: proc(event: ^LightEvent) ---
    LightEvent_Signal     :: proc(event: ^LightEvent) ---
    LightEvent_TryWait    :: proc(event: ^LightEvent) -> i32 --- // non-zero if signaled
    LightEvent_Wait       :: proc(event: ^LightEvent) ---
    LightEvent_WaitTimeout :: proc(event: ^LightEvent, timeout_ns: i64) -> i32 --- // non-zero on timeout

    // ── LightSemaphore ────────────────────────────────────────

    LightSemaphore_Init       :: proc(semaphore: ^LightSemaphore, initial_count: i16, max_count: i16) ---
    LightSemaphore_Acquire    :: proc(semaphore: ^LightSemaphore, count: i32) ---
    LightSemaphore_TryAcquire :: proc(semaphore: ^LightSemaphore, count: i32) -> i32 --- // 0 = ok
    LightSemaphore_Release    :: proc(semaphore: ^LightSemaphore, count: i32) ---
}

// ── Bridge (static-inline convenience wrappers) ───────────────

foreign import ctru_bridge "system:ctru_bridge"

@(default_calling_convention = "c")
foreign ctru_bridge {

    // Wake exactly one thread waiting on cv.
    @(link_name = "condvar_signal")
    CondVar_Signal    :: proc(cv: ^CondVar) ---

    // Wake all threads waiting on cv.
    @(link_name = "condvar_broadcast")
    CondVar_Broadcast :: proc(cv: ^CondVar) ---
}
