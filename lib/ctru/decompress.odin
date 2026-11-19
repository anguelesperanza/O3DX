package ctru

// ============================================================
// Decompression
// 3ds/util/decompress.h
//
// LZ10, LZ11, Huffman and RLE decompression of data in memory, files or a custom stream.
// ============================================================

// Compression types
decompressType :: enum u8 {
    DUMMY = 0x0, // Dummy compression
    LZSS  = 0x10, // LZSS/LZ10 compression
    LZ10  = 0x10, // LZSS/LZ10 compression
    LZ11  = 0x11, // LZ11 compression
    HUFF1 = 0x21, // Huffman compression with 1-bit data
    HUFF2 = 0x22, // Huffman compression with 2-bit data
    HUFF3 = 0x23, // Huffman compression with 3-bit data
    HUFF4 = 0x24, // Huffman compression with 4-bit data
    HUFF5 = 0x25, // Huffman compression with 5-bit data
    HUFF6 = 0x26, // Huffman compression with 6-bit data
    HUFF7 = 0x27, // Huffman compression with 7-bit data
    HUFF8 = 0x28, // Huffman compression with 8-bit data
    HUFF  = 0x28, // Huffman compression with 8-bit data
    RLE   = 0x30, // Run-length encoding compression
}

// I/O vector
decompressIOVec :: struct {
    data: rawptr, // I/O buffer
    size: uint, // Buffer size
}

// Data callback
decompressCallback :: #type proc "c" (userdata: rawptr, buffer: rawptr, size: uint) -> int

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Decompression callback for file descriptors
    decompressCallback_FD :: proc(userdata: rawptr, buffer: rawptr, size: uint) -> int ---

    // Decompression callback for stdio FILE*
    decompressCallback_Stdio :: proc(userdata: rawptr, buffer: rawptr, size: uint) -> int ---

    // Decode decompression header
    decompressHeader :: proc(type_: ^decompressType, size: ^uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> int ---

    // Decompress data
    decompressV :: proc(iov: ^decompressIOVec, iovcnt: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress LZSS/LZ10
    decompressV_LZSS :: proc(iov: ^decompressIOVec, iovcnt: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress LZ11
    decompressV_LZ11 :: proc(iov: ^decompressIOVec, iovcnt: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress Huffman
    decompressV_Huff :: proc(bits: uint, iov: ^decompressIOVec, iovcnt: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress run-length encoding
    decompressV_RLE :: proc(iov: ^decompressIOVec, iovcnt: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Decompress data
    @(link_name = "ctru_decompress")
    decompress :: proc(output: rawptr, size: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress LZSS/LZ10
    @(link_name = "ctru_decompress_lzss")
    decompress_LZSS :: proc(output: rawptr, size: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress LZ11
    @(link_name = "ctru_decompress_lz11")
    decompress_LZ11 :: proc(output: rawptr, size: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress Huffman
    @(link_name = "ctru_decompress_huff")
    decompress_Huff :: proc(bits: uint, output: rawptr, size: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---

    // Decompress run-length encoding
    @(link_name = "ctru_decompress_rle")
    decompress_RLE :: proc(output: rawptr, size: uint, callback: decompressCallback, userdata: rawptr, insize: uint) -> bool ---
}
