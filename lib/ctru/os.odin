package ctru

// ============================================================
// OS — system information and timing
// 3ds/os.h
//
// Kernel and firmware versions, memory region sizes, the 3D slider, Wi-Fi strength and headset
// state, tick counters, and the shared and kernel configuration pages. (osGetTime,
// osConvertVirtToPhys and osSetSpeedupEnable are in ctru.odin.)
// ============================================================

SYSCLOCK_SOC        :: 16756991
SYSCLOCK_SYS        :: 33513982
SYSCLOCK_SDMMC      :: 67027964
SYSCLOCK_ARM9       :: 134055928
SYSCLOCK_ARM11      :: 268111856
SYSCLOCK_ARM11_LGR1 :: 536223712
SYSCLOCK_ARM11_LGR2 :: 804335568
SYSCLOCK_ARM11_NEW  :: 804335568
CPU_TICKS_PER_MSEC  :: 268111
CPU_TICKS_PER_USEC  :: 268
OS_HEAP_AREA_BEGIN  :: 0x8000000
OS_HEAP_AREA_END    :: 0xE000000
OS_MAP_AREA_BEGIN   :: 0x10000000
OS_MAP_AREA_END     :: 0x14000000
OS_OLD_FCRAM_VADDR  :: 0x14000000
OS_OLD_FCRAM_PADDR  :: 0x20000000
OS_OLD_FCRAM_SIZE   :: 0x8000000
OS_QTMRAM_VADDR     :: 0x1E800000
OS_QTMRAM_PADDR     :: 0x1F000000
OS_QTMRAM_SIZE      :: 0x400000
OS_MMIO_VADDR       :: 0x1EC00000
OS_MMIO_PADDR       :: 0x10100000
OS_MMIO_SIZE        :: 0x400000
OS_VRAM_VADDR       :: 0x1F000000
OS_VRAM_PADDR       :: 0x18000000
OS_VRAM_SIZE        :: 0x600000
OS_DSPRAM_VADDR     :: 0x1FF00000
OS_DSPRAM_PADDR     :: 0x1FF00000
OS_DSPRAM_SIZE      :: 0x80000
OS_KERNELCFG_VADDR  :: 0x1FF80000
OS_SHAREDCFG_VADDR  :: 0x1FF81000
OS_FCRAM_VADDR      :: 0x30000000
OS_FCRAM_PADDR      :: 0x20000000
OS_FCRAM_SIZE       :: 0x10000000

// Kernel configuration page (read-only).
osKernelConfig_s :: struct {
    kernel_ver:         u32,
    update_flag:        u32,
    ns_tid:             u64,
    kernel_syscore_ver: u32,
    env_info:           u8,
    unit_info:          u8,
    boot_env:           u8,
    unk_0x17:           u8,
    kernel_ctrsdk_ver:  u32,
    unk_0x1c:           u32,
    firmlaunch_flags:   u32,
    unk_0x24:           [0xc]u8,
    app_memtype:        u32,
    unk_0x34:           [0xc]u8,
    memregion_sz:       [3]u32,
    unk_0x4c:           [0x14]u8,
    firm_ver:           u32,
    firm_syscore_ver:   u32,
    firm_ctrsdk_ver:    u32,
}

// Time reference information struct (filled in by PTM).
osTimeRef_s :: struct {
    value_ms:    u64, // Milliseconds elapsed since January 1900 when this structure was last updated
    value_tick:  u64, // System ticks elapsed since boot when this structure was last updated
    sysclock_hz: i64, // System clock frequency in Hz adjusted using RTC measurements (usually around SYSCLOCK_ARM11)
    drift_ms:    i64, // Measured time drift of the system clock (according to the RTC) in milliseconds since the last update
}

