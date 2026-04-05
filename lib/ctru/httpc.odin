package ctru

// ============================================================
// HTTPC — HTTP Client Service
// 3ds/services/httpc.h
//
// HTTPC is the highest-level networking API on the 3DS — it
// handles DNS, TCP, TLS, and HTTP in a single service call.
// For most GET/POST use cases, this is the right choice.
//
// Simple GET example:
//
//   ctru.httpcInit(0)
//   defer ctru.httpcExit()
//
//   ctx: ctru.httpcContext
//   ctru.httpcOpenContext(&ctx, .GET, "https://example.com/data.json", 0)
//   defer ctru.httpcCloseContext(&ctx)
//
//   // For HTTPS, trust Nintendo's built-in CA bundle:
//   ctru.httpcAddDefaultCert(&ctx, .DigiCert_EV)
//   // Or disable cert verification entirely (insecure):
//   ctru.httpcSetSSLOpt(&ctx, ctru.SSLCOPT_DisableVerify)
//
//   ctru.httpcBeginRequest(&ctx)
//
//   status: u32
//   ctru.httpcGetResponseStatusCode(&ctx, &status)  // 200, 404, etc.
//
//   buf: [4096]u8
//   downloaded: u32
//   ctru.httpcDownloadData(&ctx, raw_data(buf[:]), len(buf), &downloaded)
// ============================================================

// ── Types ──────────────────────────────────────────────────────

/// HTTP context.  Stack-allocate and pass to httpcOpenContext to initialise.
httpcContext :: struct {
    servhandle: Handle,
    httphandle: u32,
}

// ── Enums ─────────────────────────────────────────────────────

/// HTTP request method.
HTTPC_RequestMethod :: enum u32 {
    GET    = 0x1,
    POST   = 0x2,
    HEAD   = 0x3,
    PUT    = 0x4,
    DELETE = 0x5,
}

/// Internal request state returned by httpcGetRequestState.
HTTPC_RequestStatus :: enum u32 {
    REQUEST_IN_PROGRESS = 0x5, // Waiting for server response headers
    DOWNLOAD_READY      = 0x7, // Headers received, body ready to read
}

/// Keep-alive connection option.
HTTPC_KeepAlive :: enum u32 {
    DISABLED = 0x0,
    ENABLED  = 0x1,
}

// ── Result code constants ──────────────────────────────────────

