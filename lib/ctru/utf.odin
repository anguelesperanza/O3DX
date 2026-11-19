package ctru

// ============================================================
// UTF conversion
// 3ds/util/utf.h
//
// Converts between UTF-8, UTF-16 and UTF-32, one code point or whole strings.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Convert a UTF-8 sequence into a UTF-32 codepoint
    decode_utf8 :: proc(out: ^u32, in_: ^u8) -> int ---

    // Convert a UTF-16 sequence into a UTF-32 codepoint
    decode_utf16 :: proc(out: ^u32, in_: ^u16) -> int ---

    // Convert a UTF-32 codepoint into a UTF-8 sequence
    encode_utf8 :: proc(out: ^u8, in_: u32) -> int ---

    // Convert a UTF-32 codepoint into a UTF-16 sequence
    encode_utf16 :: proc(out: ^u16, in_: u32) -> int ---

    // Convert a UTF-8 sequence into a UTF-16 sequence Fills the output buffer up to len code units.
    // Returns the number of code units that the input would produce; if it returns greater than
    // len, the output has been truncated.
    utf8_to_utf16 :: proc(out: ^u16, in_: ^u8, len: uint) -> int ---

    // Convert a UTF-8 sequence into a UTF-32 sequence Fills the output buffer up to len code units.
    // Returns the number of code units that the input would produce; if it returns greater than
    // len, the output has been truncated.
    utf8_to_utf32 :: proc(out: ^u32, in_: ^u8, len: uint) -> int ---

    // Convert a UTF-16 sequence into a UTF-8 sequence Fills the output buffer up to len code units.
    // Returns the number of code units that the input would produce; if it returns greater than
    // len, the output has been truncated.
    utf16_to_utf8 :: proc(out: ^u8, in_: ^u16, len: uint) -> int ---

    // Convert a UTF-16 sequence into a UTF-32 sequence Fills the output buffer up to len code
    // units. Returns the number of code units that the input would produce; if it returns greater
    // than len, the output has been truncated.
    utf16_to_utf32 :: proc(out: ^u32, in_: ^u16, len: uint) -> int ---

    // Convert a UTF-32 sequence into a UTF-8 sequence Fills the output buffer up to len code units.
    // Returns the number of code units that the input would produce; if it returns greater than
    // len, the output has been truncated.
    utf32_to_utf8 :: proc(out: ^u8, in_: ^u32, len: uint) -> int ---

    // Convert a UTF-32 sequence into a UTF-16 sequence
    utf32_to_utf16 :: proc(out: ^u16, in_: ^u32, len: uint) -> int ---
}
