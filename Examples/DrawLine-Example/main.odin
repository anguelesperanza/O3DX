package drawline_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

@(export, link_name = "odin_main")
drawline_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	// Init
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Colors
	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF) // dark navy
	clrRed    := c2d.C2D_Color32(0xFF, 0x4C, 0x4C, 0xFF)
	clrGreen  := c2d.C2D_Color32(0x4C, 0xFF, 0x4C, 0xFF)
	clrBlue   := c2d.C2D_Color32(0x4C, 0x9E, 0xFF, 0xFF)
	clrYellow := c2d.C2D_Color32(0xFF, 0xFF, 0x4C, 0xFF)
	clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrOrange := c2d.C2D_Color32(0xFF, 0xA0, 0x00, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HC2D_DrawLine Example")
		ctru.printf("\x1b[2;1HPress START to exit")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Horizontal lines — increasing thickness (1, 2, 4, 8 px)
		c2d.C2D_DrawLine(  0, 40, clrRed,    400, 40, clrRed,    1, 0)
		c2d.C2D_DrawLine(  0, 70, clrGreen,  400, 70, clrGreen,  2, 0)
		c2d.C2D_DrawLine(  0, 100, clrBlue,  400, 100, clrBlue,  4, 0)
		c2d.C2D_DrawLine(  0, 135, clrYellow,400, 135, clrYellow, 8, 0)

		// Diagonal lines — cross the screen corner to corner
		c2d.C2D_DrawLine(  0,   0, clrWhite, 400, 240, clrWhite,  2, 0)
		c2d.C2D_DrawLine(400,   0, clrOrange,  0, 240, clrOrange, 2, 0)

		// A vertical line in the centre
		c2d.C2D_DrawLine(200, 0, clrWhite, 200, 240, clrWhite, 1, 0)

		c3d.C3D_FrameEnd(0)
	}

	// Deinit
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
