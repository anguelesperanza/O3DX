package ctru

// ============================================================
// AC — Access Control / WiFi Connection Service
// 3ds/services/ac.h
//
// The AC service manages WiFi connections.  The most common use
// is simply calling acWaitInternetConnection() after acInit()
// to block until the system is online, then proceeding to use
// the SOC or HTTPC services.
//
// Typical usage:
//
//   ctru.acInit()
//   defer ctru.acExit()
//   ctru.acWaitInternetConnection()  // blocks until online
//   // ... use soc / httpc ...
// ============================================================

// ── Enums ─────────────────────────────────────────────────────

/// WiFi security protocol in use on the connected network.
acSecurityMode :: enum u32 {
    OPEN       = 0, // Open (no security)
    WEP_40BIT  = 1,
    WEP_104BIT = 2,
    WEP_128BIT = 3,
    WPA_TKIP   = 4,
    WPA2_TKIP  = 5,
    WPA_AES    = 6,
    WPA2_AES   = 7,
}

// ── Access point type flags ────────────────────────────────────

AC_AP_TYPE_NONE  :: u32(0)
AC_AP_TYPE_SLOT1 :: u32(1 << 1) // Slot 1 in System Settings
AC_AP_TYPE_SLOT2 :: u32(1 << 2) // Slot 2 in System Settings
AC_AP_TYPE_SLOT3 :: u32(1 << 3) // Slot 3 in System Settings
AC_AP_TYPE_ALL   :: u32(0x7FFF_FFFF)

// ── Types ──────────────────────────────────────────────────────

/// Opaque config buffer used with ACU_CreateDefaultConfig and ACU_ConnectAsync.
acuConfig :: struct { _data: [0x200]u8 }

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    acInit :: proc() -> Result ---
    acExit :: proc() ---

    // Returns a pointer to the AC session handle (rarely needed directly).
    acGetSessionHandle :: proc() -> ^Handle ---

    // ── Connection helpers ────────────────────────────────────

    // Block until the system has an active internet connection.
    // This is the simplest way to ensure you are online before
    // using SOC or HTTPC.
    acWaitInternetConnection :: proc() -> Result ---

    // ── Status queries ────────────────────────────────────────

    // Get the AP type flags for the current connection (AC_AP_TYPE_* bitmask).
    ACU_GetWifiStatus :: proc(out: ^u32) -> Result ---

    // Get the connection status (1 = not connected, 3 = connected).
    ACU_GetStatus :: proc(out: ^u32) -> Result ---

    // Get the security mode of the connected network.
    ACU_GetSecurityMode :: proc(mode: ^acSecurityMode) -> Result ---

    // Get the SSID of the connected network (null-terminated string).
    ACU_GetSSID :: proc(ssid: [^]u8) -> Result ---

    // Get the length of the connected network's SSID.
    ACU_GetSSIDLength :: proc(out: ^u32) -> Result ---

    // ── Proxy information ─────────────────────────────────────

    ACU_GetProxyEnable   :: proc(enable: ^bool) -> Result ---
    // host buffer must be at least 0x100 bytes.
    ACU_GetProxyHost     :: proc(host: [^]u8) -> Result ---
    ACU_GetProxyPort     :: proc(out: ^u16) -> Result ---
    // username buffer must be at least 0x20 bytes.
    ACU_GetProxyUserName :: proc(username: [^]u8) -> Result ---
    // password buffer must be at least 0x20 bytes.
    ACU_GetProxyPassword :: proc(password: [^]u8) -> Result ---

    // ── Error codes ───────────────────────────────────────────

    ACU_GetLastErrorCode       :: proc(errorCode: ^u32) -> Result ---
    ACU_GetLastDetailErrorCode :: proc(errorCode: ^u32) -> Result ---

    // ── Async connection (advanced) ───────────────────────────
    //
    // Use these to connect to a specific stored WiFi slot rather than
    // waiting for the system to connect automatically.
    //
    //   var cfg ctru.acuConfig
    //   ctru.ACU_CreateDefaultConfig(&cfg)
    //   ctru.ACU_SetNetworkArea(&cfg, 2)
    //   ctru.ACU_SetAllowApType(&cfg, u8(ctru.AC_AP_TYPE_ALL))
    //   ctru.ACU_SetRequestEulaVersion(&cfg)
    //   event: ctru.Handle
    //   ctru.svcCreateEvent(&event, .ONESHOT)
    //   ctru.ACU_ConnectAsync(&cfg, event)
    //   ctru.svcWaitSynchronization(event, max(i64))
    //   ctru.svcCloseHandle(event)

    ACU_CreateDefaultConfig    :: proc(config: ^acuConfig) -> Result ---
    ACU_SetNetworkArea         :: proc(config: ^acuConfig, area: u8) -> Result ---
    ACU_SetAllowApType         :: proc(config: ^acuConfig, aptype: u8) -> Result ---
    ACU_SetRequestEulaVersion  :: proc(config: ^acuConfig) -> Result ---
    // connectionHandle must be a handle created with svcCreateEvent(.ONESHOT).
    ACU_ConnectAsync           :: proc(config: ^acuConfig, connectionHandle: Handle) -> Result ---

    // ── Internal / privileged (ACI) ───────────────────────────

    // Select a stored WiFi slot (0–2) for ACI operations.
    ACI_LoadNetworkSetting :: proc(slot: u32) -> Result ---
    // Read the SSID from the previously selected slot (32-byte buffer).
    ACI_GetNetworkWirelessEssidSecuritySsid :: proc(ssid: rawptr) -> Result ---
}
