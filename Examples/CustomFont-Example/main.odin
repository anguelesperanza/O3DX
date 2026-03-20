package customfont_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates C2D_FontLoadSystem + C2D_TextFontParse.
//
// C2D_FontLoadSystem loads the 3DS system font by region into an explicit
// C2D_Font handle.  C2D_TextFontParse parses text against that handle
// instead of using the implicit system font.  This is the same API path
// used when loading a custom .bcfnt file from romfs.
//
// The bottom screen console also shows the glyph index of 'A' queried
// with C2D_FontGlyphIndexFromCodePoint, confirming the font is loaded.
//
// No romfs is required — the system font is built into the 3DS firmware.

@(export, link_name = "odin_main")
customfont_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Load the USA region system font into an explicit handle.
	// Swap to CFG_Region.EUR or .JPN for regional variants.
	font := c2d.C2D_FontLoadSystem(c2d.CFG_Region.USA)

	// Allocate a text buffer (glyph count covers all strings below).
	buf := c2d.C2D_TextBufNew(256)

	title:  c2d.C2D_Text
	lineA:  c2d.C2D_Text
	lineB:  c2d.C2D_Text
	lineC:  c2d.C2D_Text
	note:   c2d.C2D_Text

	// Parse all strings against the explicit font handle.
	c2d.C2D_TextFontParse(&title, font, buf, "CustomFont Example")
	c2d.C2D_TextFontParse(&lineA, font, buf, "Hello at scale 0.5")
	c2d.C2D_TextFontParse(&lineB, font, buf, "Hello at scale 0.75")
	c2d.C2D_TextFontParse(&lineC, font, buf, "Hello at scale 1.0")
	c2d.C2D_TextFontParse(&note,  font, buf, "via C2D_FontLoadSystem")

	c2d.C2D_TextOptimize(&title)
	c2d.C2D_TextOptimize(&lineA)
	c2d.C2D_TextOptimize(&lineB)
	c2d.C2D_TextOptimize(&lineC)
	c2d.C2D_TextOptimize(&note)

	// Query a glyph index to confirm the font is live.
	glyphA := c2d.C2D_FontGlyphIndexFromCodePoint(font, u32('A'))

	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF)
	clrCyan   := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)
	clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrYellow := c2d.C2D_Color32(0xFF, 0xFF, 0x00, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HCustomFont Example")
		ctru.printf("\x1b[2;1HPress START to exit")
		ctru.printf("\x1b[4;1HFont: USA system font")
		ctru.printf("\x1b[5;1HGlyph index 'A' = %d", glyphA)

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

		// Title — cyan, scale 0.8
		c2d.C2D_DrawTextColor(&title, c2d.C2D_WithColor, 10, 8, 0, 0.8, 0.8, clrCyan)

		// Three sizes of the same greeting
		c2d.C2D_DrawTextColor(&lineA, c2d.C2D_WithColor, 10, 55, 0, 0.5,  0.5,  clrWhite)
		c2d.C2D_DrawTextColor(&lineB, c2d.C2D_WithColor, 10, 85, 0, 0.75, 0.75, clrWhite)
		c2d.C2D_DrawTextColor(&lineC, c2d.C2D_WithColor, 10, 125, 0, 1.0,  1.0,  clrWhite)

		// Footer note — yellow, small
		c2d.C2D_DrawTextColor(&note, c2d.C2D_WithColor, 10, 200, 0, 0.55, 0.55, clrYellow)

		c3d.C3D_FrameEnd(0)
	}

	c2d.C2D_FontFree(font)
	c2d.C2D_TextBufDelete(buf)
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
}
