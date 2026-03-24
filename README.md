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
│       ├── math.odin           ← Full FVec/Mtx/Quat math library ✅ (Phase 8)
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
│   ├── Texture-Example/        ← Citro3D: procedural texture, Morton tiling, C3D_TexBind ✅
│   ├── DepthTest-Example/      ← Citro3D: depth test, PICA200 reverse-Z, GEQUAL convention ✅
│   ├── AlphaBlend-Example/     ← Citro3D: src-alpha blending, back-to-front draw order ✅
│   └── SpinningCube-Example/   ← Citro3D: 3D perspective, model matrix, spinning cube ✅ (Phase 8)
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

### 🔲 Phase 9 — Citro3D lighting, fog, proctex  ← **NEXT**

- `C3D_LightEnv*`, `C3D_Light*`
- `FogLut_Exp`, `C3D_FogGasMode`
- `C3D_ProcTex*`, `ProcTexLut_*`

---

### 🔲 Phase 10 — Full 3D scene

A complete 3D scene using the full `lib/` package stack:
- Textured spinning cube (combining Phase 6 textures + Phase 8 math)
- Lighting applied (Phase 9)
- Multiple objects with separate model matrices

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
