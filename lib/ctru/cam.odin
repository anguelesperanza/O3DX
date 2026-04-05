package ctru

// ============================================================
// CAM — Camera Service
// 3ds/services/cam.h
//
// Gives access to the 3DS front (inner) and rear (outer) cameras.
// Output formats are YUV422 or RGB565; use the Y2R service to
// convert YUV to RGB for display.
//
// Minimal capture loop (outer camera, QVGA, RGB565):
//
//   camInit()
//   defer camExit()
//
//   CAMU_SetSize(SELECT_OUT1, .QVGA, .A)
//   CAMU_SetOutputFormat(SELECT_OUT1, .RGB_565, .A)
//   CAMU_SetFrameRate(SELECT_OUT1, .FRAME_RATE_30)
//   CAMU_SetNoiseFilter(SELECT_OUT1, true)
//   CAMU_SetAutoExposure(SELECT_OUT1, true)
//   CAMU_SetAutoWhiteBalance(SELECT_OUT1, true)
//   CAMU_Activate(SELECT_OUT1)
//
//   imgSize := u32(320 * 240 * 2)  // QVGA RGB565 = 2 bytes/pixel
//   buf := linearAlloc(imgSize)
//   defer linearFree(buf)
//
//   event: Handle
//   CAMU_SetReceiving(&event, buf, PORT_CAM1, imgSize, s16(512))
//   CAMU_StartCapture(PORT_CAM1)
//   svcWaitSynchronization(event, max(i64))
//   svcCloseHandle(event)
//   CAMU_StopCapture(PORT_CAM1)
// ============================================================

// ── Port select flags (OR-able bitmask) ──────────────────────

CAM_PORT_NONE :: u32(0)
CAM_PORT_CAM1 :: u32(1 << 0) // CAM1 (rear / outer right)
CAM_PORT_CAM2 :: u32(1 << 1) // CAM2 (rear / outer left)
CAM_PORT_BOTH :: u32(CAM_PORT_CAM1 | CAM_PORT_CAM2)

// ── Camera select flags (OR-able bitmask) ────────────────────

CAM_SELECT_NONE     :: u32(0)
CAM_SELECT_OUT1     :: u32(1 << 0) // Outer camera 1 (right rear)
CAM_SELECT_IN1      :: u32(1 << 1) // Inner camera (front)
CAM_SELECT_OUT2     :: u32(1 << 2) // Outer camera 2 (left rear)
CAM_SELECT_IN1_OUT1  :: u32(CAM_SELECT_OUT1 | CAM_SELECT_IN1)
CAM_SELECT_OUT1_OUT2 :: u32(CAM_SELECT_OUT1 | CAM_SELECT_OUT2)
CAM_SELECT_IN1_OUT2  :: u32(CAM_SELECT_IN1  | CAM_SELECT_OUT2)
CAM_SELECT_ALL       :: u32(CAM_SELECT_OUT1 | CAM_SELECT_IN1 | CAM_SELECT_OUT2)

// ── Enums ─────────────────────────────────────────────────────

/// Camera contexts (can combine with |).
CAMU_Context :: enum u32 {
    NONE    = 0x0,
    A       = 0x1,
    B       = 0x2,
    BOTH    = 0x3,
}

/// Image flip modes.
CAMU_Flip :: enum u32 {
    NONE       = 0x0,
    HORIZONTAL = 0x1,
    VERTICAL   = 0x2,
    REVERSE    = 0x3,
}

/// Capture resolutions.
CAMU_Size :: enum u32 {
    VGA         = 0x0, // 640x480
    QVGA        = 0x1, // 320x240
    QQVGA       = 0x2, // 160x120
    CIF         = 0x3, // 352x288
    QCIF        = 0x4, // 176x144
    DS_LCD      = 0x5, // 256x192
    DS_LCDx4    = 0x6, // 512x384
    CTR_TOP_LCD = 0x7, // 400x240
    // Alias: CTR bottom LCD = QVGA (320x240)
}

/// Frame rates.
CAMU_FrameRate :: enum u32 {
    RATE_15       = 0x0,
    RATE_15_TO_5  = 0x1,
    RATE_15_TO_2  = 0x2,
    RATE_10       = 0x3,
    RATE_8_5      = 0x4,
    RATE_5        = 0x5,
    RATE_20       = 0x6,
    RATE_20_TO_5  = 0x7,
    RATE_30       = 0x8,
    RATE_30_TO_5  = 0x9,
    RATE_15_TO_10 = 0xA,
    RATE_20_TO_10 = 0xB,
    RATE_30_TO_10 = 0xC,
}

