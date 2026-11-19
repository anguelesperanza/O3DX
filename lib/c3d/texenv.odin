package c3d

// ============================================================
// Citro3D — texture environment (TexEnv) and texture init
// Sources: citro3d/include/c3d/texenv.h, c3d/texture.h
//
// All C3D_TexEnv* and C3D_TexInit functions are static inline
// in the C headers and have no exported linker symbols.
// They are exposed here via bridge wrappers in lib/c3d/bridge.c.
// ============================================================

foreign import c3d_bridge "system:c3d_bridge"

@(default_calling_convention = "c")
foreign c3d_bridge {

    // ── TexEnv configuration ──────────────────────────────────

    // C3D_TexEnvInit — reset all fields of a TexEnv stage to safe defaults.
    @(link_name = "c3d_tex_env_init")
    C3D_TexEnvInit :: proc(env: ^C3D_TexEnv) ---

    // C3D_TexEnvSrc — set the three input sources for RGB and/or Alpha.
    @(link_name = "c3d_tex_env_src")
    C3D_TexEnvSrc :: proc(env: ^C3D_TexEnv, mode: C3D_TexEnvMode,
                          s1, s2, s3: GPU_TEVSRC) ---

    // C3D_TexEnvOpRgb — set the RGB operand for each of the three sources.
    @(link_name = "c3d_tex_env_op_rgb")
    C3D_TexEnvOpRgb :: proc(env: ^C3D_TexEnv,
                            o1, o2, o3: GPU_TEVOP_RGB) ---

    // C3D_TexEnvOpAlpha — set the Alpha operand for each of the three sources.
    @(link_name = "c3d_tex_env_op_alpha")
    C3D_TexEnvOpAlpha :: proc(env: ^C3D_TexEnv,
                              o1, o2, o3: GPU_TEVOP_A) ---

    // C3D_TexEnvFunc — set the combine function for RGB and/or Alpha.
    @(link_name = "c3d_tex_env_func")
    C3D_TexEnvFunc :: proc(env: ^C3D_TexEnv, mode: C3D_TexEnvMode,
                           func: GPU_COMBINEFUNC) ---

    // C3D_TexEnvColor — set the constant colour used when source = CONSTANT.
    @(link_name = "c3d_tex_env_color")
    C3D_TexEnvColor :: proc(env: ^C3D_TexEnv, color: u32) ---

    // C3D_TexEnvScale — set the output scale multiplier.
    @(link_name = "c3d_tex_env_scale")
    C3D_TexEnvScale :: proc(env: ^C3D_TexEnv, mode: C3D_TexEnvMode,
                            scale: GPU_TEVSCALE) ---

    // ── Texture init / filter / wrap ─────────────────────────

    // C3D_TexInit — allocate and upload a 2-D texture (convenience wrapper).
    // Equivalent to C3D_TexInitWithParams with type=TEX2D, onVram=false.
    @(link_name = "c3d_tex_init")
    C3D_TexInit :: proc(tex: ^C3D_Tex, width, height: u16,
                        format: GPU_TEXCOLOR) -> bool ---

    // C3D_TexSetFilter — set magnification and minification filter modes.
    // Must be called after C3D_TexInit; operates on tex.param directly.
    @(link_name = "c3d_tex_set_filter")
    C3D_TexSetFilter :: proc(tex: ^C3D_Tex,
                             magFilter, minFilter: GPU_TEXTURE_FILTER_PARAM) ---

    // C3D_TexSetWrap — set U (S) and V (T) wrap modes.
    // Must be called after C3D_TexInit; operates on tex.param directly.
    @(link_name = "c3d_tex_set_wrap")
    C3D_TexSetWrap :: proc(tex: ^C3D_Tex,
                           wrapS, wrapT: GPU_TEXTURE_WRAP_PARAM) ---

    // C3D_Tex2DGetImagePtr (level 0) — returns the raw pixel data pointer
    // allocated by C3D_TexInit.  Write Morton-tiled pixels here, then call
    // C3D_TexFlush to flush CPU caches before the GPU reads the texture.
    // level and size are as in C; the defaults give level 0 and skip the size.
    @(link_name = "c3d_tex2d_get_image_ptr_level")
    C3D_Tex2DGetImagePtr :: proc(tex: ^C3D_Tex, level: i32 = 0, size: ^u32 = nil) -> rawptr ---

    // ── Texture init variants ─────────────────────────────────

    // C3D_TexInitMipmap — like C3D_TexInit, with every mipmap level down to 8x8.
    @(link_name = "c3d_tex_init_mipmap")
    C3D_TexInitMipmap :: proc(tex: ^C3D_Tex, width, height: u16, format: GPU_TEXCOLOR) -> bool ---

    // C3D_TexInitCube — cube map; cube receives the six face pointers.
    @(link_name = "c3d_tex_init_cube")
    C3D_TexInitCube :: proc(tex: ^C3D_Tex, cube: ^C3D_TexCube, width, height: u16, format: GPU_TEXCOLOR) -> bool ---

    // C3D_TexInitVRAM — like C3D_TexInit, but in VRAM (fill it with a GPU copy,
    // e.g. C3D_SyncTextureCopy, since the CPU cannot write VRAM quickly).
    @(link_name = "c3d_tex_init_vram")
    C3D_TexInitVRAM :: proc(tex: ^C3D_Tex, width, height: u16, format: GPU_TEXCOLOR) -> bool ---

    // C3D_TexInitShadow — RGBA8 shadow map in VRAM.
    @(link_name = "c3d_tex_init_shadow")
    C3D_TexInitShadow :: proc(tex: ^C3D_Tex, width, height: u16) -> bool ---

    // C3D_TexInitShadowCube — cube shadow map in VRAM.
    @(link_name = "c3d_tex_init_shadow_cube")
    C3D_TexInitShadowCube :: proc(tex: ^C3D_Tex, cube: ^C3D_TexCube, width, height: u16) -> bool ---

    // ── Texture queries and setup ─────────────────────────────

    // Highest mipmap level for a size (levels stop at 8x8).
    @(link_name = "c3d_tex_calc_max_level")
    C3D_TexCalcMaxLevel :: proc(width, height: u32) -> i32 ---

    // Bytes in mipmap `level` of a texture whose level 0 is `size` bytes.
    @(link_name = "c3d_tex_calc_level_size")
    C3D_TexCalcLevelSize :: proc(size: u32, level: i32) -> u32 ---

    // Bytes in levels 0..maxLevel together.
    @(link_name = "c3d_tex_calc_total_size")
    C3D_TexCalcTotalSize :: proc(size: u32, maxLevel: i32) -> u32 ---

    @(link_name = "c3d_tex_get_type")
    C3D_TexGetType :: proc(tex: ^C3D_Tex) -> GPU_TEXTURE_MODE_PARAM ---

    // Pointer to mipmap `level` inside `data` (a face's image data). level -1
    // means all levels; size, if not nil, receives the byte count.
    @(link_name = "c3d_tex_get_image_ptr")
    C3D_TexGetImagePtr :: proc(tex: ^C3D_Tex, data: rawptr, level: i32, size: ^u32) -> rawptr ---

    @(link_name = "c3d_tex_cube_get_image_ptr")
    C3D_TexCubeGetImagePtr :: proc(tex: ^C3D_Tex, face: GPU_TEXFACE, level: i32, size: ^u32) -> rawptr ---

    // C3D_TexUpload — C3D_TexLoadImage for level 0 of a 2D texture.
    @(link_name = "c3d_tex_upload")
    C3D_TexUpload :: proc(tex: ^C3D_Tex, data: rawptr) ---

    // Filter between mipmap levels (C3D_TexSetFilter sets within a level).
    @(link_name = "c3d_tex_set_filter_mipmap")
    C3D_TexSetFilterMipmap :: proc(tex: ^C3D_Tex, filter: GPU_TEXTURE_FILTER_PARAM) ---
}

