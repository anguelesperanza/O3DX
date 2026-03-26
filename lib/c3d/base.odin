package c3d

// ============================================================
// Citro3D — core init, frame management, and immediate drawing
// Sources: citro3d/include/c3d/base.h, renderqueue.h
// ============================================================

// ============================================================
// Constants
// ============================================================

C3D_DEFAULT_CMDBUF_SIZE :: u32(0x40000)

// C3D_FrameBegin flags
C3D_FRAME_SYNCDRAW :: u8(1) // BIT(0) — sync with display before drawing
C3D_FRAME_NONBLOCK :: u8(2) // BIT(1) — return false instead of blocking

// ============================================================
// citro3d — functions with no float parameters.
// Safe to call directly from soft-float Odin.
// ============================================================

foreign import citro3d "system:citro3d"

@(default_calling_convention = "c")
foreign citro3d {
    // --- Init / shutdown ---
    C3D_Init    :: proc(cmdBufSize: u32) -> bool ---
    C3D_Fini    :: proc() ---

    // --- Frame control ---
    C3D_FrameBegin  :: proc(flags: u8) -> bool ---
    C3D_FrameEnd    :: proc(flags: u8) ---
    C3D_FrameSync   :: proc() ---
    C3D_FrameCounter :: proc(id: i32) -> u32 ---
    C3D_FrameDrawOn :: proc(target: rawptr) -> bool --- // C3D_RenderTarget*
    C3D_FrameSplit  :: proc(flags: u8) ---
    C3D_FrameEndHook :: proc(hook: rawptr, param: rawptr) --- // void(*)(void*)

    // --- Viewport / scissor ---
    C3D_SetViewport :: proc(x, y, w, h: u32) ---
    C3D_SetScissor  :: proc(mode: GPU_SCISSORMODE, left, top, right, bottom: u32) ---

    // --- Shader ---
    C3D_BindProgram :: proc(program: rawptr) --- // shaderProgram_s*

    // --- Vertex drawing ---
    C3D_DrawArrays   :: proc(primitive: GPU_Primitive_t, first, size: i32) ---
    C3D_DrawElements :: proc(primitive: GPU_Primitive_t, count, type_: i32, indices: rawptr) ---
    C3D_ImmDrawBegin :: proc(primitive: GPU_Primitive_t) ---
    C3D_ImmDrawEnd   :: proc() ---

    // --- Fixed vertex attributes ---
    C3D_FixedAttribGetWritePtr :: proc(id: i32) -> ^C3D_FVec ---

    // --- Attribute / buffer info ---
    AttrInfo_Init      :: proc(info: ^C3D_AttrInfo) ---
    AttrInfo_AddLoader :: proc(info: ^C3D_AttrInfo, regId: i32, format: GPU_FORMATS, count: i32) -> i32 ---
    AttrInfo_AddFixed  :: proc(info: ^C3D_AttrInfo, regId: i32) -> i32 ---
    C3D_GetAttrInfo    :: proc() -> ^C3D_AttrInfo ---
    C3D_SetAttrInfo    :: proc(info: ^C3D_AttrInfo) ---

    BufInfo_Init :: proc(info: ^C3D_BufInfo) ---
    BufInfo_Add  :: proc(info: ^C3D_BufInfo, data: rawptr, stride: int, attribCount: i32, permutation: u64) -> i32 ---
    C3D_GetBufInfo :: proc() -> ^C3D_BufInfo ---
    C3D_SetBufInfo :: proc(info: ^C3D_BufInfo) ---

    // --- Uniform upload (no-float versions) ---
    C3D_FVUnifWritePtr :: proc(type_: GPU_SHADER_TYPE, id, size: i32) -> ^C3D_FVec ---
    C3D_IVUnifWritePtr :: proc(type_: GPU_SHADER_TYPE, id: i32) -> ^u32 ---
    C3D_BoolUnifSet    :: proc(type_: GPU_SHADER_TYPE, id: i32, value: bool) ---
    // C3D_FVUnifMtxNx4 is static-inline in uniforms.h — bridged via c3d_fvunif_mtx_nx4 below.
    C3D_UpdateUniforms  :: proc(type_: GPU_SHADER_TYPE) ---

    // --- Sync transfers ---
    C3D_SyncDisplayTransfer :: proc(inadr: ^u32, indim: u32, outadr: ^u32, outdim: u32, flags: u32) ---
    C3D_SyncTextureCopy     :: proc(inadr: ^u32, indim: u32, outadr: ^u32, outdim: u32, size, flags: u32) ---
    C3D_SyncMemoryFill      :: proc(
        buf0a: ^u32, buf0v: u32, buf0e: ^u32, control0: u16,
        buf1a: ^u32, buf1v: u32, buf1e: ^u32, control1: u16) ---

    // --- Texture ---
    C3D_TexInitWithParams  :: proc(tex: ^C3D_Tex, cube: ^C3D_TexCube, p: C3D_TexInitParams) -> bool ---
    C3D_TexLoadImage       :: proc(tex: ^C3D_Tex, data: rawptr, face: GPU_TEXFACE, level: i32) ---
    C3D_TexGenerateMipmap  :: proc(tex: ^C3D_Tex, face: GPU_TEXFACE) ---
    C3D_TexBind            :: proc(unitId: i32, tex: ^C3D_Tex) ---
    C3D_TexFlush           :: proc(tex: ^C3D_Tex) ---
    C3D_TexDelete          :: proc(tex: ^C3D_Tex) ---

    // --- Framebuffer ---
    C3D_CalcColorBufSize :: proc(width, height: u32, fmt: GPU_COLORBUF) -> u32 ---
    C3D_CalcDepthBufSize :: proc(width, height: u32, fmt: GPU_DEPTHBUF) -> u32 ---
    C3D_GetFrameBuf      :: proc() -> ^C3D_FrameBuf ---
    C3D_SetFrameBuf      :: proc(fb: ^C3D_FrameBuf) ---
    C3D_FrameBufTex      :: proc(fb: ^C3D_FrameBuf, tex: ^C3D_Tex, face: GPU_TEXFACE, level: i32) ---
    C3D_FrameBufClear    :: proc(fb: ^C3D_FrameBuf, clearBits: C3D_ClearBits, clearColor, clearDepth: u32) ---
    C3D_FrameBufTransfer :: proc(fb: ^C3D_FrameBuf, screen, side: u32, transferFlags: u32) ---

    // --- TexEnv ---
    C3D_GetTexEnv    :: proc(id: i32) -> ^C3D_TexEnv ---
    C3D_SetTexEnv    :: proc(id: i32, env: ^C3D_TexEnv) ---
    C3D_DirtyTexEnv  :: proc(env: ^C3D_TexEnv) ---
    C3D_TexEnvBufUpdate :: proc(mode, mask: i32) ---
    C3D_TexEnvBufColor  :: proc(color: u32) ---

    // --- Render target creation / deletion ---
    C3D_RenderTargetCreate       :: proc(width, height: i32, colorFmt: GPU_COLORBUF, depthFmt: C3D_DEPTHTYPE) -> rawptr ---
    C3D_RenderTargetCreateFromTex :: proc(tex: ^C3D_Tex, face: GPU_TEXFACE, level: i32, depthFmt: C3D_DEPTHTYPE) -> rawptr ---
    C3D_RenderTargetDelete       :: proc(target: rawptr) ---
    C3D_RenderTargetSetOutput    :: proc(target: rawptr, screen, side: u32, transferFlags: u32) ---

    // --- Effects (no float params) ---
    C3D_CullFace      :: proc(mode: GPU_CULLMODE) ---
    C3D_StencilTest   :: proc(enable: bool, function: GPU_TESTFUNC, ref, inputMask, writeMask: i32) ---
    C3D_StencilOp     :: proc(sfail, dfail, pass: GPU_STENCILOP) ---
    C3D_BlendingColor :: proc(color: u32) ---
    C3D_EarlyDepthTest :: proc(enable: bool, function: GPU_EARLYDEPTHFUNC, ref: u32) ---
    C3D_DepthTest     :: proc(enable: bool, function: GPU_TESTFUNC, writemask: GPU_WRITEMASK) ---
    C3D_AlphaTest     :: proc(enable: bool, function: GPU_TESTFUNC, ref: i32) ---
    C3D_AlphaBlend    :: proc(colorEq: GPU_BLENDEQUATION, alphaEq: GPU_BLENDEQUATION,
                              srcClr, dstClr, srcAlpha, dstAlpha: GPU_BLENDFACTOR) ---
    C3D_ColorLogicOp  :: proc(op: GPU_LOGICOP) ---
    C3D_FragOpMode    :: proc(mode: GPU_FRAGOPMODE) ---

    // --- Lighting (no float params) ---
    C3D_LightEnvInit        :: proc(env: ^C3D_LightEnv) ---
    C3D_LightEnvBind        :: proc(env: ^C3D_LightEnv) ---
    C3D_LightEnvMaterial    :: proc(env: ^C3D_LightEnv, mtl: ^C3D_Material) ---
    C3D_LightEnvLut         :: proc(env: ^C3D_LightEnv, lutId: GPU_LIGHTLUTID, input: GPU_LIGHTLUTINPUT, negative: bool, lut: ^C3D_LightLut) ---
    C3D_LightEnvFresnel     :: proc(env: ^C3D_LightEnv, selector: GPU_FRESNELSEL) ---
    C3D_LightEnvBumpMode    :: proc(env: ^C3D_LightEnv, mode: GPU_BUMPMODE) ---
    C3D_LightEnvBumpSel     :: proc(env: ^C3D_LightEnv, texUnit: i32) ---
    C3D_LightEnvBumpNormalZ :: proc(env: ^C3D_LightEnv, enable: bool) ---
    C3D_LightEnvShadowMode  :: proc(env: ^C3D_LightEnv, mode: u32) ---
    C3D_LightEnvShadowSel   :: proc(env: ^C3D_LightEnv, texUnit: i32) ---
    C3D_LightEnvClampHighlights :: proc(env: ^C3D_LightEnv, clamp: bool) ---
    C3D_LightInit           :: proc(light: ^C3D_Light, env: ^C3D_LightEnv) -> i32 ---
    C3D_LightEnable         :: proc(light: ^C3D_Light, enable: bool) ---
    C3D_LightTwoSideDiffuse :: proc(light: ^C3D_Light, enable: bool) ---
    C3D_LightGeoFactor      :: proc(light: ^C3D_Light, id: i32, enable: bool) ---
    C3D_LightPosition       :: proc(light: ^C3D_Light, pos: ^C3D_FVec) ---
    C3D_LightShadowEnable   :: proc(light: ^C3D_Light, enable: bool) ---
    C3D_LightSpotEnable     :: proc(light: ^C3D_Light, enable: bool) ---
    C3D_LightSpotLut        :: proc(light: ^C3D_Light, lut: ^C3D_LightLut) ---
    C3D_LightDistAttnEnable :: proc(light: ^C3D_Light, enable: bool) ---
    C3D_LightDistAttn       :: proc(light: ^C3D_Light, lut: ^C3D_LightLutDA) ---

    // --- Fog / gas (no float params) ---
    C3D_FogGasMode    :: proc(fogMode: GPU_FOGMODE, gasMode: GPU_GASMODE, zFlip: bool) ---
    C3D_FogColor      :: proc(color: u32) ---
    C3D_FogLutBind    :: proc(lut: ^C3D_FogLut) ---
    C3D_GasBeginAcc   :: proc() ---
    C3D_GasLightDirection :: proc(colorLut: u32) ---
    C3D_GasLutInput   :: proc(input: GPU_GASLUTINPUT) ---
    C3D_GasLutBind    :: proc(lut: ^C3D_GasLut) ---
    GasLut_FromArray  :: proc(lut: ^C3D_GasLut, data: ^u32) ---

    // --- Proc tex (no float params) ---
    C3D_ProcTexInit        :: proc(pt: ^C3D_ProcTex, offset, length: i32) ---
    C3D_ProcTexBind        :: proc(texCoordId: i32, pt: ^C3D_ProcTex) ---
    C3D_ProcTexLutBind     :: proc(id: GPU_PROCTEX_LUTID, lut: ^C3D_ProcTexLut) ---
    C3D_ProcTexColorLutBind :: proc(lut: ^C3D_ProcTexColorLut) ---
    ProcTexColorLut_Write  :: proc(lut: ^C3D_ProcTexColorLut, data: ^u32, offset, length: i32) ---

    // --- Matrix stack ---
    MtxStack_Init   :: proc(stk: ^C3D_MtxStack) ---
    MtxStack_Bind   :: proc(stk: ^C3D_MtxStack, unifType: GPU_SHADER_TYPE, unifPos, unifLen: i32) ---
    MtxStack_Push   :: proc(stk: ^C3D_MtxStack) -> ^C3D_Mtx ---
    MtxStack_Pop    :: proc(stk: ^C3D_MtxStack) -> ^C3D_Mtx ---
    MtxStack_Update :: proc(stk: ^C3D_MtxStack) ---
}

