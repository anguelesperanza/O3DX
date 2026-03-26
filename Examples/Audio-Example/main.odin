package audio_example

import ctru "../../lib/ctru"

// ============================================================
// Audio-Example
//
// Loads romfs:/audio.wav (uncompressed PCM, 8 or 16 bit,
// mono or stereo), plays it on NDSP channel 0 in a loop, and
// shows a live status display on the top screen console.
//
// Controls:
//   A          — pause / resume
//   Up / Down  — master volume +/- 5%
//   Start      — exit
// ============================================================

// ── WAV parser ───────────────────────────────────────────────

WAVE_FORMAT_PCM :: u16(1)

// Four-CC magic values as byte arrays (avoids composite-literal ambiguity in if-conditions)
WAV_RIFF :: [4]u8{0x52, 0x49, 0x46, 0x46}  // "RIFF"
WAV_WAVE :: [4]u8{0x57, 0x41, 0x56, 0x45}  // "WAVE"
WAV_FMT  :: [4]u8{0x66, 0x6D, 0x74, 0x20}  // "fmt "
WAV_DATA :: [4]u8{0x64, 0x61, 0x74, 0x61}  // "data"

WavInfo :: struct {
    channels:        u16,
    sample_rate:     u32,
    bits_per_sample: u16,
    data_size:       u32,   // byte count of PCM data
    nsamples:        u32,   // frame count  = data_size / block_align
    audio_buf:       rawptr, // linearAlloc'd; free with linearFree when done
}

// load_wav opens `path` via C stdio (romfs:/ is mounted by romfsInit),
// parses the RIFF/WAVE header, and DMA-copies the PCM data into a
// linearAlloc'd buffer.  Returns true on success.
load_wav :: proc "contextless" (path: cstring, info: ^WavInfo) -> bool {
    f := ctru.fopen(path, "rb")
    if f == nil do return false

    // ── Validate the 12-byte RIFF/WAVE file header ──────────
    riff_id:   [4]u8
    riff_size: u32
    wave_id:   [4]u8
    if ctru.fread(&riff_id,   1, 4, f) != 4 { ctru.fclose(f); return false }
    if ctru.fread(&riff_size, 4, 1, f) != 1 { ctru.fclose(f); return false }
    if ctru.fread(&wave_id,   1, 4, f) != 4 { ctru.fclose(f); return false }
    if riff_id != WAV_RIFF { ctru.fclose(f); return false }
    if wave_id != WAV_WAVE { ctru.fclose(f); return false }

    // ── Scan sub-chunks for "fmt " and "data" ────────────────
    found_fmt  := false
    found_data := false
    data_offset : i32 = 0

    for !found_data {
        chunk_id:   [4]u8
        chunk_size: u32
        if ctru.fread(&chunk_id,   1, 4, f) != 4 do break
        if ctru.fread(&chunk_size, 4, 1, f) != 1 do break

        if chunk_id == WAV_FMT {
            // Standard fmt chunk is 16 bytes; extra bytes are extension fields.
            audio_fmt:   u16
            channels:    u16
            sample_rate: u32
            byte_rate:   u32
            block_align: u16
            bits:        u16
            if ctru.fread(&audio_fmt,   2, 1, f) != 1 { break }
            if ctru.fread(&channels,    2, 1, f) != 1 { break }
            if ctru.fread(&sample_rate, 4, 1, f) != 1 { break }
            if ctru.fread(&byte_rate,   4, 1, f) != 1 { break }
            if ctru.fread(&block_align, 2, 1, f) != 1 { break }
            if ctru.fread(&bits,        2, 1, f) != 1 { break }

            if audio_fmt != WAVE_FORMAT_PCM           { ctru.fclose(f); return false }
            if channels != 1 && channels != 2         { ctru.fclose(f); return false }
            if bits != 8 && bits != 16                { ctru.fclose(f); return false }

            info.channels        = channels
            info.sample_rate     = sample_rate
            info.bits_per_sample = bits
            found_fmt = true

            // Skip any extra bytes (e.g. 18-byte fmt chunk)
            extra := i32(chunk_size) - 16
            if extra > 0 do ctru.fseek(f, extra, ctru.SEEK_CUR)

        } else if chunk_id == WAV_DATA {
            data_offset      = ctru.ftell(f)
            info.data_size   = chunk_size
            found_data       = true
            // Leave file cursor here; we'll re-seek after validation.

        } else {
            // Unknown chunk — skip over it (RIFF chunks are always 2-byte aligned)
            skip := i32(chunk_size)
            if skip & 1 != 0 do skip += 1
            ctru.fseek(f, skip, ctru.SEEK_CUR)
        }
    }

    if !found_fmt || !found_data {
        ctru.fclose(f)
        return false
    }

    // ── Allocate linear memory and DMA-safe buffer ───────────
    buf := ctru.linearAlloc(uint(info.data_size))
    if buf == nil {
        ctru.fclose(f)
        return false
    }

    ctru.fseek(f, data_offset, ctru.SEEK_SET)
    if ctru.fread(buf, 1, uint(info.data_size), f) != uint(info.data_size) {
        ctru.linearFree(buf)
        ctru.fclose(f)
        return false
    }

    ctru.fclose(f)

    block_align    := u32(info.channels) * u32(info.bits_per_sample / 8)
    info.nsamples  = info.data_size / block_align
    info.audio_buf = buf
    return true
}

