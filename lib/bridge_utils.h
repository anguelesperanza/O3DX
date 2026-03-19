#pragma once
#include <stdint.h>
#include <string.h>

// ----------------------------------------------------------------
// ABI bridge helpers — included by every bridge.c in this library.
//
// The 3DS devkitARM toolchain uses hard-float ABI: floats are passed
// and returned in VFP registers (s0, s1, …).  Odin targets the same
// platform with soft-float ABI: it passes f32 bit patterns in general-
// purpose integer registers (r0, r1, …).
//
// Bridge functions receive each "float" parameter as uint32_t (so the
// compiler keeps the bits in integer registers), then reinterpret them
// with u2f() before forwarding to the real hard-float library function.
// Float return values are wrapped with f2u() so the bits land in r0
// where soft-float Odin expects them.
// ----------------------------------------------------------------

static inline float    u2f(uint32_t v) { float    f; memcpy(&f, &v, sizeof f); return f; }
static inline uint32_t f2u(float    f) { uint32_t v; memcpy(&v, &f, sizeof v); return v; }
