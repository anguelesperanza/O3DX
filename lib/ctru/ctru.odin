package ctru

// ============================================================
// Primitive type aliases (matching libctru's 3ds/types.h)
// ============================================================

// Result code returned by most service calls; negative = error.
Result :: i32

// IPC kernel handle.
Handle :: u32

// ============================================================
// Screen constants  (raw u32 for legacy compatibility)
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

// Generic catch-all directions (D-pad OR circle-pad)
KEY_UP    :: KEY_DUP    | KEY_CPAD_UP
KEY_DOWN  :: KEY_DDOWN  | KEY_CPAD_DOWN
KEY_LEFT  :: KEY_DLEFT  | KEY_CPAD_LEFT
KEY_RIGHT :: KEY_DRIGHT | KEY_CPAD_RIGHT

// ============================================================
// Enum types
// ============================================================

// Screen identifier — mirrors gfxScreen_t / GSP_SCREEN_*.
GfxScreen :: enum u32 {
    TOP    = 0,
    BOTTOM = 1,
}

// Top-screen framebuffer side — mirrors gfx3dSide_t.
Gfx3dSide :: enum u32 {
    LEFT  = 0,
    RIGHT = 1,
}

// Framebuffer pixel format — mirrors GSPGPU_FramebufferFormat.
GSPGPU_FramebufferFormat :: enum u32 {
    RGBA8   = 0, // 4 bytes per pixel
    BGR8    = 1, // 3 bytes per pixel  (default)
    RGB565  = 2, // 2 bytes per pixel
    RGB5_A1 = 3, // 2 bytes per pixel
    RGBA4   = 4, // 2 bytes per pixel
}

// GSPGPU asynchronous event IDs — mirrors GSPGPU_Event.
GSPGPU_Event :: enum u32 {
    PSC0   = 0, // Memory fill completed
    PSC1   = 1,
    VBlank0 = 2,
    VBlank1 = 3,
    PPF    = 4, // Display transfer finished
    P3D    = 5, // GPU command list finished
    DMA    = 6,
    MAX    = 7,
}

// VRAM bank selector — mirrors vramAllocPos.
VramAllocPos :: enum u32 {
    BANK_A = 1, // BIT(0)
    BANK_B = 2, // BIT(1)
    ANY    = 3, // BANK_A | BANK_B
}

// HID event IDs — mirrors HID_Event.
HID_Event :: enum u32 {
    PAD0      = 0,
    PAD1      = 1,
    ACCEL     = 2,
    GYRO      = 3,
    DEBUG_PAD = 4,
    MAX       = 5,
}

// ============================================================
// Struct types
// ============================================================

// Circle pad / C-stick position; each axis in the range ~-154 to 154.
circlePosition :: struct {
    dx, dy: i16,
}

// Touch screen coordinate in pixels.
touchPosition :: struct {
    px, py: u16,
}

// Accelerometer data — mirrors accelVector.
accelVector :: struct {
    x, y, z: i16,
}

// Gyroscope angular rate — mirrors angularRate.
// Note: field order in C is x, z, y (roll, yaw, pitch).
angularRate :: struct {
    x: i16, // Roll
    z: i16, // Yaw
    y: i16, // Pitch
}

