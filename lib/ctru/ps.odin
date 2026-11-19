package ctru

// ============================================================
// PS — process services
// 3ds/services/ps.h
//
// Signing and verification, random numbers, the console's local friend code seed and device ID.
// ============================================================

// PS AES algorithms.
PS_AESAlgorithm :: enum u8 {
    CBC_ENC = 0, // CBC encryption.
    CBC_DEC = 1, // CBC decryption.
    CTR_ENC = 2, // CTR encryption.
    CTR_DEC = 3, // CTR decryption(same as PS_ALGORITHM_CTR_ENC).
    CCM_ENC = 4, // CCM encryption.
    CCM_DEC = 5, // CCM decryption.
}

// PS key slots.
PS_AESKeyType :: enum u8 {
    KEYSLOT_0D      = 0, // Key slot 0x0D.
    KEYSLOT_2D      = 1, // Key slot 0x2D.
    KEYSLOT_31      = 2, // Key slot 0x31.
    KEYSLOT_38      = 3, // Key slot 0x38.
    KEYSLOT_32      = 4, // Key slot 0x32.
    KEYSLOT_39_DLP  = 5, // Key slot 0x39. (DLP)
    KEYSLOT_2E      = 6, // Key slot 0x2E.
    KEYSLOT_INVALID = 7, // Invalid key slot.
    KEYSLOT_36      = 8, // Key slot 0x36.
    KEYSLOT_39_NFC  = 9, // Key slot 0x39. (NFC)
}

// RSA context.
psRSAContext :: struct {
    modulo:      [0x100]u8,
    exponent:    [0x100]u8,
    rsa_bitsize: u32,
    unk:         u32,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes PS.
    psInit :: proc() -> Result ---

    // Initializes PS with the specified session handle.
    psInitHandle :: proc(handle: Handle) -> Result ---

    // Exits PS.
    psExit :: proc() ---

    // Returns the PS session handle.
    psGetSessionHandle :: proc() -> Handle ---

    // Signs a RSA signature.
    PS_SignRsaSha256 :: proc(hash: ^u8, ctx: ^psRSAContext, signature: ^u8) -> Result ---

    // Verifies a RSA signature.
    PS_VerifyRsaSha256 :: proc(hash: ^u8, ctx: ^psRSAContext, signature: ^u8) -> Result ---

    // Encrypts/Decrypts AES data. Does not support AES CCM.
    PS_EncryptDecryptAes :: proc(size: u32, in_: ^u8, out: ^u8, aes_algo: PS_AESAlgorithm, key_type: PS_AESKeyType, iv: ^u8) -> Result ---

    // Encrypts/Decrypts signed AES CCM data. When decrypting, if the MAC is invalid, 0xC9010401 is
    // returned. After encrypting the MAC is located at inputbufptr.
    PS_EncryptSignDecryptVerifyAesCcm :: proc(in_: ^u8, in_size: u32, out: ^u8, out_size: u32, data_len: u32, mac_data_len: u32, mac_len: u32, aes_algo: PS_AESAlgorithm, key_type: PS_AESKeyType, nonce: ^u8) -> Result ---

    // Gets the 64-bit console friend code seed.
    PS_GetLocalFriendCodeSeed :: proc(seed: ^u64) -> Result ---

    // Gets the 32-bit device ID.
    PS_GetDeviceId :: proc(device_id: ^u32) -> Result ---

    // Generates cryptographically secure random bytes.
    PS_GenerateRandomBytes :: proc(out: rawptr, len: uint) -> Result ---
}
