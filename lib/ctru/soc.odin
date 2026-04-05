package ctru

// ============================================================
// SOC — BSD Socket Service
// 3ds/services/soc.h + sys/socket.h + netinet/in.h
//
// After calling socInit(), the standard POSIX socket functions
// (socket, connect, send, recv, etc.) are available through
// newlib.  socExit() must be called before freeing the buffer
// passed to socInit().
//
// Typical TCP client usage:
//
//   soc_buf := linearAlloc(0x100000)  // 1 MB, page-aligned
//   defer linearFree(soc_buf)
//   ctru.socInit(cast(^u32)soc_buf, 0x100000)
//   defer ctru.socExit()
//
//   fd := ctru.socket(ctru.AF_INET, ctru.SOCK_STREAM, 0)
//   addr := ctru.sockaddr_in{
//       sin_family = u16(ctru.AF_INET),
//       sin_port   = ctru.htons(80),
//       sin_addr   = ctru.in_addr{s_addr = ctru.inet_addr("93.184.216.34")},
//   }
//   ctru.connect(fd, cast(^ctru.sockaddr)&addr, size_of(addr))
//   ctru.send(fd, raw_data(request), len(request), 0)
//   // ... recv loop ...
//   ctru.closesocket(fd)
// ============================================================

// ── Address family constants ───────────────────────────────────

AF_UNSPEC :: i32(0)
AF_INET   :: i32(2)   // IPv4
AF_INET6  :: i32(10)  // IPv6 (limited support on 3DS)

// ── Socket type constants ──────────────────────────────────────

SOCK_STREAM    :: i32(1) // TCP (reliable, connection-oriented)
SOCK_DGRAM     :: i32(2) // UDP (unreliable, connectionless)
SOCK_RAW       :: i32(3) // Raw IP packets
SOCK_NONBLOCK  :: i32(0x4000) // Non-blocking mode flag (OR with type)

// ── Protocol constants ─────────────────────────────────────────

IPPROTO_IP  :: i32(0)
IPPROTO_TCP :: i32(6)
IPPROTO_UDP :: i32(17)

// ── SOL_SOCKET options ────────────────────────────────────────

SOL_SOCKET   :: i32(0xFFFF)
SO_DEBUG     :: i32(0x0001)
SO_REUSEADDR :: i32(0x0004)
SO_KEEPALIVE :: i32(0x0008)
SO_DONTROUTE :: i32(0x0010)
SO_BROADCAST :: i32(0x0020)
SO_LINGER    :: i32(0x0080)
SO_OOBINLINE :: i32(0x0100)
SO_SNDBUF    :: i32(0x1001)
SO_RCVBUF    :: i32(0x1002)
SO_SNDLOWAT  :: i32(0x1003)
SO_RCVLOWAT  :: i32(0x1004)
SO_SNDTIMEO  :: i32(0x1005)
SO_RCVTIMEO  :: i32(0x1006)
SO_ERROR     :: i32(0x1007)
SO_TYPE      :: i32(0x1008)

// SOL_CONFIG is a 3DS-specific level for SOCU_GetNetworkOpt.
SOL_CONFIG :: i32(0xFFFE)

// ── TCP options ────────────────────────────────────────────────

IPPROTO_TCP_NODELAY :: i32(1)

// ── send/recv flags ────────────────────────────────────────────

MSG_OOB       :: i32(0x0001)
MSG_PEEK      :: i32(0x0002)
MSG_DONTROUTE :: i32(0x0004)
MSG_DONTWAIT  :: i32(0x0008) // Non-blocking send/recv
MSG_WAITALL   :: i32(0x0100)

// ── shutdown() how constants ───────────────────────────────────

SHUT_RD   :: i32(0)
SHUT_WR   :: i32(1)
SHUT_RDWR :: i32(2)

// ── Special IP addresses ───────────────────────────────────────

INADDR_ANY       :: u32(0x00000000)
INADDR_BROADCAST :: u32(0xFFFFFFFF)
INADDR_LOOPBACK  :: u32(0x7F000001)
INADDR_NONE      :: u32(0xFFFFFFFF)

// ── getaddrinfo return codes ───────────────────────────────────

EAI_NONAME  :: i32(8)
EAI_SERVICE :: i32(9)
EAI_SOCKTYPE :: i32(10)
EAI_FAMILY  :: i32(4)

// AI_* flags for addrinfo.ai_flags
AI_PASSIVE     :: i32(0x01)
AI_CANONNAME   :: i32(0x02)
AI_NUMERICHOST :: i32(0x04)

// ── Types ──────────────────────────────────────────────────────

socklen_t :: u32

/// IPv4 address (network byte order).
in_addr :: struct {
    s_addr: u32,
}

/// Generic socket address — cast to sockaddr_in for IPv4.
sockaddr :: struct {
    sa_family: u16,
    sa_data:   [14]u8,
}

