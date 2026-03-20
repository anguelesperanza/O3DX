package drawtextalign_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates text alignment flags:
//   C2D_AlignLeft   (0)  — default, x is left edge
//   C2D_AlignCenter (8)  — x is horizontal centre of the text
//   C2D_AlignRight  (4)  — x is right edge of the text
//
// All three rows are drawn at scale 0.7 so the comparison is clear.

@(export, link_name = "odin_main")
drawtextalign_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	buf := c2d.C2D_TextBufNew(64)

	leftText:   c2d.C2D_Text
	centerText: c2d.C2D_Text
	rightText:  c2d.C2D_Text

	c2d.C2D_TextParse(&leftText,   buf, "Left aligned")
	c2d.C2D_TextParse(&centerText, buf, "-- Centered --")
	c2d.C2D_TextParse(&rightText,  buf, "Right aligned")

	c2d.C2D_TextOptimize(&leftText)
	c2d.C2D_TextOptimize(&centerText)
	c2d.C2D_TextOptimize(&rightText)

	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrCyan   := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)
	clrOrange := c2d.C2D_Color32(0xFF, 0xA0, 0x00, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HDrawTextAlign Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HShows left / center / right")
		ctru.printf("\x1b[5;1Halignment at scale 0.7.")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Left: x=6 is the left edge of the text.
		c2d.C2D_DrawTextColor(&leftText,
			c2d.C2D_AlignLeft | c2d.C2D_WithColor,
			6, 70, 0, 0.7, 0.7, clrWhite)

		// Center: x=200 is the horizontal midpoint of the text.
		c2d.C2D_DrawTextColor(&centerText,
			c2d.C2D_AlignCenter | c2d.C2D_WithColor,
			200, 110, 0, 0.7, 0.7, clrCyan)

		// Right: x=394 is the right edge of the text.
		c2d.C2D_DrawTextColor(&rightText,
			c2d.C2D_AlignRight | c2d.C2D_WithColor,
			394, 150, 0, 0.7, 0.7, clrOrange)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_TextBufDelete(buf)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
