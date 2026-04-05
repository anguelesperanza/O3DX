package ctru

// ============================================================
// MVD — Media Video Decoder Service (New 3DS only)
// 3ds/services/mvd.h  http://3dbrew.org/wiki/MVD_Services
//
// Hardware H.264 decoder built into the New 3DS.  Also does
// YUV-to-RGB color conversion (useful with the camera service).
//
// The service has two modes:
//   COLORFORMATCONV — convert YUV422 frames to RGB565/BGR565
//   VIDEOPROCESSING — decode H.264 NAL units to RGB frames
//
// Video decode flow (simplified):
//
//   ctru.mvdstdInit(.VIDEOPROCESSING, .H264, .RGB565,
//                   ctru.MVD_DEFAULT_WORKBUF_SIZE, nil)
//   defer ctru.mvdstdExit()
//
//   config: ctru.MVDSTD_Config
//   ctru.mvdstdGenerateDefaultConfig(&config, 400, 240, 400, 240,
//                                     vaddr_in, vaddr_out0, nil)
//   ctru.MVDSTD_SetConfig(&config)
//
//   // For each NAL unit:
//   status := ctru.mvdstdProcessVideoFrame(nal_buf, nal_size, 0, nil)
//   if ctru.MVD_CHECKNALUPROC_SUCCESS(status) {
//       ctru.mvdstdRenderVideoFrame(&config, true)
//   }
// ============================================================

// ── Status constants returned by MVDSTD operations ────────────

MVD_STATUS_OK                  :: u32(0x17000)
MVD_STATUS_PARAMSET            :: u32(0x17001) // NAL parameter-sets processed
MVD_STATUS_BUSY                :: u32(0x17002)
MVD_STATUS_FRAMEREADY          :: u32(0x17003)
MVD_STATUS_INCOMPLETEPROCESSING :: u32(0x17004) // not all input was consumed
MVD_STATUS_NALUPROCFLAG        :: u32(0x17007)

// Check whether mvdstdProcessVideoFrame returned a successful status.
mvd_check_naluproc_success :: #force_inline proc "c" (x: u32) -> bool {
    return x == MVD_STATUS_OK ||
           x == MVD_STATUS_PARAMSET ||
           x == MVD_STATUS_FRAMEREADY ||
           x == MVD_STATUS_INCOMPLETEPROCESSING ||
           x == MVD_STATUS_NALUPROCFLAG
}

/// Default work-buffer size for mvdstdInit (matches New 3DS Internet Browser).
MVD_DEFAULT_WORKBUF_SIZE :: u32(0x9006C8)

// ── mvdstdCalculateBufferSize flags ────────────────────────────

MVD_CALC_WITH_LEVEL_FLAG_NONE       :: u8(0x00)
MVD_CALC_WITH_LEVEL_FLAG_ENABLE_CALC      :: u8(0x01)
MVD_CALC_WITH_LEVEL_FLAG_ENABLE_EXTRA_OP  :: u8(0x02)
MVD_CALC_WITH_LEVEL_FLAG_UNK        :: u8(0x04)

// ── H.264 level constants ──────────────────────────────────────

MVD_H264_LEVEL_1_0  :: u8(0x00)
MVD_H264_LEVEL_1_0B :: u8(0x01)
MVD_H264_LEVEL_1_1  :: u8(0x02)
MVD_H264_LEVEL_1_2  :: u8(0x03)
MVD_H264_LEVEL_1_3  :: u8(0x04)
MVD_H264_LEVEL_2_0  :: u8(0x05)
MVD_H264_LEVEL_2_1  :: u8(0x06)
MVD_H264_LEVEL_2_2  :: u8(0x07)
MVD_H264_LEVEL_3_0  :: u8(0x08)
MVD_H264_LEVEL_3_1  :: u8(0x09)
MVD_H264_LEVEL_3_2  :: u8(0x0A)
MVD_H264_LEVEL_4_0  :: u8(0x0B)
MVD_H264_LEVEL_4_1  :: u8(0x0C)
MVD_H264_LEVEL_4_2  :: u8(0x0D)
MVD_H264_LEVEL_5_0  :: u8(0x0E)
MVD_H264_LEVEL_5_1  :: u8(0x0F)
MVD_H264_LEVEL_5_2  :: u8(0x10)

