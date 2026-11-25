package c3d

import "core:math"

// ============================================================
// Citro3D — full math library  (Phase 8)
// Source: citro3d/include/c3d/maths.h
//
// ── Field-name mapping ──────────────────────────────────────
// The C union C3D_FVec stores floats in reverse order, and the Odin
// struct { w, z, y, x: f32 } matches it field for field, so a field name
// is the component it names: .x is C's .x (offset 12), .w is C's .w
// (offset 0). C3D_FVec{ x = 1, y = 2, z = 3, w = 4 } is what it reads as.
//
// For quaternions (C: { float r; float k; float j; float i; }):
//   .x = i, .y = j, .z = k, .w = r (the real part, offset 0)
//
// ── sin / cos / sqrt ────────────────────────────────────────
// core:math sin_f32, cos_f32, sqrt_f32 are all proc "contextless"
// and use LLVM intrinsics (llvm.sin.f32 etc.) that the ARM backend
// lowers to VFP instructions inline — no C ABI involvement, no
// soft-float / hard-float mismatch.
// ============================================================

// ── Screen constants ─────────────────────────────────────────
C3D_AspectRatioTop :: f32(400.0 / 240.0) // top screen: 400×240
C3D_AspectRatioBot :: f32(320.0 / 240.0) // bottom screen: 320×240

// ── Angle helpers ────────────────────────────────────────────
C3D_TAU :: f32(6.28318530717958647692528676655900576)
C3D_PI  :: C3D_TAU * 0.5

C3D_Angle           :: #force_inline proc "contextless" (revolutions: f32) -> f32 { return revolutions * C3D_TAU }
C3D_AngleFromDegrees :: #force_inline proc "contextless" (deg: f32)        -> f32 { return deg * C3D_TAU / 360.0 }

// ── Short aliases (strip C3D_ prefix) ──────────────────────────────────────
AspectRatioTop   :: C3D_AspectRatioTop
AspectRatioBot   :: C3D_AspectRatioBot
TAU              :: C3D_TAU
PI               :: C3D_PI
Angle            :: C3D_Angle
AngleFromDegrees :: C3D_AngleFromDegrees

// ============================================================
// FVec4 operations  (all proc "contextless" — no ABI bridge needed)
// ============================================================

// FVec4_New — create a C3D_FVec from (x, y, z, w).
FVec4_New :: #force_inline proc "contextless" (lx, ly, lz, lw: f32) -> C3D_FVec {
    return C3D_FVec{ x = lx, y = ly, z = lz, w = lw }
}

FVec4_Add :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = a.x + b.x, y = a.y + b.y, z = a.z + b.z, w = a.w + b.w }
}

FVec4_Subtract :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = a.x - b.x, y = a.y - b.y, z = a.z - b.z, w = a.w - b.w }
}

FVec4_Negate :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = -v.x, y = -v.y, z = -v.z, w = -v.w }
}

FVec4_Scale :: #force_inline proc "contextless" (v: C3D_FVec, s: f32) -> C3D_FVec {
    return C3D_FVec{ x = v.x * s, y = v.y * s, z = v.z * s, w = v.w * s }
}

// FVec4_PerspDivide — divide xyz by w; w becomes 1.
FVec4_PerspDivide :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    inv := 1.0 / v.w
    return C3D_FVec{ x = v.x * inv, y = v.y * inv, z = v.z * inv, w = 1.0 }
}

FVec4_Dot :: #force_inline proc "contextless" (a, b: C3D_FVec) -> f32 {
    return a.x*b.x + a.y*b.y + a.z*b.z + a.w*b.w
}

FVec4_Magnitude :: #force_inline proc "contextless" (v: C3D_FVec) -> f32 {
    return math.sqrt_f32(FVec4_Dot(v, v))
}

FVec4_Normalize :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    return FVec4_Scale(v, 1.0 / FVec4_Magnitude(v))
}

// ============================================================
// FVec3 operations  (the w component is always 0)
// ============================================================

FVec3_New :: #force_inline proc "contextless" (lx, ly, lz: f32) -> C3D_FVec {
    return C3D_FVec{ x = lx, y = ly, z = lz, w = 0 }
}

FVec3_Dot :: #force_inline proc "contextless" (a, b: C3D_FVec) -> f32 {
    return a.x*b.x + a.y*b.y + a.z*b.z
}

