package c3d

// ============================================================
// Citro3D / GPU type definitions
// Sources: citro3d/include/c3d/types.h, GPU/enums.h (libctru)
// ============================================================

// ============================================================
// Core math types
// ============================================================

// C3D_FVec — 4-component float vector.
// Mirrors the C union (accessible as .x/.y/.z/.w).
C3D_FVec :: struct {
    x, y, z, w: f32,
}

// C3D_FQuat — quaternion (same layout as C3D_FVec).
// Components: i, j, k are the vector part; r is the scalar.
C3D_FQuat :: C3D_FVec

// C3D_Mtx — row-major 4x4 float matrix.
// r[0..3] are the four row vectors.
// Access flat array as: transmute([16]f32, mtx)
C3D_Mtx :: struct {
    r: [4]C3D_FVec,
}

// ============================================================
// Texture types
// ============================================================

// C3D_Tex — opaque 24-byte block matching sizeof(C3D_Tex) on ARM32.
// Never access fields directly from Odin; always pass by pointer to C.
C3D_Tex :: [24]u8

// Tex3DS_SubTexture — UV sub-region within a C3D_Tex (used by citro2d).
Tex3DS_SubTexture :: struct #packed {
    width, height:            u16,
    left, top, right, bottom: f32,
}

// C3D_TexCube — 6 face data pointers for a cubemap texture.
C3D_TexCube :: struct {
    data: [6]rawptr,
}

// C3D_TexInitParams — parameters for C3D_TexInitWithParams.
C3D_TexInitParams :: struct {
    width:    u16,
    height:   u16,
    maxLevel: u8,
    format:   GPU_TEXCOLOR,
    type_:    GPU_TEXTURE_MODE_PARAM, // 'type' is a reserved word in Odin
    onVram:   bool,
}

// C3D_DEPTHTYPE — depth buffer format selector.
// Use the C3D_DEPTHTYPE_* constants below.
// Value of -1 disables the depth buffer.
C3D_DEPTHTYPE :: i32

C3D_DEPTHTYPE_NO_DEPTH          :: C3D_DEPTHTYPE(-1)
C3D_DEPTHTYPE_DEPTH16           :: C3D_DEPTHTYPE(0) // GPU_RB_DEPTH16       = 0
C3D_DEPTHTYPE_DEPTH24           :: C3D_DEPTHTYPE(2) // GPU_RB_DEPTH24       = 2
C3D_DEPTHTYPE_DEPTH24_STENCIL8  :: C3D_DEPTHTYPE(3) // GPU_RB_DEPTH24_STENCIL8 = 3

// GPU_RB_* — GPU_RENDERBUFFER_TYPE aliases.
// Colour formats:
GPU_RB_RGBA8    :: GPU_COLORBUF.RGBA8   // = 0
GPU_RB_RGB8     :: GPU_COLORBUF.RGB8    // = 1
// Depth formats (raw integer values, used in C3D_DEPTHTYPE):
GPU_RB_DEPTH16           :: C3D_DEPTHTYPE(0)
GPU_RB_DEPTH24           :: C3D_DEPTHTYPE(2)
GPU_RB_DEPTH24_STENCIL8  :: C3D_DEPTHTYPE(3)

// ============================================================
// Framebuffer types  (Phase 7)
// ============================================================

C3D_FrameBuf :: struct {
    colorBuf:  rawptr,
    depthBuf:  rawptr,
    width:     u16,
    height:    u16,
    colorFmt:  GPU_COLORBUF,
    depthFmt:  GPU_DEPTHBUF,
    block32:   bool,
    colorMask: u8,
    depthMask: u8,
}

// C3D_ClearBits — passed to C3D_FrameBufClear.
C3D_ClearBits :: distinct u32
C3D_CLEAR_COLOR :: C3D_ClearBits(1)
C3D_CLEAR_DEPTH :: C3D_ClearBits(2)
C3D_CLEAR_ALL   :: C3D_ClearBits(3)

// ============================================================
// Attribute / buffer info types  (Phase 5)
// ============================================================

C3D_AttrInfo :: struct {
    flags:      [2]u32,
    permutation: u64,
    attrCount:  i32,
}

