# 3DS Odin Bindings — Developer Reference

A practical guide to the `ctru`, `c3d`, `c2d`, and `audio` packages in this repository.
Covers every binding package, their nuances, and the hard-won lessons from shipping a real game.

---

## Table of Contents

1. [Project Structure](#project-structure)
2. [Starting a New Project](#starting-a-new-project)
3. [Screen Dimensions](#screen-dimensions)
4. [The Soft-Float ABI Bridge — the most important nuance](#the-soft-float-abi-bridge)
5. [Package: ctru](#package-ctru)
6. [Package: c3d](#package-c3d)
7. [Package: c2d](#package-c2d)
8. [Package: audio](#package-audio)
9. [Memory — linearAlloc vs heap](#memory--linearalloc-vs-heap)
10. [File I/O — romfs and sdmc](#file-io--romfs-and-sdmc)
11. [Input](#input)
12. [Build System](#build-system)
13. [Common Gotchas](#common-gotchas)
14. [Camera — CAM service](#camera--cam-service)
15. [Microphone — MIC service](#microphone--mic-service)

---

## Project Structure

```
3ds-odin/
├── lib/
│   ├── ctru/       — libctru bindings (hardware init, input, file I/O, memory)
│   ├── c3d/        — Citro3D bindings (GPU, textures, math)
│   ├── c2d/        — Citro2D bindings (sprites, text, 2D drawing)
│   └── audio/      — WAV loading + NDSP playback helpers
├── tools/
│   ├── tritex.odin — PNG → .t3x texture converter
│   ├── tritex.exe  — compiled binary
│   └── mp3towav/   — MP3 → WAV converter (uses vendor:miniaudio)
├── NewProjectTemplate/  — copy this to start a new game
│   ├── build.bat
│   ├── main.odin
│   ├── main.c
│   ├── assets/images/
│   └── assets/audio/
├── Examples/
│   └── Games/
│       └── FlappyClone/  — reference game using all packages
└── docs.md         — this file
```

Typical imports in a game:

```odin
import ctru  "../../../lib/ctru"
import c2d   "../../../lib/c2d"
import c3d   "../../../lib/c3d"
import audio "../../../lib/audio"
```

---

## Starting a New Project

Copy the `NewProjectTemplate/` folder from the repo root and rename it to your project name.
It contains everything needed to build and run immediately.

```
NewProjectTemplate/
├── build.bat        ← full build pipeline, pre-configured
├── main.odin        ← entry point with init/loop/cleanup boilerplate
├── main.c           ← C shim that calls odin_main — do not modify
├── assets/
│   ├── images/      ← place PNG/JPG sprites here; subfolders with .t3s for atlases
│   └── audio/       ← place WAV/OGG/MP3 here
└── romfs/
    ├── gfx/         ← generated .t3x files land here (do not edit manually)
    └── audio/       ← copied audio files land here (do not edit manually)
```

### Checklist after copying

1. **Rename** `set TARGET=MyGame` on **line 14** of `build.bat` to your project name.
2. **Update the author** in the SMDH block — search `AuthorName` in `build.bat` (appears twice).
3. **Update the package name** on line 1 of `main.odin` (`package my_game`).
4. **Update the import paths** in `main.odin` — by default they point to `../lib` (one level up from the repo root). If your project is nested deeper, adjust accordingly.
5. Add a **48×48 `assets/icon.png`** for a custom Homebrew Launcher icon (optional — falls back to the devkitPro default).

### Tool paths — local vs PATH

The template build.bat uses **local copies** of `tritex` and `mp3towav` so the project
works without any PATH setup:

```bat
:: NewProjectTemplate/build.bat  — lines 9-10
set TRITEX=..\tools\tritex.exe
set MP3TOWAV=..\tools\mp3towav.exe
```

If you have `tritex` and `mp3towav` on your system PATH (e.g. after copying the exes to
`C:\Windows\System32` or adding `tools\` to your PATH), change those two lines to:

```bat
set TRITEX=tritex
set MP3TOWAV=mp3towav
```

That is the only change required — every `%TRITEX%` and `%MP3TOWAV%` reference in the
script picks up the new value automatically.

> The same two lines exist in `Examples/Games/FlappyClone/build.bat` but FlappyClone uses
> bare `tritex` and `mp3towav` commands (PATH-based) since it predates the template.
> The template defaults to local paths so a fresh clone works out of the box.

---

## Screen Dimensions

| Screen  | Width | Height | Constant                   |
|---------|-------|--------|----------------------------|
| Top     | 400   | 240    | `ctru.SCREEN_TOP_WIDTH`    |
| Bottom  | 320   | 240    | `ctru.SCREEN_BOT_WIDTH`    |
| Both    | —     | 240    | `ctru.SCREEN_HEIGHT`       |

The top screen is wider. Always account for this when positioning UI on the bottom screen.
`ctru.GFX_TOP = 0`, `ctru.GFX_BOTTOM = 1`, `ctru.GFX_LEFT = 0`, `ctru.GFX_RIGHT = 1`.

---

## The Soft-Float ABI Bridge

> This is the single most important nuance in the entire codebase.

The 3DS ARM11 CPU uses **hard-float** (VFP) calling conventions — float arguments are passed
in floating-point registers `s0`, `s1`, etc. The Odin compiler for ARM targets uses
**soft-float** conventions — floats are passed in integer registers `r0`, `r1`, etc.

**This means you cannot call any libctru / citro2d / citro3d function that takes a bare
`float` parameter directly from Odin.** The value will land in the wrong register and the
function will receive garbage.

### What is safe to call directly

- Functions whose parameters are only integers, pointers, enums, or booleans.
- Functions that receive floats **inside a struct** (struct layout is identical in both
  conventions — only register passing differs).

### What requires a bridge

Any function with a bare `float` (f32) parameter. These are wrapped in `bridge.c` files
in each package. The bridge receives the value as `uint32_t`, reinterprets it with a
type-pun (`u2f()`), and forwards it to the real hard-float function.

```c
// lib/c2d/bridge.c — example bridge
void c2d_sprite_set_pos(C2D_Sprite* sp, uint32_t x, uint32_t y) {
    C2D_SpriteSetPos(sp, u2f(x), u2f(y));
}
```

The Odin binding then declares the bridge function (not the original), taking `f32`
parameters as normal — Odin places them in integer registers, C receives them as `uint32_t`,
and the pun corrects the bits.

**You never need to think about this when calling the bindings** — it is handled
transparently. But you will need to add bridge entries yourself if you extend the bindings
with new functions that take bare float parameters.

---

## Package: ctru

The lowest-level package. Wraps libctru — hardware initialisation, input, memory,
file I/O, and libc helpers.

### Initialisation order

```odin
ctru.romfsInit()         // mount the .3dsx embedded filesystem (always first)
ctru.gfxInitDefault()    // init LCD framebuffers
c3d.Init(c3d.DEFAULT_CMDBUF_SIZE) // init GPU command buffer
c2d.Init(c2d.DEFAULT_MAX_OBJECTS) // init citro2d
c2d.Prepare()            // set up citro2d shader
ctru.ndspInit()          // init DSP audio (requires dspfirm.cdc in romfs)
```

Shutdown is the reverse:

```odin
audio.unload(&clip)
ctru.ndspExit()
c2d.Fini()
c3d.Fini()
ctru.romfsExit()
ctru.gfxExit()
```

### Main loop

```odin
for ctru.aptMainLoop() {
    // aptMainLoop returns false when the HOME button is pressed
    // or the system requests the app to exit.
}
```

Use a **labeled break** to exit from inside a switch:

```odin
game_loop: for ctru.aptMainLoop() {
    switch state {
    case .Exit:
        break game_loop   // exits the for loop, not just the switch
    }
}
```

### Input

Call `ctru.hidScanInput()` once per frame before reading any keys.

| Function                  | Returns                                      |
|---------------------------|----------------------------------------------|
| `ctru.hidKeysDown()`      | Buttons pressed **this frame** (one-shot)    |
| `ctru.hidKeysHeld()`      | Buttons held **this frame** (continuous)     |
| `ctru.hidKeysUp()`        | Buttons released **this frame**              |
| `ctru.hidTouchRead(&pos)` | Touch position (`pos.px`, `pos.py`)          |
| `ctru.hidCircleRead(&pos)`| Circle pad position (`pos.dx`, `pos.dy`)     |

```odin
ctru.hidScanInput()
kDown := ctru.hidKeysDown()
kHeld := ctru.hidKeysHeld()

if kDown & ctru.KEY_A     != 0 { /* pressed this frame */ }
if kHeld & ctru.KEY_DRIGHT != 0 { /* held this frame */ }
```

For actions like jumping, **use `kDown`** (single press). For continuous movement,
**use `kHeld`**.

Key constants: `KEY_A`, `KEY_B`, `KEY_X`, `KEY_Y`, `KEY_L`, `KEY_R`, `KEY_ZL`, `KEY_ZR`
(ZL/ZR are New 3DS only), `KEY_START`, `KEY_SELECT`, `KEY_DUP`, `KEY_DDOWN`, `KEY_DLEFT`,
`KEY_DRIGHT`, `KEY_TOUCH`, `KEY_CPAD_UP/DOWN/LEFT/RIGHT`.

Generic aliases that match either D-pad or Circle pad:
`KEY_UP`, `KEY_DOWN`, `KEY_LEFT`, `KEY_RIGHT`.

### Console (debug text)

```odin
ctru.consoleInit(ctru.GFX_BOTTOM, nil)
ctru.printf("\x1b[1;1HHello World")  // ANSI escape: row 1, col 1
```

> **Warning:** `consoleInit` and `c2d.CreateScreenTarget` both claim ownership of a screen.
> Do not use both on the same screen. If you switch the bottom screen to citro2d graphics,
> remove the `consoleInit` call.

### Memory allocators

The 3DS has two special memory regions required for GPU and audio:

| Allocator       | Use for                                          |
|-----------------|--------------------------------------------------|
| `linearAlloc`   | Audio PCM buffers, GPU vertex data, shader code  |
| `vramAlloc`     | GPU textures and render targets (optional)        |
| Normal heap     | Everything else (Odin `new`, `make`, etc.)       |

```odin
buf := ctru.linearAlloc(size)
defer ctru.linearFree(buf)
```

**Never use regular heap memory for audio wave buffers or GPU vertex buffers.**
The hardware DMA engine can only access linear and VRAM memory. Passing a heap pointer
will silently fail or crash.

### libc helpers

```odin
ctru.snprintf(&buf[0], len(buf), "%u", value)
ctru.fopen("sdmc:/3ds/MyApp/save.dat", "rb")
ctru.fclose(file)
ctru.fread(&data, size_of(type), 1, file)
ctru.fwrite(&data, size_of(type), 1, file)
ctru.mkdir("sdmc:/3ds/MyApp", 0o755)
```

`fopen`/`fclose`/`fread`/`fwrite` work with both `romfs:/` and `sdmc:/` paths.
`mkdir` returns -1 if the directory already exists — this is not an error.

---

## Package: c3d

Wraps Citro3D — the low-level GPU library. Most 2D games only need the frame
management functions; the rest is for custom shaders and 3D rendering.

### Short aliases

> **Note on the examples:** The example projects in `Examples/` were written before the
> short aliases existed and use the full `C3D_`-prefixed names throughout
> (e.g. `c3d.C3D_Init`, `c3d.C3D_FrameBegin`). Both forms are valid — the aliases are
> compile-time name bindings with zero runtime cost. New code should prefer the short form.

All `C3D_`-prefixed functions, types, and constants have short aliases defined at the
bottom of each binding file:

```odin
c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)  →  c3d.Init(c3d.DEFAULT_CMDBUF_SIZE)
c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW) →  c3d.FrameBegin(c3d.FRAME_SYNCDRAW)
c3d.C3D_FrameEnd(0)                         →  c3d.FrameEnd(0)
c3d.C3D_Fini()                              →  c3d.Fini()
```

Use whichever you prefer — both compile to the same call.

### Frame management

```odin
c3d.FrameBegin(c3d.FRAME_SYNCDRAW)  // wait for vsync, begin command list
// ... citro2d draw calls go here ...
c3d.FrameEnd(0)                      // submit command list to GPU
```

`FRAME_SYNCDRAW` locks to the display refresh rate (60 Hz on 3DS). This is almost
always what you want — it eliminates tearing and gives consistent physics timing.

### Textures

`C3D_Tex` is exposed as an opaque `[24]u8`. **Never access its fields directly from Odin.**
Always use the C3D_Tex* API functions or pass it by pointer to citro2d.

Textures on the 3DS must have **power-of-two dimensions** (64, 128, 256, 512...).
When tritex converts a non-POT image, it pads the canvas to the next POT automatically
and adjusts the UV sub-texture coordinates.

`C3D_TexEnv` is also opaque (`[20]u8`). Always manipulate it through
`c3d.TexEnvInit`, `c3d.TexEnvSrc`, `c3d.TexEnvFunc`, etc.

### Types reference

| Type              | Description                                         |
|-------------------|-----------------------------------------------------|
| `c3d.FVec`        | 4-component float vector (x, y, z, w)               |
| `c3d.Mtx`         | 4×4 row-major float matrix                          |
| `c3d.Tex`         | Opaque GPU texture handle                           |
| `c3d.TexEnv`      | Opaque texture combiner stage                       |
| `c3d.LightEnv`    | Opaque lighting environment                         |
| `c3d.FrameBuf`    | Framebuffer descriptor                              |
| `c3d.AttrInfo`    | Vertex attribute layout descriptor                  |
| `c3d.BufInfo`     | Vertex buffer descriptor                            |

---

## Package: c2d

Wraps Citro2D — the high-level 2D drawing library. This is the primary package for
2D games.

### Short aliases

> **Note on the examples:** The example projects in `Examples/` were written before the
> short aliases existed and use the full `C2D_`-prefixed names throughout
> (e.g. `c2d.C2D_DrawSprite`, `c2d.C2D_SpriteSheetLoad`). Both forms are valid — the
> aliases are compile-time name bindings with zero runtime cost. New code should prefer
> the short form.

All `C2D_`-prefixed functions, types, and constants have short aliases defined at the
bottom of each binding file:

```odin
c2d.C2D_DrawSprite(&sprite)         →  c2d.DrawSprite(&sprite)
c2d.C2D_SpriteSheetLoad(path)       →  c2d.SpriteSheetLoad(path)
c2d.C2D_SpriteFromSheet(&s, sh, 0)  →  c2d.SpriteFromSheet(&s, sh, 0)
c2d.C2D_SpriteSetPos(&s, x, y)      →  c2d.SpriteSetPos(&s, x, y)
c2d.C2D_TextBufNew(32)              →  c2d.TextBufNew(32)  // via C2D_TextBufNew alias
c2d.C2D_Color32(r, g, b, a)         →  c2d.Color32(r, g, b, a)
c2d.C2D_WithColor                   →  c2d.WithColor
c2d.C2D_AlignCenter                 →  c2d.AlignCenter
```

### Initialisation

```odin
c2d.Init(c2d.DEFAULT_MAX_OBJECTS)  // allocate internal draw buffer (4096 objects)
c2d.Prepare()                       // bind citro2d's built-in shader
```

`DEFAULT_MAX_OBJECTS` is 4096. Each draw call (sprite, rectangle, text glyph) consumes
one object slot. If you exceed the limit, draw calls are silently dropped. Increase the
value if you draw many objects per frame.

### Render targets

```odin
top    := c2d.CreateScreenTarget(ctru.GFX_TOP,    ctru.GFX_LEFT)
bottom := c2d.CreateScreenTarget(ctru.GFX_BOTTOM, ctru.GFX_LEFT)
```

`GFX_RIGHT` is only for stereoscopic 3D on the top screen. Use `GFX_LEFT` for both
screens in normal 2D games.

### Per-frame render loop

```odin
c3d.FrameBegin(c3d.FRAME_SYNCDRAW)

// Top screen
c2d.TargetClear(top, clrClear)   // fill with background colour
c2d.SceneBegin(top)              // all following draw calls go to top screen
// ... draw calls ...

// Bottom screen
c2d.TargetClear(bottom, clrClear)
c2d.SceneBegin(bottom)
// ... draw calls ...

c3d.FrameEnd(0)
```

Everything between `SceneBegin` and the next `SceneBegin` (or `FrameEnd`) is drawn
to that target. Draw order within a scene is back-to-front — draw backgrounds first,
foreground last.

### Colours

```odin
// RGBA, each channel 0x00–0xFF
clr := c2d.Color32(r, g, b, a)

// Alpha of 0x1 is near-invisible — a common mistake
clrWhite := c2d.Color32(0xFF, 0xFF, 0xFF, 0xFF)  // correct
clrBad   := c2d.Color32(0xFF, 0xFF, 0xFF, 0x01)  // nearly transparent!
```

### Sprite sheets

A `.t3x` file is a sprite sheet — one GPU texture with one or more sub-texture UV
regions. Load it once and keep the handle alive for the lifetime of the game.

```odin
sheet := c2d.SpriteSheetLoad("romfs:/gfx/player.t3x")
count := c2d.SpriteSheetCount(sheet)   // number of frames/sprites in the sheet

sprite: c2d.Sprite
c2d.SpriteFromSheet(&sprite, sheet, 0) // bind frame index 0
c2d.SpriteSetCenter(&sprite, 0.5, 0.5) // pivot at centre
c2d.SpriteSetPos(&sprite, x, y)
c2d.SpriteSetRotationDegrees(&sprite, 45)
c2d.DrawSprite(&sprite)

c2d.SpriteSheetFree(sheet)             // free when done
```

**Sprite centre** is normalised: `(0.0, 0.0)` = top-left corner, `(0.5, 0.5)` = centre,
`(1.0, 1.0)` = bottom-right. The centre is the rotation pivot and the point that
`SpriteSetPos` places at the given coordinates.

To create a sprite sheet from multiple images, use a `.t3s` script file and tritex:

```
# bird.t3s
bird0.png
bird1.png
bird2.png
bird3.png
```

```bat
tritex -a -o romfs\gfx\bird.t3x -i assets\images\bird\bird.t3s
```

### Sub-pixel jitter

Sprites positioned at non-integer coordinates are interpolated by the GPU between
adjacent pixels each frame, causing visible wobble on moving objects and hairline seams
between tiled backgrounds.

**Fix:** keep internal positions as `f32` for smooth physics, but truncate to integer
before calling `SpriteSetPos`:

```odin
c2d.SpriteSetPos(&sprite,
    cast(f32)cast(i32)x,
    cast(f32)cast(i32)y)
```

### Text

```odin
// Allocate a glyph buffer — argument is the GLYPH COUNT, not byte count.
// Always allocate slightly more than the character count of your longest string.
buf := c2d.C2D_TextBufNew(32)

text: c2d.C2D_Text
c2d.C2D_TextParse(&text, buf, "Hello World")
c2d.C2D_TextOptimize(&text)   // pre-sort glyphs for faster rendering

// Draw at (x=10, y=20, z=0), scale 1.0×1.0
c2d.DrawText(&text, c2d.WithColor, 10, 20, 0, 1.0, 1.0, clrWhite)

// Centred on x=160
c2d.DrawText(&text, c2d.AlignCenter | c2d.WithColor, 160, 20, 0, 1.0, 1.0, clrWhite)
```

For **dynamic text** (score counters, etc.) clear and re-parse each frame:

```odin
c2d.C2D_TextBufClear(dynBuf)
ctru.snprintf(&str[0], size_of(str), "%u", value)
c2d.C2D_TextParse(&dynText, dynBuf, cstring(&str[0]))
```

Text flag constants (combine with `|`):

| Flag                  | Effect                                      |
|-----------------------|---------------------------------------------|
| `c2d.WithColor`       | Pass a `u32` colour as the next argument    |
| `c2d.AlignLeft`       | Left-align at x (default)                   |
| `c2d.AlignCenter`     | Centre on x                                 |
| `c2d.AlignRight`      | Right-align at x                            |
| `c2d.AlignJustified`  | Justify within wrap width                   |
| `c2d.AtBaseline`      | y is the text baseline, not the top         |
| `c2d.WordWrap`        | Pass a `f32` wrap width as the next argument|

### Shapes

```odin
c2d.DrawRectSolid(x, y, z, w, h, colour)
c2d.DrawCircleSolid(x, y, z, radius, colour)
c2d.DrawLine(x0, y0, x1, y1, colour0, colour1, thickness, z)
c2d.DrawTriangle(x0,y0, x1,y1, x2,y2, c0,c1,c2, z)
```

### Tint modes

```odin
c2d.SetTintMode(.Solid)  // default — tint colour replaces texture colour
c2d.SetTintMode(.Mult)   // tint colour multiplied with texture colour
c2d.SetTintMode(.Luma)   // tint based on luminance
```

---

## Package: audio

Helper library wrapping libctru's NDSP (Nintendo DSP) audio service.

### NDSP initialisation

```odin
ctru.ndspInit()                         // loads dspfirm.cdc from romfs automatically
ctru.ndspSetOutputMode(.STEREO)

// Configure a channel (0–23 available)
CHANNEL :: i32(0)
ctru.ndspChnReset(CHANNEL)
ctru.ndspChnInitParams(CHANNEL)
ctru.ndspChnSetInterp(CHANNEL, .LINEAR)
ctru.ndspChnSetRate(CHANNEL, 44100.0)
ctru.ndspChnSetFormat(CHANNEL, ctru.NDSP_FORMAT_MONO_PCM16)

mix: [12]f32
mix[0] = 1.0  // left
mix[1] = 1.0  // right
ctru.ndspChnSetMix(CHANNEL, &mix)
```

`dspfirm.cdc` must be present at `romfs:/dspfirm.cdc`. Without it, `ndspInit` fails
silently and no audio plays.

### Loading and playing a clip

```odin
clip, ok := audio.load_wav("romfs:/audio/coin.wav", CHANNEL)
if ok {
    audio.play(&clip)
}
defer audio.unload(&clip)
```

`audio.play` is safe to call every frame — it checks the wave buffer status and does
nothing if the sound is still playing.

### WAV format requirements

NDSP expects PCM audio. When converting from MP3, use:

```bat
ffmpeg -i input.mp3 -ar 44100 -ac 1 -acodec pcm_s16le output.wav
```

Or use the `mp3towav` tool in `tools/`:

```bat
mp3towav input.mp3 output.wav
```

Mismatched sample rates or bit depths between the WAV file and the channel configuration
cause distorted or silent playback.

### Audio memory

PCM buffers must be in **linear memory** (`linearAlloc`). The `audio.load_wav` proc
handles this automatically — never copy audio data to heap memory and submit it to NDSP.

### Wave buffer status constants

| Constant               | Meaning                      |
|------------------------|------------------------------|
| `NDSP_WBUF_FREE`       | Not queued                   |
| `NDSP_WBUF_QUEUED`     | Queued, not yet playing      |
| `NDSP_WBUF_PLAYING`    | Currently playing            |
| `NDSP_WBUF_DONE`       | Finished                     |

---

## Memory — linearAlloc vs heap

| Needs `linearAlloc`          | Normal heap is fine           |
|------------------------------|-------------------------------|
| Audio PCM wave buffers       | Game state structs            |
| GPU vertex buffers           | Animation / sprite data       |
| Shader binaries (DVLB)       | Text buffers (`C2D_TextBuf`)  |
| Sometimes: GPU textures      | Most everything else          |

GPU textures uploaded via `C3D_TexInit` or citro2d's `SpriteSheetLoad` handle their
own allocation internally. You do not need to `linearAlloc` for textures loaded through
the normal API.

---

## File I/O — romfs and sdmc

The 3DS has two relevant file systems for homebrew:

### romfs — read-only, embedded in the .3dsx

Mount with `ctru.romfsInit()`. Access via `romfs:/` prefix:

```odin
c2d.SpriteSheetLoad("romfs:/gfx/player.t3x")
audio.load_wav("romfs:/audio/coin.wav", CHANNEL)
```

Files here are baked into the binary at build time by the `3dsxtool` step in `build.bat`.

### sdmc — the SD card, read/write

Persistent save data goes here. Use the `sdmc:/3ds/<AppName>/` convention so the
Homebrew Launcher can display and manage your app's data.

```odin
SAVE_DIR  :: "sdmc:/3ds/MyGame"
SAVE_FILE :: "sdmc:/3ds/MyGame/save.dat"

save :: proc() {
    ctru.mkdir(SAVE_DIR, 0o755)   // create dir if missing; -1 return is OK
    f := ctru.fopen(SAVE_FILE, "wb")
    if f == nil do return
    ctru.fwrite(&data, size_of(data), 1, f)
    ctru.fclose(f)
}

load :: proc() {
    f := ctru.fopen(SAVE_FILE, "rb")
    if f == nil do return          // no save file yet — use defaults
    ctru.fread(&data, size_of(data), 1, f)
    ctru.fclose(f)
}
```

---

## Input

### Button input patterns

```odin
// Jump — one-shot on press
if kDown & ctru.KEY_A != 0 do player.velocity_y = JUMP_FORCE

// Movement — continuous while held
if kHeld & ctru.KEY_DRIGHT != 0 do player.x += speed

// Release detection
if kUp & ctru.KEY_A != 0 { /* released */ }
```

### Touch screen

```odin
if kDown & ctru.KEY_TOUCH != 0 {
    pos: ctru.touchPosition
    ctru.hidTouchRead(&pos)
    // pos.px = x (0–319), pos.py = y (0–239)
}
```

### Circle pad

```odin
pad: ctru.circlePosition
ctru.hidCircleRead(&pad)
// pad.dx, pad.dy — range approximately -154 to 154
if pad.dx > 32 do player.x += speed
```

### New 3DS C-stick (irrst)

```odin
ctru.irrstInit()
defer ctru.irrstExit()

// In loop:
ctru.irrstScanInput()
cstick: ctru.circlePosition
ctru.irrstCstickRead(&cstick)
```

---

## Build System

### build.bat overview

```bat
set TARGET=FlappyClone

:: 1. Convert images to .t3x
::    Folders with a .t3s file → atlas mode (multiple sprites into one .t3x)
::    Individual PNGs          → single-image .t3x
tritex -a -o romfs\gfx\bird.t3x -i assets\images\bird\bird.t3s
tritex assets\images\background.png romfs\gfx\background.t3x

:: 2. Copy audio to romfs
xcopy /y assets\audio\*.wav romfs\audio\

:: 3. Compile Odin → .o
odin build . -target:freestanding_arm_hardfloat ...

:: 4. Link .o → .elf
arm-none-eabi-gcc ...

:: 5. Strip .elf → .3dsx + romfs embed
3dsxtool app.elf app.3dsx --romfs=romfs --smdh=app.smdh

:: 6. Create SMDH metadata (name, description, author, icon)
smdhtool --create "Game Title" "Description" "Author" assets\icon.png app.smdh
```

### SMDH metadata

The SMDH file controls what the Homebrew Launcher displays. Without it, the launcher
shows the binary filename instead of the app name.

```bat
smdhtool --create "App Name" "Short description" "Author Name" icon.png output.smdh
```

The icon must be a **48×48 PNG**.

### tritex — texture converter

```bat
:: Single image
tritex input.png output.t3x

:: Atlas from a .t3s script (multi-sprite sheet)
tritex -a -o output.t3x -i sprites.t3s

:: With explicit format
tritex -f rgba8 input.png output.t3x
```

`.t3s` format (one image path per line):

```
# comment
frame0.png
frame1.png
frame2.png
```

Textures must have **power-of-two dimensions** or tritex will pad them. The sub-texture
UV coordinates in the output `.t3x` are adjusted to account for the padding, so the
visual result is correct.

---

## Common Gotchas

### `do` cannot span multiple lines

```odin
// WRONG — syntax error
if condition1 ||
   condition2  do return

// CORRECT
if condition1 ||
   condition2 { return }
```

### Labeled break to exit a loop from inside a switch

```odin
// Plain `break` only exits the switch, not the for loop.
game_loop: for ctru.aptMainLoop() {
    switch state {
    case .Quit:
        break game_loop  // exits the for loop
    }
}
```

### `C2D_TextBufNew` takes a glyph count, not byte count

```odin
// "Score:" is 6 characters — allocate a few more to be safe
buf := c2d.C2D_TextBufNew(16)  // not 6
```

### Alpha channel `0x01` is near-invisible

```odin
// The 4th argument to Color32 is alpha — 0x01 out of 255 is almost transparent
clr := c2d.Color32(0xFF, 0xFF, 0xFF, 0x01)  // WRONG — nearly invisible
clr := c2d.Color32(0xFF, 0xFF, 0xFF, 0xFF)  // CORRECT — fully opaque
```

### `consoleInit` and citro2d conflict

`ctru.consoleInit(ctru.GFX_BOTTOM, nil)` and `c2d.CreateScreenTarget(ctru.GFX_BOTTOM, ...)`
both claim the bottom screen framebuffer. Using both produces corrupted output.
Remove `consoleInit` when switching a screen to citro2d graphics.

### Textures must be power-of-two

The 3DS GPU only accepts textures with POT dimensions. tritex pads automatically,
but if you create raw `C3D_Tex` objects, you must round up manually.

### DSP firmware must be in romfs

`ndspInit()` loads `romfs:/dspfirm.cdc` automatically. If the file is missing, the
call silently succeeds but no audio plays. Ensure the firmware file is copied to the
`romfs/` folder during build.

### Parallax seams and sprite jitter both come from sub-pixel positions

Any non-integer coordinate passed to `SpriteSetPos` causes the GPU to interpolate
across pixel boundaries each frame. For moving objects, truncate before drawing:

```odin
c2d.SpriteSetPos(&s, cast(f32)cast(i32)x, cast(f32)cast(i32)y)
```

For tiled backgrounds, snap the scroll offset before computing draw positions:

```odin
pixel_offset := cast(f32)cast(i32)layer.offset
for i in 0..<copies {
    c2d.SpriteSetPos(&layer.sprite, f32(i)*layer.img_w - pixel_offset, ...)
}
```

### `C3D_Tex` and `C3D_TexEnv` are opaque — never access fields directly

Both are declared as byte arrays (`[24]u8` and `[20]u8`). The actual C struct layouts
involve bitfields and platform-specific alignment that cannot be safely replicated in
Odin. Always use the provided API functions.

### `break` inside a switch vs a for loop

In Odin, `break` inside a `switch` exits the `switch` only. To exit an outer `for`
loop, use a labeled break: `break loop_label`. This is different from C, where
`break` in a switch exits only the switch but is inside the for loop's body.

### Save files belong in `sdmc:/3ds/<AppName>/`

This is the standard path that the Homebrew Launcher expects for app data.
Always call `ctru.mkdir` before `fopen` with `"wb"` — the directory may not exist
on first launch.

---

## Camera — CAM service

> Tested and confirmed working on 3DS LL hardware.
> The example is a port of the [devkitPro 3DS camera/video example](https://github.com/devkitPro/3ds-examples/blob/master/camera/video/source/main.c).

### Correct DMA setup — use `CAMU_GetMaxBytes`, not `CAMU_GetMaxLines`

`CAMU_GetMaxLines` fails silently for 400×240 (the CTR top-screen resolution) because the
image size (192 000 bytes) exceeds the function's internal 184 320-byte threshold. It returns
an error without writing to `*maxLines`, leaving `transferUnit = 0`. Passing 0 to
`CAMU_SetReceiving` causes it to fail without filling the event handle, and the subsequent
`svcWaitSynchronization(handle=0, max_timeout)` causes a kernel panic that hard-crashes the console.

The correct approach uses `CAMU_GetMaxBytes` and `CAMU_SetTransferBytes`:

```odin
bufSize: u32
ctru.CAMU_GetMaxBytes(&bufSize, WIDTH, HEIGHT)
ctru.CAMU_SetTransferBytes(ctru.CAM_PORT_BOTH, bufSize, WIDTH, HEIGHT)
// later, in the capture loop:
ctru.CAMU_SetReceiving(&event, buf, ctru.CAM_PORT_CAM1, SCREEN_SIZE, i16(bufSize))
```

### Continuous capture with 4-handle event loop

Unlike a simple per-frame start/stop pattern, the recommended approach starts the camera once
and uses `svcWaitSynchronizationN` to multiplex four handles per frame:

| Index | Handle | Meaning |
|-------|--------|---------|
| 0 | `CAMU_GetBufferErrorInterruptEvent(CAM_PORT_CAM1)` | DMA error on CAM1 |
| 1 | `CAMU_GetBufferErrorInterruptEvent(CAM_PORT_CAM2)` | DMA error on CAM2 |
| 2 | `CAMU_SetReceiving(CAM_PORT_CAM1)` | Frame ready from CAM1 |
| 3 | `CAMU_SetReceiving(CAM_PORT_CAM2)` | Frame ready from CAM2 |

When an error event fires (index 0 or 1), close the corresponding receive handle, set a
`captureInterrupted` flag, and call `CAMU_StartCapture` again next iteration. When a receive
event fires (index 2 or 3), close and zero the handle so it gets re-registered next frame.

```odin
ctru.svcWaitSynchronizationN(&index, &events[0], 4, false, WAIT_TIMEOUT)
switch index {
case 0: // CAM1 buffer error
    ctru.svcCloseHandle(events[2]); events[2] = 0
    captureInterrupted = true; continue
case 2: // CAM1 frame ready
    ctru.svcCloseHandle(events[2]); events[2] = 0
    // blit events[2]'s buffer to screen
}
```

### RGB565 → BGR8 blit

`gfxInitDefault` sets the top screen to BGR8 (3 bytes/pixel). The camera outputs RGB565
(2 bytes/pixel, row-major). A conversion blit with y-flip and column-major reordering is required:

```odin
// RGB565: bits[15:11]=R, bits[10:5]=G, bits[4:0]=B
// BGR8 framebuffer: byte 0=B, byte 1=G, byte 2=R
for j in 0..<HEIGHT {
    for i in 0..<WIDTH {
        draw_y := HEIGHT - j          // y-flip
        v      := (draw_y + i * HEIGHT) * 3  // column-major index
        data   := img[j * WIDTH + i]
        fb[v]   = u8((data & 0x1F) << 3)          // B from RGB565
        fb[v+1] = u8(((data >> 5) & 0x3F) << 2)   // G
        fb[v+2] = u8(((data >> 11) & 0x1F) << 3)  // R from RGB565
    }
}
```

### Camera init order

```odin
ctru.camInit()
ctru.CAMU_SetSize(ctru.CAM_SELECT_OUT1_OUT2, .CTR_TOP_LCD, .A)
ctru.CAMU_SetOutputFormat(ctru.CAM_SELECT_OUT1_OUT2, .RGB_565, .A)
ctru.CAMU_SetFrameRate(ctru.CAM_SELECT_OUT1_OUT2, .RATE_30)
ctru.CAMU_SetNoiseFilter(ctru.CAM_SELECT_OUT1_OUT2, true)
ctru.CAMU_SetAutoExposure(ctru.CAM_SELECT_OUT1_OUT2, true)
ctru.CAMU_SetAutoWhiteBalance(ctru.CAM_SELECT_OUT1_OUT2, true)
ctru.CAMU_SetTrimming(ctru.CAM_PORT_CAM1, false)
ctru.CAMU_SetTrimming(ctru.CAM_PORT_CAM2, false)
// Get DMA byte size BEFORE Activate:
ctru.CAMU_GetMaxBytes(&bufSize, WIDTH, HEIGHT)
ctru.CAMU_SetTransferBytes(ctru.CAM_PORT_BOTH, bufSize, WIDTH, HEIGHT)
ctru.CAMU_Activate(ctru.CAM_SELECT_OUT1_OUT2)
```

---

## Microphone — MIC service

> Tested and confirmed working on 3DS LL hardware.
> The example is a port of the [devkitPro 3DS audio/mic example](https://github.com/devkitPro/3ds-examples/blob/master/audio/mic/source/main.c).

### Buffer must be page-aligned heap memory

`micInit` passes the buffer to the kernel as a shared-memory object. The 3DS kernel requires
shared memory to start on a 0x1000-byte (4096-byte) page boundary.

- ❌ `linearAlloc` — only 16-byte alignment, will kernel-panic
- ✅ `memalign(0x1000, size)` — page-aligned regular heap (matches devkitPro example)

```odin
micBuf := cast([^]u8)ctru.memalign(0x1000, uint(MIC_BUF_SIZE))
defer ctru.free(cast(rawptr)micBuf)

ctru.micInit(micBuf, MIC_BUF_SIZE)
dataSize := ctru.micGetSampleDataSize()  // call AFTER micInit
```

### Correct init order

```odin
// 1. Allocate page-aligned buffer
// 2. micInit
// 3. micGetSampleDataSize()   ← AFTER micInit, not computed manually
// 4. MICU_SetGain
// 5. MICU_StartSampling with dataSize from step 3
```

Do not compute `dataSize` as `bufferSize - 4` manually — always read it from `micGetSampleDataSize()`
after `micInit` has configured the shared memory.

### Ring buffer read pattern

`micGetLastSampleOffset()` returns the current write-head byte position within the buffer.
Advance the read-head one byte at a time, wrapping at `dataSize`:

```odin
writePos := ctru.micGetLastSampleOffset()
for readPos != writePos {
    lo := u16(micBuf[readPos])
    readPos = (readPos + 1) % dataSize
    hi := u16(micBuf[readPos])
    readPos = (readPos + 1) % dataSize
    sample := i16(lo | (hi << 8))
    // process sample...
}
```

### Recommended buffer size and sample rate

Use at least 0x30000 bytes (192 KB) as the ring buffer — this is the size used in the official
devkitPro example. At `RATE_16360` (16 360 Hz PCM16) this gives about 6 seconds of buffer before
wrapping. Smaller buffers (e.g. 0x8000) can wrap in under a second and may cause the read-head
to lap the write-head.
