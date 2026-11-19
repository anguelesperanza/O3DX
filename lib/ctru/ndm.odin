package ctru

// ============================================================
// NDM — network daemon manager
// 3ds/services/ndm.h
//
// Suspends and resumes the console's background network daemons.
// ============================================================

// Exclusive states.
ndmExclusiveState :: enum u8 {
    NONE                 = 0,
    INFRASTRUCTURE       = 1,
    LOCAL_COMMUNICATIONS = 2,
    STREETPASS           = 3,
    STREETPASS_DATA      = 4,
}

// Current states.
ndmState :: enum u8 {
    INITIAL                            = 0x0,
    SUSPENDED                          = 0x1,
    INFRASTRUCTURE_CONNECTING          = 0x2,
    INFRASTRUCTURE_CONNECTED           = 0x3,
    INFRASTRUCTURE_WORKING             = 0x4,
    INFRASTRUCTURE_SUSPENDING          = 0x5,
    INFRASTRUCTURE_FORCE_SUSPENDING    = 0x6,
    INFRASTRUCTURE_DISCONNECTING       = 0x7,
    INFRASTRUCTURE_FORCE_DISCONNECTING = 0x8,
    CEC_WORKING                        = 0x9,
    CEC_FORCE_SUSPENDING               = 0xA,
    CEC_SUSPENDING                     = 0xB,
}

ndmDaemon :: enum u8 {
    CEC     = 0,
    BOSS    = 1,
    NIM     = 2,
    FRIENDS = 3,
}

// Used to specify multiple daemons.
ndmDaemonMask :: enum u8 {
    CEC         = 0x1,
    BOSS        = 0x2,
    NIM         = 0x4,
    FRIENDS     = 0x8,
    BACKGROUOND = 0x7,
    ALL         = 0xF,
    DEFAULT     = 0x9,
}

ndmDaemonStatus :: enum u8 {
    BUSY       = 0,
    IDLE       = 1,
    SUSPENDING = 2,
    SUSPENDED  = 3,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes ndmu.
    ndmuInit :: proc() -> Result ---

    // Exits ndmu.
    ndmuExit :: proc() ---

    // Sets the network daemon to an exclusive state.
    NDMU_EnterExclusiveState :: proc(state: ndmExclusiveState) -> Result ---

    // Cancels an exclusive state for the network daemon.
    NDMU_LeaveExclusiveState :: proc() -> Result ---

    // Returns the exclusive state for the network daemon.
    NDMU_GetExclusiveState :: proc(state: ^ndmExclusiveState) -> Result ---

    // Locks the exclusive state.
    NDMU_LockState :: proc() -> Result ---

    // Unlocks the exclusive state.
    NDMU_UnlockState :: proc() -> Result ---

    // Suspends network daemon.
    NDMU_SuspendDaemons :: proc(mask: ndmDaemonMask) -> Result ---

    // Resumes network daemon.
    NDMU_ResumeDaemons :: proc(mask: ndmDaemonMask) -> Result ---

    // Suspends scheduling for all network daemons.
    NDMU_SuspendScheduler :: proc(flag: u32) -> Result ---

    // Resumes daemon scheduling.
    NDMU_ResumeScheduler :: proc() -> Result ---

    // Returns the current state for the network daemon.
    NDMU_GetCurrentState :: proc(state: ^ndmState) -> Result ---

    // Returns a daemon state.
    NDMU_QueryStatus :: proc(daemon: ndmDaemon, status: ^ndmDaemonStatus) -> Result ---

    // Sets the scan interval.
    NDMU_SetScanInterval :: proc(interval: u32) -> Result ---

    // Returns the scan interval.
    NDMU_GetScanInterval :: proc(interval: ^u32) -> Result ---

    // Returns the retry interval.
    NDMU_GetRetryInterval :: proc(interval: ^u32) -> Result ---

    // Reverts network daemon to defaults.
    NDMU_ResetDaemons :: proc() -> Result ---

    // Gets the current default daemon bit mask.
    NDMU_GetDefaultDaemons :: proc(mask: ^ndmDaemonMask) -> Result ---

    // Clears half awake mac filter.
    NDMU_ClearMacFilter :: proc() -> Result ---
}
