package game_example

import "base:runtime"

import ctru  "../../../lib/ctru"
import c2d   "../../../lib/c2d"
import c3d   "../../../lib/c3d"
import audio "../../../lib/audio"



// ---------------------------------------------------------------
// World constants
// ---------------------------------------------------------------
GRAVITY    :: f32(0.05)
JUMP_FORCE :: f32(-2.0)
SCREEN_W        :: f32(400)
SCREEN_H        :: f32(240)
SCREEN_BOTTOM_W :: f32(320)

// ---------------------------------------------------------------
// Save file
// ---------------------------------------------------------------
SAVE_DIR  :: "sdmc:/3ds/FlappyClone"
SAVE_FILE :: "sdmc:/3ds/FlappyClone/highscore.dat"

// ---------------------------------------------------------------
// Background constants
// ---------------------------------------------------------------
BG_IMG_W :: f32(256) // actual pixel width of Background4.png
BG_SPEED :: f32(0.4) // scroll speed — slower than pipes for depth

// ---------------------------------------------------------------
// Pipe constants  — tune these to match your pipe.png dimensions
// ---------------------------------------------------------------
PIPE_SPEED   :: f32(1.5)   // pixels per frame
PIPE_GAP     :: f32(80.0)  // vertical gap between the two pipe openings
PIPE_HEIGHT  :: f32(80.0)  // height of the pipe sprite image
PIPE_SPACING :: f32(160.0) // horizontal distance between consecutive pipe pairs
PIPE_COUNT   :: 3          // how many pairs are on screen at once

// ---------------------------------------------------------------
// Collision hitbox half-sizes (slightly smaller than visual for fairness)
// ---------------------------------------------------------------
BIRD_HW :: f32(5)  // bird sprite is 16x16  → half = 8,  use 5
BIRD_HH :: f32(5)
PIPE_HW :: f32(13) // pipe sprite is 32x96  → half = 16, use 13
PIPE_HH :: f32(45) //                         half = 48, use 45

// ---------------------------------------------------------------
// Audio
// ---------------------------------------------------------------
COIN_CHANNEL :: i32(0) // NDSP channel reserved for the coin sound effect

// ---------------------------------------------------------------
// Types
// ---------------------------------------------------------------
GameState :: enum { MainMenu, Playing, Dead }
MenuOption :: enum { Restart, Exit }


Animation :: struct {
	current_frame: uint,
	sheet:         c2d.SpriteSheet,
	len:           uint,
	frame_delay:   u32,
	frame_timer:   u32,
}

Entity :: struct {
	x:          f32,
	y:          f32,
	velocity_y: f32,
	speed:      f32,
	animation:  Animation,
	sprite:     c2d.Sprite,
	active:     bool,
}

ParallaxLayer :: struct {
	sprite: c2d.Sprite,
	offset: f32,
	speed:  f32,
	img_w:  f32,
}

// A pair of pipes (top + bottom) sharing the same x position and gap centre
PipePair :: struct {
	top:    c2d.Sprite,
	bottom: c2d.Sprite,
	x:      f32,
	gap_y:  f32, // y of the centre of the gap
	passed: bool,
}

// ---------------------------------------------------------------
// Simple LCG — gives different gap heights without any imports
// ---------------------------------------------------------------
_rng: u32 = 12345

// Score
score      := u32(0)
high_score := u32(0)
new_record := false

load_high_score :: proc() {
	f := ctru.fopen(SAVE_FILE, "rb")
	if f == nil do return
	ctru.fread(&high_score, size_of(u32), 1, f)
	ctru.fclose(f)
}

save_high_score :: proc() {
	ctru.mkdir(SAVE_DIR, 0o755) // create directory if it doesn't exist yet
	f := ctru.fopen(SAVE_FILE, "wb")
	if f == nil do return
	ctru.fwrite(&high_score, size_of(u32), 1, f)
	ctru.fclose(f)
}

next_gap_y :: proc() -> f32 {
	_rng = _rng * 1664525 + 1013904223
	// Range 60..180 — keeps the gap away from both screen edges
	return 60.0 + f32(_rng % 121)
}

// ---------------------------------------------------------------
// Procs
// ---------------------------------------------------------------
update_parallax :: proc(layer: ^ParallaxLayer) {
	layer.offset += layer.speed
	if layer.offset >= layer.img_w do layer.offset -= layer.img_w
}

