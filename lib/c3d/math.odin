package c3d

import "core:math"

// ============================================================
// Citro3D — full math library  (Phase 8)
// Source: citro3d/include/c3d/maths.h
//
// ── Field-name mapping ──────────────────────────────────────
// The C union C3D_FVec stores floats in reverse order:
//   C struct: { float w; float z; float y; float x; }
//             at offsets  {0,       4,       8,       12}
// Odin struct { x, y, z, w: f32 } at the same offsets, so:
//   Odin .x (offset  0) = C .w  = logical W
//   Odin .y (offset  4) = C .z  = logical Z
//   Odin .z (offset  8) = C .y  = logical Y
//   Odin .w (offset 12) = C .x  = logical X
//
// Consequence: FVec4_New(lx, ly, lz, lw)
//   → C3D_FVec{ x = lw, y = lz, z = ly, w = lx }
//
// For quaternions:
//   C: { float r; float k; float j; float i; } at offsets {0,4,8,12}
//   Odin .x (offset  0) = real part  (r)
//   Odin .y (offset  4) = K component (k)
//   Odin .z (offset  8) = J component (j)
//   Odin .w (offset 12) = I component (i)
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

// FVec4_New — create a C3D_FVec from logical (x, y, z, w).
// Memory layout: Odin .x = logical W at offset 0, Odin .w = logical X at offset 12.
FVec4_New :: #force_inline proc "contextless" (lx, ly, lz, lw: f32) -> C3D_FVec {
    return C3D_FVec{ x = lw, y = lz, z = ly, w = lx }
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

// FVec4_PerspDivide — divide xyz by w.
// Odin .x is the logical W (homogeneous divisor).
FVec4_PerspDivide :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    inv := 1.0 / v.x
    return C3D_FVec{ x = 1.0, y = v.y * inv, z = v.z * inv, w = v.w * inv }
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
// FVec3 operations  (logical W component is always 0, Odin .x = 0)
// ============================================================

FVec3_New :: #force_inline proc "contextless" (lx, ly, lz: f32) -> C3D_FVec {
    // FVec4_New(lx, ly, lz, lw=0): x=0, y=lz, z=ly, w=lx
    return C3D_FVec{ x = 0, y = lz, z = ly, w = lx }
}

// FVec3_Dot uses logical .x,.y,.z = Odin .w,.z,.y
FVec3_Dot :: #force_inline proc "contextless" (a, b: C3D_FVec) -> f32 {
    return a.w*b.w + a.z*b.z + a.y*b.y
}

FVec3_Magnitude :: #force_inline proc "contextless" (v: C3D_FVec) -> f32 {
    return math.sqrt_f32(FVec3_Dot(v, v))
}

FVec3_Normalize :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    m := FVec3_Magnitude(v)
    return C3D_FVec{ x = 0, y = v.y / m, z = v.z / m, w = v.w / m }
}

FVec3_Add :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = 0, y = a.y + b.y, z = a.z + b.z, w = a.w + b.w }
}

FVec3_Subtract :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = 0, y = a.y - b.y, z = a.z - b.z, w = a.w - b.w }
}

FVec3_Distance :: #force_inline proc "contextless" (a, b: C3D_FVec) -> f32 {
    return FVec3_Magnitude(FVec3_Subtract(a, b))
}

FVec3_Scale :: #force_inline proc "contextless" (v: C3D_FVec, s: f32) -> C3D_FVec {
    return C3D_FVec{ x = 0, y = v.y * s, z = v.z * s, w = v.w * s }
}

FVec3_Negate :: #force_inline proc "contextless" (v: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{ x = 0, y = -v.y, z = -v.z, w = -v.w }
}

// FVec3_Cross — A×B, where logical X = Odin .w, Y = Odin .z, Z = Odin .y.
// A×B = (Ay·Bz−Az·By, Az·Bx−Ax·Bz, Ax·By−Ay·Bx) in logical xyz.
FVec3_Cross :: #force_inline proc "contextless" (a, b: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{
        x = 0,
        y = a.w*b.z - a.z*b.w,   // logical Z
        z = a.y*b.w - a.w*b.y,   // logical Y
        w = a.z*b.y - a.y*b.z,   // logical X
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

