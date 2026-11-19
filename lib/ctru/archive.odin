package ctru

// ============================================================
// Shared extdata and NAND archives as devices
// 3ds/archive.h
//
// Mounts the shared extdata archives (and others) so they can be read with fopen.
// ============================================================

ARCHIVE_DIRITER_MAGIC :: 0x68637261

// ! Open directory struct
archive_dir_t :: struct {
    magic:      u32,
    fd:         Handle,
    index:      int,
    size:       uint,
    entry_data: [32]FS_DirectoryEntry,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Mounts the SD
    archiveMountSdmc :: proc() -> Result ---

    // Mounts and opens an archive as deviceName Returns either an archive open error code, or -1
    // for generic failure
    archiveMount :: proc(archiveID: FS_ArchiveID, archivePath: FS_Path, deviceName: cstring) -> Result ---

    // Uses FSUSER_ControlArchive with control action ARCHIVE_ACTION_COMMIT_SAVE_DATA on the opened
    // archive. Not done automatically at unmount. Returns -1 if the specified device is not found
    archiveCommitSaveData :: proc(deviceName: cstring) -> Result ---

    // Unmounts the specified device, closing its archive in the process Returns -1 if the specified
    // device was not found
    archiveUnmount :: proc(deviceName: cstring) -> Result ---

    // Unmounts all devices and cleans up any resources used by the driver
    archiveUnmountAll :: proc() -> Result ---

    // Get a file's mtime
    archive_getmtime :: proc(name: cstring, mtime: ^u64) -> Result ---
}