C3D_BufCfg :: struct {
    offset:  u32,
    flags:   [2]u32,
}

C3D_BufInfo :: struct {
    base_paddr: u32,
    bufCount:   i32,
    buffers:    [12]C3D_BufCfg,
}

// ============================================================
// Texture environment types  (Phase 7)
// ============================================================

// C3D_TexEnv — texture environment stage (20 bytes on ARM32).
// Matches the actual C struct in c3d/texenv.h exactly:
//   u16 srcRgb, srcAlpha          (4 bytes, offset  0)
//   union { u32 opAll;            (4 bytes, offset  4)
//           struct { opRgb:12, opAlpha:12 }; }
//   u16 funcRgb, funcAlpha        (4 bytes, offset  8)
//   u32 color                     (4 bytes, offset 12)
//   u16 scaleRgb, scaleAlpha      (4 bytes, offset 16)
//
// IMPORTANT: Never access fields directly from Odin.
// Always use the bridge functions (C3D_TexEnvInit, C3D_TexEnvSrc, etc.)
// which operate on the correct C layout via bridge.c.
// Declared as an opaque byte array to prevent accidental field access.
C3D_TexEnv :: [20]u8

C3D_TexEnvMode :: distinct u32
C3D_RGB   :: C3D_TexEnvMode(1)
C3D_Alpha :: C3D_TexEnvMode(2)
C3D_Both  :: C3D_TexEnvMode(3)

// ============================================================
// Matrix stack  (Phase 8)
// ============================================================

C3D_MTXSTACK_SIZE :: 8

C3D_MtxStack :: struct {
    m:         [C3D_MTXSTACK_SIZE]C3D_Mtx,
    pos:       i32,
    unifType:  u8,
    unifPos:   u8,
    unifLen:   u8,
    isDirty:   u8,
}

// ============================================================
// Light / LUT types  (Phase 9)
// ============================================================

// C3D_Material — surface material color channels.
C3D_Material :: struct {
    ambient:   [3]f32,
    diffuse:   [3]f32,
    specular0: [3]f32,
    specular1: [3]f32,
    emission:  [3]f32,
}

// C3D_LightLut — 256-entry lookup table (u32 packed values).
C3D_LightLut :: struct {
    data: [256]u32,
}

// C3D_LightLutDA — distance-attenuation LUT with bias and scale.
C3D_LightLutDA :: struct {
    lut:   C3D_LightLut,
    bias:  f32,
    scale: f32,
}

// Opaque handles — full struct layouts are large and internal;
// use pointers and the C3D_Light* API functions.
C3D_LightEnv :: [1156]u8 // sizeof(C3D_LightEnv) on ARM32 — opaque
C3D_Light    :: [64]u8   // sizeof(C3D_Light)    on ARM32 — opaque

// ============================================================
// Fog / gas types  (Phase 9)
// ============================================================

C3D_FogLut :: struct {
    data: [128]u32,
}

C3D_GasLut :: struct {
    diff:  [8]u32,
    color: [8]u32,
}

// ============================================================
// Procedural texture types  (Phase 9)
// ============================================================

C3D_ProcTex :: struct {
    // 6 u32 config words — treat as opaque for now.
    cfg: [6]u32,
}

C3D_ProcTexLut :: struct {
    data: [128]u32,
}

C3D_ProcTexColorLut :: struct {
    color: [256]u32,
    diff:  [256]u32,
}

C3D_ProcTexCoord :: enum u32 {
    U  = 0,
    V  = 1,
    UV = 2,
}

// ============================================================
// GPU enumerations
// Source: libctru/include/GPU/enums.h
// ============================================================

// Color buffer pixel format
GPU_COLORBUF :: enum u32 {
    RGBA8    = 0x0,
    RGB8     = 0x1,
    RGBA5551 = 0x2,
    RGB565   = 0x3,
    RGBA4    = 0x4,
}

// Depth buffer format
GPU_DEPTHBUF :: enum u32 {
    DEPTH24_STENCIL8 = 0x0,
    DEPTH24          = 0x2,
    DEPTH16          = 0x3,
}

