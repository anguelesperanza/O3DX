package audio

// ============================================================
// audio — reusable WAV loading and NDSP playback helpers
//
// Usage:
//   import audio "../../../lib/audio"
//
//   clip, ok := audio.load_wav("romfs:/audio/sound.wav", channel_id)
//   audio.play(&clip)
//   audio.unload(&clip)  // on shutdown
// ============================================================

import ctru "../ctru"

// Holds a PCM sound effect loaded into linear memory for NDSP playback.
// Linear memory is required by the DSP hardware — regular heap will not work.
AudioClip :: struct {
	data:    rawptr,           // linear memory block — must outlive playback
	wavebuf: ctru.ndspWaveBuf,
	channel: i32,              // the NDSP channel this clip plays on
}

// Loads a standard 44-byte-header PCM WAV file into linear memory for NDSP.
// channel is the NDSP channel index this clip will play on (0–23).
// Returns ok=false if the file cannot be opened, is not a valid PCM WAV,
// or linear memory allocation fails.
load_wav :: proc(path: cstring, channel: i32) -> (clip: AudioClip, ok: bool) {
	f := ctru.fopen(path, "rb")
	if f == nil do return clip, false
	defer ctru.fclose(f)

	// Read the standard 44-byte WAV header
	header: [44]u8
	if ctru.fread(&header[0], 44, 1, f) != 1 do return clip, false

	// Validate RIFF/WAVE magic bytes
	if header[0] != 'R' || header[1] != 'I' || header[2] != 'F' || header[3] != 'F' do return clip, false
	if header[8] != 'W' || header[9] != 'A' || header[10] != 'V' || header[11] != 'E' do return clip, false

	// Parse the data chunk size (bytes 40–43, little-endian)
	data_size := u32(header[40]) | u32(header[41])<<8 | u32(header[42])<<16 | u32(header[43])<<24

	// NDSP audio buffers MUST live in physically contiguous (linear) memory
	mem := ctru.linearAlloc(uint(data_size))
	if mem == nil do return clip, false

	if ctru.fread(mem, uint(data_size), 1, f) != 1 {
		ctru.linearFree(mem)
		return clip, false
	}

	clip.data               = mem
	clip.channel            = channel
	clip.wavebuf.data_vaddr = mem
	clip.wavebuf.nsamples   = data_size / 2 // PCM16: samples = bytes / 2
	clip.wavebuf.looping    = false
	return clip, true
}

// Queues the clip for playback on its assigned NDSP channel.
// Safe to call every frame — does nothing if the sound is already playing or queued.
play :: proc(clip: ^AudioClip) {
	if clip.wavebuf.status == ctru.NDSP_WBUF_PLAYING ||
	   clip.wavebuf.status == ctru.NDSP_WBUF_QUEUED { return }
	clip.wavebuf.status = ctru.NDSP_WBUF_FREE
	ctru.ndspChnWaveBufAdd(clip.channel, &clip.wavebuf)
}

// Releases the linear memory held by the clip.
// Call once the clip is no longer needed (e.g. on shutdown or scene change).
unload :: proc(clip: ^AudioClip) {
	if clip.data != nil {
		ctru.linearFree(clip.data)
		clip.data = nil
	}
}
