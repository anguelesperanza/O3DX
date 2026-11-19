package ctru

// ============================================================
// LCD control (gsp::Lcd)
// 3ds/services/gsplcd.h
//
// Backlights and screen brightness.
// ============================================================

// LCD screens.
GSPLCD_SCREEN_TOP    :: 1 // Top screen.
GSPLCD_SCREEN_BOTTOM :: 2 // Bottom screen.
GSPLCD_SCREEN_BOTH   :: 3 // Both screens.

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes GSPLCD.
    gspLcdInit :: proc() -> Result ---

    // Exits GSPLCD.
    gspLcdExit :: proc() ---

    // Gets a pointer to the current gsp::Lcd session handle.
    gspLcdGetSessionHandle :: proc() -> ^Handle ---

    // Powers on both backlights.
    GSPLCD_PowerOnAllBacklights :: proc() -> Result ---

    // Powers off both backlights.
    GSPLCD_PowerOffAllBacklights :: proc() -> Result ---

    // Powers on the backlight.
    GSPLCD_PowerOnBacklight :: proc(screen: u32) -> Result ---

    // Powers off the backlight.
    GSPLCD_PowerOffBacklight :: proc(screen: u32) -> Result ---

    // Sets 3D_LEDSTATE to the input state value.
    GSPLCD_SetLedForceOff :: proc(disable: bool) -> Result ---

    // Gets the LCD screens' vendors. Stubbed on old 3ds.
    GSPLCD_GetVendors :: proc(vendors: ^u8) -> Result ---

    // Gets the LCD screens' brightness. Stubbed on old 3ds.
    GSPLCD_GetBrightness :: proc(screen: u32, brightness: ^u32) -> Result ---

    // Sets the LCD screens' brightness.
    GSPLCD_SetBrightness :: proc(screen: u32, brightness: u32) -> Result ---

    // Sets the LCD screens' raw brightness.
    GSPLCD_SetBrightnessRaw :: proc(screen: u32, brightness: u32) -> Result ---
}