FVec3_Magnitude :: #force_inline proc "contextless" (v: C3D_FVec) -> f32 {
    return math.sqrt_f32(FVec3_Dot(v, v))
}

FVec3_Normalize :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    m := FVec3_Magnitude(v)
    return C3D_FVec{ x = v.x / m, y = v.y / m, z = v.z / m, w = 0 }
}

FVec3_Add :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = a.x + b.x, y = a.y + b.y, z = a.z + b.z, w = 0 }
}

FVec3_Subtract :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = a.x - b.x, y = a.y - b.y, z = a.z - b.z, w = 0 }
}

FVec3_Distance :: #force_inline proc "contextless" (a, b: C3D_FVec) -> f32 {
    return FVec3_Magnitude(FVec3_Subtract(a, b))
}

FVec3_Scale :: #force_inline proc "contextless" (v: C3D_FVec, s: f32) -> C3D_FVec {
    return C3D_FVec{ x = v.x * s, y = v.y * s, z = v.z * s, w = 0 }
}

FVec3_Negate :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = -v.x, y = -v.y, z = -v.z, w = 0 }
}

// FVec3_Cross — A×B = (Ay·Bz−Az·By, Az·Bx−Ax·Bz, Ax·By−Ay·Bx).
FVec3_Cross :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{
        x = a.y*b.z - a.z*b.y,
        y = a.z*b.x - a.x*b.z,
        z = a.x*b.y - a.y*b.x,
        w = 0,
    }
}

// ============================================================
// Basic matrix operations
// ============================================================

Mtx_Zeros :: #force_inline proc "contextless" (out: ^C3D_Mtx) {
    out^ = {}
}

Mtx_Copy :: #force_inline proc "contextless" (dst, src: ^C3D_Mtx) {
    dst^ = src^
}

// Mtx_Diagonal — sets the diagonal: r[0].x, r[1].y, r[2].z, r[3].w.
Mtx_Diagonal :: proc "contextless" (out: ^C3D_Mtx, x, y, z, w: f32) {
    out^ = {}
    out.r[0].x = x
    out.r[1].y = y
    out.r[2].z = z
    out.r[3].w = w
}

Mtx_Identity :: #force_inline proc "contextless" (out: ^C3D_Mtx) {
    Mtx_Diagonal(out, 1.0, 1.0, 1.0, 1.0)
}

Mtx_Add :: proc "contextless" (out, lhs, rhs: ^C3D_Mtx) {
    lo := transmute(^[16]f32)(lhs)
    ro := transmute(^[16]f32)(rhs)
    oo := transmute(^[16]f32)(out)
    for i in 0..<16 {
        oo[i] = lo[i] + ro[i]
    }
}

Mtx_Subtract :: proc "contextless" (out, lhs, rhs: ^C3D_Mtx) {
    lo := transmute(^[16]f32)(lhs)
    ro := transmute(^[16]f32)(rhs)
    oo := transmute(^[16]f32)(out)
    for i in 0..<16 {
        oo[i] = lo[i] - ro[i]
    }
}

// ============================================================
// Matrix × vector, matrix × matrix, transpose — citro3d's own code
//
// These used to be written in Odin over the raw [4][4]f32 memory. That
// memory holds each row as (w, z, y, x), so a loop over it in index order
// pairs the wrong elements: Mtx_Multiply(a, identity) came back with every
// row reversed, and Mtx_Translate (which multiplies) and Mtx_Transpose were
// wrong with it. Calling the C functions keeps the layout citro3d's
// problem. Mtx_Multiply and Mtx_Transpose take only pointers, so they are
// called directly; the vector products return a C3D_FVec by value and go
// through bridge.c.
// ============================================================

foreign import citro3d_math "system:citro3d"

@(default_calling_convention = "c")
foreign citro3d_math {
    // out = a * b. out may be the same matrix as a or b.
    Mtx_Multiply :: proc(out, a, b: ^C3D_Mtx) ---

    // Transposes the matrix in place.
    Mtx_Transpose :: proc(out: ^C3D_Mtx) ---
}

