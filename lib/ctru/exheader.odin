package ctru

// ============================================================
// Extended header (exheader)
// 3ds/exheader.h
//
// The NCCH extended header: a title's code layout, dependencies, and the access rights it asks
// for. Used by the loader, PXIPM and FS-PXI services.
// ============================================================

// ARM9 descriptor flags
ARM9DESC_MOUNT_NAND      :: 1 // Mount "nand:/"
ARM9DESC_MOUNT_NANDRO_RW :: 2 // Mount nand:/ro/ as read-write
ARM9DESC_MOUNT_TWLN      :: 4 // Mount "twln:/"
ARM9DESC_MOUNT_WNAND     :: 8 // Mount "wnand:/"
ARM9DESC_MOUNT_CARDSPI   :: 0x10 // Mount "cardspi:/"
ARM9DESC_USE_SDIF3       :: 0x20 // Use SDIF3
ARM9DESC_CREATE_SEED     :: 0x40 // Create seed (movable.sed)
ARM9DESC_USE_CARD_SPI    :: 0x80 // Use card SPI, required by multiple pxi:dev commands
ARM9DESC_SD_APPLICATION  :: 0x100 // SD application (not checked)
ARM9DESC_MOUNT_SDMC_RW   :: 0x200 // Mount "sdmc:/" as read-write

// Filesystem access flags
FSACCESS_CATEGORY_SYSTEM_APPLICATION :: 1 // Category "system application"
FSACCESS_CATEGORY_HARDWARE_CHECK     :: 2 // Category "hardware check"
FSACCESS_CATEGORY_FILESYSTEM_TOOL    :: 4 // Category "filesystem tool"
FSACCESS_DEBUG                       :: 8 // Debug
FSACCESS_TWLCARD_BACKUP              :: 0x10 // TWLCARD backup
FSACCESS_TWLNAND_DATA                :: 0x20 // TWLNAND data
FSACCESS_BOSS                        :: 0x40 // BOSS (SpotPass)
FSACCESS_SDMC_RW                     :: 0x80 // SDMC (read-write)
FSACCESS_CORE                        :: 0x100 // Core
FSACCESS_NANDRO_RO                   :: 0x200 // nand:/ro/ (read-only)
FSACCESS_NANDRW                      :: 0x400 // nand:/rw/
FSACCESS_NANDRO_RW                   :: 0x800 // nand:/ro/ (read-write)
FSACCESS_CATEGORY_SYSTEM_SETTINGS    :: 0x1000 // Category "System Settings"
FSACCESS_CARDBOARD                   :: 0x2000 // Cardboard (System Transfer)
FSACCESS_EXPORT_IMPORT_IVS           :: 0x4000 // Export/Import IVs (movable.sed)
FSACCESS_SDMC_WO                     :: 0x8000 // SDMC (write-only)
FSACCESS_SWITCH_CLEANUP              :: 0x10000 // "Switch cleanup" (3.0+)
FSACCESS_SAVEDATA_MOVE               :: 0x20000 // Savedata move (5.0+)
FSACCESS_SHOP                        :: 0x40000 // Shop (5.0+)
FSACCESS_SHELL                       :: 0x80000 // Shop (5.0+)
FSACCESS_CATEGORY_HOME_MENU          :: 0x100000 // Category "Home Menu" (6.0+)
FSACCESS_SEEDDB                      :: 0x200000 // Seed DB (9.6+)

// The resource limit category of a title
ResourceLimitCategory :: enum u8 {
    APPLICATION = 0, // Regular application
    SYS_APPLET  = 1, // System applet
    LIB_APPLET  = 2, // Library applet
    OTHER       = 3, // System modules running inside the BASE memregion
}

// The system mode a title should be launched under
SystemMode :: enum u8 {
    O3DS_PROD = 0, // 64MB of usable application memory
    N3DS_PROD = 1, // 124MB of usable application memory. Unusable on O3DS
    DEV1      = 2, // 97MB/178MB of usable application memory
    DEV2      = 3, // 80MB/124MB of usable application memory
    DEV3      = 4, // 72MB of usable application memory. Same as "Prod" on N3DS
    DEV4      = 5, // 32MB of usable application memory. Same as "Prod" on N3DS
}

// The system info flags and remaster version of a title
// Opaque here: the C type has a union or bitfields. 8 bytes.
ExHeader_SystemInfoFlags :: struct #align(2) {
    _: [8]u8,
}

// Information about a title's section
ExHeader_CodeSectionInfo :: struct {
    address:   u32, // The address of the section
    num_pages: u32, // The number of pages the section occupies
    size:      u32, // The size of the section
}

