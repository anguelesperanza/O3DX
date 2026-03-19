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