// Mtx_MultiplyFVec4 — M * v, full 4×4 transform.
Mtx_MultiplyFVec4 :: proc "contextless" (mtx: ^C3D_Mtx, v: C3D_FVec) -> C3D_FVec {
    v_in := v
    out: C3D_FVec
    _Mtx_MultiplyFVec4_bridge(mtx, &v_in, &out)
    return out
}

// Mtx_MultiplyFVec3 — the 3×3 part of M times a 3-component vector.
Mtx_MultiplyFVec3 :: proc "contextless" (mtx: ^C3D_Mtx, v: C3D_FVec) -> C3D_FVec {
    v_in := v
    out: C3D_FVec
    _Mtx_MultiplyFVec3_bridge(mtx, &v_in, &out)
    return out
}

// Mtx_MultiplyFVecH — M * (v.xyz, 1).
Mtx_MultiplyFVecH :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, v: C3D_FVec) -> C3D_FVec {
    v4 := v
    v4.w = 1.0
    return Mtx_MultiplyFVec4(mtx, v4)
}

// ============================================================
// Projection matrices — citro3d's own code through bridge.c
//
// These were Odin re-derivations, written when the float bridges did not
// work. The bridges work now, so these call citro3d directly and match it
// exactly. Use C3D_DepthMap(true, -1.0, 0.0) with them, as the examples do.
// ============================================================

Mtx_Ortho :: #force_inline proc "contextless" (out: ^C3D_Mtx,
                                                left, right, bottom, top, near, far: f32,
                                                isLeftHanded: bool) {
    _Mtx_Ortho_bridge(out, left, right, bottom, top, near, far, isLeftHanded)
}

// Orthographic projection turned 90 degrees for the 3DS screens.
Mtx_OrthoTilt :: #force_inline proc "contextless" (out: ^C3D_Mtx,
                                                    left, right, bottom, top, near, far: f32,
                                                    isLeftHanded: bool) {
    _Mtx_OrthoTilt_bridge(out, left, right, bottom, top, near, far, isLeftHanded)
}

Mtx_Persp :: #force_inline proc "contextless" (out: ^C3D_Mtx,
                                                fovy, aspect, near, far: f32,
                                                isLeftHanded: bool) {
    _Mtx_Persp_bridge(out, fovy, aspect, near, far, isLeftHanded)
}

// Perspective projection turned 90 degrees for the 3DS screens. Same as
// Mtx_PerspTilt_Bridge in base.odin.
Mtx_PerspTilt :: #force_inline proc "contextless" (out: ^C3D_Mtx,
                                                    fovy, aspect, near, far: f32,
                                                    isLeftHanded: bool) {
    _Mtx_PerspTilt_bridge(out, fovy, aspect, near, far, isLeftHanded)
}

// ============================================================
// Transform matrices  (native, no bridge needed)
//
// Each function applies the transform either right-side (out = out * T)
// or left-side (out = T * out) according to bRightSide.
//
// Rotation matrices use standard right-handed conventions:
//   RotateX: CCW around +X  RotateY: CCW around +Y  RotateZ: CCW around +Z
// For 3DS left-handed convention the cube still spins — just adjust
// the sign of the angle if the direction is wrong for your scene.
// ============================================================

// Mtx_Scale — multiply each column of the matrix by (x, y, z).
// Equivalent to: out = out * diag(x, y, z, 1).
//
// Routed through the C bridge (mtx_scale in bridge.c → citro3d Mtx_Scale).
Mtx_Scale :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, x, y, z: f32) {
    _Mtx_Scale_bridge(mtx, x, y, z)
}

// Mtx_Translate — apply a translation (x, y, z) to the matrix, on the
// right (mtx = mtx * T) or the left (mtx = T * mtx). Through the C bridge,
// like Mtx_Scale and the rotations.
Mtx_Translate :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, x, y, z: f32, bRightSide: bool) {
    _Mtx_Translate_bridge(mtx, x, y, z, bRightSide)
}

// Mtx_RotateX/Y/Z — route through the C bridge.
// The native implementations called math.sin_f32/cos_f32, which cross the
// VFP ABI boundary: Odin passes floats in integer registers (soft-float)
// while devkitARM's sinf/cosf expect them in VFP registers (hard-float).
// The bridge functions (mtx_rotate_x/y/z in bridge.c) accept the angle as
// a uint32 bit-pattern (u2f) so the float crosses safely.
Mtx_RotateX :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, angle: f32, bRightSide: bool) {
    _Mtx_RotateX_bridge(mtx, angle, bRightSide)
}

