// lib/c3d/bridge.c
//
// ABI bridge: soft-float Odin → hard-float citro3d.
//
// Functions that return float use f2u() so the result lands in r0
// (integer register) where soft-float Odin expects it.
// Functions that take floats directly receive them as uint32_t and
// reinterpret with u2f() before forwarding.

#include <citro3d.h>
#include <string.h>
#include "../bridge_utils.h"

// ----------------------------------------------------------------
// Timer / performance queries
// C3D_GetProcessingTime, C3D_GetDrawingTime, C3D_GetCmdBufUsage all
// return float in s0 (hard-float ABI).  Wrap with f2u() so the
// bit-pattern is delivered in r0 for soft-float Odin.
// ----------------------------------------------------------------

uint32_t c3d_get_processing_time(void) { return f2u(C3D_GetProcessingTime()); }
uint32_t c3d_get_drawing_time(void)    { return f2u(C3D_GetDrawingTime()); }
uint32_t c3d_get_cmdbuf_usage(void)    { return f2u(C3D_GetCmdBufUsage()); }

// C3D_FrameRate: takes and returns float
uint32_t c3d_frame_rate(uint32_t fps)  { return f2u(C3D_FrameRate(u2f(fps))); }

// ----------------------------------------------------------------
// Immediate-mode vertex submission
// ----------------------------------------------------------------

void c3d_imm_send_attrib(uint32_t x, uint32_t y, uint32_t z, uint32_t w) {
    C3D_ImmSendAttrib(u2f(x), u2f(y), u2f(z), u2f(w));
}

// ----------------------------------------------------------------
// Fixed vertex attribute
// ----------------------------------------------------------------

void c3d_fixed_attrib_set(int id, uint32_t x, uint32_t y, uint32_t z, uint32_t w) {
    C3D_FixedAttribSet(id, u2f(x), u2f(y), u2f(z), u2f(w));
}

// ----------------------------------------------------------------
// Float uniform
// ----------------------------------------------------------------

void c3d_fvunif_set(GPU_SHADER_TYPE type, int id,
                    uint32_t x, uint32_t y, uint32_t z, uint32_t w) {
    C3D_FVUnifSet(type, id, u2f(x), u2f(y), u2f(z), u2f(w));
}

// ----------------------------------------------------------------
// Effects
// ----------------------------------------------------------------

void c3d_depth_map(bool bIsZBuffer, uint32_t zScale, uint32_t zOffset) {
    C3D_DepthMap(bIsZBuffer, u2f(zScale), u2f(zOffset));
}

void c3d_frag_op_shadow(uint32_t scale, uint32_t bias) {
    C3D_FragOpShadow(u2f(scale), u2f(bias));
}

// ----------------------------------------------------------------
// Texture
// ----------------------------------------------------------------

void c3d_tex_shadow_params(bool perspective, uint32_t bias) {
    C3D_TexShadowParams(perspective, u2f(bias));
}

void c3d_tex_set_lod_bias(C3D_Tex* tex, uint32_t lodBias) {
    C3D_TexSetLodBias(tex, u2f(lodBias));
}

// ----------------------------------------------------------------
// Lighting
// ----------------------------------------------------------------

void c3d_light_env_ambient(C3D_LightEnv* env, uint32_t r, uint32_t g, uint32_t b) {
    C3D_LightEnvAmbient(env, u2f(r), u2f(g), u2f(b));
}

void c3d_light_ambient(C3D_Light* light, uint32_t r, uint32_t g, uint32_t b) {
    C3D_LightAmbient(light, u2f(r), u2f(g), u2f(b));
}

void c3d_light_diffuse(C3D_Light* light, uint32_t r, uint32_t g, uint32_t b) {
    C3D_LightDiffuse(light, u2f(r), u2f(g), u2f(b));
}

void c3d_light_specular0(C3D_Light* light, uint32_t r, uint32_t g, uint32_t b) {
    C3D_LightSpecular0(light, u2f(r), u2f(g), u2f(b));
}

void c3d_light_specular1(C3D_Light* light, uint32_t r, uint32_t g, uint32_t b) {
    C3D_LightSpecular1(light, u2f(r), u2f(g), u2f(b));
}

