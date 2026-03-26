package ctru

// ============================================================
// Kernel syscall wrappers — 3ds/svc.h
// All functions call into the kernel via SVC instruction.
// ============================================================

// ── Constants ────────────────────────────────────────────────

CUR_PROCESS_HANDLE :: Handle(0xFFFF8001)
CUR_THREAD_HANDLE  :: Handle(0xFFFF8000)

// ── Enum types ───────────────────────────────────────────────

/// svcControlMemory operation flags.
MemOp :: enum u32 {
    FREE            = 1,
    RESERVE         = 2,
    ALLOC           = 3,
    MAP             = 4,
    UNMAP           = 5,
    PROT            = 6,
    REGION_APP      = 0x100,
    REGION_SYSTEM   = 0x200,
    REGION_BASE     = 0x300,
    OP_MASK         = 0xFF,
    REGION_MASK     = 0xF00,
    LINEAR_FLAG     = 0x10000,
    ALLOC_LINEAR    = 0x10003, // LINEAR_FLAG | ALLOC
}

/// Memory block state.
MemState :: enum u32 {
    FREE       = 0,
    RESERVED   = 1,
    IO         = 2,
    STATIC     = 3,
    CODE       = 4,
    PRIVATE    = 5,
    SHARED     = 6,
    CONTINUOUS = 7,
    ALIASED    = 8,
    ALIAS      = 9,
    ALIASCODE  = 10,
    LOCKED     = 11,
}

/// Memory permission flags.
MemPerm :: enum u32 {
    READ        = 1,
    WRITE       = 2,
    EXECUTE     = 4,
    READWRITE   = 3,  // READ | WRITE
    READEXECUTE = 5,  // READ | EXECUTE
    DONTCARE    = 0x10000000,
}

/// Memory region identifiers.
MemRegion :: enum u32 {
    ALL         = 0,
    APPLICATION = 1,
    SYSTEM      = 2,
    BASE        = 3,
}

/// Address arbitration modes.
ArbitrationType :: enum u32 {
    SIGNAL                                  = 0,
    WAIT_IF_LESS_THAN                       = 1,
    DECREMENT_AND_WAIT_IF_LESS_THAN         = 2,
    WAIT_IF_LESS_THAN_TIMEOUT               = 3,
    DECREMENT_AND_WAIT_IF_LESS_THAN_TIMEOUT = 4,
}

/// Event and timer reset types.
ResetType :: enum u32 {
    ONESHOT = 0,
    STICKY  = 1,
    PULSE   = 2,
}

/// Resource limit types.
ResourceLimitType :: enum u32 {
    PRIORITY       = 0,
    COMMIT         = 1,
    THREAD         = 2,
    EVENT          = 3,
    MUTEX          = 4,
    SEMAPHORE      = 5,
    TIMER          = 6,
    SHAREDMEMORY   = 7,
    ADDRESSARBITER = 8,
    CPUTIME        = 9,
}

/// DMA transfer state.
DmaState :: enum u32 {
    STARTING = 0,
    WFP_DST  = 1,
    WFP_SRC  = 2,
    RUNNING  = 3,
    DONE     = 4,
}

/// User break reasons for svcBreak.
UserBreakType :: enum u32 {
    PANIC      = 0,
    ASSERT     = 1,
    USER       = 2,
    LOAD_RO    = 3,
    UNLOAD_RO  = 4,
}

// ── Struct types ─────────────────────────────────────────────

/// Memory block information returned by svcQueryMemory.
MemInfo :: struct {
    base_addr: u32,
    size:      u32,
    perm:      MemPerm,
    state:     MemState,
}

/// Page information returned by svcQueryMemory.
PageInfo :: struct {
    flags: u32,
}

/// Per-device DMA configuration (source or destination).
DmaDeviceConfig :: struct {
    deviceId:          i8,
    allowedAlignments: i8,
    burstSize:         i16,
    transferSize:      i16,
    burstStride:       i16,
    transferStride:    i16,
}

/// Full DMA transfer configuration passed to svcStartInterProcessDma.
DmaConfig :: struct {
    channelId:      i8,
    endianSwapSize: i8,
    flags:          u8,
    _padding:       u8,
    srcCfg:         DmaDeviceConfig,
    dstCfg:         DmaDeviceConfig,
}

/// Thread entry-point function type.
ThreadFunc :: #type proc "c" (arg: rawptr)

// ── Syscall functions ─────────────────────────────────────────

foreign import ctru "system:ctru"