Mtx_RotateY :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, angle: f32, bRightSide: bool) {
    _Mtx_RotateY_bridge(mtx, angle, bRightSide)
}

Mtx_RotateZ :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, angle: f32, bRightSide: bool) {
    _Mtx_RotateZ_bridge(mtx, angle, bRightSide)
}

// ============================================================
// Quaternion helpers  (native, contextless)
// ============================================================

Quat_New :: #force_inline proc "contextless" (i, j, k, r: f32) -> C3D_FQuat {
    return FVec4_New(i, j, k, r)
}

Quat_Negate    :: FVec4_Negate
Quat_Add       :: FVec4_Add
Quat_Subtract  :: FVec4_Subtract
Quat_Scale     :: FVec4_Scale
Quat_Normalize :: FVec4_Normalize
Quat_Dot       :: FVec4_Dot

// Quat_Identity = (i=0, j=0, k=0, r=1).
Quat_Identity :: #force_inline proc "contextless" () -> C3D_FQuat {
    return C3D_FVec{ x = 0, y = 0, z = 0, w = 1.0 }
}

// Quat_Conjugate — negate vector part: C Quat_New(-q.i, -q.j, -q.k, q.r)
Quat_Conjugate :: #force_inline proc "contextless" (q: C3D_FQuat) -> C3D_FQuat {
    return C3D_FVec{ x = -q.x, y = -q.y, z = -q.z, w = q.w }
}

// Quat_Inverse — q* / (q∙q)
Quat_Inverse :: #force_inline proc "contextless" (q: C3D_FQuat) -> C3D_FQuat {
    c := Quat_Conjugate(q)
    d := FVec4_Dot(q, q)
    return FVec4_Scale(c, 1.0 / d)
}

// FVec3_CrossQuat — v×q = (q^-1)×v.  Calls the bridged Quat_CrossFVec3.
// Not contextless: Quat_CrossFVec3 is a regular Odin-convention wrapper.
FVec3_CrossQuat :: #force_inline proc(v: C3D_FVec, q: C3D_FQuat) -> C3D_FVec {
    return Quat_CrossFVec3(Quat_Inverse(q), v)
}

// ============================================================
// Bridge bindings — only for functions that are complex to
// reimplement natively: Mtx_Inverse (float return), Mtx_FromQuat,
// Mtx_LookAt, Mtx_Rotate (arbitrary axis), stereo projections,
// and all quaternion operations.
// ============================================================

foreign import c3d_bridge "system:c3d_bridge"