// Mtx_Diagonal — sets diagonal entries in C logical field order:
//   C r[0].x = Odin r[0].w,  C r[1].y = Odin r[1].z,
//   C r[2].z = Odin r[2].y,  C r[3].w = Odin r[3].x
Mtx_Diagonal :: proc "contextless" (out: ^C3D_Mtx, x, y, z, w: f32) {
    out^ = {}
    out.r[0].w = x
    out.r[1].z = y
    out.r[2].y = z
    out.r[3].x = w
}

Mtx_Identity :: #force_inline proc "contextless" (out: ^C3D_Mtx) {
    Mtx_Diagonal(out, 1.0, 1.0, 1.0, 1.0)
}

Mtx_Add :: proc "contextless" (out, lhs, rhs: ^C3D_Mtx) {
    lo := transmute(^[16]f32)(lhs)
    ro := transmute(^[16]f32)(rhs)
    oo := transmute(^[16]f32)(out)
    for i in 0..<16 { oo[i] = lo[i] + ro[i] }
}

Mtx_Subtract :: proc "contextless" (out, lhs, rhs: ^C3D_Mtx) {
    lo := transmute(^[16]f32)(lhs)
    ro := transmute(^[16]f32)(rhs)
    oo := transmute(^[16]f32)(out)
    for i in 0..<16 { oo[i] = lo[i] - ro[i] }
}

// ============================================================
// Matrix × vector  (native, no bridge needed)
// ============================================================

// Mtx_MultiplyFVec4 — M * v, full 4×4 transform.
// Each output component = dot(row_i, v) using Odin field indices.
Mtx_MultiplyFVec4 :: proc "contextless" (mtx: ^C3D_Mtx, v: C3D_FVec) -> C3D_FVec {
    return C3D_FVec{
        x = mtx.r[0].x*v.x + mtx.r[0].y*v.y + mtx.r[0].z*v.z + mtx.r[0].w*v.w,
        y = mtx.r[1].x*v.x + mtx.r[1].y*v.y + mtx.r[1].z*v.z + mtx.r[1].w*v.w,
        z = mtx.r[2].x*v.x + mtx.r[2].y*v.y + mtx.r[2].z*v.z + mtx.r[2].w*v.w,
        w = mtx.r[3].x*v.x + mtx.r[3].y*v.y + mtx.r[3].z*v.z + mtx.r[3].w*v.w,
    }
}

// Mtx_MultiplyFVec3 — multiply 3×3 submatrix by a FVec3 (v.x / logical W = 0).
Mtx_MultiplyFVec3 :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, v: C3D_FVec) -> C3D_FVec {
    v4 := v; v4.x = 0  // zero logical W
    return Mtx_MultiplyFVec4(mtx, v4)
}

// Mtx_MultiplyFVecH — multiply 4×3 matrix by FVec3 (sets logical W = 1 first).
// C sets v.w = 1.0f; C's .w = Odin's .x.
Mtx_MultiplyFVecH :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, v: C3D_FVec) -> C3D_FVec {
    v4 := v; v4.x = 1.0  // logical W = 1
    return Mtx_MultiplyFVec4(mtx, v4)
}

// ============================================================
// Matrix multiply and transpose  (native)
// ============================================================

// Mtx_Multiply — out = a * b.
// Uses the flat [4][4]f32 layout where [i][j] = row i, field-position j.
// Standard formula: out[i][j] = sum_k (a[i][k] * b[k][j]).
Mtx_Multiply :: proc "contextless" (out, a, b: ^C3D_Mtx) {
    am := transmute(^[4][4]f32)(a)
    bm := transmute(^[4][4]f32)(b)
    tmp: [4][4]f32
    for i in 0..<4 {
        for j in 0..<4 {
            for k in 0..<4 {
                tmp[i][j] += am[i][k] * bm[k][j]
            }
        }
    }
    om := transmute(^[4][4]f32)(out)
    om^ = tmp
}

