package drawtextwrap_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_DrawTextColorWrap — automatic word-wrap within a
// pixel budget.  Two strings are wrapped at different widths:
//   - Full screen width (380 px)
//   - Half screen width (190 px, so wrapping happens sooner)
//
// C2D_WordWrap (BIT(4) = 16) must be in flags; citro2d then reads a
// float wrapWidth after (optionally) reading the colour.

@(export, link_name = "odin_main")
drawtextwrap_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	buf := c2d.C2D_TextBufNew(256)

	wideText:   c2d.C2D_Text
	narrowText: c2d.C2D_Text

	c2d.C2D_TextParse(&wideText,   buf,
		"Wide wrap (380 px): The quick brown fox jumps over the lazy dog.")
	c2d.C2D_TextParse(&narrowText, buf,
		"Narrow wrap (190 px): The quick brown fox jumps over the lazy dog.")

	c2d.C2D_TextOptimize(&wideText)
	c2d.C2D_TextOptimize(&narrowText)

	clrBg    := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrWhite := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrCyan  := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HDrawTextWrap Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HShows word-wrap at")
		ctru.printf("\x1b[5;1H380 px and 190 px width.")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Wide wrap — fills almost the full screen width.
		// scale 0.55, each line ~17 px tall.
		c2d.C2D_DrawTextColorWrap(&wideText,
			c2d.C2D_WordWrap | c2d.C2D_WithColor,
			6, 10, 0, 0.55, 0.55, clrWhite, 380)

		// Narrow wrap — same text, tighter column (left half of screen).
		c2d.C2D_DrawTextColorWrap(&narrowText,
			c2d.C2D_WordWrap | c2d.C2D_WithColor,
			6, 120, 0, 0.55, 0.55, clrCyan, 190)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_TextBufDelete(buf)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
