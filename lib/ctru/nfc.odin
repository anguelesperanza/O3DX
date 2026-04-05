package ctru

// ============================================================
// NFC — NFC / amiibo Service
// 3ds/services/nfc.h
//
// Requires system version >=9.3.0-X.
//
// Typical amiibo read flow:
//
//   ctru.nfcInit(.NFCTag)
//   defer ctru.nfcExit()
//
//   ctru.nfcStartScanning(ctru.NFC_STARTSCAN_DEFAULTINPUT)
//
//   // Poll until a tag is in range
//   state: ctru.NFC_TagState
//   for ctru.aptMainLoop() {
//       ctru.nfcGetTagState(&state)
//       if state == .InRange { break }
//   }
//
//   // Load the amiibo data
//   ctru.nfcLoadAmiiboData()
//
//   // Wait for it to be ready
//   for ctru.aptMainLoop() {
//       ctru.nfcGetTagState(&state)
//       if state == .DataReady { break }
//   }
//
//   config: ctru.NFC_AmiiboConfig
//   ctru.nfcGetAmiiboConfig(&config)
//
//   ctru.nfcStopScanning()
// ============================================================

// ── Result code constants ──────────────────────────────────────

NFC_ERR_INVALID_STATE       :: u32(0xC8A17600)
NFC_ERR_APPDATA_UNINITIALIZED :: u32(0xC8A17620)
NFC_ERR_AMIIBO_NOTSETUP     :: u32(0xC8A17628)
NFC_ERR_APPID_MISMATCH      :: u32(0xC8A17638)
NFC_ERR_DATACORRUPTION0     :: u32(0xC8C1760C)
NFC_ERR_DATACORRUPTION1     :: u32(0xC8A17618)

/// Pass to nfcStartScanning() for the default scan parameters.
NFC_STARTSCAN_DEFAULTINPUT :: u16(0)

// ── Amiibo flag constants ──────────────────────────────────────

// Bit 4: amiibo was set up by amiibo Settings.
NFC_AMIIBO_FLAG_SETUP        :: u8(1 << 4)
// Bit 5: app data was initialized with nfcInitializeWriteAppData().
NFC_AMIIBO_FLAG_APPDATA_SETUP :: u8(1 << 5)

// ── Enums ─────────────────────────────────────────────────────

/// Operation type passed to nfcInit.
NFC_OpType :: enum u32 {
    Type1  = 1, // Unknown
    NFCTag = 2, // Default — use for amiibo
    RawNFC = 3, // Raw NFC tag commands (>=10.0.0-X only)
}

/// Current NFC tag state returned by nfcGetTagState.
NFC_TagState :: enum u32 {
    Uninitialized  = 0, // nfcInit() not called yet
    ScanningStopped = 1, // nfcInit() succeeded; not scanning
    Scanning        = 2, // nfcStartScanning() succeeded
    InRange         = 3, // Tag detected; set automatically
    OutOfRange      = 4, // Tag moved away; must stop+start to scan again
    DataReady       = 5, // nfcLoadAmiiboData() succeeded
}

// ── Structs ───────────────────────────────────────────────────

/// NFC tag identification info (44 bytes).
NFC_TagInfo :: struct {
    id_offset_size: u16,    // size or offset of the ID data
    unk_x2:         u8,
    unk_x3:         u8,
    id:             [0x28]u8, // 7-byte UID padded to 40 bytes
}

/// Amiibo settings read by nfcGetAmiiboSettings (168 bytes).
NFC_AmiiboSettings :: struct {
    mii:              [0x60]u8,   // owner Mii data
    nickname:         [11]u16,    // UTF-16BE amiibo nickname
    flags:            u8,         // NFC_AMIIBO_FLAG_* bits (masked to low nibble)
    countrycodeid:    u8,         // country code from the setup system
    setupdate_year:   u16,
    setupdate_month:  u8,
    setupdate_day:    u8,
    unk_x7c:          [0x2C]u8,
}

/// Amiibo configuration read by nfcGetAmiiboConfig (64 bytes).
NFC_AmiiboConfig :: struct {
    lastwritedate_year:  u16,
    lastwritedate_month: u8,
    lastwritedate_day:   u8,
    write_counter:       u16,
    characterID:         [3]u8,  // [0]=collection, [1]=character, [2]=variant
    series:              u8,
    amiiboID:            u16,    // shared by all identical amiibo
    amiibo_type:         u8,     // 0=figure, 1=card, 2=plush
    pagex4_byte3:        u8,
    appdata_size:        u16,    // always 0xD8 from NFC module
    zeros:               [0x30]u8,
}

