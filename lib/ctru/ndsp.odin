package ctru

// ============================================================
// NDSP — Nintendo DSP audio service
// Sources: 3ds/ndsp/ndsp.h, 3ds/ndsp/channel.h
//
// Float-parameter functions are routed through bridge wrappers
// (lib/ctru/bridge.c) to cross the soft-float → hard-float ABI
// boundary.  Direct calls are safe for all-integer / pointer
// arguments.
// ============================================================

// ── Enum types ───────────────────────────────────────────────

/// Sound output mode.
ndspOutputMode :: enum u32 {
    MONO     = 0,
    STEREO   = 1,
    SURROUND = 2,
}

/// Waveform clipping mode.
ndspClippingMode :: enum u32 {
    NORMAL = 0,
    SOFT   = 1,
}

/// Surround speaker position.
ndspSpeakerPos :: enum u32 {
    SQUARE = 0,
    WIDE   = 1,
}

/// Channel interpolation type.
ndspInterpType :: enum u32 {
    POLYPHASE = 0,
    LINEAR    = 1,
    NONE      = 2,
}

// ── Channel format constants ──────────────────────────────────
//
// Use with ndspChnSetFormat.
// NDSP_CHANNELS(n) = n & 3, NDSP_ENCODING(n) = (n & 3) << 2
// PCM8=0, PCM16=1, ADPCM=2

NDSP_FORMAT_MONO_PCM8    :: u16(1)  // 1 channel, PCM8
NDSP_FORMAT_MONO_PCM16   :: u16(5)  // 1 channel, PCM16
NDSP_FORMAT_MONO_ADPCM   :: u16(9)  // 1 channel, DSPADPCM
NDSP_FORMAT_STEREO_PCM8  :: u16(2)  // 2 channels, PCM8
NDSP_FORMAT_STEREO_PCM16 :: u16(6)  // 2 channels, PCM16

// Aliases
NDSP_FORMAT_PCM8  :: NDSP_FORMAT_MONO_PCM8
NDSP_FORMAT_PCM16 :: NDSP_FORMAT_MONO_PCM16
NDSP_FORMAT_ADPCM :: NDSP_FORMAT_MONO_ADPCM

// Extra flags for ndspChnSetFormat
NDSP_FRONT_BYPASS             :: u16(1 << 4) // = 16
NDSP_3D_SURROUND_PREPROCESSED :: u16(1 << 6) // = 64

// ── Wave buffer status values ─────────────────────────────────
NDSP_WBUF_FREE    :: u8(0) // not queued
NDSP_WBUF_QUEUED  :: u8(1) // queued, not yet played
NDSP_WBUF_PLAYING :: u8(2) // currently playing
NDSP_WBUF_DONE    :: u8(3) // finished playing

// ── Struct types ─────────────────────────────────────────────

/// DSPADPCM predictor/history state.
ndspAdpcmData :: struct {
    index:    u16,
    history0: i16,
    history1: i16,
}

/// Wave buffer submitted to a DSP channel.
// The data_vaddr union field covers all pointer variants;
// cast to ^i8, ^i16, or ^u8 as appropriate for the encoding.
ndspWaveBuf :: struct {
    data_vaddr:  rawptr,       // PCM8 / PCM16 / ADPCM / generic pointer
    nsamples:    u32,          // total samples (bytes for PCM8, halfwords for PCM16, nibbles for ADPCM)
    adpcm_data:  ^ndspAdpcmData, // ADPCM coefficients; nil for PCM
    offset:      u32,          // capture offset (not used for playback)
    looping:     bool,         // whether to loop this buffer
    status:      u8,           // NDSP_WBUF_* status
    sequence_id: u16,          // assigned by ndspChnWaveBufAdd
    next:        ^ndspWaveBuf, // internal linked-list pointer — do not modify
}

/// Sound frame callback.  Called once per DSP frame (~5 ms).
ndspCallback :: #type proc "c" (data: rawptr)

/// Auxiliary output callback.
ndspAuxCallback :: #type proc "c" (data: rawptr, nsamples: i32, samples: [^]rawptr)

