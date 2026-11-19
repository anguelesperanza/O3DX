// lib/ctru/bridge.c
//
// Wrappers for libctru functions that are declared as static inline in the
// headers and therefore have no exported linker symbol.  Odin cannot call
// them directly, so we expose them through plain C functions here.
//
// Compiled with hard-float ABI (-mfloat-abi=hard) and linked into every
// project that uses lib/ctru.

#include <3ds.h>
#include "../bridge_utils.h"

// ----------------------------------------------------------------
// romfs — read-only file system embedded inside the .3dsx binary.
// romfsInit / romfsExit are static inline in <3ds/romfs.h>.
// ----------------------------------------------------------------

uint32_t romfs_init(void) { return (uint32_t)romfsInit(); }
uint32_t romfs_exit(void) { return (uint32_t)romfsExit(); }

// ----------------------------------------------------------------
// irrst — IR receiver / extra input service (New 3DS C-stick).
// irrstInit, irrstExit, irrstScanInput, irrstCstickRead are static
// inline in <3ds/services/irrst.h>.
// ----------------------------------------------------------------

void irrst_init(void)                    { irrstInit(); }
void irrst_exit(void)                    { irrstExit(); }
void irrst_scan(void)                    { irrstScanInput(); }
void cstick_read(circlePosition* pos)    { irrstCstickRead(pos); }

// ----------------------------------------------------------------
// ndsp — Nintendo DSP audio service.
// These wrapper functions convert float arguments/return values
// between soft-float (Odin) and hard-float (libctru) using the
// u2f()/f2u() bit-cast macros from bridge_utils.h.
// ----------------------------------------------------------------

// Master volume
void     ndsp_set_master_vol(uint32_t vol)       { ndspSetMasterVol(u2f(vol)); }
uint32_t ndsp_get_master_vol(void)               { return f2u(ndspGetMasterVol()); }

// Auxiliary output volume
void     ndsp_aux_set_volume(int id, uint32_t v) { ndspAuxSetVolume(id, u2f(v)); }
uint32_t ndsp_aux_get_volume(int id)             { return f2u(ndspAuxGetVolume(id)); }

// Channel sample rate
void     ndsp_chn_set_rate(int id, uint32_t r)   { ndspChnSetRate(id, u2f(r)); }
uint32_t ndsp_chn_get_rate(int id)               { return f2u(ndspChnGetRate(id)); }

// IIR monopole filters
bool ndsp_chn_iir_mono_custom(int id, uint32_t a0, uint32_t a1, uint32_t b0) {
    return ndspChnIirMonoSetParamsCustomFilter(id, u2f(a0), u2f(a1), u2f(b0));
}
bool ndsp_chn_iir_mono_lpf(int id, uint32_t f0) {
    return ndspChnIirMonoSetParamsLowPassFilter(id, u2f(f0));
}
bool ndsp_chn_iir_mono_hpf(int id, uint32_t f0) {
    return ndspChnIirMonoSetParamsHighPassFilter(id, u2f(f0));
}

