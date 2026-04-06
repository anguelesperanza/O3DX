package camera_example

import ctru "../../lib/ctru"

// Live dual-camera feed on the top screen, ported from the libctru C example.
//
// Uses raw framebuffer access (no citro2d/3d).  gfxInitDefault sets both
// screens to BGR8 (3 bytes/pixel).  The camera outputs RGB565 (row-major);
// write_picture_rgb565 converts and blits to the column-major BGR8 framebuffer.
//
// The capture loop runs the camera continuously with four kernel handles:
//   [0] CAM1 buffer-error interrupt event
//   [1] CAM2 buffer-error interrupt event
//   [2] CAM1 active receive event
//   [3] CAM2 active receive event
//
// svcWaitSynchronizationN blocks until any handle fires, then the index tells
// us whether to handle an error (restart capture) or a completed frame (blit).
//
// Controls:
//   3D slider — enable/disable stereoscopic side-by-side display
//   START     — exit

WIDTH       :: 400
HEIGHT      :: 240
SCREEN_SIZE :: u32(WIDTH * HEIGHT * 2) // RGB565 = 2 bytes/pixel
BUF_SIZE    :: uint(SCREEN_SIZE * 2)   // two frames: CAM1 then CAM2
WAIT_TIMEOUT :: i64(1_000_000_000)     // 1 second in nanoseconds

// Read the 3D depth-slider value (0.0 = off, >0.0 = on).
// This is a memory-mapped register in the shared page.
SLIDER_3D_ADDR :: uintptr(0x1FF81080)

// Convert an RGB565 row-major image to the 3DS BGR8 column-major framebuffer.
//
// The 3DS top screen framebuffer is column-major: pixel (x,y) is at
// index (x*HEIGHT + y).  Index 0 is the bottom-left corner, so y must
// be flipped.
//
// RGB565 bit layout: R[15:11] G[10:5] B[4:0]
// BGR8 byte layout at address v: B, G, R  (byte 0 = B, byte 2 = R)
write_picture_rgb565 :: proc "c" (fb: [^]u8, img: [^]u16, x, y, w, h: int) {
    for j in 0..<h {
        for i in 0..<w {
            draw_y := y + h - j    // y-flip: row 0 of image → bottom of screen
            draw_x := x + i
            v      := (draw_y + draw_x * h) * 3

            data := img[j * w + i]
            // RGB565: bits[15:11]=R, bits[10:5]=G, bits[4:0]=B
            // Expand 5-bit channels with << 3, 6-bit green with << 2
            r8 := u8((data & 0x1F) << 3)          // B channel of RGB565
            g8 := u8(((data >> 5) & 0x3F) << 2)   // G channel
            b8 := u8(((data >> 11) & 0x1F) << 3)  // R channel of RGB565

            // BGR8 framebuffer: byte 0=B, byte 1=G, byte 2=R
            fb[v]   = r8  // B from RGB565 → B slot
            fb[v+1] = g8
            fb[v+2] = b8  // R from RGB565 → R slot
        }
    }
}

