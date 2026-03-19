package shapes_example

@(export, link_name = "odin_main")
shapes_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	// Init libs
	gfxInitDefault()
	C3D_Init(C3D_DEFAULT_CMDBUF_SIZE)
	C2D_Init(C2D_DEFAULT_MAX_OBJECTS)
	C2D_Prepare()
	consoleInit(GFX_BOTTOM, nil)

	// Create screens
	top := C2D_CreateScreenTarget(GFX_TOP, GFX_LEFT)

	// Create colors
	clrWhite := color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrGreen := color32(0x00, 0xFF, 0x00, 0xFF)
	clrRed   := color32(0xFF, 0x00, 0x00, 0xFF)
	clrBlue  := color32(0x00, 0x00, 0xFF, 0xFF)

	clrCircle1 := color32(0xFF, 0x00, 0xFF, 0xFF)
	clrCircle2 := color32(0xFF, 0xFF, 0x00, 0xFF)
	clrCircle3 := color32(0x00, 0xFF, 0xFF, 0xFF)

	clrSolidCircle := color32(0x68, 0xB0, 0xD8, 0xFF)

	clrTri1 := color32(0xFF, 0x15, 0x00, 0xFF)
	clrTri2 := color32(0x27, 0x69, 0xE5, 0xFF)

	clrRec1 := color32(0x9A, 0x6C, 0xB9, 0xFF)
	clrRec2 := color32(0xFF, 0xFF, 0x2C, 0xFF)
	clrRec3 := color32(0xD8, 0xF6, 0x0F, 0xFF)
	clrRec4 := color32(0x40, 0xEA, 0x87, 0xFF)

	clrClear := color32(0xFF, 0xD8, 0xB0, 0x68)

	// Main loop
	for aptMainLoop() {
		hidScanInput()

		kDown := hidKeysDown()
		if kDown & KEY_START != 0 do break

		printf("\x1b[1;1HSimple citro2d shapes example")
		printf("\x1b[2;1HCPU:     %6.2f%%\x1b[K", f64(C3D_GetProcessingTime()) * 6.0)
		printf("\x1b[3;1HGPU:     %6.2f%%\x1b[K", f64(C3D_GetDrawingTime()) * 6.0)
		printf("\x1b[4;1HCmdBuf:  %6.2f%%\x1b[K", f64(C3D_GetCmdBufUsage()) * 100.0)

		// Render the scene
		C3D_FrameBegin(C3D_FRAME_SYNCDRAW)
		C2D_TargetClear(top, clrClear)
		C2D_SceneBegin(top)

		C2D_DrawTriangle(
			50.0 / 2.0, SCREEN_HEIGHT - 50, clrWhite,
			0,          SCREEN_HEIGHT,       clrTri1,
			50,         SCREEN_HEIGHT,       clrTri2,
			0)
		C2D_DrawRectangle(SCREEN_WIDTH - 50, 0, 0, 50, 50, clrRec1, clrRec2, clrRec3, clrRec4)

		// Circles require a state change within citro2d's internals — draw them last.
		C2D_DrawEllipse(0, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, clrCircle1, clrCircle2, clrCircle3, clrWhite)
		C2D_DrawCircle(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 0, 50, clrCircle3, clrWhite, clrCircle1, clrCircle2)
		C2D_DrawCircle(25, 25, 0, 25, clrRed, clrBlue, clrGreen, clrWhite)
		C2D_DrawCircleSolid(SCREEN_WIDTH - 25, SCREEN_HEIGHT - 25, 0, 25, clrSolidCircle)

		C3D_FrameEnd(0)
	}

	// Deinit libs
	C2D_Fini()
	C3D_Fini()
	gfxExit()
	return 0
}

color32 :: proc "c" (r, g, b, a: u8) -> u32 {
	return u32(r) | (u32(g) << 8) | (u32(b) << 16) | (u32(a) << 24)
}
