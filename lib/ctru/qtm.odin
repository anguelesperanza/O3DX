package ctru

// ============================================================
// QTM — New 3DS head tracking
// 3ds/services/qtm.h, 3ds/services/qtmc.h
//
// Face tracking for the New 3DS super-stable 3D, and its camera.
// ============================================================

// ID of QTM status data (fully enabled/SS3D disabled) in `cfg`
QTM_STATUS_CFG_BLK_ID :: 0x180000
// ID of QTM calibration data in `cfg`
QTM_CAL_CFG_BLK_ID :: 0x180001

// QTM enablement status (when cameras not in use by user), set by `qtm:s`.
QtmStatus :: enum u8 {
    ENABLED       = 0, // QTM is fully enabled.
    SS3D_DISABLED = 1, // QTM "super stable 3D" feature is disabled. Parallax barrier hardware state is configured to match O3DS.
    UNAVAILABLE   = 2,
}

// QTM status data (fully enabled/SS3D disabled) in `cfg`. Usually all-zero on N2DSXL.
QtmStatusCfgData :: struct {
    defaultStats: QtmStatus, // QTM status at boot (fully enabled or SS3D disabled).
    gvLoadMode:   u8,
    _padding:     [2]u8, // Padding.
}

// QTM calibration data (fully enabled/SS3D disabled) in `cfg`. Usually all-zero on N2DSXL.
QtmCalibrationData :: struct {
    centerBarrierPosition: f32,
    translationX:          f32, // Lens X coord in inner camera space? Very low value and seems to be unused.
    translationY:          f32, // Lens Y coord in inner camera space? Very low value and seems to be unused.
    rotationZ:             f32, // Optimal eye-to-camera angle, in radians, without accounting for lens distortion.
    fovX:                  f32, // Camera's horizontal FoV in degrees, without accounting for lens distortion.
    viewingDistance:       f32, // Optimal viewing distance between user and top screen, assuming iod to be 62mm.
}

// Left eye or right eye, for QtmTrackingData and QtmRawTrackingData
QtmEyeSide :: enum u8 {
    LEFT  = 0, // Left eye.
    RIGHT = 1, // Right eye.
    NUM   = 2, // Number of eyes.
}

// QTM raw eye tracking data
QtmRawTrackingData :: struct {
    eyesTracked:             bool, // Eye position detected or predicted, equals (confidenceLevel > 0).
    _padding:                [3]u8, // Padding.
    singletonQtmPtr:         u32, // Pointer to eye-tracking singleton pointer, in QTM's .bss, located in N3DS extra memory.
    confidenceLevel:         f32, // Eye tracking confidence level (0 to 1).
    rawEyeCameraCoordinates: [2][2]f32,
    dPitch:                  f32, // Difference in gyro pitch from position at console boot.
    dYaw:                    f32, // Difference in gyro yaw from position at console boot.
    dRoll:                   f32, // Difference in gyro roll from position at console boot.
    samplingTick:            i64, // Time point the current measurements were made.
}

// QTM processed eye tracking data, suitable for 3D programming
QtmTrackingData :: struct {
    eyesTracked:          bool, // Eye position detected or tracked with some confidence, equals (confidenceLevel > 0). Even if false, QTM may make a guess
    faceDetected:         bool, // Whether or not the entirety of the user's face has been detected with good confidence.
    eyesDetected:         bool, // Whether or not the user's eyes have actually been detected with full confidence.
    _unused:              u8, // Unused.
    clamped:              bool, // Whether or not the normalized eye coordinates have been clamped after accounting for lens distortion.
    _padding:             [3]u8, // Padding.
    confidenceLevel:      f32, // Eye tracking confidence level (0 to 1).
    eyeCameraCoordinates: [2][2]f32,
    eyeWorldCoordinates:  [2][2]f32,
    dPitch:               f32, // Difference in gyro pitch from position at console boot.
    dYaw:                 f32, // Difference in gyro yaw from position at console boot.
    dRoll:                f32, // Difference in gyro roll from position at console boot.
    samplingTick:         i64, // Time point the current measurements were made.
}

