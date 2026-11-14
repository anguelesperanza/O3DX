package o3dx

import "base:runtime"
import ctru "../ctru"

// What happens when `assert` fails or `panic` is called.
//
// Odin's default handler on this target prints nothing. This one:
//   1. prints the location and message (console and debug output, see
//      log.odin),
//   2. appends the same line to panic_log_path on the SD card, because a
//      real console has no log window to look at,
//   3. traps. On hardware Luma3DS shows its exception screen (and saves a
//      dump to sdmc:/luma/dumps/arm11) whose PC is inside this handler; the
//      message from steps 1 and 2 says where the assertion really was.
//
// Bounds-check and nil-dereference failures do NOT come through here. The
// runtime handles those itself and traps straight away with no message.

// Set to nil to turn the file off. libctru mounts sdmc:/ at start-up.
panic_log_path: cstring = "sdmc:/o3dx_panic.log"

// What to do after reporting. .Trap gives the exception screen and a dump;
// .Exit closes the app quietly back to the Homebrew Launcher.
Panic_Action :: enum {
    Trap,
    Exit,
}
panic_action: Panic_Action = .Trap

foreign import libc "system:c"

@(default_calling_convention = "c")
foreign libc {
    @(link_name = "exit") c_exit :: proc(status: i32) -> ! ---
}

assertion_failure_proc :: proc(prefix, message: string, loc: runtime.Source_Code_Location) -> ! {
    line: [512]u8
    n := ctru.snprintf(raw_data(line[:]), len(line), "%.*s(%d:%d) %.*s: %.*s%s%.*s\n",
        i32(len(loc.file_path)), raw_data(loc.file_path), loc.line, loc.column,
        i32(len(loc.procedure)), raw_data(loc.procedure),
        i32(len(prefix)), raw_data(prefix),
        cstring(": ") if len(message) > 0 else cstring(""),
        i32(len(message)), raw_data(message))
    n = clamp(n, 0, i32(len(line) - 1))
    write(string(line[:n]))

    // (Checked by hand rather than comparing with "": comparing a cstring
    // with "" trips an Odin compiler assertion on this target, "missing
    // procedure 'cstring_to_string'", as found in vito.)
    if panic_log_path != nil && (^u8)(panic_log_path)^ != 0 {
        f := ctru.fopen(panic_log_path, "a")
        if f != nil {
            ctru.fwrite(raw_data(line[:]), 1, uint(n), f)
            ctru.fclose(f)
        }
    }

    if panic_action == .Exit do c_exit(1)
    runtime.trap()
}
