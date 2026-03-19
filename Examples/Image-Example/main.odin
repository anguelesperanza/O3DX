package images_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// ---------------------------------------------------------------
// C functions defined in this example's main.c
// ---------------------------------------------------------------
foreign import example_c "system:example_c"

@(default_calling_convention = "c")
foreign example_c {
    load_t3x_image :: proc(path: cstring, tex: ^c3d.C3D_Tex, subtex: ^c2d.Tex3DS_SubTexture) -> bool ---
}

@(export, link_name = "odin_main")
images_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.romfsInit()

	// Init libs
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	// Create screens
	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Load one texture per valid 3DS power-of-two size
	tex_8x8:      c3d.C3D_Tex
	subtex_8x8:   c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_8x8.t3x", &tex_8x8, &subtex_8x8)
	img_8x8 := c2d.C2D_Image{tex = &tex_8x8, subtex = &subtex_8x8}

	tex_16x16:    c3d.C3D_Tex
	subtex_16x16: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_16x16.t3x", &tex_16x16, &subtex_16x16)
	img_16x16 := c2d.C2D_Image{tex = &tex_16x16, subtex = &subtex_16x16}

	tex_32x32:    c3d.C3D_Tex
	subtex_32x32: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_32x32.t3x", &tex_32x32, &subtex_32x32)
	img_32x32 := c2d.C2D_Image{tex = &tex_32x32, subtex = &subtex_32x32}

	tex_64x64:    c3d.C3D_Tex
	subtex_64x64: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_64x64.t3x", &tex_64x64, &subtex_64x64)
	img_64x64 := c2d.C2D_Image{tex = &tex_64x64, subtex = &subtex_64x64}

	tex_128x128:    c3d.C3D_Tex
	subtex_128x128: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_128x128.t3x", &tex_128x128, &subtex_128x128)
	img_128x128 := c2d.C2D_Image{tex = &tex_128x128, subtex = &subtex_128x128}

	tex_256x256:    c3d.C3D_Tex
	subtex_256x256: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_256x256.t3x", &tex_256x256, &subtex_256x256)
	img_256x256 := c2d.C2D_Image{tex = &tex_256x256, subtex = &subtex_256x256}

	tex_512x512:    c3d.C3D_Tex
	subtex_512x512: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_512x512.t3x", &tex_512x512, &subtex_512x512)
	img_512x512 := c2d.C2D_Image{tex = &tex_512x512, subtex = &subtex_512x512}

	tex_1024x1024:    c3d.C3D_Tex
	subtex_1024x1024: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/image_1024x1024.t3x", &tex_1024x1024, &subtex_1024x1024)
	img_1024x1024 := c2d.C2D_Image{tex = &tex_1024x1024, subtex = &subtex_1024x1024}

	clrClear := c2d.C2D_Color32(0x00, 0x00, 0x00, 0xFF)

	// Main loop
	for ctru.aptMainLoop() {
		ctru.hidScanInput()

		kDown := ctru.hidKeysDown()
		if kDown & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HImage example")
		ctru.printf("\x1b[2;1HPress START to exit")

		// Render the scene
		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrClear)
		c2d.C2D_SceneBegin(top)

		// Cascade layout on the top screen (400x240):
		//   256x256 fills the left column (clips 16px at bottom)
		//   128x128 top-right, then 64/32/16/8 stacked below it
		// 512 and 1024 exceed the screen — drawn at (0,0), clipping expected.
		c2d.C2D_DrawImageAt(img_512x512,   0,   0,   0, nil, 1.0, 1.0)
		c2d.C2D_DrawImageAt(img_1024x1024, 0,   0,   0, nil, 1.0, 1.0)
		c2d.C2D_DrawImageAt(img_256x256,   0,   0,   0, nil, 1.0, 1.0)
		c2d.C2D_DrawImageAt(img_128x128,   256, 0,   0, nil, 1.0, 1.0)
		c2d.C2D_DrawImageAt(img_64x64,     256, 128, 0, nil, 1.0, 1.0)
		c2d.C2D_DrawImageAt(img_32x32,     320, 128, 0, nil, 1.0, 1.0)
		c2d.C2D_DrawImageAt(img_16x16,     352, 128, 0, nil, 1.0, 1.0)
		c2d.C2D_DrawImageAt(img_8x8,       368, 128, 0, nil, 1.0, 1.0)

		c3d.C3D_FrameEnd(0)
	}

	// Deinit
	c3d.C3D_TexDelete(&tex_8x8)
	c3d.C3D_TexDelete(&tex_16x16)
	c3d.C3D_TexDelete(&tex_32x32)
	c3d.C3D_TexDelete(&tex_64x64)
	c3d.C3D_TexDelete(&tex_128x128)
	c3d.C3D_TexDelete(&tex_256x256)
	c3d.C3D_TexDelete(&tex_512x512)
	c3d.C3D_TexDelete(&tex_1024x1024)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