// Mtx_Transpose — in-place transpose.
Mtx_Transpose :: proc "contextless" (out: ^C3D_Mtx) {
    m := transmute(^[4][4]f32)(out)
    for i in 0..<4 {
        for j in i+1..<4 {
            m[i][j], m[j][i] = m[j][i], m[i][j]
        }
    }
}

// ============================================================
// Projection matrices  (native — bypasses broken float bridges)
//
// All use the PICA200 depth convention:
//   z_clip ∈ [-w, 0]  (near → z_clip=0, far → z_clip=-w)
// Combined with C3D_DepthMap(true, -1.0, 0.0):
//   depth = -(z_clip/w) ∈ [0, 1]  (near = 0, far = 1)
//
// All functions implement the isLeftHanded=true case (standard for 3DS).
//
// ── Derivation of row layout ────────────────────────────────
// For every projection, rows are expressed as logical {lx,ly,lz,lw}.
// Conversion to Odin C3D_FVec {x,y,z,w}:
//   Odin .w = logical lx  (offset 12)
//   Odin .z = logical ly  (offset  8)
//   Odin .y = logical lz  (offset  4)
//   Odin .x = logical lw  (offset  0)
//
// ── Tilt derivation ─────────────────────────────────────────
// The portrait GPU framebuffer (240×400) requires a 90° rotation so
// apps can work in 400×240 landscape.  The tilt applies:
//   new_clip.lx = -old_clip.ly    (Tilt row 0 = -Persp/Ortho row 1)
//   new_clip.ly = -old_clip.lx    (Tilt row 1 = -Persp/Ortho row 0)
//   rows 2 and 3 unchanged.
// Verified against the known-working manual OrthoTilt in Triangle-Example.
// ============================================================

// Mtx_Ortho — orthographic projection (left-handed, PICA200 depth convention).
Mtx_Ortho :: proc "contextless" (out: ^C3D_Mtx,
                                  left, right, bottom, top, near, far: f32,
                                  isLeftHanded: bool) {
    // Logical rows: clip.li = row_i · vertex
    //   Row 0: {lx=2/(r-l), ly=0, lz=0, lw=-(r+l)/(r-l)}
    //   Row 1: {lx=0, ly=2/(t-b), lz=0, lw=-(t+b)/(t-b)}
    //   Row 2: {lx=0, ly=0, lz=1/(f-n), lw=-f/(f-n)}
    //   Row 3: {lx=0, ly=0, lz=0, lw=1}
    inv_rl := 1.0 / (right - left)
    inv_tb := 1.0 / (top   - bottom)
    inv_fn := 1.0 / (far   - near)
    out.r[0] = C3D_FVec{ x = -(right+left)*inv_rl, y = 0,              z = 0,              w = 2*inv_rl }
    out.r[1] = C3D_FVec{ x = -(top+bottom)*inv_tb, y = 0,              z = 2*inv_tb,       w = 0        }
    out.r[2] = C3D_FVec{ x = -far*inv_fn,           y = inv_fn,         z = 0,              w = 0        }
    out.r[3] = C3D_FVec{ x = 1,                     y = 0,              z = 0,              w = 0        }
}

// Mtx_OrthoTilt — orthographic projection with 90° tilt for the 3DS portrait framebuffer.
// Verified: the output for (0,400, 0,240, 0,1, true) matches the known-working
// manual matrix in Triangle-Example.
Mtx_OrthoTilt :: proc "contextless" (out: ^C3D_Mtx,
                                      left, right, bottom, top, near, far: f32,
                                      isLeftHanded: bool) {
    // Tilt: row 0 = -Ortho_row1, row 1 = -Ortho_row0, rows 2/3 unchanged.
    inv_rl := 1.0 / (right - left)
    inv_tb := 1.0 / (top   - bottom)
    inv_fn := 1.0 / (far   - near)
    // Row 0 = -(Ortho row 1): negate {x=-(t+b)/tb, y=0, z=2/tb, w=0}
    out.r[0] = C3D_FVec{ x = (top+bottom)*inv_tb, y = 0,      z = -2*inv_tb, w = 0        }
    // Row 1 = -(Ortho row 0): negate {x=-(r+l)/rl, y=0, z=0, w=2/rl}
    out.r[1] = C3D_FVec{ x = (right+left)*inv_rl, y = 0,      z = 0,         w = -2*inv_rl }
    // Row 2 = Ortho row 2
    out.r[2] = C3D_FVec{ x = -far*inv_fn,          y = inv_fn, z = 0,         w = 0         }
    // Row 3 = Ortho row 3
    out.r[3] = C3D_FVec{ x = 1,                    y = 0,      z = 0,         w = 0         }
}

