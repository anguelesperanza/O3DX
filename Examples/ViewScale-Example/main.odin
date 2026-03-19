package view_scale_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_ViewScale:
// Five identical 40×40 rects are drawn at local position (0, 0).
// Each is preceded by ViewTranslate (to place it in a section) then
// ViewScale (to change its apparent size).  The rects grow like a bar
// chart left-to-right, all bottom-aligned at y = 185.
//
//   Red    : translate( 20,165) scale(0.5) → 20×20 at ( 20,165)
//   White  : translate( 65,145) scale(1.0) → 40×40 at ( 65,145)
//   Green  : translate(120,125) scale(1.5) → 60×60 at (120,125)
//   Blue   : translate(195,105) scale(2.0) → 80×80 at (195,105)
//   Orange : translate(280, 65) scale(3.0) →120×120 at (280, 65)

@(export, link_name = "odin_main")
view_scale_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrRed    := c2d.C2D_Color32(0xFF, 0x4C, 0x4C, 0xFF)
	clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrGreen  := c2d.C2D_Color32(0x4C, 0xFF, 0x4C, 0xFF)
	clrBlue   := c2d.C2D_Color32(0x4C, 0x9E, 0xFF, 0xFF)
	clrOrange := c2d.C2D_Color32(0xFF, 0xA0, 0x00, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HViewScale Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HSame rect drawn at (0,0) — only scale differs:")
		ctru.printf("\x1b[5;1H  Red   0.5x | White 1.0x | Green 1.5x")
		ctru.printf("\x1b[6;1H  Blue  2.0x | Orange 3.0x")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Pattern: ViewTranslate → ViewScale → DrawRectSolid(0,0, 40,40)
		// The resulting on-screen rect is at (tx, ty) with size (40*sx, 40*sy).
		// All bottom edges land at y = 185.

		// 0.5x — 40×40 → 20×20
		c2d.C2D_ViewTranslate(20, 165)
		c2d.C2D_ViewScale(0.5, 0.5)
		c2d.C2D_DrawRectSolid(0, 0, 0, 40, 40, clrRed)

		// 1.0x — 40×40 → 40×40
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(65, 145)
		c2d.C2D_ViewScale(1.0, 1.0)
		c2d.C2D_DrawRectSolid(0, 0, 0, 40, 40, clrWhite)

		// 1.5x — 40×40 → 60×60
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(120, 125)
		c2d.C2D_ViewScale(1.5, 1.5)
		c2d.C2D_DrawRectSolid(0, 0, 0, 40, 40, clrGreen)

		// 2.0x — 40×40 → 80×80
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(195, 105)
		c2d.C2D_ViewScale(2.0, 2.0)
		c2d.C2D_DrawRectSolid(0, 0, 0, 40, 40, clrBlue)

		// 3.0x — 40×40 → 120×120
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(280, 65)
		c2d.C2D_ViewScale(3.0, 3.0)
		c2d.C2D_DrawRectSolid(0, 0, 0, 40, 40, clrOrange)

		c2d.C2D_ViewReset()
		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
