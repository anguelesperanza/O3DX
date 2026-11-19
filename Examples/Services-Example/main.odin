package services_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Tests a batch of newly bound libctru services and OS helpers against the
// live console. The bottom screen lists each value with the result code of
// the call that produced it (0x00000000 = success). The top screen draws
// four bars that should follow the hardware as you change it:
//   green   battery (MCUHWC_GetBatteryLevel, 0-100 %)
//   yellow  volume slider (MCUHWC_GetSoundSliderLevel, 0-63)
//   cyan    3D slider (osGet3DSliderState, 0-1)
//   white   Wi-Fi strength (osGetWifiStrength, 0-3)
// The top screen uses C2D_Flush + C3D_FrameDrawOn + C2D_SceneTarget
// directly (what C2D_SceneBegin does); C2D_SceneTarget was unlinkable before. Bar colours
// go through C2D_FloatToU8.
//
// mcu::HWC and am:u need access the homebrew launcher normally grants; a
// non-zero rc on one of them is worth noting rather than a binding bug.
//
// Controls:
//   X      turn the bottom backlight off / on (GSPLCD)
//   Y      pulse the notification LED blue (MCUHWC_SetInfoLedPattern)
//   START  exit

// Bar colour from 0..1 floats.
rgb :: proc "contextless" (r, g, b: f32) -> u32 {
    return c2d.C2D_Color32(c2d.C2D_FloatToU8(r), c2d.C2D_FloatToU8(g), c2d.C2D_FloatToU8(b), 255)
}

draw_bar :: proc "contextless" (row: int, fraction: f32, colour: u32) {
    y := 40.0 + f32(row) * 45.0
    c2d.C2D_DrawRectSolid(40.0, y, 0.5, 320.0, 25.0, 0xFF303030)
    c2d.C2D_DrawRectSolid(40.0, y, 0.5, 320.0 * c2d.C2D_Clamp(fraction, 0.0, 1.0), 25.0, colour)
}

