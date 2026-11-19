package ctru

// ============================================================
// NIM — network installation manager
// 3ds/services/nim.h
//
// Downloads and installs titles from the eShop servers.
// ============================================================

// Mode that NIM downloads/installs a title with.
NIM_InstallationMode :: enum u8 {
    DEFAULT   = 0, // Initial installation
    UNKNOWN1  = 1, // Unknown
    UNKNOWN2  = 2, // Unknown
    REINSTALL = 3, // Reinstall currently installed title; use this if the title is already installed (including updates)
}

// Current state of a NIM download/installation.
NIM_DownloadState :: enum u8 {
    NOT_INITIALIZED   = 0x0, // Download not yet initialized
    INITIALIZED       = 0x1, // Download initialized
    DOWNLOAD_TMD      = 0x2, // Downloading and installing TMD
    PREPARE_SAVE_DATA = 0x3, // Initializing save data
    DOWNLOAD_CONTENTS = 0x4, // Downloading and installing contents
    WAIT_COMMIT       = 0x5, // Waiting before calling AM_CommitImportTitles
    COMMITTING        = 0x6, // Running AM_CommitImportTitles
    FINISHED          = 0x7, // Title installation finished
    VERSION_ERROR     = 0x8, // (unknown error regarding title version)
    CREATE_CONTEXT    = 0x9, // Creating the .ctx file?
    CANNOT_RECOVER    = 0xA, // Irrecoverable error encountered (e.g. out of space)
    INVALID           = 0xB, // Invalid state
}

// Input configuration for NIM download/installation tasks.
NIM_TitleConfig :: struct {
    titleId:   u64, // Title ID
    version:   u32, // Title version
    unknown_0: u32, // Always 0
    ratingAge: u8, // Age for the HOME Menu parental controls
    mediaType: u8, // Media type, see FS_MediaType enum
    padding:   [2]u8, // Padding
    unknown_1: u32, // Unknown input, seems to be always 0
}

// Output struct for NIM downloads/installations in progress.
NIM_TitleProgress :: struct {
    state:          u32, // State, see NIM_DownloadState enum
    lastResult:     Result, // Last result code in NIM
    downloadedSize: u64, // Amount of bytes that have been downloaded
    totalSize:      u64, // Amount of bytes that need to be downloaded in total
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes nim:s. This uses networking and is blocking.
    nimsInit :: proc(buffer: rawptr, buffer_len: uint) -> Result ---

    // Initializes nim:s with the given TIN. This uses networking and is blocking.
    nimsInitWithTIN :: proc(buffer: rawptr, buffer_len: uint, TIN: cstring) -> Result ---

    // Exits nim:s.
    nimsExit :: proc() ---

    // Gets the current nim:s session handle.
    nimsGetSessionHandle :: proc() -> ^Handle ---

    // Sets an attribute.
    NIMS_SetAttribute :: proc(attr: cstring, val: cstring) -> Result ---

    // Checks if nim wants a system update.
    NIMS_WantUpdate :: proc(want_update: ^bool) -> Result ---

    // Makes a TitleConfig struct for use with
    NIMS_MakeTitleConfig :: proc(cfg: ^NIM_TitleConfig, titleId: u64, version: u32, ratingAge: u8, mediaType: FS_MediaType) ---

    // Registers a background download task with NIM. These are processed in sleep mode only.
    NIMS_RegisterTask :: proc(cfg: ^NIM_TitleConfig, name: cstring, maker: cstring) -> Result ---

    // Checks whether a background download task for the given title is registered with NIM.
    NIMS_IsTaskRegistered :: proc(titleId: u64, registered: ^bool) -> Result ---

    // Unregisters a background download task.
    NIMS_UnregisterTask :: proc(titleId: u64) -> Result ---

    // Starts an active download with NIM. Progress can be checked with
    NIMS_StartDownload :: proc(cfg: ^NIM_TitleConfig, mode: NIM_InstallationMode) -> Result ---

    // Starts an active download with NIM with default installation mode; cannot reinstall titles.
    // Progress can be checked with
    NIMS_StartDownloadSimple :: proc(cfg: ^NIM_TitleConfig) -> Result ---

    // Checks the status of the current active download.
    NIMS_GetProgress :: proc(tp: ^NIM_TitleProgress) -> Result ---

    // Cancels the current active download with NIM.
    NIMS_CancelDownload :: proc() -> Result ---
}