// Texture color format
GPU_TEXCOLOR :: enum u32 {
    RGBA8    = 0x0,
    RGB8     = 0x1,
    RGBA5551 = 0x2,
    RGB565   = 0x3,
    RGBA4    = 0x4,
    LA8      = 0x5,
    HILO8    = 0x6,
    L8       = 0x7,
    A8       = 0x8,
    LA4      = 0x9,
    L4       = 0xA,
    A4       = 0xB,
    ETC1     = 0xC,
    ETC1A4   = 0xD,
}

// Convenience alias matching the C macro GPU_RGBA8 etc.
GPU_RGBA8    :: GPU_TEXCOLOR.RGBA8
GPU_RGB8     :: GPU_TEXCOLOR.RGB8
GPU_RGBA5551 :: GPU_TEXCOLOR.RGBA5551
GPU_RGB565   :: GPU_TEXCOLOR.RGB565
GPU_RGBA4    :: GPU_TEXCOLOR.RGBA4
GPU_LA8      :: GPU_TEXCOLOR.LA8
GPU_L8       :: GPU_TEXCOLOR.L8
GPU_A8       :: GPU_TEXCOLOR.A8
GPU_ETC1     :: GPU_TEXCOLOR.ETC1
GPU_ETC1A4   :: GPU_TEXCOLOR.ETC1A4

// Texture filter (mag / min)
GPU_TEXTURE_FILTER_PARAM :: enum u32 {
    NEAREST                = 0x0,
    LINEAR                 = 0x1,
    NEAREST_MIPMAP_NEAREST = 0x2,
    LINEAR_MIPMAP_NEAREST  = 0x3,
    NEAREST_MIPMAP_LINEAR  = 0x4,
    LINEAR_MIPMAP_LINEAR   = 0x5,
}

// Texture wrap mode
GPU_TEXTURE_WRAP_PARAM :: enum u32 {
    CLAMP_TO_EDGE   = 0x0,
    CLAMP_TO_BORDER = 0x1,
    REPEAT          = 0x2,
    MIRRORED_REPEAT = 0x3,
}

// Texture mode (2D, cube, shadow, etc.)
GPU_TEXTURE_MODE_PARAM :: enum u32 {
    TEX2D  = 0x0,
    TEXCUBE = 0x1,
    SHADOW2D = 0x2,
    PROJECTION = 0x3,
    SHADOW_CUBE = 0x4,
    DISABLED = 0x5,
}

// Cubemap face index
GPU_TEXFACE :: enum u32 {
    TEXFACE_2D       = 0,
    POSITIVE_X       = 0,
    NEGATIVE_X       = 1,
    POSITIVE_Y       = 2,
    NEGATIVE_Y       = 3,
    POSITIVE_Z       = 4,
    NEGATIVE_Z       = 5,
}

// Draw primitive type
GPU_Primitive_t :: enum u32 {
    TRIANGLES      = 0x0,
    TRIANGLE_STRIP = 0x1,
    TRIANGLE_FAN   = 0x2,
    GEOMETRY_PRIM  = 0x4,
}

// Vertex attribute data format
GPU_FORMATS :: enum u32 {
    BYTE          = 0x0,
    UNSIGNED_BYTE = 0x1,
    SHORT         = 0x2,
    FLOAT         = 0x3,
}

// Shader type
GPU_SHADER_TYPE :: enum u32 {
    VERTEX_SHADER   = 0x0,
    GEOMETRY_SHADER = 0x1,
}

// Depth / alpha / stencil test function
GPU_TESTFUNC :: enum u32 {
    NEVER    = 0,
    ALWAYS   = 1,
    EQUAL    = 2,
    NOTEQUAL = 3,
    LESS     = 4,
    LEQUAL   = 5,
    GREATER  = 6,
    GEQUAL   = 7,
}

// Blend equation
GPU_BLENDEQUATION :: enum u32 {
    ADD              = 0,
    SUBTRACT         = 1,
    REVERSE_SUBTRACT = 2,
    MIN              = 3,
    MAX              = 4,
}

