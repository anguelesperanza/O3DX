package ctru

// ============================================================
// Filesystem Services — 3ds/services/fs.h
//
// The FS service provides access to save data, the SD card,
// NAND, and ROM archives.  The most common pattern for games:
//
//   fsInit()
//   defer fsExit()
//
//   var arch FS_Archive
//   FSUSER_OpenArchive(&arch, .SAVEDATA, fsMakePath(.EMPTY, nil))
//   defer FSUSER_CloseArchive(arch)
//
//   var fh Handle
//   FSUSER_OpenFile(&fh, arch, fsMakePath(.ASCII, "/save.bin"),
//       FS_OPEN_READ | FS_OPEN_WRITE | FS_OPEN_CREATE, 0)
//   defer FSFILE_Close(fh)
//
//   FSFILE_Write(fh, nil, 0, &data, size_of(data), FS_WRITE_FLUSH)
// ============================================================

// ── Open / write / attribute flag constants ───────────────────

FS_OPEN_READ   :: u32(1 << 0)
FS_OPEN_WRITE  :: u32(1 << 1)
FS_OPEN_CREATE :: u32(1 << 2)

FS_WRITE_FLUSH       :: u32(1 << 0)
FS_WRITE_UPDATE_TIME :: u32(1 << 8)

FS_ATTRIBUTE_DIRECTORY :: u32(1 << 0)
FS_ATTRIBUTE_HIDDEN    :: u32(1 << 8)
FS_ATTRIBUTE_ARCHIVE   :: u32(1 << 16)
FS_ATTRIBUTE_READ_ONLY :: u32(1 << 24)

// ── Enum types ───────────────────────────────────────────────

/// Media/storage type.
FS_MediaType :: enum u32 {
    NAND      = 0,
    SD        = 1,
    GAME_CARD = 2,
}

/// System media type.
FS_SystemMediaType :: enum u32 {
    CTR_NAND  = 0,
    TWL_NAND  = 1,
    SD        = 2,
    TWL_PHOTO = 3,
}

/// Archive identifiers.
FS_ArchiveID :: enum u32 {
    ROMFS                    = 0x00000003,
    SAVEDATA                 = 0x00000004,
    EXTDATA                  = 0x00000006,
    SHARED_EXTDATA           = 0x00000007,
    SYSTEM_SAVEDATA          = 0x00000008,
    SDMC                     = 0x00000009,
    SDMC_WRITE_ONLY          = 0x0000000A,
    BOSS_EXTDATA             = 0x12345678,
    CARD_SPIFS               = 0x12345679,
    EXTDATA_AND_BOSS_EXTDATA = 0x1234567B,
    SYSTEM_SAVEDATA2         = 0x1234567C,
    NAND_RW                  = 0x1234567D,
    NAND_RO                  = 0x1234567E,
    NAND_RO_WRITE_ACCESS     = 0x1234567F,
    SAVEDATA_AND_CONTENT     = 0x2345678A,
    SAVEDATA_AND_CONTENT2    = 0x2345678E,
    NAND_CTR_FS              = 0x567890AB,
    TWL_PHOTO                = 0x567890AC,
    TWL_SOUND                = 0x567890AD,
    NAND_TWL_FS              = 0x567890AE,
    NAND_W_FS                = 0x567890AF,
    GAMECARD_SAVEDATA        = 0x567890B1,
    USER_SAVEDATA            = 0x567890B2,
    DEMO_SAVEDATA            = 0x567890B4,
}

/// Path type for FS_Path.
FS_PathType :: enum u32 {
    INVALID = 0,
    EMPTY   = 1, // use with nil data pointer
    BINARY  = 2,
    ASCII   = 3, // use with cstring data
    UTF16   = 4, // use with ^u16 data
}

/// Secure value slot.
FS_SecureValueSlot :: enum u32 {
    SD = 0x1000,
}

/// Card type.
FS_CardType :: enum u32 {
    CTR = 0,
    TWL = 1,
}

/// Archive control action.
FS_ArchiveAction :: enum u32 {
    COMMIT_SAVE_DATA = 0,
    GET_TIMESTAMP    = 1,
}

