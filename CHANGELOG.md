# Changelog

## bindings-complete

### Breaking
- Removed or renamed citro3d enum values: `GPU_LIGHTLUTID` `SP0`–`SP7`/`DA0`–`DA7` → `SP`/`DA`; `GPU_FOGMODE` `DISABLED`/`GAS_DEPTH`/`GAS_DENSITY` → `NO_FOG`/`GAS`; `GPU_GASMODE` `PROJECTED_DENSITY` → `PLAIN_DENSITY`; `GPU_FRAGOPMODE` `DEFAULT`/`GAS` → `GL`/`GAS_ACC`; `GPU_TEXTURE_FILTER_PARAM` mipmap values removed (use `C3D_TexSetFilterMipmap`).
- Corrected enum values change behaviour: `GPU_Primitive_t` strip/fan (`0x100`/`0x200`), `GPU_DEPTHBUF`, `GPU_GASMODE.DEPTH_DENSITY` (2 → 1).
- Opaque types are structs instead of byte arrays (`C3D_Tex`, `C3D_TexEnv`, `C3D_LightEnv`, `C3D_Light`, `DVLP_s`, `DVLE_s`, `shaderInstance_s`), with sizes matching C (`C3D_LightEnv` 1156 → 164, `C3D_Light` 64 → 112, `DVLE_s` 100 → 92).
- Socket structs match C: `sockaddr.sa_data` is `[0]u8`, `sockaddr_storage` reshaped, `hostent.h_addrtype`/`h_length` are `u16`.
- `C3D_TexInitParams` and `C3D_FrameBuf` pack their small fields as bit fields (names unchanged).
- Enums sized to devkitARM's short enums (`u32`/`i32` → `u8`/`u16`/`i8`); matters only where an enum's size does.
- `Mtx_Multiply`, `Mtx_Translate`, `Mtx_Transpose`, `Mtx_MultiplyFVec4` and the `Mtx_Ortho`/`Mtx_Persp` projections (and tilt versions) now return citro3d's results; code tuned around the old output renders differently.
- `ndspAuxGetFrontBypass` removed (never linked: missing from `libctru.a`).

### Added
- libctru: bound the rest of the services — game-facing (PTM/MCU battery, GSPLCD backlight, Y2R, CSND, decompress, UTF, system font, rbtree, error and Mii selector applets) and system (AM, ACT, FRD, BOSS, NS, PM, FSPXI, NIM, NEWS, PS, QTM and others).
- libctru: filled gaps in already-bound headers — console, `os.h`, C-stick (`irrst`), APT, FS, SVC, the rest of `shaderProgram.h` and DVLE, plus `gpu.h` and `gx.h`.
- citro3d: texture init variants (VRAM, mipmap, cube, shadow), `C3D_TexSetFilterMipmap`, `C3D_TexUpload`, texture size helpers and the Tex3DS importer.
- citro3d: framebuffer and render-target helpers, `MtxStack_Cur`, `C3D_ImmDrawRestartPrim`, `C3D_IVUnifSet`, `FogLut_FromArray`/`FogLut_CalcZ`, `LightLut_Spotlight`/`LightLutDA_Quadratic`.
- citro2d: `C2D_Clamp` and `C2D_FloatToU8`.
- Enum values: `DOT3_RGBA`, `GPU_WRITEMASK.COLOR`, the unnamed `GPU_TEVOP_RGB` values (`UNNAMED_0X06` etc.), `GPU_GASDEPTHFUNC` and enum counts.
- Test examples: Primitives, Spotlight, Dot3, Mipmap, FogLut, Socket, Services, Applets, Utilities (self-checking PASS/FAIL) and CSND.
- `CHANGELOG.md`.

### Fixed
- Wrong citro3d enum values: primitive types (strip/fan), light LUT IDs (SP/DA), depth buffer formats, fragment/fog/gas modes and texture filters.
- Struct layouts and sizes checked against C: `C3D_Light` (was 64 bytes, is 112), `C3D_TexInitParams`, `Tex3DS_SubTexture`, rbtree nodes, shader and socket structs; C enums sized to devkitARM's short enums (u8/u16).
- Static-inline C functions that were bound as plain symbols (uniform write pointers, `C3D_BoolUnifSet`) and failed to link now go through `bridge.c`.
- `Mtx_Multiply`, `Mtx_Translate`, `Mtx_Transpose`, `Mtx_MultiplyFVec4` and the Odin projections misread citro3d's reversed row layout; they now call citro3d.
- Lighting and Lighting-Color: shaders read normals in natural order and pass the negated view vector; light positions use `FVec4_New`.
- Texture, Mipmap and ProcTex froze real hardware: their shaders now write the whole texcoord output register.
- Example fixes: Dot3 combiner setup (`DOT3_RGBA` on both combiners), CSND loop click, Runtime exits to the launcher on assert, AlphaBlend description, DrawEllipseSolid/DrawRectSolid titles, ViewScale console wrap.

### Changed
- All bindings follow the house style (gbep STYLE_GUIDE, vito look): SCREAMING_CASE enum values with the C prefix stripped; names that would start with a digit keep a prefix (`UNNAMED_0X06`, `DUTYCYCLE_0`, `DEBUGDEVICE_3DMOO`).
- README lighting and matrix notes rewritten to match the fixes.