// Blend factor
GPU_BLENDFACTOR :: enum u32 {
    ZERO                     = 0,
    ONE                      = 1,
    SRC_COLOR                = 2,
    ONE_MINUS_SRC_COLOR      = 3,
    DST_COLOR                = 4,
    ONE_MINUS_DST_COLOR      = 5,
    SRC_ALPHA                = 6,
    ONE_MINUS_SRC_ALPHA      = 7,
    DST_ALPHA                = 8,
    ONE_MINUS_DST_ALPHA      = 9,
    CONSTANT_COLOR           = 10,
    ONE_MINUS_CONSTANT_COLOR = 11,
    CONSTANT_ALPHA           = 12,
    ONE_MINUS_CONSTANT_ALPHA = 13,
    SRC_ALPHA_SATURATE       = 14,
}

// Write mask for depth / color buffer
GPU_WRITEMASK :: enum u32 {
    RED   = 0x01,
    GREEN = 0x02,
    BLUE  = 0x04,
    ALPHA = 0x08,
    DEPTH = 0x10,
    ALL   = 0x1F,
}

// Face culling mode
GPU_CULLMODE :: enum u32 {
    NONE          = 0,
    FRONT_CCW     = 1,
    BACK_CCW      = 2,
}

// Stencil operation
GPU_STENCILOP :: enum u32 {
    KEEP          = 0,
    ZERO          = 1,
    REPLACE       = 2,
    INCR          = 3,
    DECR          = 4,
    INVERT        = 5,
    INCR_WRAP     = 6,
    DECR_WRAP     = 7,
}

// Color logic operation
GPU_LOGICOP :: enum u32 {
    CLEAR         = 0,
    AND           = 1,
    AND_REVERSE   = 2,
    COPY          = 3,
    SET           = 4,
    COPY_INVERTED = 5,
    NOOP          = 6,
    INVERT        = 7,
    NAND          = 8,
    OR            = 9,
    NOR           = 10,
    XOR           = 11,
    EQUIV         = 12,
    AND_INVERTED  = 13,
    OR_REVERSE    = 14,
    OR_INVERTED   = 15,
}

// Fragment operation mode
GPU_FRAGOPMODE :: enum u32 {
    DEFAULT = 0,
    SHADOW  = 3,
    GAS     = 8,
}

// Scissor mode
GPU_SCISSORMODE :: enum u32 {
    DISABLE  = 0,
    INVERT   = 1,
    NORMAL   = 3,
}

// Early depth test function
GPU_EARLYDEPTHFUNC :: enum u32 {
    GREATER_EQUAL = 0,
    GREATER       = 1,
    LESS_EQUAL    = 2,
    LESS          = 3,
}

// TexEnv sources
GPU_TEVSRC :: enum u32 {
    PRIMARY_COLOR     = 0x0,
    FRAGMENT_PRIMARY  = 0x1,
    FRAGMENT_SECONDARY= 0x2,
    TEXTURE0          = 0x3,
    TEXTURE1          = 0x4,
    TEXTURE2          = 0x5,
    TEXTURE3          = 0x6,
    PREVIOUS_BUFFER   = 0xD,
    CONSTANT          = 0xE,
    PREVIOUS          = 0xF,
}

// TexEnv RGB channel operands (GPU_TEVOP_RGB in GPU/enums.h).
GPU_TEVOP_RGB :: enum u32 {
    SRC_COLOR           = 0x0,
    ONE_MINUS_SRC_COLOR = 0x1,
    SRC_ALPHA           = 0x2,
    ONE_MINUS_SRC_ALPHA = 0x3,
    SRC_R               = 0x4,
    ONE_MINUS_SRC_R     = 0x5,
    SRC_G               = 0x8,
    ONE_MINUS_SRC_G     = 0x9,
    SRC_B               = 0xC,
    ONE_MINUS_SRC_B     = 0xD,
}

// TexEnv alpha channel operands (GPU_TEVOP_A in GPU/enums.h).
// Note: the ordering starts with ALPHA (not COLOR) to match the hardware.
GPU_TEVOP_A :: enum u32 {
    SRC_ALPHA           = 0x0,
    ONE_MINUS_SRC_ALPHA = 0x1,
    SRC_R               = 0x2,
    ONE_MINUS_SRC_R     = 0x3,
    SRC_G               = 0x4,
    ONE_MINUS_SRC_G     = 0x5,
    SRC_B               = 0x6,
    ONE_MINUS_SRC_B     = 0x7,
}