// ── Foreign declarations ──────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // ── Init / exit ───────────────────────────────────────────
    // ndspInit loads the default DSP binary from romfs:/dspfirm.cdc.
    ndspInit :: proc() -> Result ---
    ndspExit :: proc() ---
    // Optionally override with a custom DSP binary (call before ndspInit).
    ndspUseComponent :: proc(binary: rawptr, size: u32, progMask, dataMask: u16) ---

    // ── Statistics ────────────────────────────────────────────
    ndspGetDroppedFrames :: proc() -> u32 ---
    ndspGetFrameCount    :: proc() -> u32 ---

    // ── Global parameters (integer / pointer — no bridge needed) ─
    ndspSetOutputMode   :: proc(mode: ndspOutputMode) ---
    ndspGetOutputMode   :: proc() -> ndspOutputMode ---
    ndspSetClippingMode :: proc(mode: ndspClippingMode) ---
    ndspGetClippingMode :: proc() -> ndspClippingMode ---
    ndspSetOutputCount  :: proc(count: i32) ---
    ndspGetOutputCount  :: proc() -> i32 ---
    ndspSetCapture      :: proc(capture: ^ndspWaveBuf) ---
    ndspSetCallback     :: proc(callback: ndspCallback, data: rawptr) ---

    // ── Surround ──────────────────────────────────────────────
    ndspSurroundSetDepth    :: proc(depth: u16) ---
    ndspSurroundGetDepth    :: proc() -> u16 ---
    ndspSurroundSetPos      :: proc(pos: ndspSpeakerPos) ---
    ndspSurroundGetPos      :: proc() -> ndspSpeakerPos ---
    ndspSurroundSetRearRatio :: proc(ratio: u16) ---
    ndspSurroundGetRearRatio :: proc() -> u16 ---

    // ── Auxiliary outputs (integer / bool — no bridge needed) ─
    ndspAuxSetEnable      :: proc(id: i32, enable: bool) ---
    ndspAuxIsEnabled      :: proc(id: i32) -> bool ---
    ndspAuxSetFrontBypass :: proc(id: i32, bypass: bool) ---
    ndspAuxGetFrontBypass :: proc(id: i32) -> bool ---
    ndspAuxSetCallback    :: proc(id: i32, callback: ndspAuxCallback, data: rawptr) ---

    // ── Channel — basic ops ───────────────────────────────────
    ndspChnReset        :: proc(id: i32) ---
    ndspChnInitParams   :: proc(id: i32) ---
    ndspChnIsPlaying    :: proc(id: i32) -> bool ---
    ndspChnGetSamplePos :: proc(id: i32) -> u32 ---
    ndspChnGetWaveBufSeq :: proc(id: i32) -> u16 ---
    ndspChnIsPaused     :: proc(id: i32) -> bool ---
    ndspChnSetPaused    :: proc(id: i32, paused: bool) ---

    // ── Channel — configuration (integer, no bridge needed) ───
    ndspChnSetFormat    :: proc(id: i32, format: u16) ---
    ndspChnGetFormat    :: proc(id: i32) -> u16 ---
    ndspChnSetInterp    :: proc(id: i32, kind: ndspInterpType) ---
    ndspChnGetInterp    :: proc(id: i32) -> ndspInterpType ---
    // ndspChnSetRate and ndspChnGetRate go through the bridge (float ABI).
    // ndspChnSetMix / ndspChnGetMix take float[12] by pointer — safe.
    ndspChnSetMix       :: proc(id: i32, mix: ^[12]f32) ---
    ndspChnGetMix       :: proc(id: i32, mix: ^[12]f32) ---
    ndspChnSetAdpcmCoefs :: proc(id: i32, coefs: ^[16]u16) ---

    // ── Channel — wave buffers ────────────────────────────────
    ndspChnWaveBufClear :: proc(id: i32) ---
    ndspChnWaveBufAdd   :: proc(id: i32, buf: ^ndspWaveBuf) ---

    // ── Channel — IIR filters (enable/disable, no float) ─────
    ndspChnIirMonoSetEnable   :: proc(id: i32, enable: bool) ---
    ndspChnIirBiquadSetEnable :: proc(id: i32, enable: bool) ---
}

// ── Bridge declarations (float ABI wrappers) ─────────────────
// These are implemented in lib/ctru/bridge.c and use u2f()/f2u()
// to cross the soft-float → hard-float ABI boundary.

foreign import ctru_bridge "system:ctru_bridge"

@(default_calling_convention = "c")
foreign ctru_bridge {
    // Master volume (0.0 – 1.0, default 1.0)
    @(link_name = "ndsp_set_master_vol")
    ndspSetMasterVol :: proc(volume: f32) ---
    @(link_name = "ndsp_get_master_vol")
    ndspGetMasterVol :: proc() -> f32 ---

    // Auxiliary output volume
    @(link_name = "ndsp_aux_set_volume")
    ndspAuxSetVolume :: proc(id: i32, volume: f32) ---
    @(link_name = "ndsp_aux_get_volume")
    ndspAuxGetVolume :: proc(id: i32) -> f32 ---

    // Channel sample rate (Hz, e.g. 22050.0 or 44100.0)
    @(link_name = "ndsp_chn_set_rate")
    ndspChnSetRate :: proc(id: i32, rate: f32) ---
    @(link_name = "ndsp_chn_get_rate")
    ndspChnGetRate :: proc(id: i32) -> f32 ---

    // IIR monopole filters
    @(link_name = "ndsp_chn_iir_mono_custom")
    ndspChnIirMonoSetParamsCustomFilter    :: proc(id: i32, a0, a1, b0: f32) -> bool ---
    @(link_name = "ndsp_chn_iir_mono_lpf")
    ndspChnIirMonoSetParamsLowPassFilter   :: proc(id: i32, f0: f32) -> bool ---
    @(link_name = "ndsp_chn_iir_mono_hpf")
    ndspChnIirMonoSetParamsHighPassFilter  :: proc(id: i32, f0: f32) -> bool ---

    // IIR biquad filters
    @(link_name = "ndsp_chn_iir_biquad_custom")
    ndspChnIirBiquadSetParamsCustomFilter      :: proc(id: i32, a0, a1, a2, b0, b1, b2: f32) -> bool ---
    @(link_name = "ndsp_chn_iir_biquad_lpf")
    ndspChnIirBiquadSetParamsLowPassFilter     :: proc(id: i32, f0, Q: f32) -> bool ---
    @(link_name = "ndsp_chn_iir_biquad_hpf")
    ndspChnIirBiquadSetParamsHighPassFilter    :: proc(id: i32, f0, Q: f32) -> bool ---
    @(link_name = "ndsp_chn_iir_biquad_bpf")
    ndspChnIirBiquadSetParamsBandPassFilter    :: proc(id: i32, f0, Q: f32) -> bool ---
    @(link_name = "ndsp_chn_iir_biquad_notch")
    ndspChnIirBiquadSetParamsNotchFilter       :: proc(id: i32, f0, Q: f32) -> bool ---
    @(link_name = "ndsp_chn_iir_biquad_peq")
    ndspChnIirBiquadSetParamsPeakingEqualizer  :: proc(id: i32, f0, Q, gain: f32) -> bool ---
}
