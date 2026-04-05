package ctru

// ============================================================
// SSLC — TLS/SSL Service
// 3ds/services/sslc.h
//
// SSLC wraps a SOC socket fd with a TLS session.  You create a
// TCP socket via the SOC service, connect it normally, then hand
// it off to SSLC for the TLS handshake and encrypted I/O.
//
// Typical HTTPS flow:
//
//   fd := ctru.socket(ctru.AF_INET, ctru.SOCK_STREAM, 0)
//   // ... connect fd to port 443 ...
//
//   ctru.sslcInit(0)
//   defer ctru.sslcExit()
//
//   ctx: ctru.sslcContext
//   ctru.sslcCreateContext(&ctx, fd, ctru.SSLCOPT_Default, "example.com")
//   ctru.sslcStartConnection(&ctx, nil, nil)
//   defer ctru.sslcDestroyContext(&ctx)
//
//   ctru.sslcWrite(&ctx, raw_data(request), len(request))
//   ctru.sslcRead(&ctx, raw_data(buf[:]), len(buf), false)
// ============================================================

// ── Types ──────────────────────────────────────────────────────

/// TLS session context.  Allocate on the stack; init with sslcCreateContext.
sslcContext :: struct {
    servhandle:     Handle,
    sslchandle:     u32,
    sharedmem_handle: Handle,
}

// ── Certificate enums ──────────────────────────────────────────

/// Built-in root CA certificates stored in the SSL module.
SSLC_DefaultRootCert :: enum u32 {
    Nintendo_CA              = 0x1,
    Nintendo_CA_G2           = 0x2,
    Nintendo_CA_G3           = 0x3,
    Nintendo_Class2_CA       = 0x4,
    Nintendo_Class2_CA_G2    = 0x5,
    Nintendo_Class2_CA_G3    = 0x6,
    CyberTrust               = 0x7, // GTE CyberTrust Global Root
    AddTrust_External_CA     = 0x8, // AddTrust External CA Root
    COMODO                   = 0x9, // COMODO RSA Certification Authority
    USERTrust                = 0xA, // USERTrust RSA Certification Authority
    DigiCert_EV              = 0xB, // DigiCert High Assurance EV Root CA
}

/// Built-in client certificates.
SSLC_DefaultClientCert :: enum u32 {
    ClCertA = 0x40,
}

// ── SSL option flags ───────────────────────────────────────────
// Pass to sslcCreateContext or sslcContextClearOpt.

