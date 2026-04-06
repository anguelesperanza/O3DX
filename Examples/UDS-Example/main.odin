package uds_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates the UDS local-WLAN service.
//
// Two modes selectable on startup:
//   A — Host: creates a local network, waits for clients, shows nodes.
//   B — Client: scans for networks matching this app's ID, joins the first
//               one found, then receives data.
//
// Once on a network (either mode):
//   Y — send a "PING" packet to all nodes
//   X — (host only) eject all clients
//
// Data packets are sent/received on channel 1, broadcast to all.
//
// Controls:
//   A      — host network (before joining)
//   B      — scan & join (before joining)
//   Y      — send PING
//   X      — (host) eject all clients
//   START  — exit

// Unique application local-WLAN comm ID.
// Change this for your own apps to avoid colliding with others.
APP_WLAN_COMM_ID :: u32(0x554E4900) // "UNI\0"
APP_PASSPHRASE   :: "uds-example-pass"
DATA_CHANNEL     :: u8(1)

MAX_NODES :: 4

UDSMode :: enum u8 {
    SelectMode,
    Hosting,
    Scanning,
    Connected,
    Error,
}

g_mode:    UDSMode
g_isHost:  bool
g_bind:    ctru.udsBindContext
g_network: ctru.udsNetworkStruct
g_msgBuf:  [ctru.UDS_DATAFRAME_MAXSIZE]u8
g_msgLen:  uint

