/*
	mp3towav — Convert MP3 (and FLAC / OGG) to WAV using miniaudio.

	Decoding is handled entirely by miniaudio, so no external dependencies
	are needed beyond the Odin vendor library.  Output is always 16-bit
	signed PCM WAV — the format most 3DS audio libraries expect.

	Build:
	    odin build mp3towav.odin -file -o:speed -out:mp3towav.exe

	Usage:
	    mp3towav -i <input> -o <output> [-r <sample_rate>] [-c <channels>]
*/
package mp3towav

import "core:fmt"
import "core:os"
import "core:strconv"
import ma "vendor:miniaudio"

VERSION :: "1.0.0"

// Number of PCM frames decoded per iteration.
// 4096 is a good balance between memory use and loop overhead.
CHUNK_FRAMES :: u64(4096)

// Maximum channels we support in the stack buffer (stereo is the common case).
MAX_CHANNELS :: 8

usage :: proc() {
	fmt.println("mp3towav", VERSION)
	fmt.println("Convert MP3, FLAC, or OGG to a 16-bit PCM WAV file.\n")
	fmt.println("Usage:")
	fmt.println("  mp3towav -i <input> -o <output> [options]\n")
	fmt.println("Options:")
	fmt.println("  -i <path>    Input file  (MP3 / FLAC / OGG / WAV)")
	fmt.println("  -o <path>    Output WAV file")
	fmt.println("  -r <rate>    Output sample rate in Hz  (default: match input)")
	fmt.println("  -c <num>     Output channel count      (default: match input)")
	fmt.println("  --version    Print version and exit\n")
	fmt.println("Examples:")
	fmt.println("  mp3towav -i jump.mp3 -o jump.wav")
	fmt.println("  mp3towav -i music.mp3 -o music.wav -r 44100 -c 1")
}

main :: proc() {
	args := os.args[1:]

	if len(args) == 0 {
		usage()
		os.exit(0)
	}

	input_path:  string
	output_path: string
	sample_rate: u32 = 0  // 0 → keep input's native rate
	channels:    u32 = 0  // 0 → keep input's native channels

	// ---------------------------------------------------------------
	// Argument parsing
	// ---------------------------------------------------------------
	i := 0
	for i < len(args) {
		flag := args[i]
		need_next :: proc(flag: string, i: int, args: []string) -> string {
			if i + 1 >= len(args) {
				fmt.eprintf("Error: %s requires a value\n", flag)
				os.exit(1)
			}
			return args[i + 1]
		}

		switch flag {
		case "-i":
			input_path = need_next(flag, i, args)
			i += 1
		case "-o":
			output_path = need_next(flag, i, args)
			i += 1
		case "-r":
			val_str := need_next(flag, i, args)
			val, ok := strconv.parse_int(val_str)
			if !ok || val <= 0 {
				fmt.eprintf("Error: -r must be a positive integer (got '%s')\n", val_str)
				os.exit(1)
			}
			sample_rate = u32(val)
			i += 1
		case "-c":
			val_str := need_next(flag, i, args)
			val, ok := strconv.parse_int(val_str)
			if !ok || val <= 0 || val > MAX_CHANNELS {
				fmt.eprintf("Error: -c must be 1–%d (got '%s')\n", MAX_CHANNELS, val_str)
				os.exit(1)
			}
			channels = u32(val)
			i += 1
		case "--version":
			fmt.printf("mp3towav %s\n", VERSION)
			os.exit(0)
		case:
			fmt.eprintf("Error: unknown argument '%s'\n", flag)
			usage()
			os.exit(1)
		}
		i += 1
	}

	if input_path == "" || output_path == "" {
		fmt.eprintln("Error: -i and -o are required")
		usage()
		os.exit(1)
	}

	// ---------------------------------------------------------------
	// Open decoder
	// Requesting s16 output — miniaudio converts from whatever the
	// source format is automatically.  Channels/rate of 0 means
	// "use the file's native value" unless the user overrode them.
	// ---------------------------------------------------------------
	dec_cfg  := ma.decoder_config_init(.s16, channels, sample_rate)
	decoder:    ma.decoder

	if ma.decoder_init_file(cstring(raw_data(input_path)), &dec_cfg, &decoder) != .SUCCESS {
		fmt.eprintf("Error: could not open '%s'\n", input_path)
		fmt.eprintln("Make sure the file exists and is a supported format (MP3, FLAC, OGG, WAV).")
		os.exit(1)
	}
	defer ma.decoder_uninit(&decoder)

	out_channels    := decoder.outputChannels
	out_sample_rate := decoder.outputSampleRate

	fmt.printf("Input : %s\n", input_path)
	fmt.printf("Output: %s\n", output_path)
	fmt.printf("Format: s16  |  %d Hz  |  %d ch\n\n", out_sample_rate, out_channels)

	// ---------------------------------------------------------------
	// Open encoder (WAV, s16, same channels + rate as decoder output)
	// ---------------------------------------------------------------
	enc_cfg  := ma.encoder_config_init(.wav, .s16, out_channels, out_sample_rate)
	encoder:    ma.encoder

	if ma.encoder_init_file(cstring(raw_data(output_path)), &enc_cfg, &encoder) != .SUCCESS {
		fmt.eprintf("Error: could not create '%s'\n", output_path)
		os.exit(1)
	}
	defer ma.encoder_uninit(&encoder)

	// ---------------------------------------------------------------
	// Streaming decode → encode loop
	// Stack buffer: CHUNK_FRAMES * MAX_CHANNELS * 2 bytes (s16 = 2 bytes)
	// ---------------------------------------------------------------
	buf: [CHUNK_FRAMES * MAX_CHANNELS * 2]u8
	total_frames: u64

	for {
		frames_read: u64
		res := ma.decoder_read_pcm_frames(&decoder, raw_data(buf[:]), CHUNK_FRAMES, &frames_read)

		if frames_read > 0 {
			frames_written: u64
			ma.encoder_write_pcm_frames(&encoder, raw_data(buf[:]), frames_read, &frames_written)
			total_frames += frames_written
		}

		if res == .AT_END || frames_read == 0 do break
	}

	duration_sec := f64(total_frames) / f64(out_sample_rate)
	fmt.printf("Done — %d frames written (%.2f seconds)\n", total_frames, duration_sec)
}
