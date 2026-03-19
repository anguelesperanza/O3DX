package images_example

@(export, link_name = "odin_main")
images_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	romfsInit()

	// Init libs
	gfxInitDefault()
	C3D_Init(C3D_DEFAULT_CMDBUF_SIZE)
	C2D_Init(C2D_DEFAULT_MAX_OBJECTS)
	C2D_Prepare()
	consoleInit(GFX_BOTTOM, nil)

	// Create screens
	top := C2D_CreateScreenTarget(GFX_TOP, GFX_LEFT)

	// Load one texture per valid 3DS power-of-two size
	tex_8x8:      C3D_Tex
	subtex_8x8:   Tex3DS_SubTexture
	load_t3x_image("romfs:/image_8x8.t3x", &tex_8x8, &subtex_8x8)
	img_8x8 := C2D_Image{tex = &tex_8x8, subtex = &subtex_8x8}

	tex_16x16:    C3D_Tex
	subtex_16x16: Tex3DS_SubTexture
	load_t3x_image("romfs:/image_16x16.t3x", &tex_16x16, &subtex_16x16)
	img_16x16 := C2D_Image{tex = &tex_16x16, subtex = &subtex_16x16}

	tex_32x32:    C3D_Tex
	subtex_32x32: Tex3DS_SubTexture
	load_t3x_image("romfs:/image_32x32.t3x", &tex_32x32, &subtex_32x32)
	img_32x32 := C2D_Image{tex = &tex_32x32, subtex = &subtex_32x32}

	tex_64x64:    C3D_Tex
	subtex_64x64: Tex3DS_SubTexture
	load_t3x_image("romfs:/image_64x64.t3x", &tex_64x64, &subtex_64x64)
	img_64x64 := C2D_Image{tex = &tex_64x64, subtex = &subtex_64x64}

	tex_128x128:    C3D_Tex
	subtex_128x128: Tex3DS_SubTexture
	load_t3x_image("romfs:/image_128x128.t3x", &tex_128x128, &subtex_128x128)
	img_128x128 := C2D_Image{tex = &tex_128x128, subtex = &subtex_128x128}

	tex_256x256:    C3D_Tex
	subtex_256x256: Tex3DS_SubTexture
	load_t3x_image("romfs:/image_256x256.t3x", &tex_256x256, &subtex_256x256)
	img_256x256 := C2D_Image{tex = &tex_256x256, subtex = &subtex_256x256}

	tex_512x512:    C3D_Tex
	subtex_512x512: Tex3DS_SubTexture
	load_t3x_image("romfs:/image_512x512.t3x", &tex_512x512, &subtex_512x512)
	img_512x512 := C2D_Image{tex = &tex_512x512, subtex = &subtex_512x512}

	tex_1024x1024:    C3D_Tex
	subtex_1024x1024: Tex3DS_SubTexture
	load_t3x_image("romfs:/image_1024x1024.t3x", &tex_1024x1024, &subtex_1024x1024)
	img_1024x1024 := C2D_Image{tex = &tex_1024x1024, subtex = &subtex_1024x1024}

	clrClear := color32(0x00, 0x00, 0x00, 0xFF)

	// Main loop
	for aptMainLoop() {
		hidScanInput()

		kDown := hidKeysDown()
		if kDown & KEY_START != 0 do break

		printf("\x1b[1;1HImage example")
		printf("\x1b[2;1HPress START to exit")

		// Render the scene
		C3D_FrameBegin(C3D_FRAME_SYNCDRAW)
		C2D_TargetClear(top, clrClear)
		C2D_SceneBegin(top)

		// Cascade layout on the top screen (400x240):
		//   256x256 fills the left column (clips 16px at bottom)
		//   128x128 top-right, then 64/32/16/8 stacked below it
		// 512 and 1024 exceed the screen — drawn at (0,0), clipping expected.
		C2D_DrawImageAt(img_512x512,   0,   0,   0, nil, 1.0, 1.0)
		C2D_DrawImageAt(img_1024x1024, 0,   0,   0, nil, 1.0, 1.0)
		C2D_DrawImageAt(img_256x256,   0,   0,   0, nil, 1.0, 1.0)
		C2D_DrawImageAt(img_128x128,   256, 0,   0, nil, 1.0, 1.0)
		C2D_DrawImageAt(img_64x64,     256, 128, 0, nil, 1.0, 1.0)
		C2D_DrawImageAt(img_32x32,     320, 128, 0, nil, 1.0, 1.0)
		C2D_DrawImageAt(img_16x16,     352, 128, 0, nil, 1.0, 1.0)
		C2D_DrawImageAt(img_8x8,       368, 128, 0, nil, 1.0, 1.0)

		C3D_FrameEnd(0)
	}

	// Deinit
	C3D_TexDelete(&tex_8x8)
	C3D_TexDelete(&tex_16x16)
	C3D_TexDelete(&tex_32x32)
	C3D_TexDelete(&tex_64x64)
	C3D_TexDelete(&tex_128x128)
	C3D_TexDelete(&tex_256x256)
	C3D_TexDelete(&tex_512x512)
	C3D_TexDelete(&tex_1024x1024)
	C2D_Fini()
	C3D_Fini()
	romfsExit()
	gfxExit()
	return 0
}

color32 :: proc "c" (r, g, b, a: u8) -> u32 {
	return u32(r) | (u32(g) << 8) | (u32(b) << 16) | (u32(a) << 24)
}