/// Used internally by nfcInitializeWriteAppData (60 bytes).
NFC_AppDataInitStruct :: struct {
    data_x0: [0x0C]u8,
    data_xc: [0x30]u8, // the 0x30-byte struct sent to NFC:InitializeWriteAppData
}

/// Used internally by nfcWriteAppData (32 bytes).
NFC_AppDataWriteStruct :: struct {
    id:        [10]u8, // 7-byte UID normally
    id_size:   u8,
    unused_xb: [0x15]u8,
}

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    // op_type: use .NFCTag for amiibo; .RawNFC for raw NFC commands (>=10.0.0).
    nfcInit :: proc(op_type: NFC_OpType) -> Result ---
    nfcExit :: proc() ---

    // Returns the NFC session handle.
    nfcGetSessionHandle :: proc() -> Handle ---

    // ── Scanning ──────────────────────────────────────────────

    // Begin scanning for NFC tags.  inval: pass NFC_STARTSCAN_DEFAULTINPUT.
    nfcStartScanning :: proc(inval: u16) -> Result ---

    // Stop scanning.
    nfcStopScanning :: proc() ---

    // ── Tag data ──────────────────────────────────────────────

    // Load amiibo data from tag into memory.  State must be InRange.
    nfcLoadAmiiboData :: proc() -> Result ---

    // If state is DataReady or 6, resets it back to InRange.
    nfcResetTagScanState :: proc() -> Result ---

    // Write the in-memory amiibo data back to the physical tag.
    nfcUpdateStoredAmiiboData :: proc() -> Result ---

    // Returns the current tag state.
    nfcGetTagState :: proc(state: ^NFC_TagState) -> Result ---

    // Returns tag identification info (UID etc.).
    nfcGetTagInfo :: proc(out: ^NFC_TagInfo) -> Result ---

    // ── App data ──────────────────────────────────────────────

    // Open the amiibo app data region for the given app ID.
    // Must be called before nfcReadAppData / nfcWriteAppData.
    // Returns NFC_ERR_APPDATA_UNINITIALIZED if not yet initialized.
    nfcOpenAppData :: proc(amiibo_appid: u32) -> Result ---

    // Initialize app data (first-time write).  Cannot be used again once set.
    // amiibo_appid: see 3dbrew Amiibo page.
    // buf/size: up to 0x30 bytes of initial data.
    nfcInitializeWriteAppData :: proc(amiibo_appid: u32, buf: rawptr, size: uint) -> Result ---

    // Read app data (0xD8 bytes regardless of size; caller must supply >=0xD8 bytes).
    nfcReadAppData :: proc(buf: rawptr, size: uint) -> Result ---

    // Write app data (size <=0xD8 bytes).  nfcOpenAppData() must succeed first.
    nfcWriteAppData :: proc(buf: rawptr, size: uint, taginfo: ^NFC_TagInfo) -> Result ---

    // ── Amiibo metadata ───────────────────────────────────────

    // Returns amiibo settings (owner Mii, nickname, setup date).
    // Returns NFC_ERR_AMIIBO_NOTSETUP if not set up via amiibo Settings applet.
    nfcGetAmiiboSettings :: proc(out: ^NFC_AmiiboSettings) -> Result ---

    // Returns amiibo configuration (character ID, series, write counter).
    nfcGetAmiiboConfig :: proc(out: ^NFC_AmiiboConfig) -> Result ---

    // ── Raw NFC mode (requires NFC_OpType.RawNFC + >=10.0.0) ─

    // Start scanning for raw NFC tags.
    nfcStartOtherTagScanning :: proc(unk0: u16, unk1: u32) -> Result ---

    // Send a raw NFC command and receive the response.
    // actual_transfer_size: optional output for actual bytes received; pass nil.
    nfcSendTagCommand :: proc(inbuf: rawptr, insize: uint,
                               outbuf: rawptr, outsize: uint,
                               actual_transfer_size: ^uint,
                               microseconds: u64) -> Result ---

    nfcCmd21 :: proc() -> Result ---
    nfcCmd22 :: proc() -> Result ---
}
