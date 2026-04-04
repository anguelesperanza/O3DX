package swkbd_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates the software keyboard applet (swkbd).
//
// TOP SCREEN — shows the text the user typed (or a placeholder).
// BOTTOM SCREEN (console) — shows status messages.
//
// Controls:
//   A      — open the keyboard
//   START  — exit

@(export, link_name = "odin_main")
swkbd_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    // ── Text buffers ──────────────────────────────────────────────
    // Static labels parsed once.
    staticBuf := c2d.C2D_TextBufNew(128)
    titleText:  c2d.C2D_Text
    hintText:   c2d.C2D_Text
    labelText:  c2d.C2D_Text
    c2d.C2D_TextParse(&titleText, staticBuf, "SwKbd Example")
    c2d.C2D_TextParse(&hintText,  staticBuf, "Press A to open keyboard")
    c2d.C2D_TextParse(&labelText, staticBuf, "You typed:")
    c2d.C2D_TextOptimize(&titleText)
    c2d.C2D_TextOptimize(&hintText)
    c2d.C2D_TextOptimize(&labelText)

    // Dynamic buffer — re-parsed whenever the user submits text.
    dynBuf    := c2d.C2D_TextBufNew(256)
    inputText:  c2d.C2D_Text
    inputBuf:   [256]u8  // raw UTF-8 from swkbd
    hasInput  := false

    // Parse a placeholder so dynBuf always has valid content.
    c2d.C2D_TextParse(&inputText, dynBuf, "(nothing yet)")

    // ── Colours ───────────────────────────────────────────────────
    clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
    clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
    clrYellow := c2d.C2D_Color32(0xFF, 0xE0, 0x00, 0xFF)
    clrCyan   := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)
    clrGreen  := c2d.C2D_Color32(0x00, 0xFF, 0x80, 0xFF)

    ctru.printf("\x1b[1;1HSwKbd Example")
    ctru.printf("\x1b[2;1HPress A to open keyboard")
    ctru.printf("\x1b[3;1HPress START to exit")

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        kDown := ctru.hidKeysDown()

        if kDown & ctru.KEY_START != 0 do break

        // ── Open the keyboard on A ────────────────────────────────
        if kDown & ctru.KEY_A != 0 {
            ctru.printf("\x1b[5;1HOpening keyboard...")

            state: ctru.SwkbdState
            ctru.swkbdInit(&state, .NORMAL, 2, 127)
            ctru.swkbdSetHintText(&state, "Enter some text")
            ctru.swkbdSetButton(&state, .LEFT,    "Cancel", false)
            ctru.swkbdSetButton(&state, .CONFIRM, "OK",     true)

            button := ctru.swkbdInputText(&state, raw_data(inputBuf[:]), len(inputBuf))

            if button == .CONFIRM {
                // Re-parse the new text into the dynamic buffer.
                c2d.C2D_TextBufClear(dynBuf)
                c2d.C2D_TextParse(&inputText, dynBuf, cstring(&inputBuf[0]))
                c2d.C2D_TextOptimize(&inputText)
                hasInput = true
                ctru.printf("\x1b[5;1HGot input!          ")
            } else {
                ctru.printf("\x1b[5;1HCancelled.          ")
            }
        }

        // ── Render ────────────────────────────────────────────────
        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, clrBg)
        c2d.C2D_SceneBegin(top)

        // Title
        c2d.C2D_DrawTextColor(&titleText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 20, 0, 0.8, 0.8, clrYellow)

        // Prompt
        c2d.C2D_DrawTextColor(&hintText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 60, 0, 0.55, 0.55, clrWhite)

        // "You typed:" label
        c2d.C2D_DrawTextColor(&labelText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 110, 0, 0.6, 0.6, clrWhite)

        // The typed text (cyan if input received, grey placeholder otherwise)
        textColor := clrGreen if hasInput else c2d.C2D_Color32(0x88, 0x88, 0x88, 0xFF)
        c2d.C2D_DrawTextColor(&inputText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 145, 0, 0.75, 0.75, textColor)

        // Press A hint at bottom
        c2d.C2D_DrawTextColor(&hintText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 210, 0, 0.5, 0.5, clrCyan)

        c3d.C3D_FrameEnd(0)
    }

    c2d.C2D_TextBufDelete(staticBuf)
    c2d.C2D_TextBufDelete(dynBuf)
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
