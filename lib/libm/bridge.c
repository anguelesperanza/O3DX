// ABI bridge for libm.
//
// Odin emits calls like sinf(x) with the float in r0 (soft-float convention).
// devkitARM's newlib libm (armv6k/fpu) is hard-float: it reads x from s0 and returns in s0.
// Without this bridge those calls silently return garbage.
//
// Each o3dx_* function takes and returns the raw bits in integer registers
// and calls the real libm function. The build renames the symbols inside
// Odin's object only (objcopy --redefine-syms=redefine.syms), so citro2d, citro3d, libctru and
// newlib themselves keep calling the real functions.
//
// redefine.syms lists EVERY libm function (tools/gen_libm_syms.py writes it),
// so a libm call that is not wrapped here fails at link time with
// "undefined reference to `o3dx_<name>'" instead of silently misbehaving.
// To fix that error, add the function below.

#include <math.h>
#include "../bridge_utils.h"

static inline double   u2d(uint64_t v) { double   d; memcpy(&d, &v, sizeof d); return d; }
static inline uint64_t d2u(double   d) { uint64_t v; memcpy(&v, &d, sizeof v); return v; }

#define F1(fn)  uint32_t o3dx_##fn##f(uint32_t a) { return f2u(fn##f(u2f(a))); }
#define F2(fn)  uint32_t o3dx_##fn##f(uint32_t a, uint32_t b) { return f2u(fn##f(u2f(a), u2f(b))); }
#define F3(fn)  uint32_t o3dx_##fn##f(uint32_t a, uint32_t b, uint32_t c) { return f2u(fn##f(u2f(a), u2f(b), u2f(c))); }
#define D1(fn)  uint64_t o3dx_##fn(uint64_t a) { return d2u(fn(u2d(a))); }
#define D2(fn)  uint64_t o3dx_##fn(uint64_t a, uint64_t b) { return d2u(fn(u2d(a), u2d(b))); }
#define D3(fn)  uint64_t o3dx_##fn(uint64_t a, uint64_t b, uint64_t c) { return d2u(fn(u2d(a), u2d(b), u2d(c))); }

#define ONE_ARG(X) \
    X(sin) X(cos) X(tan) X(asin) X(acos) X(atan) X(sinh) X(cosh) X(tanh) \
    X(exp) X(exp2) X(log) X(log2) X(log10) X(sqrt) X(cbrt) \
    X(floor) X(ceil) X(trunc) X(round) X(fabs) X(rint) X(nearbyint) \
    X(asinh) X(acosh) X(atanh) X(expm1) X(log1p)
#define TWO_ARG(X)   X(atan2) X(pow) X(fmod) X(fmin) X(fmax) X(hypot) X(copysign) X(remainder) X(fdim)
#define THREE_ARG(X) X(fma)

// ---------------------------------------------------------------
// libgcc conversion helpers.
//
// LLVM calls these for float <-> 64-bit integer conversions, e.g. `i64(x)` or
// `f64(some_u64)`; core:fmt and core:strconv use them when printing or parsing
// floats. devkitARM's libgcc copies are hard-float too, so they need the same treatment.
// The C casts below compile to the real helpers with the right convention.
// ---------------------------------------------------------------
int64_t  o3dx___fixdfdi(uint64_t a)     { return (int64_t)u2d(a); }
int64_t  o3dx___fixsfdi(uint32_t a)     { return (int64_t)u2f(a); }
uint64_t o3dx___fixunsdfdi(uint64_t a)  { return (uint64_t)u2d(a); }
uint64_t o3dx___fixunssfdi(uint32_t a)  { return (uint64_t)u2f(a); }
uint64_t o3dx___floatdidf(int64_t a)    { return d2u((double)a); }
uint32_t o3dx___floatdisf(int64_t a)    { return f2u((float)a); }
uint64_t o3dx___floatundidf(uint64_t a) { return d2u((double)a); }
uint32_t o3dx___floatundisf(uint64_t a) { return f2u((float)a); }
int32_t  o3dx___fixdfsi(uint64_t a)     { return (int32_t)u2d(a); }
int32_t  o3dx___fixsfsi(uint32_t a)     { return (int32_t)u2f(a); }
uint32_t o3dx___fixunsdfsi(uint64_t a)  { return (uint32_t)u2d(a); }
uint32_t o3dx___fixunssfsi(uint32_t a)  { return (uint32_t)u2f(a); }
uint64_t o3dx___floatsidf(int32_t a)    { return d2u((double)a); }
uint32_t o3dx___floatsisf(int32_t a)    { return f2u((float)a); }
uint64_t o3dx___floatunsidf(uint32_t a) { return d2u((double)a); }
uint32_t o3dx___floatunsisf(uint32_t a) { return f2u((float)a); }
uint64_t o3dx___extendsfdf2(uint32_t a) { return d2u((double)u2f(a)); }
uint32_t o3dx___truncdfsf2(uint64_t a)  { return f2u((float)u2d(a)); }
uint64_t o3dx___powidf2(uint64_t a, int b) { return d2u(__builtin_powi(u2d(a), b)); }
uint32_t o3dx___powisf2(uint32_t a, int b) { return f2u(__builtin_powif(u2f(a), b)); }

// Mixed float / integer signatures.
uint32_t o3dx_ldexpf(uint32_t a, int e)   { return f2u(ldexpf(u2f(a), e)); }
uint64_t o3dx_ldexp(uint64_t a, int e)    { return d2u(ldexp(u2d(a), e)); }
uint32_t o3dx_frexpf(uint32_t a, int *e)  { return f2u(frexpf(u2f(a), e)); }
uint64_t o3dx_frexp(uint64_t a, int *e)   { return d2u(frexp(u2d(a), e)); }
uint32_t o3dx_modff(uint32_t a, float *i) { return f2u(modff(u2f(a), i)); }
uint64_t o3dx_modf(uint64_t a, double *i) { return d2u(modf(u2d(a), i)); }
long      o3dx_lroundf(uint32_t a)  { return lroundf(u2f(a)); }
long      o3dx_lround(uint64_t a)   { return lround(u2d(a)); }
long long o3dx_llroundf(uint32_t a) { return llroundf(u2f(a)); }
long long o3dx_llround(uint64_t a)  { return llround(u2d(a)); }
long      o3dx_lrintf(uint32_t a)   { return lrintf(u2f(a)); }
long      o3dx_lrint(uint64_t a)    { return lrint(u2d(a)); }
long long o3dx_llrintf(uint32_t a)  { return llrintf(u2f(a)); }
long long o3dx_llrint(uint64_t a)   { return llrint(u2d(a)); }

ONE_ARG(F1)
TWO_ARG(F2)
THREE_ARG(F3)
ONE_ARG(D1)
TWO_ARG(D2)
THREE_ARG(D3)
