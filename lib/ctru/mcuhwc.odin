package ctru

// ============================================================
// MCU hardware control (mcu::HWC)
// 3ds/services/mcuhwc.h
//
// Battery voltage and level, the volume and 3D sliders, and the Wi-Fi, power and notification
// LEDs.
// ============================================================

powerLedState :: enum u8 {
    NORMAL     = 1, // The normal mode of the led
    SLEEP_MODE = 2, // The led pulses slowly as it does in the sleep mode
    OFF        = 3, // Switch off power led
    RED        = 4, // Red state of the led
    BLUE       = 5, // Blue state of the led
    BLINK_RED  = 6, // Blinking red state of power led and notification led
}

InfoLedPattern :: struct {
    delay:        u8, // Delay between pattern values, 1/16th of a second (1 second = 0x10)
    smoothing:    u8, // Smoothing between pattern values (higher = smoother)
    loopDelay:    u8, // Delay between pattern loops, 1/16th of a second (1 second = 0x10, 0xFF = pattern is played only once)
    blinkSpeed:   u8, // Blink speed, when smoothing == 0x00
    redPattern:   [32]u8, // Pattern for red component
    greenPattern: [32]u8, // Pattern for green component
    bluePattern:  [32]u8, // Pattern for blue component
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes mcuHwc.
    mcuHwcInit :: proc() -> Result ---

    // Exits mcuHwc.
    mcuHwcExit :: proc() ---

    // Gets the current mcuHwc session handle.
    mcuHwcGetSessionHandle :: proc() -> ^Handle ---

    // Reads data from an i2c device3 register
    MCUHWC_ReadRegister :: proc(reg: u8, data: rawptr, size: u32) -> Result ---

    // Writes data to a i2c device3 register
    MCUHWC_WriteRegister :: proc(reg: u8, data: rawptr, size: u32) -> Result ---

    // Gets the battery voltage
    MCUHWC_GetBatteryVoltage :: proc(voltage: ^u8) -> Result ---

    // Gets the battery level
    MCUHWC_GetBatteryLevel :: proc(level: ^u8) -> Result ---

    // Gets the sound slider level
    MCUHWC_GetSoundSliderLevel :: proc(level: ^u8) -> Result ---

    // Sets Wifi LED state
    MCUHWC_SetWifiLedState :: proc(state: bool) -> Result ---

    // Sets the notification LED pattern
    MCUHWC_SetInfoLedPattern :: proc(pattern: ^InfoLedPattern) -> Result ---

    // Sets Power LED state
    MCUHWC_SetPowerLedState :: proc(state: powerLedState) -> Result ---

    // Gets 3d slider level
    MCUHWC_Get3dSliderLevel :: proc(level: ^u8) -> Result ---

    // Gets the major MCU firmware version
    MCUHWC_GetFwVerHigh :: proc(out: ^u8) -> Result ---

    // Gets the minor MCU firmware version
    MCUHWC_GetFwVerLow :: proc(out: ^u8) -> Result ---
}