void c3d_light_spot_dir(C3D_Light* light, uint32_t x, uint32_t y, uint32_t z) {
    C3D_LightSpotDir(light, u2f(x), u2f(y), u2f(z));
}

// C3D_LightColor — static inline: sets diffuse + specular0 + specular1 together.
void c3d_light_color(C3D_Light* light, uint32_t r, uint32_t g, uint32_t b) {
    C3D_LightColor(light, u2f(r), u2f(g), u2f(b));
}

// ----------------------------------------------------------------
// Light LUTs
// ----------------------------------------------------------------

void light_lut_from_array(C3D_LightLut* lut, float* data) {
    LightLut_FromArray(lut, data);
}

// LightLut_Phong — macro wrapper: LightLut_FromFunc(lut, powf, shininess, false).
void light_lut_phong(C3D_LightLut* lut, uint32_t shininess) {
    LightLut_Phong(lut, u2f(shininess));
}

void light_lut_from_func(C3D_LightLut* lut, C3D_LightLutFunc func,
                          uint32_t param, bool negative) {
    LightLut_FromFunc(lut, func, u2f(param), negative);
}

void light_lut_da_create(C3D_LightLutDA* lut, C3D_LightLutFuncDA func,
                          uint32_t from_, uint32_t to,
                          uint32_t arg0, uint32_t arg1) {
    LightLutDA_Create(lut, func, u2f(from_), u2f(to), u2f(arg0), u2f(arg1));
}

// ----------------------------------------------------------------
// Fog / gas
// ----------------------------------------------------------------

void fog_lut_exp(C3D_FogLut* lut,
                 uint32_t density, uint32_t gradient,
                 uint32_t near,    uint32_t far) {
    FogLut_Exp(lut, u2f(density), u2f(gradient), u2f(near), u2f(far));
}

void c3d_gas_delta_z(uint32_t value)            { C3D_GasDeltaZ(u2f(value)); }
void c3d_gas_acc_max(uint32_t value)            { C3D_GasAccMax(u2f(value)); }
void c3d_gas_attn(uint32_t value)               { C3D_GasAttn(u2f(value)); }

void c3d_gas_light_planar(uint32_t min, uint32_t max, uint32_t delta) {
    C3D_GasLightPlanar(u2f(min), u2f(max), u2f(delta));
}

void c3d_gas_light_view(uint32_t min, uint32_t max, uint32_t delta) {
    C3D_GasLightView(u2f(min), u2f(max), u2f(delta));
}

// ----------------------------------------------------------------
// Procedural texture
// ----------------------------------------------------------------

void c3d_proc_tex_noise_coefs(C3D_ProcTex* pt, int coord,
                               uint32_t amplitude, uint32_t frequency,
                               uint32_t phase) {
    C3D_ProcTexNoiseCoefs(pt, coord, u2f(amplitude), u2f(frequency), u2f(phase));
}

void c3d_proc_tex_lod_bias(C3D_ProcTex* pt, uint32_t bias) {
    C3D_ProcTexLodBias(pt, u2f(bias));
}

void proc_tex_lut_from_array(C3D_ProcTexLut* lut, float* data) {
    ProcTexLut_FromArray(lut, data);
}

// ----------------------------------------------------------------
// Uniform matrix upload — C3D_FVUnifMtx4x4/3x4/2x4 are static inline
// in c3d/uniforms.h; they just call C3D_FVUnifMtxNx4 with a fixed count.
// ----------------------------------------------------------------

void c3d_fvunif_mtx_nx4(GPU_SHADER_TYPE type, int id, C3D_Mtx* mtx, int num) {
    C3D_FVUnifMtxNx4(type, id, mtx, num);
}

void c3d_fvunif_mtx4x4(GPU_SHADER_TYPE type, int id, C3D_Mtx* mtx) {
    C3D_FVUnifMtx4x4(type, id, mtx);
}

void c3d_fvunif_mtx3x4(GPU_SHADER_TYPE type, int id, C3D_Mtx* mtx) {
    C3D_FVUnifMtx3x4(type, id, mtx);
}

