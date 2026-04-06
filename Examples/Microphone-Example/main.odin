package microphone_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates the MIC service: live microphone amplitude meter.
//
// Ported from the devkitPro 3DS mic example.  Key implementation notes:
//
//   - The mic buffer must be 0x1000-byte (page) aligned so the kernel can
//     map it as shared memory.  Use memalign(0x1000, size) from the regular
//     heap — NOT linearAlloc (which is only 16-byte aligned).
//
//   - Call micGetSampleDataSize() AFTER micInit to get the usable data size;
//     pass that exact value to MICU_StartSampling.
//
//   - micGetLastSampleOffset() returns the write-head byte position within
//     the ring buffer.  Advance the read-head modulo micbuf_datasize.
//
// Controls:
//   UP/DOWN — increase / decrease mic gain (0–160)
//   START   — exit

MIC_BUF_SIZE :: u32(0x30000) // 192 KB — matches devkitPro example
SCAN_SAMPLES :: 512          // recent samples to scan for peak amplitude
BAR_X        :: f32(20)
BAR_Y        :: f32(80)
BAR_H        :: f32(100)
BAR_MAX_W    :: f32(360)

g_gain: u8 = 80

@(export, link_name = "odin_main")
mic_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    // ── Graphics ──────────────────────────────────────────────────────
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    ctru.printf("Microphone Example\n")
    ctru.printf("UP/DOWN = gain  START = exit\n\n")

    // ── Allocate mic ring buffer ──────────────────────────────────────
    // Must be page-aligned (0x1000) for kernel shared-memory mapping.
    // Use memalign from the regular heap, NOT linearAlloc.
    micBuf := cast([^]u8)ctru.memalign(0x1000, uint(MIC_BUF_SIZE))
    if micBuf == nil {
        ctru.printf("ERROR: memalign failed\n")
        ctru.printf("Press START to exit\n")
        for ctru.aptMainLoop() {
            ctru.hidScanInput()
            if ctru.hidKeysDown() & ctru.KEY_START != 0 do break
        }
        c2d.C2D_Fini()
        c3d.C3D_Fini()
        ctru.gfxExit()
        return 1
    }
    defer ctru.free(cast(rawptr)micBuf)

    // ── MIC init ──────────────────────────────────────────────────────
    ctru.printf("Initializing MIC...\n")
    rc := ctru.micInit(micBuf, MIC_BUF_SIZE)
    if rc != 0 {
        ctru.printf("micInit failed: 0x%08lX\n", rc)
        ctru.printf("Press START to exit\n")
        for ctru.aptMainLoop() {
            ctru.hidScanInput()
            if ctru.hidKeysDown() & ctru.KEY_START != 0 do break
        }
        c2d.C2D_Fini()
        c3d.C3D_Fini()
        ctru.gfxExit()
        return 1
    }
    defer ctru.micExit()
    ctru.printf("MIC initialized.\n")

    // Get usable data size AFTER micInit (matches devkitPro pattern).
    micbuf_datasize := ctru.micGetSampleDataSize()

    // ── Start sampling ────────────────────────────────────────────────
    ctru.MICU_SetGain(g_gain)
    rc = ctru.MICU_StartSampling(.PCM16_SIGNED, .RATE_16360,
                                  0, micbuf_datasize, true)
    if rc != 0 {
        ctru.printf("StartSampling failed: 0x%08lX\n", rc)
        ctru.printf("Press START to exit\n")
        for ctru.aptMainLoop() {
            ctru.hidScanInput()
            if ctru.hidKeysDown() & ctru.KEY_START != 0 do break
        }
        c2d.C2D_Fini()
        c3d.C3D_Fini()
        ctru.gfxExit()
        return 1
    }
    defer ctru.MICU_StopSampling()

    ctru.printf("Recording. UP/DOWN = gain.\n")

    // ── Colours ───────────────────────────────────────────────────────
    clrBg     := c2d.C2D_Color32(0x10, 0x10, 0x10, 0xFF)
    clrGreen  := c2d.C2D_Color32(0x00, 0xDD, 0x44, 0xFF)
    clrYellow := c2d.C2D_Color32(0xFF, 0xCC, 0x00, 0xFF)
    clrRed    := c2d.C2D_Color32(0xFF, 0x22, 0x22, 0xFF)
    clrBorder := c2d.C2D_Color32(0x44, 0x44, 0x44, 0xFF)
    clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
    clrTitle  := c2d.C2D_Color32(0xFF, 0xD7, 0x00, 0xFF)

    // ── Text buffers ──────────────────────────────────────────────────
    staticBuf := c2d.C2D_TextBufNew(128)
    dynBuf    := c2d.C2D_TextBufNew(64)
    defer c2d.C2D_TextBufDelete(staticBuf)
    defer c2d.C2D_TextBufDelete(dynBuf)

    titleText: c2d.C2D_Text
    gainLabel: c2d.C2D_Text
    c2d.C2D_TextParse(&titleText, staticBuf, "Microphone")
    c2d.C2D_TextParse(&gainLabel, staticBuf, "Gain:")
    c2d.C2D_TextOptimize(&titleText)
    c2d.C2D_TextOptimize(&gainLabel)

    gainStr:  [16]u8
    gainText: c2d.C2D_Text
    pctStr:   [8]u8
    pctText:  c2d.C2D_Text

    // Track read-head for ring-buffer scan (mirrors devkitPro's micbuf_pos).
    micbuf_readpos: u32 = 0
    peak: f32 = 0

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        keys := ctru.hidKeysDown()
        held := ctru.hidKeysHeld()

        if keys & ctru.KEY_START != 0 do break

        // ── Gain control ──────────────────────────────────────────────
        if (keys | held) & ctru.KEY_UP != 0 {
            if g_gain <= 155 {
                g_gain += 5
                ctru.MICU_SetGain(g_gain)
            }
        }
        if (keys | held) & ctru.KEY_DOWN != 0 {
            if g_gain >= 5 {
                g_gain -= 5
                ctru.MICU_SetGain(g_gain)
            }
        }

        // ── Read ring buffer for peak amplitude ───────────────────────
        // Advance read-head to current write-head, scanning for peak.
        // Mirrors the devkitPro read loop: advance micbuf_readpos one
        // byte at a time, wrapping at micbuf_datasize.
        writePos := ctru.micGetLastSampleOffset()
        maxSample: i16 = 0

        // Only scan if there are new samples available.
        if micbuf_readpos != writePos && micbuf_datasize > 0 {
            scanned := u32(0)
            readPos := micbuf_readpos
            for readPos != writePos && scanned < SCAN_SAMPLES * 2 {
                // Read one PCM16 sample (two bytes, little-endian).
                lo := u16(micBuf[readPos])
                readPos = (readPos + 1) % micbuf_datasize
                hi := u16(micBuf[readPos])
                readPos = (readPos + 1) % micbuf_datasize
                s := i16(lo | (hi << 8))
                if s < 0 { s = -s }
                if s > maxSample { maxSample = s }
                scanned += 2
            }
            micbuf_readpos = writePos
        }

        // Smooth peak with a simple decay (keeps the bar from snapping to 0).
        targetPeak := f32(maxSample) / 32767.0
        if targetPeak > peak {
            peak = targetPeak
        } else {
            peak = peak * 0.85  // decay
        }

        // ── Dynamic text ──────────────────────────────────────────────
        c2d.C2D_TextBufClear(dynBuf)
        ctru.snprintf(&gainStr[0], 16, "%d/160", i32(g_gain))
        ctru.snprintf(&pctStr[0],  8,  "%d%%",   i32(peak * 100))
        c2d.C2D_TextParse(&gainText, dynBuf, cstring(&gainStr[0]))
        c2d.C2D_TextParse(&pctText,  dynBuf, cstring(&pctStr[0]))
        c2d.C2D_TextOptimize(&gainText)
        c2d.C2D_TextOptimize(&pctText)

        // ── Render ────────────────────────────────────────────────────
        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, clrBg)
        c2d.C2D_SceneBegin(top)

        // Title
        c2d.C2D_DrawTextColor(&titleText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 10, 0, 0.75, 0.75, clrTitle)

        // Bar border + background
        c2d.C2D_DrawRectSolid(BAR_X - 2, BAR_Y - 2, 0, BAR_MAX_W + 4, BAR_H + 4, clrBorder)
        c2d.C2D_DrawRectSolid(BAR_X, BAR_Y, 0, BAR_MAX_W, BAR_H, clrBg)

        // Filled bar
        barW   := peak * BAR_MAX_W
        barClr := clrGreen
        if peak > 0.6 {
            barClr = clrRed
        } else if peak > 0.3 {
            barClr = clrYellow
        }
        if barW >= 1 {
            c2d.C2D_DrawRectSolid(BAR_X, BAR_Y, 0, barW, BAR_H, barClr)
        }

        // Threshold markers
        c2d.C2D_DrawRectSolid(BAR_X + BAR_MAX_W * 0.3, BAR_Y, 0, 2, BAR_H, clrBorder)
        c2d.C2D_DrawRectSolid(BAR_X + BAR_MAX_W * 0.6, BAR_Y, 0, 2, BAR_H, clrBorder)

        // Gain label + value
        c2d.C2D_DrawTextColor(&gainLabel,
            c2d.C2D_WithColor, BAR_X, 200, 0, 0.6, 0.6, clrWhite)
        c2d.C2D_DrawTextColor(&gainText,
            c2d.C2D_WithColor, BAR_X + 56, 200, 0, 0.6, 0.6, clrWhite)

        // Amplitude %
        c2d.C2D_DrawTextColor(&pctText,
            c2d.C2D_WithColor, BAR_X, 220, 0, 0.55, 0.55, clrYellow)

        c3d.C3D_FrameEnd(0)
    }

    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
