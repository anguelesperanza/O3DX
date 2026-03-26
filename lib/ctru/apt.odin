package ctru

// ============================================================
// APT (Applet) service — 3ds/services/apt.h
// Handles home/sleep button policy, app lifecycle hooks,
// and launching library/system applets.
// ============================================================

// ── Enum types ───────────────────────────────────────────────

/// NS application IDs (applet identifiers).
NS_APPID :: enum u32 {
    NONE                = 0,
    HOMEMENU            = 0x101,
    CAMERA              = 0x110,
    FRIENDS_LIST        = 0x112,
    GAME_NOTES          = 0x113,
    WEB                 = 0x114,
    INSTRUCTION_MANUAL  = 0x115,
    NOTIFICATIONS       = 0x116,
    MIIVERSE            = 0x117,
    MIIVERSE_POSTING    = 0x118,
    AMIIBO_SETTINGS     = 0x119,
    APPLICATION         = 0x300,
    ESHOP               = 0x301,
    SOFTWARE_KEYBOARD   = 0x401,
    APPLETED            = 0x402,
    PNOTE_AP            = 0x404,
    SNOTE_AP            = 0x405,
    ERROR               = 0x406,
    MINT                = 0x407,
    EXTRAPAD            = 0x408,
    MEMOLIB             = 0x409,
}

/// Applet position within the applet stack.
APT_AppletPos :: enum i32 {
    NONE     = -1,
    APP      = 0,
    APPLIB   = 1,
    SYS      = 2,
    SYSLIB   = 3,
    RESIDENT = 4,
}

/// Reply to a sleep query.
APT_QueryReply :: enum u32 {
    REJECT = 0,
    ACCEPT = 1,
    LATER  = 2,
}

/// APT signals (state changes reported to the app).
APT_Signal :: enum u32 {
    NONE         = 0,
    HOMEBUTTON   = 1,
    HOMEBUTTON2  = 2,
    SLEEP_QUERY  = 3,
    SLEEP_CANCEL = 4,
    SLEEP_ENTER  = 5,
    SLEEP_WAKEUP = 6,
    SHUTDOWN     = 7,
    POWERBUTTON  = 8,
    POWERBUTTON2 = 9,
    TRY_SLEEP    = 10,
    ORDERTOCLOSE = 11,
}

/// APT commands sent as parameters between applets.
APT_Command :: enum u32 {
    NONE               = 0,
    WAKEUP             = 1,
    REQUEST            = 2,
    RESPONSE           = 3,
    EXIT               = 4,
    MESSAGE            = 5,
    HOMEBUTTON_ONCE    = 6,
    HOMEBUTTON_TWICE   = 7,
    DSP_SLEEP          = 8,
    DSP_WAKEUP         = 9,
    WAKEUP_EXIT        = 10,
    WAKEUP_PAUSE       = 11,
    WAKEUP_CANCEL      = 12,
    WAKEUP_CANCELALL   = 13,
    WAKEUP_POWERBUTTON = 14,
    WAKEUP_JUMPTOHOME  = 15,
    SYSAPPLET_REQUEST  = 16,
    WAKEUP_LAUNCHAPP   = 17,
}

/// APT lifecycle hook types.
APT_HookType :: enum u32 {
    ONSUSPEND = 0, ///< App suspended (going to background).
    ONRESTORE = 1, ///< App restored (coming to foreground).
    ONSLEEP   = 2, ///< System entering sleep mode.
    ONWAKEUP  = 3, ///< System waking from sleep.
    ONEXIT    = 4, ///< App exiting.
}

// ── Struct / callback types ───────────────────────────────────

/// APT applet attribute byte.  Build with aptMakeAppletAttr in C; for Odin pass 0 for defaults.
APT_AppletAttr :: u8

/// Callback invoked on APT lifecycle events.
aptHookFn :: #type proc "c" (hook: APT_HookType, param: rawptr)

/// Callback invoked when an inter-applet message is received.
aptMessageCb :: #type proc "c" (user: rawptr, sender: NS_APPID, msg: rawptr, msgsize: uint)

