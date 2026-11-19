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
GfxScreen :: enum u8 {
    TOP    = 0,
    BOTTOM = 1,
}

// Top-screen framebuffer side — mirrors gfx3dSide_t.
Gfx3dSide :: enum u8 {
    LEFT  = 0,
    RIGHT = 1,
}

// Framebuffer pixel format — mirrors GSPGPU_FramebufferFormat.
GSPGPU_FramebufferFormat :: enum u8 {
    RGBA8   = 0, // 4 bytes per pixel
    BGR8    = 1, // 3 bytes per pixel  (default)
    RGB565  = 2, // 2 bytes per pixel
    RGB5_A1 = 3, // 2 bytes per pixel
    RGBA4   = 4, // 2 bytes per pixel
}

// GSPGPU asynchronous event IDs — mirrors GSPGPU_Event.
GSPGPU_Event :: enum u8 {
    PSC0   = 0, // Memory fill completed
    PSC1   = 1,
    VBLANK0 = 2,
    VBLANK1 = 3,
    PPF    = 4, // Display transfer finished
    P3D    = 5, // GPU command list finished
    DMA    = 6,
    MAX    = 7,
}

// VRAM bank selector — mirrors vramAllocPos.
VramAllocPos :: enum u8 {
    BANK_A = 1, // BIT(0)
    BANK_B = 2, // BIT(1)
    ANY    = 3, // BANK_A | BANK_B
}

