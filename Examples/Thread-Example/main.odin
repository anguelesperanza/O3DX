package thread_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates libctru threads and LightLock synchronization.
//
// A background thread runs on CPU core 1 and increments a counter
// every ~16 ms.  The main thread reads that counter (under the same
// lock) and renders it on the top screen every frame.
//
// Core 1 is the "system core".  An app must call APT_SetAppCpuTimeLimit
// to reserve CPU time on it before spawning threads there.
//
// Controls:
//   START — exit

// ── Shared state (main ↔ background thread) ───────────────────────
//
// Package-level variables are accessible from proc "c" thread functions.
g_counter: u32
g_lock:    ctru.LightLock
g_stop:    bool   // set true by main thread to signal exit

// background_thread is the entry point for the worker thread.
// It increments g_counter under g_lock every ~16 ms until g_stop is set.
@(export)
background_thread :: proc "c" (_arg: rawptr) {
    for !g_stop {
        ctru.LightLock_Lock(&g_lock)
        g_counter += 1
        ctru.LightLock_Unlock(&g_lock)

        ctru.svcSleepThread(16_000_000) // 16 ms in nanoseconds
    }
}

@(export, link_name = "odin_main")
thread_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    // ── Reserve 30% of core 1 for app threads ────────────────────
    // Without this, threadCreate on core_id=1 will fail.
    ctru.APT_SetAppCpuTimeLimit(30)

    // ── Initialise shared state and spawn the worker thread ───────
    ctru.LightLock_Init(&g_lock)
    g_stop    = false
    g_counter = 0

    // Stack of 16 KB, priority 0x31 (just below main thread at 0x30),
    // core 1 (system core), not detached so we can join on exit.
    worker := ctru.threadCreate(background_thread, nil, 16 * 1024, 0x31, 1, false)

    // ── Static text ───────────────────────────────────────────────
    staticBuf := c2d.C2D_TextBufNew(128)
    titleText:  c2d.C2D_Text
    labelText:  c2d.C2D_Text
    coreText:   c2d.C2D_Text
    c2d.C2D_TextParse(&titleText, staticBuf, "Thread Example")
    c2d.C2D_TextParse(&labelText, staticBuf, "Background counter:")
    c2d.C2D_TextParse(&coreText,  staticBuf, "Core 1 thread  +1 every 16 ms")
    c2d.C2D_TextOptimize(&titleText)
    c2d.C2D_TextOptimize(&labelText)
    c2d.C2D_TextOptimize(&coreText)

    // Dynamic buffer for the counter value — cleared each frame.
    dynBuf      := c2d.C2D_TextBufNew(32)
    counterText:  c2d.C2D_Text
    counterStr:   [32]u8

    // ── Colours ───────────────────────────────────────────────────
    clrBg     := c2d.C2D_Color32(0x0D, 0x2A, 0x1B, 0xFF)
    clrTitle  := c2d.C2D_Color32(0xFF, 0xE0, 0x00, 0xFF)
    clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
    clrGreen  := c2d.C2D_Color32(0x00, 0xFF, 0x80, 0xFF)
    clrSubtle := c2d.C2D_Color32(0x88, 0x88, 0x88, 0xFF)

    threadOK := worker != nil

    ctru.printf("\x1b[1;1HThread Example")
    ctru.printf("\x1b[2;1HPress START to exit")
    if threadOK {
        ctru.printf("\x1b[4;1HWorker thread running on core 1")
    } else {
        ctru.printf("\x1b[4;1HWARNING: threadCreate failed!")
        ctru.printf("\x1b[5;1H(APT_SetAppCpuTimeLimit needed)")
    }

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        // ── Safely read the counter ───────────────────────────────
        ctru.LightLock_Lock(&g_lock)
        snapshot := g_counter
        ctru.LightLock_Unlock(&g_lock)

        // ── Rebuild counter string ────────────────────────────────
        c2d.C2D_TextBufClear(dynBuf)
        ctru.snprintf(&counterStr[0], 32, "%u", snapshot)
        c2d.C2D_TextParse(&counterText, dynBuf, cstring(&counterStr[0]))

        // ── Render ────────────────────────────────────────────────
        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, clrBg)
        c2d.C2D_SceneBegin(top)

        // Title
        c2d.C2D_DrawTextColor(&titleText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 15, 0, 0.8, 0.8, clrTitle)

        // Subtitle
        c2d.C2D_DrawTextColor(&coreText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 60, 0, 0.5, 0.5, clrSubtle)

        // "Background counter:" label
        c2d.C2D_DrawTextColor(&labelText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 100, 0, 0.65, 0.65, clrWhite)

        // Large counter value
        c2d.C2D_DrawTextColor(&counterText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 130, 0, 1.2, 1.2, clrGreen)

        c3d.C3D_FrameEnd(0)
    }

    // ── Clean shutdown: signal thread and wait for it ─────────────
    g_stop = true
    if worker != nil {
        ctru.threadJoin(worker, max(u64))
        ctru.threadFree(worker)
    }

    // Restore default CPU time limit
    ctru.APT_SetAppCpuTimeLimit(0)

    c2d.C2D_TextBufDelete(staticBuf)
    c2d.C2D_TextBufDelete(dynBuf)
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