/// White balance modes.
CAMU_WhiteBalance :: enum u32 {
    AUTO  = 0x0, // also NORMAL
    K3200 = 0x1, // also TUNGSTEN
    K4150 = 0x2, // also WHITE_FLUORESCENT_LIGHT
    K5200 = 0x3, // also DAYLIGHT
    K6000 = 0x4, // also CLOUDY / HORIZON
    K7000 = 0x5, // also SHADE
}

/// Photo mode presets.
CAMU_PhotoMode :: enum u32 {
    NORMAL    = 0x0,
    PORTRAIT  = 0x1,
    LANDSCAPE = 0x2,
    NIGHTVIEW = 0x3,
    LETTER    = 0x4,
}

/// Special image effects.
CAMU_Effect :: enum u32 {
    NONE     = 0x0,
    MONO     = 0x1,
    SEPIA    = 0x2,
    NEGATIVE = 0x3,
    NEGAFILM = 0x4,
    SEPIA01  = 0x5,
}

/// Contrast levels (6 = normal).
CAMU_Contrast :: enum u32 {
    PATTERN_01 = 0x0,
    PATTERN_02 = 0x1,
    PATTERN_03 = 0x2,
    PATTERN_04 = 0x3,
    PATTERN_05 = 0x4, // LOW
    PATTERN_06 = 0x5, // NORMAL
    PATTERN_07 = 0x6, // HIGH
    PATTERN_08 = 0x7,
    PATTERN_09 = 0x8,
    PATTERN_10 = 0x9,
    PATTERN_11 = 0xA,
}

/// Lens correction modes.
CAMU_LensCorrection :: enum u32 {
    OFF   = 0x0, // also DARK
    ON_70 = 0x1, // also NORMAL
    ON_90 = 0x2, // also BRIGHT
}

/// Pixel output formats.
CAMU_OutputFormat :: enum u32 {
    YUV_422 = 0x0,
    RGB_565 = 0x1,
}

/// Shutter sound types.
CAMU_ShutterSoundType :: enum u32 {
    NORMAL    = 0x0,
    MOVIE     = 0x1,
    MOVIE_END = 0x2,
}

// ── Y2R coefficient enum (from y2r.h, needed for CAMU_GetSuitableY2rStandardCoefficient)
// Will move to y2r.odin when that service is bound.
Y2RU_StandardCoefficient :: enum u32 {
    ITU_R_BT_601         = 0x0,
    ITU_R_BT_709         = 0x1,
    ITU_R_BT_601_SCALING = 0x2,
    ITU_R_BT_709_SCALING = 0x3,
}

// ── Structs ───────────────────────────────────────────────────

/// Image quality calibration data (22 bytes).
CAMU_ImageQualityCalibrationData :: struct {
    aeBaseTarget:   i16, // auto-exposure base target brightness
    kRL:            i16,
    kGL:            i16,
    kBL:            i16,
    ccmPosition:    i16,
    awbCcmL9Right:  u16,
    awbCcmL9Left:   u16,
    awbCcmL10Right: u16,
    awbCcmL10Left:  u16,
    awbX0Right:     u16,
    awbX0Left:      u16,
}

/// Stereo camera calibration data (64 bytes).
CAMU_StereoCameraCalibrationData :: struct {
    isValidRotationXY: u8,
    padding:           [3]u8,
    scale:             f32,
    rotationZ:         f32,
    translationX:      f32,
    translationY:      f32,
    rotationX:         f32,
    rotationY:         f32,
    angleOfViewRight:  f32,
    angleOfViewLeft:   f32,
    distanceToChart:   f32,
    distanceCameras:   f32,
    imageWidth:        i16,
    imageHeight:       i16,
    reserved:          [16]u8,
}

/// Batch config without context (28 bytes).
CAMU_PackageParameterCameraSelect :: struct {
    camera:                      u8,
    exposure:                    i8,
    whiteBalance:                u8,
    sharpness:                   i8,
    autoExposureOn:              bool,
    autoWhiteBalanceOn:          bool,
    frameRate:                   u8,
    photoMode:                   u8,
    contrast:                    u8,
    lensCorrection:              u8,
    noiseFilterOn:               bool,
    padding:                     u8,
    autoExposureWindowX:         i16,
    autoExposureWindowY:         i16,
    autoExposureWindowWidth:     i16,
    autoExposureWindowHeight:    i16,
    autoWhiteBalanceWindowX:     i16,
    autoWhiteBalanceWindowY:     i16,
    autoWhiteBalanceWindowWidth: i16,
    autoWhiteBalanceWindowHeight: i16,
}

/// Batch config with context (5 bytes).
CAMU_PackageParameterContext :: struct {
    camera:  u8,
    ctx:     u8, // CAMU_Context
    flip:    u8, // CAMU_Flip
    effect:  u8, // CAMU_Effect
    size:    u8, // CAMU_Size
}

