package shapes_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

@(export, link_name = "odin_main")
shapes_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	// Init libs
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	// Create screens
	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Create colors
	clrWhite := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrGreen := c2d.C2D_Color32(0x00, 0xFF, 0x00, 0xFF)
	clrRed   := c2d.C2D_Color32(0xFF, 0x00, 0x00, 0xFF)
	clrBlue  := c2d.C2D_Color32(0x00, 0x00, 0xFF, 0xFF)

	clrCircle1 := c2d.C2D_Color32(0xFF, 0x00, 0xFF, 0xFF)
	clrCircle2 := c2d.C2D_Color32(0xFF, 0xFF, 0x00, 0xFF)
	clrCircle3 := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)

	clrSolidCircle := c2d.C2D_Color32(0x68, 0xB0, 0xD8, 0xFF)

	clrTri1 := c2d.C2D_Color32(0xFF, 0x15, 0x00, 0xFF)
	clrTri2 := c2d.C2D_Color32(0x27, 0x69, 0xE5, 0xFF)

	clrRec1 := c2d.C2D_Color32(0x9A, 0x6C, 0xB9, 0xFF)
	clrRec2 := c2d.C2D_Color32(0xFF, 0xFF, 0x2C, 0xFF)
	clrRec3 := c2d.C2D_Color32(0xD8, 0xF6, 0x0F, 0xFF)
	clrRec4 := c2d.C2D_Color32(0x40, 0xEA, 0x87, 0xFF)

	clrClear := c2d.C2D_Color32(0xFF, 0xD8, 0xB0, 0x68)

	// Main loop
	for ctru.aptMainLoop() {
		ctru.hidScanInput()

		kDown := ctru.hidKeysDown()
		if kDown & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HSimple citro2d shapes example")
		ctru.printf("\x1b[2;1HCPU:     %6.2f%%\x1b[K", f64(c3d.C3D_GetProcessingTime()) * 6.0)
		ctru.printf("\x1b[3;1HGPU:     %6.2f%%\x1b[K", f64(c3d.C3D_GetDrawingTime()) * 6.0)
		ctru.printf("\x1b[4;1HCmdBuf:  %6.2f%%\x1b[K", f64(c3d.C3D_GetCmdBufUsage()) * 100.0)

		// Render the scene
		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrClear)
		c2d.C2D_SceneBegin(top)

		c2d.C2D_DrawTriangle(
			50.0 / 2.0, f32(ctru.SCREEN_HEIGHT) - 50, clrWhite,
			0,          f32(ctru.SCREEN_HEIGHT),       clrTri1,
			50,         f32(ctru.SCREEN_HEIGHT),       clrTri2,
			0)
		c2d.C2D_DrawRectangle(f32(ctru.SCREEN_WIDTH) - 50, 0, 0, 50, 50, clrRec1, clrRec2, clrRec3, clrRec4)

		// Circles require a state change within citro2d's internals — draw them last.
		c2d.C2D_DrawEllipse(0, 0, 0, f32(ctru.SCREEN_WIDTH), f32(ctru.SCREEN_HEIGHT), clrCircle1, clrCircle2, clrCircle3, clrWhite)
		c2d.C2D_DrawCircle(f32(ctru.SCREEN_WIDTH) / 2, f32(ctru.SCREEN_HEIGHT) / 2, 0, 50, clrCircle3, clrWhite, clrCircle1, clrCircle2)
		c2d.C2D_DrawCircle(25, 25, 0, 25, clrRed, clrBlue, clrGreen, clrWhite)
		c2d.C2D_DrawCircleSolid(f32(ctru.SCREEN_WIDTH) - 25, f32(ctru.SCREEN_HEIGHT) - 25, 0, 25, clrSolidCircle)

		c3d.C3D_FrameEnd(0)
	}

	// Deinit libs
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
