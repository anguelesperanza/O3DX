package systeminfo_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates CFGU — reads system configuration at startup and
// displays it on the top screen.
//
// Shows:
//   • Hardware model   (O3DS / O3DSXL / N3DS / 2DS / N3DSXL / N2DSXL)
//   • Region           (JPN / USA / EUR / AUS / CHN / KOR / TWN)
//   • Language         (EN / JP / FR / DE / IT / ES / ZH / KO / NL / PT / RU / TW)
//   • NFC support      (yes / no)
//   • Is 2DS?          (yes / no)
//
// Controls:
//   START — exit

// model_name converts a CFG_SystemModel byte to a readable string.
model_name :: proc "c" (m: u8) -> cstring {
    switch ctru.CFG_SystemModel(m) {
    case .MODEL_3DS:    return "Old 3DS"
    case .MODEL_3DSXL:  return "Old 3DS XL"
    case .MODEL_N3DS:   return "New 3DS"
    case .MODEL_2DS:    return "Old 2DS"
    case .MODEL_N3DSXL: return "New 3DS XL"
    case .MODEL_N2DSXL: return "New 2DS XL"
    }
    return "Unknown"
}

// region_name converts a CFG_Region byte to a string.
region_name :: proc "c" (r: u8) -> cstring {
    switch ctru.CFG_Region(r) {
    case .JPN: return "Japan (JPN)"
    case .USA: return "USA"
    case .EUR: return "Europe (EUR)"
    case .AUS: return "Australia (AUS)"
    case .CHN: return "China (CHN)"
    case .KOR: return "Korea (KOR)"
    case .TWN: return "Taiwan (TWN)"
    }
    return "Unknown"
}

// lang_name converts a CFG_Language byte to a string.
lang_name :: proc "c" (l: u8) -> cstring {
    switch ctru.CFG_Language(i8(l)) {
    case .JP: return "Japanese"
    case .EN: return "English"
    case .FR: return "French"
    case .DE: return "German"
    case .IT: return "Italian"
    case .ES: return "Spanish"
    case .ZH: return "Simplified Chinese"
    case .KO: return "Korean"
    case .NL: return "Dutch"
    case .PT: return "Portuguese"
    case .RU: return "Russian"
    case .TW: return "Traditional Chinese"
    case .DEFAULT: return "System Default"
    }
    return "Unknown"
}

@(export, link_name = "odin_main")
systeminfo_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    // ── Query CFGU ────────────────────────────────────────────────
    model:    u8
    region:   u8
    language: u8
    is2DS:    u8
    nfcOK:    bool

    cfguOK := ctru.cfguInit()
    if cfguOK == 0 {
        ctru.CFGU_GetSystemModel(&model)
        ctru.CFGU_SecureInfoGetRegion(&region)
        ctru.CFGU_GetSystemLanguage(&language)
        ctru.CFGU_GetModelNintendo2DS(&is2DS)
        ctru.CFGU_IsNFCSupported(&nfcOK)
        ctru.cfguExit()
    }

    // ── Build display strings ─────────────────────────────────────
    // We use 6 rows; each fits in 40 chars on the top screen at 0.6 scale.
    lineBuf: [6][48]u8
    ctru.snprintf(&lineBuf[0][0], 48, "Model:    %s",  model_name(model))
    ctru.snprintf(&lineBuf[1][0], 48, "Region:   %s",  region_name(region))
    ctru.snprintf(&lineBuf[2][0], 48, "Language: %s",  lang_name(language))
    ctru.snprintf(&lineBuf[3][0], 48, "NFC:      %s",  "yes" if nfcOK else "no")
    ctru.snprintf(&lineBuf[4][0], 48, "Is 2DS:   %s",  "yes" if is2DS == 0 else "no")
    cfguStatus := "OK" if cfguOK == 0 else "FAILED"
    ctru.snprintf(&lineBuf[5][0], 48, "CFGU:     %s",  cfguStatus)

    // Parse all lines into a single static text buffer.
    textBuf := c2d.C2D_TextBufNew(300)
    lines:    [6]c2d.C2D_Text
    for i in 0..<6 {
        c2d.C2D_TextParse(&lines[i], textBuf, cstring(&lineBuf[i][0]))
        c2d.C2D_TextOptimize(&lines[i])
    }

    // Title text
    titleBuf := c2d.C2D_TextBufNew(32)
    titleText: c2d.C2D_Text
    c2d.C2D_TextParse(&titleText, titleBuf, "System Information")
    c2d.C2D_TextOptimize(&titleText)

    // ── Colours ───────────────────────────────────────────────────
    clrBg     := c2d.C2D_Color32(0x0D, 0x1B, 0x2A, 0xFF)
    clrTitle  := c2d.C2D_Color32(0xFF, 0xE0, 0x00, 0xFF)
    clrKey    := c2d.C2D_Color32(0x88, 0xCC, 0xFF, 0xFF)
    clrVal    := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)

    ctru.printf("\x1b[1;1HSystem Info Example")
    ctru.printf("\x1b[2;1HPress START to exit")

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, clrBg)
        c2d.C2D_SceneBegin(top)

        // Title centred at top
        c2d.C2D_DrawTextColor(&titleText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 15, 0, 0.75, 0.75, clrTitle)

        // Draw divider line as a thin white rectangle
        c2d.C2D_DrawRectSolid(20, 46, 0, 360, 2,
            c2d.C2D_Color32(0x44, 0x44, 0x66, 0xFF))

        // Info rows — key in light blue, value in white, same string
        ROW_START :: f32(55)
        ROW_STEP  :: f32(28)
        rowColors := [6]u32{
            clrKey, clrKey, clrKey, clrKey, clrKey, clrVal,
        }
        for i in 0..<6 {
            c2d.C2D_DrawTextColor(&lines[i],
                c2d.C2D_AlignLeft | c2d.C2D_WithColor,
                24, ROW_START + f32(i) * ROW_STEP, 0,
                0.6, 0.6, rowColors[i])
        }

        c3d.C3D_FrameEnd(0)
    }

    c2d.C2D_TextBufDelete(textBuf)
    c2d.C2D_TextBufDelete(titleBuf)
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
