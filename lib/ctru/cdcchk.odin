package ctru

// ============================================================
// CDC check
// 3ds/services/cdcchk.h
//
// Registers of the audio codec chip.
// ============================================================

// I2S line enumeration
CodecI2sLine :: enum u8 {
    LINE_1 = 0, // Primary I2S line, used by DSP/Mic (configurable)/GBA sound controller.
    LINE_2 = 1, // Secondary I2S line, used by CSND hardware.
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes CDCCHK.
    cdcChkInit :: proc() -> Result ---

    // Exits CDCCHK.
    cdcChkExit :: proc() ---

    // Gets a pointer to the current cdc:CHK session handle.
    cdcChkGetSessionHandle :: proc() -> ^Handle ---

    // Reads multiple registers from the CODEC, using the old SPI hardware interface and a 4MHz
    // baudrate.
    CDCCHK_ReadRegisters1 :: proc(pageId: u8, initialRegAddr: u8, outData: rawptr, size: uint) -> Result ---

    // Reads multiple registers from the CODEC, using the new SPI hardware interface and a 16MHz
    // baudrate.
    CDCCHK_ReadRegisters2 :: proc(pageId: u8, initialRegAddr: u8, outData: rawptr, size: uint) -> Result ---

    // Writes multiple registers to the CODEC, using the old SPI hardware interface and a 4MHz
    // baudrate.
    CDCCHK_WriteRegisters1 :: proc(pageId: u8, initialRegAddr: u8, data: rawptr, size: uint) -> Result ---

    // Writes multiple registers to the CODEC, using the new SPI hardware interface and a 16MHz
    // baudrate.
    CDCCHK_WriteRegisters2 :: proc(pageId: u8, initialRegAddr: u8, data: rawptr, size: uint) -> Result ---

    // Reads a single register from the NTR PMIC.
    CDCCHK_ReadNtrPmicRegister :: proc(outData: ^u8, regAddr: u8) -> Result ---

    // Writes a single register from the NTR PMIC.
    CDCCHK_WriteNtrPmicRegister :: proc(regAddr: u8, data: u8) -> Result ---

    // Sets the DAC volume level for the specified I2S line.
    CDCCHK_SetI2sVolume :: proc(i2sLine: CodecI2sLine, volume: i8) -> Result ---
}