/// IPv4 socket address.
sockaddr_in :: struct {
    sin_family: u16,         // AF_INET
    sin_port:   u16,         // port in network byte order — use htons()
    sin_addr:   in_addr,     // IPv4 address in network byte order
    sin_zero:   [8]u8,       // padding, must be zero
}

/// Large enough to hold any socket address (IPv4 or IPv6).
sockaddr_storage :: struct #align(8) {
    ss_family: u16,
    _pad:      [126]u8,
}

/// Linger option for SO_LINGER.
linger :: struct {
    l_onoff:  i32, // 0 = disabled
    l_linger: i32, // timeout in seconds
}

/// Hint/result structure for getaddrinfo().
addrinfo :: struct {
    ai_flags:     i32,
    ai_family:    i32,
    ai_socktype:  i32,
    ai_protocol:  i32,
    ai_addrlen:   socklen_t,
    ai_addr:      ^sockaddr,
    ai_canonname: cstring,
    ai_next:      ^addrinfo,
}

/// Host entry returned by gethostbyname().
hostent :: struct {
    h_name:      cstring,   // official hostname
    h_aliases:   ^cstring,  // null-terminated list of aliases
    h_addrtype:  i32,       // AF_INET
    h_length:    i32,       // length of each address
    h_addr_list: ^^u8,      // null-terminated list of addresses
}

// ── NetworkOpt values for SOCU_GetNetworkOpt ──────────────────

NetworkOpt :: enum u32 {
    MAC_ADDRESS     = 0x1004,
    ARP_TABLE       = 0x3002,
    IP_INFO         = 0x4003,
    IP_MTU          = 0x4004,
    ROUTING_TABLE   = 0x4006,
    UDP_NUMBER      = 0x8002,
    UDP_TABLE       = 0x8003,
    TCP_NUMBER      = 0x9002,
    TCP_TABLE       = 0x9003,
    DNS_TABLE       = 0xB003,
    DHCP_LEASE_TIME = 0xC001,
}

/// ARP table entry from SOCU_GetNetworkOpt(NETOPT_ARP_TABLE).
SOCU_ARPTableEntry :: struct {
    unk0:    u32,
    ip:      in_addr,
    mac:     [6]u8,
    padding: [2]u8,
}

/// IP configuration from SOCU_GetNetworkOpt(NETOPT_IP_INFO).
SOCU_IPInfo :: struct {
    ip:        in_addr,
    netmask:   in_addr,
    broadcast: in_addr,
}

/// Routing table entry from SOCU_GetNetworkOpt(NETOPT_ROUTING_TABLE).
SOCU_RoutingTableEntry :: struct {
    dest_ip: in_addr,
    netmask: in_addr,
    gateway: in_addr,
    flags:   u32,
    time:    u64,
}

/// UDP socket table entry.
SOCU_UDPTableEntry :: struct {
    local:  sockaddr_storage,
    remote: sockaddr_storage,
}

/// TCP socket table entry.
SOCU_TCPTableEntry :: struct {
    state:  u32,
    local:  sockaddr_storage,
    remote: sockaddr_storage,
}

/// DNS server table entry.
SOCU_DNSTableEntry :: struct {
    family:  u32,
    ip:      in_addr,
    padding: [12]u8,
}