// Mtx_Persp — perspective projection (left-handed, PICA200 depth convention).
//   fovy   — vertical field of view in radians
//   aspect — width / height
//   near, far — clip plane distances (positive, near < far)
//
// Depth mapping:
//   A = near / (far - near)       z_clip scale
//   B = -near * far / (far - near) z_clip bias
//   At z=near: z_ndc = 0;  at z=far: z_ndc = -1
Mtx_Persp :: proc "contextless" (out: ^C3D_Mtx,
                                  fovy, aspect, near, far: f32,
                                  isLeftHanded: bool) {
    f   := 1.0 / math.tan_f32(fovy * 0.5)
    inv_fn := 1.0 / (far - near)
    A   := near * inv_fn
    B   := -near * far * inv_fn
    // Logical rows:
    //   Row 0: {lx=f/a, ly=0, lz=0, lw=0}
    //   Row 1: {lx=0, ly=f, lz=0, lw=0}
    //   Row 2: {lx=0, ly=0, lz=A, lw=B}
    //   Row 3: {lx=0, ly=0, lz=1, lw=0}
    out.r[0] = C3D_FVec{ x = 0, y = 0, z = 0, w = f / aspect }
    out.r[1] = C3D_FVec{ x = 0, y = 0, z = f, w = 0           }
    out.r[2] = C3D_FVec{ x = B, y = A, z = 0, w = 0           }
    out.r[3] = C3D_FVec{ x = 0, y = 1, z = 0, w = 0           }
}

