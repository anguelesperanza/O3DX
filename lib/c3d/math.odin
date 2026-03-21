package c3d

// ============================================================
// Citro3D — math: projection and matrix helpers
// Source: citro3d/include/c3d/maths.h
//
// Most functions in maths.h are static inline and have no
// exported symbols.  Those functions must be implemented natively
// in Odin (TODO: Phase 8 will add the full vector/matrix/quat
// library as Odin procedures).
//
// Exception: Mtx_OrthoTilt (and the other Tilt/Persp variants)
// ARE exported symbols from libcitro3d.  They take float params,
// so they require an ABI bridge wrapper in lib/c3d/bridge.c.
// ============================================================

// ── Screen constants ─────────────────────────────────────────

C3D_AspectRatioTop :: f32(400.0 / 240.0) // top screen: 400×240
C3D_AspectRatioBot :: f32(320.0 / 240.0) // bottom screen: 320×240

// ── Bridge bindings ──────────────────────────────────────────

foreign import c3d_bridge "system:c3d_bridge"

@(default_calling_convention = "c")
foreign c3d_bridge {

    // Mtx_OrthoTilt — orthographic projection pre-tilted for the 3DS screen.
    //   left, right  : horizontal clip planes in world space
    //   bottom, top  : vertical clip planes in world space
    //   near, far    : depth clip planes
    //   leftHanded   : true = left-handed coordinate system
    //
    // On the 3DS the GPU framebuffer is stored in portrait orientation
    // (240 × 400), so the tilt variant rotates the projection 90 degrees
    // to produce the correct landscape image on the physical screen.
    //
    // Typical call for a full-screen ortho (400×240 top screen):
    //   Mtx_OrthoTilt(&proj, 0.0, 400.0, 0.0, 240.0, 0.0, 1.0, true)
    // NOTE: leftHanded must be true — the PICA200 uses a left-handed z
    // convention (z decreases into the screen).  Passing false inverts the
    // z-clip range, causing everything to be clipped and nothing to render.
    @(link_name = "mtx_ortho_tilt")
    Mtx_OrthoTilt :: proc(mtx: ^C3D_Mtx,
                          left, right, bottom, top, near, far: f32,
                          leftHanded: bool) ---
}