// ── Enums ─────────────────────────────────────────────────────

/// MVDSTD operating mode.
MVDSTD_Mode :: enum u32 {
    COLORFORMATCONV = 0, // YUV422 → RGB/BGR color conversion
    VIDEOPROCESSING = 1, // H.264 NAL unit decoding
}

/// Input pixel/stream format.
MVDSTD_InputFormat :: enum u32 {
    YUYV422 = 0x00010001,
    H264    = 0x00020001,
}

/// Output pixel format.
MVDSTD_OutputFormat :: enum u32 {
    YUYV422 = 0x00010001,
    BGR565  = 0x00040002,
    RGB565  = 0x00040004,
}

// ── Structs ───────────────────────────────────────────────────

/// Full processing configuration (284 bytes).
/// Use mvdstdGenerateDefaultConfig() to fill this.
MVDSTD_Config :: struct {
    input_type:              MVDSTD_InputFormat,
    unk_x04:                 u32,
    unk_x08:                 u32, // H264 range
    inwidth:                 u32,
    inheight:                u32,
    physaddr_colorconv_indata: u32,
    physaddr_colorconv_unk0:   u32,
    physaddr_colorconv_unk1:   u32,
    physaddr_colorconv_unk2:   u32,
    physaddr_colorconv_unk3:   u32,
    unk_x28:                 [6]u32,   // 0x18 bytes
    enable_cropping:         u32,
    input_crop_x_pos:        u32,
    input_crop_y_pos:        u32,
    input_crop_height:       u32,
    input_crop_width:        u32,
    unk_x54:                 u32,
    output_type:             MVDSTD_OutputFormat,
    outwidth:                u32,
    outheight:               u32,
    physaddr_outdata0:       u32,
    physaddr_outdata1:       u32, // only used for output format 0x00020001
    unk_x6c:                 [38]u32,  // 0x98 bytes
    flag_x104:               u32,     // enables the 4 output-position fields below
    output_x_pos:            u32,
    output_y_pos:            u32,
    output_width_override:   u32,
    output_height_override:  u32,
    unk_x118:                u32,
}

/// Output from mvdstdProcessVideoFrame (12 bytes).
MVDSTD_ProcessNALUnitOut :: struct {
    end_vaddr:      u32, // end vaddr of the processed NAL unit
    end_physaddr:   u32, // end physaddr following the input physaddr
    remaining_size: u32, // unprocessed input bytes remaining
}

/// One output buffer pair for multi-buffer output (8 bytes).
MVDSTD_OutputBuffersEntry :: struct {
    outdata0: rawptr, // linear-mem vaddr matching config physaddr_outdata0
    outdata1: rawptr, // linear-mem vaddr matching config physaddr_outdata1
}

/// List of output buffer entries (140 bytes).
MVDSTD_OutputBuffersEntryList :: struct {
    total_entries: u32,
    entries:       [17]MVDSTD_OutputBuffersEntry,
}

/// Optional initialization overrides for VIDEOPROCESSING mode (9 bytes).
/// All fields default to zero except cmd1b_inval which defaults to 1.
/// Pass nil to mvdstdInit for the defaults.
MVDSTD_InitStruct :: struct {
    cmd5_inval0: i8,
    cmd5_inval1: i8,
    cmd5_inval2: i8,
    cmd5_inval3: u32,
    cmd1b_inval: u8,
}

/// Per-calculation-method config embedded in MVDSTD_CalculateWorkBufSizeConfig.
MVDSTD_WithLevel :: struct {
    enable:      u8,
    flag:        u8, // MVD_CALC_WITH_LEVEL_FLAG_*
    double_size: u8,
    level:       u8, // MVD_H264_LEVEL_*
}

/// Reference-frame count method config.
MVDSTD_WithNumOfRefFrames :: struct {
    enable:     u8,
    ref_frames: u8,
}

