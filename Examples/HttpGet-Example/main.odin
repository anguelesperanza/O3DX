package httpget_example

import ctru "../../lib/ctru"
import c2d  "../../lib/c2d"
import c3d  "../../lib/c3d"

// Demonstrates 3DS networking: AC + HTTPC.
//
// Flow:
//   1. acInit + acWaitInternetConnection — block until WiFi is online
//   2. httpcInit — start the HTTP client service
//   3. httpcOpenContext(.GET, URL) — open the request
//   4. httpcBeginRequest — send it
//   5. httpcGetResponseStatusCode — read the HTTP status
//   6. httpcDownloadData — read the body (up to BODY_CAP bytes)
//
// The bottom screen console shows real-time progress messages.
// The top screen shows the result: status code, byte count, body preview.
//
// If the body is larger than BODY_CAP the connection is cancelled before
// closing the context (required — closing mid-stream hangs the service).
//
// Controls:
//   START — exit

TARGET_URL :: "http://example.com/"
BODY_CAP   :: 4096  // download at most this many bytes

// ── Download state ────────────────────────────────────────────────────

DownloadState :: enum u8 {
    Pending,     // hasn't run yet
    NoWiFi,      // acWaitInternetConnection failed
    HTTPCFail,   // httpcInit / httpcOpenContext failed
    RequestFail, // httpcBeginRequest failed
    DownloadFail,// httpcDownloadData returned unexpected error
    Done,        // success
}

g_state:        DownloadState
g_status_code:  u32
g_downloaded:   u32
g_body:         [BODY_CAP + 1]u8  // +1 for null terminator

// ── Helpers ───────────────────────────────────────────────────────────

// strip_to_printable copies at most `max` bytes from src into dst,
// replacing control characters (except space) with a space.
// Returns the number of bytes written.  dst is NOT null-terminated here.
strip_to_printable :: proc "c" (dst: [^]u8, src: [^]u8, src_len: u32, max: u32) -> u32 {
    n := src_len if src_len < max else max
    j := u32(0)
    for i := u32(0); i < n; i += 1 {
        ch := src[i]
        if ch >= 32 && ch < 127 {
            dst[j] = ch
            j += 1
        } else {
            dst[j] = ' '
            j += 1
        }
    }
    return j
}

// ── Entry point ───────────────────────────────────────────────────────

