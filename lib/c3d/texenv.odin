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
    @(link_name = "c3d_tex2d_get_image_ptr")
    C3D_Tex2DGetImagePtr :: proc(tex: ^C3D_Tex) -> rawptr ---
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
