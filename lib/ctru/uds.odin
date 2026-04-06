package ctru

// ============================================================
// UDS — Local-WLAN Service (NWM/UDS)
// 3ds/services/uds.h  https://3dbrew.org/wiki/NWM_Services
//
// Enables DS-style local wireless (up to 16 devices, no internet).
// One device hosts a network; others join as clients or spectators.
// Data is sent/received as raw frames via a bind context.
//
// Host flow:
//   ctru.udsInit(0x3000, nil)        // sharedmem size, optional username
//   defer ctru.udsExit()
//
//   network: ctru.udsNetworkStruct
//   ctru.udsGenerateDefaultNetworkStruct(&network, 0x55550000, 0, 8)
//   bind: ctru.udsBindContext
//   ctru.udsCreateNetwork(&network, "pass", 4, &bind, 1, ctru.UDS_DEFAULT_RECVBUFSIZE)
//   defer ctru.udsDestroyNetwork()
//   defer ctru.udsUnbind(&bind)
//
//   // Send a packet to all clients:
//   ctru.udsSendTo(ctru.UDS_BROADCAST_NETWORKNODEID, 1,
//                  u8(ctru.UDS_SENDFLAG_Default), raw_data(payload), len(payload))
//
// Client flow:
//   // scan for networks, pick one, then:
//   ctru.udsConnectNetwork(&found_network, "pass", 4, &bind,
//                          ctru.UDS_BROADCAST_NETWORKNODEID,
//                          .Client, 1, ctru.UDS_DEFAULT_RECVBUFSIZE)
//   defer ctru.udsDisconnectNetwork()
//   defer ctru.udsUnbind(&bind)
// ============================================================

// ── Constants ─────────────────────────────────────────────────

/// Maximum nodes (including host) in one network.
UDS_MAXNODES :: 16

/// Alias to target all nodes (broadcast).
UDS_BROADCAST_NETWORKNODEID :: u16(0xFFFF)

/// NetworkNodeID of the host (always node 1).
UDS_HOST_NETWORKNODEID :: u16(0x1)

/// Recommended recv_buffer_size for udsBind / udsCreateNetwork / udsConnectNetwork.
UDS_DEFAULT_RECVBUFSIZE :: u32(0x2E30)

/// Maximum size of a single user data frame.
UDS_DATAFRAME_MAXSIZE :: uint(0x5C6)

// ── Network attribute flags ────────────────────────────────────

UDSNETATTR_DisableConnectSpectators :: u16(1 << 0)
UDSNETATTR_DisableConnectClients    :: u16(1 << 1)
UDSNETATTR_x4                       :: u16(1 << 2)
UDSNETATTR_Default                  :: u16(1 << 15)

// ── Send flags ────────────────────────────────────────────────

UDS_SENDFLAG_Default   :: u8(1 << 0)
UDS_SENDFLAG_Broadcast :: u8(1 << 1) // force broadcast even without broadcast NodeID

// ── Enums ─────────────────────────────────────────────────────

/// Connection type for udsConnectNetwork.
udsConnectionType :: enum u32 {
    Client    = 0x1,
    Spectator = 0x2,
}

// ── Structs ───────────────────────────────────────────────────

/// Node information for one device on the network (40 bytes).
/// The usercfg field overlays { username[10], unk_x1c, flag, pad }.
udsNodeInfo :: struct {
    uds_friendcodeseed: u64,
    usercfg:            [0x18]u8, // first 0x18 bytes of system config block
                                  // [0..19]=username (UTF-16), [0x1C]=unk, [0x1E]=flag
    NetworkNodeID:      u16,
    pad_x22:            u16,
    word_x24:           u32,
}

/// Connection status snapshot returned by udsGetConnectionStatus (48 bytes).
udsConnectionStatus :: struct {
    status:             u32,
    unk_x4:             u32,
    cur_NetworkNodeID:  u16,
    unk_xa:             u16,
    unk_xc:             [8]u32,  // 0x20 bytes
    total_nodes:        u8,
    max_nodes:          u8,
    node_bitmask:       u16, // bit N = node (N+1) is connected
}