@(default_calling_convention = "c")
foreign c3d_bridge {

    // ── Mtx_Inverse (float return — bridge returns bits as u32) ──
    @(link_name = "mtx_inverse")
    _Mtx_Inverse_bits :: proc(out: ^C3D_Mtx) -> u32 ---

    // ── Matrix from quaternion ───────────────────────────────────
    @(link_name = "mtx_from_quat")
    _Mtx_FromQuat_bridge :: proc(m: ^C3D_Mtx, q: ^C3D_FQuat) ---

    // ── Look-At ─────────────────────────────────────────────────
    @(link_name = "mtx_look_at")
    _Mtx_LookAt_bridge :: proc(out: ^C3D_Mtx,
                               pos, target, up: ^C3D_FVec,
                               isLeftHanded: bool) ---

    // ── Translate (float params via soft-float bits) ─────────────
    @(link_name = "mtx_translate")
    _Mtx_Translate_bridge :: proc(mtx: ^C3D_Mtx, x, y, z: f32, bRightSide: bool) ---

    // ── Matrix × vector (C returns the vector by value) ──────────
    @(link_name = "mtx_multiply_fvec4")
    _Mtx_MultiplyFVec4_bridge :: proc(mtx: ^C3D_Mtx, v, out: ^C3D_FVec) ---

    @(link_name = "mtx_multiply_fvec3")
    _Mtx_MultiplyFVec3_bridge :: proc(mtx: ^C3D_Mtx, v, out: ^C3D_FVec) ---

    // ── Projections (float params via soft-float bits) ───────────
    @(link_name = "mtx_ortho")
    _Mtx_Ortho_bridge :: proc(mtx: ^C3D_Mtx, left, right, bottom, top, near, far: f32, isLeftHanded: bool) ---

    @(link_name = "mtx_ortho_tilt")
    _Mtx_OrthoTilt_bridge :: proc(mtx: ^C3D_Mtx, left, right, bottom, top, near, far: f32, isLeftHanded: bool) ---

    @(link_name = "mtx_persp")
    _Mtx_Persp_bridge :: proc(mtx: ^C3D_Mtx, fovy, aspect, near, far: f32, isLeftHanded: bool) ---

    @(link_name = "mtx_persp_tilt")
    _Mtx_PerspTilt_bridge :: proc(mtx: ^C3D_Mtx, fovy, aspect, near, far: f32, isLeftHanded: bool) ---

    // ── Scale (direct column multiply — float params via soft-float bits) ───
    @(link_name = "mtx_scale")
    _Mtx_Scale_bridge :: proc(mtx: ^C3D_Mtx, x, y, z: f32) ---

    // ── Rotate by cardinal axes (float angle via soft-float bits) ───
    @(link_name = "mtx_rotate_x")
    _Mtx_RotateX_bridge :: proc(mtx: ^C3D_Mtx, angle: f32, bRightSide: bool) ---

    @(link_name = "mtx_rotate_y")
    _Mtx_RotateY_bridge :: proc(mtx: ^C3D_Mtx, angle: f32, bRightSide: bool) ---

    @(link_name = "mtx_rotate_z")
    _Mtx_RotateZ_bridge :: proc(mtx: ^C3D_Mtx, angle: f32, bRightSide: bool) ---

    // ── Rotate by arbitrary axis ────────────────────────────────
    @(link_name = "mtx_rotate")
    _Mtx_Rotate_bridge :: proc(mtx: ^C3D_Mtx, axis: ^C3D_FVec,
                               angle: f32, bRightSide: bool) ---

    // ── Stereo projections ───────────────────────────────────────
    @(link_name = "mtx_persp_stereo")
    Mtx_PerspStereo :: proc(mtx: ^C3D_Mtx,
                            fovy, aspect, near, far, iod, screen: f32,
                            isLeftHanded: bool) ---

    @(link_name = "mtx_persp_stereo_tilt")
    Mtx_PerspStereoTilt :: proc(mtx: ^C3D_Mtx,
                                fovy, aspect, near, far, iod, screen: f32,
                                isLeftHanded: bool) ---

    // ── Quaternion operations (all take/return FVec by value) ───
    @(link_name = "quat_multiply")
    _Quat_Multiply_bridge :: proc(lhs, rhs: ^C3D_FQuat, out: ^C3D_FQuat) ---

    @(link_name = "quat_pow")
    _Quat_Pow_bridge :: proc(q: ^C3D_FQuat, p: f32, out: ^C3D_FQuat) ---

    @(link_name = "quat_cross_fvec3")
    _Quat_CrossFVec3_bridge :: proc(q: ^C3D_FQuat, v: ^C3D_FVec, out: ^C3D_FVec) ---

    @(link_name = "quat_rotate")
    _Quat_Rotate_bridge :: proc(q: ^C3D_FQuat, axis: ^C3D_FVec,
                                r: f32, bRightSide: bool, out: ^C3D_FQuat) ---

    @(link_name = "quat_rotate_x")
    _Quat_RotateX_bridge :: proc(q: ^C3D_FQuat, r: f32, bRightSide: bool, out: ^C3D_FQuat) ---

    @(link_name = "quat_rotate_y")
    _Quat_RotateY_bridge :: proc(q: ^C3D_FQuat, r: f32, bRightSide: bool, out: ^C3D_FQuat) ---

    @(link_name = "quat_rotate_z")
    _Quat_RotateZ_bridge :: proc(q: ^C3D_FQuat, r: f32, bRightSide: bool, out: ^C3D_FQuat) ---

    @(link_name = "quat_from_mtx")
    _Quat_FromMtx_bridge :: proc(m: ^C3D_Mtx, out: ^C3D_FQuat) ---

    @(link_name = "quat_from_pitch_yaw_roll")
    _Quat_FromPitchYawRoll_bridge :: proc(pitch, yaw, roll: f32,
                                          bRightSide: bool, out: ^C3D_FQuat) ---

    @(link_name = "quat_look_at")
    _Quat_LookAt_bridge :: proc(source, target, forward, up: ^C3D_FVec,
                                out: ^C3D_FQuat) ---

    @(link_name = "quat_from_axis_angle")
    _Quat_FromAxisAngle_bridge :: proc(axis: ^C3D_FVec, angle: f32, out: ^C3D_FQuat) ---
}

