package ctru

// ============================================================
// GDB host I/O
// 3ds/gdbhio.h, 3ds/gdbhio_dev.h
//
// File and time calls that are carried out on the host by an attached GDB (Luma3DS's GDB stub),
// and a devoptab that exposes them as gdbhio:/.
// ============================================================

// newlib types used by the calls below, as devkitARM builds them.
mode_t :: u32

// struct stat: 96 bytes, 8-byte aligned. Opaque here.
stat :: struct #align(8) {
    _: [96]u8,
}

// struct timeval.
timeval :: struct {
    tv_sec:  i64, // seconds
    tv_usec: i32, // microseconds
}

GDBHIO_STDIN_FILENO  :: 0
GDBHIO_STDOUT_FILENO :: 1
GDBHIO_STDERR_FILENO :: 2

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    gdbHioOpen :: proc(pathname: cstring, flags: i32, mode: mode_t) -> i32 ---

    gdbHioClose :: proc(fd: i32) -> i32 ---

    gdbHioRead :: proc(fd: i32, buf: rawptr, count: u32) -> i32 ---

    gdbHioWrite :: proc(fd: i32, buf: rawptr, count: u32) -> i32 ---

    gdbHioLseek :: proc(fd: i32, offset: i64, flag: i32) -> i64 ---

    gdbHioRename :: proc(oldpath: cstring, newpath: cstring) -> i32 ---

    gdbHioUnlink :: proc(pathname: cstring) -> i32 ---

    gdbHioStat :: proc(pathname: cstring, st: ^stat) -> i32 ---

    gdbHioFstat :: proc(fd: i32, st: ^stat) -> i32 ---

    gdbHioGettimeofday :: proc(tv: ^timeval, tz: rawptr) -> i32 ---

    gdbHioIsatty :: proc(fd: i32) -> i32 ---

    gdbHioSystem :: proc(command: cstring) -> i32 ---

    gdbHioDevInit :: proc() -> i32 ---

    gdbHioDevExit :: proc() ---

    gdbHioDevGetStdin :: proc() -> i32 ---

    gdbHioDevGetStdout :: proc() -> i32 ---

    gdbHioDevGetStderr :: proc() -> i32 ---

    gdbHioDevRedirectStdStreams :: proc(in_: bool, out: bool, err: bool) -> i32 ---

    gdbHioDevGettimeofday :: proc(tv: ^timeval, tz: rawptr) -> i32 ---

    gdbHioDevIsatty :: proc(fd: i32) -> i32 ---

    gdbHioDevSystem :: proc(command: cstring) -> i32 ---
}