// TexEnv combine function
GPU_COMBINEFUNC :: enum u32 {
    REPLACE      = 0,
    MODULATE     = 1,
    ADD          = 2,
    ADD_SIGNED   = 3,
    INTERPOLATE  = 4,
    SUBTRACT     = 5,
    DOT3_RGB     = 6,
    MULTIPLY_ADD = 8,
    ADD_MULTIPLY = 9,
}

// TexEnv output scale
GPU_TEVSCALE :: enum u32 {
    SCALE_1 = 0,
    SCALE_2 = 1,
    SCALE_4 = 2,
}

// Convenience aliases matching the C macros GPU_TEVSCALE_1 etc.
GPU_TEVSCALE_1 :: GPU_TEVSCALE.SCALE_1
GPU_TEVSCALE_2 :: GPU_TEVSCALE.SCALE_2
GPU_TEVSCALE_4 :: GPU_TEVSCALE.SCALE_4

// GPU_PRIMARY_COLOR — shorthand for GPU_TEVSRC.PRIMARY_COLOR (= 0).
GPU_PRIMARY_COLOR :: GPU_TEVSRC.PRIMARY_COLOR

// Light LUT identifiers
GPU_LIGHTLUTID :: enum u32 {
    D0     = 0,
    D1     = 1,
    FR     = 3,
    RB     = 4,
    RG     = 5,
    RR     = 6,
    SP0    = 8,
    SP1    = 9,
    SP2    = 10,
    SP3    = 11,
    SP4    = 12,
    SP5    = 13,
    SP6    = 14,
    SP7    = 15,
    DA0    = 16,
    DA1    = 17,
    DA2    = 18,
    DA3    = 19,
    DA4    = 20,
    DA5    = 21,
    DA6    = 22,
    DA7    = 23,
}

// Light LUT input source
GPU_LIGHTLUTINPUT :: enum u32 {
    NH = 0,
    VH = 1,
    NV = 2,
    LN = 3,
    SP = 4,
    CP = 5,
}

// Fresnel selector
GPU_FRESNELSEL :: enum u32 {
    NO_FRESNEL       = 0,
    PRI_ALPHA_FRESNEL = 1,
    SEC_ALPHA_FRESNEL = 2,
    PRI_SEC_ALPHA_FRESNEL = 3,
}

// Bump mapping mode
GPU_BUMPMODE :: enum u32 {
    NOTUSED = 0,
    BUMP    = 1,
    TANG    = 2,
}

// Fog mode
GPU_FOGMODE :: enum u32 {
    DISABLED    = 0,
    FOG         = 5,
    GAS_DEPTH   = 6,
    GAS_DENSITY = 7,
}

// Gas mode
GPU_GASMODE :: enum u32 {
    PLAIN_DENSITY = 0,
    PROJECTED_DENSITY = 1,
    DEPTH_DENSITY = 2,
}

// Gas LUT input
GPU_GASLUTINPUT :: enum u32 {
    POSITION   = 0,
    PROJECTION = 1,
}

// Procedural texture LUT IDs
GPU_PROCTEX_LUTID :: enum u32 {
    NOISE  = 0,
    RGBMAP = 2,
    ALPHAMAP = 3,
    COLOR  = 4,
    COLOR_DIFF = 5,
}

// Texture unit selector (bitmask — combine with | for multiple units)
// Used with C3D_LightEnvShadowSel and raw GPU command buffer writes.
GPU_TEXUNIT :: enum u32 {
    TEXUNIT0 = 0x1,
    TEXUNIT1 = 0x2,
    TEXUNIT2 = 0x4,
}

// Light LUT output scale factor
// Source: GPU/enums.h GPU_LIGHTLUTSCALER
GPU_LIGHTLUTSCALER :: enum u32 {
    LUTSCALER_1x    = 0,
    LUTSCALER_2x    = 1,
    LUTSCALER_4x    = 2,
    LUTSCALER_8x    = 3,
    LUTSCALER_0_25x = 6,
    LUTSCALER_0_5x  = 7,
}