// Draws enough copies to fill SCREEN_W regardless of image width.
// Center is anchored at the left-center of the sprite so x == left edge.
// Positions are snapped to integer pixels to prevent seams between tiles.
draw_parallax :: proc(layer: ^ParallaxLayer) {
	copies      := int(SCREEN_W / layer.img_w) + 2
	pixel_offset := cast(f32)cast(i32)layer.offset // snap to whole pixel
	for i in 0..<copies {
		c2d.SpriteSetPos(&layer.sprite, f32(i)*layer.img_w - pixel_offset, SCREEN_H * 0.5)
		c2d.DrawSprite(&layer.sprite)
	}
}

play_animation :: proc(player: ^Entity) {
	player.animation.frame_timer += 1
	if player.animation.frame_timer < player.animation.frame_delay do return
	player.animation.frame_timer = 0

	player.animation.current_frame += 1
	if player.animation.current_frame >= player.animation.len {
		player.animation.current_frame = 0
	}
	c2d.SpriteFromSheet(&player.sprite, player.animation.sheet, player.animation.current_frame)
}

init_pipe_pair :: proc(pair: ^PipePair, sheet: c2d.SpriteSheet, x: f32) {
	pair.x     = x
	pair.gap_y = next_gap_y()

	// Bottom pipe — mouth faces upward toward the gap, body extends downward off-screen.
	// Anchor (center) is at the top edge of the sprite so SpriteSetPos places that edge
	// exactly at the bottom lip of the gap.
	c2d.SpriteFromSheet(&pair.bottom, sheet, 0)
	c2d.SpriteSetCenter(&pair.bottom, 0.5, 0.5)
	c2d.SpriteSetPos(&pair.bottom, x, pair.gap_y + PIPE_GAP * 0.5 + PIPE_HEIGHT * 0.5)

	// Top pipe — same sprite flipped 180°, body extends upward off-screen.
	c2d.SpriteFromSheet(&pair.top, sheet, 0)
	c2d.SpriteSetCenter(&pair.top, 0.5, 0.5)
	c2d.SpriteSetRotationDegrees(&pair.top, 180)
	c2d.SpriteSetPos(&pair.top, x, pair.gap_y - PIPE_GAP * 0.5 - PIPE_HEIGHT * 0.5)

	pair.passed = false
}

update_pipes :: proc(pipes: []PipePair, sheet: c2d.SpriteSheet) {
	for &pair in pipes {
		pair.x -= PIPE_SPEED

		// Snap to integer pixel before drawing to prevent sub-pixel jitter
		px := cast(f32)cast(i32)pair.x
		c2d.SpriteSetPos(&pair.top,    px, cast(f32)cast(i32)(pair.gap_y + PIPE_GAP * 0.5 + PIPE_HEIGHT * 0.5))
		c2d.SpriteSetPos(&pair.bottom, px, cast(f32)cast(i32)(pair.gap_y - PIPE_GAP * 0.5 - PIPE_HEIGHT * 0.5))

		// Recycle the pair once it scrolls fully off the left edge
		if pair.x < -32 {
			init_pipe_pair(&pair, sheet, SCREEN_W + 32)
		}
	}
}

pipe_check :: proc(player: Entity, pipes: []PipePair) -> bool {
	scored := false
	for &pair in pipes {
		if pair.x + 32 <= player.x && !pair.passed {
			score      += 1
			pair.passed = true
			scored      = true
		}
	}
	return scored
}


// Returns true if two axis-aligned rectangles overlap.
// ax/ay and bx/by are the centres; ahw/ahh and bhw/bhh are the half-sizes.
rects_overlap :: proc(ax, ay, ahw, ahh, bx, by, bhw, bhh: f32) -> bool {
	return abs(ax - bx) < ahw + bhw &&
	       abs(ay - by) < ahh + bhh
}

// Returns true if the bird is touching any pipe or has left the screen vertically.
check_collisions :: proc(player: Entity, pipes: []PipePair) -> bool {
	// Floor and ceiling
	if player.y >= SCREEN_H || player.y <= 0 do return true

	for pair in pipes {
		bottom_cy := pair.gap_y + PIPE_GAP * 0.5 + PIPE_HEIGHT * 0.5
		top_cy    := pair.gap_y - PIPE_GAP * 0.5 - PIPE_HEIGHT * 0.5
		if rects_overlap(player.x, player.y, BIRD_HW, BIRD_HH, pair.x, bottom_cy, PIPE_HW, PIPE_HH) do return true
		if rects_overlap(player.x, player.y, BIRD_HW, BIRD_HH, pair.x, top_cy,    PIPE_HW, PIPE_HH) do return true
	}
	return false
}

