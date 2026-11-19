package ctru

// ============================================================
// Loader
// 3ds/services/loader.h
//
// Loads and registers programs (used by process managers).
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes LOADER.
    loaderInit :: proc() -> Result ---

    // Exits LOADER.
    loaderExit :: proc() ---

    // Loads a program and returns a process handle to the newly created process.
    LOADER_LoadProcess :: proc(process: ^Handle, programHandle: u64) -> Result ---

    // Registers a program (along with its update).
    LOADER_RegisterProgram :: proc(programHandle: ^u64, programInfo: ^FS_ProgramInfo, programInfoUpdate: ^FS_ProgramInfo) -> Result ---

    // Unregisters a program (along with its update).
    LOADER_UnregisterProgram :: proc(programHandle: u64) -> Result ---

    // Retrives a program's main NCCH extended header info (SCI + ACI, see
    LOADER_GetProgramInfo :: proc(exheaderInfo: ^ExHeader_Info, programHandle: u64) -> Result ---
}
