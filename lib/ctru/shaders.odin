package ctru

// ============================================================
// libctru — shader binary parser and program management
// Sources: 3ds/gpu/shbin.h, 3ds/gpu/shaderProgram.h
// ============================================================

// ── Shader binary types ──────────────────────────────────────

// DVLP_s — compiled shader program block (16 bytes, opaque).
// Embedded inside DVLB_s; do not access fields directly.
DVLP_s :: struct #align(4) {
    _: [16]u8,
}

// DVLE_s — one compiled vertex/geometry shader entity (92 bytes, opaque).
// DVLB_s.DVLE points at the first of numDVLE of these; pass it (or a later
// entry) to shaderProgramSetVsh.
DVLE_s :: struct #align(4) {
    _: [92]u8,
}

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
shaderInstance_s :: struct #align(4) {
    _: [32]u8,
}

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

// ============================================================
// Remaining shader program and DVLE calls (3ds/gpu/shaderProgram.h, 3ds/gpu/shbin.h)
// ============================================================

// DVLE type.
DVLE_type :: enum u8 {
    VERTEX_SHDR   = 0, // Vertex shader.
    GEOMETRY_SHDR = 1, // Geometry shader.
}

// Constant type.
DVLE_constantType :: enum u8 {
    BOOL    = 0, // Bool.
    U8      = 1, // Unsigned 8-bit integer.
    FLOAT24 = 2, // 24-bit float.
}

// Output attribute.
DVLE_outputAttribute_t :: enum u8 {
    POSITION   = 0, // Position.
    NORMALQUAT = 1, // Normal Quaternion.
    COLOR      = 2, // Color.
    TEXCOORD0  = 3, // Texture coordinate 0.
    TEXCOORD0W = 4, // Texture coordinate 0 W.
    TEXCOORD1  = 5, // Texture coordinate 1.
    TEXCOORD2  = 6, // Texture coordinate 2.
    VIEW       = 8, // View.
    DUMMY      = 9, // Dummy attribute (used as passthrough for geometry shader input).
}

// Geometry shader operation modes.
DVLE_geoShaderMode :: enum u8 {
    POINT         = 0, // Point processing mode.
    VARIABLE_PRIM = 1, // Variable-size primitive processing mode.
    FIXED_PRIM    = 2, // Fixed-size primitive processing mode.
}

// DVLE constant entry data.
DVLE_constEntry_s :: struct {
    type_: u16, // Constant type. See DVLE_constantType
    id:    u16, // Constant ID.
    data:  [4]u32, // Constant data.
}

// DVLE output entry data.
DVLE_outEntry_s :: struct {
    type_: u16, // Output type. See DVLE_outputAttribute_t
    regID: u16, // Output register ID.
    mask:  u8, // Output mask.
    unk:   [3]u8, // Unknown.
}

// DVLE uniform entry data.
DVLE_uniformEntry_s :: struct {
    symbolOffset: u32, // Symbol offset.
    startReg:     u16, // Start register.
    endReg:       u16, // End register.
}

// 24-bit float uniforms.
float24Uniform_s :: struct {
    id:   u32, // Uniform ID.
    data: [3]u32, // Uniform data.
}

@(default_calling_convention = "c")
foreign ctru {
    // Gets a uniform register index from a shader.
    DVLE_GetUniformRegister :: proc(dvle: ^DVLE_s, name: cstring) -> i8 ---

    // Generates a shader output map.
    DVLE_GenerateOutmap :: proc(dvle: ^DVLE_s) ---

    // Initializes a shader instance.
    shaderInstanceInit :: proc(si: ^shaderInstance_s, dvle: ^DVLE_s) -> Result ---

    // Frees a shader instance.
    shaderInstanceFree :: proc(si: ^shaderInstance_s) -> Result ---

    // Sets a bool uniform of a shader.
    shaderInstanceSetBool :: proc(si: ^shaderInstance_s, id: i32, value: bool) -> Result ---

    // Gets a bool uniform of a shader.
    shaderInstanceGetBool :: proc(si: ^shaderInstance_s, id: i32, value: ^bool) -> Result ---

    // Sets the geometry shader of a shader program.
    shaderProgramSetGsh :: proc(sp: ^shaderProgram_s, dvle: ^DVLE_s, stride: u8) -> Result ---

    // Configures the permutation of the input attributes of the geometry shader of a shader
    // program.
    shaderProgramSetGshInputPermutation :: proc(sp: ^shaderProgram_s, permutation: u64) -> Result ---

    // Configures the shader units to use the specified shader program.
    shaderProgramConfigure :: proc(sp: ^shaderProgram_s, sendVshCode: bool, sendGshCode: bool) -> Result ---

    // Same as shaderProgramConfigure, but always loading code/operand descriptors and uploading
    // DVLE constants afterwards.
    shaderProgramUse :: proc(sp: ^shaderProgram_s) -> Result ---
}
