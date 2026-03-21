# 3DS Odin

A repository showing how to use the Odin programming language to develop for the Nintendo 3DS, with complete bindings for Citro2D and Citro3D.

Special thanks to **Ske** (https://codeberg.org/ske/3ds-odin) for creating the original Codeberg repository and proof-of-concept.

---

## What this repository does

This repository explores how far Odin can be pushed for 3DS homebrew development.
The original code from Ske is preserved under `POC-Example/`.

AI is used in this development to help bridge knowledge gaps, work through bugs, and generate bindings.

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
│       ├── math.odin           ← Math stubs (FVec, Mtx, Quat) 🔲 (Phase 8)
│       └── bridge.c            ← ABI bridge for all float-param Citro3D functions
│
├── Examples/
│   ├── POC-Example/            ← Original Ske proof-of-concept
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
│   └── Texture-Example/        ← Citro3D: procedural texture, Morton tiling, C3D_TexBind ✅
│
└── tools/
    ├── png2t3x.exe             ← PNG → Tex3DS .t3x converter (standard binary format; workaround for Windows tex3ds bug)
    └── png2t3x.odin            ← Source for the converter
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

### The `lib/` shared packages

Rather than duplicating bindings in every example, all declarations live in `lib/`:

| Package | Import path | Contains |
|---|---|---|
| `ctru` | `../../lib/ctru` | gfx, input, APT, console, romfs, irrst |
| `c2d`  | `../../lib/c2d`  | All Citro2D types, drawing, tinting, view transforms |
| `c3d`  | `../../lib/c3d`  | All Citro3D types, GPU enums, frame/texture/effect functions |

Example usage:
```odin
import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)
c2d.C2D_DrawRectSolid(10, 10, 0, 80, 60, c2d.C2D_Color32(0xFF, 0, 0, 0xFF))
```

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
> known bug on Windows that produces corrupt output. `tools/png2t3x.exe` is a working replacement
> that writes the correct format. All image-loading examples use `Tex3DS_TextureImportStdio` in
> their `main.c` for parsing, and `SpriteSheet-Example` uses the full `C2D_SpriteSheetLoad` →
> `C2D_SpriteFromSheet` pipeline end-to-end.

---

### ✅ Phase 5 — Citro3D core examples

- ✅ Render triangle to screen (vertex buffers, PICA200 shader, per-vertex colour)
- ✅ Texture mapping (C3D_Tex, TexEnv) — validated in Phase 6

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

The same algorithm is used in `tools/png2t3x.odin` for converting PNG files.

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

### 🔲 Phase 7 — Citro3D effects, TexEnv, framebuffer  ← **NEXT**

- TexEnv setup (`C3D_TexEnv*`)
- Stencil, depth test, alpha blend, cull face
- Framebuffer transfer and custom render targets

---

### 🔲 Phase 8 — Citro3D math (native Odin)

All `maths.h` functions are `static inline` in C, so they cannot be linked — they must be reimplemented natively in `lib/c3d/math.odin`.

- `FVec3_*`, `FVec4_*` (add, subtract, dot, cross, normalize, …)
- `Mtx_*` (identity, multiply, translate, scale, rotate, ortho, perspective, …)
- `Quat_*` (from axis-angle, multiply, normalize, to matrix, …)

---

### 🔲 Phase 9 — Citro3D lighting, fog, proctex

- `C3D_LightEnv*`, `C3D_Light*`
- `FogLut_Exp`, `C3D_FogGasMode`
- `C3D_ProcTex*`, `ProcTexLut_*`

---

### 🔲 Phase 10 — Full 3D example

A complete 3D scene using only the `lib/` packages:
- Spinning textured cube or model
- Lighting applied
- Perspective projection via Phase 8 math

---

## Tools

### `tools/png2t3x.exe`

Converts a PNG or JPEG to a `.t3x` file in the **standard Tex3DS binary format** compatible with `Tex3DS_TextureImportStdio` and `C2D_SpriteSheetLoad`.

The official `tex3ds` tool from DevKitPro has a known bug on Windows that produces corrupt output; this tool is a working replacement. It is built from `tools/png2t3x.odin` using the Odin compiler.

**What it produces:**
- No magic bytes — file starts directly with a `u16 numSubTextures` field
- Dimensions rounded up to the nearest power-of-two ≥ 8 and zero-padded
- Pixels converted to ABGR8 byte order (3DS GPU in-memory layout), Morton (Z-curve) swizzled in 8×8 tiles, Y-flipped
- A 4-byte BIOS compression header with type `0x00` (no compression) wrapping the pixel data

Usage: `png2t3x.exe input.png output.t3x`

All image-based examples' `build.bat` files invoke this automatically before the build step. All `load_t3x_image` helpers in the example `main.c` files parse the output with `Tex3DS_TextureImportStdio`.

---

## Foreign Imports note

You will notice foreign imports for things that already exist in standard Odin (e.g. `printf`).
Because we compile with `-no-entry-point` and `-no-thread-local` for the freestanding target, the standard Odin runtime is not available. Every OS-level or C-runtime function must be explicitly imported from libctru.
