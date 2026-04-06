package nfc_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates the NFC service: amiibo scanning and data reading.
//
// State machine:
//   Idle         — NFC not started
//   Scanning     — looking for a tag (shown in yellow)
//   TagInRange   — tag detected, loading data (shown in cyan)
//   DataReady    — amiibo data loaded; shows character ID, series,
//                  write counter, and amiibo type (shown in green)
//   Error        — something failed (shown in red)
//
// Controls:
//   A      — start / restart scan
//   B      — stop scan (from Scanning state)
//   START  — exit

NFCState :: enum u8 {
    Idle,
    Scanning,
    TagInRange,
    DataReady,
    Error,
}

g_nfcState: NFCState
g_tagInfo:  ctru.NFC_TagInfo
g_config:   ctru.NFC_AmiiboConfig

state_color :: proc "c" (s: NFCState) -> u32 {
    switch s {
    case .Idle:       return c2d.C2D_Color32(0x88, 0x88, 0x88, 0xFF)
    case .Scanning:   return c2d.C2D_Color32(0xFF, 0xD7, 0x00, 0xFF)
    case .TagInRange: return c2d.C2D_Color32(0x00, 0xCC, 0xFF, 0xFF)
    case .DataReady:  return c2d.C2D_Color32(0x00, 0xFF, 0x88, 0xFF)
    case .Error:      return c2d.C2D_Color32(0xFF, 0x33, 0x33, 0xFF)
    }
    return 0xFFFFFFFF
}

state_label :: proc "c" (s: NFCState) -> cstring {
    switch s {
    case .Idle:       return "Idle — press A to scan"
    case .Scanning:   return "Scanning...  (B to stop)"
    case .TagInRange: return "Tag detected, loading..."
    case .DataReady:  return "Amiibo data ready!"
    case .Error:      return "Error — press A to retry"
    }
    return ""
}