/// Secure save action.
FS_SecureSaveAction :: enum u32 {
    DELETE = 0,
    FORMAT = 1,
}

// ── Struct types ─────────────────────────────────────────────

/// Filesystem path — created by fsMakePath().
FS_Path :: struct {
    type: FS_PathType,
    size: u32,
    data: rawptr,
}

/// Directory entry returned by FSDIR_Read.
FS_DirectoryEntry :: struct {
    name:       [0x106]u16, // UTF-16 filename
    shortName:  [0x0A]u8,
    shortExt:   [0x04]u8,
    valid:      u8,
    reserved:   u8,
    attributes: u32,
    fileSize:   u64,
}

/// Archive resource information (free space, cluster size, etc.).
FS_ArchiveResource :: struct {
    sectorSize:    u32,
    clusterSize:   u32,
    totalClusters: u32,
    freeClusters:  u32,
}

/// Program information (program ID + media type).
FS_ProgramInfo :: struct {
    programId: u64,
    mediaType: u8,        // FS_MediaType cast to u8 (bitfield in C)
    padding:   [7]u8,
}

/// Product information (product code, company, remaster version).
FS_ProductInfo :: struct {
    productCode:     [0x10]u8,
    companyCode:     [0x02]u8,
    remasterVersion: u16,
}

/// Ext save data info (packed — no alignment padding).
FS_ExtSaveDataInfo :: struct #packed {
    mediaType: u8,      // FS_MediaType bitfield
    unknown:   u8,
    reserved1: u16,
    saveId:    u64,
    reserved2: u32,
}

/// System save data info.
FS_SystemSaveDataInfo :: struct {
    mediaType: u8,    // FS_MediaType bitfield
    unknown:   u8,
    reserved:  u16,
    saveId:    u32,
}

/// Device move context (IVs + encrypt parameter).
FS_DeviceMoveContext :: struct {
    ivs:              [0x10]u8,
    encryptParameter: [0x10]u8,
}

/// SDMC/NAND speed information.
FS_SdMmcSpeedInfo :: struct {
    highSpeedModeEnabled: bool,
    usesHighestClockRate: bool,
    sdClkCtrl:            u16,
}

/// Integrity verification seed (for system security — rarely needed by games).
FS_IntegrityVerificationSeed :: struct {
    aesCbcMac:  [0x10]u8,
    movableSed: [0x120]u8,
}

/// Archive handle — u64 value returned by FSUSER_OpenArchive.
FS_Archive :: u64

