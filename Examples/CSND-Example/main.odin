package csnd_example

import "core:math"

import ctru "../../lib/ctru"

// Tests the newly bound CSND service (3ds/services/csnd.h), the older
// sound interface next to NDSP. csndPlaySound and CSND_VOL take floats and
// go through C wrappers.
//
// A 441 Hz sine wave is generated into linear memory and played on a loop.
// Up / Down change the pitch by replaying the same buffer at a different
// sample rate; Left / Right pan it.
//
// Controls:
//   A          play the tone
//   B          stop
//   Up / Down  pitch up / down an octave
//   Left / Right  pan
//   START      exit
//
// CSND needs csnd:SND access, which the homebrew launcher normally grants.
// If csndInit fails, its result code is shown.

CHANNEL     :: 8
SAMPLE_RATE :: 22050
PERIOD      :: 50               // samples per wave: 22050 / 50 = 441 Hz
SAMPLES     :: PERIOD * 40      // a whole number of waves, so the loop has no click

samples: [^]i16

play :: proc "contextless" (rate: u32, pan: f32) -> ctru.Result {
    return ctru.csndPlaySound(CHANNEL, ctru.SOUND_FORMAT_16BIT | ctru.SOUND_REPEAT, rate, 0.8, pan,
                              samples, samples, SAMPLES * size_of(i16))
}

state_name :: proc "contextless" (playing: bool) -> cstring {
    if playing do return "playing"
    return "stopped"
}

stop :: proc "contextless" () {
    ctru.CSND_SetPlayState(CHANNEL, 0)
    ctru.csndExecCmds(false)
}

@(export, link_name = "odin_main")
csnd_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    ctru.consoleInit(ctru.GFX_TOP, nil)

    ctru.printf("CSND-Example\n\n")
    rc := ctru.csndInit()
    ctru.printf("csndInit rc 0x%08lX\n", rc)

    samples = cast([^]i16)ctru.linearAlloc(SAMPLES * size_of(i16))
    for i in 0 ..< SAMPLES {
        samples[i] = i16(math.sin(f32(i) / f32(PERIOD) * math.TAU) * 12000.0)
    }
    ctru.CSND_FlushDataCache(samples, SAMPLES * size_of(i16))

    // CSND_VOL packs volume and pan into the register value csndPlaySound
    // builds internally; print it as a check of the float bridge.
    ctru.printf("CSND_VOL(1, 0) = 0x%08lX (expect 0x40004000)\n\n", ctru.CSND_VOL(1.0, 0.0))

    ctru.printf("A: play  B: stop\nUp/Down: pitch  Left/Right: pan\nSTART: exit\n")

    rate := u32(SAMPLE_RATE)
    pan: f32 = 0.0
    playing := false

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        if down & ctru.KEY_START != 0 do break

        changed := false
        if down & ctru.KEY_UP != 0 && rate < SAMPLE_RATE * 4 {
            rate *= 2
            changed = true
        }
        if down & ctru.KEY_DOWN != 0 && rate > SAMPLE_RATE / 4 {
            rate /= 2
            changed = true
        }
        if down & ctru.KEY_LEFT != 0 && pan > -1.0 {
            pan -= 0.5
            changed = true
        }
        if down & ctru.KEY_RIGHT != 0 && pan < 1.0 {
            pan += 0.5
            changed = true
        }
        if down & ctru.KEY_A != 0 || (changed && playing) {
            play_rc := play(rate, pan)
            playing = play_rc >= 0
            ctru.printf("\x1b[12;1HcsndPlaySound rc 0x%08lX   ", play_rc)
        }
        if down & ctru.KEY_B != 0 {
            stop()
            playing = false
        }

        ctru.printf("\x1b[10;1H%4lu Hz  pan %+.1f  %s   ", rate / PERIOD, f64(pan), state_name(playing))

        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.gspWaitForEvent(.VBLANK0, true)
    }

    stop()
    ctru.csndExit()
    ctru.linearFree(samples)
    ctru.gfxExit()
    return 0
}
