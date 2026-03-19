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

// ----------------------------------------------------------------
// Light LUTs
// ----------------------------------------------------------------

void light_lut_from_array(C3D_LightLut* lut, float* data) {
    LightLut_FromArray(lut, data);
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
