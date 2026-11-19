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
MemState :: enum u8 {
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
MemRegion :: enum u8 {
    ALL         = 0,
    APPLICATION = 1,
    SYSTEM      = 2,
    BASE        = 3,
}

/// Address arbitration modes.
ArbitrationType :: enum u8 {
    SIGNAL                                  = 0,
    WAIT_IF_LESS_THAN                       = 1,
    DECREMENT_AND_WAIT_IF_LESS_THAN         = 2,
    WAIT_IF_LESS_THAN_TIMEOUT               = 3,
    DECREMENT_AND_WAIT_IF_LESS_THAN_TIMEOUT = 4,
}

/// Event and timer reset types.
ResetType :: enum u8 {
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
DmaState :: enum u8 {
    STARTING = 0,
    WFP_DST  = 1,
    WFP_SRC  = 2,
    RUNNING  = 3,
    DONE     = 4,
}

/// User break reasons for svcBreak.
UserBreakType :: enum u8 {
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

// ============================================================
// Remaining SVCs and helpers (3ds/svc.h): process creation, debugging, performance counters, DMA config helpers
// ============================================================

// Types of thread info.
ThreadInfoType :: enum u8 {
    THREADINFO_TYPE_UNKNOWN = 0, // Unknown.
}

// Configuration flags for DmaConfig.
DMACFG_SRC_IS_DEVICE  :: 1 // DMA source is a device/peripheral. Address will not auto-increment.
DMACFG_DST_IS_DEVICE  :: 2 // DMA destination is a device/peripheral. Address will not auto-increment.
DMACFG_WAIT_AVAILABLE :: 4 // Make svcStartInterProcessDma wait for the channel to be unlocked.
DMACFG_KEEP_LOCKED    :: 8 // Keep the channel locked after the transfer. Required for svcRestartDma.
DMACFG_USE_SRC_CONFIG :: 0x40 // Use the provided source device configuration even if the DMA source is not a device.
DMACFG_USE_DST_CONFIG :: 0x80 // Use the provided destination device configuration even if the DMA destination is not a device.

// Configuration flags for svcRestartDma.
DMARST_UNLOCK        :: 1 // Unlock the channel after transfer.
DMARST_RESUME_DEVICE :: 2 // Replace DMAFLUSHP instructions by NOP (they may not be regenerated even if this flag is not set).

PerfCounterOperation :: enum u8 {
    ENABLE                      = 0, // Enable and lock perfmon. functionality.
    DISABLE                     = 1, // Disable and forcibly unlock perfmon. functionality.
    GET_VALUE                   = 2, // Get the value of a counter register.
    SET_VALUE                   = 3, // Set the value of a counter register.
    GET_OVERFLOW_FLAGS          = 4, // Get the overflow flags for all CP15 and SCU counters.
    RESET                       = 5, // Reset the value and/or overflow flags of selected counters.
    GET_EVENT                   = 6, // Get the event ID associated to a particular counter.
    SET_EVENT                   = 7, // Set the event ID associated to a paritcular counter.
    SET_VIRTUAL_COUNTER_ENABLED = 8, // (Dis)allow the kernel to track counter overflows and to use 64-bit counter values.
}

// Performance counter register IDs (CP15 and SCU).
PerfCounterRegister :: enum u8 {
    CORE_BASE          = 0x0, // CP15 PMN0.
    CORE_COUNT_REG_0   = 0x0, // CP15 PMN0.
    CORE_COUNT_REG_1   = 0x1, // CP15 PMN1.
    CORE_CYCLE_COUNTER = 0x2, // CP15 CCNT.
    SCU_BASE           = 0x10, // SCU MN0.
    SCU_0              = 0x10, // SCU MN0.
    SCU_1              = 0x11, // SCU MN1.
    SCU_2              = 0x12, // SCU MN2.
    SCU_3              = 0x13, // SCU MN3.
    SCU_4              = 0x14, // SCU MN4. Prod-N3DS only. IRQ line missing.
    SCU_5              = 0x15, // SCU MN5. Prod-N3DS only. IRQ line missing.
    SCU_6              = 0x16, // SCU MN6. Prod-N3DS only. IRQ line missing.
    SCU_7              = 0x17, // SCU MN7. Prod-N3DS only. IRQ line missing.
}

// Performance counter event IDs (CP15 or SCU).
PerfCounterEvent :: enum u16 {
    CORE_BASE                     = 0x0, // One cycle elapsed.
    CORE_INST_CACHE_MISS          = 0x0,
    CORE_STALL_BY_LACK_OF_INST    = 0x1,
    CORE_STALL_BY_DATA_HAZARD     = 0x2,
    CORE_INST_MICRO_TLB_MISS      = 0x3,
    CORE_DATA_MICRO_TLB_MISS      = 0x4,
    CORE_BRANCH_INST              = 0x5,
    CORE_BRANCH_NOT_PREDICTED     = 0x6,
    CORE_BRANCH_MISS_PREDICTED    = 0x7,
    CORE_INST_EXECUTED            = 0x8,
    CORE_FOLDED_INST_EXECUTED     = 0x9,
    CORE_DATA_CACHE_READ          = 0xA,
    CORE_DATA_CACHE_READ_MISS     = 0xB,
    CORE_DATA_CACHE_WRITE         = 0xC,
    CORE_DATA_CACHE_WRITE_MISS    = 0xD,
    CORE_DATA_CACHE_LINE_EVICTION = 0xE,
    CORE_PC_CHANGED               = 0xF,
    CORE_MAIN_TLB_MISS            = 0x10,
    CORE_EXTERNAL_REQUEST         = 0x11,
    CORE_STALL_BY_LSU_FULL        = 0x12,
    CORE_STORE_BUFFER_DRAIN       = 0x13,
    CORE_MERGE_IN_STORE_BUFFER    = 0x14,
    CORE_CYCLE_COUNT              = 0xFF, // One cycle elapsed.
    CORE_CYCLE_COUNT_64           = 0xFFF, // 64 cycles elapsed.
    SCU_BASE                      = 0x1000,
    SCU_DISABLED                  = 0x1000,
    SCU_LINEFILL_MISS_FROM_CORE0  = 0x1001,
    SCU_LINEFILL_MISS_FROM_CORE1  = 0x1002,
    SCU_LINEFILL_MISS_FROM_CORE2  = 0x1003,
    SCU_LINEFILL_MISS_FROM_CORE3  = 0x1004,
    SCU_LINEFILL_HIT_FROM_CORE0   = 0x1005,
    SCU_LINEFILL_HIT_FROM_CORE1   = 0x1006,
    SCU_LINEFILL_HIT_FROM_CORE2   = 0x1007,
    SCU_LINEFILL_HIT_FROM_CORE3   = 0x1008,
    SCU_LINE_MISSING_FROM_CORE0   = 0x1009,
    SCU_LINE_MISSING_FROM_CORE1   = 0x100A,
    SCU_LINE_MISSING_FROM_CORE2   = 0x100B,
    SCU_LINE_MISSING_FROM_CORE3   = 0x100C,
    SCU_LINE_MIGRATION            = 0x100D,
    SCU_READ_BUSY_PORT0           = 0x100E,
    SCU_READ_BUSY_PORT1           = 0x100F,
    SCU_WRITE_BUSY_PORT0          = 0x1010,
    SCU_WRITE_BUSY_PORT1          = 0x1011,
    SCU_EXTERNAL_READ             = 0x1012,
    SCU_EXTERNAL_WRITE            = 0x1013,
    SCU_CYCLE_COUNT               = 0x101F,
}

// Event relating to the attachment of a process.
AttachProcessEvent :: struct {
    program_id:   u64, // ID of the program.
    process_name: [8]u8, // Name of the process.
    process_id:   u32, // ID of the process.
    other_flags:  u32, // Always 0
}

// Reasons for an exit process event.
ExitProcessEventReason :: enum u8 {
    EXIT            = 0, // Process exited either normally or due to an uncaught exception.
    TERMINATE       = 1, // Process has been terminated by svcTerminateProcess.
    DEBUG_TERMINATE = 2, // Process has been terminated by svcTerminateDebugProcess.
}

// Event relating to the exiting of a process.
ExitProcessEvent :: struct {
    reason: ExitProcessEventReason, // Reason for exiting. See ExitProcessEventReason
}

// Event relating to the attachment of a thread.
AttachThreadEvent :: struct {
    creator_thread_id:    u32, // ID of the creating thread.
    thread_local_storage: u32, // Thread local storage.
    entry_point:          u32, // Entry point of the thread.
}

// Reasons for an exit thread event.
ExitThreadEventReason :: enum u8 {
    EXIT              = 0, // Thread exited.
    TERMINATE         = 1, // Thread terminated.
    EXIT_PROCESS      = 2, // Process exited either normally or due to an uncaught exception.
    TERMINATE_PROCESS = 3, // Process has been terminated by svcTerminateProcess.
}

// Event relating to the exiting of a thread.
ExitThreadEvent :: struct {
    reason: ExitThreadEventReason, // Reason for exiting. See ExitThreadEventReason
}

// Reasons for an exception event.
ExceptionEventType :: enum u8 {
    UNDEFINED_INSTRUCTION = 0, // Undefined instruction.
    PREFETCH_ABORT        = 1, // Prefetch abort.
    DATA_ABORT            = 2, // Data abort (other than the below kind).
    UNALIGNED_DATA_ACCESS = 3, // Unaligned data access.
    ATTACH_BREAK          = 4, // Attached break.
    STOP_POINT            = 5, // Stop point reached.
    USER_BREAK            = 6, // User break occurred.
    DEBUGGER_BREAK        = 7, // Debugger break occurred.
    UNDEFINED_SYSCALL     = 8, // Undefined syscall.
}

// Event relating to fault exceptions (CPU exceptions other than stop points and undefined
// syscalls).
FaultExceptionEvent :: struct {
    fault_information: u32, // FAR (for DATA ABORT / UNALIGNED DATA ACCESS), attempted syscall or 0
}

// Stop point types
StopPointType :: enum u8 {
    SVC_FF     = 0, // See SVC_STOP_POINT.
    BREAKPOINT = 1, // Breakpoint.
    WATCHPOINT = 2, // Watchpoint.
}

// Event relating to stop points
StopPointExceptionEvent :: struct {
    type_:             StopPointType, // Stop point type, see StopPointType.
    fault_information: u32, // FAR for Watchpoints, otherwise 0.
}

// Event relating to svcBreak
UserBreakExceptionEvent :: struct {
    type_:       UserBreakType, // User break type, see UserBreakType.
    croInfo:     u32, // For LOAD_RO and UNLOAD_RO.
    croInfoSize: u32, // For LOAD_RO and UNLOAD_RO.
}

// Event relating to svcBreakDebugProcess
DebuggerBreakExceptionEvent :: struct {
    thread_ids: [4]i32, // IDs of the attached process's threads that were running on each core at the time of the svcBreakDebugProcess call, or -1 (only the first 2 values are meaningful on O3DS).
}

// Event relating to exceptions.
// Opaque here: the C type has a nested struct/union. 24 bytes.
ExceptionEvent :: struct #align(4) {
    _: [24]u8,
}

// Event relating to the scheduler.
ScheduleInOutEvent :: struct {
    clock_tick: u64, // Clock tick that the event occurred.
}

// Event relating to syscalls.
SyscallInOutEvent :: struct {
    clock_tick: u64, // Clock tick that the event occurred.
    syscall:    u32, // Syscall sent/received.
}

// Event relating to debug output.
OutputStringEvent :: struct {
    string_addr: u32, // Address of the outputted string.
    string_size: u32, // Size of the outputted string.
}

// Event relating to the mapping of memory.
MapEvent :: struct {
    mapped_addr: u32, // Mapped address.
    mapped_size: u32, // Mapped size.
    memperm:     MemPerm, // Memory permissions. See MemPerm.
    memstate:    MemState, // Memory state. See MemState.
}

// Debug event type.
DebugEventType :: enum u8 {
    ATTACH_PROCESS = 0x0, // Process attached event.
    ATTACH_THREAD  = 0x1, // Thread attached event.
    EXIT_THREAD    = 0x2, // Thread exit event.
    EXIT_PROCESS   = 0x3, // Process exit event.
    EXCEPTION      = 0x4, // Exception event.
    DLL_LOAD       = 0x5, // DLL load event.
    DLL_UNLOAD     = 0x6, // DLL unload event.
    SCHEDULE_IN    = 0x7, // Schedule in event.
    SCHEDULE_OUT   = 0x8, // Schedule out event.
    SYSCALL_IN     = 0x9, // Syscall in event.
    SYSCALL_OUT    = 0xA, // Syscall out event.
    OUTPUT_STRING  = 0xB, // Output string event.
    MAP            = 0xC, // Map event.
}

// Information about a debug event.
// Opaque here: the C type has a nested struct/union. 40 bytes.
DebugEventInfo :: struct #align(8) {
    _: [40]u8,
}

// Debug flags for an attached process, set by svcContinueDebugEvent
DebugFlags :: enum u8 {
    INHIBIT_USER_CPU_EXCEPTION_HANDLERS = 0x1, // Inhibit user-defined CPU exception handlers (including watchpoints and breakpoints, regardless of any svcKernelSetState call).
    SIGNAL_FAULT_EXCEPTION_EVENTS       = 0x2, // Signal fault exception events. See FaultExceptionEvent.
    SIGNAL_SCHEDULE_EVENTS              = 0x4, // Signal schedule in/out events. See ScheduleInOutEvent.
    SIGNAL_SYSCALL_EVENTS               = 0x8, // Signal syscall in/out events. See SyscallInOutEvent.
    SIGNAL_MAP_EVENTS                   = 0x10, // Signal map events. See MapEvent.
}

ThreadContext :: struct {
    cpu_registers: CpuRegisters, // CPU registers.
    fpu_registers: FpuRegisters, // FPU registers.
}

// Control flags for svcGetDebugThreadContext and svcSetDebugThreadContext
ThreadContextControlFlags :: enum u8 {
    CPU_GPRS = 0x1, // Control r0-r12.
    CPU_SPRS = 0x2, // Control sp, lr, pc, cpsr.
    FPU_GPRS = 0x4, // Control d0-d15 (or s0-s31).
    FPU_SPRS = 0x8, // Control fpscr, fpexc.
    CPU_REGS = 0x3, // Control r0-r12, sp, lr, pc, cpsr.
    FPU_REGS = 0xC, // Control d0-d15, fpscr, fpexc.
    ALL      = 0xF, // Control all of the above.
}

// Thread parameter field for svcGetDebugThreadParameter
DebugThreadParameter :: enum u8 {
    PRIORITY            = 0, // Thread priority.
    SCHEDULING_MASK_LOW = 1, // Low scheduling mask.
    CPU_IDEAL           = 2, // Ideal processor.
    CPU_CREATOR         = 3, // Processor that created the threod.
}

CodeSetHeader :: struct {
    name:            [8]u8, // ASCII name of codeset
    version:         u16, // Version field of codeset (unused)
    padding:         [3]u16, // Padding
    text_addr:       u32, // .text start address
    text_size:       u32, // .text number of pages
    ro_addr:         u32, // .rodata start address
    ro_size:         u32, // .rodata number of pages
    rw_addr:         u32, // .data, .bss start address
    rw_size:         u32, // .data number of pages
    text_size_total: u32, // total pages for .text (aligned)
    ro_size_total:   u32, // total pages for .rodata (aligned)
    rw_size_total:   u32, // total pages for .data, .bss (aligned)
    padding2:        u32, // Padding
    program_id:      u64, // Program ID
}

// Information for the main thread of a process.
StartupInfo :: struct {
    priority:   i32, // Priority of the main thread.
    stack_size: u32, // Size of the stack of the main thread.
    argc:       i32, // Unused on retail kernel.
    argv:       ^u16, // Unused on retail kernel.
    envp:       ^u16, // Unused on retail kernel.
}

@(default_calling_convention = "c")
foreign ctru {
    // Sets up virtual address space for a new process.
    svcCreateCodeSet :: proc(out: ^Handle, info: ^CodeSetHeader, textSegmentLma: u32, roSegmentLma: u32, dataSegmentLma: u32) -> Result ---

    // Create a new process.
    svcCreateProcess :: proc(out: ^Handle, codeset: Handle, arm11KernelCaps: ^u32, numArm11KernelCaps: i32) -> Result ---

    // Launches the main thread of the process.
    svcRun :: proc(process: Handle, info: ^StartupInfo) -> Result ---

    // Sets the current kernel state.
    svcKernelSetState :: proc(type_: u32, #c_vararg args: ..any) -> Result ---

    // Controls performance monitoring on the CP15 interface and the SCU. The meaning of the
    // parameters depend on the operation.
    svcControlPerformanceCounter :: proc(out: ^u64, op: PerfCounterOperation, param1: u32, param2: u64) -> Result ---

    // Gets the current debug event of a debugged process.
    svcGetProcessDebugEvent :: proc(info: ^DebugEventInfo, debug: Handle) -> Result ---

    // Continues the current debug event of a debugged process (not necessarily the same as
    svcContinueDebugEvent :: proc(debug: Handle, flags: DebugFlags) -> Result ---

    // Fetches the saved registers of a thread, either inactive or awaiting
    svcGetDebugThreadContext :: proc(context_: ^ThreadContext, debug: Handle, threadId: u32, controlFlags: ThreadContextControlFlags) -> Result ---

    // Updates the saved registers of a thread, either inactive or awaiting
    svcSetDebugThreadContext :: proc(debug: Handle, threadId: u32, context_: ^ThreadContext, controlFlags: ThreadContextControlFlags) -> Result ---

    // Queries memory information of a debugged process.
    svcQueryDebugProcessMemory :: proc(info: ^MemInfo, out: ^PageInfo, debug: Handle, addr: u32) -> Result ---

    // Gets a debugged thread's parameter.
    svcGetDebugThreadParam :: proc(unused: ^i64, out: ^u32, debug: Handle, threadId: u32, parameter: DebugThreadParameter) -> Result ---

    // Executes a function in supervisor mode.
    svcBackdoor :: proc(callback: proc "c" () -> i32) -> Result ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Gets the thread local storage buffer.
    @(link_name = "ctru_get_thread_local_storage")
    getThreadLocalStorage :: proc() -> rawptr ---

    // Gets the thread command buffer.
    @(link_name = "ctru_get_thread_command_buffer")
    getThreadCommandBuffer :: proc() -> ^u32 ---

    // Gets the thread static buffer.
    @(link_name = "ctru_get_thread_static_buffers")
    getThreadStaticBuffers :: proc() -> ^u32 ---

    @(link_name = "ctru_dma_device_config_init_default")
    dmaDeviceConfigInitDefault :: proc(cfg: ^DmaDeviceConfig) ---

    // Initializes a DmaConfig instance with sane defaults for RAM<>RAM tranfers
    @(link_name = "ctru_dma_config_init_default")
    dmaConfigInitDefault :: proc(cfg: ^DmaConfig) ---
}
