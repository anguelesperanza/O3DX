package ctru

// ============================================================
// AM — application manager
// 3ds/services/am.h
//
// Lists, installs and deletes titles and tickets.
// ============================================================

// Contains basic information about a title.
AM_TitleEntry :: struct {
    titleID: u64, // The title's ID.
    size:    u64, // The title's installed size.
    version: u16, // The title's version.
    unk:     [6]u8, // Unknown title data.
}

// Pending title status mask values.
AM_STATUS_MASK_INSTALLING            :: 1 // Titles currently installing.
AM_STATUS_MASK_AWAITING_FINALIZATION :: 2 // Titles awaiting finalization.

// Pending title status values.
AM_InstallStatus :: enum u16 {
    ABORTED               = 0x2, // Install aborted.
    SAVED                 = 0x3, // Title saved, but not installed.
    INSTALL_IN_PROGRESS   = 0x802, // Install in progress.
    AWAITING_FINALIZATION = 0x803, // Awaiting finalization.
}

AM_PendingTitleEntry :: struct {
    titleId:   u64, // Title ID
    version:   u16, // Version
    status:    u16, // AM_InstallStatus
    titleType: u32, // Title Type
    unk:       [0x8]u8, // Unknown
}

// Pending title deletion flags.
AM_DELETE_PENDING_NON_SYSTEM :: 1 // Non-system titles.
AM_DELETE_PENDING_SYSTEM     :: 2 // System titles.

// Information about the TWL NAND partition.
AM_TWLPartitionInfo :: struct {
    capacity:        u64, // Total capacity.
    freeSpace:       u64, // Total free space.
    titlesCapacity:  u64, // Capacity for titles.
    titlesFreeSpace: u64, // Free space for titles.
}

// Contains information about a title's content.
AM_ContentInfo :: struct {
    index:     u16, // Index of the content in the title.
    type_:     u16, // ?
    contentId: u32, // ID of the content in the title.
    size:      u64, // Size of the content in the title.
    flags:     u8, // AM_ContentInfoFlags
    padding:   [7]u8, // Padding
}

