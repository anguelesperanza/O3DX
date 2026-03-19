package images_example

// ----------------------------------------
// Screen constants
// ----------------------------------------
SCREEN_WIDTH  :: 400
SCREEN_HEIGHT :: 240

GFX_TOP    :: u32(0)
GFX_BOTTOM :: u32(1)
GFX_LEFT   :: u32(0)

// ----------------------------------------
// Input constants
// ----------------------------------------
KEY_START :: u32(8) // BIT(3)

// ----------------------------------------
// citro3d constants
// ----------------------------------------
C3D_DEFAULT_CMDBUF_SIZE :: u32(0x40000)
C3D_FRAME_SYNCDRAW      :: u8(1) // BIT(0)

// ----------------------------------------
// citro2d constants
// ----------------------------------------
C2D_DEFAULT_MAX_OBJECTS :: u32(4096)

// Opaque handle for C3D_RenderTarget*
RenderTarget :: rawptr

// C3D_Tex — opaque 24-byte block (matches sizeof(C3D_Tex) on ARM32).
// Do not access fields directly; pass by pointer to C functions.
C3D_Tex :: [24]u8

// Tex3DS_SubTexture — UV region within a C3D_Tex used by citro2d.
Tex3DS_SubTexture :: struct {
    width, height: u16,
    left, top, right, bottom: f32,
}

// citro2d image (two opaque pointers)
C2D_Image :: struct {
    tex:    rawptr, // ^C3D_Tex
    subtex: rawptr, // ^Tex3DS_SubTexture
}

// ----------------------------------------
// libctru — integer/pointer args only, no ABI issue
// ----------------------------------------
foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    gfxInitDefault :: proc() ---
    gfxExit        :: proc() ---
    aptMainLoop    :: proc() -> bool ---
    hidScanInput   :: proc() ---
    hidKeysDown    :: proc() -> u32 ---
    consoleInit    :: proc(screen: u32, console: rawptr) -> rawptr ---
    C3D_TexDelete  :: proc(tex: ^C3D_Tex) ---
}

// ----------------------------------------
// citro3d — integer args only, no ABI issue.
// Timer functions return f32 in hard-float s0, but Odin
// expects f32 in r0 (soft-float). Routed via C wrappers
// that return u32 bit patterns in r0 instead.
// ----------------------------------------
foreign import citro3d "system:citro3d"

@(default_calling_convention = "c")
foreign citro3d {
    C3D_Init       :: proc(cmdBufSize: u32) -> bool ---
    C3D_Fini       :: proc() ---
    C3D_FrameBegin :: proc(flags: u8) -> bool ---
    C3D_FrameEnd   :: proc(flags: u8) ---
}

// ----------------------------------------
// citro2d — integer/pointer args only, no ABI issue
// ----------------------------------------
foreign import citro2d "system:citro2d"

@(default_calling_convention = "c")
foreign citro2d {
    C2D_Init               :: proc(maxObjects: u32) -> bool ---
    C2D_Fini               :: proc() ---
    C2D_Prepare            :: proc() ---
    C2D_Flush              :: proc() ---
    C2D_CreateScreenTarget :: proc(screen: u32, side: u32) -> RenderTarget ---
    C2D_TargetClear        :: proc(target: RenderTarget, color: u32) ---
}

// ----------------------------------------
// ABI bridge wrappers (defined in main.c).
// All float parameters are declared as u32 here —
// Odin (soft-float) puts f32 bit patterns in general
// registers, which the C wrappers receive as uint32_t,
// reinterpret, and forward to the hard-float citro2d functions.
// ----------------------------------------
foreign import abi_bridge "system:abi_bridge"

@(default_calling_convention = "c")
foreign abi_bridge {
    @(link_name = "c2d_scene_begin")
    C2D_SceneBegin :: proc(target: RenderTarget) ---

    @(link_name = "c3d_get_processing_time")
    C3D_GetProcessingTime :: proc() -> f32 ---

    @(link_name = "c3d_get_drawing_time")
    C3D_GetDrawingTime :: proc() -> f32 ---

    @(link_name = "c3d_get_cmdbuf_usage")
    C3D_GetCmdBufUsage :: proc() -> f32 ---

    @(link_name = "c2d_draw_triangle")
    C2D_DrawTriangle :: proc(ax, ay: f32, clr0: u32,
                             bx, by: f32, clr1: u32,
                             cx, cy: f32, clr2: u32,
                             depth: f32) -> bool ---

    @(link_name = "c2d_draw_rectangle")
    C2D_DrawRectangle :: proc(x, y, z, w, h: f32,
                              clr0, clr1, clr2, clr3: u32) -> bool ---

    @(link_name = "c2d_draw_ellipse")
    C2D_DrawEllipse :: proc(x, y, z, w, h: f32,
                            clr0, clr1, clr2, clr3: u32) -> bool ---

    @(link_name = "c2d_draw_circle")
    C2D_DrawCircle :: proc(x, y, z, radius: f32,
                           clr0, clr1, clr2, clr3: u32) -> bool ---

    @(link_name = "c2d_draw_circle_solid")
    C2D_DrawCircleSolid :: proc(x, y, z, radius: f32, clr: u32) -> bool ---

    // romfsInit/romfsExit are static inline in libctru headers — no exported
    // symbol, so Odin can't link them directly. Routed via main.c wrappers.
    @(link_name = "romfs_init")
    romfsInit :: proc() -> u32 ---

    @(link_name = "romfs_exit")
    romfsExit :: proc() -> u32 ---

    // Reads the custom .t3x format, uploads to GPU linear memory, and
    // fills subtex with UV coordinates for the full image.
    @(link_name = "load_t3x_image")
    load_t3x_image :: proc(path: cstring, tex: ^C3D_Tex, subtex: ^Tex3DS_SubTexture) -> bool ---

    // C2D_DrawImageAt has float params after a struct-by-value arg.
    // Soft-float Odin passes f32 as u32 bit patterns in general registers;
    // the C wrapper reinterprets them and forwards to the hard-float function.
    @(link_name = "c2d_draw_image_at")
    C2D_DrawImageAt :: proc(img: C2D_Image, x, y, depth: f32, tint: rawptr, scaleX, scaleY: f32) -> bool ---
}

// ----------------------------------------
// libc (newlib via 3dsx.specs)
// ----------------------------------------
foreign import libc "system:c"

@(default_calling_convention = "c")
foreign libc {
    printf :: proc(fmt: cstring, #c_vararg args: ..any) -> i32 ---
}