@(export, link_name = "odin_main")
services_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    rc_ptm := ctru.ptmuInit()
    rc_mcu := ctru.mcuHwcInit()
    rc_ps  := ctru.psInit()
    rc_frd := ctru.frdInit(false)
    rc_am  := ctru.amInit()
    rc_lcd := ctru.gspLcdInit()

    // ── Values read once ──────────────────────────────────────────
    ctru.printf("\x1b[1;1HServices-Example")

    nver: ctru.OS_VersionBin
    cver: ctru.OS_VersionBin
    sysver: [64]u8
    rc_ver := ctru.osGetSystemVersionDataString(&nver, &cver, &sysver[0], len(sysver))
    ctru.printf("\x1b[3;1Hsystem %s", cstring(&sysver[0]))
    ctru.printf("\x1b[4;1H  rc 0x%08lX", rc_ver)

    kernel := ctru.osGetKernelVersion()
    ctru.printf("\x1b[5;1Hkernel %lu.%lu-%lu", kernel >> 24, (kernel >> 16) & 0xFF, (kernel >> 8) & 0xFF)

    key: ctru.FriendKey
    rc_key := ctru.FRD_GetMyFriendKey(&key)
    ctru.printf("\x1b[6;1Hprincipal id %lu  rc 0x%08lX", key.principalId, rc_key)

    sd_titles:   u32
    nand_titles: u32
    rc_sd   := ctru.AM_GetTitleCount(.SD, &sd_titles)
    rc_nand := ctru.AM_GetTitleCount(.NAND, &nand_titles)
    ctru.printf("\x1b[7;1Htitles SD %lu NAND %lu", sd_titles, nand_titles)
    ctru.printf("\x1b[8;1H  rc 0x%08lX 0x%08lX", rc_sd, rc_nand)

    random: [4]u8
    rc_rand := ctru.PS_GenerateRandomBytes(&random[0], len(random))
    ctru.printf("\x1b[9;1Hrandom %02X%02X%02X%02X rc 0x%08lX", u32(random[0]), u32(random[1]), u32(random[2]), u32(random[3]), rc_rand)

    ctru.printf("\x1b[11;1Hinit rc: ptm %08lX mcu %08lX", rc_ptm, rc_mcu)
    ctru.printf("\x1b[12;1H  ps %08lX frd %08lX", rc_ps, rc_frd)
    ctru.printf("\x1b[13;1H  am %08lX lcd %08lX", rc_am, rc_lcd)

    ctru.printf("\x1b[28;1HX: backlight Y: LED START: exit")

    backlight_on := true

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        if down & ctru.KEY_START != 0 do break

        if down & ctru.KEY_X != 0 {
            backlight_on = !backlight_on
            if backlight_on {
                ctru.GSPLCD_PowerOnBacklight(ctru.GSPLCD_SCREEN_BOTTOM)
            } else {
                ctru.GSPLCD_PowerOffBacklight(ctru.GSPLCD_SCREEN_BOTTOM)
            }
        }
        if down & ctru.KEY_Y != 0 {
            // Fade blue in and out once.
            pattern: ctru.InfoLedPattern
            pattern.delay = 0x02
            pattern.smoothing = 0x40
            pattern.loopDelay = 0xFF
            for i in 0 ..< 32 {
                level := i
                if i >= 16 do level = 31 - i
                pattern.bluePattern[i] = u8(level * 16)
            }
            rc_led := ctru.MCUHWC_SetInfoLedPattern(&pattern)
            ctru.printf("\x1b[26;1HLED rc 0x%08lX  ", rc_led)
        }

        // ── Live values ───────────────────────────────────────────
        ptm_level:  u8
        charging:   u8
        adapter:    bool
        steps:      u32
        ctru.PTMU_GetBatteryLevel(&ptm_level)
        ctru.PTMU_GetBatteryChargeState(&charging)
        ctru.PTMU_GetAdapterState(&adapter)
        ctru.PTMU_GetTotalStepCount(&steps)

        battery: u8
        voltage: u8
        volume:  u8
        ctru.MCUHWC_GetBatteryLevel(&battery)
        ctru.MCUHWC_GetBatteryVoltage(&voltage)
        ctru.MCUHWC_GetSoundSliderLevel(&volume)

        slider := ctru.osGet3DSliderState()
        wifi := ctru.osGetWifiStrength()

        ctru.printf("\x1b[15;1HPTM battery %d/5 charging %d    ", i32(ptm_level), i32(charging))
        ctru.printf("\x1b[16;1H    adapter %d steps %lu      ", i32(adapter), steps)
        ctru.printf("\x1b[17;1HMCU battery %3d%% voltage %3d  ", i32(battery), i32(voltage))
        ctru.printf("\x1b[18;1H    volume %2d/63               ", i32(volume))
        ctru.printf("\x1b[19;1H3D slider %.2f  wifi %d/3     ", f64(slider), i32(wifi))
        ctru.printf("\x1b[20;1Htime %llu ms           ", ctru.osGetTime())
        ctru.printf("\x1b[21;1Hfree memory %lu KiB      ", ctru.osGetMemRegionFree(.ALL) / 1024)

        // ── Top screen ────────────────────────────────────────────
        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, 0xFF201810)
        c2d.C2D_Flush()
        c3d.C3D_FrameDrawOn(top)
        c2d.C2D_SceneTarget(top)
        draw_bar(0, f32(battery) / 100.0, rgb(0.2, 0.9, 0.3))
        draw_bar(1, f32(volume) / 63.0, rgb(1.0, 0.85, 0.1))
        draw_bar(2, slider, rgb(0.1, 0.9, 1.0))
        draw_bar(3, f32(wifi) / 3.0, rgb(1.0, 1.0, 1.0))
        c3d.C3D_FrameEnd(0)
    }

    if !backlight_on do ctru.GSPLCD_PowerOnBacklight(ctru.GSPLCD_SCREEN_BOTTOM)

    ctru.gspLcdExit()
    ctru.amExit()
    ctru.frdExit()
    ctru.psExit()
    ctru.mcuHwcExit()
    ctru.ptmuExit()
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
