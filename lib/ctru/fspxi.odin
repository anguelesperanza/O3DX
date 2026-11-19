package ctru

// ============================================================
// FS-PXI, fs:REG and PXIDEV
// 3ds/services/fspxi.h, 3ds/services/fsreg.h, 3ds/services/pxidev.h
//
// The ARM9 side of the filesystem, program registration, and raw card-SPI access.
// ============================================================

FSPXI_Archive :: u64

FSPXI_File :: u64

FSPXI_Directory :: u64

// Card SPI wait operation type.
PXIDEV_WaitType :: enum u8 {
    NONE          = 0, // Do not wait.
    SLEEP         = 1, // Sleep for the specified number of nanoseconds.
    IREQ_RETURN   = 2, // Wait for IREQ, return if timeout.
    IREQ_CONTINUE = 3, // Wait for IREQ, continue if timeout.
}

// Card SPI register deassertion type.
PXIDEV_DeassertType :: enum u8 {
    NONE        = 0, // Do not deassert.
    BEFORE_WAIT = 1, // Deassert before waiting.
    AFTER_WAIT  = 2, // Deassert after waiting.
}

// Card SPI transfer buffer.
PXIDEV_SPIBuffer :: struct {
    ptr:            rawptr, // Data pointer.
    size:           u32, // Data size.
    transferOption: u8, // Transfer options. See pxiDevMakeTransferOption
    waitOperation:  u64, // Wait operation. See pxiDevMakeWaitOperation
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Opens a file.
    FSPXI_OpenFile :: proc(serviceHandle: Handle, out: ^FSPXI_File, archive: FSPXI_Archive, path: FS_Path, flags: u32, attributes: u32) -> Result ---

    // Deletes a file.
    FSPXI_DeleteFile :: proc(serviceHandle: Handle, archive: FSPXI_Archive, path: FS_Path) -> Result ---

    // Renames a file.
    FSPXI_RenameFile :: proc(serviceHandle: Handle, srcArchive: FSPXI_Archive, srcPath: FS_Path, dstArchive: FSPXI_Archive, dstPath: FS_Path) -> Result ---

    // Deletes a directory.
    FSPXI_DeleteDirectory :: proc(serviceHandle: Handle, archive: FSPXI_Archive, path: FS_Path) -> Result ---

    // Creates a file.
    FSPXI_CreateFile :: proc(serviceHandle: Handle, archive: FSPXI_Archive, path: FS_Path, attributes: u32, fileSize: u64) -> Result ---

    // Creates a directory.
    FSPXI_CreateDirectory :: proc(serviceHandle: Handle, archive: FSPXI_Archive, path: FS_Path, attributes: u32) -> Result ---

    // Renames a directory.
    FSPXI_RenameDirectory :: proc(serviceHandle: Handle, srcArchive: FSPXI_Archive, srcPath: FS_Path, dstArchive: FSPXI_Archive, dstPath: FS_Path) -> Result ---

    // Opens a directory.
    FSPXI_OpenDirectory :: proc(serviceHandle: Handle, out: ^FSPXI_Directory, archive: FSPXI_Archive, path: FS_Path) -> Result ---

    // Reads from a file.
    FSPXI_ReadFile :: proc(serviceHandle: Handle, file: FSPXI_File, bytesRead: ^u32, offset: u64, buffer: rawptr, size: u32) -> Result ---

    // Calculate SHA256 of a file.
    FSPXI_CalculateFileHashSHA256 :: proc(serviceHandle: Handle, file: FSPXI_File, buffer: rawptr, size: u32) -> Result ---

    // Writes to a file.
    FSPXI_WriteFile :: proc(serviceHandle: Handle, file: FSPXI_File, bytesWritten: ^u32, offset: u64, buffer: rawptr, size: u32, flags: u32) -> Result ---

    // Calculates the MAC used in a DISA/DIFF header?
    FSPXI_CalcSavegameMAC :: proc(serviceHandle: Handle, file: FSPXI_File, inBuffer: rawptr, inSize: u32, outBuffer: rawptr, outSize: u32) -> Result ---

    // Get size of a file
    FSPXI_GetFileSize :: proc(serviceHandle: Handle, file: FSPXI_File, size: ^u64) -> Result ---

    // Set size of a file
    FSPXI_SetFileSize :: proc(serviceHandle: Handle, file: FSPXI_File, size: u64) -> Result ---

    // Close a file
    FSPXI_CloseFile :: proc(serviceHandle: Handle, file: FSPXI_File) -> Result ---

    // Reads one or more directory entries.
    FSPXI_ReadDirectory :: proc(serviceHandle: Handle, directory: FSPXI_Directory, entriesRead: ^u32, entryCount: u32, entries: ^FS_DirectoryEntry) -> Result ---

    // Close a directory
    FSPXI_CloseDirectory :: proc(serviceHandle: Handle, directory: FSPXI_Directory) -> Result ---

    // Opens an archive.
    FSPXI_OpenArchive :: proc(serviceHandle: Handle, archive: ^FSPXI_Archive, archiveID: FS_ArchiveID, path: FS_Path) -> Result ---

    // Checks if the archive contains a file at path.
    FSPXI_HasFile :: proc(serviceHandle: Handle, archive: FSPXI_Archive, out: ^bool, path: FS_Path) -> Result ---

    // Checks if the archive contains a directory at path.
    FSPXI_HasDirectory :: proc(serviceHandle: Handle, archive: FSPXI_Archive, out: ^bool, path: FS_Path) -> Result ---

    // Commits an archive's save data.
    FSPXI_CommitSaveData :: proc(serviceHandle: Handle, archive: FSPXI_Archive, id: u32) -> Result ---

    // Close an archive
    FSPXI_CloseArchive :: proc(serviceHandle: Handle, archive: FSPXI_Archive) -> Result ---

    // Unknown 0x17. Appears to be an "is archive handle valid" command?
    FSPXI_Unknown0x17 :: proc(serviceHandle: Handle, archive: FSPXI_Archive, out: ^bool) -> Result ---

    // Gets the inserted card type.
    FSPXI_GetCardType :: proc(serviceHandle: Handle, out: ^FS_CardType) -> Result ---

    // Gets the SDMC archive resource information.
    FSPXI_GetSdmcArchiveResource :: proc(serviceHandle: Handle, out: ^FS_ArchiveResource) -> Result ---

    // Gets the NAND archive resource information.
    FSPXI_GetNandArchiveResource :: proc(serviceHandle: Handle, out: ^FS_ArchiveResource) -> Result ---

    // Gets the error code from the SDMC FatFS driver
    FSPXI_GetSdmcFatFsError :: proc(serviceHandle: Handle, out: ^u32) -> Result ---

    // Gets whether PXIFS0 detects the SD
    FSPXI_IsSdmcDetected :: proc(serviceHandle: Handle, out: ^bool) -> Result ---

    // Gets whether PXIFS0 can write to the SD
    FSPXI_IsSdmcWritable :: proc(serviceHandle: Handle, out: ^bool) -> Result ---

    // Gets the SDMC CID
    FSPXI_GetSdmcCid :: proc(serviceHandle: Handle, out: rawptr, size: u32) -> Result ---

    // Gets the NAND CID
    FSPXI_GetNandCid :: proc(serviceHandle: Handle, out: rawptr, size: u32) -> Result ---

    // Gets the SDMC speed info
    FSPXI_GetSdmcSpeedInfo :: proc(serviceHandle: Handle, out: ^FS_SdMmcSpeedInfo) -> Result ---

    // Gets the NAND speed info
    FSPXI_GetNandSpeedInfo :: proc(serviceHandle: Handle, out: ^FS_SdMmcSpeedInfo) -> Result ---

    // Gets the SDMC log
    FSPXI_GetSdmcLog :: proc(serviceHandle: Handle, out: rawptr, size: u32) -> Result ---

    // Gets the NAND log
    FSPXI_GetNandLog :: proc(serviceHandle: Handle, out: rawptr, size: u32) -> Result ---

    // Clears the SDMC log
    FSPXI_ClearSdmcLog :: proc(serviceHandle: Handle) -> Result ---

    // Clears the NAND log
    FSPXI_ClearNandLog :: proc(serviceHandle: Handle) -> Result ---

    // Gets whether a card is inserted.
    FSPXI_CardSlotIsInserted :: proc(serviceHandle: Handle, inserted: ^bool) -> Result ---

    // Powers on the card slot.
    FSPXI_CardSlotPowerOn :: proc(serviceHandle: Handle, status: ^bool) -> Result ---

    // Powers off the card slot.
    FSPXI_CardSlotPowerOff :: proc(serviceHandle: Handle, status: ^bool) -> Result ---

    // Gets the card's power status.
    FSPXI_CardSlotGetCardIFPowerStatus :: proc(serviceHandle: Handle, status: ^bool) -> Result ---

    // Executes a CARDNOR direct command.
    FSPXI_CardNorDirectCommand :: proc(serviceHandle: Handle, commandId: u8) -> Result ---

    // Executes a CARDNOR direct command with an address.
    FSPXI_CardNorDirectCommandWithAddress :: proc(serviceHandle: Handle, commandId: u8, address: u32) -> Result ---

    // Executes a CARDNOR direct read.
    FSPXI_CardNorDirectRead :: proc(serviceHandle: Handle, commandId: u8, size: u32, output: rawptr) -> Result ---

    // Executes a CARDNOR direct read with an address.
    FSPXI_CardNorDirectReadWithAddress :: proc(serviceHandle: Handle, commandId: u8, address: u32, size: u32, output: rawptr) -> Result ---

    // Executes a CARDNOR direct write.
    FSPXI_CardNorDirectWrite :: proc(serviceHandle: Handle, commandId: u8, size: u32, input: rawptr) -> Result ---

    // Executes a CARDNOR direct write with an address.
    FSPXI_CardNorDirectWriteWithAddress :: proc(serviceHandle: Handle, commandId: u8, address: u32, size: u32, input: rawptr) -> Result ---

    // Executes a CARDNOR 4xIO direct read.
    FSPXI_CardNorDirectRead_4xIO :: proc(serviceHandle: Handle, commandId: u8, address: u32, size: u32, output: rawptr) -> Result ---

    // Executes a CARDNOR direct CPU write without verify.
    FSPXI_CardNorDirectCpuWriteWithoutVerify :: proc(serviceHandle: Handle, address: u32, size: u32, input: rawptr) -> Result ---

    // Executes a CARDNOR direct sector erase without verify.
    FSPXI_CardNorDirectSectorEraseWithoutVerify :: proc(serviceHandle: Handle, address: u32) -> Result ---

    // Gets an NCCH's product info
    FSPXI_GetProductInfo :: proc(serviceHandle: Handle, info: ^FS_ProductInfo, archive: FSPXI_Archive) -> Result ---

    // Sets the CARDSPI baud rate.
    FSPXI_SetCardSpiBaudrate :: proc(serviceHandle: Handle, baudRate: FS_CardSpiBaudRate) -> Result ---

    // Sets the CARDSPI bus mode.
    FSPXI_SetCardSpiBusMode :: proc(serviceHandle: Handle, busMode: FS_CardSpiBusMode) -> Result ---

    // Sends initialization info to ARM9
    FSPXI_SendInitializeInfoTo9 :: proc(serviceHandle: Handle, unk: u8) -> Result ---

    // Creates ext save data.
    FSPXI_CreateExtSaveData :: proc(serviceHandle: Handle, info: FS_ExtSaveDataInfo) -> Result ---

    // Deletes ext save data.
    FSPXI_DeleteExtSaveData :: proc(serviceHandle: Handle, info: FS_ExtSaveDataInfo) -> Result ---

    // Enumerates ext save data.
    FSPXI_EnumerateExtSaveData :: proc(serviceHandle: Handle, idsWritten: ^u32, idsSize: u32, mediaType: FS_MediaType, idSize: u32, shared: bool, ids: ^u8) -> Result ---

    // Gets a special content's index.
    FSPXI_GetSpecialContentIndex :: proc(serviceHandle: Handle, index: ^u16, mediaType: FS_MediaType, programId: u64, type_: FS_SpecialContentType) -> Result ---

    // Gets the legacy ROM header of a program.
    FSPXI_GetLegacyRomHeader :: proc(serviceHandle: Handle, mediaType: FS_MediaType, programId: u64, header: rawptr) -> Result ---

    // Gets the legacy banner data of a program.
    FSPXI_GetLegacyBannerData :: proc(serviceHandle: Handle, mediaType: FS_MediaType, programId: u64, banner: rawptr, unk: u8) -> Result ---

    // Formats the CARDNOR device.
    FSPXI_FormatCardNorDevice :: proc(serviceHandle: Handle, unk: u32) -> Result ---

    // Deletes the 3DS SDMC root.
    FSPXI_DeleteSdmcRoot :: proc(serviceHandle: Handle) -> Result ---

    // Deletes all ext save data on the NAND.
    FSPXI_DeleteAllExtSaveDataOnNand :: proc(serviceHandle: Handle) -> Result ---

    // Initializes the CTR file system.
    FSPXI_InitializeCtrFilesystem :: proc(serviceHandle: Handle) -> Result ---

    // Creates the FS seed.
    FSPXI_CreateSeed :: proc(serviceHandle: Handle) -> Result ---

    // Gets the CTR SDMC root path.
    FSPXI_GetSdmcCtrRootPath :: proc(serviceHandle: Handle, out: ^u16, length: u32) -> Result ---

    // Gets an archive's resource information.
    FSPXI_GetArchiveResource :: proc(serviceHandle: Handle, archiveResource: ^FS_ArchiveResource, mediaType: FS_SystemMediaType) -> Result ---

    // Exports the integrity verification seed.
    FSPXI_ExportIntegrityVerificationSeed :: proc(serviceHandle: Handle, seed: ^FS_IntegrityVerificationSeed) -> Result ---

    // Imports an integrity verification seed.
    FSPXI_ImportIntegrityVerificationSeed :: proc(serviceHandle: Handle, seed: ^FS_IntegrityVerificationSeed) -> Result ---

    // Gets the legacy sub banner data of a program.
    FSPXI_GetLegacySubBannerData :: proc(serviceHandle: Handle, bannerSize: u32, mediaType: FS_MediaType, programId: u64, banner: rawptr) -> Result ---

    // Generates random bytes. Uses same code as PSPXI_GenerateRandomBytes
    FSPXI_GenerateRandomBytes :: proc(serviceHandle: Handle, buffer: rawptr, size: u32) -> Result ---

    // Gets the last modified time of a file in an archive.
    FSPXI_GetFileLastModified :: proc(serviceHandle: Handle, archive: FSPXI_Archive, out: ^u64, path: ^u16, size: u32) -> Result ---

    // Reads from a special file.
    FSPXI_ReadSpecialFile :: proc(serviceHandle: Handle, bytesRead: ^u32, fileOffset: u64, size: u32, data: rawptr) -> Result ---

    // Gets the size of a special file.
    FSPXI_GetSpecialFileSize :: proc(serviceHandle: Handle, fileSize: ^u64) -> Result ---

    // Initiates a device move as the source device.
    FSPXI_StartDeviceMoveAsSource :: proc(serviceHandle: Handle, context_: ^FS_DeviceMoveContext) -> Result ---

    // Initiates a device move as the destination device.
    FSPXI_StartDeviceMoveAsDestination :: proc(serviceHandle: Handle, context_: FS_DeviceMoveContext, clear: bool) -> Result ---

    // Reads data and stores SHA256 hashes of blocks
    FSPXI_ReadFileSHA256 :: proc(serviceHandle: Handle, file: FSPXI_File, bytesRead: ^u32, offset: u64, readBuffer: rawptr, readBufferSize: u32, hashtable: rawptr, hashtableSize: u32, unk: u32) -> Result ---

    // Assumedly writes data and stores SHA256 hashes of blocks
    FSPXI_WriteFileSHA256 :: proc(serviceHandle: Handle, file: FSPXI_File, bytesWritten: ^u32, offset: u64, writeBuffer: rawptr, writeBufferSize: u32, hashtable: rawptr, hashtableSize: u32, unk1: u32, unk2: u32) -> Result ---

    // Configures CTRCARD latency emulation.
    FSPXI_SetCtrCardLatencyParameter :: proc(serviceHandle: Handle, latency: u64) -> Result ---

    // Sets the file system priority.
    FSPXI_SetPriority :: proc(serviceHandle: Handle, priority: u32) -> Result ---

    // Toggles cleaning up invalid save data.
    FSPXI_SwitchCleanupInvalidSaveData :: proc(serviceHandle: Handle, enable: bool) -> Result ---

    // Enumerates system save data.
    FSPXI_EnumerateSystemSaveData :: proc(serviceHandle: Handle, idsWritten: ^u32, idsSize: u32, ids: ^u32) -> Result ---

    // Reads the NAND report.
    FSPXI_ReadNandReport :: proc(serviceHandle: Handle, buffer: rawptr, size: u32, unk: u32) -> Result ---

    // Unknown command 0x56
    FSPXI_Unknown0x56 :: proc(serviceHandle: Handle, out: [^]u32, archive: FS_Archive, path: FS_Path) -> Result ---

    // Initializes fs:REG.
    fsRegInit :: proc() -> Result ---

    // Exits fs:REG.
    fsRegExit :: proc() ---

    // Gets the current fs:REG session handle.
    fsRegGetSessionHandle :: proc() -> ^Handle ---

    // Registers a program's storage information.
    FSREG_Register :: proc(pid: u32, programHandle: u64, programInfo: ^FS_ProgramInfo, storageInfo: ^ExHeader_Arm11StorageInfo) -> Result ---

    // Unregisters a program's storage information.
    FSREG_Unregister :: proc(pid: u32) -> Result ---

    // Retrives the exheader information set(s) (SCI+ACI) about a program.
    FSREG_GetProgramInfo :: proc(exheaderInfos: ^ExHeader_Info, maxNumEntries: u32, programHandle: u64) -> Result ---

    // Loads a program.
    FSREG_LoadProgram :: proc(programHandle: ^u64, programInfo: ^FS_ProgramInfo) -> Result ---

    // Unloads a program.
    FSREG_UnloadProgram :: proc(programHandle: u64) -> Result ---

    // Checks if a program has been loaded by fs:REG.
    FSREG_CheckHostLoadId :: proc(programHandle: u64) -> Result ---

    // Initializes pxi:dev.
    pxiDevInit :: proc() -> Result ---

    // Shuts down pxi:dev.
    pxiDevExit :: proc() ---

    // Performs multiple card SPI writes and reads.
    PXIDEV_SPIMultiWriteRead :: proc(header: ^PXIDEV_SPIBuffer, writeBuffer1: ^PXIDEV_SPIBuffer, readBuffer1: ^PXIDEV_SPIBuffer, writeBuffer2: ^PXIDEV_SPIBuffer, readBuffer2: ^PXIDEV_SPIBuffer, footer: ^PXIDEV_SPIBuffer) -> Result ---

    // Performs a single card SPI write and read.
    PXIDEV_SPIWriteRead :: proc(bytesRead: ^u32, initialWaitOperation: u64, writeBuffer: ^PXIDEV_SPIBuffer, readBuffer: ^PXIDEV_SPIBuffer) -> Result ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Creates a packed card SPI transfer option value.
    @(link_name = "ctru_pxi_dev_make_transfer_option")
    pxiDevMakeTransferOption :: proc(baudRate: FS_CardSpiBaudRate, busMode: FS_CardSpiBusMode) -> u8 ---

    // Creates a packed card SPI wait operation value.
    @(link_name = "ctru_pxi_dev_make_wait_operation")
    pxiDevMakeWaitOperation :: proc(waitType: PXIDEV_WaitType, deassertType: PXIDEV_DeassertType, timeout: u64) -> u64 ---
}
