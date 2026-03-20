package drawtext_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_DrawText with three different scales.
// Text renders in white (citro2d default) on a dark background.
// Font height at scale 1.0 is 30 px (per citro2d docs).

@(export, link_name = "odin_main")
drawtext_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	buf := c2d.C2D_TextBufNew(64)

	smallText: c2d.C2D_Text
	medText:   c2d.C2D_Text
	largeText: c2d.C2D_Text

	c2d.C2D_TextParse(&smallText, buf, "Small  (scale 0.5)")
	c2d.C2D_TextParse(&medText,   buf, "Medium (scale 0.7)")
	c2d.C2D_TextParse(&largeText, buf, "Large  (scale 1.0)")

	c2d.C2D_TextOptimize(&smallText)
	c2d.C2D_TextOptimize(&medText)
	c2d.C2D_TextOptimize(&largeText)

	clrBg := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HDrawText Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HShows C2D_DrawText at")
		ctru.printf("\x1b[5;1H3 different scales.")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// scale 0.5 → ~15 px tall
		c2d.C2D_DrawText(&smallText, c2d.C2D_AlignLeft, 10, 50, 0, 0.5, 0.5)
		// scale 0.7 → ~21 px tall
		c2d.C2D_DrawText(&medText,   c2d.C2D_AlignLeft, 10, 110, 0, 0.7, 0.7)
		// scale 1.0 → ~30 px tall
		c2d.C2D_DrawText(&largeText, c2d.C2D_AlignLeft, 10, 170, 0, 1.0, 1.0)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_TextBufDelete(buf)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
