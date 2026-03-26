// lib/ctru/bridge.c
//
// Wrappers for libctru functions that are declared as static inline in the
// headers and therefore have no exported linker symbol.  Odin cannot call
// them directly, so we expose them through plain C functions here.
//
// Compiled with hard-float ABI (-mfloat-abi=hard) and linked into every
// project that uses lib/ctru.

#include <3ds.h>
#include "../bridge_utils.h"

// ----------------------------------------------------------------
// romfs — read-only file system embedded inside the .3dsx binary.
// romfsInit / romfsExit are static inline in <3ds/romfs.h>.
// ----------------------------------------------------------------

uint32_t romfs_init(void) { return (uint32_t)romfsInit(); }
uint32_t romfs_exit(void) { return (uint32_t)romfsExit(); }

// ----------------------------------------------------------------
// irrst — IR receiver / extra input service (New 3DS C-stick).
// irrstInit, irrstExit, irrstScanInput, irrstCstickRead are static
// inline in <3ds/services/irrst.h>.
// ----------------------------------------------------------------

void irrst_init(void)                    { irrstInit(); }
void irrst_exit(void)                    { irrstExit(); }
void irrst_scan(void)                    { irrstScanInput(); }
void cstick_read(circlePosition* pos)    { irrstCstickRead(pos); }

// ----------------------------------------------------------------
// ndsp — Nintendo DSP audio service.
// These wrapper functions convert float arguments/return values
// between soft-float (Odin) and hard-float (libctru) using the
// u2f()/f2u() bit-cast macros from bridge_utils.h.
// ----------------------------------------------------------------

// Master volume
void     ndsp_set_master_vol(uint32_t vol)       { ndspSetMasterVol(u2f(vol)); }
uint32_t ndsp_get_master_vol(void)               { return f2u(ndspGetMasterVol()); }

// Auxiliary output volume
void     ndsp_aux_set_volume(int id, uint32_t v) { ndspAuxSetVolume(id, u2f(v)); }
uint32_t ndsp_aux_get_volume(int id)             { return f2u(ndspAuxGetVolume(id)); }

// Channel sample rate
void     ndsp_chn_set_rate(int id, uint32_t r)   { ndspChnSetRate(id, u2f(r)); }
uint32_t ndsp_chn_get_rate(int id)               { return f2u(ndspChnGetRate(id)); }

// IIR monopole filters
bool ndsp_chn_iir_mono_custom(int id, uint32_t a0, uint32_t a1, uint32_t b0) {
    return ndspChnIirMonoSetParamsCustomFilter(id, u2f(a0), u2f(a1), u2f(b0));
}
bool ndsp_chn_iir_mono_lpf(int id, uint32_t f0) {
    return ndspChnIirMonoSetParamsLowPassFilter(id, u2f(f0));
}
bool ndsp_chn_iir_mono_hpf(int id, uint32_t f0) {
    return ndspChnIirMonoSetParamsHighPassFilter(id, u2f(f0));
}

// IIR biquad filters
bool ndsp_chn_iir_biquad_custom(int id,
        uint32_t a0, uint32_t a1, uint32_t a2,
        uint32_t b0, uint32_t b1, uint32_t b2) {
    return ndspChnIirBiquadSetParamsCustomFilter(
        id, u2f(a0), u2f(a1), u2f(a2), u2f(b0), u2f(b1), u2f(b2));
}
bool ndsp_chn_iir_biquad_lpf(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsLowPassFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_hpf(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsHighPassFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_bpf(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsBandPassFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_notch(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsNotchFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_peq(int id, uint32_t f0, uint32_t Q, uint32_t gain) {
    return ndspChnIirBiquadSetParamsPeakingEqualizer(id, u2f(f0), u2f(Q), u2f(gain));
}