/// Config for mvdstdCalculateBufferSize (52 bytes).
MVDSTD_CalculateWorkBufSizeConfig :: struct {
    unused_0x00:  u8,
    level:        MVDSTD_WithLevel,
    ref_frames_a: MVDSTD_WithNumOfRefFrames,
    ref_frames_b: MVDSTD_WithNumOfRefFrames,
    unused_0x09:  [3]u8,
    unk_0x0c:     u32,
    unk_0x10:     u32,
    unk_0x14:     u32,
    unk_0x18:     u32,
    unk_0x1c:     u32,
    unk_0x20:     u32,
    unk_0x24:     u32,
    width:        u32,
    height:       u32,
}

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    // mode:        .COLORFORMATCONV or .VIDEOPROCESSING
    // input_type:  .YUYV422 or .H264
    // output_type: .YUYV422, .BGR565, or .RGB565
    // size:        work-buffer size (only used in VIDEOPROCESSING;
    //              use MVD_DEFAULT_WORKBUF_SIZE)
    // initstruct:  optional overrides; pass nil for defaults
    mvdstdInit :: proc(mode: MVDSTD_Mode,
                       input_type: MVDSTD_InputFormat,
                       output_type: MVDSTD_OutputFormat,
                       size: u32,
                       initstruct: ^MVDSTD_InitStruct) -> Result ---

    mvdstdExit :: proc() ---

    // ── Buffer size calculation ───────────────────────────────

    // Calculate the required work buffer size for given H.264 parameters.
    // config.level.level must not exceed MVD_H264_LEVEL_5_2.
    mvdstdCalculateBufferSize :: proc(config: ^MVDSTD_CalculateWorkBufSizeConfig,
                                       size_out: ^u32) -> Result ---

    // ── Configuration ─────────────────────────────────────────

    // Generate a default MVDSTD_Config.
    // vaddr_colorconv_indata / vaddr_outdata0 / vaddr_outdata1:
    //   linear-mem virtual addresses (from linearAlloc).
    mvdstdGenerateDefaultConfig :: proc(config: ^MVDSTD_Config,
                                         input_width:  u32,
                                         input_height: u32,
                                         output_width: u32,
                                         output_height: u32,
                                         vaddr_colorconv_indata: ^u32,
                                         vaddr_outdata0: ^u32,
                                         vaddr_outdata1: ^u32) ---

    // Push configuration to the hardware.
    MVDSTD_SetConfig :: proc(config: ^MVDSTD_Config) -> Result ---

    // ── Color format conversion ────────────────────────────────

    // Convert one YUV422 frame to the configured output format.
    mvdstdConvertImage :: proc(config: ^MVDSTD_Config) -> Result ---

    // ── H.264 decoding ────────────────────────────────────────

    // Process one NAL unit (must start with 00 00 01 prefix).
    // inbuf_vaddr: linear-mem virtual address.
    // flag: see 3dbrew MVDSTD:ProcessNALUnit docs.
    // out: optional; pass nil normally.
    // Returns an MVD_STATUS_* value (check with mvd_check_naluproc_success).
    mvdstdProcessVideoFrame :: proc(inbuf_vaddr: rawptr,
                                     size: uint,
                                     flag: u32,
                                     out: ^MVDSTD_ProcessNALUnitOut) -> Result ---

    // Render the decoded frame to the output buffer.
    // config: pass nil if MVDSTD_SetConfig was already called.
    // wait:   block until rendering finishes (true);
    //         or poll (call repeatedly until not MVD_STATUS_BUSY).
    mvdstdRenderVideoFrame :: proc(config: ^MVDSTD_Config, wait: bool) -> Result ---

    // ── Multi-buffer output ───────────────────────────────────

    // Set up alternate output buffers (not used by the N3DS browser).
    mvdstdSetupOutputBuffers :: proc(entrylist: ^MVDSTD_OutputBuffersEntryList,
                                      bufsize: u32) -> Result ---

    // Override entry 0 output buffers set by mvdstdSetupOutputBuffers.
    mvdstdOverrideOutputBuffers :: proc(cur_outdata0: rawptr, cur_outdata1: rawptr,
                                         new_outdata0: rawptr, new_outdata1: rawptr) -> Result ---
}
