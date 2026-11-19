package ctru

// ============================================================
// DSP service
// 3ds/services/dsp.h
//
// Loads DSP firmware and talks to the DSP directly. NDSP uses this; you rarely need it yourself.
// ============================================================

// DSP interrupt types.
DSP_InterruptType :: enum u8 {
    DSP_INTERRUPT_PIPE = 2, // Pipe interrupt.
}

// DSP hook types.
DSP_HookType :: enum u8 {
    ONSLEEP  = 0, // DSP is going to sleep.
    ONWAKEUP = 1, // DSP is waking up.
    ONCANCEL = 2, // DSP was sleeping and the app was cancelled.
}

// DSP hook function.
dspHookFn :: #type proc "c" (hook: DSP_HookType)

// DSP hook cookie.
dspHookCookie :: struct {
    next:     ^tag_dspHookCookie, // Next cookie.
    callback: dspHookFn, // Hook callback.
}
tag_dspHookCookie :: dspHookCookie

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes the dsp service. Call this before calling any DSP_* function.
    dspInit :: proc() -> Result ---

    // Closes the dsp service.
    dspExit :: proc() ---

    // Returns true if a component is loaded, false otherwise.
    dspIsComponentLoaded :: proc() -> bool ---

    // Sets up a DSP status hook.
    dspHook :: proc(cookie: ^dspHookCookie, callback: dspHookFn) ---

    // Removes a DSP status hook.
    dspUnhook :: proc(cookie: ^dspHookCookie) ---

    // Checks if a headphone is inserted.
    DSP_GetHeadphoneStatus :: proc(is_inserted: ^bool) -> Result ---

    // Flushes the cache
    DSP_FlushDataCache :: proc(address: rawptr, size: u32) -> Result ---

    // Invalidates the cache
    DSP_InvalidateDataCache :: proc(address: rawptr, size: u32) -> Result ---

    // Retrieves the handle of the DSP semaphore.
    DSP_GetSemaphoreHandle :: proc(semaphore: ^Handle) -> Result ---

    // Sets the DSP hardware semaphore value.
    DSP_SetSemaphore :: proc(value: u16) -> Result ---

    // Masks the DSP hardware semaphore value.
    DSP_SetSemaphoreMask :: proc(mask: u16) -> Result ---

    // Loads a DSP binary and starts the DSP
    DSP_LoadComponent :: proc(component: rawptr, size: u32, prog_mask: u16, data_mask: u16, is_loaded: ^bool) -> Result ---

    // Stops the DSP by unloading the binary.
    DSP_UnloadComponent :: proc() -> Result ---

    // Registers an event handle with the DSP through IPC
    DSP_RegisterInterruptEvents :: proc(handle: Handle, interrupt: u32, channel: u32) -> Result ---

    // Reads a pipe if possible.
    DSP_ReadPipeIfPossible :: proc(channel: u32, peer: u32, buffer: rawptr, length: u16, length_read: ^u16) -> Result ---

    // Writes to a pipe.
    DSP_WriteProcessPipe :: proc(channel: u32, buffer: rawptr, length: u32) -> Result ---

    // Converts a DSP memory address to a virtual address usable by the process.
    DSP_ConvertProcessAddressFromDspDram :: proc(dsp_address: u32, arm_address: ^u32) -> Result ---

    // Reads a DSP register
    DSP_RecvData :: proc(regNo: u16, value: ^u16) -> Result ---

    // Checks if you can read a DSP register
    DSP_RecvDataIsReady :: proc(regNo: u16, is_ready: ^bool) -> Result ---

    // Writes to a DSP register
    DSP_SendData :: proc(regNo: u16, value: u16) -> Result ---

    // Checks if you can write to a DSP register ?
    DSP_SendDataIsEmpty :: proc(regNo: u16, is_empty: ^bool) -> Result ---
}
