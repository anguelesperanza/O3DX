package draw_image_rotated_example

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

MATH_PI :: f32(3.14159265358979)

@(export, link_name = "odin_main")
draw_image_rotated_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.romfsInit()

	// Init libs
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	// Create screen target
	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Load sprite (64x64)
	tex:    c3d.C3D_Tex
	subtex: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/sprite.t3x", &tex, &subtex)
	img := c2d.C2D_Image{tex = &tex, subtex = &subtex}

	clrBg := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)

	// Layout: 8 copies of the sprite at different rotation angles
	// arranged in a 4-column × 2-row grid on the top screen (400×240).
	//
	// Centers are 100 px apart horizontally, 100 px apart vertically:
	//   Row 0 centers y = 70  →  top-left y = 70 - 32 = 38
	//   Row 1 centers y = 170 →  top-left y = 170 - 32 = 138
	//   Column centers x = 50, 150, 250, 350 → top-left x = 18, 118, 218, 318
	//
	// Angles (radians):
	//   Row 0:  0°      45°           90°           135°
	//   Row 1:  180°    225°          270°          315°

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HDrawImageAtRotated Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HTop row:    0  45   90  135 deg")
		ctru.printf("\x1b[5;1HBottom row: 180 225 270 315 deg")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Row 0 — 0°, 45°, 90°, 135°
		c2d.C2D_DrawImageAtRotated(img,  18, 38, 0, 0,                       nil, 1, 1)
		c2d.C2D_DrawImageAtRotated(img, 118, 38, 0, MATH_PI * 0.25,          nil, 1, 1)
		c2d.C2D_DrawImageAtRotated(img, 218, 38, 0, MATH_PI * 0.5,           nil, 1, 1)
		c2d.C2D_DrawImageAtRotated(img, 318, 38, 0, MATH_PI * 0.75,          nil, 1, 1)

		// Row 1 — 180°, 225°, 270°, 315°
		c2d.C2D_DrawImageAtRotated(img,  18, 138, 0, MATH_PI,                nil, 1, 1)
		c2d.C2D_DrawImageAtRotated(img, 118, 138, 0, MATH_PI * 1.25,         nil, 1, 1)
		c2d.C2D_DrawImageAtRotated(img, 218, 138, 0, MATH_PI * 1.5,          nil, 1, 1)
		c2d.C2D_DrawImageAtRotated(img, 318, 138, 0, MATH_PI * 1.75,         nil, 1, 1)

		c3d.C3D_FrameEnd(0)
	}

	// Deinit
	c3d.C3D_TexDelete(&tex)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