// Title ContentInfo flags.
AM_ContentInfoFlags :: enum u8 {
    DOWNLOADED = 1, // ?
    OWNED      = 2, // ?
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes AM. This doesn't initialize with "am:app", see amAppInit().
    amInit :: proc() -> Result ---

    // Initializes AM with a service which has access to the amapp-commands. This should only be
    // used when using the amapp commands, not non-amapp AM commands.
    amAppInit :: proc() -> Result ---

    // Exits AM.
    amExit :: proc() ---

    // Gets the current AM session handle.
    amGetSessionHandle :: proc() -> ^Handle ---

    // Gets the number of titles for a given media type.
    AM_GetTitleCount :: proc(mediatype: FS_MediaType, count: ^u32) -> Result ---

    // Gets a list of title IDs present in a mediatype.
    AM_GetTitleList :: proc(titlesRead: ^u32, mediatype: FS_MediaType, titleCount: u32, titleIds: ^u64) -> Result ---

    // Gets a list of details about installed titles.
    AM_GetTitleInfo :: proc(mediatype: FS_MediaType, titleCount: u32, titleIds: ^u64, titleInfo: ^AM_TitleEntry) -> Result ---

    // Gets the number of tickets installed on the system.
    AM_GetTicketCount :: proc(count: ^u32) -> Result ---

    // Gets a list of tickets installed on the system.
    AM_GetTicketList :: proc(ticketsRead: ^u32, ticketCount: u32, skip: u32, ticketIds: ^u64) -> Result ---

    // Gets the number of pending titles on this system.
    AM_GetPendingTitleCount :: proc(count: ^u32, mediatype: FS_MediaType, statusMask: u32) -> Result ---

    // Gets a list of pending titles on this system.
    AM_GetPendingTitleList :: proc(titlesRead: ^u32, titleCount: u32, mediatype: FS_MediaType, statusMask: u32, titleIds: ^u64) -> Result ---

    // Gets information about pending titles on this system.
    AM_GetPendingTitleInfo :: proc(titleCount: u32, mediatype: FS_MediaType, titleIds: ^u64, titleInfo: ^AM_PendingTitleEntry) -> Result ---

    // Gets a 32-bit device-specific ID.
    AM_GetDeviceId :: proc(deviceID: ^u32) -> Result ---

    // Exports DSiWare to the specified filepath.
    AM_ExportTwlBackup :: proc(titleID: u64, operation: u8, workbuf: rawptr, workbuf_size: u32, filepath: cstring) -> Result ---

    // Imports DSiWare from the specified file.
    AM_ImportTwlBackup :: proc(filehandle: Handle, operation: u8, buffer: rawptr, size: u32) -> Result ---

    // Reads info from the specified DSiWare export file. This can only be used with DSiWare
    // exported with certain operation value(s).
    AM_ReadTwlBackupInfo :: proc(filehandle: Handle, outinfo: rawptr, outinfo_size: u32, workbuf: rawptr, workbuf_size: u32, banner: rawptr, banner_size: u32) -> Result ---

    // Retrieves information about the NAND TWL partition.
    AM_GetTWLPartitionInfo :: proc(info: ^AM_TWLPartitionInfo) -> Result ---

    // Initializes the CIA install process, returning a handle to write CIA data to.
    AM_StartCiaInstall :: proc(mediatype: FS_MediaType, ciaHandle: ^Handle) -> Result ---

    // Initializes the CIA install process for Download Play CIAs, returning a handle to write CIA
    // data to.
    AM_StartDlpChildCiaInstall :: proc(ciaHandle: ^Handle) -> Result ---

    // Aborts the CIA install process.
    AM_CancelCIAInstall :: proc(ciaHandle: Handle) -> Result ---

    // Finalizes the CIA install process.
    AM_FinishCiaInstall :: proc(ciaHandle: Handle) -> Result ---

    // Finalizes the CIA install process without committing the title to title.db or tmp*.db.
    AM_FinishCiaInstallWithoutCommit :: proc(ciaHandle: Handle) -> Result ---

    // Commits installed CIAs.
    AM_CommitImportPrograms :: proc(mediaType: FS_MediaType, titleCount: u32, temp: bool, titleIds: ^u64) -> Result ---

    // Deletes a title.
    AM_DeleteTitle :: proc(mediatype: FS_MediaType, titleID: u64) -> Result ---

    // Deletes a title, provided that it is not a system title.
    AM_DeleteAppTitle :: proc(mediatype: FS_MediaType, titleID: u64) -> Result ---

    // Deletes a ticket.
    AM_DeleteTicket :: proc(ticketId: u64) -> Result ---

    // Deletes a pending title.
    AM_DeletePendingTitle :: proc(mediatype: FS_MediaType, titleId: u64) -> Result ---

    // Deletes pending titles.
    AM_DeletePendingTitles :: proc(mediatype: FS_MediaType, flags: u32) -> Result ---

    // Deletes all pending titles.
    AM_DeleteAllPendingTitles :: proc(mediatype: FS_MediaType) -> Result ---

    // Installs the current NATIVE_FIRM title to NAND (firm0:/ & firm1:/)
    AM_InstallNativeFirm :: proc() -> Result ---

    // Installs a NATIVE_FIRM title to NAND. Accepts 0004013800000002 or 0004013820000002 (N3DS).
    AM_InstallFirm :: proc(titleID: u64) -> Result ---

    // Gets the product code of a title.
    AM_GetTitleProductCode :: proc(mediatype: FS_MediaType, titleId: u64, productCode: [^]u8) -> Result ---

    // Gets the ext data ID of a title.
    AM_GetTitleExtDataId :: proc(extDataId: ^u64, mediatype: FS_MediaType, titleId: u64) -> Result ---

    // Gets an AM_TitleEntry instance for a CIA file.
    AM_GetCiaFileInfo :: proc(mediatype: FS_MediaType, titleEntry: ^AM_TitleEntry, fileHandle: Handle) -> Result ---

    // Gets the SMDH icon data of a CIA file.
    AM_GetCiaIcon :: proc(icon: rawptr, fileHandle: Handle) -> Result ---

    // Gets the title ID dependency list of a CIA file.
    AM_GetCiaDependencies :: proc(dependencies: ^u64, fileHandle: Handle) -> Result ---

    // Gets the meta section offset of a CIA file.
    AM_GetCiaMetaOffset :: proc(metaOffset: ^u64, fileHandle: Handle) -> Result ---

    // Gets the core version of a CIA file.
    AM_GetCiaCoreVersion :: proc(coreVersion: ^u32, fileHandle: Handle) -> Result ---

    // Gets the free space, in bytes, required to install a CIA file.
    AM_GetCiaRequiredSpace :: proc(requiredSpace: ^u64, mediaType: FS_MediaType, fileHandle: Handle) -> Result ---

    // Gets the full meta section of a CIA file.
    AM_GetCiaMetaSection :: proc(meta: rawptr, size: u32, fileHandle: Handle) -> Result ---

    // Initializes the external (SD) title database.
    AM_InitializeExternalTitleDatabase :: proc(overwrite: bool) -> Result ---

    // Queries whether the external title database is available.
    AM_QueryAvailableExternalTitleDatabase :: proc(available: ^bool) -> Result ---

    // Begins installing a ticket.
    AM_InstallTicketBegin :: proc(ticketHandle: ^Handle) -> Result ---

    // Aborts installing a ticket.
    AM_InstallTicketAbort :: proc(ticketHandle: Handle) -> Result ---

    // Finishes installing a ticket.
    AM_InstallTicketFinish :: proc(ticketHandle: Handle) -> Result ---

    // Begins installing a title.
    AM_InstallTitleBegin :: proc(mediaType: FS_MediaType, titleId: u64, unk: bool) -> Result ---

    // Stops installing a title, generally to be resumed later.
    AM_InstallTitleStop :: proc() -> Result ---

    // Resumes installing a title.
    AM_InstallTitleResume :: proc(mediaType: FS_MediaType, titleId: u64) -> Result ---

    // Aborts installing a title.
    AM_InstallTitleAbort :: proc() -> Result ---

    // Finishes installing a title.
    AM_InstallTitleFinish :: proc() -> Result ---

    // Commits installed titles.
    AM_CommitImportTitles :: proc(mediaType: FS_MediaType, titleCount: u32, temp: bool, titleIds: ^u64) -> Result ---

    // Begins installing a TMD.
    AM_InstallTmdBegin :: proc(tmdHandle: ^Handle) -> Result ---

    // Aborts installing a TMD.
    AM_InstallTmdAbort :: proc(tmdHandle: Handle) -> Result ---

    // Finishes installing a TMD.
    AM_InstallTmdFinish :: proc(tmdHandle: Handle, unk: bool) -> Result ---

    // Prepares to import title contents.
    AM_CreateImportContentContexts :: proc(contentCount: u32, contentIndices: ^u16) -> Result ---

    // Begins installing title content.
    AM_InstallContentBegin :: proc(contentHandle: ^Handle, index: u16) -> Result ---

    // Stops installing title content, generally to be resumed later.
    AM_InstallContentStop :: proc(contentHandle: Handle) -> Result ---

    // Resumes installing title content.
    AM_InstallContentResume :: proc(contentHandle: ^Handle, resumeOffset: ^u64, index: u16) -> Result ---

    // Cancels installing title content.
    AM_InstallContentCancel :: proc(contentHandle: Handle) -> Result ---

    // Finishes installing title content.
    AM_InstallContentFinish :: proc(contentHandle: Handle) -> Result ---

    // Imports up to four certificates into the ticket certificate chain.
    AM_ImportCertificates :: proc(cert1Size: u32, cert1: rawptr, cert2Size: u32, cert2: rawptr, cert3Size: u32, cert3: rawptr, cert4Size: u32, cert4: rawptr) -> Result ---

    // Imports a certificate into the ticket certificate chain.
    AM_ImportCertificate :: proc(certSize: u32, cert: rawptr) -> Result ---

    // Commits installed titles, and updates FIRM if necessary.
    AM_CommitImportTitlesAndUpdateFirmwareAuto :: proc(mediaType: FS_MediaType, titleCount: u32, temp: bool, titleIds: ^u64) -> Result ---

    // Resets play count of all installed demos by deleting their launch info.
    AM_DeleteAllDemoLaunchInfos :: proc() -> Result ---

    // Deletes temporary titles.
    AM_DeleteAllTemporaryTitles :: proc() -> Result ---

    // Deletes all expired titles.
    AM_DeleteAllExpiredTitles :: proc(mediatype: FS_MediaType) -> Result ---

    // Deletes all TWL titles.
    AM_DeleteAllTwlTitles :: proc() -> Result ---

    // Gets the number of content index installed under the specified DLC title.
    AMAPP_GetDLCContentInfoCount :: proc(count: ^u32, mediatype: FS_MediaType, titleID: u64) -> Result ---

    // Gets content infos installed under the specified DLC title.
    AMAPP_ListDLCContentInfos :: proc(contentInfoRead: ^u32, mediatype: FS_MediaType, titleID: u64, contentInfoCount: u32, offset: u32, contentInfos: ^AM_ContentInfo) -> Result ---
}