@(export, link_name = "odin_main")
httpget_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {

    // ── Graphics init ─────────────────────────────────────────────
    ctru.gfxInitDefault()
    c3d.C3D_Init(c3d.C3D_DEFAULT_CMDBUF_SIZE)
    c2d.C2D_Init(c2d.C2D_DEFAULT_MAX_OBJECTS)
    c2d.C2D_Prepare()
    ctru.consoleInit(ctru.GFX_BOTTOM, nil)

    top := c2d.C2D_CreateScreenTarget(ctru.GFX_TOP, ctru.GFX_LEFT)

    ctru.printf("HTTP GET Example\n")
    ctru.printf("Press START to exit\n\n")

    // ── Colours ───────────────────────────────────────────────────
    clrBg      := c2d.C2D_Color32(0x08, 0x14, 0x28, 0xFF)
    clrTitle   := c2d.C2D_Color32(0xFF, 0xD7, 0x00, 0xFF)
    clrGreen   := c2d.C2D_Color32(0x00, 0xFF, 0x88, 0xFF)
    clrRed     := c2d.C2D_Color32(0xFF, 0x44, 0x44, 0xFF)
    clrWhite   := c2d.C2D_Color32(0xFF, 0xFF, 0xFF, 0xFF)
    clrSubtle  := c2d.C2D_Color32(0x66, 0x88, 0xAA, 0xFF)
    clrDivider := c2d.C2D_Color32(0x33, 0x44, 0x55, 0xFF)

    // ── Network request (blocking, before the render loop) ───────

    // Step 1: WiFi
    ctru.printf("[1/4] AC init...\n")
    rc := ctru.acInit()
    if rc != 0 {
        ctru.printf("      acInit failed: 0x%08lX\n", rc)
        g_state = .NoWiFi
    }

    if g_state == .Pending {
        ctru.printf("[2/4] Waiting for internet...\n")
        rc = ctru.acWaitInternetConnection()
        if rc != 0 {
            ctru.printf("      No connection: 0x%08lX\n", rc)
            g_state = .NoWiFi
        }
    }

    if g_state == .Pending {
        ctru.printf("      Online!\n\n")

        // Step 2: HTTPC init
        ctru.printf("[3/4] HTTPC init + open...\n")
        rc = ctru.httpcInit(0)  // 0 = no shared mem needed (GET request)
        if rc != 0 {
            ctru.printf("      httpcInit failed: 0x%08lX\n", rc)
            g_state = .HTTPCFail
        }
    }

    if g_state == .Pending {
        // Open context, begin, download — then tear down HTTPC
        ctx: ctru.httpcContext
        rc = ctru.httpcOpenContext(&ctx, .GET, TARGET_URL, 0)
        if rc != 0 {
            ctru.printf("      httpcOpenContext failed: 0x%08lX\n", rc)
            g_state = .HTTPCFail
            ctru.httpcExit()
        } else {
            // Step 3: Send
            ctru.printf("[4/4] Sending request...\n")
            rc = ctru.httpcBeginRequest(&ctx)
            if rc != 0 {
                ctru.printf("      httpcBeginRequest failed: 0x%08lX\n", rc)
                g_state = .RequestFail
                ctru.httpcCancelConnection(&ctx)
                ctru.httpcCloseContext(&ctx)
                ctru.httpcExit()
            } else {
                // Read status code
                ctru.httpcGetResponseStatusCode(&ctx, &g_status_code)
                ctru.printf("      HTTP %u\n", g_status_code)

                // Step 4: Download body
                ctru.printf("      Downloading body...\n")
                g_downloaded = 0
                rc = ctru.httpcDownloadData(&ctx, &g_body[0], BODY_CAP, &g_downloaded)

                // 0 = full body fit in buffer; DOWNLOADPENDING = body was larger
                if rc == 0 || u32(rc) == ctru.HTTPC_RESULTCODE_DOWNLOADPENDING {
                    g_body[g_downloaded] = 0  // null-terminate
                    g_state = .Done
                    ctru.printf("      %u bytes downloaded\n", g_downloaded)
                    if u32(rc) == ctru.HTTPC_RESULTCODE_DOWNLOADPENDING {
                        ctru.printf("      (body truncated to %u bytes)\n", BODY_CAP)
                    }
                } else {
                    ctru.printf("      Download failed: 0x%08lX\n", rc)
                    g_state = .DownloadFail
                }

                // If we didn't consume the full stream, cancel before closing
                if u32(rc) == ctru.HTTPC_RESULTCODE_DOWNLOADPENDING || g_state == .DownloadFail {
                    ctru.httpcCancelConnection(&ctx)
                }

                ctru.httpcCloseContext(&ctx)
                ctru.httpcExit()
            }
        }

        ctru.acExit()
    }

    ctru.printf("\nPress START to exit.\n")

    // ── Build top-screen display strings ──────────────────────────

    // Static strings
    staticBuf := c2d.C2D_TextBufNew(512)
    dynBuf    := c2d.C2D_TextBufNew(512)

    titleText: c2d.C2D_Text
    urlText:   c2d.C2D_Text
    c2d.C2D_TextParse(&titleText, staticBuf, "HTTP GET Example")
    c2d.C2D_TextParse(&urlText,   staticBuf, TARGET_URL)
    c2d.C2D_TextOptimize(&titleText)
    c2d.C2D_TextOptimize(&urlText)

    // Dynamic result strings
    statusLine: [48]u8
    sizeLine:   [48]u8
    previewBuf: [161]u8  // 160 chars + null

    switch g_state {
    case .Done:
        ctru.snprintf(&statusLine[0], 48, "HTTP %u", g_status_code)
        ctru.snprintf(&sizeLine[0],   48, "%u bytes downloaded", g_downloaded)
        // Sanitise first 160 bytes of body for display
        n := strip_to_printable(&previewBuf[0], &g_body[0], g_downloaded, 160)
        previewBuf[n] = 0
    case .NoWiFi:
        ctru.snprintf(&statusLine[0], 48, "No WiFi connection")
        ctru.snprintf(&sizeLine[0],   48, "Connect to WiFi and retry")
        previewBuf[0] = 0
    case .HTTPCFail:
        ctru.snprintf(&statusLine[0], 48, "HTTPC init failed")
        ctru.snprintf(&sizeLine[0],   48, "See bottom screen")
        previewBuf[0] = 0
    case .RequestFail:
        ctru.snprintf(&statusLine[0], 48, "Request failed")
        ctru.snprintf(&sizeLine[0],   48, "See bottom screen")
        previewBuf[0] = 0
    case .DownloadFail:
        ctru.snprintf(&statusLine[0], 48, "Download failed")
        ctru.snprintf(&sizeLine[0],   48, "See bottom screen")
        previewBuf[0] = 0
    case .Pending:
        // shouldn't reach here
        ctru.snprintf(&statusLine[0], 48, "Unknown state")
        sizeLine[0]   = 0
        previewBuf[0] = 0
    }

    statusText:  c2d.C2D_Text
    sizeText:    c2d.C2D_Text
    previewText: c2d.C2D_Text
    c2d.C2D_TextParse(&statusText,  dynBuf, cstring(&statusLine[0]))
    c2d.C2D_TextParse(&sizeText,    dynBuf, cstring(&sizeLine[0]))
    c2d.C2D_TextParse(&previewText, dynBuf, cstring(&previewBuf[0]))

    clrResult := clrGreen if g_state == .Done else clrRed

    // ── Main render loop ──────────────────────────────────────────
    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        if ctru.hidKeysDown() & ctru.KEY_START != 0 do break

        c3d.C3D_FrameBegin(c3d.C3D_FRAME_SYNCDRAW)
        c2d.C2D_TargetClear(top, clrBg)
        c2d.C2D_SceneBegin(top)

        // Title
        c2d.C2D_DrawTextColor(&titleText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 8, 0, 0.72, 0.72, clrTitle)

        // URL (small, subtle)
        c2d.C2D_DrawTextColor(&urlText,
            c2d.C2D_AlignCenter | c2d.C2D_WithColor,
            200, 32, 0, 0.44, 0.44, clrSubtle)

        // Divider
        c2d.C2D_DrawRectSolid(16, 50, 0, 368, 1, clrDivider)

        // HTTP status / error label
        c2d.C2D_DrawTextColor(&statusText,
            c2d.C2D_WithColor,
            16, 58, 0, 0.65, 0.65, clrResult)

        // Byte count
        c2d.C2D_DrawTextColor(&sizeText,
            c2d.C2D_WithColor,
            16, 78, 0, 0.58, 0.58, clrWhite)

        // Divider before body preview
        c2d.C2D_DrawRectSolid(16, 100, 0, 368, 1, clrDivider)

        // Body preview label
        c2d.C2D_DrawTextColor(&previewText,
            c2d.C2D_WithColor,
            10, 106, 0, 0.38, 0.38, clrSubtle)

        c3d.C3D_FrameEnd(0)
    }

    // ── Cleanup ───────────────────────────────────────────────────
    c2d.C2D_TextBufDelete(staticBuf)
    c2d.C2D_TextBufDelete(dynBuf)
    c2d.C2D_Fini()
    c3d.C3D_Fini()
    ctru.gfxExit()
    return 0
}