// Returned by httpcReceiveData when more data is pending (keep reading).
HTTPC_RESULTCODE_DOWNLOADPENDING :: u32(0xD840A02B)
// Returned when a requested response header does not exist.
HTTPC_RESULTCODE_NOTFOUND        :: u32(0xD840A028)
// Returned when any timeout function times out.
HTTPC_RESULTCODE_TIMEDOUT        :: u32(0xD820A069)

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    // sharedmem_size: size of shared memory for POST body upload.
    // Pass 0 for GET requests.  Must be a multiple of 0x1000.
    httpcInit :: proc(sharedmem_size: u32) -> Result ---
    httpcExit :: proc() ---

    // ── Context management ────────────────────────────────────

    // Open an HTTP context for the given URL and method.
    // use_defaultproxy: pass 0 to use the system proxy settings.
    httpcOpenContext   :: proc(context: ^httpcContext, method: HTTPC_RequestMethod,
                               url: cstring, use_defaultproxy: u32) -> Result ---

    // Close a context.  The entire response body must be downloaded first,
    // or this will hang.  Use httpcCancelConnection to abandon a transfer.
    httpcCloseContext  :: proc(context: ^httpcContext) -> Result ---

    // Abort an in-progress connection/download.
    httpcCancelConnection :: proc(context: ^httpcContext) -> Result ---

    // ── Request headers and body ──────────────────────────────

    // Add a request header (e.g. "User-Agent", "application/3ds").
    httpcAddRequestHeaderField :: proc(context: ^httpcContext,
                                       name: cstring, value: cstring) -> Result ---

    // Add a URL-encoded POST form field (name=value).
    httpcAddPostDataAscii  :: proc(context: ^httpcContext,
                                   name: cstring, value: cstring) -> Result ---

    // Add a binary POST field.
    httpcAddPostDataBinary :: proc(context: ^httpcContext,
                                   name: cstring, value: [^]u8, len: u32) -> Result ---

    // Set the raw POST body (replaces form fields).
    httpcAddPostDataRaw    :: proc(context: ^httpcContext,
                                   data: [^]u32, len: u32) -> Result ---

    // ── Sending the request ───────────────────────────────────

    // Send the request.  After this call you can poll for the response.
    httpcBeginRequest :: proc(context: ^httpcContext) -> Result ---

    // ── Reading the response ──────────────────────────────────

    // Read up to size bytes of the response body into buffer.
    // Returns HTTPC_RESULTCODE_DOWNLOADPENDING if more data remains.
    httpcReceiveData :: proc(context: ^httpcContext, buffer: [^]u8, size: u32) -> Result ---

    // Same as httpcReceiveData with a nanosecond timeout.
    httpcReceiveDataTimeout :: proc(context: ^httpcContext, buffer: [^]u8, size: u32,
                                    timeout: u64) -> Result ---

    // Poll the request state (REQUEST_IN_PROGRESS or DOWNLOAD_READY).
    httpcGetRequestState :: proc(context: ^httpcContext,
                                  out: ^HTTPC_RequestStatus) -> Result ---

    // Get bytes downloaded so far and total content size.
    // contentsize will be 0 if the server did not send Content-Length.
    httpcGetDownloadSizeState :: proc(context: ^httpcContext,
                                       downloadedsize: ^u32,
                                       contentsize: ^u32) -> Result ---

    // Get the HTTP status code (200, 404, etc.).
    httpcGetResponseStatusCode :: proc(context: ^httpcContext, out: ^u32) -> Result ---

    // Same with a nanosecond timeout.
    httpcGetResponseStatusCodeTimeout :: proc(context: ^httpcContext,
                                               out: ^u32, timeout: u64) -> Result ---

    // Get a response header value by name (e.g. "Content-Type").
    httpcGetResponseHeader :: proc(context: ^httpcContext, name: cstring,
                                    value: [^]u8, valuebuf_maxsize: u32) -> Result ---

    // ── Convenience download helper ───────────────────────────

    // Download the entire response body into buffer in a loop.
    // Handles the DOWNLOADPENDING loop internally.
    // downloadedsize receives the total bytes written.
    httpcDownloadData :: proc(context: ^httpcContext, buffer: [^]u8, size: u32,
                               downloadedsize: ^u32) -> Result ---

    // ── SSL / TLS options ─────────────────────────────────────
    //
    // HTTPC uses SSLCOPT_* flags from sslc.odin.

    // Add a DER-encoded trusted root CA certificate.
    httpcAddTrustedRootCA :: proc(context: ^httpcContext, cert: [^]u8, certsize: u32) -> Result ---

    // Add one of the built-in root CA certificates (see SSLC_DefaultRootCert).
    // Call this for HTTPS connections to well-known CAs.
    httpcAddDefaultCert :: proc(context: ^httpcContext, certID: SSLC_DefaultRootCert) -> Result ---

    // Attach a RootCertChain built with sslcCreateRootCertChain / httpcCreateRootCertChain.
    httpcSelectRootCertChain :: proc(context: ^httpcContext,
                                      RootCertChain_contexthandle: u32) -> Result ---

    // Set the SSL option flags (SSLCOPT_DisableVerify, SSLCOPT_TLSv10, etc.).
    httpcSetSSLOpt :: proc(context: ^httpcContext, options: u32) -> Result ---

    // Clear specific SSL option flags.
    httpcSetSSLClearOpt :: proc(context: ^httpcContext, options: u32) -> Result ---

    // ── Client certificates ───────────────────────────────────

    httpcSetClientCert :: proc(context: ^httpcContext,
                                cert: [^]u8, certsize: u32,
                                privk: [^]u8, privk_size: u32) -> Result ---

    httpcSetClientCertDefault :: proc(context: ^httpcContext,
                                       certID: SSLC_DefaultClientCert) -> Result ---

    httpcSetClientCertContext :: proc(context: ^httpcContext,
                                       ClientCert_contexthandle: u32) -> Result ---

    // ── Root cert chain management ────────────────────────────

    httpcCreateRootCertChain  :: proc(handle: ^u32) -> Result ---
    httpcDestroyRootCertChain :: proc(handle: u32) -> Result ---

    httpcRootCertChainAddCert :: proc(chain_handle: u32, cert: [^]u8, certsize: u32,
                                       cert_handle: ^u32) -> Result ---

    httpcRootCertChainAddDefaultCert :: proc(chain_handle: u32,
                                              certID: SSLC_DefaultRootCert,
                                              cert_handle: ^u32) -> Result ---

    httpcRootCertChainRemoveCert :: proc(chain_handle: u32, cert_handle: u32) -> Result ---

    // ── Client cert context management ────────────────────────

    httpcOpenClientCertContext :: proc(cert: [^]u8, certsize: u32,
                                        privk: [^]u8, privk_size: u32,
                                        handle: ^u32) -> Result ---

    httpcOpenDefaultClientCertContext :: proc(certID: SSLC_DefaultClientCert,
                                               handle: ^u32) -> Result ---

    httpcCloseClientCertContext :: proc(handle: u32) -> Result ---

    // ── Keep-Alive ────────────────────────────────────────────

    httpcSetKeepAlive :: proc(context: ^httpcContext, option: HTTPC_KeepAlive) -> Result ---
}