// ── Short aliases (strip C3D_ prefix) ──────────────────────────────────────
TexEnvInit       :: C3D_TexEnvInit
TexEnvSrc        :: C3D_TexEnvSrc
TexEnvOpRgb      :: C3D_TexEnvOpRgb
TexEnvOpAlpha    :: C3D_TexEnvOpAlpha
TexEnvFunc       :: C3D_TexEnvFunc
TexEnvColor      :: C3D_TexEnvColor
TexEnvScale      :: C3D_TexEnvScale
TexInit          :: C3D_TexInit
TexSetFilter     :: C3D_TexSetFilter
TexSetWrap       :: C3D_TexSetWrap
Tex2DGetImagePtr :: C3D_Tex2DGetImagePtr
TexInitMipmap    :: C3D_TexInitMipmap
TexInitCube      :: C3D_TexInitCube
TexInitVRAM      :: C3D_TexInitVRAM
TexInitShadow    :: C3D_TexInitShadow
TexInitShadowCube :: C3D_TexInitShadowCube
TexCalcMaxLevel  :: C3D_TexCalcMaxLevel
TexCalcLevelSize :: C3D_TexCalcLevelSize
TexCalcTotalSize :: C3D_TexCalcTotalSize
TexGetType       :: C3D_TexGetType
TexGetImagePtr   :: C3D_TexGetImagePtr
TexCubeGetImagePtr :: C3D_TexCubeGetImagePtr
TexUpload        :: C3D_TexUpload
TexSetFilterMipmap :: C3D_TexSetFilterMipmap
