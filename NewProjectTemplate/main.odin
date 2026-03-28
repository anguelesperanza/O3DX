package my_game

import "base:runtime"

import ctru "../lib/ctru"
import c2d  "../lib/c2d"
import c3d  "../lib/c3d"
// import audio "../lib/audio"  // uncomment if you need sound

// ---------------------------------------------------------------
// Screen constants (for convenience — also available as ctru.SCREEN_*)
// ---------------------------------------------------------------
SCREEN_W        :: f32(400) // top screen width
SCREEN_H        :: f32(240) // both screens height
SCREEN_BOTTOM_W :: f32(320) // bottom screen width

// ---------------------------------------------------------------
// Entry point
// ---------------------------------------------------------------
// The proc name below can be anything — only the link_name matters.
@(export, link_name = "odin_main")
game_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	context = runtime.default_context()

	// Mount the read-only filesystem embedded in the .3dsx.
	// Required before any "romfs:/" path is used.
	ctru.romfsInit()

	// Init graphics stack — order matters.
	ctru.gfxInitDefault()
	c3d.Init(c3d.DEFAULT_CMDBUF_SIZE)
	c2d.Init(c2d.DEFAULT_MAX_OBJECTS)
	c2d.Prepare()

	// Uncomment to enable audio:
	// ctru.ndspInit()
	// ctru.ndspSetOutputMode(.STEREO)

	// Create render targets for each screen.
	// Use GFX_LEFT for both — GFX_RIGHT is only for stereoscopic 3D.
	top    := c2d.CreateScreenTarget(ctru.GFX_TOP,    ctru.GFX_LEFT)
	bottom := c2d.CreateScreenTarget(ctru.GFX_BOTTOM, ctru.GFX_LEFT)

	// Colours — Color32(r, g, b, alpha).  Alpha 0xFF = fully opaque.
	clrBlack := c2d.Color32(0x00, 0x00, 0x00, 0xFF)
	clrWhite := c2d.Color32(0xFF, 0xFF, 0xFF, 0xFF)
	_ = clrWhite // remove when used

	// ---------------------------------------------------------------
	// Main loop
	// ---------------------------------------------------------------
	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		kDown := ctru.hidKeysDown()

		// START always exits
		if kDown & ctru.KEY_START != 0 do break

		// -----------------------------------------------------------
		// Update
		// -----------------------------------------------------------
		// Put game logic here.

		// -----------------------------------------------------------
		// Render
		// -----------------------------------------------------------
		c3d.FrameBegin(c3d.FRAME_SYNCDRAW)

		// Top screen
		c2d.TargetClear(top, clrBlack)
		c2d.SceneBegin(top)
		// Draw top-screen content here.

		// Bottom screen
		c2d.TargetClear(bottom, clrBlack)
		c2d.SceneBegin(bottom)
		// Draw bottom-screen content here.

		c3d.FrameEnd(0)
	}

	// ---------------------------------------------------------------
	// Cleanup — reverse initialisation order
	// ---------------------------------------------------------------
	// ctru.ndspExit()  // uncomment if audio was enabled
	c2d.Fini()
	c3d.Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
