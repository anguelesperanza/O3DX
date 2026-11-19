package ctru

// ============================================================
// IPC command helpers
// 3ds/ipc.h
//
// Builds the header and translate words of an IPC command buffer, for calling services that have
// no wrapper.
// ============================================================

// IPC buffer access rights.
IPC_BufferRights :: enum u8 {
    R  = 2, // Readable
    W  = 4, // Writable
    RW = 6, // Readable and Writable
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Creates a command header to be used for IPC
    @(link_name = "ctru_ipc_make_header")
    IPC_MakeHeader :: proc(command_id: u16, normal_params: u32, translate_params: u32) -> u32 ---

    // Creates a header to share handles
    @(link_name = "ctru_ipc_desc_shared_handles")
    IPC_Desc_SharedHandles :: proc(number: u32) -> u32 ---

    // Creates the header to transfer handle ownership
    @(link_name = "ctru_ipc_desc_move_handles")
    IPC_Desc_MoveHandles :: proc(number: u32) -> u32 ---

    // Returns the code to ask the kernel to fill the handle with the current process ID.
    @(link_name = "ctru_ipc_desc_cur_process_id")
    IPC_Desc_CurProcessId :: proc() -> u32 ---

    // Creates a header describing a static buffer.
    @(link_name = "ctru_ipc_desc_static_buffer")
    IPC_Desc_StaticBuffer :: proc(size: uint, buffer_id: u32) -> u32 ---

    // Creates a header describing a buffer to be sent over PXI.
    @(link_name = "ctru_ipc_desc_pxi_buffer")
    IPC_Desc_PXIBuffer :: proc(size: uint, buffer_id: u32, is_read_only: bool) -> u32 ---

    // Creates a header describing a buffer from the main memory.
    @(link_name = "ctru_ipc_desc_buffer")
    IPC_Desc_Buffer :: proc(size: uint, rights: IPC_BufferRights) -> u32 ---
}
