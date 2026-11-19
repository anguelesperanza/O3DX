package ctru

// ============================================================
// CSND — the older sound service
// 3ds/services/csnd.h
//
// Direct access to the sound hardware's channels and capture units. Most programs should use
// NDSP (ndsp.odin) instead.
// ============================================================

// Maximum number of CSND channels.
CSND_NUM_CHANNELS :: 32

// CSND encodings.
CSND_ENCODING_PCM8  :: 0 // PCM8
CSND_ENCODING_PCM16 :: 1 // PCM16
CSND_ENCODING_ADPCM :: 2 // IMA-ADPCM
CSND_ENCODING_PSG   :: 3 // PSG (Similar to DS?)

// CSND loop modes.
CSND_LOOPMODE_MANUAL   :: 0 // Manual loop.
CSND_LOOPMODE_NORMAL   :: 1 // Normal loop.
CSND_LOOPMODE_ONESHOT  :: 2 // Do not loop.
CSND_LOOPMODE_NORELOAD :: 3 // Don't reload.

// Sound flags.
SOUND_LINEAR_INTERP :: 0x40 // Linear interpolation.
SOUND_REPEAT        :: 0x400 // Repeat the sound.
SOUND_ONE_SHOT      :: 0x800 // Play the sound once.
SOUND_FORMAT_8BIT   :: 0 // PCM8
SOUND_FORMAT_16BIT  :: 0x1000 // PCM16
SOUND_FORMAT_ADPCM  :: 0x2000 // ADPCM
SOUND_FORMAT_PSG    :: 0x3000 // PSG
SOUND_ENABLE        :: 0x4000 // Enable sound.

// Capture modes.
CAPTURE_REPEAT       :: 0 // Repeat capture.
CAPTURE_ONE_SHOT     :: 1 // Capture once.
CAPTURE_FORMAT_16BIT :: 0 // PCM16
CAPTURE_FORMAT_8BIT  :: 2 // PCM8
CAPTURE_ENABLE       :: 0x8000 // Enable capture.

// Duty cycles for a PSG channel. The C names are DutyCycle_0 etc.; with
// the prefix stripped they would start with a digit, so the full name is
// kept, in capitals.
CSND_DutyCycle :: enum u8 {
    DUTYCYCLE_0  = 7, // 0.0% duty cycle
    DUTYCYCLE_12 = 0, // 12.5% duty cycle
    DUTYCYCLE_25 = 1, // 25.0% duty cycle
    DUTYCYCLE_37 = 2, // 37.5% duty cycle
    DUTYCYCLE_50 = 3, // 50.0% duty cycle
    DUTYCYCLE_62 = 4, // 62.5% duty cycle
    DUTYCYCLE_75 = 5, // 75.0% duty cycle
    DUTYCYCLE_87 = 6, // 87.5% duty cycle
}

// Channel info.
// Opaque here: the C type has a union or bitfields. 12 bytes.
CSND_ChnInfo :: struct #align(4) {
    _: [12]u8,
}