reset_game :: proc(player: ^Entity, pipes: []PipePair, sheet: c2d.SpriteSheet) {
	score             = 0
	player.y          = SCREEN_H * 0.5
	player.velocity_y = 0

	// Spread pipes back off the right edge
	for i in 0..<len(pipes) {
		init_pipe_pair(&pipes[i], sheet, SCREEN_W + f32(i) * PIPE_SPACING)
	}
}

// ---------------------------------------------------------------
// Entry point
// ---------------------------------------------------------------
@(export, link_name = "odin_main")
images_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
	context = runtime.default_context()
	ctru.romfsInit()
	load_high_score()

	ctru.gfxInitDefault()
	c3d.Init(c3d.DEFAULT_CMDBUF_SIZE)
	c2d.Init(c2d.DEFAULT_MAX_OBJECTS)
	c2d.Prepare()

	// --- NDSP (audio) ---
	ctru.ndspInit()
	ctru.ndspSetOutputMode(.STEREO)
	ctru.ndspChnReset(COIN_CHANNEL)
	ctru.ndspChnInitParams(COIN_CHANNEL)
	ctru.ndspChnSetInterp(COIN_CHANNEL, .LINEAR)
	ctru.ndspChnSetRate(COIN_CHANNEL, 44100.0)
	ctru.ndspChnSetFormat(COIN_CHANNEL, ctru.NDSP_FORMAT_MONO_PCM16)
	coin_mix: [12]f32
	coin_mix[0] = 1.0 // left
	coin_mix[1] = 1.0 // right
	ctru.ndspChnSetMix(COIN_CHANNEL, &coin_mix)

	clrClear := c2d.Color32(0x00, 0x00, 0x00, 0xFF)
	clrWhite := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
	clrBlack := c2d.C2D_Color32(0x00, 0x00, 0x00, 0xFF)
	clrCyan  := c2d.C2D_Color32(0x00, 0xFF, 0xFF, 0xFF)
	clrGray  := c2d.C2D_Color32(0x88, 0x88, 0x88, 0xFF)

	top      := c2d.CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)
	bottom   := c2d.CreateScreenTarget(ctru.GFX_BOTTOM, ctru.GFX_LEFT)

	// --- Player ---
	player: Entity = {
		x     = 60,
		y     = SCREEN_H * 0.5,
		speed = 2,
		animation = {
			sheet       = c2d.SpriteSheetLoad("romfs:/gfx/bird.t3x"),
			frame_delay = 6,
		},
	}
	player.animation.len = c2d.SpriteSheetCount(player.animation.sheet)
	// Initialise sprite before the first draw so frame 0 is set immediately
	c2d.SpriteFromSheet(&player.sprite, player.animation.sheet, 0)
	c2d.SpriteSetCenter(&player.sprite, 0.5, 0.5)
	c2d.SpriteSetPos(&player.sprite, player.x, player.y)

	// --- Audio clips ---
	coin_clip, _ := audio.load_wav("romfs:/audio/retrocoin4.wav", COIN_CHANNEL)

	// --- Background ---
	bg_sheet := c2d.SpriteSheetLoad("romfs:/gfx/Background4.t3x")
	bg: ParallaxLayer = { speed = BG_SPEED, img_w = BG_IMG_W }
	c2d.SpriteFromSheet(&bg.sprite, bg_sheet, 0)
	c2d.SpriteSetCenter(&bg.sprite, 0.0, 0.5) // anchor at left-center so x == left edge

	// --- Pipes ---
	pipe_sheet := c2d.SpriteSheetLoad("romfs:/gfx/pipe.t3x")
	pipes: [PIPE_COUNT]PipePair
	for i in 0..<PIPE_COUNT {
		init_pipe_pair(&pipes[i], pipe_sheet, SCREEN_W + f32(i) * PIPE_SPACING)
	}

	// --- Score ---
	staticBuf := c2d.C2D_TextBufNew(10)
	titleText: c2d.C2D_Text
	c2d.C2D_TextParse(&titleText, staticBuf, "Score:")
	c2d.C2D_TextOptimize(&titleText)

	dynamicBuf := c2d.C2D_TextBufNew(32)
	counterText: c2d.C2D_Text
	counterStr: [32]u8

	c2d.C2D_TextBufClear(dynamicBuf)
	ctru.snprintf(&counterStr[0], 32, "%u", score)
	c2d.C2D_TextParse(&counterText, dynamicBuf, cstring(&counterStr[0]))

	// --- High score display ---
	bestLabelBuf := c2d.C2D_TextBufNew(8)
	bestLabelText: c2d.C2D_Text
	c2d.C2D_TextParse(&bestLabelText, bestLabelBuf, "Best:")
	c2d.C2D_TextOptimize(&bestLabelText)

	highScoreBuf := c2d.C2D_TextBufNew(32)
	highScoreText: c2d.C2D_Text
	highScoreStr: [32]u8

	newBestBuf := c2d.C2D_TextBufNew(16)
	newBestText: c2d.C2D_Text
	c2d.C2D_TextParse(&newBestText, newBestBuf, "NEW BEST!")
	c2d.C2D_TextOptimize(&newBestText)

	// Helper to refresh the high score number text
	refresh_high_score_text :: proc(buf: c2d.TextBuf, text: ^c2d.C2D_Text, str: ^[32]u8) {
		c2d.C2D_TextBufClear(buf)
		ctru.snprintf(&str[0], 32, "%u", high_score)
		c2d.C2D_TextParse(text, buf, cstring(&str[0]))
	}
	refresh_high_score_text(highScoreBuf, &highScoreText, &highScoreStr)

	// --- Main menu text ---
	gameTitleBuf := c2d.C2D_TextBufNew(16)
	startBuf     := c2d.C2D_TextBufNew(8)
	gameTitleText, startText: c2d.C2D_Text
	c2d.C2D_TextParse(&gameTitleText, gameTitleBuf, "FLAPPY CLONE")
	c2d.C2D_TextParse(&startText,     startBuf,     "Start")
	c2d.C2D_TextOptimize(&gameTitleText)
	c2d.C2D_TextOptimize(&startText)

	// --- Death screen text ---
	gameOverBuf: = c2d.C2D_TextBufNew(16)
	restartBuf  := c2d.C2D_TextBufNew(16)
	exitBuf     := c2d.C2D_TextBufNew(8)
	cursorBuf   := c2d.C2D_TextBufNew(4)
	gameOverText, restartText, exitText, cursorText: c2d.C2D_Text
	c2d.C2D_TextParse(&gameOverText, gameOverBuf, "GAME OVER")
	c2d.C2D_TextParse(&restartText,  restartBuf,  "Restart")
	c2d.C2D_TextParse(&exitText,     exitBuf,     "Exit")
	c2d.C2D_TextParse(&cursorText,   cursorBuf,   ">")
	c2d.C2D_TextOptimize(&gameOverText)
	c2d.C2D_TextOptimize(&restartText)
	c2d.C2D_TextOptimize(&exitText)
	c2d.C2D_TextOptimize(&cursorText)

	// --- Game state ---
	game_state:     GameState  = .MainMenu
	menu_selection: MenuOption = .Restart

	// ---------------------------------------------------------------
	// Main loop
	// ---------------------------------------------------------------
	game_loop: for ctru.aptMainLoop() {
		ctru.hidScanInput()
		kDown := ctru.hidKeysDown()

		if kDown & ctru.KEY_START != 0 do break game_loop

		// Background scrolls in every state
		update_parallax(&bg)

		switch game_state {
		case .MainMenu:
			if kDown & ctru.KEY_DUP   != 0 do menu_selection = .Restart
			if kDown & ctru.KEY_DDOWN != 0 do menu_selection = .Exit
			if kDown & ctru.KEY_A != 0 {
				switch menu_selection {
				case .Restart:
					game_state = .Playing
				case .Exit:
					break game_loop
				}
			}

		case .Playing:
			if kDown & ctru.KEY_A != 0 do player.velocity_y = JUMP_FORCE

			// Physics
			player.velocity_y += GRAVITY
			player.y          += player.velocity_y
			if player.y > SCREEN_H do player.y = SCREEN_H
			if player.y < 0        do player.y = 0

			// Updates
			play_animation(&player)
			c2d.SpriteSetPos(&player.sprite, cast(f32)cast(i32)player.x, cast(f32)cast(i32)player.y)
			update_pipes(pipes[:], pipe_sheet)
			if pipe_check(player, pipes[:]) {
				audio.play(&coin_clip)
			}

			// Check collisions last — transitions to Dead state
			if check_collisions(player, pipes[:]) {
				game_state     = .Dead
				menu_selection = .Restart
				new_record = score > high_score
				if new_record {
					high_score = score
					save_high_score()
					refresh_high_score_text(highScoreBuf, &highScoreText, &highScoreStr)
				}
			}

		case .Dead:
			if kDown & ctru.KEY_DUP   != 0 do menu_selection = .Restart
			if kDown & ctru.KEY_DDOWN != 0 do menu_selection = .Exit
			if kDown & ctru.KEY_A != 0 {
				switch menu_selection {
				case .Restart:
					reset_game(&player, pipes[:], pipe_sheet)
					new_record = false
					game_state = .Playing
				case .Exit:
					break game_loop
				}
			}
		}

		// Update score text (used by both Playing HUD and Dead screen)
		c2d.C2D_TextBufClear(dynamicBuf)
		ctru.snprintf(&counterStr[0], 32, "%u", score)
		c2d.C2D_TextParse(&counterText, dynamicBuf, cstring(&counterStr[0]))

		// Render
		c3d.FrameBegin(c3d.FRAME_SYNCDRAW)

		// Top screen
		c2d.TargetClear(top, clrClear)
		c2d.SceneBegin(top)
		draw_parallax(&bg)
		if game_state != .MainMenu {
			for &pair in pipes {
				c2d.DrawSprite(&pair.top)
				c2d.DrawSprite(&pair.bottom)
			}
			c2d.DrawSprite(&player.sprite)
		}

		// Bottom screen
		c2d.TargetClear(bottom, clrClear)
		c2d.SceneBegin(bottom)
		switch game_state {
		case .MainMenu:
			// Title
			c2d.DrawTextColor(&gameTitleText, c2d.AlignCenter | c2d.WithColor, 160, 60, 0, 1.2, 1.2, clrWhite)
			// Best score
			c2d.DrawTextColor(&bestLabelText, c2d.WithColor,                   70,  110, 0, 0.9, 0.9, clrWhite)
			c2d.DrawTextColor(&highScoreText, c2d.WithColor,                   150, 110, 0, 0.9, 0.9, clrCyan)
			// Menu options
			start_clr := clrWhite if menu_selection == .Restart else clrGray
			exit_clr  := clrWhite if menu_selection == .Exit    else clrGray
			cursor_y  := f32(155) if menu_selection == .Restart else f32(190)
			c2d.DrawTextColor(&cursorText, c2d.WithColor, 88,  cursor_y, 0, 1.0, 1.0, clrCyan)
			c2d.DrawTextColor(&startText,  c2d.WithColor, 108, 155,      0, 1.0, 1.0, start_clr)
			c2d.DrawTextColor(&exitText,   c2d.WithColor, 108, 190,      0, 1.0, 1.0, exit_clr)

		case .Playing:
			// Score row
			c2d.DrawTextColor(&titleText,     c2d.WithColor, 10,  110, 0, 1.0, 1.0, clrWhite)
			c2d.DrawTextColor(&counterText,   c2d.WithColor, 90,  110, 0, 1.0, 1.0, clrCyan)
			// Best row
			c2d.DrawTextColor(&bestLabelText, c2d.WithColor, 10,  135, 0, 1.0, 1.0, clrWhite)
			c2d.DrawTextColor(&highScoreText, c2d.WithColor, 90,  135, 0, 1.0, 1.0, clrCyan)

		case .Dead:
			// Title
			c2d.DrawTextColor(&gameOverText,  c2d.AlignCenter | c2d.WithColor, 160, 30, 0, 1.2, 1.2, clrWhite)
			// Score row
			c2d.DrawTextColor(&titleText,     c2d.WithColor, 70, 70, 0, 0.9, 0.9, clrWhite)
			c2d.DrawTextColor(&counterText,   c2d.WithColor, 150, 70, 0, 0.9, 0.9, clrCyan)
			// Best row
			c2d.DrawTextColor(&bestLabelText, c2d.WithColor, 70, 92, 0, 0.9, 0.9, clrWhite)
			c2d.DrawTextColor(&highScoreText, c2d.WithColor, 150, 92, 0, 0.9, 0.9, clrCyan)
			// "NEW BEST!" banner — only shown when the player just beat the record
			if new_record {
				c2d.DrawTextColor(&newBestText, c2d.AlignCenter | c2d.WithColor, 160, 118, 0, 0.9, 0.9, clrCyan)
			}

			// Menu options — selected is white, unselected is gray
			restart_clr := clrWhite if menu_selection == .Restart else clrGray
			exit_clr    := clrWhite if menu_selection == .Exit    else clrGray

			// Cursor sits left of the selected option
			cursor_y := f32(155) if menu_selection == .Restart else f32(190)
			c2d.DrawTextColor(&cursorText,   c2d.WithColor, 88,  cursor_y, 0, 1.0, 1.0, clrCyan)
			c2d.DrawTextColor(&restartText,  c2d.WithColor, 108, 155,      0, 1.0, 1.0, restart_clr)
			c2d.DrawTextColor(&exitText,     c2d.WithColor, 108, 190,      0, 1.0, 1.0, exit_clr)
		}

		c3d.FrameEnd(0)
	}

	audio.unload(&coin_clip)
	ctru.ndspExit()
	c2d.Fini()
	c3d.Fini()
	ctru.romfsExit()
	ctru.gfxExit()
	return 0
}