/// Network descriptor broadcast via beacon.  Big-endian fields (264 bytes).
udsNetworkStruct :: struct {
    host_macaddress:  [6]u8,
    channel:          u8,   // 0 = system chooses; set to force a channel
    pad_x7:           u8,
    initialized_flag: u8,   // must be non-zero
    unk_x9:           [3]u8,
    oui_value:        [3]u8, // normally { 0x00, 0x1F, 0x32 }
    oui_type:         u8,   // 0x15
    wlancommID:       u32,  // app-unique local-WLAN communications ID
    id8:              u8,
    unk_x15:          u8,
    attributes:       u16,  // UDSNETATTR_* bitmask
    networkID:        u32,
    total_nodes:      u8,
    max_nodes:        u8,
    unk_x1e:          u8,
    unk_x1f:          u8,
    unk_x20:          [0x1F]u8,
    appdata_size:     u8,
    appdata:          [0xC8]u8,
}

/// Bind context for receiving data on a channel (12 bytes).
udsBindContext :: struct {
    BindNodeID: u32,
    event:      Handle,
    spectator:  bool,
}

/// Input structure for NWM beacon scanning (52 bytes).
nwmScanInputStruct :: struct {
    unk_x0:      u16,
    unk_x2:      u16,
    unk_x4:      u16,
    unk_x6:      u16,
    mac_address: [6]u8,
    unk_xe:      [0x26]u8,
}

/// Header of the beacon scan output buffer (12 bytes).
nwmBeaconDataReplyHeader :: struct {
    maxsize:       u32,
    size:          u32,
    total_entries: u32,
    // entries follow immediately after this header in memory
}

/// One entry in the beacon scan output (28 bytes).
nwmBeaconDataReplyEntry :: struct {
    size:        u32, // total size of this entry; next entry = cur + size
    unk_x4:      u8,
    channel:     u8,
    unk_x6:      u8,
    unk_x7:      u8,
    mac_address: [6]u8,
    unk_xe:      [6]u8,
    unk_x14:     u32,
    val_x1c:     u32, // = 0x1C (offset to actual beacon data following this header)
    // actual beacon data follows
}

