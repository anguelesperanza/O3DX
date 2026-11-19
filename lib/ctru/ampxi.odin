package ctru

// ============================================================
// AMPXI
// 3ds/services/ampxi.h
//
// The PXI side of the application manager.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes AMPXI.
    ampxiInit :: proc(servhandle: Handle) -> Result ---

    // Exits AMPXI.
    ampxiExit :: proc() ---

    // Writes a TWL save-file to NAND. https://www.3dbrew.org/wiki/AMPXI:WriteTWLSavedata
    AMPXI_WriteTWLSavedata :: proc(titleid: u64, buffer: ^u8, size: u32, image_filepos: u32, section_type: u8, operation: u8) -> Result ---

    // Finalizes title installation. https://3dbrew.org/wiki/AMPXI:InstallTitlesFinish
    AMPXI_InstallTitlesFinish :: proc(mediaType: FS_MediaType, db: u8, titlecount: u32, tidlist: ^u64) -> Result ---
}