// Mtx_PerspTilt — perspective with 90° tilt for the 3DS portrait framebuffer.
//
// Tilt: row 0 = -Persp_row1, row 1 = -Persp_row0, rows 2/3 unchanged.
//   Row 0 = -(Persp row 1) = {lx=0, ly=-f, lz=0, lw=0}
//   Row 1 = -(Persp row 0) = {lx=-f/a, ly=0, lz=0, lw=0}
//   Row 2 = Persp row 2    = {lx=0, ly=0, lz=A, lw=B}
//   Row 3 = Persp row 3    = {lx=0, ly=0, lz=±1, lw=0}
//
// isLeftHanded=true  (LH): clip.lw = +vz, cube placed at z=+d (camera looks +Z)
//   A = near/(far-near),  B = -near*far/(far-near)
// isLeftHanded=false (RH): clip.lw = -vz, cube placed at z=-d (camera looks -Z)
//   A = far/(far-near),   B = near*far/(far-near)
//   Verified: at vz=-near → z_ndc=0 (depth=0=near), at vz=-far → z_ndc=-1 (depth=1=far)
//   Wait — PICA convention: near→depth=1, far→depth=0 with DepthMap(-1,0), GEQUAL, clear=0.
//   LH check: at vz=near  → z_ndc=-1 → depth=1 ✓   at vz=far  → z_ndc=0  → depth=0 ✓
//   RH check: at vz=-near → z_ndc=-1 → depth=1 ✓   at vz=-far → z_ndc=0  → depth=0 ✓
Mtx_PerspTilt :: proc "contextless" (out: ^C3D_Mtx,
                                      fovy, aspect, near, far: f32,
                                      isLeftHanded: bool) {
    f      := 1.0 / math.tan_f32(fovy * 0.5)
    inv_fn := 1.0 / (far - near)
    A, B, w3: f32
    if isLeftHanded {
        // LH: clip.lw = +vz; near plane at vz=+near
        //   z_ndc = (A*vz+B)/vz;  at vz=near → -1, at vz=far → 0  → depth=1 near, 0 far ✓
        A  = near * inv_fn           //  near/(far-near)  > 0
        B  = -near * far * inv_fn    // -near*far/(far-near)  < 0
        w3 = 1.0
    } else {
        // RH: clip.lw = -vz; near plane at vz=-near
        //   z_ndc = (A*vz+B)/(-vz); at vz=-near → -1, at vz=-far → 0  → depth=1 near, 0 far ✓
        //   Derivation: (-A*near+B)/near=-1 → B-A*near=-near;
        //               (-A*far+B)/far=0    → B=A*far  → A=near*far/(far*(far-near)+near*far) ← simplifies:
        //   Substituting: A=B/far, B-B/far*near=-near → B(1-near/far)=-near → B=-near*far/(far-near)
        //   Then A=B/far=-near/(far-near)  (negative for near<far)
        A  = -near * inv_fn          // -near/(far-near)  < 0  ← NOTE: negated vs LH
        B  = -near * far * inv_fn    // -near*far/(far-near)  < 0  (same as LH)
        w3 = -1.0
    }
    out.r[0] = C3D_FVec{ x = 0, y = 0,  z = -f,         w = 0           }
    out.r[1] = C3D_FVec{ x = 0, y = 0,  z = 0,          w = -f / aspect }
    out.r[2] = C3D_FVec{ x = B, y = A,  z = 0,          w = 0           }
    out.r[3] = C3D_FVec{ x = 0, y = w3, z = 0,          w = 0           }
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

// _mtx_apply — helper: apply transform T to mtx (right or left side).
@(private="file")
_mtx_apply :: #force_inline proc "contextless" (mtx, t: ^C3D_Mtx, bRightSide: bool) {
    tmp: C3D_Mtx
    if bRightSide {
        Mtx_Multiply(&tmp, mtx, t)   // out = mtx * T
    } else {
        Mtx_Multiply(&tmp, t, mtx)   // out = T * mtx
    }
    mtx^ = tmp
}

// Mtx_Scale — multiply each column of the matrix by (x, y, z).
// Equivalent to: out = out * diag(x, y, z, 1).
//
// Routed through the C bridge (mtx_scale in bridge.c → citro3d Mtx_Scale).
// The native Odin implementation built a diagonal matrix and called
// Mtx_Multiply, but Mtx_Multiply operates on the reversed C3D flat-storage
// layout, so the scale factors ended up permuting columns instead of scaling
// them.  The C citro3d Mtx_Scale correctly multiplies r[i].x/y/z directly.
Mtx_Scale :: #force_inline proc "contextless" (mtx: ^C3D_Mtx, x, y, z: f32) {
    _Mtx_Scale_bridge(mtx, x, y, z)
}

// Mtx_Translate — apply translation (tx, ty, tz) to matrix.
// Translation matrix logical rows:
//   Row 0: {lx=1, 0, 0, tx}   Row 1: {0, 1, 0, ty}
//   Row 2: {0, 0, 1, tz}       Row 3: {0, 0, 0, 1}
Mtx_Translate :: proc "contextless" (mtx: ^C3D_Mtx, x, y, z: f32, bRightSide: bool) {
    t: C3D_Mtx
    t.r[0] = C3D_FVec{ x = x, y = 0, z = 0, w = 1 }
    t.r[1] = C3D_FVec{ x = y, y = 0, z = 1, w = 0 }
    t.r[2] = C3D_FVec{ x = z, y = 1, z = 0, w = 0 }
    t.r[3] = C3D_FVec{ x = 1, y = 0, z = 0, w = 0 }
    _mtx_apply(mtx, &t, bRightSide)
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

// Quat_Identity = (i=0, j=0, k=0, r=1) → FVec4_New(0,0,0,1) → {x=1, y=0, z=0, w=0}
Quat_Identity :: #force_inline proc "contextless" () -> C3D_FQuat {
    return C3D_FVec{ x = 1.0, y = 0, z = 0, w = 0 }
}

