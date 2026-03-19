package view_translate_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_ViewTranslate:
// Five identical 60×40 rects are all drawn at the same code position
// (170, 100).  Only the view translation differs, so they appear at
// different places on screen — proving it is the matrix that moves them.
//
//   White  : no extra translate   → appears at (170, 100)   centre
//   Red    : translate(+100,   0) → appears at (270, 100)   right
//   Blue   : translate(-100,   0) → appears at ( 70, 100)   left
//   Green  : translate(  0, +60) → appears at (170, 160)   below
//   Yellow : translate(  0, -60) → appears at (170,  40)   above

@(export, link_name = "odin_main")
view_translate_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrRed    := c2d.C2D_Color32(0xFF, 0x4C, 0x4C, 0xFF)
	clrBlue   := c2d.C2D_Color32(0x4C, 0x9E, 0xFF, 0xFF)
	clrGreen  := c2d.C2D_Color32(0x4C, 0xFF, 0x4C, 0xFF)
	clrYellow := c2d.C2D_Color32(0xFF, 0xFF, 0x4C, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HViewTranslate Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HAll rects drawn at code pos (170,100):")
		ctru.printf("\x1b[5;1H  White  : no translate")
		ctru.printf("\x1b[6;1H  Red    : +100,   0  (right)")
		ctru.printf("\x1b[7;1H  Blue   : -100,   0  (left)")
		ctru.printf("\x1b[8;1H  Green  :    0, +60  (down)")
		ctru.printf("\x1b[9;1H  Yellow :    0, -60  (up)")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// SceneBegin resets the view matrix — white has no extra translate.
		c2d.C2D_DrawRectSolid(170, 100, 0, 60, 40, clrWhite)

		// Red — shift right
		c2d.C2D_ViewTranslate(100, 0)
		c2d.C2D_DrawRectSolid(170, 100, 0, 60, 40, clrRed)

		// Blue — shift left (reset first so transforms don't compound)
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(-100, 0)
		c2d.C2D_DrawRectSolid(170, 100, 0, 60, 40, clrBlue)

		// Green — shift down
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(0, 60)
		c2d.C2D_DrawRectSolid(170, 100, 0, 60, 40, clrGreen)

		// Yellow — shift up
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(0, -60)
		c2d.C2D_DrawRectSolid(170, 100, 0, 60, 40, clrYellow)

		c2d.C2D_ViewReset() // leave clean state
		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