// ============================================================
// c3d_bridge — wrappers for citro3d functions whose signatures
// contain float parameters passed directly.
// Implemented in lib/c3d/bridge.c.
// ============================================================

foreign import c3d_bridge "system:c3d_bridge"

@(default_calling_convention = "c")
foreign c3d_bridge {
    // --- Render target clear (static inline in c3d/renderqueue.h) ---
    // Clears the colour and/or depth buffers of a render target.
    // clearBits: C3D_CLEAR_COLOR | C3D_CLEAR_DEPTH | C3D_CLEAR_ALL
    // clearColor: RGBA8 packed colour (e.g. 0x000000FF = opaque black)
    // clearDepth: depth value (typically 0 for near-plane clear)
    @(link_name = "c3d_render_target_clear")
    C3D_RenderTargetClear :: proc(target: rawptr, clearBits: C3D_ClearBits,
                                  clearColor, clearDepth: u32) ---

    // --- Timer / usage queries (return float in hard-float ABI) ---
    @(link_name = "c3d_get_processing_time")
    C3D_GetProcessingTime :: proc() -> f32 ---

    @(link_name = "c3d_get_drawing_time")
    C3D_GetDrawingTime :: proc() -> f32 ---

    @(link_name = "c3d_get_cmdbuf_usage")
    C3D_GetCmdBufUsage :: proc() -> f32 ---

    // --- Frame rate (returns float) ---
    @(link_name = "c3d_frame_rate")
    C3D_FrameRate :: proc(fps: f32) -> f32 ---

    // --- Immediate mode (4 float params) ---
    @(link_name = "c3d_imm_send_attrib")
    C3D_ImmSendAttrib :: proc(x, y, z, w: f32) ---

    // --- Fixed attrib set (4 float params) ---
    @(link_name = "c3d_fixed_attrib_set")
    C3D_FixedAttribSet :: proc(id: i32, x, y, z, w: f32) ---

    // --- Float uniform ---
    @(link_name = "c3d_fvunif_set")
    C3D_FVUnifSet :: proc(type_: GPU_SHADER_TYPE, id: i32, x, y, z, w: f32) ---

    // --- Effects (float params) ---
    @(link_name = "c3d_depth_map")
    C3D_DepthMap :: proc(bIsZBuffer: bool, zScale, zOffset: f32) ---

    @(link_name = "c3d_frag_op_shadow")
    C3D_FragOpShadow :: proc(scale, bias: f32) ---

    // --- Texture (float params) ---
    @(link_name = "c3d_tex_shadow_params")
    C3D_TexShadowParams :: proc(perspective: bool, bias: f32) ---

    @(link_name = "c3d_tex_set_lod_bias")
    C3D_TexSetLodBias :: proc(tex: ^C3D_Tex, lodBias: f32) ---

    // --- Lighting (float params) ---
    @(link_name = "c3d_light_env_ambient")
    C3D_LightEnvAmbient :: proc(env: ^C3D_LightEnv, r, g, b: f32) ---

    @(link_name = "c3d_light_ambient")
    C3D_LightAmbient :: proc(light: ^C3D_Light, r, g, b: f32) ---

    @(link_name = "c3d_light_diffuse")
    C3D_LightDiffuse :: proc(light: ^C3D_Light, r, g, b: f32) ---

    @(link_name = "c3d_light_specular0")
    C3D_LightSpecular0 :: proc(light: ^C3D_Light, r, g, b: f32) ---

    @(link_name = "c3d_light_specular1")
    C3D_LightSpecular1 :: proc(light: ^C3D_Light, r, g, b: f32) ---

    @(link_name = "c3d_light_spot_dir")
    C3D_LightSpotDir :: proc(light: ^C3D_Light, x, y, z: f32) ---

    // C3D_LightColor — static inline: sets diffuse + specular0 + specular1 together.
    @(link_name = "c3d_light_color")
    C3D_LightColor :: proc(light: ^C3D_Light, r, g, b: f32) ---

    // --- Fog / gas (float params) ---
    @(link_name = "fog_lut_exp")
    FogLut_Exp :: proc(lut: ^C3D_FogLut, density, gradient, near, far: f32) ---

    @(link_name = "c3d_gas_delta_z")
    C3D_GasDeltaZ :: proc(value: f32) ---

    @(link_name = "c3d_gas_acc_max")
    C3D_GasAccMax :: proc(value: f32) ---

    @(link_name = "c3d_gas_attn")
    C3D_GasAttn :: proc(value: f32) ---

    @(link_name = "c3d_gas_light_planar")
    C3D_GasLightPlanar :: proc(min, max, delta: f32) ---

    @(link_name = "c3d_gas_light_view")
    C3D_GasLightView :: proc(min, max, delta: f32) ---

    // --- Light LUT ---
    @(link_name = "light_lut_from_array")
    LightLut_FromArray :: proc(lut: ^C3D_LightLut, data: ^f32) ---

    // LightLut_Phong — wraps the LightLut_Phong macro (LightLut_FromFunc + powf).
    @(link_name = "light_lut_phong")
    LightLut_Phong :: proc(lut: ^C3D_LightLut, shininess: f32) ---

    @(link_name = "light_lut_from_func")
    LightLut_FromFunc :: proc(lut: ^C3D_LightLut, func: rawptr, param: f32, negative: bool) ---

    @(link_name = "light_lut_da_create")
    LightLutDA_Create :: proc(lut: ^C3D_LightLutDA, func: rawptr, from_, to, arg0, arg1: f32) ---

    // --- Proc tex (integer / bool params bridged for the static inline setters) ---
    @(link_name = "c3d_proc_tex_clamp")
    C3D_ProcTexClamp :: proc(pt: ^C3D_ProcTex, u, v: GPU_PROCTEX_CLAMP) ---

    @(link_name = "c3d_proc_tex_combiner")
    C3D_ProcTexCombiner :: proc(pt: ^C3D_ProcTex, separate: bool, rgb, alpha: GPU_PROCTEX_MAPFUNC) ---

    @(link_name = "c3d_proc_tex_noise_enable")
    C3D_ProcTexNoiseEnable :: proc(pt: ^C3D_ProcTex, enable: bool) ---

    @(link_name = "c3d_proc_tex_shift")
    C3D_ProcTexShift :: proc(pt: ^C3D_ProcTex, u, v: GPU_PROCTEX_SHIFT) ---

    @(link_name = "c3d_proc_tex_filter")
    C3D_ProcTexFilter :: proc(pt: ^C3D_ProcTex, min_filt: GPU_PROCTEX_FILTER) ---

    // --- Proc tex (float params) ---
    @(link_name = "c3d_proc_tex_noise_coefs")
    C3D_ProcTexNoiseCoefs :: proc(pt: ^C3D_ProcTex, coord: i32, amplitude, frequency, phase: f32) --- // coord: C3D_ProcTexCoord cast to i32

    @(link_name = "c3d_proc_tex_lod_bias")
    C3D_ProcTexLodBias :: proc(pt: ^C3D_ProcTex, bias: f32) ---

    @(link_name = "proc_tex_lut_from_array")
    ProcTexLut_FromArray :: proc(lut: ^C3D_ProcTexLut, data: ^f32) ---

    // --- Projection matrix (bridge: float params passed as uint32 bits via u2f) ---
    // Use these instead of the bridged C Mtx_PerspTilt when you need the
    // known-correct citro3d implementation (e.g. isLeftHanded=false / RH convention).
    @(link_name = "mtx_persp_tilt")
    Mtx_PerspTilt_Bridge :: proc(mtx: ^C3D_Mtx, fovy, aspect, near, far: f32, isLeftHanded: bool) ---

    // --- Uniform matrix upload (static inline in c3d/uniforms.h) ---
    // All bridged via bridge.c since they are static inline and have no exported symbol.
    @(link_name = "c3d_fvunif_mtx_nx4")
    C3D_FVUnifMtxNx4 :: proc(type_: GPU_SHADER_TYPE, id: i32, mtx: ^C3D_Mtx, num: i32) ---

    @(link_name = "c3d_fvunif_mtx4x4")
    C3D_FVUnifMtx4x4 :: proc(type_: GPU_SHADER_TYPE, id: i32, mtx: ^C3D_Mtx) ---

    @(link_name = "c3d_fvunif_mtx3x4")
    C3D_FVUnifMtx3x4 :: proc(type_: GPU_SHADER_TYPE, id: i32, mtx: ^C3D_Mtx) ---

    @(link_name = "c3d_fvunif_mtx2x4")
    C3D_FVUnifMtx2x4 :: proc(type_: GPU_SHADER_TYPE, id: i32, mtx: ^C3D_Mtx) ---
}
