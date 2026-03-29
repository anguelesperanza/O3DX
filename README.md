# O3DX

**O**din + **3D**S + **.3dx** — Nintendo 3DS homebrew development in Odin. Bindings, examples, tools, and a project template to get started fast.

Special thanks to **Ske** (https://codeberg.org/ske/3ds-odin) for creating the original Codeberg repository and proof-of-concept that this project builds on.

(Developer Note) These `.md` files were written by Claude as part of the AI testing experiment I was doing. Information in here is based on the assumptions and informaiton it uncovered.
Not everything may be correct, and something may be missing nuances or are simply wrong entirely. As you should with all AI explinations, take it with a grain of salt
until you are able to verify everything you need yourself directly. It is better to use it as a guide rather than a source of truth.

(Developer Note) I was not able to properly test / implement everything I wanted. There is enough to make a 2D game at least and there functions for 3DS are there as well.
No skyboxes implementation on `tritex`, and no 3D game example (though there are 3D examples). My SD card died during the development pretty much after finishing the `FlappyClone` game example
and I do not have a suitable replacement at this time. 
 
---

## What this repository does

O3DX explores how far Odin can be pushed for 3DS homebrew development.

This project is an experiment in using AI (Claude) as a long-term collaborator on a non-trivial engineering project — writing bindings, debugging ABI issues, designing tools, building a full game, and maintaining documentation across many sessions. Claude acted as a pair programmer: researching the 3DS hardware and library internals, diagnosing bugs through binary analysis, writing and refactoring code, and authoring docs — while the human drove direction, tested on real hardware, and made final calls.

Unless not possible, all examples use a `build.bat` file instead of a Makefile.

> **Note:** `main.c` files may show import errors for 3DS headers depending on your IDE. If DevKitPro is installed correctly you can ignore these — the editor cannot locate the headers but GCC can.

---

## Requirements

1. [Odin Language](https://odin-lang.org/)
2. [DevKitPro](https://devkitpro.org/) — with `3ds-dev` installed
3. GCC (arm-none-eabi from DevKitPro — MSVC is not tested)

---

## Repository Structure

```
3ds-odin/
├── lib/                        ← Shared Odin package library (use these in your own projects)
│   ├── bridge_utils.h          ← Shared u2f / f2u helpers for ABI bridge .c files
│   ├── ctru/
│   │   ├── ctru.odin           ← libctru bindings (gfx, input, console, romfs, etc.)
│   │   └── bridge.c            ← Wrappers for static-inline libctru functions
│   ├── c2d/
│   │   ├── types.odin          ← Citro2D types (C2D_Image, C2D_ImageTint, C2D_Sprite, …)
│   │   ├── base.odin           ← Core drawing, tinting, view transforms ✅
│   │   │   ├── text.odin           ← Text rendering ✅ (Phase 3)
│   │   ├── font.odin           ← Font loading ✅ (Phase 4)
│   │   ├── sprite.odin         ← Sprite helpers ✅ (Phase 4)
│   │   ├── spritesheet.odin    ← SpriteSheet loading ✅ (Phase 4)
│   │   └── bridge.c            ← ABI bridge for all float-param Citro2D functions
│   └── c3d/
│       ├── types.odin          ← Citro3D types + all GPU_* enums ✅
│       ├── base.odin           ← Full C3D foreign bindings (declared) ✅
│       ├── math.odin           ← Full FVec/Mtx/Quat math library ✅ (Phase 8)
│       └── bridge.c            ← ABI bridge for all float-param Citro3D functions
│
├── Examples/
│   ├── Shapes-Example/         ← Basic shapes via C2D ✅
│   ├── Image-Example/          ← Loading and displaying a .t3x sprite ✅
│   ├── Input-Example/          ← Button, circle pad, touch input ✅
│   ├── DrawLine-Example/       ← C2D_DrawLine ✅
│   ├── DrawRectSolid-Example/  ← C2D_DrawRectSolid ✅
│   ├── DrawEllipseSolid-Example/ ← C2D_DrawEllipseSolid ✅
│   ├── DrawImageAtRotated-Example/ ← C2D_DrawImageAtRotated ✅
│   ├── ViewTranslate-Example/  ← C2D_ViewTranslate ✅
│   ├── ViewScale-Example/      ← C2D_ViewScale ✅
│   ├── ViewRotate-Example/     ← C2D_ViewRotate ✅
│   ├── ViewShear-Example/      ← C2D_ViewShear ✅
│   ├── PlainImageTint-Example/ ← C2D_PlainImageTint ✅
│   ├── AlphaImageTint-Example/ ← C2D_AlphaImageTint ✅
│   ├── SetImageTint-Example/   ← C2D_SetImageTint ✅
│   ├── Color32f-Example/       ← C2D_Color32f ✅
│   ├── Fade-Example/           ← C2D_Fade ✅
│   ├── SetTintMode-Example/    ← C2D_SetTintMode ✅
│   ├── DrawText-Example/       ← C2D_DrawText (3 scales) ✅
│   ├── DrawTextColor-Example/  ← C2D_DrawTextColor ✅
│   ├── DrawTextAlign-Example/  ← C2D_AlignLeft/Center/Right ✅
│   ├── DrawTextWrap-Example/   ← C2D_DrawTextColorWrap ✅
│   ├── DrawTextDynamic-Example/ ← TextBufClear + snprintf counter ✅
│   ├── SpriteSheet-Example/    ← Full sprite-sheet pipeline: C2D_SpriteSheetLoad → C2D_SpriteFromSheet + all sprite helpers ✅
│   ├── CustomFont-Example/     ← C2D_FontLoadSystem + C2D_TextFontParse ✅
│   ├── Triangle-Example/       ← Citro3D: vertex buffers, PICA200 shader, per-vertex colour ✅
│   ├── Texture-Example/        ← Citro3D: procedural texture, Morton tiling, C3D_TexBind ✅
│   ├── DepthTest-Example/      ← Citro3D: depth test, PICA200 reverse-Z, GEQUAL convention ✅
│   ├── AlphaBlend-Example/     ← Citro3D: src-alpha blending, back-to-front draw order ✅
│   ├── SpinningCube-Example/   ← Citro3D: 3D perspective, model matrix, spinning cube ✅ (Phase 8)
│   ├── Lighting-Example/       ← Citro3D: PICA200 hardware lighting, normalquat, LightEnv/Light/LUT ✅ (Phase 9)
│   ├── Audio-Example/          ← NDSP audio: WAV from romfs, looping playback, volume control ✅ (Phase 11)
│   ├── SaveData-Example/       ← FS service: read/write save struct to SD card ✅ (Phase 11)
│   └── Games/
│       └── FlappyClone/        ← Full 2D game: sprites, animation, physics, audio, parallax, save data ✅
│
├── tools/
│   ├── tritex.odin             ← PNG/JPEG → .t3x converter (renamed from png2t3x); atlas + .t3s support
│   ├── tritex.exe              ← Compiled binary (build with: odin build tools/tritex.odin -file -out:tools/tritex.exe)
│   ├── howto.md                ← tritex usage reference
│   └── mp3towav/               ← MP3 → WAV converter (uses vendor:miniaudio)
│       └── mp3towav.odin
│
└── docs.md                     ← Full developer reference: bindings, nuances, gotchas
```

---

## How it works

### Build pipeline

`odin build .` and `odin run .` alone cannot produce a 3DS executable.
The `build.bat` in each example drives the full pipeline:

```
Odin source
   │  odin build . -target:freestanding_arm32 -o:speed -build-mode:asm -no-entry-point -min-link-libs -no-thread-local
   ▼
ARM assembly (.S)
   │  arm-none-eabi-gcc -march=armv6k -mfloat-abi=hard
   ▼
Object files (.o)  ←── also: main.c  +  lib/*/bridge.c
   │  arm-none-eabi-gcc -specs=3dsx.specs -lcitro2d -lcitro3d -lctru
   ▼
ELF executable
   │  3dsxtool + smdhtool
   ▼
app.3dsx  (run on hardware or in Citra)
```

### ABI bridge — why it exists

Odin's `freestanding_arm32` target generates **soft-float ABI** code: `float` arguments travel in general-purpose registers (`r0`, `r1`, …).

DevKitARM's libctru / citro2d / citro3d are compiled with **hard-float ABI**: `float` arguments are expected in VFP registers (`s0`, `s1`, …).

These two conventions are completely incompatible. Calling a hard-float function directly from soft-float Odin corrupts every floating-point argument.

The fix is a set of wrapper functions in each `bridge.c` file, compiled by GCC with `-mfloat-abi=hard`, that:

1. Accept float arguments as `uint32_t` (integer registers — both ABIs agree on those)
2. Reinterpret the bit-pattern as `float` using `memcpy` (the `u2f()` helper in `bridge_utils.h`)
3. Call the real library function with proper hard-float arguments

```
Odin (soft-float)      bridge.c (hard-float GCC)       libctru (hard-float)
─────────────────      ─────────────────────────       ────────────────────
f32 bits → r0      →   uint32_t x → u2f() → float  →   float in s0  ✓
f32 bits → r1      →   uint32_t y → u2f() → float  →   float in s1  ✓
u32      → r2      →   uint32_t clr (pass-through)  →   u32 in r2    ✓
```

Functions that only take integer or pointer arguments (the majority of libctru) can be called directly with a plain `foreign` declaration — no bridge needed.

Static-inline C functions (e.g. `romfsInit`, `C2D_SceneBegin`, all sprite helpers) have no exported linker symbol, so they also require a bridge wrapper.

### u64 argument alignment — a second ABI hazard

The ARM32 AAPCS requires `u64` arguments to start at an **even-numbered register** (`r0`, `r2`, …).
When a `u64` argument is preceded by an odd number of register-sized arguments, one register must
be skipped as padding so the `u64` lands on an even boundary.

Odin's `freestanding_arm32` target does **not** insert this padding, so any libctru function with
a `u64` parameter in an "odd" position receives corrupted arguments at runtime — no compile-time
warning is produced.

**Rule of thumb:** a `u64` parameter is safe when it is either the first argument or when it is
preceded by exactly two register-sized arguments (pointers or `u32`s). It is unsafe when it is
preceded by exactly one register-sized argument.

**Known affected functions in `lib/ctru/fs.odin`:** `FSUSER_OpenFile` and `FSFILE_SetSize`.
See the SaveData-Example implementation notes in Phase 11 for the full analysis and workaround.

### The `lib/` shared packages

Rather than duplicating bindings in every example, all declarations live in `lib/`:

| Package | Import path | Contains |
|---|---|---|
| `ctru`  | `../../lib/ctru`  | gfx, input, APT (full), console, romfs, irrst, SVC (full), NDSP audio, FS filesystem |
| `c2d`   | `../../lib/c2d`   | All Citro2D types, drawing, tinting, view transforms |
| `c3d`   | `../../lib/c3d`   | All Citro3D types, GPU enums, frame/texture/effect functions |
| `audio` | `../../lib/audio` | WAV loading (`linearAlloc`-backed) and NDSP clip playback helpers |

Example usage:
```odin
import ctru  "../../lib/ctru"
import c2d   "../../lib/c2d"
import c3d   "../../lib/c3d"
import audio "../../lib/audio"

top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)
c2d.C2D_DrawRectSolid(10, 10, 0, 80, 60, c2d.C2D_Color32(0xFF, 0, 0, 0xFF))
```

> **Short-form aliases:** Every `C2D_`- and `C3D_`-prefixed function, type, and constant has a
> shorter alias in its package that drops the prefix — so `c2d.C2D_DrawSprite` can be written
> as `c2d.DrawSprite`, and `c3d.C3D_Init` as `c3d.Init`. The examples in this repository were
> written before the aliases existed and use the full prefixed names throughout. Both styles
> compile identically; new code should prefer the short form. See `docs.md` for the full list.

Each example's `build.bat` compiles the three bridge objects (`ctru_bridge.o`, `c2d_bridge.o`, `c3d_bridge.o`) from the shared `lib/` directory and links them alongside the Odin assembly.

---

## Implementation Plan

### ✅ Phase 1 — Shared library structure
Migrated all bindings out of per-example files into a shared `lib/` directory.
All three original examples (Shapes, Image, Input) updated and verified.

### ✅ Phase 2 — Citro2D core bindings + individual examples
Every tested function has its own self-contained example in `Examples/`.

**Implemented and tested:**
- `C2D_DrawLine`, `C2D_DrawRectSolid`, `C2D_DrawEllipseSolid`
- `C2D_DrawImageAtRotated`
- `C2D_ViewTranslate`, `C2D_ViewScale`, `C2D_ViewRotate`, `C2D_ViewShear`
- `C2D_PlainImageTint`, `C2D_AlphaImageTint`, `C2D_SetImageTint`
- `C2D_Color32f`, `C2D_Fade`, `C2D_SetTintMode`

**Also implemented (tested via Shapes/Image examples):**
- `C2D_DrawRectangle`, `C2D_DrawTriangle`, `C2D_DrawCircle`, `C2D_DrawEllipse`
- `C2D_DrawImage`, `C2D_DrawImageAt`
- `C2D_DrawSprite`, `C2D_DrawSpriteTinted`
- `C2D_TopImageTint`, `C2D_BottomImageTint`, `C2D_LeftImageTint`, `C2D_RightImageTint`
- `C2D_ViewReset`, `C2D_ViewSave`, `C2D_ViewRestore`, `C2D_ViewRotateDegrees`
- `C2D_Color32`, `C2D_SceneSize`, `C2D_SceneTarget`

---

### ✅ Phase 3 — Citro2D text rendering

Bindings in `lib/c2d/text.odin`, bridge wrappers in `lib/c2d/bridge.c`.

**Key implementation note:** `C2D_DrawText` is a C variadic function. The bridge provides four
concrete wrappers covering every call signature (plain, +colour, +wrap, +colour+wrap) so Odin
never has to touch the variadic ABI directly. `wrapWidth` is promoted to `double` inside the
bridge because that is how `va_arg` reads it on ARM32.

| Function | Bridge needed? | Notes |
|---|---|---|
| `C2D_TextBufNew` | No | |
| `C2D_TextBufResize` | No | |
| `C2D_TextBufDelete` | No | |
| `C2D_TextBufClear` | No | |
| `C2D_TextBufGetNumGlyphs` | No | |
| `C2D_TextParseLine` | No | |
| `C2D_TextFontParseLine` | No | |
| `C2D_TextParse` | No | |
| `C2D_TextFontParse` | No | |
| `C2D_TextOptimize` | No | |
| `C2D_TextGetDimensions` | **Yes** | float scaleX, scaleY, outW, outH |
| `C2D_DrawText` | **Yes** | `c2d_draw_text` — no varargs |
| `C2D_DrawText` + colour | **Yes** | `c2d_draw_text_color` |
| `C2D_DrawText` + wrap | **Yes** | `c2d_draw_text_wrap` |
| `C2D_DrawText` + colour + wrap | **Yes** | `c2d_draw_text_color_wrap` |

Examples created: `DrawText-Example`, `DrawTextColor-Example`, `DrawTextAlign-Example`,
`DrawTextWrap-Example`, `DrawTextDynamic-Example`

---

### ✅ Phase 4 — Citro2D font, sprite, spritesheet

**Font** (`lib/c2d/font.odin`):

| Function | Bridge needed? | Notes |
|---|---|---|
| `C2D_FontLoad`, `FontLoadFromMem`, `FontLoadFromFD`, `FontLoadFromHandle`, `FontLoadSystem` | No | |
| `C2D_FontFree`, `FontSetFilter` | No | |
| `C2D_FontGlyphIndexFromCodePoint`, `FontGetCharWidthInfo`, `FontGetInfo` | No | |
| `C2D_FontCalcGlyphPos` | **Yes** | float scaleX, scaleY |

**SpriteSheet** (`lib/c2d/spritesheet.odin`):

| Function | Bridge needed? | Notes |
|---|---|---|
| `C2D_SpriteSheetLoad`, `SpriteSheetLoadFromMem`, `SpriteSheetFromFD`, `SpriteSheetLoadFromHandle`, `SpriteSheetFree` | No | exported symbols |
| `C2D_SpriteSheetCount` | **Yes** | static inline |
| `C2D_SpriteSheetGetImage` | **Yes** | static inline; returns via out-pointer to avoid struct-return ABI ambiguity |

**Sprite helpers** (`lib/c2d/sprite.odin`) — all `static inline`, all need bridge wrappers:

| Function | Notes |
|---|---|
| `C2D_SpriteFromImage` | passes C2D_Image struct by value through bridge |
| `C2D_SpriteFromSheet` | bridge calls static inline SpriteFromImage internally |
| `C2D_SpriteSetPos`, `SpriteSetScale`, `SpriteSetCenter`, `SpriteSetCenterRaw` | float x, y |
| `C2D_SpriteSetRotation`, `SpriteSetRotationDegrees` | float angle |
| `C2D_SpriteSetDepth` | float depth |
| `C2D_SpriteMove`, `SpriteScale`, `SpriteRotate`, `SpriteRotateDegrees` | delta variants |

Examples created: `SpriteSheet-Example`, `CustomFont-Example`

> **Note on `.t3x` files:** `C2D_SpriteSheetLoad` calls `Tex3DS_TextureImportStdio` internally and
> requires a `.t3x` file in the standard Tex3DS binary format. The DevKitPro `tex3ds` tool has a
> known bug on Windows that produces corrupt output. `tools/tritex.exe` (formerly `png2t3x`) is a
> drop-in replacement that writes the correct format and supports single images, texture atlases
> (`-a`), and `.t3s` include files (`-i`). All image-loading examples use
> `Tex3DS_TextureImportStdio` in their `main.c`, and `SpriteSheet-Example` uses the full
> `C2D_SpriteSheetLoad` → `C2D_SpriteFromSheet` pipeline end-to-end.

---

### ✅ Phase 5 — Citro3D core examples

- ✅ Render triangle to screen (vertex buffers, PICA200 shader, per-vertex colour)
- ✅ Texture mapping (C3D_Tex, TexEnv) — validated in Phase 6
- ✅ Depth testing and alpha blending — validated in Phase 7

#### Triangle-Example implementation notes

Getting a triangle rendering in Citro3D from Odin required working through several non-obvious
issues in the Odin → C ABI bridge. These are documented here so future phases don't have to
rediscover them.

**`C3D_FVec` field layout is reversed**

The C struct is declared as `{ float w; float z; float y; float x; }` (offsets 0, 4, 8, 12).
Odin's binding declares it as `{ x, y, z, w: f32 }` with the same offsets, so the field names are
swapped: `Odin .x` = `C .w` at offset 0. When writing struct literals the positional order is
`{x, y, z, w}` — remember that `.x` is actually the W component in memory.

**`Mtx_OrthoTilt` bridge does not write to the matrix at runtime**

The bridge function assembles correct arguments (verified by disassembly and `nm`) but the
projection matrix remains all-zero after the call when running in Citra. The root cause is a
soft-float / hard-float ABI edge case that manifests only at runtime. Workaround: set the matrix
manually in Odin using `C3D_FVec` struct literals, computing the values by hand from the
`Mtx_OrthoTilt` source. The full derivation is in `Examples/Triangle-Example/main.odin`.

**PICA200 framebuffer is portrait (240 × 400)**

The GPU renders into a 240 × 400 portrait buffer. `Mtx_OrthoTilt` (and the manual equivalent)
applies a 90° clockwise rotation so that the app can work in 400 × 240 landscape coordinates.
After the tilt, triangle winding appears reversed relative to the landscape coordinate system —
disable face culling with `C3D_CullFace(.NONE)` or re-wind your vertices accordingly.

**BufInfo permutation encoding**

`BufInfo_Add` takes a permutation nibble-field. For two buffer-loaded attributes (position → v0,
colour → v1) the value is `0x10`: nibble 0 = slot 0 → register 0 (v0), nibble 1 = slot 1 →
register 1 (v1).

---

### ✅ Phase 6 — Citro3D texture management

All texture management bindings validated with `Texture-Example`.

**Implemented and tested:**
- `C3D_TexInit` (bridge — static inline)
- `C3D_TexLoadImage`, `C3D_TexFlush`, `C3D_TexDelete`
- `C3D_TexBind` (bind to texture unit)
- `C3D_TexSetFilter`, `C3D_TexSetWrap` (bridge — static inline, set mag/min filter and U/V wrap)
- `C3D_Tex2DGetImagePtr` (bridge — returns raw GPU pixel buffer pointer for direct writes)
- `C3D_TexShadowParams`, `C3D_TexSetLodBias` (bridge — float params, declared; not tested in this phase)

**Also declared (not yet example-tested):**
- `C3D_TexInitWithParams`, `C3D_TexGenerateMipmap`

#### Texture-Example implementation notes

**Morton (Z-curve) tiling**

The PICA200 GPU does not accept scanline-order texture data.  Pixels must be
stored in Morton (Z-curve) order within 8×8 tiles, with tiles arranged
row-major.  The interleaving formula for a pixel at `(px, py)` within a tile:

```
morton = (px&1) | ((py&1)<<1) | ((px&2)<<1) | ((py&2)<<2) | ((px&4)<<2) | ((py&4)<<3)
```

The same algorithm is used in `tools/tritex.odin` for converting PNG files.

**ABGR byte order**

GPU_RGBA8 stores each pixel as four bytes in `[A, B, G, R]` order at consecutive
addresses (equivalent to a little-endian 0xRRGGBBAA u32 word).

**Direct-write pattern**

`C3D_TexInit` allocates the GPU-visible buffer in linear heap.  Rather than
allocating a separate staging buffer and going through `C3D_TexLoadImage` (GX DMA),
writing directly to `tex.data` via `C3D_Tex2DGetImagePtr` and then calling
`C3D_TexFlush` is simpler and matches the official citro3d example pattern.
`C3D_TexFlush` calls `GSPGPU_FlushDataCache` to flush CPU caches before the GPU
reads the texture.

---

### ✅ Phase 7 — Citro3D effects: depth test and alpha blend

All effect bindings validated with two focused examples.

**Implemented and tested:**
- `C3D_DepthMap` (bridge — float params: zScale, zOffset)
- `C3D_DepthTest` (enable, test function, write mask)
- `C3D_AlphaBlend` (blend equations and factors for colour and alpha)
- `C3D_CullFace` (already used since Phase 5)

**Declared but not yet example-tested:**
- `C3D_StencilTest`, `C3D_StencilOp`
- `C3D_AlphaTest`
- `C3D_ColorLogicOp`, `C3D_FragOpMode`
- `C3D_EarlyDepthTest`

#### DepthTest-Example implementation notes

**PICA200 uses reverse-Z with GEQUAL**

The PICA200 GPU clips z to the range `[-w, 0]` rather than `[-w, w]`.  With
`C3D_DepthMap(true, -1.0, 0.0)` the depth buffer value is computed as
`depth = -z_clip`.  Near geometry (small vertex-z → z_clip ≈ -1) gets a
**high** depth value (≈1); far geometry gets a **low** depth value (≈0).

Use `GPU_GEQUAL` as the test function: "pass if new_depth >= stored_depth".
This means nearer geometry (higher depth) beats farther geometry (lower depth).

Clear the depth buffer to `0` each frame so the first geometry drawn always
passes (any depth value ≥ 0).

```odin
c3d.C3D_DepthMap(true, -1.0, 0.0)          // near → depth 1, far → depth 0
c3d.C3D_DepthTest(true, .GEQUAL, .ALL)      // nearer wins
// ...
c3d.C3D_RenderTargetClear(top, c3d.C3D_CLEAR_ALL, bgColour, 0) // clearDepth=0
```

#### AlphaBlend-Example implementation notes

**Vertex alpha flows through TexEnv to the blend stage**

The vertex color attribute carries alpha in its `.w` component.  The vertex
shader passes it through unchanged (`mov out1, vtxclr`).  With TexEnv in
`C3D_Both / PRIMARY_COLOR / REPLACE` mode the full RGBA reaches the fragment
stage, where `C3D_AlphaBlend` uses it:

```odin
c3d.C3D_AlphaBlend(.ADD, .ADD,
                   .SRC_ALPHA, .ONE_MINUS_SRC_ALPHA,
                   .SRC_ALPHA, .ONE_MINUS_SRC_ALPHA)
```

**Back-to-front draw order is mandatory**

Alpha blending reads the existing framebuffer colour as the destination.
Geometry must be submitted back-to-front; depth test should be disabled
(`C3D_DepthTest(false, .ALWAYS, .ALL)`) to avoid farther transparent surfaces
failing the depth test before they can blend.

---

### ✅ Phase 8 — Citro3D math library (native Odin)

Full implementation of `maths.h` in `lib/c3d/math.odin`:
- Static-inline functions reimplemented natively in Odin (correct field-mapping)
- Exported functions bridged via `lib/c3d/bridge.c` (float ABI and FVec-by-value wrappers)
- Demo: `SpinningCube-Example` — 6-face colour-coded cube with live Y-axis rotation

**Static-inline → Odin-native:**
- `FVec4_New/Add/Subtract/Negate/Scale/PerspDivide/Dot/Magnitude/Normalize`
- `FVec3_New/Dot/Magnitude/Normalize/Add/Subtract/Distance/Scale/Negate/Cross`
- `Mtx_Zeros/Copy/Diagonal/Identity/Add/Subtract/MultiplyFVecH`
- `Quat_New/Negate/Add/Subtract/Scale/Normalize/Dot/Identity/Conjugate/Inverse`
- `FVec3_CrossQuat`

**Exported → bridged:**
- `Mtx_Transpose`, `Mtx_Multiply` (pointer-only — direct foreign import, no bridge needed)
- `Mtx_Inverse` → `mtx_inverse` (returns float bits as u32)
- `Mtx_MultiplyFVec3/4` → output-pointer bridges (FVec return value)
- `Mtx_FromQuat`, `Mtx_LookAt`, `Mtx_Rotate` → FVec/FQuat by-value bridges
- `Mtx_Translate/Scale/RotateX/Y/Z` → float parameter bridges
- `Mtx_Ortho/Persp/OrthoTilt/PerspTilt/PerspStereo/PerspStereoTilt` → full projection bridges
- `Quat_Multiply/Pow/CrossFVec3/Rotate/RotateX/Y/Z/FromMtx/FromPitchYawRoll/LookAt/FromAxisAngle`
- `odin_sqrtf` bridge (libm sqrtf — needed by Magnitude/Normalize)

#### Phase 8 implementation notes

**All math respects the reversed C3D_FVec field layout**

The `C3D_FVec` C struct stores `{ float w; float z; float y; float x; }` at offsets `{0, 4, 8, 12}`.
Odin declares `{ x, y, z, w: f32 }` at the same offsets, so field names are swapped:
`Odin .x` = logical W (offset 0), `Odin .w` = logical X (offset 12).

Every static-inline function in `math.odin` accounts for this. The helper `FVec4_New(lx, ly, lz, lw)` is the canonical constructor:
```odin
FVec4_New :: proc(lx, ly, lz, lw: f32) -> C3D_FVec {
    return C3D_FVec{ x = lw, y = lz, z = ly, w = lx }
}
```
Component-wise operations (Add, Subtract, Scale, Dot) use Odin field names directly since
the same offset mapping applies symmetrically to both operands.

**FVec3 operations zero out the logical W slot (Odin `.x`)**

`FVec3_New(lx, ly, lz)` = `C3D_FVec{ x=0, y=lz, z=ly, w=lx }`.
`FVec3_Dot` sums only Odin `.w + .z + .y` (skipping `.x` = logical W = 0).

**FVec3_Cross field derivation**

Cross product `A×B = (Ay·Bz−Az·By, Az·Bx−Ax·Bz, Ax·By−Ay·Bx)` in logical x,y,z.
With the mapping (logical X = Odin `.w`, logical Y = Odin `.z`, logical Z = Odin `.y`):
```odin
FVec3_Cross :: proc(a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{
        x = 0,
        y = a.w*b.z - a.z*b.w,   // logical Z
        z = a.y*b.w - a.w*b.y,   // logical Y
        w = a.z*b.y - a.y*b.z,   // logical X
    }
}
```

**Mtx_Diagonal field mapping**

`C3D_Mtx` diagonal entries: `r[0].x = lx` in C means `r[0].w = lx` in Odin (Odin `.w` = C `.x`):
```odin
out.r[0].w = x;  out.r[1].z = y;  out.r[2].y = z;  out.r[3].x = w
```

**Bridged FVec-by-value functions use output-pointer pattern**

Functions that pass or return `C3D_FVec`/`C3D_FQuat` by value are homogeneous floating-point
aggregates (HFAs) — the hard-float ABI passes them in VFP registers s0–s3, not integer registers.
The bridge pattern is:
```c
void mtx_multiply_fvec4(const C3D_Mtx* mtx, C3D_FVec* v, C3D_FVec* out) {
    *out = Mtx_MultiplyFVec4(mtx, *v);  // bridge.c (hard-float) passes *v in VFP regs correctly
}
```
Odin calls this with stack pointers; bridge.c (compiled `-mfloat-abi=hard`) handles the HFA
convention when forwarding to citro3d.

**sqrtf requires its own bridge**

`sqrtf` from libm uses the hard-float ABI (argument in s0, result in s0). It is wrapped the same
way as all other float functions:
```c
uint32_t odin_sqrtf(uint32_t x) { return f2u(sqrtf(u2f(x))); }
```

**SpinningCube-Example — coordinate conventions**

With `Mtx_PerspTilt(fovy=60°, aspect=400/240, near=0.01, far=100, isLeftHanded=true)`:
- Camera at origin; +Z direction goes into the screen (left-handed)
- Cube placed at z=+2 via `Mtx_Translate(0, 0, 2, true)`
- `Mtx_RotateY(angle, true)` applied before translation so the cube spins in place
- `C3D_CullFace(.NONE)` — disable culling while validating winding conventions
- Depth test with GEQUAL (same as DepthTest-Example reverse-Z setup)

---

### ✅ Phase 9 — Citro3D lighting, fog, proctex

- ✅ `C3D_LightEnv*`, `C3D_Light*` — hardware lighting environment, material, LUTs (`Lighting-Example`)
- ✅ `FogLut_Exp`, `C3D_FogGasMode` — distance fog
- ✅ `C3D_ProcTex*`, `ProcTexLut_*` — procedural texture generation

#### Phase 9 implementation notes — Lighting-Example

**PICA200 hardware lighting pipeline overview**

The PICA200 lighting unit reads two special vertex outputs written by the vertex shader:
- `outnq` (`normalquat`) — a half-angle quaternion encoding the view-space surface normal
- `outview` (`view`) — the view-space vertex position (used for attenuation and specular)

The lighting unit applies the bound `C3D_LightEnv` (material, LUTs, light positions/colours) and
produces `FRAGMENT_PRIMARY`, which is then consumed by the TexEnv stage. The TexEnv source must
be set to `GPU_TEVSRC.FRAGMENT_PRIMARY` (not `PRIMARY_COLOR`) to display the lit colour.

**Normalquat computation**

The normalquat is a half-angle quaternion from the +Z axis to the view-space normal `(nx, ny, nz)`:
```
c = sqrt((1 + nz) / 2)        -- half-angle cosine, clamped away from zero
q = (nx/(2c), ny/(2c), c, 0)  -- quaternion (x, y, z, w)
```

**PICA200 dp4 and reversed C3D_FVec order in temp registers**

When a `dp4` group writes to a temp register, the results land in reversed C3D_FVec order —
the first dp4 instruction fills the W component (stored in `.x`), the second fills Z (`.y`), etc.:
```pica
dp4 r2.x, modelView[0], r1   ; r2.x = nw_vs (= 0 for a direction)
dp4 r2.y, modelView[1], r1   ; r2.y = nz_vs
dp4 r2.z, modelView[2], r1   ; r2.z = ny_vs
dp4 r2.w, modelView[3], r1   ; r2.w = nx_vs
```
The normalquat math therefore reads `nx = r2.w`, `ny = r2.z`, `nz = r2.y`.

The view-space position is computed the same way and then swizzled back to natural order:
```pica
dp4 r5.x, modelView[0], r0
dp4 r5.y, modelView[1], r0
dp4 r5.z, modelView[2], r0
dp4 r5.w, modelView[3], r0
mov outview, r5.wzyx           ; swizzle reversed → natural (x,y,z,w)
```

**PICA200 ALU: constants must be src1, not src2**

The PICA200 ALU restricts constant registers (`.constf` aliases) to the **first** source operand
only. Placing a constant in the second source position (`src2`) is a hard assembler error:
```pica
; WRONG — assembler rejects "ones" in src2:
add r3.x, r2.y, ones

; CORRECT — swap operands (add/mul/max are commutative):
add r3.x, ones, r2.y
```

**Two dp4 groups per destination, never chain through a temp**

Two consecutive dp4 groups reading through an intermediate temp register give wrong results
because the reversed component order in the temp corrupts the second group's inputs. The fix
used throughout the lighting shader is one dp4 group per logical destination, each reading
directly from the original vertex input registers (`r0`, `r1`), never from a temp filled by a
previous dp4 group.

**`Mtx_Scale` — fixed**

The original Odin implementation built a diagonal matrix and called `Mtx_Multiply`, but
`Mtx_Multiply` operates on the reversed C3D flat-storage layout so the scale factors permuted
columns instead of scaling them.  Fixed by routing through the C bridge (`mtx_scale` in
`lib/c3d/bridge.c`), which calls citro3d's `Mtx_Scale` directly — it multiplies `r[i].x/y/z`
in-place, bypassing the multiply entirely.

```odin
// Now works correctly:
c3d.Mtx_Scale(&model, 0.5, 0.5, 0.5)
```

---

### ✅ Phase 10 — Combining textures + lighting in one TexEnv chain

Rather than a separate example, here is the key pattern for combining a diffuse texture with
per-vertex lighting in a single TexEnv stage.

The goal: `fragment_color = texture_color × lighting_color`.

**TexEnv stage 0 — modulate texture by primary color (lit vertex color):**

```odin
env := c3d.C3D_GetTexEnv(0)
c3d.C3D_TexEnvInit(env)
// Source: texture for RGB, primary (lit) color for alpha
c3d.C3D_TexEnvSrc(env, c3d.C3D_RGB,   .TEXTURE0, .PRIMARY_COLOR, .PRIMARY_COLOR)
c3d.C3D_TexEnvSrc(env, c3d.C3D_Alpha, .PRIMARY_COLOR, .PRIMARY_COLOR, .PRIMARY_COLOR)
// MODULATE multiplies src0 × src1 — texture × lighting
c3d.C3D_TexEnvFunc(env, c3d.C3D_RGB,   .MODULATE)
c3d.C3D_TexEnvFunc(env, c3d.C3D_Alpha, .REPLACE)
```

**Vertex shader:** output both `texcoord0` and `color0`.  The lighting system writes its result
into the fragment's primary color, which the TexEnv stage then multiplies against the texture
sample.

**Why PRIMARY_COLOR carries the light result:** `C3D_LightEnvBind` causes the GPU's fragment
pipeline to compute diffuse + specular into the fragment primary color before TexEnv runs.
TEXTURE0 is the bound diffuse texture.  `MODULATE` on `.RGB` produces the lit, textured color.

**Alpha:** use `REPLACE` on the alpha channel sourced from `PRIMARY_COLOR` (the material alpha)
unless the texture has its own meaningful alpha, in which case source from `TEXTURE0` with
`MODULATE` for both channels.

---

### ✅ Phase 11 — libctru service bindings + Audio and SaveData examples

Four new files added to `lib/ctru/`:

| File | Contents |
|---|---|
| `svc.odin` | Full kernel syscall bindings from `3ds/svc.h` — threads, mutexes, events, timers, memory, IPC |
| `apt.odin` | Full APT service bindings — home button hooks, sleep, chainloader, N3DS CPU time limit |
| `ndsp.odin` | Full NDSP audio bindings — channel setup, wave buffers, mix, interpolation, IIR filters |
| `fs.odin` | Full FS filesystem bindings — SDMC/romfs archives, file and directory operations |

NDSP functions that take scalar `float` parameters use the hard-float ABI (values in VFP registers). These are wrapped in `lib/ctru/bridge.c` using the same `u2f`/`f2u` pattern as the Citro2D/3D bridges. Functions that take float arrays by pointer (e.g. `ndspChnSetMix`) are safe to call directly.

**Audio-Example** — demonstrates NDSP end-to-end:
- Parses `romfs:/audio.wav` (uncompressed PCM, 8 or 16 bit, mono or stereo) using C stdio (`fopen`/`fread`) after `romfsInit()`
- Allocates a `linearAlloc` buffer for DMA-safe audio data
- Configures NDSP channel 0 with a single looping `ndspWaveBuf`
- Live console display: status, volume, sample position
- Controls: `A` pause/resume · `Up/Down` volume ±5% · `Start` exit

> **⚠️ Citra DSP note:** `ndspInit` will fail on Citra regardless of DSP mode (HLE or LLE Accurate).
> Citra's DSP emulation does not fully support the NDSP initialization sequence used by libctru.
> The example prints a warning and continues so the UI is visible in Citra, but **audio only works
> on real hardware.** On real hardware, dump your DSP firmware once with the **dsp1** homebrew app
> — it saves `dspfirm.cdc` to `sdmc:/3ds/dspfirm.cdc`, which libctru finds automatically on every
> subsequent `ndspInit` call. No rebuild required.

**SaveData-Example** — persistent save data on the SD card:
- Reads/writes a `SaveData{magic, play_count, high_score, checksum}` struct to `sdmc:/3ds/SaveData-Example/save.bin`
- Increments `play_count` on every launch; starts fresh on first run or bad checksum
- Controls: `A` high score +10 and save · `Start` final save and exit

#### SaveData-Example implementation notes

**ARM32 u64 register-alignment bug in Odin → FS service calls**

The ARM32 AAPCS (Procedure Call Standard) requires that a `u64` argument be placed starting
at an **even-numbered register** (`r0`, `r2`, …). If the preceding arguments have consumed an
odd number of registers, the next register is skipped (wasted as padding) so the `u64` lands
on an even boundary.

Odin's `freestanding_arm32` target does **not** insert this padding register, so any foreign C
function with a `u64` parameter preceded by an odd number of register-sized arguments receives
corrupted data.

The two FS service functions affected are:

| Function | Problem |
|---|---|
| `FSUSER_OpenFile(file: ^Handle, archive: FS_Archive, ...)` | `^Handle` occupies r0 → NCRN=1 (odd). `FS_Archive` (u64) should skip to r2:r3, but Odin places it in r1:r2. libctru reads the archive handle from the wrong registers → all file opens fail. |
| `FSFILE_SetSize(handle: Handle, size: u64)` | `Handle` (u32) occupies r0 → NCRN=1 (odd). `size` (u64) should skip to r2:r3, but Odin places it in r1:r2. libctru reads size=0 → file stays at zero bytes → subsequent write fails. |

Functions where the `u64` lands on an even boundary are **not** affected:

| Function | Why it's safe |
|---|---|
| `FSUSER_OpenArchive(archive: ^FS_Archive, id: FS_ArchiveID, ...)` | No u64 by value — archive is an output pointer. |
| `FSUSER_CreateFile(archive: FS_Archive, ...)` | `FS_Archive` is the **first** arg → NCRN=0 (even) → r0:r1. ✓ |
| `FSUSER_CreateDirectory`, `FSUSER_DeleteFile`, `FSUSER_CloseArchive` | Same — `FS_Archive` is always the first argument. ✓ |
| `FSFILE_Write(handle, bytesWritten, offset: u64, ...)` | Two register args before `offset` → NCRN=2 (even) → r2:r3. ✓ |
| `FSFILE_Read(handle, bytesRead, offset: u64, ...)` | Same. ✓ |

**Workaround:** use C stdio (`fopen` / `fwrite` / `fread` from newlib) for all actual file I/O,
and `mkdir` (also from newlib) for directory creation. Newlib routes these through the FS service
internally with a correct calling convention. `FSUSER_OpenArchive` + `FSUSER_CreateDirectory`
remain usable from Odin since `FS_Archive` is always their first argument.

This pattern is identical to how Audio-Example loads WAV data from romfs — C stdio is the
proven, safe path for file I/O from Odin on 3DS.

---

## Tools

### `tools/tritex.exe` (formerly `png2t3x`)

A drop-in replacement for the official `tex3ds` tool. Converts PNG/JPEG images to `.t3x` files
in the standard Tex3DS binary format, compatible with `Tex3DS_TextureImportStdio`,
`C2D_SpriteSheetLoad`, and `C2D_SpriteSheetLoadFromHandle`.

(Developer Note) I encounted a bug with tex3ds and ImageMagick on window. The bug would currupt the pathing string that tex3ds and ImageMagick used
when converting a image to a .t3x file. This was not just a `.bat` usage related bug. The bug happened when using the CLI calls directly.
The rather convoluted fix/workaround was to just develop a tool that does the image to .t3x directly. That is the reason why `tritex` exists.
It doesn't implement all of the features that `tex3ds` has but it should have enough for most use cases. 

See `tools/howto.md` for the full usage reference.

**Usage**

```
# Single image
tritex input.png output.t3x

# Single image with flags
tritex -o output.t3x input.png

# Texture atlas: pack multiple images into one .t3x (multi-frame sprite sheet)
tritex -a -o atlas.t3x sprite0.png sprite1.png sprite2.png

# Texture atlas via .t3s include file (matches tex3ds -i usage exactly)
tritex -a -o atlas.t3x -i sprites.t3s
```

**Supported flags**

| Flag | Description |
|------|-------------|
| `-a`, `--atlas` | Pack all inputs into a single texture atlas |
| `-o`, `--output <file>` | Output `.t3x` filename |
| `-i`, `--include <file>` | Read options and input filenames from a `.t3s` file |
| `-f`, `--format <fmt>` | Accepted for compatibility; RGBA8 output only |
| `-z`, `--compress <cmp>` | Accepted for compatibility; uncompressed output only |
| `-m/-d/-H/-p/-q/-r/-t/-b/-c/-s` | Accepted for compatibility; silently ignored |
| `-h`, `--help` | Show help |
| `-v`, `--version` | Show version |

**`.t3s` include file format**

Plain-text, whitespace-tokenised. Flags and filenames can be mixed freely on any line.
Comments start with `#`. Paths are resolved relative to the `.t3s` file's directory.

```
# sprites.t3s
-f rgba8
-z none
sprite_idle.png
sprite_run.png
"path with spaces/sprite_jump.png"
```

Typical invocation mirroring the real tex3ds workflow:

```bat
tritex -a -o romfs/sprites.t3x -i assets/sprites.t3s
```

**What the output contains**
- Header starts with `u16 numSubTextures` (no magic bytes)
- `texture_params` byte: `log2(w)−3` in bits `[2:0]`, `log2(h)−3` in bits `[5:3]`
- One 12-byte sub-texture UV entry per input image (written in input order)
- Sub-texture UVs: `uv_top = 1.0`, `uv_bottom = 0.0` for a full-size image (no Y-flip)
- Canvas dimensions are the smallest power-of-two ≥ 8 that fits all images (up to 1024×1024)
- Shelf-packing algorithm: images sorted by height descending, packed left-to-right in rows
- Pixels: ABGR8 byte order, Morton (Z-curve) swizzled in 8×8 tiles
- 4-byte BIOS compression header with type `0x00` (no compression)
- Output verified byte-for-byte identical to `tex3ds -z none` on Linux

**Rebuilding**

```bat
odin build tools/tritex.odin -file -out:tools/tritex.exe
```

All image-based examples' `build.bat` files invoke tritex automatically before the build step.
Folders containing a `.t3s` file are handled in atlas mode; individual PNGs without a `.t3s`
are converted one-to-one.

---

### `tools/mp3towav/`

Converts MP3 files to WAV (PCM16) using Odin's `vendor:miniaudio` bindings.
Purpose-built for preparing audio for 3DS NDSP playback, which requires uncompressed PCM.

**Usage**

```bat
mp3towav input.mp3 output.wav
```

Outputs 44100 Hz, mono, 16-bit PCM by default — the format expected by NDSP with
`NDSP_FORMAT_MONO_PCM16`. miniaudio handles all decoding and resampling internally.

**Rebuilding**

```bat
odin build tools/mp3towav -out:tools/mp3towav.exe
```

---

---

## Games

### FlappyClone (`Examples/Games/FlappyClone/`)

A complete Flappy Bird clone demonstrating every major system in the binding library working
together in a real game.

**Features**
- Animated sprite sheet player (4-frame wing flap via `C2D_SpriteSheetLoad` + `C2D_SpriteFromSheet`)
- Velocity-based physics (`velocity_y += gravity`, `y += velocity_y`) with floor/ceiling clamping
- Procedurally placed pipe pairs recycled as they scroll off screen
- AABB collision detection with per-pixel-snapped hitboxes
- Parallax scrolling background (3 tiled copies, sub-pixel seam-free)
- Score tracking with pipe-pass detection
- Persistent high score saved to `sdmc:/3ds/FlappyClone/highscore.dat`
- Coin sound effect via NDSP (`lib/audio` — `linearAlloc`-backed WAV)
- Three-state game loop: `MainMenu → Playing → Dead` with labeled-break exit
- Bottom screen UI: live score/best HUD during play; animated game-over/main-menu with d-pad cursor
- SMDH metadata with custom icon

**Key implementation lessons documented in `docs.md`:**
- Sub-pixel jitter fix: `cast(f32)cast(i32)` before every `SpriteSetPos` call
- Parallax tile count formula: `int(SCREEN_W / img_w) + 2`
- Animation timer pattern: `frame_timer` counter + `frame_delay` threshold
- Velocity physics vs fixed-offset movement
- `consoleInit` vs citro2d screen ownership conflict
- `break game_loop` labeled break to exit a `for` from inside a `switch`

**Asset pipeline**

```bat
:: Bird animation — 4 frames packed into one atlas via .t3s
tritex -a -o romfs\gfx\bird.t3x -i assets\images\bird\bird.t3s

:: Pipe and background — individual images
tritex assets\images\pipe\pipe.png romfs\gfx\pipe.t3x
tritex assets\images\Background4.png romfs\gfx\Background4.t3x

:: Audio — WAV copied directly to romfs
xcopy /y assets\audio\*.wav romfs\audio\
```

---

## Foreign Imports note

You will notice foreign imports for things that already exist in standard Odin (e.g. `printf`).
Because we compile with `-no-entry-point` and `-no-thread-local` for the freestanding target, the standard Odin runtime is not available. Every OS-level or C-runtime function must be explicitly imported from libctru.