// Quat_Conjugate — negate vector part: C Quat_New(-q.i, -q.j, -q.k, q.r)
// C .i=Odin .w, .j=Odin .z, .k=Odin .y, .r=Odin .x
Quat_Conjugate :: #force_inline proc "contextless" (q: C3D_FQuat) -> C3D_FQuat {
    return C3D_FVec{ x = q.x, y = -q.y, z = -q.z, w = -q.w }
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
    q_ := q; _Mtx_FromQuat_bridge(m, &q_)
}

Mtx_LookAt :: #force_inline proc(out: ^C3D_Mtx,
                                  pos, target, up: C3D_FVec,
                                  isLeftHanded: bool) {
    p_ := pos; t_ := target; u_ := up
    _Mtx_LookAt_bridge(out, &p_, &t_, &u_, isLeftHanded)
}

Mtx_Rotate :: #force_inline proc(mtx: ^C3D_Mtx,
                                  axis: C3D_FVec, angle: f32, bRightSide: bool) {
    a_ := axis; _Mtx_Rotate_bridge(mtx, &a_, angle, bRightSide)
}

Quat_Multiply :: #force_inline proc(lhs, rhs: C3D_FQuat) -> C3D_FQuat {
    l_ := lhs; r_ := rhs; out: C3D_FQuat
    _Quat_Multiply_bridge(&l_, &r_, &out); return out
}

Quat_Pow :: #force_inline proc(q: C3D_FQuat, p: f32) -> C3D_FQuat {
    q_ := q; out: C3D_FQuat; _Quat_Pow_bridge(&q_, p, &out); return out
}

Quat_CrossFVec3 :: #force_inline proc(q: C3D_FQuat, v: C3D_FVec) -> C3D_FVec {
    q_ := q; v_ := v; out: C3D_FVec
    _Quat_CrossFVec3_bridge(&q_, &v_, &out); return out
}

Quat_Rotate :: #force_inline proc(q: C3D_FQuat, axis: C3D_FVec,
                                   r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q; a_ := axis; out: C3D_FQuat
    _Quat_Rotate_bridge(&q_, &a_, r, bRightSide, &out); return out
}

Quat_RotateX :: #force_inline proc(q: C3D_FQuat, r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q; out: C3D_FQuat; _Quat_RotateX_bridge(&q_, r, bRightSide, &out); return out
}

Quat_RotateY :: #force_inline proc(q: C3D_FQuat, r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q; out: C3D_FQuat; _Quat_RotateY_bridge(&q_, r, bRightSide, &out); return out
}

Quat_RotateZ :: #force_inline proc(q: C3D_FQuat, r: f32, bRightSide: bool) -> C3D_FQuat {
    q_ := q; out: C3D_FQuat; _Quat_RotateZ_bridge(&q_, r, bRightSide, &out); return out
}

Quat_FromMtx :: #force_inline proc(m: ^C3D_Mtx) -> C3D_FQuat {
    out: C3D_FQuat; _Quat_FromMtx_bridge(m, &out); return out
}

Quat_FromPitchYawRoll :: #force_inline proc(pitch, yaw, roll: f32,
                                             bRightSide: bool) -> C3D_FQuat {
    out: C3D_FQuat
    _Quat_FromPitchYawRoll_bridge(pitch, yaw, roll, bRightSide, &out); return out
}

Quat_LookAt :: #force_inline proc(source, target, forwardVector, upVector: C3D_FVec) -> C3D_FQuat {
    s_ := source; t_ := target; f_ := forwardVector; u_ := upVector; out: C3D_FQuat
    _Quat_LookAt_bridge(&s_, &t_, &f_, &u_, &out); return out
}

Quat_FromAxisAngle :: #force_inline proc(axis: C3D_FVec, angle: f32) -> C3D_FQuat {
    a_ := axis; out: C3D_FQuat
    _Quat_FromAxisAngle_bridge(&a_, angle, &out); return out
}