// ── Foreign functions ─────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Session management ────────────────────────────────────
    fsInit         :: proc() -> Result ---
    fsExit         :: proc() ---
    fsUseSession   :: proc(session: Handle) ---
    fsEndUseSession :: proc() ---
    fsExemptFromSession   :: proc(archive: FS_Archive) ---
    fsUnexemptFromSession :: proc(archive: FS_Archive) ---
    // Creates an FS_Path value (returned by value — safe, no floats).
    fsMakePath     :: proc(kind: FS_PathType, path: rawptr) -> FS_Path ---
    fsGetSessionHandle :: proc() -> ^Handle ---

    // ── FSUSER — filesystem-level operations ──────────────────
    FSUSER_Control              :: proc(action: u32, input: rawptr, inputSize: u32, output: rawptr, outputSize: u32) -> Result ---
    FSUSER_Initialize           :: proc(session: Handle) -> Result ---

    // File operations
    FSUSER_OpenFile             :: proc(out: ^Handle, archive: FS_Archive, path: FS_Path, openFlags, attributes: u32) -> Result ---
    FSUSER_OpenFileDirectly     :: proc(out: ^Handle, archiveId: FS_ArchiveID, archivePath, filePath: FS_Path, openFlags, attributes: u32) -> Result ---
    FSUSER_DeleteFile           :: proc(archive: FS_Archive, path: FS_Path) -> Result ---
    FSUSER_RenameFile           :: proc(srcArchive: FS_Archive, srcPath: FS_Path, dstArchive: FS_Archive, dstPath: FS_Path) -> Result ---
    FSUSER_CreateFile           :: proc(archive: FS_Archive, path: FS_Path, attributes: u32, fileSize: u64) -> Result ---

    // Directory operations
    FSUSER_DeleteDirectory           :: proc(archive: FS_Archive, path: FS_Path) -> Result ---
    FSUSER_DeleteDirectoryRecursively :: proc(archive: FS_Archive, path: FS_Path) -> Result ---
    FSUSER_CreateDirectory          :: proc(archive: FS_Archive, path: FS_Path, attributes: u32) -> Result ---
    FSUSER_RenameDirectory          :: proc(srcArchive: FS_Archive, srcPath: FS_Path, dstArchive: FS_Archive, dstPath: FS_Path) -> Result ---
    FSUSER_OpenDirectory            :: proc(out: ^Handle, archive: FS_Archive, path: FS_Path) -> Result ---

    // Archive management
    FSUSER_OpenArchive           :: proc(archive: ^FS_Archive, id: FS_ArchiveID, path: FS_Path) -> Result ---
    FSUSER_ControlArchive        :: proc(archive: FS_Archive, action: FS_ArchiveAction, input: rawptr, inputSize: u32, output: rawptr, outputSize: u32) -> Result ---
    FSUSER_CloseArchive          :: proc(archive: FS_Archive) -> Result ---
    FSUSER_GetFreeBytes          :: proc(freeBytes: ^u64, archive: FS_Archive) -> Result ---
    FSUSER_GetArchiveResource    :: proc(archiveResource: ^FS_ArchiveResource, mediaType: FS_SystemMediaType) -> Result ---
    FSUSER_GetArchivePriority    :: proc(priority: ^u32, archive: FS_Archive) -> Result ---
    FSUSER_SetArchivePriority    :: proc(archive: FS_Archive, priority: u32) -> Result ---

    // SD card / NAND queries
    FSUSER_GetCardType           :: proc(kind: ^FS_CardType) -> Result ---
    FSUSER_GetSdmcArchiveResource :: proc(archiveResource: ^FS_ArchiveResource) -> Result ---
    FSUSER_GetNandArchiveResource :: proc(archiveResource: ^FS_ArchiveResource) -> Result ---
    FSUSER_IsSdmcDetected        :: proc(detected: ^bool) -> Result ---
    FSUSER_IsSdmcWritable        :: proc(writable: ^bool) -> Result ---
    FSUSER_GetSdmcCid            :: proc(out: ^u8, length: u32) -> Result ---
    FSUSER_GetNandCid            :: proc(out: ^u8, length: u32) -> Result ---
    FSUSER_GetSdmcSpeedInfo      :: proc(speedInfo: ^FS_SdMmcSpeedInfo) -> Result ---
    FSUSER_GetNandSpeedInfo      :: proc(speedInfo: ^FS_SdMmcSpeedInfo) -> Result ---
    FSUSER_CardSlotIsInserted    :: proc(inserted: ^bool) -> Result ---
    FSUSER_GetMediaType          :: proc(mediaType: ^FS_MediaType) -> Result ---

    // Save data management
    FSUSER_FormatSaveData        :: proc(archiveId: FS_ArchiveID, path: FS_Path, blocks, directories, files, directoryBuckets, fileBuckets: u32, duplicateData: bool) -> Result ---
    FSUSER_GetFormatInfo         :: proc(totalSize, directories, files: ^u32, duplicateData: ^bool, archiveId: FS_ArchiveID, path: FS_Path) -> Result ---
    FSUSER_CreateSystemSaveData  :: proc(info: FS_SystemSaveDataInfo, totalSize, blockSize, directories, files, directoryBuckets, fileBuckets: u32, duplicateData: bool) -> Result ---
    FSUSER_DeleteSystemSaveData  :: proc(info: FS_SystemSaveDataInfo) -> Result ---
    FSUSER_SetSaveDataSecureValue :: proc(value: u64, slot: FS_SecureValueSlot, titleUniqueId: u32, titleVariation: u8) -> Result ---
    FSUSER_GetSaveDataSecureValue :: proc(exists: ^bool, value: ^u64, slot: FS_SecureValueSlot, titleUniqueId: u32, titleVariation: u8) -> Result ---
    FSUSER_ControlSecureSave     :: proc(action: FS_SecureSaveAction, input: rawptr, inputSize: u32, output: rawptr, outputSize: u32) -> Result ---

    // Ext save data
    FSUSER_CreateExtSaveData     :: proc(info: FS_ExtSaveDataInfo, directories, files: u32, sizeLimit: u64, smdhSize: u32, smdh: ^u8) -> Result ---
    FSUSER_DeleteExtSaveData     :: proc(info: FS_ExtSaveDataInfo) -> Result ---
    FSUSER_EnumerateExtSaveData  :: proc(idsWritten: ^u32, idsSize: u32, mediaType: FS_MediaType, idSize: u32, shared: bool, ids: ^u8) -> Result ---
    FSUSER_GetExtDataBlockSize   :: proc(totalBlocks, freeBlocks: ^u64, blockSize: ^u32, info: FS_ExtSaveDataInfo) -> Result ---

    // Process / title info
    FSUSER_GetProductInfo        :: proc(info: ^FS_ProductInfo, processId: u32) -> Result ---
    FSUSER_GetProgramLaunchInfo  :: proc(info: ^FS_ProgramInfo, processId: u32) -> Result ---
    FSUSER_AbnegateAccessRight   :: proc(accessRight: u32) -> Result ---
    FSUSER_GetSdmcFatfsError     :: proc(err: ^u32) -> Result ---
    FSUSER_QueryTotalQuotaSize   :: proc(quotaSize: ^u64, directories, files, fileSizeCount: u32, fileSizes: ^u64) -> Result ---
    FSUSER_UpdateSha256Context   :: proc(data: rawptr, inputSize: u32, hash: ^u8) -> Result ---
    FSUSER_InitializeWithSdkVersion :: proc(session: Handle, version: u32) -> Result ---
    FSUSER_SetPriority           :: proc(priority: u32) -> Result ---
    FSUSER_GetPriority           :: proc(priority: ^u32) -> Result ---

    // ── FSFILE — file handle operations ───────────────────────
    FSFILE_Control       :: proc(handle: Handle, action: u32, input: rawptr, inputSize: u32, output: rawptr, outputSize: u32) -> Result ---
    FSFILE_OpenSubFile   :: proc(handle: Handle, subFile: ^Handle, offset, size: u64) -> Result ---
    FSFILE_Read          :: proc(handle: Handle, bytesRead: ^u32, offset: u64, buffer: rawptr, size: u32) -> Result ---
    FSFILE_Write         :: proc(handle: Handle, bytesWritten: ^u32, offset: u64, buffer: rawptr, size, flags: u32) -> Result ---
    FSFILE_GetSize       :: proc(handle: Handle, size: ^u64) -> Result ---
    FSFILE_SetSize       :: proc(handle: Handle, size: u64) -> Result ---
    FSFILE_GetAttributes :: proc(handle: Handle, attributes: ^u32) -> Result ---
    FSFILE_SetAttributes :: proc(handle: Handle, attributes: u32) -> Result ---
    FSFILE_Close         :: proc(handle: Handle) -> Result ---
    FSFILE_Flush         :: proc(handle: Handle) -> Result ---
    FSFILE_SetPriority   :: proc(handle: Handle, priority: u32) -> Result ---
    FSFILE_GetPriority   :: proc(handle: Handle, priority: ^u32) -> Result ---
    FSFILE_OpenLinkFile  :: proc(handle: Handle, linkFile: ^Handle) -> Result ---

    // ── FSDIR — directory handle operations ───────────────────
    FSDIR_Control     :: proc(handle: Handle, action: u32, input: rawptr, inputSize: u32, output: rawptr, outputSize: u32) -> Result ---
    FSDIR_Read        :: proc(handle: Handle, entriesRead: ^u32, entryCount: u32, entries: ^FS_DirectoryEntry) -> Result ---
    FSDIR_Close       :: proc(handle: Handle) -> Result ---
    FSDIR_SetPriority :: proc(handle: Handle, priority: u32) -> Result ---
    FSDIR_GetPriority :: proc(handle: Handle, priority: ^u32) -> Result ---
}
