package ctru

// ============================================================
// 3dslink
// 3ds/3dslink.h
//
// Redirects stdout and stderr to a 3dslink server on the PC that sent the app.
// ============================================================

LINK3DS_COMM_PORT :: 17491

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Connects to the 3dslink host, setting up an output stream.
    link3dsConnectToHost :: proc(redirStdout: bool, redirStderr: bool) -> i32 ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Same as link3dsConnectToHost but redirecting both stdout/stderr.
    @(link_name = "ctru_link_3ds_stdio")
    link3dsStdio :: proc() -> i32 ---

    // Same as link3dsConnectToHost but redirecting only stderr.
    @(link_name = "ctru_link_3ds_stdio_for_debug")
    link3dsStdioForDebug :: proc() -> i32 ---
}