@(default_calling_convention = "c")
foreign ctru {

    // ── Memory management ─────────────────────────────────────
    svcControlMemory        :: proc(addr_out: ^u32, addr0, addr1, size: u32, op: MemOp, perm: MemPerm) -> Result ---
    svcControlProcessMemory :: proc(process: Handle, addr0, addr1, size, memtype, perm: u32) -> Result ---
    svcCreateMemoryBlock    :: proc(memblock: ^Handle, addr, size: u32, my_perm, other_perm: MemPerm) -> Result ---
    svcMapMemoryBlock       :: proc(memblock: Handle, addr: u32, my_perm, other_perm: MemPerm) -> Result ---
    svcUnmapMemoryBlock     :: proc(memblock: Handle, addr: u32) -> Result ---
    svcMapProcessMemory     :: proc(process: Handle, destAddress, size: u32) -> Result ---
    svcUnmapProcessMemory   :: proc(process: Handle, destAddress, size: u32) -> Result ---
    svcQueryMemory          :: proc(info: ^MemInfo, out: ^PageInfo, addr: u32) -> Result ---
    svcQueryProcessMemory   :: proc(info: ^MemInfo, out: ^PageInfo, process: Handle, addr: u32) -> Result ---

    // ── Process management ────────────────────────────────────
    svcOpenProcess              :: proc(process: ^Handle, processId: u32) -> Result ---
    svcExitProcess              :: proc() ---
    svcTerminateProcess         :: proc(process: Handle) -> Result ---
    svcGetProcessInfo           :: proc(out: ^i64, process: Handle, kind: u32) -> Result ---
    svcGetProcessId             :: proc(out: ^u32, handle: Handle) -> Result ---
    svcGetProcessList           :: proc(processCount: ^i32, processIds: ^u32, maxCount: i32) -> Result ---
    svcGetThreadList            :: proc(threadCount: ^i32, threadIds: ^u32, maxCount: i32, process: Handle) -> Result ---
    svcCreatePort               :: proc(portServer, portClient: ^Handle, name: cstring, maxSessions: i32) -> Result ---
    svcConnectToPort            :: proc(out: ^Handle, portName: cstring) -> Result ---
    svcGetProcessAffinityMask   :: proc(mask: ^u8, process: Handle, processorCount: i32) -> Result ---
    svcSetProcessAffinityMask   :: proc(process: Handle, mask: ^u8, processorCount: i32) -> Result ---
    svcGetProcessIdealProcessor :: proc(processorid: ^i32, process: Handle) -> Result ---
    svcSetProcessIdealProcessor :: proc(process: Handle, processorid: i32) -> Result ---

    // ── Thread management ─────────────────────────────────────
    // NOTE: To enable the second core on N3DS, first call APT_SetAppCpuTimeLimit.
    svcCreateThread           :: proc(thread: ^Handle, entrypoint: ThreadFunc, arg: u32, stack_top: ^u32, priority, processor_id: i32) -> Result ---
    svcOpenThread             :: proc(thread: ^Handle, process: Handle, threadId: u32) -> Result ---
    svcExitThread             :: proc() ---
    // Sleep for at least ns nanoseconds.  Pass -1 to yield.
    svcSleepThread            :: proc(ns: i64) ---
    svcGetThreadPriority      :: proc(out: ^i32, handle: Handle) -> Result ---
    svcSetThreadPriority      :: proc(thread: Handle, prio: i32) -> Result ---
    svcGetThreadAffinityMask  :: proc(mask: ^u8, thread: Handle, processorCount: i32) -> Result ---
    svcSetThreadAffinityMask  :: proc(thread: Handle, mask: ^u8, processorCount: i32) -> Result ---
    svcGetThreadIdealProcessor :: proc(processorid: ^i32, thread: Handle) -> Result ---
    svcSetThreadIdealProcessor :: proc(thread: Handle, processorid: i32) -> Result ---
    // Returns the ID (0 or 1) of the processor the current thread runs on.
    svcGetProcessorID         :: proc() -> i32 ---
    svcGetThreadId            :: proc(out: ^u32, handle: Handle) -> Result ---
    svcGetProcessIdOfThread   :: proc(out: ^u32, handle: Handle) -> Result ---
    svcGetThreadInfo          :: proc(out: ^i64, thread: Handle, kind: u32) -> Result ---

    // ── Resource limits ───────────────────────────────────────
    svcGetResourceLimit             :: proc(resourceLimit: ^Handle, process: Handle) -> Result ---
    svcGetResourceLimitLimitValues  :: proc(values: ^i64, resourceLimit: Handle, names: ^ResourceLimitType, nameCount: i32) -> Result ---
    svcGetResourceLimitCurrentValues :: proc(values: ^i64, resourceLimit: Handle, names: ^ResourceLimitType, nameCount: i32) -> Result ---
    svcSetProcessResourceLimits     :: proc(process, resourceLimit: Handle) -> Result ---
    svcCreateResourceLimit          :: proc(resourceLimit: ^Handle) -> Result ---
    svcSetResourceLimitValues       :: proc(resourceLimit: Handle, names: ^ResourceLimitType, values: ^i64, nameCount: i32) -> Result ---

    // ── Synchronisation ───────────────────────────────────────
    svcCreateMutex             :: proc(mutex: ^Handle, initially_locked: bool) -> Result ---
    svcReleaseMutex            :: proc(handle: Handle) -> Result ---
    svcCreateSemaphore         :: proc(semaphore: ^Handle, initial_count, max_count: i32) -> Result ---
    svcReleaseSemaphore        :: proc(count: ^i32, semaphore: Handle, release_count: i32) -> Result ---
    svcCreateEvent             :: proc(event: ^Handle, reset_type: ResetType) -> Result ---
    svcSignalEvent             :: proc(handle: Handle) -> Result ---
    svcClearEvent              :: proc(handle: Handle) -> Result ---
    // Wait for one handle to be signalled (or timeout expires).
    svcWaitSynchronization     :: proc(handle: Handle, nanoseconds: i64) -> Result ---
    // Wait for one (or all) of N handles.  Index of the signalled handle is written to *out.
    svcWaitSynchronizationN    :: proc(out: ^i32, handles: ^Handle, handles_num: i32, wait_all: bool, nanoseconds: i64) -> Result ---
    svcCreateAddressArbiter    :: proc(arbiter: ^Handle) -> Result ---
    svcArbitrateAddress        :: proc(arbiter: Handle, addr: u32, kind: ArbitrationType, value: i32, timeout_ns: i64) -> Result ---
    svcArbitrateAddressNoTimeout :: proc(arbiter: Handle, addr: u32, kind: ArbitrationType, value: i32) -> Result ---
    svcSendSyncRequest         :: proc(session: Handle) -> Result ---
    svcCreateSessionToPort     :: proc(clientSession: ^Handle, clientPort: Handle) -> Result ---
    svcCreateSession           :: proc(serverSession, clientSession: ^Handle) -> Result ---
    svcAcceptSession           :: proc(session: ^Handle, port: Handle) -> Result ---
    svcReplyAndReceive         :: proc(index: ^i32, handles: ^Handle, handleCount: i32, replyTarget: Handle) -> Result ---

    // ── Timers ────────────────────────────────────────────────
    svcCreateTimer  :: proc(timer: ^Handle, reset_type: ResetType) -> Result ---
    svcSetTimer     :: proc(timer: Handle, initial, interval: i64) -> Result ---
    svcCancelTimer  :: proc(timer: Handle) -> Result ---
    svcClearTimer   :: proc(timer: Handle) -> Result ---
    // Returns the raw ARM11 CPU tick counter.  Divide by SYSCLOCK_ARM11 for seconds.
    svcGetSystemTick :: proc() -> u64 ---

    // ── Handles / system ─────────────────────────────────────
    svcCloseHandle     :: proc(handle: Handle) -> Result ---
    svcDuplicateHandle :: proc(out: ^Handle, original: Handle) -> Result ---
    svcGetHandleInfo   :: proc(out: ^i64, handle: Handle, param: u32) -> Result ---
    svcGetSystemInfo   :: proc(out: ^i64, kind: u32, param: i32) -> Result ---

    // ── Device drivers / DMA ─────────────────────────────────
    svcBindInterrupt          :: proc(interruptId: u32, eventOrSemaphore: Handle, priority: i32, isManualClear: bool) -> Result ---
    svcUnbindInterrupt        :: proc(interruptId: u32, eventOrSemaphore: Handle) -> Result ---
    svcInvalidateProcessDataCache :: proc(process: Handle, addr, size: u32) -> Result ---
    svcStoreProcessDataCache  :: proc(process: Handle, addr, size: u32) -> Result ---
    svcFlushProcessDataCache  :: proc(process: Handle, addr, size: u32) -> Result ---
    svcStartInterProcessDma   :: proc(dma: ^Handle, dstProcess: Handle, dstAddr: u32, srcProcess: Handle, srcAddr, size: u32, cfg: ^DmaConfig) -> Result ---
    svcStopDma                :: proc(dma: Handle) -> Result ---
    svcGetDmaState            :: proc(state: ^DmaState, dma: Handle) -> Result ---
    svcRestartDma             :: proc(dma: Handle, dstAddr, srcAddr, size: u32, flags: i8) -> Result ---
    svcSetGpuProt             :: proc(useApplicationRestriction: bool) -> Result ---
    svcSetWifiEnabled         :: proc(enabled: bool) -> Result ---

    // ── Debugging ─────────────────────────────────────────────
    svcBreak               :: proc(breakReason: UserBreakType) ---
    svcOutputDebugString   :: proc(str: cstring, length: i32) -> Result ---
    svcDebugActiveProcess  :: proc(debug: ^Handle, processId: u32) -> Result ---
    svcBreakDebugProcess   :: proc(debug: Handle) -> Result ---
    svcTerminateDebugProcess :: proc(debug: Handle) -> Result ---
    svcReadProcessMemory   :: proc(buffer: rawptr, debug: Handle, addr, size: u32) -> Result ---
    svcWriteProcessMemory  :: proc(debug: Handle, buffer: rawptr, addr, size: u32) -> Result ---
    svcSetHardwareBreakPoint :: proc(registerId: i32, control, value: u32) -> Result ---
}
