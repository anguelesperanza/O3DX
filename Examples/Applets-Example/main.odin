package applets_example

import ctru "../../lib/ctru"

// Tests the newly bound library applets (3ds/applets/miiselector.h and
// error.h). Both pass large structs to the system, so they also check that
// MiiSelectorConf, MiiSelectorReturn and errorConf have C's layout.
//
//   A  Mii selector: pick a Mii (guests allowed). Prints its name and
//      author, and whether the returned checksum is valid. A valid checksum
//      means MiiSelectorReturn lines up with what the applet wrote.
//   B  Error applet: shows a word-wrapped message, then prints how it was
//      closed (expect SUCCESS after pressing OK).
//   START  exit

pass_fail :: proc "contextless" (ok: bool) -> cstring {
    if ok do return "PASS"
    return "FAIL"
}

show_mii_selector :: proc "contextless" () {
    conf: ctru.MiiSelectorConf
    ctru.miiSelectorInit(&conf)
    ctru.miiSelectorSetTitle(&conf, "Applets-Example: pick a Mii")
    ctru.miiSelectorSetOptions(&conf, ctru.MIISELECTOR_CANCEL | ctru.MIISELECTOR_GUESTS)

    ret: ctru.MiiSelectorReturn
    ctru.miiSelectorLaunch(&conf, &ret)

    ctru.printf("\nMii selector:\n")
    if ret.no_mii_selected != 0 {
        ctru.printf("  cancelled\n")
        return
    }
    name:   [36]u8
    author: [30]u8
    ctru.miiSelectorReturnGetName(&ret, &name[0], len(name))
    ctru.miiSelectorReturnGetAuthor(&ret, &author[0], len(author))
    ctru.printf("  name:   %s\n", cstring(&name[0]))
    ctru.printf("  author: %s\n", cstring(&author[0]))
    ctru.printf("  guest:  %lu (index %lu)\n", ret.guest_mii_was_selected, ret.guest_mii_index)
    valid := ctru.miiSelectorChecksumIsValid(&ret)
    ctru.printf("  %s checksum 0x%04X valid\n", pass_fail(valid), u32(ret.checksum))
}

show_error_applet :: proc "contextless" () {
    err: ctru.errorConf
    ctru.errorInit(&err, .TEXT_WORD_WRAP, .EN)
    ctru.errorText(&err, "This message comes from Applets-Example through the newly bound error applet. Press OK to return.")
    ctru.errorDisp(&err)

    ctru.printf("\nError applet:\n")
    ctru.printf("  %s returnCode %d (expect 1 = SUCCESS)\n", pass_fail(err.returnCode == .SUCCESS), i32(err.returnCode))
}

@(export, link_name = "odin_main")
applets_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    ctru.consoleInit(ctru.GFX_TOP, nil)

    ctru.printf("Applets-Example\n\n")
    ctru.printf("size_of(MiiSelectorConf)   = %d (expect 260)\n", i32(size_of(ctru.MiiSelectorConf)))
    ctru.printf("size_of(MiiSelectorReturn) = %d (expect 132)\n", i32(size_of(ctru.MiiSelectorReturn)))
    ctru.printf("size_of(errorConf)         = %d (expect 3820)\n", i32(size_of(ctru.errorConf)))
    ctru.printf("\nA: Mii selector  B: error applet\nSTART: exit\n")

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        if down & ctru.KEY_START != 0 do break
        if down & ctru.KEY_A != 0 do show_mii_selector()
        if down & ctru.KEY_B != 0 do show_error_applet()

        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.gspWaitForEvent(.VBLANK0, true)
    }

    ctru.gfxExit()
    return 0
}