// QTM service name enum, excluding `qtm:c`
QtmServiceName :: enum u8 {
    USER           = 0,
    SYSTEM         = 1,
    SYSTEM_PROCESS = 2,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Check whether or not QTM services are registered.
    qtmCheckServicesRegistered :: proc() -> bool ---

    // Initializes QTM (except `qtm:c`). Excluding `qtm:c`, QTM has three main services. Only 3
    // sessions (2 until 9.3.0 sysupdate) for ALL services COMBINED, including `qtm:c`, can be open
    // at a time. Refer to QtmServiceName enum value descriptions to see which service to choose.
    qtmInit :: proc(serviceName: QtmServiceName) -> Result ---

    // Exits QTM.
    qtmExit :: proc() ---

    // Checks whether or not a `qtm:u`, `qtm:s` or `qtm:sp` session is active.
    qtmIsInitialized :: proc() -> bool ---

    // Returns a pointer to the current `qtm:u` / `qtm:s` / `qtm:sp` session handle.
    qtmGetSessionHandle :: proc() -> ^Handle ---

    // Gets the current raw eye tracking data, with an optional prediction made for
    // predictionTimePointOrZero = t+dt, or for the current time point (QTM makes predictions based
    // on gyro data since inner camera runs at 30 FPS).
    QTMU_GetRawTrackingDataEx :: proc(outData: ^QtmRawTrackingData, predictionTimePointOrZero: i64) -> Result ---

    // Gets the current normalized eye tracking data, made suitable for 3D programming with an
    // optional prediction made for predictionTimePointOrZero = t+dt, or for the current time point
    // (QTM makes predictions based on gyro data since inner camera runs at 30 FPS).
    QTMU_GetTrackingDataEx :: proc(outData: ^QtmTrackingData, predictionTimePointOrZero: i64) -> Result ---

    // Temporarily enables manual control of the IR LED by user, disabling its automatic control. If
    // not already done, this also turns off the IR LED. This setting is cleared when user closes
    // the console's shell.
    QTMU_EnableManualIrLedControl :: proc() -> Result ---

    // Temporarily disables manual control of the IR LED by user, re-enabling its automatic control.
    // If not already done, this also turns off the IR LED.
    QTMU_DisableManualIrLedControl :: proc() -> Result ---

    // Turns the IR LED on or off during manual control. QTMU_EnableManualIrLedControl must have
    // been called.
    QTMU_SetIrLedStatus :: proc(on: bool) -> Result ---

    // Attempts to clear IR LED overrides from any of the relevant commands in `qtm:u`, `qtm:s` (and
    // `qtm:c`) commands by calling QTMU_EnableManualIrLedControl followed by
    // QTMU_DisableManualIrLedControl, so that auto IR LED management takes place again.
    qtmClearIrLedOverrides :: proc() -> Result ---

    // Checks whether or not QTM has been blacklisted, ie. that it has been made unavailable. In
    // detail, this means that the last call to QTMS_SetQtmStatus was made with argument
    // QTM_STATUS_UNAVAILABLE, usually by NS. This feature seems to only be used for some internal
    // test titles.
    QTMU_IsCurrentAppBlacklisted :: proc(outBlacklisted: ^bool) -> Result ---

    // Gets the average ambient luminance as perceived by the inner camera (in lux). If QTM is
    // unavailable (in particular, QTM is always unavailable on N2DSXL), returns 400.0 instead of
    // the actual luminance.
    QTMS_GetCameraLuminance :: proc(outLuminanceLux: ^f32) -> Result ---

    // Enables automatic barrier control when in 3D mode with "super stable 3D" enabled.
    QTMS_EnableAutoBarrierControl :: proc() -> Result ---

    // Temporarily disables automatic barrier control (when in 3D mode with "super stable 3D"
    // enabled).
    QTMS_DisableAutoBarrierControl :: proc() -> Result ---

    // Temporarily sets the parallax barrier's position (offset in iod/12 units, assuming slit width
    // of 6 units). Does nothing in 2D mode and/or if "super stable 3D" is disabled.
    QTMS_SetBarrierPosition :: proc(position: u8) -> Result ---

    // Gets the current position of the parallax barrier (offset in iod/12 units, slit width of 6
    // units). When "super stable 3D" is disabled, returns 13 instead.
    QTMS_GetCurrentBarrierPosition :: proc(outPosition: ^u8) -> Result ---

    // Temporarily overrides IR LED state. Requires "manual control" from `qtm:u` to be disabled,
    // and has lower priority than it.
    QTMS_SetIrLedStatusOverride :: proc(on: bool) -> Result ---

    // Sets calibration data, taking effect immediately, and optionally saves it to `cfg`.
    QTMS_SetCalibrationData :: proc(cal: ^QtmCalibrationData, saveCalToCfg: bool) -> Result ---

    // Gets the current QTM status (enabled/ss3d disabled/unavailable).
    QTMS_GetQtmStatus :: proc(outQtmStatus: ^QtmStatus) -> Result ---

    // Gets the current QTM status (enabled/ss3d disabled/unavailable). Also sets or clear the
    // "blacklisted" flag returned by QTMU_IsCurrentAppBlacklisted.
    QTMS_SetQtmStatus :: proc(qtmStatus: QtmStatus) -> Result ---

    // Called by GSP's LCD driver to signal 2D<>3D mode change
    QTMSP_NotifyTopLcdModeChange :: proc(newMode: u8) -> Result ---

    // Called by GSP's LCD driver during top LCD power-on to signal to QTM that it may power on
    // and/or reconfigure then use the TI TCA6416A expander. In the process, QTM re-creates its
    // expander thread.
    QTMSP_NotifyTopLcdPowerOn :: proc() -> Result ---

    // Called by GSP's LCD driver to know whether or not QTM's expander thread is using the TI
    // TCA6416A expander; it is waiting for this to become true/false during LCD power on/power off
    // to proceed. Always false on N2DSXL.
    QTMSP_IsExpanderInUse :: proc(outActive: ^bool) -> Result ---

    // Called by GSP's LCD driver during top LCD power-on to signal to QTM that it needs to switch
    // the parallax barrier state to a 2D state (all-transparent mask). Causes QTM's expander thread
    // to exit, relinquishing its `i2c::QTM` session with it.
    QTMSP_NotifyTopLcdPowerOff :: proc() -> Result ---

    // Initializes `qtm:c`. Only 3 sessions (2 until 9.3.0 sysupdate) for ALL services COMBINED,
    // including the main services, can be open at a time.
    qtmcInit :: proc() -> Result ---

    // Exits `qtm:c`.
    qtmcExit :: proc() ---

    // Returns a pointer to the current `qtm:c` session handle.
    qtmcGetSessionHandle :: proc() -> ^Handle ---

    // Starts the QTM Hardware Check API. This must be called before using any other `qtm:c`
    // command, and causes barrier pattern to be overriden by what was last set in
    // QTMC_SetBarrierPattern, **even in 2D mode**. Also allows IR LED state to be overridden even
    // if user uses the inner camera.
    QTMC_StartHardwareCheck :: proc() -> Result ---

    // Stops the QTM Hardware Check API. Restore normal barrier and IR LED management behavior.
    QTMC_StopHardwareCheck :: proc() -> Result ---

    // Sets the parallax barrier's mask pattern and polarity phase (12+1 bits). Bit11 to 0
    // correspond to a repeating barrier mask pattern, 0 meaning the corresponding mask unit is
    // transparent and 1 that it is opaque. The direction is: left->right corresponds to MSB->LSB.
    // Bit12 is the polarity bit. QTM's expander management thread repeatedly writes (on every loop
    // iteration) the current mask pattern plus polarity bit, whether it is normally set or
    // overridden by `qtm:c`, then on the following set, negates both (it writes pattern ^ 0x1FFF).
    // This is done at all times, even it 2D mode. The register being written to are regId 0x02 and
    // 0x03 (output ports). TI TCA6416A I2C->Parallel expander is located on bus I2C1 (PA
    // 0x10161000) device ID 0x40. This function has no effect on N2DSXL.
    QTMC_SetBarrierPattern :: proc(pattern: u32) -> Result ---

    // Waits for the expander management thread to (re)initalize the TI TCA6416A I2C->Parallel
    // expander, then checks if that expander is behaving as expected (responds with the port
    // direction config it has been configured with): it checks whether all ports have been
    // configured as outputs. On N2DSXL, this function waits forever and never returns. In detail,
    // the hardware init procedure for the expander is as follows (as done by the expander mgmt.
    // thread): - configure enable expander pin on SoC: set GPIO3.bit11 to OUTPUT, then set to 1 -
    // on the expander (I2C1 deviceId 0x40), set all ports to OUTPUT (regId 0x06, 0x07) - on the
    // expander, write 0 (all-transparent mask/2D) to the data registers (regId 0x02, 0x03)
    QTMC_WaitAndCheckExpanderWorking :: proc(outWorking: ^bool) -> Result ---

    // Temporarily overrides IR LED state. Requires "manual control" from `qtm:u` to be disabled,
    // and has lower priority than it. Same implementation as QTMS_SetIrLedStatusOverride.
    QTMC_SetIrLedStatusOverride :: proc(on: bool) -> Result ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Gets the current raw eye tracking data.
    @(link_name = "ctru_qtmu_get_raw_tracking_data")
    QTMU_GetRawTrackingData :: proc(outData: ^QtmRawTrackingData) -> Result ---

    // Gets the current normalized eye tracking data, made suitable for 3D programming.
    @(link_name = "ctru_qtmu_get_tracking_data")
    QTMU_GetTrackingData :: proc(outData: ^QtmTrackingData) -> Result ---

    // Computes an approximation of the horizontal angular field of view of the camera based on eye
    // tracking data.
    @(link_name = "ctru_qtm_compute_fov_x")
    qtmComputeFovX :: proc(data: ^QtmTrackingData) -> f32 ---

    // Computes an approximation of the vertical angular field of view of the camera based on eye
    // tracking data.
    @(link_name = "ctru_qtm_compute_fov_y")
    qtmComputeFovY :: proc(data: ^QtmTrackingData) -> f32 ---

    // Computes a rough approximation of the inverse of the aspect ration of the camera based on eye
    // tracking data.
    @(link_name = "ctru_qtm_compute_inverse_aspect_ratio")
    qtmComputeInverseAspectRatio :: proc(data: ^QtmTrackingData) -> f32 ---

    // Computes the user's head tilt angle, that is, the angle between the line through both eyes
    // and the camera's horizontal axis in camera space.
    @(link_name = "ctru_qtm_compute_head_tilt_angle")
    qtmComputeHeadTiltAngle :: proc(data: ^QtmTrackingData) -> f32 ---

    // Estimates the distance between the user's eyes and the camera, based on eye tracking data.
    // This may be a little bit inaccurate, as this assumes interocular distance of 62mm (like all
    // 3DS software does), and that both eyes are at the same distance from the screen.
    @(link_name = "ctru_qtm_estimate_eye_to_camera_distance")
    qtmEstimateEyeToCameraDistance :: proc(data: ^QtmTrackingData) -> f32 ---
}
