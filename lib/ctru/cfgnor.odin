package ctru

// ============================================================
// CFG NOR flash
// 3ds/services/cfgnor.h
//
// Reads and writes the console's NOR flash.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes CFGNOR.
    cfgnorInit :: proc(value: u8) -> Result ---

    // Exits CFGNOR
    cfgnorExit :: proc() ---

    // Dumps the NOR flash.
    cfgnorDumpFlash :: proc(buf: ^u32, size: u32) -> Result ---

    // Writes the NOR flash.
    cfgnorWriteFlash :: proc(buf: ^u32, size: u32) -> Result ---

    // Initializes the CFGNOR session.
    CFGNOR_Initialize :: proc(value: u8) -> Result ---

    // Shuts down the CFGNOR session.
    CFGNOR_Shutdown :: proc() -> Result ---

    // Reads data from NOR.
    CFGNOR_ReadData :: proc(offset: u32, buf: ^u32, size: u32) -> Result ---

    // Writes data to NOR.
    CFGNOR_WriteData :: proc(offset: u32, buf: ^u32, size: u32) -> Result ---
}
