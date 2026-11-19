package ctru

// ============================================================
// PTM — power, battery, pedometer and system power control
// 3ds/services/ptmu.h, 3ds/services/ptmgets.h, 3ds/services/ptmsets.h, 3ds/services/ptmsysm.h
//
// ptm:u gives battery level, charging and adapter state, the shell (lid) state and the
// pedometer; ptm:gets/sets/sysm read and set the RTC and control sleep, shutdown and reboot.
// ============================================================

// PDN wake events and MCU interrupts to select, combined with those of other processes
PtmWakeEvents :: struct {
    pdn_wake_events:   u32, // Written to PDN_WAKE_EVENTS. Don't select bit26 (MCU), PTM will do it automatically.
    mcu_interupt_mask: u32, // MCU interrupts to check when a MCU wake event happens.
}

PtmSleepConfig :: struct {
    exit_sleep_events:     PtmWakeEvents, // Wake events for which the system should fully wake up.
    continue_sleep_events: PtmWakeEvents, // Wake events for which the system should return to sleep.
}

PTMNOTIFID_SLEEP_REQUESTED  :: 0x101 // PTMSYSM_RequestSleep has been called (ack = 3)
PTMNOTIFID_SLEEP_DENIED     :: 0x102 // The sleep request has been denied by PTMSYSM_ReplyToSleepQuery(true) (no ack required).
PTMNOTIFID_SLEEP_ALLOWED    :: 0x103 // The sleep request has been allowed by PTMSYSM_ReplyToSleepQuery(false) (ack = 1).
PTMNOTIFID_GOING_TO_SLEEP   :: 0x104 // All processes not having "RunnableOnSleep" have been paused & the system is about to go to sleep (ack = 0).
PTMNOTIFID_FULLY_WAKING_UP  :: 0x105 // The system has been woken up, and the paused processes are about to be unpaused (ack = 1).
PTMNOTIFID_FULLY_AWAKE      :: 0x106 // The system is fully awake (no ack required).
PTMNOTIFID_HALF_AWAKE       :: 0x107 // The system has been woken up but is about to go to sleep again (ack = 2).
PTMNOTIFID_SHUTDOWN         :: 0x108 // The system is about to power off or reboot.
PTMNOTIFID_BATTERY_VERY_LOW :: 0x211 // The battery level has reached 5% or below.
PTMNOTIFID_BATTERY_LOW      :: 0x212 // The battery level has reached 10% or below.

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes PTMU.
    ptmuInit :: proc() -> Result ---

    // Exits PTMU.
    ptmuExit :: proc() ---

    // Gets a pointer to the current ptm:u session handle.
    ptmuGetSessionHandle :: proc() -> ^Handle ---

    // Gets the system's current shell state.
    PTMU_GetShellState :: proc(out: ^u8) -> Result ---

    // Gets the system's current battery level.
    PTMU_GetBatteryLevel :: proc(out: ^u8) -> Result ---

    // Gets the system's current battery charge state.
    PTMU_GetBatteryChargeState :: proc(out: ^u8) -> Result ---

    // Gets the system's current pedometer state.
    PTMU_GetPedometerState :: proc(out: ^u8) -> Result ---

    // Gets the system's step count history.
    PTMU_GetStepHistory :: proc(hours: u32, stepValue: ^u16) -> Result ---

    // Gets the pedometer's total step count.
    PTMU_GetTotalStepCount :: proc(steps: ^u32) -> Result ---

    // Gets whether the adapter is plugged in or not
    PTMU_GetAdapterState :: proc(out: ^bool) -> Result ---

    // Initializes PTMGETS.
    ptmGetsInit :: proc() -> Result ---

    // Exits PTMGETS.
    ptmGetsExit :: proc() ---

    // Gets a pointer to the current ptm:gets session handle.
    ptmGetsGetSessionHandle :: proc() -> ^Handle ---

    // Gets the system time.
    PTMGETS_GetSystemTime :: proc(outMsY2k: ^i64) -> Result ---

    // Initializes PTMSETS.
    ptmSetsInit :: proc() -> Result ---

    // Exits PTMSETS.
    ptmSetsExit :: proc() ---

    // Gets a pointer to the current ptm:sets session handle.
    ptmSetsGetSessionHandle :: proc() -> ^Handle ---

    // Sets the system time.
    PTMSETS_SetSystemTime :: proc(msY2k: i64) -> Result ---

    // Initializes ptm:sysm.
    ptmSysmInit :: proc() -> Result ---

    // Exits ptm:sysm.
    ptmSysmExit :: proc() ---

    // Gets a pointer to the current ptm:sysm session handle.
    ptmSysmGetSessionHandle :: proc() -> ^Handle ---

    // Requests to enter sleep mode.
    PTMSYSM_RequestSleep :: proc() -> Result ---

    // Accepts or denies the incoming sleep mode request.
    PTMSYSM_ReplyToSleepQuery :: proc(deny: bool) -> Result ---

    // Acknowledges the current sleep notification and advance the internal sleep mode FSM. All
    // subscribers must reply.
    PTMSYSM_NotifySleepPreparationComplete :: proc(ackValue: i32) -> Result ---

    // Sets the wake events (two sets: when to fully wake up and when to return to sleep).
    PTMSYSM_SetWakeEvents :: proc(sleepConfig: ^PtmSleepConfig) -> Result ---

    // Gets the wake reason (only the first applicable wake event is taken into account).
    PTMSYSM_GetWakeReason :: proc(outSleepConfig: ^PtmSleepConfig) -> Result ---

    // Cancels the "half-awake" state and fully wakes up the 3DS after some delay.
    PTMSYSM_Awaken :: proc() -> Result ---

    // Clear the "step history".
    PTMSYSM_ClearStepHistory :: proc() -> Result ---

    // Sets the system's step count history.
    PTMSYSM_SetStepHistory :: proc(hours: u32, stepValue: ^u16) -> Result ---

    // Clear the "play history".
    PTMSYSM_ClearPlayHistory :: proc() -> Result ---

    // Sets the user time by updating the user time offset.
    PTMSYSM_SetUserTime :: proc(msY2k: i64) -> Result ---

    // Invalidates the "system time" (cfg block 0x30002)
    PTMSYSM_InvalidateSystemTime :: proc() -> Result ---

    // Reads the time and date coming from the RTC and converts the result.
    PTMSYSM_GetRtcTime :: proc(outMsY2k: ^i64) -> Result ---

    // Writes the time and date coming to the RTC, after conversion.
    PTMSYSM_SetRtcTime :: proc(msY2k: i64) -> Result ---

    // Checks whether the system is a New 3DS.
    PTMSYSM_CheckNew3DS :: proc(out: ^bool) -> Result ---

    // Configures the New 3DS' CPU clock speed and L2 cache.
    PTMSYSM_ConfigureNew3DSCPU :: proc(value: u8) -> Result ---

    // Trigger a hardware system shutdown via the MCU.
    PTMSYSM_ShutdownAsync :: proc(timeout: u64) -> Result ---

    // Trigger a hardware system reboot via the MCU.
    PTMSYSM_RebootAsync :: proc(timeout: u64) -> Result ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // See PTMSYSM_NotifySleepPreparationComplete. Corresponds to the number of potentially remaning
    // notifs. until sleep/wakeup.
    @(link_name = "ctru_ptm_sysm_get_notification_ack_value")
    ptmSysmGetNotificationAckValue :: proc(id: u32) -> i32 ---
}
