package color32f_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_Color32f:
// Builds RGBA colours from normalised float values [0.0, 1.0] instead of
// u8 bytes, then fills coloured rectangles with each result.
//
// Top row    — primary and secondary colours at full opacity (alpha = 1.0)
// Bottom row — same hues at half opacity (alpha = 0.5), showing blending
//              against the dark background.
//
// Compare with C2D_Color32 (integer path) to confirm identical output.

@(export, link_name = "odin_main")
color32f_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	clrBg := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)

	// Top row — full opacity colours built with C2D_Color32f
	clrRed     := c2d.C2D_Color32f(1.0, 0.0, 0.0, 1.0)
	clrGreen   := c2d.C2D_Color32f(0.0, 1.0, 0.0, 1.0)
	clrBlue    := c2d.C2D_Color32f(0.0, 0.0, 1.0, 1.0)
	clrYellow  := c2d.C2D_Color32f(1.0, 1.0, 0.0, 1.0)
	clrCyan    := c2d.C2D_Color32f(0.0, 1.0, 1.0, 1.0)
	clrMagenta := c2d.C2D_Color32f(1.0, 0.0, 1.0, 1.0)

	// Bottom row — same hues at alpha = 0.5
	clrRedA    := c2d.C2D_Color32f(1.0, 0.0, 0.0, 0.5)
	clrGreenA  := c2d.C2D_Color32f(0.0, 1.0, 0.0, 0.5)
	clrBlueA   := c2d.C2D_Color32f(0.0, 0.0, 1.0, 0.5)
	clrYellowA := c2d.C2D_Color32f(1.0, 1.0, 0.0, 0.5)
	clrCyanA   := c2d.C2D_Color32f(0.0, 1.0, 1.0, 0.5)
	clrMagentaA := c2d.C2D_Color32f(1.0, 0.0, 1.0, 0.5)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HColor32f Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HTop:    alpha=1.0 (opaque)")
		ctru.printf("\x1b[5;1HBottom: alpha=0.5 (semi-transparent)")
		ctru.printf("\x1b[6;1H R  G  B  Y  C  M")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Six columns, each 60 px wide with 6 px gap.  Total = 6*60 + 5*6 = 390.
		// Start x = (400 - 390) / 2 = 5.
		// Top row y = 30, bottom row y = 130.  Each rect is 60×80.

		// Top row — full opacity
		c2d.C2D_DrawRectSolid(  5, 30, 0, 60, 80, clrRed)
		c2d.C2D_DrawRectSolid( 71, 30, 0, 60, 80, clrGreen)
		c2d.C2D_DrawRectSolid(137, 30, 0, 60, 80, clrBlue)
		c2d.C2D_DrawRectSolid(203, 30, 0, 60, 80, clrYellow)
		c2d.C2D_DrawRectSolid(269, 30, 0, 60, 80, clrCyan)
		c2d.C2D_DrawRectSolid(335, 30, 0, 60, 80, clrMagenta)

		// Bottom row — alpha 0.5
		c2d.C2D_DrawRectSolid(  5, 130, 0, 60, 80, clrRedA)
		c2d.C2D_DrawRectSolid( 71, 130, 0, 60, 80, clrGreenA)
		c2d.C2D_DrawRectSolid(137, 130, 0, 60, 80, clrBlueA)
		c2d.C2D_DrawRectSolid(203, 130, 0, 60, 80, clrYellowA)
		c2d.C2D_DrawRectSolid(269, 130, 0, 60, 80, clrCyanA)
		c2d.C2D_DrawRectSolid(335, 130, 0, 60, 80, clrMagentaA)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