// ── Odin-side wrappers ────────────────────────────────────────────────────

Mtx_Inverse :: #force_inline proc(out: ^C3D_Mtx) -> f32 {
    return transmute(f32)(_Mtx_Inverse_bits(out))
}

Mtx_FromQuat :: #force_inline proc(m: ^C3D_Mtx, q: C3D_FQuat) {
    q_ := q
    _Mtx_FromQuat_bridge(m, &q_)
}

Mtx_LookAt :: #force_inline proc(out: ^C3D_Mtx,
                                  pos, target, up: C3D_FVec,
                                  isLeftHanded: bool) {
    p_ := pos
    t_ := target
    u_ := up
    _Mtx_LookAt_bridge(out, &p_, &t_, &u_, isLeftHanded)
}

Mtx_Rotate :: #force_inline proc(mtx: ^C3D_Mtx,
                                  axis: C3D_FVec, angle: f32, bRightSide: bool) {
    a_ := axis
    _Mtx_Rotate_bridge(mtx, &a_, angle, bRightSide)
}

Quat_Multiply :: #force_inline proc(lhs, rhs: C3D_FQuat) -> C3D_FQuat {
    l_ := lhs
    r_ := rhs
    out: C3D_FQuat
    _Quat_Multiply_bridge(&l_, &r_, &out)
    return out
}

Quat_Pow :: #force_inline proc(q: C3D_FQuat, p: f32) -> C3D_FQuat {
    q_ := q
    out: C3D_FQuat
    _Quat_Pow_bridge(&q_, p, &out)
    return out
}

Quat_CrossFVec3 :: #force_inline proc(q: C3D_FQuat, v: C3D_FVec) -> C3D_FVec {
    q_ := q
    v_ := v
    out: C3D_FVec
    _Quat_CrossFVec3_bridge(&q_, &v_, &out)
    return out
}

Quat_Rotate :: #force_inline proc(q: C3D_FQuat, axis: C3D_FVec,
                                   r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q
    a_ := axis
    out: C3D_FQuat
    _Quat_Rotate_bridge(&q_, &a_, r, bRightSide, &out)
    return out
}

Quat_RotateX :: #force_inline proc(q: C3D_FQuat, r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q
    out: C3D_FQuat
    _Quat_RotateX_bridge(&q_, r, bRightSide, &out)
    return out
}

Quat_RotateY :: #force_inline proc(q: C3D_FQuat, r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q
    out: C3D_FQuat
    _Quat_RotateY_bridge(&q_, r, bRightSide, &out)
    return out
}

Quat_RotateZ :: #force_inline proc(q: C3D_FQuat, r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q
    out: C3D_FQuat
    _Quat_RotateZ_bridge(&q_, r, bRightSide, &out)
    return out
}

Quat_FromMtx :: #force_inline proc(m: ^C3D_Mtx) -> C3D_FQuat {
    out: C3D_FQuat
    _Quat_FromMtx_bridge(m, &out)
    return out
}

Quat_FromPitchYawRoll :: #force_inline proc(pitch, yaw, roll: f32,
                                             bRightSide: bool) -> C3D_FQuat {
    out: C3D_FQuat
    _Quat_FromPitchYawRoll_bridge(pitch, yaw, roll, bRightSide, &out)
    return out
}

Quat_LookAt :: #force_inline proc(source, target, forwardVector, upVector: C3D_FVec) -> C3D_FQuat {
    s_ := source
    t_ := target
    f_ := forwardVector
    u_ := upVector
    out: C3D_FQuat
    _Quat_LookAt_bridge(&s_, &t_, &f_, &u_, &out)
    return out
}

Quat_FromAxisAngle :: #force_inline proc(axis: C3D_FVec, angle: f32) -> C3D_FQuat {
    a_ := axis
    out: C3D_FQuat
    _Quat_FromAxisAngle_bridge(&a_, angle, &out)
    return out
}

// =====================================================}
