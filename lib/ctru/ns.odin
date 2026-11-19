package ctru

// ============================================================
// NS — title launching
// 3ds/services/ns.h
//
// Launches titles, reboots to a title, and the related PM/NS calls.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes NS.
    nsInit :: proc() -> Result ---

    // Exits NS.
    nsExit :: proc() ---

    // Launches a title and the required firmware (only if necessary).
    NS_LaunchFIRM :: proc(titleid: u64) -> Result ---

    // Launches a title.
    NS_LaunchTitle :: proc(titleid: u64, launch_flags: u32, procid: ^u32) -> Result ---

    // Terminates the application from which this function is called
    NS_TerminateTitle :: proc() -> Result ---

    // Launches a title and the required firmware.
    NS_LaunchApplicationFIRM :: proc(titleid: u64, flags: u32) -> Result ---

    // Reboots to a title.
    NS_RebootToTitle :: proc(mediatype: u8, titleid: u64) -> Result ---

    // Terminates the process with the specified titleid.
    NS_TerminateProcessTID :: proc(titleid: u64, timeout: u64) -> Result ---

    // Reboots the system
    NS_RebootSystem :: proc() -> Result ---
}