/// Parsed network scan result (one entry from udsScanBeacons).
udsNetworkScanInfo :: struct {
    datareply_entry: nwmBeaconDataReplyEntry,
    network:         udsNetworkStruct,
    nodes:           [UDS_MAXNODES]udsNodeInfo,
}

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    // sharedmem_size: must be 0x1000-aligned (0x3000 is typical).
    // username: optional UTF-8 display name (max 10 chars, no NUL); nil = use system name.
    udsInit :: proc(sharedmem_size: uint, username: cstring) -> Result ---
    udsExit :: proc() ---

    // ── Node info ─────────────────────────────────────────────

    // Populate a udsNodeInfo from system config.
    // username: optional override (UTF-8, max 10 chars); nil = system name.
    udsGenerateNodeInfo :: proc(nodeinfo: ^udsNodeInfo, username: cstring) -> Result ---

    // Extract the UTF-8 username from a NodeInfo (max 10 chars, no NUL).
    udsGetNodeInfoUsername :: proc(nodeinfo: ^udsNodeInfo, username: [^]u8) -> Result ---

    // Returns true if nodeinfo was filled by NWM-module (not udsGenerateNodeInfo).
    udsCheckNodeInfoInitialized :: proc(nodeinfo: ^udsNodeInfo) -> bool ---

    // ── Network creation helpers ──────────────────────────────

    // Fill a udsNetworkStruct with sensible defaults for creating a network.
    // wlancommID: unique app identifier (use your TID low word or similar).
    // id8: sub-type byte for distinguishing network flavours within an app.
    // max_nodes: 2..16 (includes host).
    udsGenerateDefaultNetworkStruct :: proc(network: ^udsNetworkStruct,
                                             wlancommID: u32, id8: u8,
                                             max_nodes: u8) ---

    // ── Scanning ──────────────────────────────────────────────

    // Scan for UDS networks matching wlancommID+id8.
    // outbuf: scratch buffer used during scan (size >= maxsize, typically 0x4000).
    // networks: receives a malloc'd array of udsNetworkScanInfo (free with linearFree).
    // total_networks: number of entries in *networks.
    // host_macaddress: filter to a specific host MAC; nil = all hosts.
    // connected: must be false when not on a network, true when on one.
    udsScanBeacons :: proc(outbuf: rawptr, maxsize: uint,
                            networks: ^^udsNetworkScanInfo, total_networks: ^uint,
                            wlancommID: u32, id8: u8,
                            host_macaddress: ^u8, connected: bool) -> Result ---

    // ── App data in beacon ────────────────────────────────────

    // Host: set app data broadcast in the beacon (size <= 0xC8).
    udsSetApplicationData :: proc(buf: rawptr, size: uint) -> Result ---

    // Client/host: read app data from the current network's beacon.
    udsGetApplicationData :: proc(buf: rawptr, size: uint, actual_size: ^uint) -> Result ---

    // Read app data from a udsNetworkStruct (e.g. from scan results).
    udsGetNetworkStructApplicationData :: proc(network: ^udsNetworkStruct,
                                                buf: rawptr, size: uint,
                                                actual_size: ^uint) -> Result ---

    // ── Bind / receive ────────────────────────────────────────

    // Create a bind context to receive data.
    // NetworkNodeID: source filter (UDS_BROADCAST_NETWORKNODEID = receive from all).
    // spectator: false for regular binds.
    // data_channel: non-zero filter value matching udsSendTo() channel.
    // recv_buffer_size: use UDS_DEFAULT_RECVBUFSIZE.
    udsBind   :: proc(bindcontext: ^udsBindContext, NetworkNodeID: u16,
                      spectator: bool, data_channel: u8, recv_buffer_size: u32) -> Result ---
    udsUnbind :: proc(bindcontext: ^udsBindContext) -> Result ---

    // Check/wait for data availability on a bind context.
    // nextEvent: discard current event and wait for the next.
    // wait: block until data is available (true), or just poll (false).
    // Returns true always when wait=true; when wait=false returns false if not signaled.
    udsWaitDataAvailable :: proc(bindcontext: ^udsBindContext,
                                  nextEvent: bool, wait: bool) -> bool ---

    // Pull the next received frame (non-blocking).
    // actual_size: bytes written into buf (0 = no data).
    // src_NetworkNodeID: node that sent the frame (0 = no data).
    udsPullPacket :: proc(bindcontext: ^udsBindContext,
                          buf: rawptr, size: uint,
                          actual_size: ^uint, src_NetworkNodeID: ^u16) -> Result ---

    // ── Sending ───────────────────────────────────────────────

    // Send data to dst_NetworkNodeID on data_channel.
    // flags: UDS_SENDFLAG_* bitmask.
    // size: must be <= UDS_DATAFRAME_MAXSIZE.
    udsSendTo :: proc(dst_NetworkNodeID: u16, data_channel: u8, flags: u8,
                      buf: rawptr, size: uint) -> Result ---

    // Get the current WiFi channel in use.
    udsGetChannel :: proc(channel: ^u8) -> Result ---

    // ── Host operations ───────────────────────────────────────

    // Host a new network.
    // passphrase: raw bytes (not necessarily a string).
    // ctx: optional bind context for the host; nil = don't create one.
    udsCreateNetwork :: proc(network: ^udsNetworkStruct,
                              passphrase: rawptr, passphrase_size: uint,
                              ctx: ^udsBindContext,
                              data_channel: u8, recv_buffer_size: u32) -> Result ---

    // Join an existing network.
    // recv_NetworkNodeID: pass to udsBind internally (use UDS_BROADCAST_NETWORKNODEID).
    udsConnectNetwork :: proc(network: ^udsNetworkStruct,
                               passphrase: rawptr, passphrase_size: uint,
                               ctx: ^udsBindContext,
                               recv_NetworkNodeID: u16,
                               connection_type: udsConnectionType,
                               data_channel: u8, recv_buffer_size: u32) -> Result ---

    udsDestroyNetwork    :: proc() -> Result --- // host: tear down the network
    udsDisconnectNetwork :: proc() -> Result --- // client: leave the network

    // Force-disconnect a client by NodeID (host only).
    // UDS_BROADCAST_NETWORKNODEID disconnects all clients.
    udsEjectClient   :: proc(NetworkNodeID: u16) -> Result ---
    // Force-disconnect all spectators (host only).
    udsEjectSpectator :: proc() -> Result ---

    // Update the network attribute bitmask (host only).
    udsUpdateNetworkAttribute :: proc(bitmask: u16, flag: bool) -> Result ---

    // Block or unblock new client/spectator connections (host only).
    udsSetNewConnectionsBlocked :: proc(block: bool, clients: bool, flag: bool) -> Result ---

    // Re-allow spectators after udsEjectSpectator() (host only).
    udsAllowSpectators :: proc() -> Result ---

    // ── Status ────────────────────────────────────────────────

    udsGetConnectionStatus :: proc(output: ^udsConnectionStatus) -> Result ---

    // Poll/wait for the connection status to be updated internally.
    udsWaitConnectionStatusEvent :: proc(nextEvent: bool, wait: bool) -> bool ---

    // Look up a specific node's NodeInfo.  Cannot use broadcast alias.
    udsGetNodeInformation :: proc(NetworkNodeID: u16, output: ^udsNodeInfo) -> Result ---
}