// TCP connection states
TCP_STATE_CLOSED      :: u32(1)
TCP_STATE_LISTEN      :: u32(2)
TCP_STATE_ESTABLISHED :: u32(5)
TCP_STATE_FINWAIT1    :: u32(6)
TCP_STATE_FINWAIT2    :: u32(7)
TCP_STATE_CLOSE_WAIT  :: u32(8)
TCP_STATE_LAST_ACK    :: u32(9)
TCP_STATE_TIME_WAIT   :: u32(11)

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // ── SOC service lifecycle ─────────────────────────────────
    //
    // context_addr must point to a page-aligned (0x1000) buffer allocated
    // with linearAlloc().  The buffer cannot be accessed by the process
    // while SOC is active — free it only after socExit().
    // A typical size is 0x100000 (1 MB).

    socInit :: proc(context_addr: ^u32, context_size: u32) -> Result ---
    socExit :: proc() -> Result ---

    // ── SOC utility functions ─────────────────────────────────

    // Returns the system's host ID (local IPv4 address as a long).
    gethostid   :: proc() -> i32 ---
    // Writes the system hostname into name (up to namelen bytes).
    gethostname :: proc(name: [^]u8, namelen: uint) -> i32 ---

    SOCU_ShutdownSockets :: proc() -> i32 ---
    SOCU_CloseSockets    :: proc() -> i32 ---

    // Query network configuration options (similar to getsockopt at the network level).
    // level must be SOL_CONFIG.
    SOCU_GetNetworkOpt :: proc(level: i32, optname: NetworkOpt, optval: rawptr, optlen: ^socklen_t) -> i32 ---

    // Convenience wrapper: fills ip, netmask, broadcast from the active interface.
    SOCU_GetIPInfo :: proc(ip: ^in_addr, netmask: ^in_addr, broadcast: ^in_addr) -> i32 ---

    // Register a socket as a "global" socket visible across threads.
    SOCU_AddGlobalSocket :: proc(sockfd: i32) -> i32 ---

    // ── BSD socket API (enabled after socInit) ────────────────

    // Create a socket.  Returns a file descriptor >= 0, or -1 on error.
    socket  :: proc(domain: i32, type: i32, protocol: i32) -> i32 ---

    // Connect to a remote address (TCP) or set default destination (UDP).
    connect :: proc(sockfd: i32, addr: ^sockaddr, addrlen: socklen_t) -> i32 ---

    // Bind to a local address (for servers or UDP senders).
    bind    :: proc(sockfd: i32, addr: ^sockaddr, addrlen: socklen_t) -> i32 ---

    // Begin listening for incoming connections (TCP servers).
    listen  :: proc(sockfd: i32, backlog: i32) -> i32 ---

    // Accept an incoming connection.  Returns a new fd for the connection.
    accept  :: proc(sockfd: i32, addr: ^sockaddr, addrlen: ^socklen_t) -> i32 ---

    // Send data on a connected socket.
    send    :: proc(sockfd: i32, buf: rawptr, len: uint, flags: i32) -> i32 ---

    // Receive data from a connected socket.
    recv    :: proc(sockfd: i32, buf: rawptr, len: uint, flags: i32) -> i32 ---

    // Send a datagram to a specific address (UDP).
    sendto  :: proc(sockfd: i32, buf: rawptr, len: uint, flags: i32,
                    dest_addr: ^sockaddr, addrlen: socklen_t) -> i32 ---

    // Receive a datagram and learn the sender's address (UDP).
    recvfrom :: proc(sockfd: i32, buf: rawptr, len: uint, flags: i32,
                     src_addr: ^sockaddr, addrlen: ^socklen_t) -> i32 ---

    // Shut down part of a full-duplex connection.
    shutdown :: proc(sockfd: i32, how: i32) -> i32 ---

    // Close a socket file descriptor.
    @(link_name = "close")
    closesocket :: proc(sockfd: i32) -> i32 ---

    // Set socket options.
    setsockopt :: proc(sockfd: i32, level: i32, optname: i32,
                       optval: rawptr, optlen: socklen_t) -> i32 ---

    // Get socket options.
    getsockopt :: proc(sockfd: i32, level: i32, optname: i32,
                       optval: rawptr, optlen: ^socklen_t) -> i32 ---

    // Get the address the socket is bound to.
    getsockname :: proc(sockfd: i32, addr: ^sockaddr, addrlen: ^socklen_t) -> i32 ---

    // Get the address of the peer the socket is connected to.
    getpeername :: proc(sockfd: i32, addr: ^sockaddr, addrlen: ^socklen_t) -> i32 ---

    // ── Name resolution ───────────────────────────────────────

    // Resolve hostname/service to a list of addrinfo structs.
    // Free the result with freeaddrinfo() when done.
    getaddrinfo  :: proc(node: cstring, service: cstring,
                         hints: ^addrinfo, res: ^^addrinfo) -> i32 ---
    freeaddrinfo :: proc(res: ^addrinfo) ---

    // Older hostname resolution — returns a static hostent struct.
    // Prefer getaddrinfo for new code.
    gethostbyname :: proc(name: cstring) -> ^hostent ---

    // Convert a string error code from getaddrinfo to a message.
    gai_strerror :: proc(errcode: i32) -> cstring ---

    // ── Byte-order conversion ─────────────────────────────────

    // Host-to-network and network-to-host byte order conversions.
    // Always use these when filling sin_port / sin_addr.
    htons :: proc(hostshort: u16) -> u16 ---
    htonl :: proc(hostlong:  u32) -> u32 ---
    ntohs :: proc(netshort:  u16) -> u16 ---
    ntohl :: proc(netlong:   u32) -> u32 ---

    // ── Address string conversion ─────────────────────────────

    // Convert a dotted-decimal string ("1.2.3.4") to a u32 in network byte order.
    // Returns INADDR_NONE on error.
    inet_addr :: proc(cp: cstring) -> u32 ---

    // Convert an in_addr to a dotted-decimal string (static buffer — not thread-safe).
    inet_ntoa :: proc(in: in_addr) -> cstring ---

    // Convert dotted-decimal string to in_addr.  Returns 1 on success, 0 on failure.
    inet_aton :: proc(cp: cstring, inp: ^in_addr) -> i32 ---
}