// ============================================================
// libctru — all integer / pointer arguments, no float ABI issue.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── GFX ─────────────────────────────────────────────────────────────────
    // Initialize LCD framebuffers with default parameters (BGR8, no VRAM).
    gfxInitDefault :: proc() ---
    // Initialize LCD framebuffers with explicit format and VRAM flag.
    gfxInit        :: proc(topFmt: GSPGPU_FramebufferFormat, botFmt: GSPGPU_FramebufferFormat, vramBuffers: bool) ---
    // Deinitialize framebuffers.
    gfxExit        :: proc() ---

    // Enable/disable stereoscopic 3D on the top screen.
    gfxSet3D          :: proc(enable: bool) ---
    gfxIs3D           :: proc() -> bool ---
    // Enable/disable 800px wide mode on the top screen.
    gfxSetWide        :: proc(enable: bool) ---
    gfxIsWide         :: proc() -> bool ---
    // Change / query the pixel format of a screen.
    gfxSetScreenFormat   :: proc(screen: GfxScreen, format: GSPGPU_FramebufferFormat) ---
    gfxGetScreenFormat   :: proc(screen: GfxScreen) -> GSPGPU_FramebufferFormat ---
    // Enable/disable double buffering on a screen.
    gfxSetDoubleBuffering :: proc(screen: GfxScreen, enable: bool) ---
    // Get a pointer to the current framebuffer for the given screen/side.
    // width and height may be nil if not needed.
    gfxGetFramebuffer :: proc(screen: GfxScreen, side: Gfx3dSide, width: ^u16, height: ^u16) -> ^u8 ---
    // Flush the CPU data cache for the current framebuffers (software rendering only).
    gfxFlushBuffers   :: proc() ---
    // Swap the framebuffer for one screen.
    gfxScreenSwapBuffers :: proc(screen: GfxScreen, hasStereo: bool) ---
    // Swap both screens at once.
    gfxSwapBuffers    :: proc() ---
    gfxSwapBuffersGpu :: proc() ---

    // ── APT ─────────────────────────────────────────────────────────────────
    aptMainLoop :: proc() -> bool ---

    // ── HID ─────────────────────────────────────────────────────────────────
    hidInit              :: proc() -> Result ---
    hidExit              :: proc() ---
    hidSetRepeatParameters :: proc(delay: u32, interval: u32) ---
    hidScanInput         :: proc() ---
    hidKeysHeld          :: proc() -> u32 ---
    hidKeysDown          :: proc() -> u32 ---
    hidKeysDownRepeat    :: proc() -> u32 ---
    hidKeysUp            :: proc() -> u32 ---
    hidTouchRead         :: proc(pos: ^touchPosition) ---
    hidCircleRead        :: proc(pos: ^circlePosition) ---
    hidAccelRead         :: proc(vector: ^accelVector) ---
    hidGyroRead          :: proc(rate: ^angularRate) ---
    hidWaitForEvent      :: proc(id: HID_Event, nextEvent: bool) ---
    hidWaitForAnyEvent   :: proc(nextEvents: bool, cancelEvent: Handle, timeout: i64) -> Result ---

    // HIDUSER — service calls to enable hardware sensors.
    HIDUSER_EnableAccelerometer  :: proc() -> Result ---
    HIDUSER_DisableAccelerometer :: proc() -> Result ---
    HIDUSER_EnableGyroscope      :: proc() -> Result ---
    HIDUSER_DisableGyroscope     :: proc() -> Result ---
    HIDUSER_GetSoundVolume       :: proc(volume: ^u8) -> Result ---

    // ── Console ─────────────────────────────────────────────────────────────
    // Initialise the text console on the given screen.  Returns the previous console.
    consoleInit    :: proc(screen: u32, console: rawptr) -> rawptr ---

    // ── GSPGPU ──────────────────────────────────────────────────────────────
    gspInit           :: proc() -> Result ---
    gspExit           :: proc() ---
    gspHasGpuRight    :: proc() -> bool ---
    // Wait for a GPU/display event (see GSPGPU_Event).
    gspWaitForEvent   :: proc(id: GSPGPU_Event, nextEvent: bool) ---
    // Wait for any event; returns the ID of the event that fired.
    gspWaitForAnyEvent :: proc() -> GSPGPU_Event ---

    // ── OS ───────────────────────────────────────────────────────────────────
    // Convert a virtual address to a physical address (needed for some GPU calls).
    osConvertVirtToPhys :: proc(vaddr: rawptr) -> u32 ---
    // Get current time as milliseconds since 1 Jan 1900.
    osGetTime           :: proc() -> u64 ---
    // Enable or disable the New 3DS CPU speed-up.
    osSetSpeedupEnable  :: proc(enable: bool) ---

    // ── Linear heap allocator (3ds/allocator/linear.h) ───────────────────────
    // GPU vertex buffers, texture data, and shader binaries require linear memory.
    linearAlloc    :: proc(size: uint) -> rawptr ---
    linearMemAlign :: proc(size: uint, alignment: uint) -> rawptr ---
    linearRealloc  :: proc(mem: rawptr, size: uint) -> rawptr ---
    linearGetSize  :: proc(mem: rawptr) -> uint ---
    linearFree     :: proc(ptr: rawptr) ---
    linearSpaceFree :: proc() -> u32 ---

    // ── VRAM allocator (3ds/allocator/vram.h) ────────────────────────────────
    // Use for GPU textures / render targets that need to reside in VRAM.
    vramAlloc      :: proc(size: uint) -> rawptr ---
    vramAllocAt    :: proc(size: uint, pos: VramAllocPos) -> rawptr ---
    vramMemAlign   :: proc(size: uint, alignment: uint) -> rawptr ---
    vramMemAlignAt :: proc(size: uint, alignment: uint, pos: VramAllocPos) -> rawptr ---
    vramFree       :: proc(mem: rawptr) ---
    vramGetSize    :: proc(mem: rawptr) -> uint ---
    vramSpaceFree  :: proc() -> u32 ---

    // ── libc (newlib via 3dsx.specs) ─────────────────────────────────────────
    printf   :: proc(fmt: cstring, #c_vararg args: ..any) -> i32 ---
    sprintf  :: proc(buf: [^]u8, fmt: cstring, #c_vararg args: ..any) -> i32 ---
    snprintf :: proc(buf: [^]u8, n: uint, fmt: cstring, #c_vararg args: ..any) -> i32 ---
    malloc  :: proc(size: uint) -> rawptr ---
    free    :: proc(ptr: rawptr) ---
    memset  :: proc(ptr: rawptr, value: i32, size: uint) -> rawptr ---
    memcpy  :: proc(dst: rawptr, src: rawptr, size: uint) -> rawptr ---

    // ── C stdio (newlib FILE* via 3dsx.specs) ─────────────────────────────────
    // FILE* is opaque; pass as rawptr.  Works with "romfs:/", "sdmc:/", etc.
    fopen  :: proc(path: cstring, mode: cstring) -> rawptr ---
    fclose :: proc(file: rawptr) -> i32 ---
    fread  :: proc(ptr: rawptr, size: uint, count: uint, file: rawptr) -> uint ---
    fwrite :: proc(ptr: rawptr, size: uint, count: uint, file: rawptr) -> uint ---
    fseek  :: proc(file: rawptr, offset: i32, origin: i32) -> i32 ---
    ftell  :: proc(file: rawptr) -> i32 ---

    // ── POSIX directory helpers (newlib, mapped to FS service internally) ─────
    // mkdir creates a directory; returns 0 on success, -1 if it already exists.
    mkdir  :: proc(path: cstring, mode: u32) -> i32 ---
}

// ── stdio seek origin constants ──────────────────────────────
SEEK_SET :: i32(0) // seek from beginning of file
SEEK_CUR :: i32(1) // seek from current position
SEEK_END :: i32(2) // seek from end of file

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