/// Batch config with context and crop detail (16 bytes).
CAMU_PackageParameterContextDetail :: struct {
    camera:  u8,
    ctx:     u8, // CAMU_Context
    flip:    u8, // CAMU_Flip
    effect:  u8, // CAMU_Effect
    width:   i16,
    height:  i16,
    cropX0:  i16,
    cropY0:  i16,
    cropX1:  i16,
    cropY1:  i16,
}

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────
    // camInit internally calls CAMU_DriverInitialize.
    camInit :: proc() -> Result ---
    camExit :: proc() ---

    // ── Capture flow ──────────────────────────────────────────

    // Begin/stop capture on a port (CAM_PORT_*).
    CAMU_StartCapture :: proc(port: u32) -> Result ---
    CAMU_StopCapture  :: proc(port: u32) -> Result ---

    // Check if a port is currently capturing.
    CAMU_IsBusy :: proc(busy: ^bool, port: u32) -> Result ---

    // Clear port buffer and error flags.
    CAMU_ClearBuffer :: proc(port: u32) -> Result ---

    // Vsync interrupt event handle for the specified port.
    CAMU_GetVsyncInterruptEvent :: proc(event: ^Handle, port: u32) -> Result ---

    // Buffer-error interrupt event handle.
    CAMU_GetBufferErrorInterruptEvent :: proc(event: ^Handle, port: u32) -> Result ---

    // Begin receiving one frame into dst.
    // event is signaled when the transfer completes.
    // transferUnit: number of bytes per DMA transfer (typically 512 or 1024).
    CAMU_SetReceiving :: proc(event: ^Handle, dst: rawptr, port: u32,
                               imageSize: u32, transferUnit: i16) -> Result ---

    // Whether the port finished receiving the last frame.
    CAMU_IsFinishedReceiving :: proc(finished: ^bool, port: u32) -> Result ---

    // ── Transfer size control ─────────────────────────────────

    CAMU_SetTransferLines :: proc(port: u32, lines: i16, width: i16, height: i16) -> Result ---
    CAMU_GetMaxLines      :: proc(maxLines: ^i16, width: i16, height: i16) -> Result ---
    CAMU_SetTransferBytes :: proc(port: u32, bytes: u32, width: i16, height: i16) -> Result ---
    CAMU_GetTransferBytes :: proc(bytes: ^u32, port: u32) -> Result ---
    CAMU_GetMaxBytes      :: proc(maxBytes: ^u32, width: i16, height: i16) -> Result ---

    // ── Trimming ──────────────────────────────────────────────

    CAMU_SetTrimming           :: proc(port: u32, trimming: bool) -> Result ---
    CAMU_IsTrimming            :: proc(trimming: ^bool, port: u32) -> Result ---
    CAMU_SetTrimmingParams     :: proc(port: u32, xStart: i16, yStart: i16,
                                       xEnd: i16, yEnd: i16) -> Result ---
    CAMU_GetTrimmingParams     :: proc(xStart: ^i16, yStart: ^i16,
                                       xEnd: ^i16, yEnd: ^i16, port: u32) -> Result ---
    CAMU_SetTrimmingParamsCenter :: proc(port: u32, trimWidth: i16, trimHeight: i16,
                                          camWidth: i16, camHeight: i16) -> Result ---

    // ── Camera selection and context ─────────────────────────

    // Activate a camera (CAM_SELECT_*).
    CAMU_Activate      :: proc(select: u32) -> Result ---
    // Switch the active context for the specified camera.
    CAMU_SwitchContext :: proc(select: u32, camu_context: CAMU_Context) -> Result ---

    // ── Image quality settings ────────────────────────────────

    CAMU_SetExposure                  :: proc(select: u32, exposure: i8) -> Result ---
    CAMU_SetWhiteBalance              :: proc(select: u32, whiteBalance: CAMU_WhiteBalance) -> Result ---
    CAMU_SetWhiteBalanceWithoutBaseUp :: proc(select: u32, whiteBalance: CAMU_WhiteBalance) -> Result ---
    CAMU_SetSharpness                 :: proc(select: u32, sharpness: i8) -> Result ---
    CAMU_SetAutoExposure              :: proc(select: u32, autoExposure: bool) -> Result ---
    CAMU_IsAutoExposure               :: proc(autoExposure: ^bool, select: u32) -> Result ---
    CAMU_SetAutoWhiteBalance          :: proc(select: u32, autoWhiteBalance: bool) -> Result ---
    CAMU_IsAutoWhiteBalance           :: proc(autoWhiteBalance: ^bool, select: u32) -> Result ---

    // ── Image geometry ────────────────────────────────────────

    CAMU_FlipImage  :: proc(select: u32, flip: CAMU_Flip, camu_context: CAMU_Context) -> Result ---
    CAMU_SetDetailSize :: proc(select: u32, width: i16, height: i16,
                                cropX0: i16, cropY0: i16, cropX1: i16, cropY1: i16,
                                camu_context: CAMU_Context) -> Result ---
    CAMU_SetSize    :: proc(select: u32, size: CAMU_Size, camu_context: CAMU_Context) -> Result ---

    // ── Capture settings ──────────────────────────────────────

    CAMU_SetFrameRate      :: proc(select: u32, frameRate: CAMU_FrameRate) -> Result ---
    CAMU_SetPhotoMode      :: proc(select: u32, photoMode: CAMU_PhotoMode) -> Result ---
    CAMU_SetEffect         :: proc(select: u32, effect: CAMU_Effect,
                                   camu_context: CAMU_Context) -> Result ---
    CAMU_SetContrast       :: proc(select: u32, contrast: CAMU_Contrast) -> Result ---
    CAMU_SetLensCorrection :: proc(select: u32, lensCorrection: CAMU_LensCorrection) -> Result ---
    CAMU_SetOutputFormat   :: proc(select: u32, format: CAMU_OutputFormat,
                                   camu_context: CAMU_Context) -> Result ---
    CAMU_SetAutoExposureWindow    :: proc(select: u32, x: i16, y: i16,
                                          width: i16, height: i16) -> Result ---
    CAMU_SetAutoWhiteBalanceWindow :: proc(select: u32, x: i16, y: i16,
                                           width: i16, height: i16) -> Result ---
    CAMU_SetNoiseFilter :: proc(select: u32, noiseFilter: bool) -> Result ---

    // ── Stereo / vsync ────────────────────────────────────────

    CAMU_SynchronizeVsyncTiming :: proc(select1: u32, select2: u32) -> Result ---
    // timing must point to an array of `past` int64 values.
    CAMU_GetLatestVsyncTiming   :: proc(timing: ^i64, port: u32, past: u32) -> Result ---

    // ── Calibration data ─────────────────────────────────────

    CAMU_GetStereoCameraCalibrationData :: proc(data: ^CAMU_StereoCameraCalibrationData) -> Result ---
    CAMU_SetStereoCameraCalibrationData :: proc(data: CAMU_StereoCameraCalibrationData) -> Result ---
    CAMU_SetImageQualityCalibrationData :: proc(data: CAMU_ImageQualityCalibrationData) -> Result ---
    CAMU_GetImageQualityCalibrationData :: proc(data: ^CAMU_ImageQualityCalibrationData) -> Result ---

    // ── I2C access (low-level, use with care) ─────────────────

    CAMU_WriteRegisterI2c          :: proc(select: u32, addr: u16, data: u16) -> Result ---
    CAMU_WriteMcuVariableI2c       :: proc(select: u32, addr: u16, data: u16) -> Result ---
    CAMU_ReadRegisterI2cExclusive  :: proc(data: ^u16, select: u32, addr: u16) -> Result ---
    CAMU_ReadMcuVariableI2cExclusive :: proc(data: ^u16, select: u32, addr: u16) -> Result ---

    // ── Batch configuration ───────────────────────────────────

    CAMU_SetPackageParameterWithoutContext   :: proc(param: CAMU_PackageParameterCameraSelect) -> Result ---
    CAMU_SetPackageParameterWithContext       :: proc(param: CAMU_PackageParameterContext) -> Result ---
    CAMU_SetPackageParameterWithContextDetail :: proc(param: CAMU_PackageParameterContextDetail) -> Result ---

    // ── Misc ──────────────────────────────────────────────────

    // Get the Y2R coefficient recommended for converting this camera's output.
    CAMU_GetSuitableY2rStandardCoefficient :: proc(coefficient: ^Y2RU_StandardCoefficient) -> Result ---

    // Play a shutter sound effect.
    CAMU_PlayShutterSound :: proc(sound: CAMU_ShutterSoundType) -> Result ---

    // Low-level driver init/fini (called by camInit/camExit).
    CAMU_DriverInitialize :: proc() -> Result ---
    CAMU_DriverFinalize   :: proc() -> Result ---

    // Get/set which camera is currently active or used during sleep.
    CAMU_GetActivatedCamera :: proc(select: ^u32) -> Result ---
    CAMU_GetSleepCamera     :: proc(select: ^u32) -> Result ---
    CAMU_SetSleepCamera     :: proc(select: u32)  -> Result ---

    // Enable/disable synchronization of outer camera brightness.
    CAMU_SetBrightnessSynchronization :: proc(enable: bool) -> Result ---
}