// Light LUT bank selector
// Source: GPU/enums.h GPU_LIGHTLUTSELECT
GPU_LIGHTLUTSELECT :: enum u32 {
    LUTSELECT_COMMON = 0, // LUTs common to all lights (D0, D1, FR, RB, RG, RR)
    LUTSELECT_SP     = 1, // Spotlight LUT
    LUTSELECT_DA     = 2, // Distance attenuation LUT
}

// Procedural texture UV clamp mode
GPU_PROCTEX_CLAMP :: enum u32 {
    CLAMP_TO_ZERO   = 0,
    CLAMP_TO_EDGE   = 1,
    REPEAT          = 2,
    MIRRORED_REPEAT = 3,
    PULSE           = 4,
}

// Procedural texture map function (scalar combiner)
GPU_PROCTEX_MAPFUNC :: enum u32 {
    U     = 0,
    U2    = 1,
    V     = 2,
    V2    = 3,
    ADD   = 4,
    ADD2  = 5,
    SQRT2 = 6,
    MIN   = 7,
    MAX   = 8,
    RMAX  = 9,
}

// Procedural texture noise shift mode
GPU_PROCTEX_SHIFT :: enum u32 {
    NONE = 0,
    ODD  = 1,
    EVEN = 2,
}

// Procedural texture filter
GPU_PROCTEX_FILTER :: enum u32 {
    NEAREST              = 0,
    LINEAR               = 1,
    NEAREST_MIP_NEAREST  = 2,
    LINEAR_MIP_NEAREST   = 3,
    NEAREST_MIP_LINEAR   = 4,
    LINEAR_MIP_LINEAR    = 5,
}

// ── Short aliases (strip C3D_ prefix) ──────────────────────────────────────

// Math types
FVec             :: C3D_FVec
FQuat            :: C3D_FQuat
Mtx              :: C3D_Mtx

// Texture types
Tex              :: C3D_Tex
TexCube          :: C3D_TexCube
TexInitParams    :: C3D_TexInitParams
DEPTHTYPE        :: C3D_DEPTHTYPE

DEPTHTYPE_NO_DEPTH         :: C3D_DEPTHTYPE_NO_DEPTH
DEPTHTYPE_DEPTH16          :: C3D_DEPTHTYPE_DEPTH16
DEPTHTYPE_DEPTH24          :: C3D_DEPTHTYPE_DEPTH24
DEPTHTYPE_DEPTH24_STENCIL8 :: C3D_DEPTHTYPE_DEPTH24_STENCIL8

// Framebuffer types
FrameBuf         :: C3D_FrameBuf
ClearBits        :: C3D_ClearBits

CLEAR_COLOR      :: C3D_CLEAR_COLOR
CLEAR_DEPTH      :: C3D_CLEAR_DEPTH
CLEAR_ALL        :: C3D_CLEAR_ALL

// Attribute / buffer info types
AttrInfo         :: C3D_AttrInfo
BufCfg           :: C3D_BufCfg
BufInfo          :: C3D_BufInfo

// TexEnv types
TexEnv           :: C3D_TexEnv
TexEnvMode       :: C3D_TexEnvMode

RGB              :: C3D_RGB
Alpha            :: C3D_Alpha
Both             :: C3D_Both

// Matrix stack
MTXSTACK_SIZE    :: C3D_MTXSTACK_SIZE
MtxStack         :: C3D_MtxStack

// Lighting types
Material         :: C3D_Material
LightLut         :: C3D_LightLut
LightLutDA       :: C3D_LightLutDA
LightEnv         :: C3D_LightEnv
Light            :: C3D_Light

// Fog / gas types
FogLut           :: C3D_FogLut
GasLut           :: C3D_GasLut

// Procedural texture types
ProcTex          :: C3D_ProcTex
ProcTexLut       :: C3D_ProcTexLut
ProcTexColorLut  :: C3D_ProcTexColorLut
ProcTexCoord     :: C3D_ProcTexCoord
