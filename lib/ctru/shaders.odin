package ctru

// ============================================================
// libctru — shader binary parser and program management
// Sources: 3ds/gpu/shbin.h, 3ds/gpu/shaderProgram.h
// ============================================================

// ── Shader binary types ──────────────────────────────────────

// DVLP_s — compiled shader program block (16 bytes, opaque).
// Embedded inside DVLB_s; do not access fields directly.
DVLP_s :: [16]u8

// DVLE_s — one compiled vertex/geometry shader entity (100 bytes, opaque).
// Access via DVLB_s.DVLE[index].  Pass &dvlb.DVLE[0] to shaderProgramSetVsh.
DVLE_s :: [100]u8

// DVLB_s — parsed shader binary (24 bytes on ARM32).
// Allocated by DVLB_ParseFile; freed with DVLB_Free.
// Layout: numDVLE (4) + DVLP (16) + DVLE ptr (4) = 24 bytes.
DVLB_s :: struct {
    numDVLE: u32,      // number of DVLE_s entries in this binary
    DVLP:    DVLP_s,  // compiled program data (opaque, 16 bytes)
    DVLE:    ^DVLE_s, // pointer to array of DVLE_s (one per shader)
}

// ── Shader program runtime types ─────────────────────────────

// shaderInstance_s — runtime shader instance (32 bytes, opaque).
// Allocated internally by shaderProgramSetVsh/SetGsh.
// Pass to shaderInstanceGetUniformLocation.
shaderInstance_s :: [32]u8

// shaderProgram_s — compiled + linked shader program (20 bytes).
// vertexShader is at offset 0; the rest is opaque runtime data.
shaderProgram_s :: struct {
    vertexShader:   ^shaderInstance_s, // set by shaderProgramSetVsh
    _opaque:        [16]u8,            // remaining internal fields
}

// ── Shader binary functions ───────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // DVLB_ParseFile — parse a compiled shader binary (.shbin) into a DVLB_s.
    //   shbinData : pointer to the raw .shbin bytes (must stay alive!)
    //   shbinSize : byte length of the buffer
    // Returns an allocated DVLB_s*; free with DVLB_Free when done.
    // Note: the DVLB stores pointers into shbinData, so the buffer must
    // remain valid for the lifetime of the returned DVLB_s.
    DVLB_ParseFile :: proc(shbinData: ^u32, shbinSize: u32) -> ^DVLB_s ---

    // DVLB_Free — release a DVLB_s allocated by DVLB_ParseFile.
    DVLB_Free :: proc(dvlb: ^DVLB_s) ---

    // shaderProgramInit — initialise a shaderProgram_s to a clean state.
    shaderProgramInit :: proc(prog: ^shaderProgram_s) ---

    // shaderProgramFree — release resources held by a shaderProgram_s.
    shaderProgramFree :: proc(prog: ^shaderProgram_s) ---

    // shaderProgramSetVsh — attach a vertex shader DVLE to a program.
    //   vsh: pointer to the DVLE_s to use (e.g. dvlb.DVLE for the first one)
    // Returns Result (0 = success).
    shaderProgramSetVsh :: proc(prog: ^shaderProgram_s, vsh: ^DVLE_s) -> u32 ---

    // shaderInstanceGetUniformLocation — look up a uniform by name.
    // Returns the register index (≥ 0) or -1 if not found.
    shaderInstanceGetUniformLocation :: proc(si: ^shaderInstance_s,
                                             name: cstring) -> i8 ---
}