// IIR biquad filters
bool ndsp_chn_iir_biquad_custom(int id,
        uint32_t a0, uint32_t a1, uint32_t a2,
        uint32_t b0, uint32_t b1, uint32_t b2) {
    return ndspChnIirBiquadSetParamsCustomFilter(
        id, u2f(a0), u2f(a1), u2f(a2), u2f(b0), u2f(b1), u2f(b2));
}
bool ndsp_chn_iir_biquad_lpf(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsLowPassFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_hpf(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsHighPassFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_bpf(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsBandPassFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_notch(int id, uint32_t f0, uint32_t Q) {
    return ndspChnIirBiquadSetParamsNotchFilter(id, u2f(f0), u2f(Q));
}
bool ndsp_chn_iir_biquad_peq(int id, uint32_t f0, uint32_t Q, uint32_t gain) {
    return ndspChnIirBiquadSetParamsPeakingEqualizer(id, u2f(f0), u2f(Q), u2f(gain));
}

// ----------------------------------------------------------------
// synchronization — CondVar_Signal and CondVar_Broadcast are
// static inline in <3ds/synchronization.h>.
// ----------------------------------------------------------------

void condvar_signal(CondVar* cv)    { CondVar_Signal(cv); }
void condvar_broadcast(CondVar* cv) { CondVar_Broadcast(cv); }

// ----------------------------------------------------------------
// thread — threadOnException is static inline in <3ds/thread.h>.
// Sets the exception handler for the current thread by writing
// directly into Thread Local Storage slots 0x40–0x48.
// ----------------------------------------------------------------

void thread_on_exception(ExceptionHandler handler, void* stack_top, ERRF_ExceptionData* exception_data) {
    threadOnException(handler, stack_top, exception_data);
}

// ----------------------------------------------------------------
// swkbd — swkbdSetPasswordMode, swkbdSetValidation,
// swkbdSetNumpadKeys, and swkbdGetResult are static inline in
// <3ds/applets/swkbd.h>; they directly access SwkbdState fields.
// ----------------------------------------------------------------

void swkbd_set_password_mode(SwkbdState* swkbd, SwkbdPasswordMode mode) {
    swkbdSetPasswordMode(swkbd, mode);
}

void swkbd_set_validation(SwkbdState* swkbd, SwkbdValidInput validInput, uint32_t filterFlags, int maxDigits) {
    swkbdSetValidation(swkbd, validInput, filterFlags, maxDigits);
}

void swkbd_set_numpad_keys(SwkbdState* swkbd, int left, int right) {
    swkbdSetNumpadKeys(swkbd, left, right);
}

SwkbdResult swkbd_get_result(SwkbdState* swkbd) {
    return swkbdGetResult(swkbd);
}

// ----------------------------------------------------------------
// OS — system information and timing
// ----------------------------------------------------------------

u32 ctru_os_get_firm_version(void) {
    return osGetFirmVersion();
}

u32 ctru_os_get_kernel_version(void) {
    return osGetKernelVersion();
}

u32 ctru_os_get_system_core_version(void) {
    return osGetSystemCoreVersion();
}

u32 ctru_os_get_application_mem_type(void) {
    return osGetApplicationMemType();
}

u32 ctru_os_get_mem_region_size(MemRegion region) {
    return osGetMemRegionSize(region);
}

u32 ctru_os_get_mem_region_used(MemRegion region) {
    return osGetMemRegionUsed(region);
}

u32 ctru_os_get_mem_region_free(MemRegion region) {
    return osGetMemRegionFree(region);
}

void ctru_os_tick_counter_start(TickCounter* cnt) {
    osTickCounterStart(cnt);
}

void ctru_os_tick_counter_update(TickCounter* cnt) {
    osTickCounterUpdate(cnt);
}

uint64_t ctru_os_tick_counter_read(const TickCounter* cnt) {
    return d2u(osTickCounterRead(cnt));
}

u8 ctru_os_get_wifi_strength(void) {
    return osGetWifiStrength();
}

uint32_t ctru_os_get_3d_slider_state(void) {
    return f2u(osGet3DSliderState());
}

bool ctru_os_is_headset_connected(void) {
    return osIsHeadsetConnected();
}

// ----------------------------------------------------------------
// Remaining SVCs and helpers (3ds/svc.h): process creation, debugging, performance counters, DMA config helpers
// ----------------------------------------------------------------

void* ctru_get_thread_local_storage(void) {
    return getThreadLocalStorage();
}

u32* ctru_get_thread_command_buffer(void) {
    return getThreadCommandBuffer();
}

u32* ctru_get_thread_static_buffers(void) {
    return getThreadStaticBuffers();
}

void ctru_dma_device_config_init_default(DmaDeviceConfig *cfg) {
    dmaDeviceConfigInitDefault(cfg);
}

void ctru_dma_config_init_default(DmaConfig *cfg) {
    dmaConfigInitDefault(cfg);
}

// ----------------------------------------------------------------
// Remaining APT calls (3ds/services/apt.h)
// ----------------------------------------------------------------

APT_AppletAttr ctru_apt_make_applet_attr(APT_AppletPos pos, bool manualGpuRights, bool manualDspRights) {
    return aptMakeAppletAttr(pos, manualGpuRights, manualDspRights);
}

void ctru_apt_handle_jump_to_home(void) {
    aptHandleJumpToHome();
}

NS_APPID ctru_apt_get_menu_app_id(void) {
    return aptGetMenuAppID();
}

// ----------------------------------------------------------------
// Console, GFX, HID, IRRST, GSPGPU and VRAM calls that were missing
// ----------------------------------------------------------------

unsigned ctru_gsp_get_bytes_per_pixel(GSPGPU_FramebufferFormat format) {
    return gspGetBytesPerPixel(format);
}

// ----------------------------------------------------------------
// Error and Mii selector applets
// ----------------------------------------------------------------

void ctru_mii_selector_set_initial_index(MiiSelectorConf *conf, u32 index) {
    miiSelectorSetInitialIndex(conf, index);
}

// ----------------------------------------------------------------
// System font
// ----------------------------------------------------------------

CFNT_s* ctru_font_get_system_font(void) {
    return fontGetSystemFont();
}

FINF_s* ctru_font_get_info(CFNT_s* font) {
    return fontGetInfo(font);
}

TGLP_s* ctru_font_get_glyph_info(CFNT_s* font) {
    return fontGetGlyphInfo(font);
}

void* ctru_font_get_glyph_sheet_tex(CFNT_s* font, int sheetIndex) {
    return fontGetGlyphSheetTex(font, sheetIndex);
}

void ctru_font_calc_glyph_pos(fontGlyphPos_s* out, CFNT_s* font, int glyphIndex, u32 flags, uint32_t scaleX, uint32_t scaleY) {
    fontCalcGlyphPos(out, font, glyphIndex, flags, u2f(scaleX), u2f(scaleY));
}

// ----------------------------------------------------------------
// Homebrew environment
// ----------------------------------------------------------------

bool ctru_env_is_homebrew(void) {
    return envIsHomebrew();
}

u32 ctru_env_get_apt_app_id(void) {
    return envGetAptAppId();
}

u32 ctru_env_get_heap_size(void) {
    return envGetHeapSize();
}

u32 ctru_env_get_linear_heap_size(void) {
    return envGetLinearHeapSize();
}

const char* ctru_env_get_system_arg_list(void) {
    return envGetSystemArgList();
}

u32 ctru_env_get_system_run_flags(void) {
    return envGetSystemRunFlags();
}

// ----------------------------------------------------------------
// 3dslink
// ----------------------------------------------------------------

int ctru_link_3ds_stdio(void) {
    return link3dsStdio();
}

int ctru_link_3ds_stdio_for_debug(void) {
    return link3dsStdioForDebug();
}

// ----------------------------------------------------------------
// IPC command helpers
// ----------------------------------------------------------------

u32 ctru_ipc_make_header(u16 command_id, unsigned normal_params, unsigned translate_params) {
    return IPC_MakeHeader(command_id, normal_params, translate_params);
}

u32 ctru_ipc_desc_shared_handles(unsigned number) {
    return IPC_Desc_SharedHandles(number);
}

u32 ctru_ipc_desc_move_handles(unsigned number) {
    return IPC_Desc_MoveHandles(number);
}

u32 ctru_ipc_desc_cur_process_id(void) {
    return IPC_Desc_CurProcessId();
}

u32 ctru_ipc_desc_static_buffer(size_t size, unsigned buffer_id) {
    return IPC_Desc_StaticBuffer(size, buffer_id);
}

u32 ctru_ipc_desc_pxi_buffer(size_t size, unsigned buffer_id, bool is_read_only) {
    return IPC_Desc_PXIBuffer(size, buffer_id, is_read_only);
}

u32 ctru_ipc_desc_buffer(size_t size, IPC_BufferRights rights) {
    return IPC_Desc_Buffer(size, rights);
}

// ----------------------------------------------------------------
// GPU command buffers, GX and registers
// ----------------------------------------------------------------

void ctru_gx_cmd_queue_set_callback(gxCmdQueue_s* queue, void (* callback)(gxCmdQueue_s*), void* user) {
    gxCmdQueueSetCallback(queue, callback, user);
}

void ctru_gpucmd_set_buffer(u32* adr, u32 size, u32 offset) {
    GPUCMD_SetBuffer(adr, size, offset);
}

void ctru_gpucmd_set_buffer_offset(u32 offset) {
    GPUCMD_SetBufferOffset(offset);
}

void ctru_gpucmd_get_buffer(u32** addr, u32* size, u32* offset) {
    GPUCMD_GetBuffer(addr, size, offset);
}

u32 ctru_f_32tof_16(uint32_t f) {
    return f32tof16(u2f(f));
}

u32 ctru_f_32tof_20(uint32_t f) {
    return f32tof20(u2f(f));
}

u32 ctru_f_32tof_24(uint32_t f) {
    return f32tof24(u2f(f));
}

u32 ctru_f_32tof_31(uint32_t f) {
    return f32tof31(u2f(f));
}

void ctru_gpucmd_add_single_param(u32 header, u32 param) {
    GPUCMD_AddSingleParam(header, param);
}

// ----------------------------------------------------------------
// Decompression
// ----------------------------------------------------------------

bool ctru_decompress(void *output, size_t size, decompressCallback callback, void *userdata, size_t insize) {
    return decompress(output, size, callback, userdata, insize);
}

bool ctru_decompress_lzss(void *output, size_t size, decompressCallback callback, void *userdata, size_t insize) {
    return decompress_LZSS(output, size, callback, userdata, insize);
}

bool ctru_decompress_lz11(void *output, size_t size, decompressCallback callback, void *userdata, size_t insize) {
    return decompress_LZ11(output, size, callback, userdata, insize);
}

bool ctru_decompress_huff(size_t bits, void *output, size_t size, decompressCallback callback, void *userdata, size_t insize) {
    return decompress_Huff(bits, output, size, callback, userdata, insize);
}

bool ctru_decompress_rle(void *output, size_t size, decompressCallback callback, void *userdata, size_t insize) {
    return decompress_RLE(output, size, callback, userdata, insize);
}

// ----------------------------------------------------------------
// PTM — power, battery, pedometer and system power control
// ----------------------------------------------------------------

s32 ctru_ptm_sysm_get_notification_ack_value(u32 id) {
    return ptmSysmGetNotificationAckValue(id);
}

// ----------------------------------------------------------------
// CSND — the older sound service
// ----------------------------------------------------------------

u32 ctru_csnd_vol(uint32_t vol, uint32_t pan) {
    return CSND_VOL(u2f(vol), u2f(pan));
}

Result ctru_csnd_play_sound(int chn, u32 flags, u32 sampleRate, uint32_t vol, uint32_t pan, void* data0, void* data1, u32 size) {
    return csndPlaySound(chn, flags, sampleRate, u2f(vol), u2f(pan), data0, data1, size);
}

// ----------------------------------------------------------------
// QTM — New 3DS head tracking
// ----------------------------------------------------------------

Result ctru_qtmu_get_raw_tracking_data(QtmRawTrackingData *outData) {
    return QTMU_GetRawTrackingData(outData);
}

Result ctru_qtmu_get_tracking_data(QtmTrackingData *outData) {
    return QTMU_GetTrackingData(outData);
}

uint32_t ctru_qtm_compute_fov_x(const QtmTrackingData *data) {
    return f2u(qtmComputeFovX(data));
}

uint32_t ctru_qtm_compute_fov_y(const QtmTrackingData *data) {
    return f2u(qtmComputeFovY(data));
}

uint32_t ctru_qtm_compute_inverse_aspect_ratio(const QtmTrackingData *data) {
    return f2u(qtmComputeInverseAspectRatio(data));
}

uint32_t ctru_qtm_compute_head_tilt_angle(const QtmTrackingData *data) {
    return f2u(qtmComputeHeadTiltAngle(data));
}

uint32_t ctru_qtm_estimate_eye_to_camera_distance(const QtmTrackingData *data) {
    return f2u(qtmEstimateEyeToCameraDistance(data));
}

// ----------------------------------------------------------------
// FS-PXI, fs:REG and PXIDEV
// ----------------------------------------------------------------

u8 ctru_pxi_dev_make_transfer_option(FS_CardSpiBaudRate baudRate, FS_CardSpiBusMode busMode) {
    return pxiDevMakeTransferOption(baudRate, busMode);
}

u64 ctru_pxi_dev_make_wait_operation(PXIDEV_WaitType waitType, PXIDEV_DeassertType deassertType, u64 timeout) {
    return pxiDevMakeWaitOperation(waitType, deassertType, timeout);
}
