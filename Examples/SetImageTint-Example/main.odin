package set_image_tint_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_SetImageTint:
// C2D_SetImageTint sets the tint for one specific corner of a C2D_ImageTint.
// Four copies of the sprite show per-corner tinting:
//
//   img 1 : no tint (nil)                         → original
//   img 2 : TopLeft  red   blend=1.0              → red bleeds from top-left
//   img 3 : TopRight green blend=1.0              → green bleeds from top-right
//   img 4 : TopLeft=red, TopRight=green,
//            BotLeft=blue, BotRight=yellow         → rainbow corners

foreign import example_c "system:example_c"

@(default_calling_convention = "c")
foreign example_c {
    load_t3x_image :: proc(path: cstring, tex: ^c3d.C3D_Tex, subtex: ^c2d.Tex3DS_SubTexture) -> bool ---
}

@(export, link_name = "odin_main")
set_image_tint_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
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

	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrRed    := c2d.C2D_Color32(0xFF, 0x00, 0x00, 0xFF)
	clrGreen  := c2d.C2D_Color32(0x00, 0xFF, 0x00, 0xFF)
	clrBlue   := c2d.C2D_Color32(0x00, 0x00, 0xFF, 0xFF)
	clrYellow := c2d.C2D_Color32(0xFF, 0xFF, 0x00, 0xFF)

	// tint1: TopLeft only → red gradient from top-left corner
	tint1: c2d.C2D_ImageTint
	c2d.C2D_SetImageTint(&tint1, c2d.C2D_Corner.TopLeft, clrRed, 1.0)

	// tint2: TopRight only → green gradient from top-right corner
	tint2: c2d.C2D_ImageTint
	c2d.C2D_SetImageTint(&tint2, c2d.C2D_Corner.TopRight, clrGreen, 1.0)

	// tint3: all four corners, each a different colour → rainbow
	tint3: c2d.C2D_ImageTint
	c2d.C2D_SetImageTint(&tint3, c2d.C2D_Corner.TopLeft,  clrRed,    1.0)
	c2d.C2D_SetImageTint(&tint3, c2d.C2D_Corner.TopRight, clrGreen,  1.0)
	c2d.C2D_SetImageTint(&tint3, c2d.C2D_Corner.BotLeft,  clrBlue,   1.0)
	c2d.C2D_SetImageTint(&tint3, c2d.C2D_Corner.BotRight, clrYellow, 1.0)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HSetImageTint Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1H1:none  2:TL=R  3:TR=G  4:rainbow")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Four 64×64 images, evenly spaced.
		// Centers at x = 50, 150, 250, 350 → top-left at x = 18, 118, 218, 318
		// Vertically centred: y = (240 - 64) / 2 = 88
		c2d.C2D_DrawImageAt(img,  18, 88, 0, nil,    1, 1) // no tint
		c2d.C2D_DrawImageAt(img, 118, 88, 0, &tint1, 1, 1) // TopLeft red
		c2d.C2D_DrawImageAt(img, 218, 88, 0, &tint2, 1, 1) // TopRight green
		c2d.C2D_DrawImageAt(img, 318, 88, 0, &tint3, 1, 1) // rainbow corners

		c3d.C3D_FrameEnd(0)
	}

	c3d.C3D_TexDelete(&tex)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
