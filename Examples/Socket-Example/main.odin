package socket_example

import ctru "../../lib/ctru"

// Tests the socket fixes with a real network round trip (needs Wi-Fi):
//   - htons / htonl / ntohs / ntohl are Odin byte swaps now (they were
//     foreign procedures with no symbol and failed to link);
//   - hostent's h_addrtype / h_length are 16-bit (they were 32-bit, so every
//     field after them was read from the wrong place);
//   - addrinfo has ai_canonname before ai_addr (they were swapped);
//   - sockaddr / sockaddr_storage match C.
//
// It resolves example.com twice (gethostbyname and getaddrinfo), connects
// over TCP to the address getaddrinfo returned, sends an HTTP/1.0 GET and
// prints the status line of the reply.
//
// Expected: h_addrtype 2, h_length 4, the same IPv4 address from both
// lookups, ai_addrlen 16, port 80, and "HTTP/1.0 200 OK" (or 1.1).
//
// Controls:
//   A      run again
//   START  exit

SOC_ALIGN       :: 0x1000
SOC_BUFFER_SIZE :: 0x100000

HOST :: "example.com"

REQUEST :: "GET / HTTP/1.0\r\nHost: example.com\r\nConnection: close\r\n\r\n"

pass_fail :: proc "contextless" (ok: bool) -> cstring {
    if ok do return "PASS"
    return "FAIL"
}

run :: proc "contextless" () {
    ctru.consoleClear()
    ctru.printf("Socket-Example\n\n")

    // ── Byte order ────────────────────────────────────────────────
    ctru.printf("%s htons(0x1234) = 0x%04X\n", pass_fail(ctru.htons(0x1234) == 0x3412), u32(ctru.htons(0x1234)))
    ctru.printf("%s htonl(0x11223344) = 0x%08lX\n", pass_fail(ctru.htonl(0x11223344) == 0x44332211), ctru.htonl(0x11223344))

    own := ctru.in_addr{s_addr = u32(ctru.gethostid())}
    ctru.printf("     this console: %s\n\n", ctru.inet_ntoa(own))

    // ── gethostbyname ─────────────────────────────────────────────
    he := ctru.gethostbyname(HOST)
    if he == nil {
        ctru.printf("FAIL gethostbyname(%s) returned NULL\n", cstring(HOST))
        ctru.printf("     (is Wi-Fi on?)\n")
        return
    }
    ctru.printf("gethostbyname:\n")
    ctru.printf("  h_name     %s\n", he.h_name)
    ctru.printf("  %s h_addrtype %d (expect 2)\n", pass_fail(he.h_addrtype == 2), i32(he.h_addrtype))
    ctru.printf("  %s h_length   %d (expect 4)\n", pass_fail(he.h_length == 4), i32(he.h_length))
    first := (cast(^ctru.in_addr)he.h_addr_list^)^
    ctru.printf("  address    %s\n\n", ctru.inet_ntoa(first))

    // ── getaddrinfo ───────────────────────────────────────────────
    hints := ctru.addrinfo{ai_family = ctru.AF_INET, ai_socktype = ctru.SOCK_STREAM}
    res: ^ctru.addrinfo
    rc := ctru.getaddrinfo(HOST, "80", &hints, &res)
    if rc != 0 || res == nil {
        ctru.printf("FAIL getaddrinfo: %d %s\n", rc, ctru.gai_strerror(rc))
        return
    }
    sin := cast(^ctru.sockaddr_in)res.ai_addr
    ctru.printf("getaddrinfo:\n")
    ctru.printf("  %s ai_family  %d (expect 2)\n", pass_fail(res.ai_family == ctru.AF_INET), res.ai_family)
    ctru.printf("  %s ai_addrlen %lu (expect 16)\n", pass_fail(res.ai_addrlen == 16), res.ai_addrlen)
    ctru.printf("  %s port       %d (expect 80)\n", pass_fail(ctru.ntohs(sin.sin_port) == 80), i32(ctru.ntohs(sin.sin_port)))
    ctru.printf("  %s address    %s\n", pass_fail(sin.sin_addr.s_addr == first.s_addr), ctru.inet_ntoa(sin.sin_addr))
    ctru.printf("     (should match gethostbyname)\n\n")

    // ── TCP round trip ────────────────────────────────────────────
    sock := ctru.socket(ctru.AF_INET, ctru.SOCK_STREAM, ctru.IPPROTO_IP)
    if sock < 0 {
        ctru.printf("FAIL socket(): %d\n", sock)
        ctru.freeaddrinfo(res)
        return
    }
    if ctru.connect(sock, res.ai_addr, res.ai_addrlen) != 0 {
        ctru.printf("FAIL connect()\n")
        ctru.closesocket(sock)
        ctru.freeaddrinfo(res)
        return
    }
    ctru.freeaddrinfo(res)

    request := REQUEST
    sent := ctru.send(sock, raw_data(request), len(request), 0)
    ctru.printf("sent %d bytes\n", sent)

    buf: [1024]u8
    total := 0
    status_len := 0
    for {
        n := ctru.recv(sock, &buf[total], uint(len(buf) - 1 - total), 0)
        if n <= 0 do break
        total += int(n)
        if total >= len(buf) - 1 do break
    }
    ctru.closesocket(sock)

    for status_len < total && buf[status_len] != '\r' && buf[status_len] != '\n' do status_len += 1
    buf[status_len] = 0
    ok := total >= 12 && buf[0] == 'H' && buf[9] == '2' && buf[10] == '0' && buf[11] == '0'
    ctru.printf("%s reply: %s\n", pass_fail(ok), cstring(&buf[0]))
}

@(export, link_name = "odin_main")
socket_main :: proc "c" (argc: i32, argv: [^]cstring) -> i32 {
    ctru.gfxInitDefault()
    ctru.consoleInit(ctru.GFX_TOP, nil)

    soc_buffer := ctru.memalign(SOC_ALIGN, SOC_BUFFER_SIZE)
    soc_rc := ctru.socInit(cast(^u32)soc_buffer, SOC_BUFFER_SIZE)
    if soc_rc < 0 {
        ctru.printf("socInit failed: 0x%08lX\n", soc_rc)
    } else {
        run()
    }
    ctru.printf("\nA: run again   START: exit\n")

    for ctru.aptMainLoop() {
        ctru.hidScanInput()
        down := ctru.hidKeysDown()
        if down & ctru.KEY_START != 0 do break
        if down & ctru.KEY_A != 0 && soc_rc >= 0 {
            run()
            ctru.printf("\nA: run again   START: exit\n")
        }
        ctru.gfxFlushBuffers()
        ctru.gfxSwapBuffers()
        ctru.gspWaitForEvent(.VBLANK0, true)
    }

    ctru.socExit()
    ctru.free(soc_buffer)
    ctru.gfxExit()
    return 0
}
