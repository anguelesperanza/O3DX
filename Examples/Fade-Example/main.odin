package fade_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_Fade:
// C2D_Fade(color) overlays a solid colour on the entire scene.
// The alpha channel of 'color' controls the opacity of the overlay:
//   alpha = 0   → no fade (scene fully visible)
//   alpha = 255 → scene completely hidden by the fade colour
//
// This example draws a colourful background of rectangles and
// animates a black fade that pulses from transparent to ~85% opaque
// and back, so you can see the scene gradually disappear and reappear.
// Press A to cycle the fade colour (black → red → white).

@(export, link_name = "odin_main")
fade_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	clrBg      := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrRed     := c2d.C2D_Color32(0xFF, 0x4C, 0x4C, 0xFF)
	clrGreen   := c2d.C2D_Color32(0x4C, 0xFF, 0x4C, 0xFF)
	clrBlue    := c2d.C2D_Color32(0x4C, 0x9E, 0xFF, 0xFF)
	clrYellow  := c2d.C2D_Color32(0xFF, 0xFF, 0x4C, 0xFF)
	clrOrange  := c2d.C2D_Color32(0xFF, 0xA0, 0x00, 0xFF)
	clrCyan    := c2d.C2D_Color32(0x4C, 0xFF, 0xFF, 0xFF)

	// Fade colour variants cycled with button A
	fadeColours := [3]u32{
		c2d.C2D_Color32(0x00, 0x00, 0x00, 0x00), // black base (alpha animated)
		c2d.C2D_Color32(0xFF, 0x00, 0x00, 0x00), // red base
		c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0x00), // white base
	}
	fadeColourIdx := i32(0)

	// Pulsing alpha: 0 → 220 → 0, stepping by 2 each frame (~60 fps → ~3.7 s cycle)
	fadeAlpha := i32(0)
	fadeDir   := i32(2)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		kDown := ctru.hidKeysDown()
		if kDown & ctru.KEY_START != 0 do break
		if kDown & ctru.KEY_A != 0 {
			fadeColourIdx = (fadeColourIdx + 1) % 3
		}

		// Advance the alpha pulse
		fadeAlpha += fadeDir
		if fadeAlpha >= 220 do fadeDir = -2
		if fadeAlpha <= 0   do fadeDir =  2

		// Build the actual fade colour by patching the alpha byte into the base colour.
		// C2D_Color32 packs as r|g<<8|b<<16|a<<24, so alpha is the top byte.
		base  := fadeColours[fadeColourIdx]
		alpha := u32(u8(fadeAlpha))
		fadeClr := (base & 0x00FFFFFF) | (alpha << 24)

		ctru.printf("\x1b[1;1HFade Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[3;1HPress A to cycle fade colour")
		ctru.printf("\x1b[5;1HFade alpha: %d   ", fadeAlpha)
		ctru.printf("\x1b[6;1HColour idx: %d   ", fadeColourIdx)

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Apply the animated fade before drawing anything
		c2d.C2D_Fade(fadeClr)

		// Colourful background scene — 6 rectangles in two rows
		c2d.C2D_DrawRectSolid( 10, 30, 0, 110, 80, clrRed)
		c2d.C2D_DrawRectSolid(145, 30, 0, 110, 80, clrGreen)
		c2d.C2D_DrawRectSolid(280, 30, 0, 110, 80, clrBlue)
		c2d.C2D_DrawRectSolid( 10, 130, 0, 110, 80, clrYellow)
		c2d.C2D_DrawRectSolid(145, 130, 0, 110, 80, clrOrange)
		c2d.C2D_DrawRectSolid(280, 130, 0, 110, 80, clrCyan)

		// Reset fade to fully transparent at end of frame so it doesn't
		// bleed into the console render on the bottom screen.
		c2d.C2D_Fade(c2d.C2D_Color32(0, 0, 0, 0))

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
