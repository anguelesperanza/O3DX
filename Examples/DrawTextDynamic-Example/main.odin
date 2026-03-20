package drawtextdynamic_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates dynamic (per-frame) text using:
//   C2D_TextBufClear  — reset the buffer each frame
//   C2D_TextParse     — re-parse the new string
//   snprintf          — build the string from a counter
//
// snprintf comes from newlib, which is bundled with libctru.

foreign import ctru_libc "system:ctru"

@(default_calling_convention = "c")
foreign ctru_libc {
	snprintf :: proc(buf: [^]u8, size: uint, fmt: cstring, #c_vararg args: ..any) -> i32 ---
}

@(export, link_name = "odin_main")
drawtextdynamic_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Static buffer — never changes, parsed once.
	staticBuf := c2d.C2D_TextBufNew(32)
	titleText: c2d.C2D_Text
	c2d.C2D_TextParse(&titleText, staticBuf, "Frame counter:")
	c2d.C2D_TextOptimize(&titleText)

	// Dynamic buffer — cleared and re-parsed every frame.
	dynamicBuf := c2d.C2D_TextBufNew(32)
	counterText: c2d.C2D_Text

	counterStr: [32]u8

	clrBg    := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrWhite := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrCyan  := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)

	frame := u32(0)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		frame += 1

		// Rebuild the counter string every frame.
		c2d.C2D_TextBufClear(dynamicBuf)
		snprintf(&counterStr[0], 32, "%u", frame)
		c2d.C2D_TextParse(&counterText, dynamicBuf, cstring(&counterStr[0]))

		ctru.printf("\x1b[1;1HDrawTextDynamic Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HThe number updates")
		ctru.printf("\x1b[5;1Hevery frame via snprintf.")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Static label at scale 0.7.
		c2d.C2D_DrawTextColor(&titleText,
			c2d.C2D_WithColor,
			10, 90, 0, 0.7, 0.7, clrWhite)

		// Dynamic counter — large and centred, updated every frame.
		c2d.C2D_DrawTextColor(&counterText,
			c2d.C2D_AlignCenter | c2d.C2D_WithColor,
			200, 120, 0, 1.0, 1.0, clrCyan)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_TextBufDelete(staticBuf)
	c2d.C2D_TextBufDelete(dynamicBuf)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
