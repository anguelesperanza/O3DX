package ctru

// ============================================================
// Error display (err:f)
// 3ds/errf.h
//
// Shows the system's fatal-error screen, and the exception information it can display.
// ============================================================

// Types of errors that can be thrown by err:f.
ERRF_ErrType :: enum u8 {
    GENERIC      = 0, // Generic fatal error. Shows miscellaneous info, including the address of the caller
    NAND_DAMAGED = 1, // Damaged NAND (CC_ERROR after reading CSR)
    CARD_REMOVED = 2, // Game content storage medium (cartridge and/or SD card) ejected. Not logged
    EXCEPTION    = 3, // CPU or VFP exception
    FAILURE      = 4, // Fatal error with a message instead of the caller's address
    LOG_ONLY     = 5, // Log-level failure. Does not display the exception and does not force the system to reboot
}

// Types of 'Exceptions' thrown for ERRF_ERRTYPE_EXCEPTION
ERRF_ExceptionType :: enum u8 {
    PREFETCH_ABORT = 0, // Prefetch Abort
    DATA_ABORT     = 1, // Data abort
    UNDEFINED      = 2, // Undefined instruction
    VFP            = 3, // VFP (floating point) exception.
}

ERRF_ExceptionInfo :: struct {
    type_:    ERRF_ExceptionType, // Type of the exception. One of the ERRF_EXCEPTION_* values.
    reserved: [3]u8,
    fsr:      u32, // ifsr (prefetch abort) / dfsr (data abort)
    far:      u32, // pc = ifar (prefetch abort) / dfar (data abort)
    fpexc:    u32,
    fpinst:   u32,
    fpinst2:  u32,
}

ERRF_ExceptionData :: struct {
    excep: ERRF_ExceptionInfo, // Exception info struct
    regs:  CpuRegisters, // CPU register dump.
}

// Opaque here: the C type has a nested struct/union. 128 bytes.
ERRF_FatalErrInfo :: struct #align(8) {
    _: [128]u8,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes ERR:f. Unless you plan to call ERRF_Throw yourself, do not use this.
    errfInit :: proc() -> Result ---

    // Exits ERR:f. Unless you plan to call ERRF_Throw yourself, do not use this.
    errfExit :: proc() ---

    // Gets the current err:f API session handle.
    errfGetSessionHandle :: proc() -> ^Handle ---

    // Throws a system error and possibly logs it.
    ERRF_Throw :: proc(error: ^ERRF_FatalErrInfo) -> Result ---

    // Throws (and logs) a system error with the given Result code.
    ERRF_ThrowResult :: proc(failure: Result) -> Result ---

    // Logs a system error with the given Result code.
    ERRF_LogResult :: proc(failure: Result) -> Result ---

    // Throws a system error with the given Result code and message.
    ERRF_ThrowResultWithMessage :: proc(failure: Result, message: cstring) -> Result ---

    // Specify an additional user string to use for error reporting.
    ERRF_SetUserString :: proc(user_string: cstring) -> Result ---

    // Handles an exception using ErrDisp.
    ERRF_ExceptionHandler :: proc(excep: ^ERRF_ExceptionInfo, regs: ^CpuRegisters) ---
}