@(export, link_name = "odin_main")
nfc_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    // ── Graphics ──────────────────────────────────────────────────────
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    ctru.printf("NFC / Amiibo Example\n")
    ctru.printf("A=Scan  B=Stop  START=Exit\n")

    // ── NFC init ──────────────────────────────────────────────────────
    rc := ctru.nfcInit(.NFCTag)
    if rc != 0 {
        ctru.printf("nfcInit failed: 0x%08lX\n", rc)
        ctru.printf("NFC requires system >=9.3.0\n")
        ctru.gfxExit()
        return 1
    }
    defer ctru.nfcExit()

    // ── Colours & text buffers ────────────────────────────────────────
    clrBg     := c2d.C2D_Color32(0x0D, 0x0D, 0x1A, 0xFF)
    clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
    clrSubtle := c2d.C2D_Color32(0x66, 0x77, 0x88, 0xFF)
    clrTitle  := c2d.C2D_Color32(0xFF, 0xD7, 0x00, 0xFF)

    staticBuf := c2d.C2D_TextBufNew(128)
    dynBuf    := c2d.C2D_TextBufNew(512)

    titleText: c2d.C2D_Text
    c2d.C2D_TextParse(&titleText, staticBuf, "NFC / Amiibo Scanner")
    c2d.C2D_TextOptimize(&titleText)

    stateTxt:  c2d.C2D_Text
    line0Txt:  c2d.C2D_Text
    line1Txt:  c2d.C2D_Text
    line2Txt:  c2d.C2D_Text
    line3Txt:  c2d.C2D_Text
    line4Txt:  c2d.C2D_Text

    l0: [64]u8
    l1: [64]u8
    l2: [64]u8
    l3: [64]u8
    l4: [64]u8

    amiibo_type_str :: proc "c" (t: u8) -> cstring {
        switch t {
        case 0: return "Figure"
        case 1: return "Card"
        case 2: return "Plush"
        }
        return "Unknown"
    }

    g_nfcState = .Idle
    tagStatePrev := ctru.NFC_TagState.Uninitialized

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        keys := ctru.hidKeysDown()

        if keys & ctru.KEY_START != 0 do break

        // ── Input ─────────────────────────────────────────────────────
        if keys & ctru.KEY_A != 0 && g_nfcState != .Scanning && g_nfcState != .TagInRange {
            rc = ctru.nfcStartScanning(ctru.NFC_STARTSCAN_DEFAULTINPUT)
            if rc == 0 {
                g_nfcState = .Scanning
                ctru.printf("\nStarted scanning...\n")
            } else {
                g_nfcState = .Error
                ctru.printf("\nnfcStartScanning: 0x%08lX\n", rc)
            }
        }

        if keys & ctru.KEY_B != 0 && g_nfcState == .Scanning {
            ctru.nfcStopScanning()
            g_nfcState = .Idle
            ctru.printf("Scan stopped.\n")
        }

        // ── Poll NFC state ────────────────────────────────────────────
        if g_nfcState == .Scanning || g_nfcState == .TagInRange {
            tagState: ctru.NFC_TagState
            ctru.nfcGetTagState(&tagState)

            if tagState != tagStatePrev {
                tagStatePrev = tagState
                ctru.printf("TagState -> %d\n", tagState)
            }

            switch tagState {
            case .InRange:
                g_nfcState = .TagInRange
                // Load the amiibo data
                rc = ctru.nfcLoadAmiiboData()
                if rc != 0 {
                    ctru.printf("LoadAmiiboData: 0x%08lX\n", rc)
                    g_nfcState = .Error
                }

            case .DataReady:
                // Read tag identification and config
                ctru.nfcGetTagInfo(&g_tagInfo)
                rc = ctru.nfcGetAmiiboConfig(&g_config)
                if rc == 0 {
                    g_nfcState = .DataReady
                    ctru.nfcStopScanning()
                    ctru.printf("Amiibo loaded!\n")
                } else {
                    ctru.printf("GetAmiiboConfig: 0x%08lX\n", rc)
                    g_nfcState = .Error
                }

            case .OutOfRange:
                if g_nfcState != .DataReady {
                    ctru.printf("Tag moved out of range.\n")
                    g_nfcState = .Scanning
                    // Restart scanning
                    ctru.nfcStopScanning()
                    ctru.nfcStartScanning(ctru.NFC_STARTSCAN_DEFAULTINPUT)
                }

            case .ScanningStopped, .Uninitialized:
                // nothing

            case .Scanning:
                // still waiting
            }
        }

        // ── Build display strings ─────────────────────────────────────
        c2d.C2D_TextBufClear(dynBuf)

        c2d.C2D_TextParse(&stateTxt, dynBuf, state_label(g_nfcState))

        if g_nfcState == .DataReady {
            ctru.snprintf(&l0[0], 64, "Type:    %s", amiibo_type_str(g_config.amiibo_type))
            ctru.snprintf(&l1[0], 64, "Series:  0x%02X", g_config.series)
            ctru.snprintf(&l2[0], 64, "Char:    %02X %02X %02X",
                g_config.characterID[0],
                g_config.characterID[1],
                g_config.characterID[2])
            ctru.snprintf(&l3[0], 64, "AmiiboID: 0x%04X", g_config.amiiboID)
            ctru.snprintf(&l4[0], 64, "Writes:  %d", g_config.write_counter)
        } else {
            ctru.snprintf(&l0[0], 64, "Hold an amiibo near")
            ctru.snprintf(&l1[0], 64, "the NFC reader.")
            ctru.snprintf(&l2[0], 64, " ")
            ctru.snprintf(&l3[0], 64, " ")
            ctru.snprintf(&l4[0], 64, " ")
        }

        c2d.C2D_TextParse(&line0Txt, dynBuf, cstring(&l0[0]))
        c2d.C2D_TextParse(&line1Txt, dynBuf, cstring(&l1[0]))
        c2d.C2D_TextParse(&line2Txt, dynBuf, cstring(&l2[0]))
        c2d.C2D_TextParse(&line3Txt, dynBuf, cstring(&l3[0]))
        c2d.C2D_TextParse(&line4Txt, dynBuf, cstring(&l4[0]))

        // ── Render ────────────────────────────────────────────────────
        clrState := state_color(g_nfcState)

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, clrBg)
        c2d.C2D_SceneBegin(top)

        // Title
        c2d.C2D_DrawTextColor(&titleText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 8, 0, 0.70, 0.70, clrTitle)

        // State indicator bar
        c2d.C2D_DrawRectSolid(0, 40, 0, 400, 3, clrState)

        // State label
        c2d.C2D_DrawTextColor(&stateTxt,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 50, 0, 0.60, 0.60, clrState)

        // Data rows
        ROW :: f32(28)
        c2d.C2D_DrawTextColor(&line0Txt, c2d.C2D_WithColor, 20, 90,       0, 0.58, 0.58, clrWhite)
        c2d.C2D_DrawTextColor(&line1Txt, c2d.C2D_WithColor, 20, 90+ROW,   0, 0.58, 0.58, clrWhite)
        c2d.C2D_DrawTextColor(&line2Txt, c2d.C2D_WithColor, 20, 90+ROW*2, 0, 0.58, 0.58, clrWhite)
        c2d.C2D_DrawTextColor(&line3Txt, c2d.C2D_WithColor, 20, 90+ROW*3, 0, 0.58, 0.58, clrWhite)
        c2d.C2D_DrawTextColor(&line4Txt, c2d.C2D_WithColor, 20, 90+ROW*4, 0, 0.58, 0.58, clrSubtle)

        c3d.C3D_FrameEnd(0)
    }

    c2d.C2D_TextBufDelete(staticBuf)
    c2d.C2D_TextBufDelete(dynBuf)
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