@(export, link_name = "odin_main")
camera_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    ctru.gfxInitDefault()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    // Double-buffer top screen to remove tearing; single-buffer bottom (console).
    ctru.gfxSetDoubleBuffering(.TOP,    true)
    ctru.gfxSetDoubleBuffering(.BOTTOM, false)

    ctru.printf("Camera Example\n")
    ctru.printf("3D slider for stereo\n")
    ctru.printf("START to exit\n\n")

    // ── Camera init ───────────────────────────────────────────────────────────

    rc := ctru.camInit()
    ctru.printf("camInit:              0x%08lX\n", rc)
    if rc != 0 {
        ctru.gfxExit()
        return 1
    }
    defer ctru.camExit()

    rc = ctru.CAMU_SetSize(ctru.CAM_SELECT_OUT1_OUT2, .CTR_TOP_LCD, .A)
    ctru.printf("CAMU_SetSize:         0x%08lX\n", rc)

    rc = ctru.CAMU_SetOutputFormat(ctru.CAM_SELECT_OUT1_OUT2, .RGB_565, .A)
    ctru.printf("CAMU_SetOutputFormat: 0x%08lX\n", rc)

    rc = ctru.CAMU_SetFrameRate(ctru.CAM_SELECT_OUT1_OUT2, .RATE_30)
    ctru.printf("CAMU_SetFrameRate:    0x%08lX\n", rc)

    rc = ctru.CAMU_SetNoiseFilter(ctru.CAM_SELECT_OUT1_OUT2, true)
    ctru.printf("CAMU_SetNoiseFilter:  0x%08lX\n", rc)

    rc = ctru.CAMU_SetAutoExposure(ctru.CAM_SELECT_OUT1_OUT2, true)
    ctru.printf("CAMU_SetAutoExposure: 0x%08lX\n", rc)

    rc = ctru.CAMU_SetAutoWhiteBalance(ctru.CAM_SELECT_OUT1_OUT2, true)
    ctru.printf("CAMU_SetAutoWB:       0x%08lX\n", rc)

    rc = ctru.CAMU_SetTrimming(ctru.CAM_PORT_CAM1, false)
    ctru.printf("CAMU_SetTrimming 1:   0x%08lX\n", rc)

    rc = ctru.CAMU_SetTrimming(ctru.CAM_PORT_CAM2, false)
    ctru.printf("CAMU_SetTrimming 2:   0x%08lX\n", rc)

    // ── Allocate frame buffer ─────────────────────────────────────────────────

    buf := cast([^]u8)ctru.malloc(BUF_SIZE)
    if buf == nil {
        ctru.printf("ERROR: malloc failed\n")
        return 1
    }
    defer ctru.free(cast(rawptr)buf)

    // ── Configure DMA transfer size ───────────────────────────────────────────

    bufSize: u32
    rc = ctru.CAMU_GetMaxBytes(&bufSize, WIDTH, HEIGHT)
    ctru.printf("CAMU_GetMaxBytes:     0x%08lX (size=%lu)\n", rc, bufSize)

    rc = ctru.CAMU_SetTransferBytes(ctru.CAM_PORT_BOTH, bufSize, WIDTH, HEIGHT)
    ctru.printf("CAMU_SetTransferBytes:0x%08lX\n", rc)

    // ── Activate both outer cameras ───────────────────────────────────────────

    rc = ctru.CAMU_Activate(ctru.CAM_SELECT_OUT1_OUT2)
    ctru.printf("CAMU_Activate:        0x%08lX\n", rc)

    // ── Set up event handles ──────────────────────────────────────────────────
    // [0] and [1] are buffer-error interrupt events (fired when DMA fails).
    // [2] and [3] are receive-complete events (fired when a frame arrives).
    // We initialise [2] and [3] to 0; they are registered inside the loop.

    events: [4]ctru.Handle = {0, 0, 0, 0}

    rc = ctru.CAMU_GetBufferErrorInterruptEvent(&events[0], ctru.CAM_PORT_CAM1)
    ctru.printf("BufErrEvent CAM1:     0x%08lX\n", rc)

    rc = ctru.CAMU_GetBufferErrorInterruptEvent(&events[1], ctru.CAM_PORT_CAM2)
    ctru.printf("BufErrEvent CAM2:     0x%08lX\n", rc)

    // ── Start continuous capture ──────────────────────────────────────────────

    rc = ctru.CAMU_ClearBuffer(ctru.CAM_PORT_BOTH)
    ctru.printf("CAMU_ClearBuffer:     0x%08lX\n", rc)

    rc = ctru.CAMU_SynchronizeVsyncTiming(ctru.CAM_SELECT_OUT1, ctru.CAM_SELECT_OUT2)
    ctru.printf("SynchronizeVsync:     0x%08lX\n", rc)

    rc = ctru.CAMU_StartCapture(ctru.CAM_PORT_BOTH)
    ctru.printf("CAMU_StartCapture:    0x%08lX\n", rc)

    ctru.CAMU_PlayShutterSound(.MOVIE)

    ctru.gfxFlushBuffers()
    ctru.gspWaitForEvent(.VBlank0, false)
    ctru.gfxSwapBuffers()

    ctru.printf("\nRunning. START to exit.\n")

    // ── Main loop ─────────────────────────────────────────────────────────────

    captureInterrupted := false
    index: i32 = 0

    buf_cam1 := buf
    buf_cam2 := cast([^]u8)(uintptr(rawptr(buf)) + uintptr(SCREEN_SIZE))

    main_loop: for ctru.aptMainLoop() {

        if !captureInterrupted {
            ctru.hidScanInput()
            if ctru.hidKeysDown() & ctru.KEY_START != 0 do break main_loop
        }

        // Register receive events if they are not already active.
        if events[2] == 0 {
            ctru.CAMU_SetReceiving(&events[2], cast(rawptr)buf_cam1,
                                   ctru.CAM_PORT_CAM1, SCREEN_SIZE, i16(bufSize))
        }
        if events[3] == 0 {
            ctru.CAMU_SetReceiving(&events[3], cast(rawptr)buf_cam2,
                                   ctru.CAM_PORT_CAM2, SCREEN_SIZE, i16(bufSize))
        }

        // Restart capture after a buffer error.
        if captureInterrupted {
            ctru.CAMU_StartCapture(ctru.CAM_PORT_BOTH)
            captureInterrupted = false
        }

        // Wait for whichever event fires first.
        ctru.svcWaitSynchronizationN(&index, &events[0], 4, false, WAIT_TIMEOUT)

        switch index {
        case 0: // CAM1 buffer error
            ctru.svcCloseHandle(events[2])
            events[2] = 0
            captureInterrupted = true
            continue main_loop

        case 1: // CAM2 buffer error
            ctru.svcCloseHandle(events[3])
            events[3] = 0
            captureInterrupted = true
            continue main_loop

        case 2: // CAM1 frame ready
            ctru.svcCloseHandle(events[2])
            events[2] = 0

        case 3: // CAM2 frame ready
            ctru.svcCloseHandle(events[3])
            events[3] = 0
        }

        // ── Blit to framebuffer ───────────────────────────────────────────────

        slider := (cast(^f32)SLIDER_3D_ADDR)^

        if slider > 0.0 {
            ctru.gfxSet3D(true)
            write_picture_rgb565(
                ctru.gfxGetFramebuffer(.TOP, .LEFT,  nil, nil),
                cast([^]u16)buf_cam1, 0, 0, WIDTH, HEIGHT)
            write_picture_rgb565(
                ctru.gfxGetFramebuffer(.TOP, .RIGHT, nil, nil),
                cast([^]u16)buf_cam2, 0, 0, WIDTH, HEIGHT)
        } else {
            ctru.gfxSet3D(false)
            write_picture_rgb565(
                ctru.gfxGetFramebuffer(.TOP, .LEFT, nil, nil),
                cast([^]u16)buf_cam1, 0, 0, WIDTH, HEIGHT)
        }

        ctru.gfxFlushBuffers()
        ctru.gspWaitForEvent(.VBlank0, false)
        ctru.gfxSwapBuffers()
    }

    // ── Cleanup ───────────────────────────────────────────────────────────────

    ctru.CAMU_StopCapture(ctru.CAM_PORT_BOTH)

    for i in 0..<4 {
        if events[i] != 0 {
            ctru.svcCloseHandle(events[i])
        }
    }

    ctru.CAMU_Activate(ctru.CAM_SELECT_NONE)

    ctru.gfxExit()
    return 0
}