@(export, link_name = "odin_main")
uds_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    // ── Graphics ──────────────────────────────────────────────────────
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    ctru.printf("UDS Local Wireless\n")
    ctru.printf("A=Host  B=Join\n")
    ctru.printf("Y=Send PING  START=Exit\n\n")

    // ── UDS init ──────────────────────────────────────────────────────
    rc := ctru.udsInit(0x3000, nil)
    if rc != 0 {
        ctru.printf("udsInit failed: 0x%08lX\n", rc)
        ctru.gfxExit()
        return 1
    }
    defer ctru.udsExit()

    // ── Colours & text ────────────────────────────────────────────────
    clrBg     := c2d.C2D_Color32(0x08, 0x10, 0x20, 0xFF)
    clrTitle  := c2d.C2D_Color32(0xFF, 0xD7, 0x00, 0xFF)
    clrGreen  := c2d.C2D_Color32(0x00, 0xFF, 0x88, 0xFF)
    clrYellow := c2d.C2D_Color32(0xFF, 0xCC, 0x00, 0xFF)
    clrWhite  := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
    clrSubtle := c2d.C2D_Color32(0x66, 0x77, 0x88, 0xFF)
    clrRed    := c2d.C2D_Color32(0xFF, 0x33, 0x33, 0xFF)

    staticBuf := c2d.C2D_TextBufNew(256)
    dynBuf    := c2d.C2D_TextBufNew(512)

    titleText:  c2d.C2D_Text
    promptText: c2d.C2D_Text
    c2d.C2D_TextParse(&titleText,  staticBuf, "UDS Local Wireless")
    c2d.C2D_TextParse(&promptText, staticBuf, "A=Host    B=Join Network")
    c2d.C2D_TextOptimize(&titleText)
    c2d.C2D_TextOptimize(&promptText)

    modeTxt:  c2d.C2D_Text
    info0Txt: c2d.C2D_Text
    info1Txt: c2d.C2D_Text
    info2Txt: c2d.C2D_Text

    modeStr: [64]u8
    i0:      [64]u8
    i1:      [64]u8
    i2:      [64]u8

    g_mode = .SelectMode
    frameCount: u32

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        keys := ctru.hidKeysDown()
        frameCount += 1

        if keys & ctru.KEY_START != 0 do break

        // ── Mode selection ────────────────────────────────────────────
        if g_mode == .SelectMode {
            if keys & ctru.KEY_A != 0 {
                // Host a network
                ctru.udsGenerateDefaultNetworkStruct(&g_network,
                    APP_WLAN_COMM_ID, 0, MAX_NODES)
                rc = ctru.udsCreateNetwork(&g_network,
                    raw_data(string(APP_PASSPHRASE)), len(APP_PASSPHRASE),
                    &g_bind, DATA_CHANNEL, ctru.UDS_DEFAULT_RECVBUFSIZE)
                if rc == 0 {
                    g_mode   = .Hosting
                    g_isHost = true
                    ctru.printf("Network created!\n")
                } else {
                    ctru.printf("udsCreateNetwork: 0x%08lX\n", rc)
                    g_mode = .Error
                }
            }

            if keys & ctru.KEY_B != 0 {
                // Scan for networks
                g_mode = .Scanning
                ctru.printf("Scanning for networks...\n")
            }
        }

        // ── Scan then connect ─────────────────────────────────────────
        if g_mode == .Scanning && frameCount % 30 == 0 {
            scanBuf: [0x4000]u8
            networks: ^ctru.udsNetworkScanInfo
            total: uint
            rc = ctru.udsScanBeacons(&scanBuf[0], len(scanBuf),
                &networks, &total,
                APP_WLAN_COMM_ID, 0, nil, false)
            if rc == 0 && total > 0 {
                ctru.printf("Found %d network(s), joining...\n", total)
                rc = ctru.udsConnectNetwork(&networks^.network,
                    raw_data(string(APP_PASSPHRASE)), len(APP_PASSPHRASE),
                    &g_bind,
                    ctru.UDS_BROADCAST_NETWORKNODEID,
                    .Client, DATA_CHANNEL, ctru.UDS_DEFAULT_RECVBUFSIZE)
                ctru.linearFree(cast(rawptr)networks)
                if rc == 0 {
                    g_mode   = .Connected
                    g_isHost = false
                    ctru.printf("Connected!\n")
                } else {
                    ctru.printf("udsConnectNetwork: 0x%08lX\n", rc)
                    g_mode = .Error
                }
            } else if rc != 0 {
                ctru.printf("Scan error: 0x%08lX\n", rc)
            }
        }

        // ── On network: receive + send ────────────────────────────────
        if g_mode == .Hosting || g_mode == .Connected {
            // Receive any pending packets
            if ctru.udsWaitDataAvailable(&g_bind, false, false) {
                actualSize: uint
                srcNode:    u16
                rc = ctru.udsPullPacket(&g_bind,
                    &g_msgBuf[0], uint(len(g_msgBuf)),
                    &actualSize, &srcNode)
                if rc == 0 && actualSize > 0 {
                    // Print up to 32 bytes of the message
                    printLen := actualSize if actualSize < 32 else 32
                    ctru.printf("Node %d: %.*s\n", srcNode,
                        i32(printLen), &g_msgBuf[0])
                }
            }

            // Y = send PING
            if keys & ctru.KEY_Y != 0 {
                msg := "PING"
                rc = ctru.udsSendTo(ctru.UDS_BROADCAST_NETWORKNODEID,
                    DATA_CHANNEL, ctru.UDS_SENDFLAG_Default,
                    raw_data(msg), len(msg))
                if rc == 0 {
                    ctru.printf("Sent PING\n")
                } else {
                    ctru.printf("SendTo: 0x%08lX\n", rc)
                }
            }

            // X = (host) eject all clients
            if g_isHost && keys & ctru.KEY_X != 0 {
                ctru.udsEjectClient(ctru.UDS_BROADCAST_NETWORKNODEID)
                ctru.printf("Ejected all clients\n")
            }
        }

        // ── Connection status ─────────────────────────────────────────
        connStatus: ctru.udsConnectionStatus
        nodeCount:  u8
        myNodeID:   u16

        if g_mode == .Hosting || g_mode == .Connected {
            ctru.udsGetConnectionStatus(&connStatus)
            nodeCount = connStatus.total_nodes
            myNodeID  = connStatus.cur_NetworkNodeID
        }

        // ── Build UI strings ──────────────────────────────────────────
        c2d.C2D_TextBufClear(dynBuf)

        switch g_mode {
        case .SelectMode:
            ctru.snprintf(&modeStr[0], 64, "Select mode")
            ctru.snprintf(&i0[0], 64, " ")
            ctru.snprintf(&i1[0], 64, " ")
            ctru.snprintf(&i2[0], 64, " ")
        case .Scanning:
            ctru.snprintf(&modeStr[0], 64, "Scanning for networks...")
            ctru.snprintf(&i0[0], 64, "CommID: 0x%08X", APP_WLAN_COMM_ID)
            ctru.snprintf(&i1[0], 64, " ")
            ctru.snprintf(&i2[0], 64, " ")
        case .Hosting:
            ctru.snprintf(&modeStr[0], 64, "Hosting (node 0x%04X)", myNodeID)
            ctru.snprintf(&i0[0], 64, "Nodes online: %d / %d",
                nodeCount, MAX_NODES)
            ctru.snprintf(&i1[0], 64, "Y=PING  X=Eject all")
            ctru.snprintf(&i2[0], 64, "CommID: 0x%08X", APP_WLAN_COMM_ID)
        case .Connected:
            ctru.snprintf(&modeStr[0], 64, "Client (node 0x%04X)", myNodeID)
            ctru.snprintf(&i0[0], 64, "Nodes online: %d", nodeCount)
            ctru.snprintf(&i1[0], 64, "Y=PING")
            ctru.snprintf(&i2[0], 64, " ")
        case .Error:
            ctru.snprintf(&modeStr[0], 64, "Error — see console")
            ctru.snprintf(&i0[0], 64, " ")
            ctru.snprintf(&i1[0], 64, " ")
            ctru.snprintf(&i2[0], 64, " ")
        }

        c2d.C2D_TextParse(&modeTxt,  dynBuf, cstring(&modeStr[0]))
        c2d.C2D_TextParse(&info0Txt, dynBuf, cstring(&i0[0]))
        c2d.C2D_TextParse(&info1Txt, dynBuf, cstring(&i1[0]))
        c2d.C2D_TextParse(&info2Txt, dynBuf, cstring(&i2[0]))

        // ── Render ────────────────────────────────────────────────────
        modeTxtClr := clrYellow
        if g_mode == .Hosting || g_mode == .Connected {
            modeTxtClr = clrGreen
        } else if g_mode == .Error {
            modeTxtClr = clrRed
        }

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, clrBg)
        c2d.C2D_SceneBegin(top)

        c2d.C2D_DrawTextColor(&titleText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 8, 0, 0.70, 0.70, clrTitle)

        c2d.C2D_DrawRectSolid(0, 38, 0, 400, 1,
            c2d.C2D_Color32(0x33, 0x44, 0x55, 0xFF))

        if g_mode == .SelectMode {
            c2d.C2D_DrawTextColor(&promptText,
                c2d.C2D_AlignCenter | c2d.C2D_WithColor,
                200, 110, 0, 0.60, 0.60, clrWhite)
        } else {
            c2d.C2D_DrawTextColor(&modeTxt,
                c2d.C2D_AlignCenter | c2d.C2D_WithColor,
                200, 50, 0, 0.60, 0.60, modeTxtClr)
            c2d.C2D_DrawTextColor(&info0Txt, c2d.C2D_WithColor,
                16, 90,  0, 0.55, 0.55, clrWhite)
            c2d.C2D_DrawTextColor(&info1Txt, c2d.C2D_WithColor,
                16, 118, 0, 0.55, 0.55, clrSubtle)
            c2d.C2D_DrawTextColor(&info2Txt, c2d.C2D_WithColor,
                16, 146, 0, 0.50, 0.50, clrSubtle)
        }

        c3d.C3D_FrameEnd(0)
    }

    // ── Cleanup ───────────────────────────────────────────────────────
    if g_mode == .Hosting || g_mode == .Connected {
        ctru.udsUnbind(&g_bind)
        if g_isHost {
            ctru.udsDestroyNetwork()
        } else {
            ctru.udsDisconnectNetwork()
        }
    }

    c2d.C2D_TextBufDelete(staticBuf)
    c2d.C2D_TextBufDelete(dynBuf)
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