// Map WAV channel/bit-depth to an NDSP format constant.
ndsp_format_for :: proc "contextless" (channels, bits: u16) -> u16 {
    switch {
    case channels == 1 && bits ==  8: return ctru.NDSP_FORMAT_MONO_PCM8
    case channels == 1 && bits == 16: return ctru.NDSP_FORMAT_MONO_PCM16
    case channels == 2 && bits ==  8: return ctru.NDSP_FORMAT_STEREO_PCM8
    case channels == 2 && bits == 16: return ctru.NDSP_FORMAT_STEREO_PCM16
    }
    return ctru.NDSP_FORMAT_MONO_PCM16
}

// ── Entry point ──────────────────────────────────────────────

@(export, link_name = "odin_main")
audio_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    // Display — console on top screen
    ctru.gfxInitDefault()
    ctru.consoleInit(ctru.GFX_TOP, nil)

    // Mount romfs (audio.wav lives at romfs:/audio.wav)
    if ctru.romfsInit() != 0 {
        ctru.printf("ERROR: romfsInit failed\n")
        ctru.printf("Ensure the .3dsx was built with --romfs.\n")
        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.svcSleepThread(4_000_000_000)
        ctru.gfxExit()
        return 1
    }

    // Init DSP audio.
    // Note: on Citra, ndspInit may return a non-zero code even when HLE audio
    // is functional.  We print a warning but continue so Citra users can still
    // test playback.  On real hardware this will always succeed once dspfirm.cdc
    // is present at sdmc:/3ds/dspfirm.cdc.
    ndsp_rc := ctru.ndspInit()
    if ndsp_rc != 0 {
        ctru.printf("WARN: ndspInit rc=0x%08lX (continuing)\n", ndsp_rc)
        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.svcSleepThread(2_000_000_000)
    }

    // Load WAV
    wav: WavInfo
    if !load_wav("romfs:/audio.wav", &wav) {
        ctru.printf("ERROR: could not load romfs:/audio.wav\n\n")
        ctru.printf("The file must be an uncompressed PCM WAV:\n")
        ctru.printf("  - 8-bit or 16-bit samples\n")
        ctru.printf("  - Mono or stereo\n\n")
        ctru.printf("Add audio.wav to the romfs/ folder,\n")
        ctru.printf("then rebuild.\n")
        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.svcSleepThread(8_000_000_000)
        ctru.ndspExit()
        ctru.romfsExit()
        ctru.gfxExit()
        return 1
    }

    // ── Configure NDSP ───────────────────────────────────────
    ctru.ndspSetOutputMode(.STEREO)
    ctru.ndspSetMasterVol(1.0)

    ctru.ndspChnReset(0)
    ctru.ndspChnInitParams(0)
    ctru.ndspChnSetInterp(0, .LINEAR)
    ctru.ndspChnSetRate(0, f32(wav.sample_rate))
    ctru.ndspChnSetFormat(0, ndsp_format_for(wav.channels, wav.bits_per_sample))

    // Equal-power stereo mix for both mono and stereo sources
    mix: [12]f32
    mix[0] = 1.0  // front-left  → left output
    mix[1] = 1.0  // front-right → right output
    ctru.ndspChnSetMix(0, &mix)

    // ── Submit a single looping wave buffer ──────────────────
    wave_buf: ctru.ndspWaveBuf
    wave_buf.data_vaddr = wav.audio_buf
    wave_buf.nsamples   = wav.nsamples
    wave_buf.adpcm_data = nil
    wave_buf.looping    = true
    wave_buf.status     = ctru.NDSP_WBUF_FREE
    ctru.ndspChnWaveBufAdd(0, &wave_buf)

    // ── Static UI (drawn once) ───────────────────────────────
    // Top screen: 50 columns × 30 rows  (1-indexed ANSI coords)
    ctru.printf("\x1b[2J")   // clear screen

    ctru.printf("\x1b[1;1H=== Audio-Example ===")
    ctru.printf("\x1b[3;1HFile:     romfs:/audio.wav")
    ctru.printf("\x1b[4;1HRate:     %u Hz",    wav.sample_rate)
    ctru.printf("\x1b[5;1HChannels: %u",       u32(wav.channels))
    ctru.printf("\x1b[6;1HBit depth:%u-bit",   u32(wav.bits_per_sample))
    ctru.printf("\x1b[7;1HFrames:   %u",        wav.nsamples)
    ctru.printf("\x1b[9;1HStatus:  ")
    ctru.printf("\x1b[10;1HVolume:  ")
    ctru.printf("\x1b[11;1HPosition:")
    ctru.printf("\x1b[27;1H[A] Pause/Resume")
    ctru.printf("\x1b[28;1H[Up/Down] Volume +/-5%%")
    ctru.printf("\x1b[29;1H[Start] Exit")

    // ── Main loop ────────────────────────────────────────────
    volume : f32 = 1.0
    paused      := false

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        k_down := ctru.hidKeysDown()

        if k_down & ctru.KEY_START != 0 do break

        if k_down & ctru.KEY_A != 0 {
            paused = !paused
            ctru.ndspChnSetPaused(0, paused)
        }

        if k_down & ctru.KEY_UP != 0 {
            volume += 0.05
            if volume > 1.0 do volume = 1.0
            ctru.ndspSetMasterVol(volume)
        }

        if k_down & ctru.KEY_DOWN != 0 {
            volume -= 0.05
            if volume < 0.0 do volume = 0.0
            ctru.ndspSetMasterVol(volume)
        }

        // ── Refresh dynamic rows ─────────────────────────────
        // Row 9 — playback status
        status : cstring = paused ? "Paused " : "Playing"
        ctru.printf("\x1b[9;10H%s\x1b[K", status)

        // Row 10 — master volume percentage
        vol_pct := i32(volume * 100.0 + 0.5)
        ctru.printf("\x1b[10;10H%d%%\x1b[K", vol_pct)

        // Row 11 — current sample position (wraps after each loop)
        pos := ctru.ndspChnGetSamplePos(0)
        ctru.printf("\x1b[11;10H%u\x1b[K", pos)

        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.gspWaitForEvent(.VBlank0, true)
    }

    // ── Cleanup ──────────────────────────────────────────────
    ctru.ndspChnWaveBufClear(0)
    ctru.linearFree(wav.audio_buf)
    ctru.ndspExit()
    ctru.romfsExit()
    ctru.gfxExit()
    return 0
}
