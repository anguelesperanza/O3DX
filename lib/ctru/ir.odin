package ctru

// ============================================================
// IR — Infrared Service (IRU)
// 3ds/services/ir.h
//
// The old 3DS has a physical IR (infrared) port used to
// communicate with accessories like the Circle Pad Pro.
// iruInit/iruExit expose it for homebrew.
//
// Note: this is the IRU service (older 3DS models).  The New
// 3DS uses irrst (already bridged in ctru.odin) for its extra
// buttons.  Do not confuse the two.
//
// Simple send/receive:
//
//   buf: [0x1000]u32
//   ctru.iruInit(&buf[0], size_of(buf))
//   defer ctru.iruExit()
//
//   ctru.IRU_SetBitRate(3)   // bit rate value (see 3dbrew)
//
//   msg := "hello"
//   ctru.iruSendData(raw_data(transmit[:]), u32(len(msg)), true)
//
//   recv: [64]u8
//   count: u32
//   ctru.iruRecvData(&recv[0], u32(len(recv)), 0, &count, true)
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    // sharedmem_addr: page-aligned buffer allocated with linearAlloc.
    // sharedmem_size: size of the buffer in bytes.
    iruInit :: proc(sharedmem_addr: ^u32, sharedmem_size: u32) -> Result ---
    iruExit :: proc() ---

    // Returns the IRU service handle.
    iruGetServHandle :: proc() -> Handle ---

    // ── High-level send / receive ─────────────────────────────

    // Send data; wait=true blocks until the transfer completes.
    iruSendData :: proc(buf: [^]u8, size: u32, wait: bool) -> Result ---

    // Receive data.
    // flag: receive flags (see 3dbrew); typically 0.
    // transfercount: receives the number of bytes actually read.
    // wait=true blocks until data arrives.
    iruRecvData :: proc(buf: [^]u8, size: u32, flag: u8,
                        transfercount: ^u32, wait: bool) -> Result ---

    // ── Low-level session ─────────────────────────────────────

    IRU_Initialize :: proc() -> Result ---
    IRU_Shutdown   :: proc() -> Result ---

    // Begin an async send transfer.
    IRU_StartSendTransfer :: proc(buf: [^]u8, size: u32) -> Result ---
    // Block until the pending send completes.
    IRU_WaitSendTransfer  :: proc() -> Result ---

    // Begin an async receive transfer of `size` bytes.
    IRU_StartRecvTransfer :: proc(size: u32, flag: u8) -> Result ---
    // Block until the pending receive completes.
    // transfercount: bytes actually read.
    IRU_WaitRecvTransfer  :: proc(transfercount: ^u32) -> Result ---

    // ── Hardware settings ─────────────────────────────────────

    // Bit rate (see 3dbrew for values; e.g. 3 = ~115 kbps).
    IRU_SetBitRate :: proc(value: u8) -> Result ---
    IRU_GetBitRate :: proc(out: ^u8) -> Result ---

    // IR LED state (0 = off, 1 = on).
    IRU_SetIRLEDState    :: proc(value: u32) -> Result ---
    IRU_GetIRLEDRecvState :: proc(out: ^u32) -> Result ---

    // ── Events ────────────────────────────────────────────────

    // Event signaled when the current send transfer finishes.
    IRU_GetSendFinishedEvent :: proc(out: ^Handle) -> Result ---
    // Event signaled when the current receive transfer finishes.
    IRU_GetRecvFinishedEvent :: proc(out: ^Handle) -> Result ---
}
