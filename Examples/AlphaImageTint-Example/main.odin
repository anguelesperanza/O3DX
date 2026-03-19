package alpha_image_tint_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_AlphaImageTint:
// Five copies of the same 64×64 sprite are drawn side by side.
// C2D_AlphaImageTint sets a uniform alpha (opacity) across the whole image.
// Alpha decreases left-to-right so the sprite fades out:
//
//   img 1 : alpha = 1.00 → fully opaque
//   img 2 : alpha = 0.75
//   img 3 : alpha = 0.50 → half transparent
//   img 4 : alpha = 0.25
//   img 5 : alpha = 0.10 → nearly invisible

foreign import example_c "system:example_c"

@(default_calling_convention = "c")
foreign example_c {
    load_t3x_image :: proc(path: cstring, tex: ^c3d.C3D_Tex, subtex: ^c2d.Tex3DS_SubTexture) -> bool ---
}

@(export, link_name = "odin_main")
alpha_image_tint_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.romfsInit()

	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	tex:    c3d.C3D_Tex
	subtex: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/sprite.t3x", &tex, &subtex)
	img := c2d.C2D_Image{tex = &tex, subtex = &subtex}

	clrBg := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)

	// Five alpha tints — constant, set up once before the loop.
	tint0: c2d.C2D_ImageTint
	tint1: c2d.C2D_ImageTint
	tint2: c2d.C2D_ImageTint
	tint3: c2d.C2D_ImageTint
	tint4: c2d.C2D_ImageTint
	c2d.C2D_AlphaImageTint(&tint0, 1.00)
	c2d.C2D_AlphaImageTint(&tint1, 0.75)
	c2d.C2D_AlphaImageTint(&tint2, 0.50)
	c2d.C2D_AlphaImageTint(&tint3, 0.25)
	c2d.C2D_AlphaImageTint(&tint4, 0.10)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HAlphaImageTint Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HAlpha decreasing left to right:")
		ctru.printf("\x1b[5;1H 1.0  0.75  0.50  0.25  0.10")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Five 64×64 images evenly spaced across the 400 px top screen.
		// Centers at x = 40, 120, 200, 280, 360 → top-left at x = 8, 88, 168, 248, 328
		// Vertically centred: y = (240 - 64) / 2 = 88
		c2d.C2D_DrawImageAt(img,   8, 88, 0, &tint0, 1, 1)
		c2d.C2D_DrawImageAt(img,  88, 88, 0, &tint1, 1, 1)
		c2d.C2D_DrawImageAt(img, 168, 88, 0, &tint2, 1, 1)
		c2d.C2D_DrawImageAt(img, 248, 88, 0, &tint3, 1, 1)
		c2d.C2D_DrawImageAt(img, 328, 88, 0, &tint4, 1, 1)

		c3d.C3D_FrameEnd(0)
	}

	c3d.C3D_TexDelete(&tex)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
