package ctru

// ============================================================
// PM — process manager
// 3ds/services/pmapp.h, 3ds/services/pmdbg.h, 3ds/services/pxipm.h, 3ds/services/srvpm.h
//
// Launching, terminating and debugging processes (pm:app, pm:dbg), and the PXI and SRV sides
// (pxi:pm, srv:pm).
// ============================================================

// Launch flags for PM launch commands.
PMLAUNCHFLAG_NORMAL_APPLICATION            :: 1
PMLAUNCHFLAG_LOAD_DEPENDENCIES             :: 2
PMLAUNCHFLAG_NOTIFY_TERMINATION            :: 4
PMLAUNCHFLAG_QUEUE_DEBUG_APPLICATION       :: 8
PMLAUNCHFLAG_TERMINATION_NOTIFICATION_MASK :: 0xF0
PMLAUNCHFLAG_FORCE_USE_O3DS_APP_MEM        :: 0x100 // Forces the usage of the O3DS system mode app memory setting even if N3DS system mode is not "Legacy". Dev4 and Dev5 not supported. N3DS only.
PMLAUNCHFLAG_FORCE_USE_O3DS_MAX_APP_MEM    :: 0x200 // In conjunction with the above, forces the 96MB app memory setting. N3DS only.
PMLAUNCHFLAG_USE_UPDATE_TITLE              :: 0x10000

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes pm:app.
    pmAppInit :: proc() -> Result ---

    // Exits pm:app.
    pmAppExit :: proc() ---

    // Gets the current pm:app session handle.
    pmAppGetSessionHandle :: proc() -> ^Handle ---

    // Launches a title.
    PMAPP_LaunchTitle :: proc(programInfo: ^FS_ProgramInfo, launchFlags: u32) -> Result ---

    // Launches a title, applying patches.
    PMAPP_LaunchTitleUpdate :: proc(programInfo: ^FS_ProgramInfo, programInfoUpdate: ^FS_ProgramInfo, launchFlags: u32) -> Result ---

    // Gets a title's ExHeader Arm11CoreInfo and SystemInfo flags.
    PMAPP_GetTitleExheaderFlags :: proc(outCoreInfo: ^ExHeader_Arm11CoreInfo, outSiFlags: ^ExHeader_SystemInfoFlags, programInfo: ^FS_ProgramInfo) -> Result ---

    // Sets the current FIRM launch parameters.
    PMAPP_SetFIRMLaunchParams :: proc(size: u32, in_: rawptr) -> Result ---

    // Gets the current FIRM launch parameters.
    PMAPP_GetFIRMLaunchParams :: proc(out: rawptr, size: u32) -> Result ---

    // Sets the current FIRM launch parameters.
    PMAPP_LaunchFIRMSetParams :: proc(firmTidLow: u32, size: u32, in_: rawptr) -> Result ---

    // Terminate most processes, to prepare for a reboot or a shutdown.
    PMAPP_PrepareForReboot :: proc(timeout: i64) -> Result ---

    // Terminates the current Application
    PMAPP_TerminateCurrentApplication :: proc(timeout: i64) -> Result ---

    // Terminates the processes having the specified titleId.
    PMAPP_TerminateTitle :: proc(titleId: u64, timeout: i64) -> Result ---

    // Terminates the specified process
    PMAPP_TerminateProcess :: proc(pid: u32, timeout: i64) -> Result ---

    // Unregisters a process
    PMAPP_UnregisterProcess :: proc(tid: u64) -> Result ---

    // Sets the APPLICATION cputime reslimit.
    PMAPP_SetAppResourceLimit :: proc(cpuTime: i64) -> Result ---

    // Gets the APPLICATION cputime reslimit.
    PMAPP_GetAppResourceLimit :: proc(outCpuTime: ^i64) -> Result ---

    // Initializes pm:dbg.
    pmDbgInit :: proc() -> Result ---

    // Exits pm:dbg.
    pmDbgExit :: proc() ---

    // Gets the current pm:dbg session handle.
    pmDbgGetSessionHandle :: proc() -> ^Handle ---

    // Enqueues an application for debug after setting cpuTime to 0, and returns a debug handle to
    // it. If another process was enqueued, this just calls
    PMDBG_LaunchAppDebug :: proc(outDebug: ^Handle, programInfo: ^FS_ProgramInfo, launchFlags: u32) -> Result ---

    // Launches an application for debug after setting cpuTime to 0.
    PMDBG_LaunchApp :: proc(programInfo: ^FS_ProgramInfo, launchFlags: u32) -> Result ---

    // Runs the queued process and returns a debug handle to it.
    PMDBG_RunQueuedProcess :: proc(outDebug: ^Handle) -> Result ---

    // Initializes PxiPM.
    pxiPmInit :: proc() -> Result ---

    // Exits PxiPM.
    pxiPmExit :: proc() ---

    // Gets the current PxiPM session handle.
    pxiPmGetSessionHandle :: proc() -> ^Handle ---

    // Retrives the exheader information set(s) (SCI+ACI) about a program.
    PXIPM_GetProgramInfo :: proc(exheaderInfo: ^ExHeader_Info, programHandle: u64) -> Result ---

    // Loads a program and registers it to Process9.
    PXIPM_RegisterProgram :: proc(programHandle: ^u64, programInfo: ^FS_ProgramInfo, updateInfo: ^FS_ProgramInfo) -> Result ---

    // Unloads a program and unregisters it from Process9.
    PXIPM_UnregisterProgram :: proc(programHandle: u64) -> Result ---

    // Initializes srv:pm and the service API.
    srvPmInit :: proc() -> Result ---

    // Exits srv:pm and the service API.
    srvPmExit :: proc() ---

    // Gets the current srv:pm session handle.
    srvPmGetSessionHandle :: proc() -> ^Handle ---

    // Publishes a notification to a process.
    SRVPM_PublishToProcess :: proc(notificationId: u32, process: Handle) -> Result ---

    // Publishes a notification to all processes.
    SRVPM_PublishToAll :: proc(notificationId: u32) -> Result ---

    // Registers a process with SRV.
    SRVPM_RegisterProcess :: proc(pid: u32, count: u32, serviceAccessControlList: [^][8]u8) -> Result ---

    // Unregisters a process with SRV.
    SRVPM_UnregisterProcess :: proc(pid: u32) -> Result ---
}
