package input_example

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
input_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.romfsInit()
	ctru.irrstInit()

	// Init libs
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	// Create screens
	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	tex_64x64:    c3d.C3D_Tex
	subtex_64x64: c2d.Tex3DS_SubTexture
	load_t3x_image("romfs:/player.t3x", &tex_64x64, &subtex_64x64)
	img_64x64 := c2d.C2D_Image{tex = &tex_64x64, subtex = &subtex_64x64}

	clrClear := c2d.C2D_Color32(0x00, 0x00, 0x00, 0xFF)

	SPEED    :: f32(2.0)
	DEADZONE :: i16(16)
	player_x := f32(168)
	player_y := f32(88)
	circle   := ctru.circlePosition{}
	cstick   := ctru.circlePosition{}

	// Main loop
	for ctru.aptMainLoop() {
		ctru.hidScanInput()

		kDown := ctru.hidKeysDown()
		kHeld := ctru.hidKeysHeld()
		ctru.hidCircleRead(&circle)
		ctru.irrstScanInput()
		ctru.irrstCstickRead(&cstick)
		if kDown & ctru.KEY_START != 0 do break

		if kHeld & ctru.KEY_DRIGHT != 0 do player_x += SPEED
		if kHeld & ctru.KEY_DLEFT  != 0 do player_x -= SPEED
		if kHeld & ctru.KEY_DDOWN  != 0 do player_y += SPEED
		if kHeld & ctru.KEY_DUP    != 0 do player_y -= SPEED

		if circle.dx >  DEADZONE do player_x += f32(circle.dx) / 154.0 * SPEED * 4
		if circle.dx < -DEADZONE do player_x += f32(circle.dx) / 154.0 * SPEED * 4
		if circle.dy >  DEADZONE do player_y -= f32(circle.dy) / 154.0 * SPEED * 4
		if circle.dy < -DEADZONE do player_y -= f32(circle.dy) / 154.0 * SPEED * 4

		if cstick.dx >  DEADZONE do player_x += f32(cstick.dx) / 154.0 * SPEED * 4
		if cstick.dx < -DEADZONE do player_x += f32(cstick.dx) / 154.0 * SPEED * 4
		if cstick.dy >  DEADZONE do player_y -= f32(cstick.dy) / 154.0 * SPEED * 4
		if cstick.dy < -DEADZONE do player_y -= f32(cstick.dy) / 154.0 * SPEED * 4

		if kDown & ctru.KEY_DRIGHT != 0 do ctru.printf("\x1b[7;1HDRight pressed ")
		if kDown & ctru.KEY_DLEFT  != 0 do ctru.printf("\x1b[8;1HDLeft pressed  ")
		if kDown & ctru.KEY_DUP    != 0 do ctru.printf("\x1b[9;1HDUp pressed    ")
		if kDown & ctru.KEY_DDOWN  != 0 do ctru.printf("\x1b[10;1HDDown pressed  ")
		if kDown & ctru.KEY_A      != 0 do ctru.printf("\x1b[11;1HA pressed  ")
		if kDown & ctru.KEY_B      != 0 do ctru.printf("\x1b[12;1HB pressed  ")
		if kDown & ctru.KEY_X      != 0 do ctru.printf("\x1b[13;1HX pressed  ")
		if kDown & ctru.KEY_Y      != 0 do ctru.printf("\x1b[14;1HY pressed  ")
		if kDown & ctru.KEY_L      != 0 do ctru.printf("\x1b[15;1HL pressed  ")
		if kDown & ctru.KEY_R      != 0 do ctru.printf("\x1b[16;1HR pressed  ")
		if kDown & ctru.KEY_ZL     != 0 do ctru.printf("\x1b[17;1HZL pressed     ")
		if kDown & ctru.KEY_ZR     != 0 do ctru.printf("\x1b[18;1HZR pressed     ")
		if kDown & ctru.KEY_SELECT != 0 do ctru.printf("\x1b[19;1HSELECT pressed ")
		if kDown & ctru.KEY_START  != 0 do ctru.printf("\x1b[20;1HSTART pressed  ")

		ctru.printf("\x1b[1;1HInput example                ")
		ctru.printf("\x1b[2;1HPress START to exit          ")
		ctru.printf("\x1b[3;1HPos: %.1f, %.1f      ", player_x, player_y)
		ctru.printf("\x1b[4;1HCircle: %d, %d      ", i32(circle.dx), i32(circle.dy))
		ctru.printf("\x1b[5;1HCStick: %d, %d      ", i32(cstick.dx), i32(cstick.dy))

		// Render the scene
		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrClear)
		c2d.C2D_SceneBegin(top)

		c2d.C2D_DrawImageAt(img_64x64, player_x, player_y, 0, nil, 1.0, 1.0)
		c3d.C3D_FrameEnd(0)
	}

	// Deinit
	ctru.irrstExit()
	c3d.C3D_TexDelete(&tex_64x64)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