void c3d_fvunif_mtx2x4(GPU_SHADER_TYPE type, int id, C3D_Mtx* mtx) {
    C3D_FVUnifMtx2x4(type, id, mtx);
}

// ----------------------------------------------------------------
// TexEnv — all static inline in c3d/texenv.h; bridged so Odin can
// call them without linking errors.
// None of these take float params, so no u2f/f2u needed.
// ----------------------------------------------------------------

void c3d_tex_env_init(C3D_TexEnv* env) {
    C3D_TexEnvInit(env);
}

void c3d_tex_env_src(C3D_TexEnv* env, C3D_TexEnvMode mode,
                     GPU_TEVSRC s1, GPU_TEVSRC s2, GPU_TEVSRC s3) {
    C3D_TexEnvSrc(env, mode, s1, s2, s3);
}

void c3d_tex_env_op_rgb(C3D_TexEnv* env,
                        GPU_TEVOP_RGB o1, GPU_TEVOP_RGB o2, GPU_TEVOP_RGB o3) {
    C3D_TexEnvOpRgb(env, o1, o2, o3);
}

void c3d_tex_env_op_alpha(C3D_TexEnv* env,
                          GPU_TEVOP_A o1, GPU_TEVOP_A o2, GPU_TEVOP_A o3) {
    C3D_TexEnvOpAlpha(env, o1, o2, o3);
}

void c3d_tex_env_func(C3D_TexEnv* env, C3D_TexEnvMode mode, GPU_COMBINEFUNC func) {
    C3D_TexEnvFunc(env, mode, func);
}

void c3d_tex_env_color(C3D_TexEnv* env, uint32_t color) {
    C3D_TexEnvColor(env, color);
}

void c3d_tex_env_scale(C3D_TexEnv* env, C3D_TexEnvMode mode, GPU_TEVSCALE scale) {
    C3D_TexEnvScale(env, mode, scale);
}

// ----------------------------------------------------------------
// C3D_TexInit — static inline in c3d/texture.h.
// Calls C3D_TexInitWithParams with NULL cube and sensible defaults.
// ----------------------------------------------------------------

bool c3d_tex_init(C3D_Tex* tex, uint16_t width, uint16_t height,
                  GPU_TEXCOLOR colorFmt) {
    return C3D_TexInit(tex, width, height, colorFmt);
}

// C3D_TexSetFilter — static inline in c3d/texture.h.
// Sets the magnification and minification filter on a texture.
// All params are integer-typed enums; no u2f conversion required.
void c3d_tex_set_filter(C3D_Tex* tex,
                        GPU_TEXTURE_FILTER_PARAM magFilter,
                        GPU_TEXTURE_FILTER_PARAM minFilter) {
    C3D_TexSetFilter(tex, magFilter, minFilter);
}

// C3D_TexSetWrap — static inline in c3d/texture.h.
// Sets the S and T (U and V) wrap modes on a texture.
void c3d_tex_set_wrap(C3D_Tex* tex,
                      GPU_TEXTURE_WRAP_PARAM wrapS,
                      GPU_TEXTURE_WRAP_PARAM wrapT) {
    C3D_TexSetWrap(tex, wrapS, wrapT);
}

// C3D_Tex2DGetImagePtr (level 0) — static inline in c3d/texture.h.
// Returns a pointer to the raw pixel data buffer allocated by C3D_TexInit.
// Use this to write Morton-tiled pixel data directly into GPU memory,
// then call C3D_TexFlush to make it visible to the GPU.
void* c3d_tex2d_get_image_ptr(C3D_Tex* tex) {
    return C3D_Tex2DGetImagePtr(tex, 0, NULL);
}

// ----------------------------------------------------------------
// C3D_RenderTargetClear — static inline in c3d/renderqueue.h.
// Calls C3D_FrameBufClear on the target's embedded framebuffer.
// ----------------------------------------------------------------

void c3d_render_target_clear(void* target, C3D_ClearBits clearBits,
                              uint32_t clearColor, uint32_t clearDepth) {
    C3D_RenderTargetClear((C3D_RenderTarget*)target, clearBits,
                          clearColor, clearDepth);
}

