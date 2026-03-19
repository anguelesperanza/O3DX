package c3d

// ============================================================
// Citro3D — math: vectors, matrices, quaternions
// Source: citro3d/include/c3d/maths.h
//
// All functions in maths.h are static inline in C, so they have
// NO exported linker symbols.  They must be implemented natively
// in Odin (no ABI bridge needed — we write the code ourselves in
// soft-float, so there is no calling-convention mismatch).
//
// TODO (Phase 8): Implement all of these as Odin procedures.
//
// ============================================================
// Constants
// ============================================================
//
//   M_TAU              :: f32(6.2831853)   // 2π
//   M_PI               :: f32(3.1415926)   // π
//   C3D_AspectRatioTop :: f32(400.0/240.0) // top screen aspect ratio
//   C3D_AspectRatioBot :: f32(320.0/240.0) // bottom screen aspect ratio
//
//   C3D_Angle(x)            -- revolutions → radians
//   C3D_AngleFromDegrees(x) -- degrees → radians
//
// ============================================================
// FVec4 (4-component float vector)
// ============================================================
//
//   FVec4_New(x, y, z, w)           -> C3D_FVec
//   FVec4_Add(lhs, rhs)             -> C3D_FVec
//   FVec4_Subtract(lhs, rhs)        -> C3D_FVec
//   FVec4_Negate(v)                 -> C3D_FVec
//   FVec4_Scale(v, s)               -> C3D_FVec
//   FVec4_Dot(lhs, rhs)             -> f32
//   FVec4_Magnitude(v)              -> f32
//   FVec4_Normalize(v)              -> C3D_FVec
//   FVec4_PerspDivide(v)            -> C3D_FVec  (xyz / w)
//
// ============================================================
// FVec3 (3-component float vector, w = 0)
// ============================================================
//
//   FVec3_New(x, y, z)              -> C3D_FVec
//   FVec3_Add(lhs, rhs)             -> C3D_FVec
//   FVec3_Subtract(lhs, rhs)        -> C3D_FVec
//   FVec3_Negate(v)                 -> C3D_FVec
//   FVec3_Scale(v, s)               -> C3D_FVec
//   FVec3_Dot(lhs, rhs)             -> f32
//   FVec3_Cross(lhs, rhs)           -> C3D_FVec
//   FVec3_Magnitude(v)              -> f32
//   FVec3_Normalize(v)              -> C3D_FVec
//   FVec3_Distance(lhs, rhs)        -> f32
//
// ============================================================
// Matrix (4x4, row-major)
// ============================================================
//
//   Mtx_Zeros(out)
//   Mtx_Copy(dst, src)
//   Mtx_Identity(out)
//   Mtx_Diagonal(out, x, y, z, w)
//   Mtx_Transpose(out)
//   Mtx_Inverse(out)                -> f32  (returns determinant)
//   Mtx_Multiply(out, a, b)
//   Mtx_Add(out, a, b)
//   Mtx_Subtract(out, a, b)
//   Mtx_MultiplyFVec3(mtx, v)       -> C3D_FVec
//   Mtx_MultiplyFVec4(mtx, v)       -> C3D_FVec
//   Mtx_MultiplyFVecH(mtx, v)       -> C3D_FVec  (homogeneous)
//   Mtx_Translate(mtx, x, y, z, rightSide)
//   Mtx_Scale(mtx, x, y, z)
//   Mtx_Rotate(mtx, axis, angle, rightSide)
//   Mtx_RotateX(mtx, angle, rightSide)
//   Mtx_RotateY(mtx, angle, rightSide)
//   Mtx_RotateZ(mtx, angle, rightSide)
//   Mtx_Ortho(mtx, l, r, b, t, near, far, leftHanded)
//   Mtx_Persp(mtx, fovy, aspect, near, far, leftHanded)
//   Mtx_PerspStereo(mtx, fovy, aspect, near, far, iod, screen, leftHanded)
//   Mtx_OrthoTilt(mtx, l, r, b, t, near, far, leftHanded)   -- 3DS screen tilt
//   Mtx_PerspTilt(mtx, fovy, aspect, near, far, leftHanded)  -- 3DS screen tilt
//   Mtx_PerspStereoTilt(...)                                 -- 3DS screen tilt
//   Mtx_LookAt(mtx, eye, target, up, leftHanded)
//
// ============================================================
// Quaternion
// ============================================================
//
//   Quat_New(i, j, k, r)            -> C3D_FQuat
//   Quat_Add(lhs, rhs)              -> C3D_FQuat
//   Quat_Subtract(lhs, rhs)         -> C3D_FQuat
//   Quat_Scale(q, s)                -> C3D_FQuat
//   Quat_Negate(q)                  -> C3D_FQuat
//   Quat_Multiply(lhs, rhs)         -> C3D_FQuat
//   Quat_Dot(lhs, rhs)              -> f32
//   Quat_Magnitude(q)               -> f32
//   Quat_Normalize(q)               -> C3D_FQuat
//   Quat_Conjugate(q)               -> C3D_FQuat
//   Quat_Inverse(q)                 -> C3D_FQuat
//   Quat_Pow(q, p)                  -> C3D_FQuat
//   Quat_Rotate(q, axis, r, rightSide) -> C3D_FQuat
//   Quat_RotateX(q, r, rightSide)   -> C3D_FQuat
//   Quat_RotateY(q, r, rightSide)   -> C3D_FQuat
//   Quat_RotateZ(q, r, rightSide)   -> C3D_FQuat
//   Quat_FromPitchYawRoll(p, y, r, rightSide) -> C3D_FQuat
//   Quat_FromAxisAngle(axis, angle) -> C3D_FQuat
//   Quat_LookAt(src, dst, up, fwd)  -> C3D_FQuat
//   Quat_FromMtx(m)                 -> C3D_FQuat
//   Mtx_FromQuat(m, q)
// ============================================================
