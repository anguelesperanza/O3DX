package ctru

// ============================================================
// Basic types
// 3ds/types.h
//
// CPU and FPU register sets, used by exception and debug information.
// ============================================================

// The maximum value of a u64.
U64_MAX   :: max(u64)
SSIZE_MAX :: 2147483647

voidfn :: #type proc "c" ()

// Structure representing CPU registers
CpuRegisters :: struct {
    r:    [13]u32, // r0-r12.
    sp:   u32, // sp.
    lr:   u32, // lr.
    pc:   u32, // pc. May need to be adjusted.
    cpsr: u32, // cpsr.
}

// Structure representing FPU registers
// Opaque here: the C type has a nested struct/union. 136 bytes.
FpuRegisters :: struct #align(4) {
    _: [136]u8,
}
