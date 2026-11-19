package ctru

// ============================================================
// BOSS — SpotPass background downloads
// 3ds/services/boss.h
//
// Registers and runs background download tasks.
// ============================================================

// BOSS context.
bossContext :: struct {
    property:     [0x7]u32,
    url:          [0x200]u8,
    property_x8:  u32,
    property_x9:  u8,
    property_xa:  [0x100]u8,
    property_xb:  [0x200]u8,
    property_xd:  [0x360]u8,
    property_xe:  u32,
    property_xf:  [3]u32,
    property_x10: u8,
    property_x11: u8,
    property_x12: u8,
    property_x13: u32,
    property_x14: u32,
    property_x15: [0x40]u8,
    property_x16: u32,
    property_x3b: u32,
    property_x3e: [0x200]u8,
}

// BOSS task status.
bossTaskStatus :: enum u8 {
    STARTED = 2,
    ERROR   = 7,
}

// Type values for bossGetNsDataHeaderInfo().
bossNsDataHeaderInfoTypes :: enum u8 {
    CONTENT_SIZE = 3,
}

// Size of the output data for bossGetNsDataHeaderInfo().
bossNsDataHeaderInfoTypeSizes :: enum u8 {
    CONTENT_SIZE = 4,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes BOSS.
    bossInit :: proc(programID: u64, force_user: bool) -> Result ---

    // Run the InitializeSession service cmd. This is mainly for changing the programID associated
    // with the current BOSS session.
    bossReinit :: proc(programID: u64) -> Result ---

    // Exits BOSS.
    bossExit :: proc() ---

    // Returns the BOSS session handle.
    bossGetSessionHandle :: proc() -> Handle ---

    // Set the content data storage location.
    bossSetStorageInfo :: proc(extdataID: u64, boss_size: u32, mediaType: u8) -> Result ---

    // Unregister the content data storage location, which includes unregistering the BOSS-session
    // programID with BOSS.
    bossUnregisterStorage :: proc() -> Result ---

    // Register a task.
    bossRegisterTask :: proc(taskID: cstring, unk0: u8, unk1: u8) -> Result ---

    // Send a property.
    bossSendProperty :: proc(PropertyID: u16, buf: rawptr, size: u32) -> Result ---

    // Deletes the content file for the specified NsDataId.
    bossDeleteNsData :: proc(NsDataId: u32) -> Result ---

    // Gets header info for the specified NsDataId.
    bossGetNsDataHeaderInfo :: proc(NsDataId: u32, type_: u8, buffer: rawptr, size: u32) -> Result ---

    // Reads data from the content for the specified NsDataId.
    bossReadNsData :: proc(NsDataId: u32, offset: u64, buffer: rawptr, size: u32, transfer_total: ^u32, unk_out: ^u32) -> Result ---

    // Starts a task soon after running this command.
    bossStartTaskImmediate :: proc(taskID: cstring) -> Result ---

    // Similar to bossStartTaskImmediate?
    bossStartBgImmediate :: proc(taskID: cstring) -> Result ---

    // Deletes a task by using CancelTask and UnregisterTask internally.
    bossDeleteTask :: proc(taskID: cstring, unk: u32) -> Result ---

    // Returns task state.
    bossGetTaskState :: proc(taskID: cstring, inval: i8, status: ^u8, out1: ^u32, out2: ^u8) -> Result ---

    // This loads the current state of PropertyID 0x0 for the specified task.
    bossGetTaskProperty0 :: proc(taskID: cstring, out: ^u8) -> Result ---

    // Setup a BOSS context with the default config.
    bossSetupContextDefault :: proc(ctx: ^bossContext, seconds_interval: u32, url: cstring) ---

    // Sends the config stored in the context. Used before registering a task.
    bossSendContextConfig :: proc(ctx: ^bossContext) -> Result ---
}
