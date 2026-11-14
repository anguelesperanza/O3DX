package o3dx

import "base:runtime"
import "core:fmt"
import ctru "../ctru"

// Output goes to two places, each of which can be turned off:
//   - stdout (printf), which is the on-screen console once ctru.consoleInit
//     has run, and goes nowhere otherwise;
//   - svcOutputDebugString, which shows up in the emulator's log window
//     (Citra / Azahar / Lime3DS) and in Luma3DS's debugger on hardware.
// Text is written with "%.*s" or with an explicit length, so Odin strings
// (which are not zero-terminated) are safe to pass.
print_to_console := true
print_to_debug   := true

// Writes a string as it is, no newline added.
write :: proc "contextless" (s: string) {
    if len(s) == 0 do return
    if print_to_console do ctru.printf("%.*s", i32(len(s)), raw_data(s))
    if print_to_debug do debug_write(s)
}

@(private)
debug_write :: proc "contextless" (s: string) {
    ctru.svcOutputDebugString(cstring(raw_data(s)), i32(len(s)))
}

// print / println / printf format with core:fmt into a buffer on the stack
// (PRINT_BUFFER_SIZE bytes; longer output is cut off). They do not allocate.
PRINT_BUFFER_SIZE :: 1024

print :: proc(args: ..any, sep := " ") {
    buf: [PRINT_BUFFER_SIZE]byte
    write(fmt.bprint(buf[:], ..args, sep = sep))
}

println :: proc(args: ..any, sep := " ") {
    buf: [PRINT_BUFFER_SIZE]byte
    write(fmt.bprintln(buf[:], ..args, sep = sep))
}

printf :: proc(format: string, args: ..any) {
    buf: [PRINT_BUFFER_SIZE]byte
    write(fmt.bprintf(buf[:], format, ..args))
}

// ---------------------------------------------------------------
// Logger for context.logger, so core:log works (log.info, log.errorf, ...).
// ---------------------------------------------------------------
// Messages below this level are dropped. Change it at any time.
log_level: runtime.Logger_Level = .Debug

logger :: proc "contextless" () -> runtime.Logger {
    return {
        procedure    = logger_proc,
        data         = nil,
        lowest_level = .Debug,
        options      = {.Level, .Short_File_Path, .Line},
    }
}

logger_proc :: proc(data: rawptr, level: runtime.Logger_Level, text: string,
                    options: runtime.Logger_Options, location := #caller_location) {
    if level < log_level do return
    name: string
    switch {
    case level >= .Fatal:   name = "FATAL"
    case level >= .Error:   name = "ERROR"
    case level >= .Warning: name = "WARN "
    case level >= .Info:    name = "INFO "
    case:                   name = "DEBUG"
    }
    buf: [PRINT_BUFFER_SIZE]byte
    write(fmt.bprintf(buf[:], "[%s] %s:%d: %s\n", name, short_path(location.file_path), location.line, text))
}

@(private)
short_path :: proc "contextless" (path: string) -> string {
    for i := len(path) - 1; i >= 0; i -= 1 {
        if path[i] == '/' || path[i] == '\\' do return path[i + 1:]
    }
    return path
}