// Capture info.
// Opaque here: the C type has a union or bitfields. 8 bytes.
CSND_CapInfo :: struct #align(4) {
    _: [8]u8,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Acquires a capture unit.
    CSND_AcquireCapUnit :: proc(capUnit: ^u32) -> Result ---

    // Releases a capture unit.
    CSND_ReleaseCapUnit :: proc(capUnit: u32) -> Result ---

    // Flushes the data cache of a memory region.
    CSND_FlushDataCache :: proc(adr: rawptr, size: u32) -> Result ---

    // Stores the data cache of a memory region.
    CSND_StoreDataCache :: proc(adr: rawptr, size: u32) -> Result ---

    // Invalidates the data cache of a memory region.
    CSND_InvalidateDataCache :: proc(adr: rawptr, size: u32) -> Result ---

    // Resets CSND. Note: Currently breaks sound, don't use for now!
    CSND_Reset :: proc() -> Result ---

    // Initializes CSND.
    csndInit :: proc() -> Result ---

    // Exits CSND.
    csndExit :: proc() ---

    // Adds a command to the list, returning a buffer to write arguments to.
    csndAddCmd :: proc(cmdid: i32) -> ^u32 ---

    // Adds a command to the list, copying its arguments from a buffer.
    csndWriteCmd :: proc(cmdid: i32, cmdparams: ^u8) ---

    // Executes pending CSND commands.
    csndExecCmds :: proc(waitDone: bool) -> Result ---

    // Sets a channel's play state, resetting registers on stop.
    CSND_SetPlayStateR :: proc(channel: u32, value: u32) ---

    // Sets a channel's play state.
    CSND_SetPlayState :: proc(channel: u32, value: u32) ---

    // Sets a channel's encoding.
    CSND_SetEncoding :: proc(channel: u32, value: u32) ---

    // Sets the data of a channel's block.
    CSND_SetBlock :: proc(channel: u32, block: i32, physaddr: u32, size: u32) ---

    // Sets whether to loop a channel.
    CSND_SetLooping :: proc(channel: u32, value: u32) ---

    // Sets bit 7 of a channel.
    CSND_SetBit7 :: proc(channel: u32, set: bool) ---

    // Sets whether a channel should use interpolation.
    CSND_SetInterp :: proc(channel: u32, interp: bool) ---

    // Sets a channel's duty.
    CSND_SetDuty :: proc(channel: u32, duty: CSND_DutyCycle) ---

    // Sets a channel's timer.
    CSND_SetTimer :: proc(channel: u32, timer: u32) ---

    // Sets a channel's volume.
    CSND_SetVol :: proc(channel: u32, chnVolumes: u32, capVolumes: u32) ---

    // Sets a channel's ADPCM state.
    CSND_SetAdpcmState :: proc(channel: u32, block: i32, sample: i32, index: i32) ---

    // Sets a whether channel's ADPCM data should be reloaded when the second block is played.
    CSND_SetAdpcmReload :: proc(channel: u32, reload: bool) ---

    // Sets CSND's channel registers.
    CSND_SetChnRegs :: proc(flags: u32, physaddr0: u32, physaddr1: u32, totalbytesize: u32, chnVolumes: u32, capVolumes: u32) ---

    // Sets CSND's PSG channel registers.
    CSND_SetChnRegsPSG :: proc(flags: u32, chnVolumes: u32, capVolumes: u32, duty: CSND_DutyCycle) ---

    // Sets CSND's noise channel registers.
    CSND_SetChnRegsNoise :: proc(flags: u32, chnVolumes: u32, capVolumes: u32) ---

    // Sets whether a capture unit is enabled.
    CSND_CapEnable :: proc(capUnit: u32, enable: bool) ---

    // Sets whether a capture unit should repeat.
    CSND_CapSetRepeat :: proc(capUnit: u32, repeat: bool) ---

    // Sets a capture unit's format.
    CSND_CapSetFormat :: proc(capUnit: u32, eightbit: bool) ---

    // Sets a capture unit's second bit.
    CSND_CapSetBit2 :: proc(capUnit: u32, set: bool) ---

    // Sets a capture unit's timer.
    CSND_CapSetTimer :: proc(capUnit: u32, timer: u32) ---

    // Sets a capture unit's buffer.
    CSND_CapSetBuffer :: proc(capUnit: u32, addr: u32, size: u32) ---

    // Sets a capture unit's capture registers.
    CSND_SetCapRegs :: proc(capUnit: u32, flags: u32, addr: u32, size: u32) ---

    // Sets up DSP flags.
    CSND_SetDspFlags :: proc(waitDone: bool) -> Result ---

    // Updates CSND information.
    CSND_UpdateInfo :: proc(waitDone: bool) -> Result ---

    // Gets CSND's DSP flags. Note: Requires previous CSND_UpdateInfo()
    csndGetDspFlags :: proc(outSemFlags: ^u32, outIrqFlags: ^u32) ---

    // Gets a channel's information. Note: Requires previous CSND_UpdateInfo()
    csndGetChnInfo :: proc(channel: u32) -> ^CSND_ChnInfo ---

    // Gets a capture unit's information. Note: Requires previous CSND_UpdateInfo()
    csndGetCapInfo :: proc(capUnit: u32) -> ^CSND_CapInfo ---

    // Gets a channel's state.
    csndGetState :: proc(channel: u32, out: ^CSND_ChnInfo) -> Result ---

    // Gets whether a channel is playing.
    csndIsPlaying :: proc(channel: u32, status: ^u8) -> Result ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Converts a vol-pan pair into a left/right volume pair used by the hardware.
    @(link_name = "ctru_csnd_vol")
    CSND_VOL :: proc(vol: f32, pan: f32) -> u32 ---

    // Plays a sound.
    @(link_name = "ctru_csnd_play_sound")
    csndPlaySound :: proc(chn: i32, flags: u32, sampleRate: u32, vol: f32, pan: f32, data0: rawptr, data1: rawptr, size: u32) -> Result ---
}