// The name of a title and infomation about its section
ExHeader_CodeSetInfo :: struct {
    name:       [8]u8, // Title name
    flags:      ExHeader_SystemInfoFlags, // System info flags, see ExHeader_SystemInfoFlags
    text:       ExHeader_CodeSectionInfo, // .text section info, see ExHeader_CodeSectionInfo
    stack_size: u32, // Stack size
    rodata:     ExHeader_CodeSectionInfo, // .rodata section info, see ExHeader_CodeSectionInfo
    reserved:   u32, // Reserved
    data:       ExHeader_CodeSectionInfo, // .data section info, see ExHeader_CodeSectionInfo
    bss_size:   u32, // .bss section size
}

// The savedata size and jump ID of a title
ExHeader_SystemInfo :: struct {
    savedata_size: u64, // Savedata size
    jump_id:       u64, // Jump ID
    reserved:      [0x30]u8, // Reserved
}

// The code set info, dependencies and system info of a title (SCI)
ExHeader_SystemControlInfo :: struct {
    codeset_info: ExHeader_CodeSetInfo, // Code set info, see ExHeader_CodeSetInfo
    dependencies: [48]u64, // Title IDs of the titles that this program depends on
    system_info:  ExHeader_SystemInfo, // System info, see ExHeader_SystemInfo
}

// The ARM11 filesystem info of a title
// Opaque here: the C type has a union or bitfields. 32 bytes.
ExHeader_Arm11StorageInfo :: struct #align(8) {
    _: [32]u8,
}

// The CPU-related and memory-layout-related info of a title
// Opaque here: the C type has a union or bitfields. 8 bytes.
ExHeader_Arm11CoreInfo :: struct #align(4) {
    _: [8]u8,
}

// The ARM11 system-local capabilities of a title
ExHeader_Arm11SystemLocalCapabilities :: struct {
    title_id:          u64, // Title ID
    core_info:         ExHeader_Arm11CoreInfo, // Core info, see ExHeader_Arm11CoreInfo
    reslimits:         [16]u16, // Resource limit descriptors, only "CpuTime" (first byte) sems to be used
    storage_info:      ExHeader_Arm11StorageInfo, // Storage info, see ExHeader_Arm11StorageInfo
    service_access:    [34][8]u8, // List of the services the title has access to. Limited to 32 prior to system version 9.3
    reserved:          [15]u8, // Reserved
    reslimit_category: ResourceLimitCategory, // Resource limit category, see ExHeader_Arm11SystemLocalCapabilities
}

// The ARM11 kernel capabilities of a title
ExHeader_Arm11KernelCapabilities :: struct {
    descriptors: [28]u32, // ARM11 kernel descriptors, see 3dbrew
    reserved:    [16]u8, // Reserved
}

// The ARM9 access control of a title
ExHeader_Arm9AccessControl :: struct {
    descriptors:        [15]u8, // Process9 FS descriptors, see 3dbrew
    descriptor_version: u8, // Descriptor version
}

// The access control information of a title
ExHeader_AccessControlInfo :: struct {
    local_caps:     ExHeader_Arm11SystemLocalCapabilities, // ARM11 system-local capabilities, see ExHeader_Arm11SystemLocalCapabilities
    kernel_caps:    ExHeader_Arm11KernelCapabilities, // ARM11 kernel capabilities, see ExHeader_Arm11SystemLocalCapabilities
    access_control: ExHeader_Arm9AccessControl, // ARM9 access control, see ExHeader_Arm9AccessControl
}

// Main extended header data, as returned by PXIPM, Loader and FSREG service commands
ExHeader_Info :: struct {
    sci: ExHeader_SystemControlInfo, // System control info, see ExHeader_SystemControlInfo
    aci: ExHeader_AccessControlInfo, // Access control info, see ExHeader_AccessControlInfo
}

// Extended header access descriptor
ExHeader_AccessDescriptor :: struct {
    signature:   [0x100]u8, // The signature of the access descriptor (RSA-2048-SHA256)
    ncchModulus: [0x100]u8, // The modulus used for the above signature, with 65537 as public exponent
    acli:        ExHeader_AccessControlInfo, // This is compared for equality with the first ACI by Process9, see ExHeader_AccessControlInfo
}

// The NCCH Extended Header of a title
ExHeader :: struct {
    info:              ExHeader_Info, // Main extended header data, see ExHeader_Info
    access_descriptor: ExHeader_AccessDescriptor, // Access descriptor, see ExHeader_AccessDescriptor
}
