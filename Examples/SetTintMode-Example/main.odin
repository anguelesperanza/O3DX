package set_tint_mode_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_SetTintMode:
// C2D_SetTintMode changes how image tints interact with the underlying pixel.
// Three available modes (defined in C2D_TintMode):
//
//   Solid (0) — tint colour replaces the image colour, blended by factor
//   Mult  (1) — tint colour multiplies the image colour channel-by-channel
//   Luma  (2) — tint colour is weighted by the pixel's luminance
//
// This example draws the same image three times with the same 50% green tint
// applied, once in each mode, so the visual difference is clear.
// Press A/B to nudge the blend factor up/down.

foreign import example_c "system:example_c"

@(default_calling_convention = "c")
foreign example_c {
    load_t3x_image :: proc(path: cstring, tex: ^c3d.C3D_Tex, subtex: ^c2d.Tex3DS_SubTexture) -> bool ---
}

@(export, link_name = "odin_main")
set_tint_mode_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
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

	clrBg    := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrGreen := c2d.C2D_Color32(0x00, 0xFF, 0x00, 0xFF)

	// Blend factor controlled by A/B buttons (0.0 – 1.0, default 0.5)
	blendI := i32(50) // stored as integer 0–100 to avoid f32 accumulation drift

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		kDown := ctru.hidKeysDown()
		kHeld := ctru.hidKeysHeld()
		if kDown & ctru.KEY_START != 0 do break
		if kHeld & ctru.KEY_A != 0 && blendI < 100 do blendI += 1
		if kHeld & ctru.KEY_B != 0 && blendI > 0   do blendI -= 1

		blend := f32(blendI) / 100.0

		// Rebuild the tint each frame (blend may change)
		tint: c2d.C2D_ImageTint
		c2d.C2D_PlainImageTint(&tint, clrGreen, blend)

		ctru.printf("\x1b[1;1HSetTintMode Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[3;1HA=blend up  B=blend down")
		ctru.printf("\x1b[5;1HBlend: %d%%   ", blendI)
		ctru.printf("\x1b[6;1H  Solid   Mult   Luma")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Three images, each 64×64, in columns across the top screen.
		// Centers at x = 67, 200, 333 → top-left at x = 35, 168, 301
		// Vertically centred: y = (240 - 64) / 2 = 88

		// Column 1 — Solid tint mode
		c2d.C2D_SetTintMode(c2d.C2D_TintMode.Solid)
		c2d.C2D_DrawImageAt(img, 35, 88, 0, &tint, 1, 1)

		// Column 2 — Multiply tint mode
		c2d.C2D_SetTintMode(c2d.C2D_TintMode.Mult)
		c2d.C2D_DrawImageAt(img, 168, 88, 0, &tint, 1, 1)

		// Column 3 — Luma tint mode
		c2d.C2D_SetTintMode(c2d.C2D_TintMode.Luma)
		c2d.C2D_DrawImageAt(img, 301, 88, 0, &tint, 1, 1)

		// Restore default tint mode (Solid) for cleanliness
		c2d.C2D_SetTintMode(c2d.C2D_TintMode.Solid)

		c3d.C3D_FrameEnd(0)
	}

	c3d.C3D_TexDelete(&tex)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