// ----------------------------------------------------------------
// sqrtf bridge — Odin soft-float can't call libm sqrtf directly.
// ----------------------------------------------------------------

uint32_t odin_sqrtf(uint32_t x) { return f2u(sqrtf(u2f(x))); }

// ----------------------------------------------------------------
// Projection matrices (all take float params)
// ----------------------------------------------------------------

void mtx_ortho_tilt(C3D_Mtx* mtx,
                    uint32_t left,  uint32_t right,
                    uint32_t bottom, uint32_t top,
                    uint32_t near,  uint32_t far,
                    bool leftHanded) {
    Mtx_OrthoTilt(mtx,
                  u2f(left), u2f(right),
                  u2f(bottom), u2f(top),
                  u2f(near), u2f(far),
                  leftHanded);
}

void mtx_ortho(C3D_Mtx* mtx,
               uint32_t left,  uint32_t right,
               uint32_t bottom, uint32_t top,
               uint32_t near,  uint32_t far,
               bool isLeftHanded) {
    Mtx_Ortho(mtx,
              u2f(left), u2f(right),
              u2f(bottom), u2f(top),
              u2f(near), u2f(far),
              isLeftHanded);
}

void mtx_persp(C3D_Mtx* mtx,
               uint32_t fovy, uint32_t aspect,
               uint32_t near, uint32_t far,
               bool isLeftHanded) {
    Mtx_Persp(mtx, u2f(fovy), u2f(aspect), u2f(near), u2f(far), isLeftHanded);
}

void mtx_persp_tilt(C3D_Mtx* mtx,
                    uint32_t fovy, uint32_t aspect,
                    uint32_t near, uint32_t far,
                    bool isLeftHanded) {
    Mtx_PerspTilt(mtx, u2f(fovy), u2f(aspect), u2f(near), u2f(far), isLeftHanded);
}

void mtx_persp_stereo(C3D_Mtx* mtx,
                      uint32_t fovy, uint32_t aspect,
                      uint32_t near, uint32_t far,
                      uint32_t iod,  uint32_t screen,
                      bool isLeftHanded) {
    Mtx_PerspStereo(mtx, u2f(fovy), u2f(aspect), u2f(near), u2f(far),
                    u2f(iod), u2f(screen), isLeftHanded);
}

void mtx_persp_stereo_tilt(C3D_Mtx* mtx,
                            uint32_t fovy, uint32_t aspect,
                            uint32_t near, uint32_t far,
                            uint32_t iod,  uint32_t screen,
                            bool isLeftHanded) {
    Mtx_PerspStereoTilt(mtx, u2f(fovy), u2f(aspect), u2f(near), u2f(far),
                        u2f(iod), u2f(screen), isLeftHanded);
}

// ----------------------------------------------------------------
// Matrix transforms (take float params)
// ----------------------------------------------------------------

void mtx_translate(C3D_Mtx* mtx,
                   uint32_t x, uint32_t y, uint32_t z,
                   bool bRightSide) {
    Mtx_Translate(mtx, u2f(x), u2f(y), u2f(z), bRightSide);
}

void mtx_scale(C3D_Mtx* mtx, uint32_t x, uint32_t y, uint32_t z) {
    Mtx_Scale(mtx, u2f(x), u2f(y), u2f(z));
}

void mtx_rotate_x(C3D_Mtx* mtx, uint32_t angle, bool bRightSide) {
    Mtx_RotateX(mtx, u2f(angle), bRightSide);
}

void mtx_rotate_y(C3D_Mtx* mtx, uint32_t angle, bool bRightSide) {
    Mtx_RotateY(mtx, u2f(angle), bRightSide);
}

void mtx_rotate_z(C3D_Mtx* mtx, uint32_t angle, bool bRightSide) {
    Mtx_RotateZ(mtx, u2f(angle), bRightSide);
}

