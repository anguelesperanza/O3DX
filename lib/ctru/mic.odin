package ctru

// ============================================================
// MIC — Microphone Service
// 3ds/services/mic.h
//
// Records PCM audio from the 3DS built-in microphone into a
// shared memory ring buffer.  The buffer must be allocated with
// linearAlloc() and be 0x1000-byte aligned.
//
// Simple recording loop:
//
//   BUF_SIZE :: u32(0x8000)  // 32 KB ring buffer
//   buf := cast([^]u8)linearAlloc(BUF_SIZE)
//   defer linearFree(buf)
//
//   ctru.micInit(buf, BUF_SIZE)
//   defer ctru.micExit()
//
//   ctru.MICU_SetGain(160)   // 0..160
//   ctru.MICU_StartSampling(.PCM16_SIGNED, .RATE_16360,
//                            0, BUF_SIZE - 4, true)  // loop
//
//   for ctru.aptMainLoop() {
//       offset := ctru.micGetLastSampleOffset()
//       // read from buf[offset] ...
//       if done { break }
//   }
//   ctru.MICU_StopSampling()
// ============================================================

// ── Enums ─────────────────────────────────────────────────────

/// PCM encoding for microphone output.
MICU_Encoding :: enum u32 {
    PCM8        = 0, // Unsigned 8-bit
    PCM16       = 1, // Unsigned 16-bit
    PCM8_SIGNED  = 2, // Signed 8-bit
    PCM16_SIGNED = 3, // Signed 16-bit
}

/// Microphone sample rates.
MICU_SampleRate :: enum u32 {
    RATE_32730 = 0, // ~32728 Hz
    RATE_16360 = 1, // ~16364 Hz
    RATE_10910 = 2, // ~10909 Hz
    RATE_8180  = 3, // ~8182 Hz
}

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    // buffer: linearAlloc'd, 0x1000-aligned ring buffer.
    // bufferSize: size in bytes (use at least 0x1000).
    micInit :: proc(buffer: [^]u8, bufferSize: u32) -> Result ---
    micExit :: proc() ---

    // ── Buffer helpers ────────────────────────────────────────

    // Returns the usable sample-data area size (bufferSize - 4).
    micGetSampleDataSize :: proc() -> u32 ---

    // Returns the byte offset of the last written sample in the buffer.
    // Poll this each frame to know how far the write head has advanced.
    micGetLastSampleOffset :: proc() -> u32 ---

    // ── Low-level shared memory ───────────────────────────────

    // Map/unmap the mic shared memory (called by micInit/micExit internally).
    MICU_MapSharedMem   :: proc(size: u32, handle: Handle) -> Result ---
    MICU_UnmapSharedMem :: proc() -> Result ---

    // ── Sampling control ──────────────────────────────────────

    // Start recording into the ring buffer.
    //   encoding:   output PCM format
    //   sampleRate: desired sample rate
    //   offset:     starting write offset in the buffer (usually 0)
    //   size:       bytes of buffer to use (at most bufferSize - 4)
    //   loop:       wrap around when end is reached
    MICU_StartSampling  :: proc(encoding: MICU_Encoding, sampleRate: MICU_SampleRate,
                                 offset: u32, size: u32, loop: bool) -> Result ---

    // Change sample rate while already sampling.
    MICU_AdjustSampling :: proc(sampleRate: MICU_SampleRate) -> Result ---

    // Stop recording.
    MICU_StopSampling   :: proc() -> Result ---

    // Whether the mic is currently sampling.
    MICU_IsSampling     :: proc(sampling: ^bool) -> Result ---

    // Event handle signaled whenever the buffer wraps around (fills up).
    MICU_GetEventHandle :: proc(handle: ^Handle) -> Result ---

    // ── Hardware controls ─────────────────────────────────────

    // Microphone gain.  Range 0..160 (default varies by firmware).
    MICU_SetGain :: proc(gain: u8) -> Result ---
    MICU_GetGain :: proc(gain: ^u8) -> Result ---

    // Microphone power (automatically managed by micInit/micExit).
    MICU_SetPower :: proc(power: bool) -> Result ---
    MICU_GetPower :: proc(power: ^bool) -> Result ---

    // Input clamping — prevents clipping artifacts.
    MICU_SetClamp :: proc(clamp: bool) -> Result ---
    MICU_GetClamp :: proc(clamp: ^bool) -> Result ---

    // Allow recording when the clamshell is closed.
    MICU_SetAllowShellClosed :: proc(allow: bool) -> Result ---
}
