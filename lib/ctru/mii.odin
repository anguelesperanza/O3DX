package ctru

// ============================================================
// Mii data
// 3ds/mii.h
//
// The layout of a Mii record, as returned by the Mii selector applet and the friends service.
// ============================================================

MII_NAME_LEN :: 11

MiiScreenName :: [MII_NAME_LEN]u16

// Shared Base Mii struct
// Opaque here: the C type has a union or bitfields. 92 bytes.
MiiData :: struct #align(1) {
    _: [92]u8,
}