// HID event IDs — mirrors HID_Event.
HID_Event :: enum u8 {
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
    malloc   :: proc(size: uint) -> rawptr ---
    memalign :: proc(alignment: uint, size: uint) -> rawptr ---
    free     :: proc(ptr: rawptr) ---
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

    // ── RomFS (regular functions — not static inline) ────────────────────────
    // Mount the application's own embedded romfs under a device name.
    // Use "romfs" as the name and then access files as "romfs:/path/to/file".
    romfsMountSelf               :: proc(name: cstring) -> Result ---
    // Mount a romfs image from an already-open file handle at the given byte offset.
    romfsMountFromFile           :: proc(fd: Handle, offset: u32, name: cstring) -> Result ---
    // Mount the current process's NCCH host romfs.
    romfsMountFromCurrentProcess :: proc(name: cstring) -> Result ---
    // Mount the romfs embedded in another installed title.
    romfsMountFromTitle          :: proc(tid: u64, mediatype: FS_MediaType, name: cstring) -> Result ---
    // Unmount a previously mounted romfs device.
    romfsUnmount                 :: proc(name: cstring) -> Result ---
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
    // romfs — static-inline convenience wrappers: mount/unmount as "romfs:"
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

// ============================================================
// Console, GFX, HID, IRRST, GSPGPU and VRAM calls that were missing
// ============================================================

CONSOLE_RESET   :: "\x1b[0m"
CONSOLE_BLACK   :: "\x1b[30m"
CONSOLE_RED     :: "\x1b[31;1m"
CONSOLE_GREEN   :: "\x1b[32;1m"
CONSOLE_YELLOW  :: "\x1b[33;1m"
CONSOLE_BLUE    :: "\x1b[34;1m"
CONSOLE_MAGENTA :: "\x1b[35;1m"
CONSOLE_CYAN    :: "\x1b[36;1m"
CONSOLE_WHITE   :: "\x1b[37;1m"

// A callback for printing a character.
ConsolePrint :: #type proc "c" (con: rawptr, c: i32) -> bool

// A font struct for the console.
ConsoleFont :: struct {
    gfx:         ^u8, // A pointer to the font graphics
    asciiOffset: u16, // Offset to the first valid character in the font table
    numChars:    u16, // Number of characters in the font graphics
}

// Console structure used to store the state of a console render context. Default values from
// consoleGetDefault();
PrintConsole :: struct {
    font:               ConsoleFont, // Font of the console
    frameBuffer:        ^u16, // Framebuffer address
    cursorX:            i32, // Current X location of the cursor (as a tile offset by default)
    cursorY:            i32, // Current Y location of the cursor (as a tile offset by default)
    prevCursorX:        i32, // Internal state
    prevCursorY:        i32, // Internal state
    consoleWidth:       i32, // Width of the console hardware layer in characters
    consoleHeight:      i32, // Height of the console hardware layer in characters
    windowX:            i32, // Window X location in characters (not implemented)
    windowY:            i32, // Window Y location in characters (not implemented)
    windowWidth:        i32, // Window width in characters (not implemented)
    windowHeight:       i32, // Window height in characters (not implemented)
    tabSize:            i32, // Size of a tab
    fg:                 u16, // Foreground color
    bg:                 u16, // Background color
    flags:              i32, // Reverse/bright flags
    PrintChar:          ConsolePrint, // Callback for printing a character. Should return true if it has handled rendering the graphics (else the print engine will attempt to render via tiles).
    consoleInitialised: bool, // True if the console is initialized
}
CONSOLE_COLOR_BOLD      :: 0x1
CONSOLE_COLOR_FAINT     :: 0x2
CONSOLE_ITALIC          :: 0x4
CONSOLE_UNDERLINE       :: 0x8
CONSOLE_BLINK_SLOW      :: 0x10
CONSOLE_BLINK_FAST      :: 0x20
CONSOLE_COLOR_REVERSE   :: 0x40
CONSOLE_CONCEAL         :: 0x80
CONSOLE_CROSSED_OUT     :: 0x100
CONSOLE_FG_CUSTOM       :: 0x200
CONSOLE_BG_CUSTOM       :: 0x400
CONSOLE_COLOR_FG_BRIGHT :: 0x800
CONSOLE_COLOR_BG_BRIGHT :: 0x1000

// Console debug devices supported by libctru.
debugDevice :: enum u8 {
    NULL              = 0, // Swallows prints to stderr
    SVC               = 1, // Outputs stderr debug statements using svcOutputDebugString, which can then be captured by interactive debuggers
    CONSOLE           = 2, // Directs stderr debug statements to 3DS console window
    DEBUGDEVICE_3DMOO = 1, // debugDevice_3DMOO in C; stripped it would start with a digit
}

GSP_SCREEN_TOP           :: 0
GSP_SCREEN_BOTTOM        :: 1
GSP_SCREEN_WIDTH         :: 240
GSP_SCREEN_HEIGHT_TOP    :: 400
GSP_SCREEN_HEIGHT_TOP_2X :: 800
GSP_SCREEN_HEIGHT_BOTTOM :: 320

// Framebuffer information.
GSPGPU_FramebufferInfo :: struct {
    active_framebuf:        u32, // Active framebuffer. (0 = first, 1 = second)
    framebuf0_vaddr:        ^u32, // Framebuffer virtual address, for the main screen this is the 3D left framebuffer.
    framebuf1_vaddr:        ^u32, // For the main screen: 3D right framebuffer address.
    framebuf_widthbytesize: u32, // Value for 0x1EF00X90, controls framebuffer width.
    format:                 u32, // Framebuffer format, this u16 is written to the low u16 for LCD register 0x1EF00X70.
    framebuf_dispselect:    u32, // Value for 0x1EF00X78, controls which framebuffer is displayed.
    unk:                    u32, // Unknown.
}

// Capture info entry.
GSPGPU_CaptureInfoEntry :: struct {
    framebuf0_vaddr:        ^u32, // Left framebuffer.
    framebuf1_vaddr:        ^u32, // Right framebuffer.
    format:                 u32, // Framebuffer format.
    framebuf_widthbytesize: u32, // Framebuffer pitch.
}

// Capture info.
GSPGPU_CaptureInfo :: struct {
    screencapture: [2]GSPGPU_CaptureInfoEntry, // Capture info entries, one for each screen.
}

// GSPGPU performance log entry. Use the lastDurationUs field when benchmarking single GPU
// operations, this is usally meant for 3D library writers. Use the difference between two
// totalDurationUs when using a GPU library (e.g. citro3d), as there can be multiple GPU operations
// (e.g. P3D, PPF) per render pass, or per frame, and so on. Don't use totalDurationUs as-is
// (rather, take the difference as just described), because it can overflow.
GSPGPU_PerfLogEntry :: struct {
    lastDurationUs:  u32, // Duration of the last corresponding PICA200 operation (time between op is started and IRQ is received).
    totalDurationUs: u32, // Sum of lastDurationUs for the corresponding PICA200 operation. Can overflow.
}

// GSPGPU performance log
GSPGPU_PerfLog :: struct {
    entries: [7]GSPGPU_PerfLogEntry, // Performance log entries (one per operation/"event").
}

@(default_calling_convention = "c")
foreign ctru {
    // Loads the font into the console.
    consoleSetFont :: proc(console: ^PrintConsole, font: ^ConsoleFont) ---

    // Sets the print window.
    consoleSetWindow :: proc(console: ^PrintConsole, x: i32, y: i32, width: i32, height: i32) ---

    // Gets a pointer to the console with the default values. This should only be used when using a
    // single console or without changing the console that is returned, otherwise use consoleInit().
    consoleGetDefault :: proc() -> ^PrintConsole ---

    // Make the specified console the render target.
    consoleSelect :: proc(console: ^PrintConsole) -> ^PrintConsole ---

    // Initializes debug console output on stderr to the specified device.
    consoleDebugInit :: proc(device: debugDevice) ---

    // Clears the screen by using iprintf("\x1b[2J");
    consoleClear :: proc() ---

    // Gets the handles for HID operation.
    HIDUSER_GetHandles :: proc(outMemHandle: ^Handle, eventpad0: ^Handle, eventpad1: ^Handle, eventaccel: ^Handle, eventgyro: ^Handle, eventdebugpad: ^Handle) -> Result ---

    // Gets the gyroscope raw to dps coefficient.
    HIDUSER_GetGyroscopeRawToDpsCoefficient :: proc(coeff: ^f32) -> Result ---

    // Gets IRRST's held keys.
    irrstKeysHeld :: proc() -> u32 ---

    // Waits for the IRRST input event to trigger.
    irrstWaitForEvent :: proc(nextEvent: bool) ---

    // Gets the shared memory and event handles for IRRST.
    IRRST_GetHandles :: proc(outMemHandle: ^Handle, outEventHandle: ^Handle) -> Result ---

    // Initializes IRRST.
    IRRST_Initialize :: proc(unk1: u32, unk2: u8) -> Result ---

    // Shuts down IRRST.
    IRRST_Shutdown :: proc() -> Result ---

    // Gets a pointer to the current gsp::Gpu session handle.
    gspGetSessionHandle :: proc() -> ^Handle ---

    // Presents a buffer to the specified screen.
    gspPresentBuffer :: proc(screen: u32, swap: u32, fb_a: rawptr, fb_b: rawptr, stride: u32, mode: u32) -> bool ---

    // Returns true if a prior gspPresentBuffer command is still pending to be processed by GSP.
    gspIsPresentPending :: proc(screen: u32) -> bool ---

    // Configures a callback to run when a GSPGPU event occurs.
    gspSetEventCallback :: proc(id: GSPGPU_Event, cb: ThreadFunc, data: rawptr, oneShot: bool) ---

    // Submits a GX command.
    gspSubmitGxCommand :: proc(gxCommand: [^]u32) -> Result ---

    // Acquires GPU rights.
    GSPGPU_AcquireRight :: proc(flags: u8) -> Result ---

    // Releases GPU rights.
    GSPGPU_ReleaseRight :: proc() -> Result ---

    // Retrieves display capture info.
    GSPGPU_ImportDisplayCaptureInfo :: proc(captureinfo: ^GSPGPU_CaptureInfo) -> Result ---

    // Saves the VRAM sys area.
    GSPGPU_SaveVramSysArea :: proc() -> Result ---

    // Resets the GPU
    GSPGPU_ResetGpuCore :: proc() -> Result ---

    // Restores the VRAM sys area.
    GSPGPU_RestoreVramSysArea :: proc() -> Result ---

    // Sets whether to force the LCD to black.
    GSPGPU_SetLcdForceBlack :: proc(flags: u8) -> Result ---

    // Updates a screen's framebuffer state.
    GSPGPU_SetBufferSwap :: proc(screenid: u32, framebufinfo: ^GSPGPU_FramebufferInfo) -> Result ---

    // Flushes memory from the data cache.
    GSPGPU_FlushDataCache :: proc(adr: rawptr, size: u32) -> Result ---

    // Invalidates memory in the data cache.
    GSPGPU_InvalidateDataCache :: proc(adr: rawptr, size: u32) -> Result ---

    // Writes to GPU hardware registers.
    GSPGPU_WriteHWRegs :: proc(regAddr: u32, data: ^u32, size: u8) -> Result ---

    // Writes to GPU hardware registers with a mask.
    GSPGPU_WriteHWRegsWithMask :: proc(regAddr: u32, data: ^u32, datasize: u8, maskdata: ^u32, masksize: u8) -> Result ---

    // Reads from GPU hardware registers.
    GSPGPU_ReadHWRegs :: proc(regAddr: u32, data: ^u32, size: u8) -> Result ---

    // Registers the interrupt relay queue.
    GSPGPU_RegisterInterruptRelayQueue :: proc(eventHandle: Handle, flags: u32, outMemHandle: ^Handle, threadID: ^u8) -> Result ---

    // Unregisters the interrupt relay queue.
    GSPGPU_UnregisterInterruptRelayQueue :: proc() -> Result ---

    // Triggers a handling of commands written to shared memory.
    GSPGPU_TriggerCmdReqQueue :: proc() -> Result ---

    // Sets 3D_LEDSTATE to the input state value.
    GSPGPU_SetLedForceOff :: proc(disable: bool) -> Result ---

    // Enables or disables the performance log and clear its state to zero.
    GSPGPU_SetPerfLogMode :: proc(enabled: bool) -> Result ---

    // Retrieves the performance log.
    GSPGPU_GetPerfLog :: proc(outPerfLog: ^GSPGPU_PerfLog) -> Result ---

    // Reallocates a buffer. Note: Not implemented yet.
    vramRealloc :: proc(mem: rawptr, size: uint) -> rawptr ---
}

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Gets the number of bytes per pixel for the specified format.
    @(link_name = "ctru_gsp_get_bytes_per_pixel")
    gspGetBytesPerPixel :: proc(format: GSPGPU_FramebufferFormat) -> u32 ---
}
