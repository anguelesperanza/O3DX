package view_rotate_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_ViewRotate:
// Eight thin 80×6 rects are all drawn at local position (0, 0).
// Each is anchored to the screen centre (200, 120) via ViewTranslate,
// then rotated by a different angle — creating a compass/clock pattern.
//
//   White   :   0°      Red     :  45°   Green  :  90°   Blue   : 135°
//   Yellow  : 180°      Orange  : 225°   Cyan   : 270°   Magenta: 315°

MATH_PI :: f32(3.14159265358979)

@(export, link_name = "odin_main")
view_rotate_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	clrBg      := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrWhite   := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrRed     := c2d.C2D_Color32(0xFF, 0x4C, 0x4C, 0xFF)
	clrGreen   := c2d.C2D_Color32(0x4C, 0xFF, 0x4C, 0xFF)
	clrBlue    := c2d.C2D_Color32(0x4C, 0x9E, 0xFF, 0xFF)
	clrYellow  := c2d.C2D_Color32(0xFF, 0xFF, 0x4C, 0xFF)
	clrOrange  := c2d.C2D_Color32(0xFF, 0xA0, 0x00, 0xFF)
	clrCyan    := c2d.C2D_Color32(0x4C, 0xFF, 0xFF, 0xFF)
	clrMagenta := c2d.C2D_Color32(0xFF, 0x4C, 0xFF, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HViewRotate Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1H8 hands at 45-degree steps,")
		ctru.printf("\x1b[5;1Hall anchored at screen centre.")
		ctru.printf("\x1b[6;1H  0  45  90  135 deg = W R G B")
		ctru.printf("\x1b[7;1H180 225 270 315 deg = Y O C M")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Each "hand": ViewTranslate(200,120) → ViewRotate(angle) → rect(0,0,80,6)
		// The rect starts at the anchor and extends in the rotated direction.

		// 0° — pointing right
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrWhite)

		// 45°
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_ViewRotate(MATH_PI * 0.25)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrRed)

		// 90° — pointing down
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_ViewRotate(MATH_PI * 0.5)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrGreen)

		// 135°
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_ViewRotate(MATH_PI * 0.75)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrBlue)

		// 180° — pointing left
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_ViewRotate(MATH_PI)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrYellow)

		// 225°
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_ViewRotate(MATH_PI * 1.25)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrOrange)

		// 270° — pointing up
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_ViewRotate(MATH_PI * 1.5)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrCyan)

		// 315°
		c2d.C2D_ViewReset()
		c2d.C2D_ViewTranslate(200, 120)
		c2d.C2D_ViewRotate(MATH_PI * 1.75)
		c2d.C2D_DrawRectSolid(0, 0, 0, 80, 6, clrMagenta)

		c2d.C2D_ViewReset()
		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
