package ctru

// ============================================================
// Screen constants
// ============================================================

SCREEN_TOP_WIDTH :: u32(400)
SCREEN_BOT_WIDTH :: u32(320)
SCREEN_HEIGHT    :: u32(240)

// Convenience alias — top screen is the "main" screen in most 2D examples.
SCREEN_WIDTH :: SCREEN_TOP_WIDTH

GFX_TOP    :: u32(0)
GFX_BOTTOM :: u32(1)
GFX_LEFT   :: u32(0)
GFX_RIGHT  :: u32(1)

// ============================================================
// Input key bitmasks  (value = 1 << bit-index)
// ============================================================

KEY_A      :: u32(1)       // BIT(0)
KEY_B      :: u32(2)       // BIT(1)
KEY_SELECT :: u32(4)       // BIT(2)
KEY_START  :: u32(8)       // BIT(3)
KEY_DRIGHT :: u32(16)      // BIT(4)
KEY_DLEFT  :: u32(32)      // BIT(5)
KEY_DUP    :: u32(64)      // BIT(6)
KEY_DDOWN  :: u32(128)     // BIT(7)
KEY_R      :: u32(256)     // BIT(8)
KEY_L      :: u32(512)     // BIT(9)
KEY_X      :: u32(1024)    // BIT(10)
KEY_Y      :: u32(2048)    // BIT(11)
KEY_ZL     :: u32(16384)   // BIT(14)  (New 3DS only)
KEY_ZR     :: u32(32768)   // BIT(15)  (New 3DS only)
KEY_TOUCH  :: u32(1 << 20) // BIT(20)

// Circle-pad and C-stick direction shortcuts
KEY_CSTICK_RIGHT :: u32(1 << 24) // BIT(24) New 3DS C-stick
KEY_CSTICK_LEFT  :: u32(1 << 25) // BIT(25)
KEY_CSTICK_UP    :: u32(1 << 26) // BIT(26)
KEY_CSTICK_DOWN  :: u32(1 << 27) // BIT(27)
KEY_CPAD_RIGHT   :: u32(1 << 28) // BIT(28) Circle-pad
KEY_CPAD_LEFT    :: u32(1 << 29) // BIT(29)
KEY_CPAD_UP      :: u32(1 << 30) // BIT(30)
KEY_CPAD_DOWN    :: u32(1 << 31) // BIT(31)

// ============================================================
// Types
// ============================================================

// Circle pad / C-stick position; each axis in the range ~-154 to 154.
circlePosition :: struct {
    dx, dy: i16,
}

// Touch screen coordinate in pixels.
touchPosition :: struct {
    px, py: u16,
}

// ============================================================
// libctru — all integer / pointer arguments, no float ABI issue.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // --- GFX ---
    gfxInitDefault :: proc() ---
    gfxExit        :: proc() ---

    // --- APT ---
    aptMainLoop    :: proc() -> bool ---

    // --- HID ---
    hidScanInput   :: proc() ---
    hidKeysDown    :: proc() -> u32 ---
    hidKeysHeld    :: proc() -> u32 ---
    hidKeysUp      :: proc() -> u32 ---
    hidCircleRead  :: proc(pos: ^circlePosition) ---
    hidTouchRead   :: proc(pos: ^touchPosition) ---

    // --- Console ---
    consoleInit    :: proc(screen: u32, console: rawptr) -> rawptr ---

    // --- libc (newlib via 3dsx.specs) ---
    printf         :: proc(fmt: cstring, #c_vararg args: ..any) -> i32 ---
    malloc         :: proc(size: uint) -> rawptr ---
    free           :: proc(ptr: rawptr) ---
    memset         :: proc(ptr: rawptr, value: i32, size: uint) -> rawptr ---
    memcpy         :: proc(dst: rawptr, src: rawptr, size: uint) -> rawptr ---
}

// ============================================================
// ctru_bridge — wrappers for static-inline libctru functions
// that have no exported symbol and therefore cannot be linked
// directly from Odin.  Implemented in lib/ctru/bridge.c.
// ============================================================

foreign import ctru_bridge "system:ctru_bridge"

@(default_calling_convention = "c")
foreign ctru_bridge {
    // romfs — mounts the read-only file system embedded in the .3dsx
    @(link_name = "romfs_init")
    romfsInit      :: proc() -> u32 ---

    @(link_name = "romfs_exit")
    romfsExit      :: proc() -> u32 ---

    // irrst — IR/extra input service for New 3DS C-stick
    @(link_name = "irrst_init")
    irrstInit      :: proc() ---

    @(link_name = "irrst_exit")
    irrstExit      :: proc() ---

    @(link_name = "irrst_scan")
    irrstScanInput :: proc() ---

    @(link_name = "cstick_read")
    irrstCstickRead :: proc(pos: ^circlePosition) ---
}