// Mtx_Rotate — axis is an FVec passed by value in citro3d (hard-float HFA).
// Accept it via pointer from Odin, then pass by value to citro3d.
void mtx_rotate(C3D_Mtx* mtx, C3D_FVec* axis, uint32_t angle, bool bRightSide) {
    Mtx_Rotate(mtx, *axis, u2f(angle), bRightSide);
}

// ----------------------------------------------------------------
// Matrix algebra — Mtx_Transpose/Multiply have only pointer params
// and are safe to call directly (declared as direct imports in Odin).
// Mtx_Inverse returns float — bridge returns bits.
// ----------------------------------------------------------------

uint32_t mtx_inverse(C3D_Mtx* out) {
    return f2u(Mtx_Inverse(out));
}

// ----------------------------------------------------------------
// Matrix × vector (FVec returned by value → use output pointer)
// ----------------------------------------------------------------

void mtx_multiply_fvec3(const C3D_Mtx* mtx, C3D_FVec* v, C3D_FVec* out) {
    *out = Mtx_MultiplyFVec3(mtx, *v);
}

void mtx_multiply_fvec4(const C3D_Mtx* mtx, C3D_FVec* v, C3D_FVec* out) {
    *out = Mtx_MultiplyFVec4(mtx, *v);
}

// ----------------------------------------------------------------
// Matrix from quaternion
// ----------------------------------------------------------------

void mtx_from_quat(C3D_Mtx* m, C3D_FQuat* q) {
    Mtx_FromQuat(m, *q);
}

// ----------------------------------------------------------------
// Look-At
// ----------------------------------------------------------------

void mtx_look_at(C3D_Mtx* out,
                 C3D_FVec* pos, C3D_FVec* target, C3D_FVec* up,
                 bool isLeftHanded) {
    Mtx_LookAt(out, *pos, *target, *up, isLeftHanded);
}

// ----------------------------------------------------------------
// Quaternion operations (all FQuat by value → output pointer pattern)
// ----------------------------------------------------------------

void quat_multiply(C3D_FQuat* lhs, C3D_FQuat* rhs, C3D_FQuat* out) {
    *out = Quat_Multiply(*lhs, *rhs);
}

void quat_pow(C3D_FQuat* q, uint32_t p, C3D_FQuat* out) {
    *out = Quat_Pow(*q, u2f(p));
}

void quat_cross_fvec3(C3D_FQuat* q, C3D_FVec* v, C3D_FVec* out) {
    *out = Quat_CrossFVec3(*q, *v);
}

void quat_rotate(C3D_FQuat* q, C3D_FVec* axis, uint32_t r,
                 bool bRightSide, C3D_FQuat* out) {
    *out = Quat_Rotate(*q, *axis, u2f(r), bRightSide);
}

void quat_rotate_x(C3D_FQuat* q, uint32_t r, bool bRightSide, C3D_FQuat* out) {
    *out = Quat_RotateX(*q, u2f(r), bRightSide);
}

void quat_rotate_y(C3D_FQuat* q, uint32_t r, bool bRightSide, C3D_FQuat* out) {
    *out = Quat_RotateY(*q, u2f(r), bRightSide);
}

void quat_rotate_z(C3D_FQuat* q, uint32_t r, bool bRightSide, C3D_FQuat* out) {
    *out = Quat_RotateZ(*q, u2f(r), bRightSide);
}

void quat_from_mtx(const C3D_Mtx* m, C3D_FQuat* out) {
    *out = Quat_FromMtx(m);
}

void quat_from_pitch_yaw_roll(uint32_t pitch, uint32_t yaw, uint32_t roll,
                               bool bRightSide, C3D_FQuat* out) {
    *out = Quat_FromPitchYawRoll(u2f(pitch), u2f(yaw), u2f(roll), bRightSide);
}

void quat_look_at(C3D_FVec* source, C3D_FVec* target,
                  C3D_FVec* forward, C3D_FVec* up, C3D_FQuat* out) {
    *out = Quat_LookAt(*source, *target, *forward, *up);
}

void quat_from_axis_angle(C3D_FVec* axis, uint32_t angle, C3D_FQuat* out) {
    *out = Quat_FromAxisAngle(*axis, u2f(angle));
}
