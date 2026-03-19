package view_shear_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_ViewShear:
// Four 90×90 rects are drawn — all at local position (0,0) — with
// different shear values.  Shear skews the coordinate axes so that
// rectangles become parallelograms.
//
// Shear matrix: new_x = x + shear_x * y
//               new_y = shear_y * x + y
//
//   Top-left  : no shear          → normal square  (white)
//   Top-right : X-shear = 0.4     → tilts right    (red)
//   Bot-left  : Y-shear = 0.4     → tilts down     (green)
//   Bot-right : X = 0.3, Y = 0.3  → diagonal skew  (blue)

@(export, link_name = "odin_main")
view_shear_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	clrBg    := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrWhite := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrRed   := c2d.C2D_Color32(0xFF, 0x4C, 0x4C, 0xFF)
	clrGreen := c2d.C2D_Color32(0x4C, 0xFF, 0x4C, 0xFF)
	clrBlue  := c2d.C2D_Color32(0x4C, 0x9E, 0xFF, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HViewShear Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HTop-left : no shear (white)")
		ctru.printf("\x1b[5;1HTop-right: X-shear 0.4 (red)")
		ctru.printf("\x1b[6;1HBot-left : Y-shear 0.4 (green)")
		ctru.printf("\x1b[7;1HBot-right: X=0.3 Y=0.3 (blue)")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Top-left: no shear — a normal 90×90 square
		c2d.C2D_ViewTranslate(20, 20)
		c2d.C2D_DrawRectSolid(0, 0, 0, 90, 90, clrWhite)

		// Top-right: X-shear 0.4 — bottom edge shifts right by 0.4*90=36 px
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(220, 20)
		c2d.C2D_ViewShear(0.4, 0.0)
		c2d.C2D_DrawRectSolid(0, 0, 0, 90, 90, clrRed)

		// Bot-left: Y-shear 0.4 — right edge shifts down by 0.4*90=36 px
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(20, 110)
		c2d.C2D_ViewShear(0.0, 0.4)
		c2d.C2D_DrawRectSolid(0, 0, 0, 90, 90, clrGreen)

		// Bot-right: combined shear X=0.3, Y=0.3
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(220, 110)
		c2d.C2D_ViewShear(0.3, 0.3)
		c2d.C2D_DrawRectSolid(0, 0, 0, 90, 90, clrBlue)

		c2d.C2D_ViewReset()
		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
