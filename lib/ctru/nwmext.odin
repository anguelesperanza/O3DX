package ctru

// ============================================================
// NWM_EXT
// 3ds/services/nwmext.h
//
// Turns the wireless hardware on and off.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    nwmExtInit :: proc() -> Result ---

    nwmExtExit :: proc() ---

    // Turns wireless on or off.
    NWMEXT_ControlWirelessEnabled :: proc(enableWifi: bool) -> Result ---
}
