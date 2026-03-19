package plain_image_tint_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_PlainImageTint:
// Four copies of the same 64×64 sprite are drawn side by side, each with
// a C2D_PlainImageTint that blends the image toward red.  The blend factor
// increases left-to-right so the tint grows stronger:
//
//   img 1 : blend = 0.0  → original image (no tint)
//   img 2 : blend = 0.33 → subtle red tint
//   img 3 : blend = 0.66 → strong red tint
//   img 4 : blend = 1.0  → fully red

foreign import example_c "system:example_c"

@(default_calling_convention = "c")
foreign example_c {
    load_t3x_image :: proc(path: cstring, tex: ^c3d.C3D_Tex, subtex: ^c2d.Tex3DS_SubTexture) -> bool ---
}

@(export, link_name = "odin_main")
plain_image_tint_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
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

	clrBg  := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrRed := c2d.C2D_Color32(0xFF, 0x00, 0x00, 0xFF)

	// Four tints — all toward red, at increasing blend strengths.
	// Declared here (not inside the loop) since they are constant.
	tint0: c2d.C2D_ImageTint  // zero = blend 0.0, no tint
	tint1: c2d.C2D_ImageTint
	tint2: c2d.C2D_ImageTint
	tint3: c2d.C2D_ImageTint
	c2d.C2D_PlainImageTint(&tint0, clrRed, 0.0)
	c2d.C2D_PlainImageTint(&tint1, clrRed, 0.33)
	c2d.C2D_PlainImageTint(&tint2, clrRed, 0.66)
	c2d.C2D_PlainImageTint(&tint3, clrRed, 1.0)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HPlainImageTint Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HRed blend increasing left to right:")
		ctru.printf("\x1b[5;1H  0.0   0.33   0.66   1.0")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Four images, each 64×64, evenly spaced across the 400 px top screen.
		// Centers at x = 50, 150, 250, 350 → top-left at x = 18, 118, 218, 318
		// All vertically centred:  y = (240 - 64) / 2 = 88
		c2d.C2D_DrawImageAt(img,  18, 88, 0, &tint0, 1, 1)
		c2d.C2D_DrawImageAt(img, 118, 88, 0, &tint1, 1, 1)
		c2d.C2D_DrawImageAt(img, 218, 88, 0, &tint2, 1, 1)
		c2d.C2D_DrawImageAt(img, 318, 88, 0, &tint3, 1, 1)

		c3d.C3D_FrameEnd(0)
	}

	c3d.C3D_TexDelete(&tex)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
