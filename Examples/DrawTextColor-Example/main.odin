package drawtextcolor_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_DrawTextColor — drawing text in explicit RGBA colours.
// C2D_WithColor (= BIT(1) = 2) must be included in flags; citro2d then reads
// the trailing u32 colour argument.

@(export, link_name = "odin_main")
drawtextcolor_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	buf := c2d.C2D_TextBufNew(128)

	redText:    c2d.C2D_Text
	greenText:  c2d.C2D_Text
	blueText:   c2d.C2D_Text
	orangeText: c2d.C2D_Text
	cyanText:   c2d.C2D_Text

	c2d.C2D_TextParse(&redText,    buf, "Red text")
	c2d.C2D_TextParse(&greenText,  buf, "Green text")
	c2d.C2D_TextParse(&blueText,   buf, "Blue text")
	c2d.C2D_TextParse(&orangeText, buf, "Orange text")
	c2d.C2D_TextParse(&cyanText,   buf, "Cyan text")

	c2d.C2D_TextOptimize(&redText)
	c2d.C2D_TextOptimize(&greenText)
	c2d.C2D_TextOptimize(&blueText)
	c2d.C2D_TextOptimize(&orangeText)
	c2d.C2D_TextOptimize(&cyanText)

	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrRed    := c2d.C2D_Color32(0xFF, 0x40, 0x40, 0xFF)
	clrGreen  := c2d.C2D_Color32(0x40, 0xDD, 0x40, 0xFF)
	clrBlue   := c2d.C2D_Color32(0x40, 0x80, 0xFF, 0xFF)
	clrOrange := c2d.C2D_Color32(0xFF, 0xA0, 0x00, 0xFF)
	clrCyan   := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HDrawTextColor Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HShows C2D_DrawTextColor")
		ctru.printf("\x1b[5;1Hwith 5 different colours.")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// All rows use scale 0.7 (~21 px tall), spaced 40 px apart.
		c2d.C2D_DrawTextColor(&redText,    c2d.C2D_WithColor, 10,  20, 0, 0.7, 0.7, clrRed)
		c2d.C2D_DrawTextColor(&greenText,  c2d.C2D_WithColor, 10,  60, 0, 0.7, 0.7, clrGreen)
		c2d.C2D_DrawTextColor(&blueText,   c2d.C2D_WithColor, 10, 100, 0, 0.7, 0.7, clrBlue)
		c2d.C2D_DrawTextColor(&orangeText, c2d.C2D_WithColor, 10, 140, 0, 0.7, 0.7, clrOrange)
		c2d.C2D_DrawTextColor(&cyanText,   c2d.C2D_WithColor, 10, 180, 0, 0.7, 0.7, clrCyan)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_TextBufDelete(buf)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
