package images_example

@(export, link_name = "odin_main")
images_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	romfsInit()
	irrstInit()

	// Init libs
	gfxInitDefault()
	C3D_Init(C3D_DEFAULT_CMDBUF_SIZE)
	C2D_Init(C2D_DEFAULT_MAX_OBJECTS)
	C2D_Prepare()
	consoleInit(GFX_BOTTOM, nil)

	// Create screens
	top := C2D_CreateScreenTarget(GFX_TOP, GFX_LEFT)


	tex_64x64:    C3D_Tex
	subtex_64x64: Tex3DS_SubTexture
	load_t3x_image("romfs:/player.t3x", &tex_64x64, &subtex_64x64)
	img_64x64 := C2D_Image{tex = &tex_64x64, subtex = &subtex_64x64}


	clrClear := color32(0x00, 0x00, 0x00, 0xFF)

	SPEED    :: f32(2.0)
	DEADZONE :: i16(16)
	player_x := f32(168)
	player_y := f32(88)
	circle   := circlePosition{}
	cstick   := circlePosition{}

	// Main loop
	for aptMainLoop() {
		hidScanInput()

		kDown := hidKeysDown()
		kHeld := hidKeysHeld()
		hidCircleRead(&circle)
		irrstScanInput()
		hidCstickRead(&cstick)
		if kDown & KEY_START != 0 do break

		if kHeld & KEY_DRIGHT != 0 do player_x += SPEED
		if kHeld & KEY_DLEFT  != 0 do player_x -= SPEED
		if kHeld & KEY_DDOWN  != 0 do player_y += SPEED
		if kHeld & KEY_DUP    != 0 do player_y -= SPEED

		if circle.dx >  DEADZONE do player_x += f32(circle.dx) / 154.0 * SPEED * 4
		if circle.dx < -DEADZONE do player_x += f32(circle.dx) / 154.0 * SPEED * 4
		if circle.dy >  DEADZONE do player_y -= f32(circle.dy) / 154.0 * SPEED * 4
		if circle.dy < -DEADZONE do player_y -= f32(circle.dy) / 154.0 * SPEED * 4

		if cstick.dx >  DEADZONE do player_x += f32(cstick.dx) / 154.0 * SPEED * 4
		if cstick.dx < -DEADZONE do player_x += f32(cstick.dx) / 154.0 * SPEED * 4
		if cstick.dy >  DEADZONE do player_y -= f32(cstick.dy) / 154.0 * SPEED * 4
		if cstick.dy < -DEADZONE do player_y -= f32(cstick.dy) / 154.0 * SPEED * 4

		if kDown & KEY_DRIGHT != 0 do printf("\x1b[7;1HDRight pressed ")
		if kDown & KEY_DLEFT  != 0 do printf("\x1b[8;1HDLeft pressed  ")
		if kDown & KEY_DUP    != 0 do printf("\x1b[9;1HDUp pressed    ")
		if kDown & KEY_DDOWN  != 0 do printf("\x1b[10;1HDDown pressed  ")
		if kDown & KEY_A  != 0 do printf("\x1b[11;1HA pressed  ")
		if kDown & KEY_B  != 0 do printf("\x1b[12;1HB pressed  ")
		if kDown & KEY_X  != 0 do printf("\x1b[13;1HX pressed  ")
		if kDown & KEY_Y  != 0 do printf("\x1b[14;1HY pressed  ")
		if kDown & KEY_L  != 0 do printf("\x1b[15;1HL pressed  ")
		if kDown & KEY_R  != 0 do printf("\x1b[16;1HR pressed  ")
		if kDown & KEY_ZL     != 0 do printf("\x1b[17;1HZL pressed     ")
		if kDown & KEY_ZR     != 0 do printf("\x1b[18;1HZR pressed     ")
		if kDown & KEY_SELECT != 0 do printf("\x1b[19;1HSELECT pressed ")
		if kDown & KEY_START  != 0 do printf("\x1b[20;1HSTART pressed  ")

		printf("\x1b[1;1HInput example                ")
		printf("\x1b[2;1HPress START to exit          ")
		printf("\x1b[3;1HPos: %.1f, %.1f      ", player_x, player_y)
		printf("\x1b[4;1HCircle: %d, %d      ", i32(circle.dx), i32(circle.dy))
		printf("\x1b[5;1HCStick: %d, %d      ", i32(cstick.dx), i32(cstick.dy))

		// Render the scene
		C3D_FrameBegin(C3D_FRAME_SYNCDRAW)
		C2D_TargetClear(top, clrClear)
		C2D_SceneBegin(top)

		C2D_DrawImageAt(img_64x64, player_x, player_y, 0, nil, 1.0, 1.0)
		C3D_FrameEnd(0)
	}

	// Deinit
	irrstExit()
	C3D_TexDelete(&tex_64x64)
	C2D_Fini()
	C3D_Fini()
	romfsExit()
	gfxExit()
	return 0
}

color32 :: proc "c" (r, g, b, a: u8) -> u32 {
	return u32(r) | (u32(g) << 8) | (u32(b) << 16) | (u32(a) << 24)
}