SSLCOPT_Default       :: u32(0)
SSLCOPT_DisableVerify :: u32(1 << 9)  // Skip server certificate verification
SSLCOPT_TLSv10        :: u32(1 << 11) // Force TLS 1.0

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── Lifecycle ─────────────────────────────────────────────

    // session_handle: pass 0 for normal use.
    sslcInit :: proc(session_handle: Handle) -> Result ---
    sslcExit :: proc() ---

    // ── TLS context ───────────────────────────────────────────

    // Wrap an already-connected SOC socket fd in a TLS session.
    // input_opt: bitmask of SSLCOPT_* flags.
    // hostname:  server name for SNI and certificate verification.
    sslcCreateContext  :: proc(context: ^sslcContext, sockfd: i32, input_opt: u32, hostname: cstring) -> Result ---

    // Destroy the TLS context.  The underlying sockfd must be closed separately.
    sslcDestroyContext :: proc(context: ^sslcContext) -> Result ---

    // Perform the TLS handshake.  Blocks until the connection is ready for I/O.
    // internal_retval and out may be nil.
    sslcStartConnection :: proc(context: ^sslcContext, internal_retval: ^i32, out: ^u32) -> Result ---

    // Receive up to len bytes over TLS.
    // Returns bytes received on success, or an error Result.
    // Set peek=true to inspect data without consuming it (like MSG_PEEK).
    sslcRead  :: proc(context: ^sslcContext, buf: rawptr, len: uint, peek: bool) -> Result ---

    // Send len bytes over TLS.
    // Returns bytes sent on success, or an error Result.
    sslcWrite :: proc(context: ^sslcContext, buf: rawptr, len: uint) -> Result ---

    // ── Context options ───────────────────────────────────────

    // Attach a RootCertChain to this context (created with sslcCreateRootCertChain).
    sslcContextSetRootCertChain :: proc(context: ^sslcContext, handle: u32) -> Result ---

    // Attach a client certificate context.
    sslcContextSetClientCert    :: proc(context: ^sslcContext, handle: u32) -> Result ---

    // Attach a cert chain from sslcCreate8CertChain.
    sslcContextSetHandle8       :: proc(context: ^sslcContext, handle: u32) -> Result ---

    // Clear specific SSL option bits on the context.
    sslcContextClearOpt :: proc(context: ^sslcContext, bitmask: u32) -> Result ---

    // Get the negotiated protocol and cipher suite strings (after sslcStartConnection).
    sslcContextGetProtocolCipher :: proc(context: ^sslcContext,
                                         outprotocols: [^]u8, outprotocols_maxsize: u32,
                                         outcipher: [^]u8,    outcipher_maxsize: u32) -> Result ---

    // Read an internal context state value.
    sslcContextGetState :: proc(context: ^sslcContext, out: ^u32) -> Result ---

    // Initialise shared memory for a context (buf must be 0x1000-aligned).
    sslcContextInitSharedmem :: proc(context: ^sslcContext, buf: [^]u8, size: u32) -> Result ---

    // Add a certificate to a context (format/use TBD per 3dbrew).
    sslcAddCert :: proc(context: ^sslcContext, buf: [^]u8, size: u32) -> Result ---

    // ── Root cert chains ──────────────────────────────────────

    // Create a custom root CA chain (max 2 per process).
    sslcCreateRootCertChain  :: proc(handle: ^u32) -> Result ---
    sslcDestroyRootCertChain :: proc(handle: u32) -> Result ---

    // Add a DER-encoded root CA cert to a chain.
    sslcAddTrustedRootCA :: proc(chain_handle: u32, cert: [^]u8, certsize: u32,
                                  cert_handle: ^u32) -> Result ---

    // Add one of the built-in root CA certs to a chain.
    sslcRootCertChainAddDefaultCert :: proc(chain_handle: u32, certID: SSLC_DefaultRootCert,
                                             cert_handle: ^u32) -> Result ---

    // Remove a cert from a chain.
    sslcRootCertChainRemoveCert :: proc(chain_handle: u32, cert_handle: u32) -> Result ---

    // ── Type-8 cert chains (purpose TBD) ─────────────────────

    sslcCreate8CertChain  :: proc(handle: ^u32) -> Result ---
    sslcDestroy8CertChain :: proc(handle: u32) -> Result ---
    sslc8CertChainAddCert :: proc(chain_handle: u32, cert: [^]u8, certsize: u32,
                                   cert_handle: ^u32) -> Result ---
    sslc8CertChainAddDefaultCert :: proc(chain_handle: u32, certID: u8,
                                          cert_handle: ^u32) -> Result ---
    sslc8CertChainRemoveCert :: proc(chain_handle: u32, cert_handle: u32) -> Result ---

    // ── Client certificates ───────────────────────────────────

    // Open a client cert context from a DER cert + key pair.
    sslcOpenClientCertContext :: proc(cert: [^]u8, certsize: u32,
                                       key: [^]u8, keysize: u32,
                                       handle: ^u32) -> Result ---

    // Open a client cert context using a built-in cert ID.
    sslcOpenDefaultClientCertContext :: proc(certID: SSLC_DefaultClientCert,
                                              handle: ^u32) -> Result ---

    sslcCloseClientCertContext :: proc(handle: u32) -> Result ---

    // ── Misc ──────────────────────────────────────────────────

    // Seed the SSL module's RNG via ps:ps SeedRNG.
    sslcSeedRNG :: proc() -> Result ---

    // Generate random bytes via ps:ps GenerateRandomData.
    sslcGenerateRandomData :: proc(buf: [^]u8, size: u32) -> Result ---
}
