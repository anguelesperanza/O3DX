package drawrectsolic_example


import ctru "../../lib/ctru"
import c2d "../../lib/c2d"
import c3d "../../lib/c3d"



@(export, link_name = "odin_main")
drawrectsolid_main :: proc "c" (argc:i32, argv:[^]cstring) -> i32 {

	// Init
	ctru.gfxInitDefault()
	c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
	c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
	c2d.C2D_Prepare()
	ctru.consoleInit(ctru.GFX_BOTTOM, nil)

	top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

	// Colors
	clrBg     := c2d.C2D_Color32(0x1A, 0x1A, 0x2E, 0xFF) // dark navy
	clrOrange := c2d.C2D_Color32(0xFF, 0xA0, 0x00, 0xFF)

	for ctru.aptMainLoop() {
		ctru.hidScanInput()
		if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

		ctru.printf("\x1b[1;1HC2D_DrawLine Example")
		ctru.printf("\x1b[2;1HPress START to exit")

		c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
		c2d.C2D_TargetClear(top, clrBg)
		c2d.C2D_SceneBegin(top)

	    c2d.C2D_DrawRectSolid(x = 10, y = 10, z = 0, w = 100, h = 200, clr = clrOrange) // -> bool ---

		c3d.C3D_FrameEnd(0)
	}

	// Deinit
	c2d.C2D_Fini()
	c3d.C3D_Fini()
	ctru.gfxExit()
	return 0
	
}