// Shared system configuration page structure (read-only or read-write depending on exheader).
osSharedConfig_s :: struct {
    timeref_cnt:       u32,
    running_hw:        u8,
    mcu_hwinfo:        u8,
    unk_0x06:          [0x1A]u8,
    timeref:           [2]osTimeRef_s,
    wifi_macaddr:      [6]u8,
    wifi_strength:     u8,
    network_state:     u8,
    unk_0x68:          [0x18]u8,
    slider_3d:         f32,
    led_3d:            u8,
    led_battery:       u8,
    unk_flag:          u8,
    unk_0x87:          u8,
    unk_0x88:          [0x18]u8,
    menu_tid:          u64,
    cur_menu_tid:      u64,
    unk_0xB0:          [0x10]u8,
    headset_connected: u8,
}

// Tick counter.
TickCounter :: struct {
    elapsed:   u64, // Elapsed CPU ticks between measurements.
    reference: u64, // Point in time used as reference.
}

// OS_VersionBin. Format of the system version: "<major>.<minor>.<build>-<nupver><region>"
OS_VersionBin :: struct {
    build:       u8,
    minor:       u8,
    mainver:     u8,
    reserved_x3: u8,
    region:      u8,
    reserved_x5: [0x3]u8,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Converts 0x14* vmem to 0x30*.
    osConvertOldLINEARMemToNew :: proc(vaddr: rawptr) -> rawptr ---

    // Retrieves basic information about a service error.
    osStrError :: proc(error: Result) -> cstring ---

    // Reads the latest reference timepoint published by PTM.
    osGetTimeRef :: proc() -> osTimeRef_s ---

    // Gets the NAND system-version stored in NVer/CVer.
    osGetSystemVersionData :: proc(nver_versionbin: ^OS_VersionBin, cver_versionbin: ^OS_VersionBin) -> Result ---

    // This is a wrapper for osGetSystemVersionData.
    osGetSystemVersionDataString :: proc(nver_versionbin: ^OS_VersionBin, cver_versionbin: ^OS_VersionBin, sysverstr: [^]u8, sysverstr_maxsize: u32) -> Result ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Gets the system's FIRM version.
    @(link_name = "ctru_os_get_firm_version")
    osGetFirmVersion :: proc() -> u32 ---

    // Gets the system's kernel version.
    @(link_name = "ctru_os_get_kernel_version")
    osGetKernelVersion :: proc() -> u32 ---

    // Gets the system's "core version" (2 on NATIVE_FIRM, 3 on SAFE_FIRM, etc.)
    @(link_name = "ctru_os_get_system_core_version")
    osGetSystemCoreVersion :: proc() -> u32 ---

    // Gets the system's memory layout ID (0-5 on Old 3DS, 6-8 on New 3DS)
    @(link_name = "ctru_os_get_application_mem_type")
    osGetApplicationMemType :: proc() -> u32 ---

    // Gets the size of the specified memory region.
    @(link_name = "ctru_os_get_mem_region_size")
    osGetMemRegionSize :: proc(region: MemRegion) -> u32 ---

    // Gets the number of used bytes within the specified memory region.
    @(link_name = "ctru_os_get_mem_region_used")
    osGetMemRegionUsed :: proc(region: MemRegion) -> u32 ---

    // Gets the number of free bytes within the specified memory region.
    @(link_name = "ctru_os_get_mem_region_free")
    osGetMemRegionFree :: proc(region: MemRegion) -> u32 ---

    // Starts a tick counter.
    @(link_name = "ctru_os_tick_counter_start")
    osTickCounterStart :: proc(cnt: ^TickCounter) ---

    // Updates the elapsed time in a tick counter.
    @(link_name = "ctru_os_tick_counter_update")
    osTickCounterUpdate :: proc(cnt: ^TickCounter) ---

    // Reads the elapsed time in a tick counter.
    @(link_name = "ctru_os_tick_counter_read")
    osTickCounterRead :: proc(cnt: ^TickCounter) -> f64 ---

    // Gets the current Wifi signal strength.
    @(link_name = "ctru_os_get_wifi_strength")
    osGetWifiStrength :: proc() -> u8 ---

    // Gets the state of the 3D slider.
    @(link_name = "ctru_os_get_3d_slider_state")
    osGet3DSliderState :: proc() -> f32 ---

    // Checks whether a headset is connected.
    @(link_name = "ctru_os_is_headset_connected")
    osIsHeadsetConnected :: proc() -> bool ---
}