/// Opaque hook registration cookie — allocate on the stack; pass its address to aptHook.
aptHookCookie :: struct {
    next:     ^aptHookCookie,
    callback: aptHookFn,
    param:    rawptr,
}

/// Screen capture buffer descriptor used by APT_SendCaptureBufferInfo.
aptCaptureBufScreen :: struct {
    leftOffset:  u32,
    rightOffset: u32,
    format:      u32,
}
aptCaptureBufInfo :: struct {
    size:   u32,
    is3D:   u32,
    top:    aptCaptureBufScreen,
    bottom: aptCaptureBufScreen,
}

// ── Foreign functions ─────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Init / exit ───────────────────────────────────────────
    aptInit :: proc() -> Result ---
    aptExit :: proc() ---

    // ── Main loop helpers (call once per frame) ───────────────
    // aptMainLoop handles home-button and sleep automatically.
    // Returns false when the app should exit.
    // aptMainLoop is already declared in ctru.odin.

    // ── Status predicates ─────────────────────────────────────
    aptIsActive         :: proc() -> bool ---
    aptShouldClose      :: proc() -> bool ---
    aptShouldJumpToHome :: proc() -> bool ---

    // ── Sleep policy ──────────────────────────────────────────
    aptIsSleepAllowed :: proc() -> bool ---
    aptSetSleepAllowed :: proc(allowed: bool) ---
    aptHandleSleep    :: proc() ---

    // ── Home button policy ────────────────────────────────────
    aptIsHomeAllowed        :: proc() -> bool ---
    // Pass false to block home-button returns during gameplay.
    aptSetHomeAllowed       :: proc(allowed: bool) ---
    aptCheckHomePressRejected :: proc() -> bool ---
    aptJumpToHomeMenu       :: proc() ---

    // ── Lifecycle hooks ───────────────────────────────────────
    // Register a callback to be invoked on suspend/restore/sleep/wake/exit.
    aptHook   :: proc(cookie: ^aptHookCookie, callback: aptHookFn, param: rawptr) ---
    aptUnhook :: proc(cookie: ^aptHookCookie) ---

    // ── Inter-applet messaging ────────────────────────────────
    aptSetMessageCallback :: proc(callback: aptMessageCb, user: rawptr) ---

    // ── Library and system applets ────────────────────────────
    aptLaunchLibraryApplet :: proc(appId: NS_APPID, buf: rawptr, bufsize: uint, handle: Handle) ---
    aptLaunchSystemApplet  :: proc(appId: NS_APPID, buf: rawptr, bufsize: uint, handle: Handle) ---

    // ── Chainloader (relaunch / soft-reset) ───────────────────
    aptClearChainloader      :: proc() ---
    aptSetChainloader        :: proc(programID: u64, mediatype: u8) ---
    aptSetChainloaderToCaller :: proc() ---
    // Soft-reset: relaunch the current application.
    aptSetChainloaderToSelf  :: proc() ---

    // ── Low-level APT service calls ───────────────────────────
    APT_GetLockHandle          :: proc(flags: u16, lockHandle: ^Handle) -> Result ---
    APT_Initialize             :: proc(appId: NS_APPID, attr: APT_AppletAttr, signalEvent, resumeEvent: ^Handle) -> Result ---
    APT_Finalize               :: proc(appId: NS_APPID) -> Result ---
    APT_HardwareResetAsync     :: proc() -> Result ---
    APT_Enable                 :: proc(attr: APT_AppletAttr) -> Result ---
    APT_GetAppletManInfo       :: proc(inpos: APT_AppletPos, outpos: ^APT_AppletPos, req_appid, menu_appid, active_appid: ^NS_APPID) -> Result ---
    APT_GetAppletInfo          :: proc(appID: NS_APPID, pProgramID: ^u64, pMediaType: ^u8, pRegistered, pLoadState: ^bool, pAttributes: ^APT_AppletAttr) -> Result ---
    APT_GetProgramID           :: proc(pProgramID: ^u64) -> Result ---
    APT_IsRegistered           :: proc(appID: NS_APPID, out: ^bool) -> Result ---
    APT_InquireNotification    :: proc(appID: u32, signalType: ^APT_Signal) -> Result ---
    APT_NotifyToWait           :: proc(appID: NS_APPID) -> Result ---
    APT_AppletUtility          :: proc(id: i32, out: rawptr, outSize: uint, in_: rawptr, inSize: uint) -> Result ---
    APT_SleepIfShellClosed     :: proc() -> Result ---
    APT_LockTransition         :: proc(transition: u32, flag: bool) -> Result ---
    APT_TryLockTransition      :: proc(transition: u32, succeeded: ^bool) -> Result ---
    APT_UnlockTransition       :: proc(transition: u32) -> Result ---
    APT_GlanceParameter        :: proc(appID: NS_APPID, buffer: rawptr, bufferSize: uint, sender: ^NS_APPID, command: ^APT_Command, actualSize: ^uint, parameter: ^Handle) -> Result ---
    APT_ReceiveParameter       :: proc(appID: NS_APPID, buffer: rawptr, bufferSize: uint, sender: ^NS_APPID, command: ^APT_Command, actualSize: ^uint, parameter: ^Handle) -> Result ---
    APT_SendParameter          :: proc(source, dest: NS_APPID, command: APT_Command, buffer: rawptr, bufferSize: u32, parameter: Handle) -> Result ---
    APT_CancelParameter        :: proc(source, dest: NS_APPID, success: ^bool) -> Result ---
    APT_SendCaptureBufferInfo  :: proc(captureBuf: ^aptCaptureBufInfo) -> Result ---
    APT_ReplySleepQuery        :: proc(appID: NS_APPID, reply: APT_QueryReply) -> Result ---
    APT_ReplySleepNotificationComplete :: proc(appID: NS_APPID) -> Result ---
    APT_PrepareToCloseApplication :: proc(cancelPreload: bool) -> Result ---
    APT_CloseApplication       :: proc(param: rawptr, paramSize: uint, handle: Handle) -> Result ---
    // CPU time limit for the app on core 1 (0 = disabled, 1-80 = percent).
    APT_SetAppCpuTimeLimit     :: proc(percent: u32) -> Result ---
    APT_GetAppCpuTimeLimit     :: proc(percent: ^u32) -> Result ---
    // Check whether the hardware is a New 3DS.
    APT_CheckNew3DS            :: proc(out: ^bool) -> Result ---
    APT_PrepareToJumpToHomeMenu :: proc() -> Result ---
    APT_JumpToHomeMenu         :: proc(param: rawptr, paramSize: uint, handle: Handle) -> Result ---
    APT_PrepareToJumpToApplication :: proc(exiting: bool) -> Result ---
    APT_JumpToApplication      :: proc(param: rawptr, paramSize: uint, handle: Handle) -> Result ---
    APT_PrepareToStartLibraryApplet :: proc(appID: NS_APPID) -> Result ---
    APT_StartLibraryApplet     :: proc(appID: NS_APPID, param: rawptr, paramSize: uint, handle: Handle) -> Result ---
    APT_PrepareToStartSystemApplet :: proc(appID: NS_APPID) -> Result ---
    APT_StartSystemApplet      :: proc(appID: NS_APPID, param: rawptr, paramSize: uint, handle: Handle) -> Result ---
    APT_GetSharedFont          :: proc(fontHandle: ^Handle, mapAddr: ^u32) -> Result ---
    APT_ReceiveDeliverArg      :: proc(param: rawptr, paramSize: uint, hmac: rawptr, sender: ^u64, received: ^bool) -> Result ---
    APT_PrepareToDoApplicationJump :: proc(flags: u8, programID: u64, mediatype: u8) -> Result ---
    APT_DoApplicationJump      :: proc(param: rawptr, paramSize: uint, hmac: rawptr) -> Result ---
}
