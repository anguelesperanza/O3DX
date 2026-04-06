package ctru

// ============================================================
// CFGU — Configuration Service  (3ds/services/cfgu.h)
// Read system settings: region, language, model, country codes,
// NFC support, and raw config blocks.
// ============================================================

// ── Enums ─────────────────────────────────────────────────────

/// Console region.
CFG_Region :: enum u8 {
    JPN = 0, // Japan
    USA = 1, // USA
    EUR = 2, // Europe
    AUS = 3, // Australia
    CHN = 4, // China
    KOR = 5, // Korea
    TWN = 6, // Taiwan
}

/// System language (as stored in config).
CFG_Language :: enum i8 {
    DEFAULT = -1, // Use system language (for errorInit)
    JP      =  0, // Japanese
    EN      =  1, // English
    FR      =  2, // French
    DE      =  3, // German
    IT      =  4, // Italian
    ES      =  5, // Spanish
    ZH      =  6, // Simplified Chinese
    KO      =  7, // Korean
    NL      =  8, // Dutch
    PT      =  9, // Portuguese
    RU      = 10, // Russian
    TW      = 11, // Traditional Chinese
}

/// Console hardware model.
CFG_SystemModel :: enum u8 {
    MODEL_3DS    = 0, // Old 3DS (CTR)
    MODEL_3DSXL  = 1, // Old 3DS XL (SPR)
    MODEL_N3DS   = 2, // New 3DS (KTR)
    MODEL_2DS    = 3, // Old 2DS (FTR)
    MODEL_N3DSXL = 4, // New 3DS XL (RED)
    MODEL_N2DSXL = 5, // New 2DS XL (JAN)
}

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Service lifecycle ─────────────────────────────────────

    cfguInit :: proc() -> Result ---
    cfguExit :: proc() ---

    // ── Common queries ────────────────────────────────────────

    // Get the system region from SecureInfo.
    CFGU_SecureInfoGetRegion :: proc(region: ^u8) -> Result ---

    // Get the system language.
    CFGU_GetSystemLanguage :: proc(language: ^u8) -> Result ---

    // Get the hardware model (see CFG_SystemModel).
    CFGU_GetSystemModel :: proc(model: ^u8) -> Result ---

    // Returns 0 in *value if the unit is a 2DS, 1 otherwise.
    CFGU_GetModelNintendo2DS :: proc(value: ^u8) -> Result ---

    // Returns 1 in *value if the region is Canada or USA, 0 otherwise.
    CFGU_GetRegionCanadaUSA :: proc(value: ^u8) -> Result ---

    // Check whether NFC / amiibo hardware is present.
    CFGU_IsNFCSupported :: proc(isSupported: ^bool) -> Result ---

    // Generate a console-unique hash seeded by appIDSalt.
    CFGU_GenHashConsoleUnique :: proc(appIDSalt: u32, hash: ^u64) -> Result ---

    // ── Country codes ─────────────────────────────────────────

    // Translate a numeric country code to a UTF-16 string (e.g. 0x00EF → "US").
    CFGU_GetCountryCodeString :: proc(code: u16, string: ^u16) -> Result ---

    // Translate a UTF-16 country string back to its numeric code.
    CFGU_GetCountryCodeID :: proc(string: u16, code: ^u16) -> Result ---

    // ── Raw config blocks ─────────────────────────────────────
    //
    // Each block is identified by a 32-bit block ID (blkID) and has a
    // flags field that controls access level (2 = user-readable, 4/8 = privileged).

    // Read a block accessible at flags=2 (user-readable).
    CFGU_GetConfigInfoBlk2 :: proc(size: u32, blkID: u32, outData: rawptr) -> Result ---

    // Read a block accessible at flags=4.
    CFG_GetConfigInfoBlk4 :: proc(size: u32, blkID: u32, outData: rawptr) -> Result ---

    // Read a block accessible at flags=8.
    CFG_GetConfigInfoBlk8 :: proc(size: u32, blkID: u32, outData: rawptr) -> Result ---

    // Write a block accessible at flags=4.
    CFG_SetConfigInfoBlk4 :: proc(size: u32, blkID: u32, inData: rawptr) -> Result ---

    // Write a block accessible at flags=8.
    CFG_SetConfigInfoBlk8 :: proc(size: u32, blkID: u32, inData: rawptr) -> Result ---

    // Flush in-memory config changes to the NAND savegame.
    CFG_UpdateConfigSavegame :: proc() -> Result ---

    // ── Privileged / internal (CFGI) ──────────────────────────
    //
    // These require higher privileges and are mainly useful for
    // system-level tools or CFW homebrew.

    CFGI_RestoreLocalFriendCodeSeed  :: proc() -> Result ---
    CFGI_RestoreSecureInfo           :: proc() -> Result ---
    CFGI_DeleteConfigSavefile        :: proc() -> Result ---
    CFGI_FormatConfig                :: proc() -> Result ---
    CFGI_ClearParentalControls       :: proc() -> Result ---
    CFGI_VerifySigLocalFriendCodeSeed :: proc() -> Result ---
    CFGI_VerifySigSecureInfo         :: proc() -> Result ---
    CFGI_SecureInfoGetSerialNumber   :: proc(serial: ^u8) -> Result ---
    CFGI_GetLocalFriendCodeSeedData  :: proc(data: ^u8) -> Result ---
    CFGI_GetLocalFriendCodeSeed      :: proc(seed: ^u64) -> Result ---
    CFGI_GetSecureInfoData           :: proc(data: ^u8) -> Result ---
    CFGI_GetSecureInfoSignature      :: proc(data: ^u8) -> Result ---
}
