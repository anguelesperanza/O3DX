package save_data_example

import ctru "../../lib/ctru"

// ============================================================
// Save_Data-Example
//
// Demonstrates persistent save data on the SD card using C
// stdio (fopen / fwrite / fread).  The FS service struct-by-
// value calling convention has ARM32 u64-alignment edge cases,
// so all file I/O goes through newlib's stdio layer instead —
// the same approach proved by Audio-Example.
//
// Save file: sdmc:/3ds/Save_Data-Example/save.bin
//
// Controls:
//   A      — add 10 to high_score and save immediately
//   Start  — save and exit
// ============================================================

// ── Save data layout ─────────────────────────────────────────

SAVE_MAGIC :: u32(0x53415645)  // "SAVE"

// Full sdmc:/ paths for C stdio
SAVE_DIR  : cstring = "sdmc:/3ds/Save_Data-Example"
SAVE_PATH : cstring = "sdmc:/3ds/Save_Data-Example/save.bin"

Save_Data :: struct {
    magic:      u32,
    play_count: u32,
    high_score: u32,
    checksum:   u32, // XOR of the three fields above
}

save_checksum :: proc "contextless" (s: ^Save_Data) -> u32 {
    return s.magic ~ s.play_count ~ s.high_score
}

save_valid :: proc "contextless" (s: ^Save_Data) -> bool {
    return s.magic == SAVE_MAGIC && s.checksum == save_checksum(s)
}

// ── File I/O helpers (C stdio — no FS struct-by-value ABI issues) ────────────

write_save :: proc "contextless" (save: ^Save_Data) -> bool {
    f := ctru.fopen(SAVE_PATH, "wb")
    if f == nil do return false
    written := ctru.fwrite(cast(rawptr)save, 1, uint(size_of(Save_Data)), f)
    ctru.fclose(f)
    return written == uint(size_of(Save_Data))
}

read_save :: proc "contextless" (save: ^Save_Data) -> bool {
    f := ctru.fopen(SAVE_PATH, "rb")
    if f == nil do return false
    read_bytes := ctru.fread(cast(rawptr)save, 1, uint(size_of(Save_Data)), f)
    ctru.fclose(f)
    if read_bytes != uint(size_of(Save_Data)) do return false
    return save_valid(save)
}

// ── Display ──────────────────────────────────────────────────

refresh_display :: proc "contextless" (save: ^Save_Data, status: cstring) {
    ctru.printf("\x1b[8;1H  Status:     %s\x1b[K",  status)
    ctru.printf("\x1b[9;1H  Play count: %u\x1b[K",  save.play_count)
    ctru.printf("\x1b[10;1H  High score: %u\x1b[K", save.high_score)
}

// ── Entry point ──────────────────────────────────────────────

@(export, link_name = "odin_main")
save_data_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    ctru.gfxInitDefault()
    ctru.consoleInit(ctru.GFX_TOP, nil)

    // ── Static UI ────────────────────────────────────────────
    ctru.printf("\x1b[2J")
    ctru.printf("\x1b[1;1H=== Save_Data-Example ===")
    ctru.printf("\x1b[3;1HFile: sdmc:/3ds/Save_Data-Example/save.bin")
    ctru.printf("\x1b[5;1HSave data:")
    ctru.printf("\x1b[27;1H[A] High score +10 and save")
    ctru.printf("\x1b[28;1H[Start] Save and exit")

    // Create save directory if absent (newlib mkdir maps to FS internally;
    // returns -1 if it already exists — we ignore the error either way).
    ctru.mkdir(SAVE_DIR, 0o755)

    // ── Load or create save data ─────────────────────────────
    save: Save_Data
    first_run := false

    if !read_save(&save) {
        save = Save_Data{
            magic      = SAVE_MAGIC,
            play_count = 0,
            high_score = 0,
        }
        save.checksum = save_checksum(&save)
        first_run = true
    }

    // Increment play count on every launch and write back.
    save.play_count += 1
    save.checksum    = save_checksum(&save)

    save_ok := write_save(&save)

    status : cstring = first_run ? "New save created" :
                       save_ok   ? "Loaded + updated" :
                                   "Load OK, write failed"
    refresh_display(&save, status)

    // ── Main loop ─────────────────────────────────────────────
    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        k_down := ctru.hidKeysDown()

        if k_down & ctru.KEY_START != 0 {
            save.checksum = save_checksum(&save)
            write_save(&save)
            break
        }

        if k_down & ctru.KEY_A != 0 {
            save.high_score += 10
            save.checksum    = save_checksum(&save)
            status = write_save(&save) ? "Score saved!" : "Write FAILED!"
            refresh_display(&save, status)
        }

        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.gspWaitForEvent(.VBlank0, true)
    }

    ctru.gfxExit()
    return 0
}
