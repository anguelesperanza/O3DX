package ctru

// ============================================================
// Homebrew environment
// 3ds/env.h
//
// What the homebrew loader passed in: whether the app is running as a 3DSX, the heap sizes it
// was given, and the services it was handed.
// ============================================================

// System run-flags.
RUNFLAG_APTWORKAROUND :: 1 // Use APT workaround.
RUNFLAG_APTREINIT     :: 2 // Reinitialize APT.
RUNFLAG_APTCHAINLOAD  :: 4 // Chainload APT on return.

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Retrieves a handle from the environment handle list.
    envGetHandle :: proc(name: cstring) -> Handle ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Gets whether the application was launched from a homebrew environment.
    @(link_name = "ctru_env_is_homebrew")
    envIsHomebrew :: proc() -> bool ---

    // Gets the environment-recommended app ID to use with APT.
    @(link_name = "ctru_env_get_apt_app_id")
    envGetAptAppId :: proc() -> u32 ---

    // Gets the size of the application heap.
    @(link_name = "ctru_env_get_heap_size")
    envGetHeapSize :: proc() -> u32 ---

    // Gets the size of the linear heap.
    @(link_name = "ctru_env_get_linear_heap_size")
    envGetLinearHeapSize :: proc() -> u32 ---

    // Gets the environment argument list.
    @(link_name = "ctru_env_get_system_arg_list")
    envGetSystemArgList :: proc() -> cstring ---

    // Gets the environment run flags.
    @(link_name = "ctru_env_get_system_run_flags")
    envGetSystemRunFlags :: proc() -> u32 ---
}
