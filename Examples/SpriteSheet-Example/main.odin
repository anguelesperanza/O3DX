package spritesheet_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates the full C2D sprite-sheet pipeline:
//   png2t3x  →  .t3x (Tex3DS format)  →  C2D_SpriteSheetLoad  →  C2D_SpriteFromSheet
//
// The .t3x file is produced by tools/png2t3x.exe, which writes the standard
// Tex3DS binary format that Tex3DS_TextureImportStdio / C2D_SpriteSheetLoad
// expect — no custom loader required.
//
// Functions demonstrated:
//   C2D_SpriteSheetLoad      — load a .t3x sprite sheet from romfs
//   C2D_SpriteSheetFree      — release the sheet when done
//   C2D_SpriteFromSheet      — initialise a sprite from sheet index 0
//   C2D_SpriteSetCenter      — normalised pivot (0.5,0.5 = centre)
//   C2D_SpriteSetPos         — position in screen space
//   C2D_SpriteSetDepth       — Z ordering
//   C2D_SpriteSetScale       — absolute scale each frame
//   C2D_SpriteRotateDegrees  — cumulative rotation delta each frame
//   C2D_DrawSprite           — draw using stored transform
//
// Controls:
//   A / B    — increase / decrease rotation speed
//   X / Y    — scale up / down
//   START    — exit

@(export, link_name = "odin_main")
spritesheet_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.romfsInit()

	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c3d.Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Load the sprite sheet.  C2D_SpriteSheetLoad calls Tex3DS_TextureImportStdio
	// internally, so the .t3x must be in the standard Tex3DS binary format.
	sheet := c2d.C2D_SpriteSheetLoad("romfs:/sprite.t3x")

	// Initialise a sprite from index 0 of the sheet.
	// C2D_SpriteFromSheet sets pos=(0,0), center=(0,0), rotation=0, depth=0
	// and dims from the sub-texture size automatically.
	sprite: c2d.C2D_Sprite
	c2d.C2D_SpriteFromSheet(&sprite, sheet, 0)

	// Pivot at the sprite's centre (normalised 0..1 relative to dims).
	c2d.C2D_SpriteSetCenter(&sprite, 0.5, 0.5)

	// Position at the centre of the 400×240 top screen.
	c2d.C2D_SpriteSetPos(&sprite, 200, 120)

	// Z-depth 0 = front of scene.
	c2d.C2D_SpriteSetDepth(&sprite, 0)

	clrBg := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)

	// speedI: rotation delta per frame in whole degrees (default 1).
	speedI := i32(1)
	// scaleI: scale × 100 (100 = 1.00×, default).
	scaleI := i32(100)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		kDown := ctru.hidKeysDown()
		if kDown & ctru.KEY_START != 0 do break
		if kDown & ctru.KEY_A != 0 && speedI <  9 do speedI += 1
		if kDown & ctru.KEY_B != 0 && speedI > -9 do speedI -= 1
		if kDown & ctru.KEY_X != 0 && scaleI < 300 do scaleI += 10
		if kDown & ctru.KEY_Y != 0 && scaleI >  10 do scaleI -= 10

		// Apply scale (absolute) and rotation delta (cumulative) each frame.
		s := f32(scaleI) / 100.0
		c2d.C2D_SpriteSetScale(&sprite, s, s)
		c2d.C2D_SpriteRotateDegrees(&sprite, f32(speedI))

		ctru.printf("\x1b[1;1HSprite Sheet Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HRot:   %d deg/frame   ", speedI)
		ctru.printf("\x1b[5;1HScale: %d%%            ", scaleI)
		ctru.printf("\x1b[7;1HA/B = rotation speed")
		ctru.printf("\x1b[8;1HX/Y = scale")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		c2d.C2D_DrawSprite(&sprite)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_SpriteSheetFree(sheet)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
