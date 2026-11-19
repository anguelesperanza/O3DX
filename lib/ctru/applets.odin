package ctru

// ============================================================
// Error and Mii selector applets
// 3ds/applets/error.h, 3ds/applets/miiselector.h
//
// The error applet shows an error code or message in the system's own dialog; the Mii selector
// lets the user pick a Mii.
// ============================================================

ERROR_LANGUAGE_FLAG  :: 0x100 // ??-Unknown flag
ERROR_WORD_WRAP_FLAG :: 0x200 // ??-Unknown flag

errorType :: enum u16 {
    CODE                    = 0x0, // Displays the infrastructure communications-related error message corresponding to the error code.
    TEXT                    = 0x1, // Displays text passed to this applet.
    EULA                    = 0x2, // Displays the EULA
    TYPE_EULA_FIRST_BOOT    = 0x3, // Use prohibited.
    TYPE_EULA_DRAW_ONLY     = 0x4, // Use prohibited.
    TYPE_AGREE              = 0x5, // Use prohibited.
    CODE_LANGUAGE           = 0x100, // Displays a network error message in a specified language.
    TEXT_LANGUAGE           = 0x101, // Displays text passed to this applet in a specified language.
    EULA_LANGUAGE           = 0x102, // Displays EULA in a specified language.
    TEXT_WORD_WRAP          = 0x201, // Displays the custom error message passed to this applet with automatic line wrapping
    TEXT_LANGUAGE_WORD_WRAP = 0x301, // Displays the custom error message with automatic line wrapping and in the specified language.
}

errorScreenFlag :: enum u8 {
    NORMAL = 0,
    STEREO = 1,
}

errorReturnCode :: enum i8 {
    UNKNOWN        = -1,
    NONE           = 0x0,
    SUCCESS        = 0x1,
    NOT_SUPPORTED  = 0x2,
    HOME_BUTTON    = 0xA,
    SOFTWARE_RESET = 0xB,
    POWER_BUTTON   = 0xC,
}

errorConf :: struct {
    type_:           errorType,
    errorCode:       i32,
    upperScreenFlag: errorScreenFlag,
    useLanguage:     u16,
    Text:            [1900]u16,
    homeButton:      bool,
    softwareReset:   bool,
    appJump:         bool,
    returnCode:      errorReturnCode,
    eulaVersion:     u16,
}

// Magic value needed to launch the applet.
MIISELECTOR_MAGIC :: 0x13DE28CF
// Maximum length of title to be displayed at the top of the Mii selector applet
MIISELECTOR_TITLE_LEN :: 64
// Number of Guest Miis available for selection
MIISELECTOR_GUESTMII_SLOTS :: 6
// Maximum number of user Miis available for selection
MIISELECTOR_USERMII_SLOTS :: 100

// Parameter structure passed to AppletEd
MiiSelectorConf :: struct {
    enable_cancel_button:    u8, // Enables canceling of selection if nonzero.
    enable_selecting_guests: u8, // Makes Guets Miis selectable if nonzero.
    show_on_top_screen:      u8, // Shows applet on top screen if nonzero,
    _unk0x3:                 [5]u8, // @private
    title:                   [64]u16, // UTF16-LE string displayed at the top of the applet. If
    _unk0x88:                [4]u8, // @private
    show_guest_page:         u8, // If nonzero, the applet shows a page with Guest
    _unk0x8D:                [3]u8, // @private
    initial_index:           u32, // Index of the initially selected Mii. If
    mii_guest_whitelist:     [6]u8, // Each byte set to a nonzero value
    mii_whitelist:           [100]u8, // Each byte set to a nonzero value enables
    _unk0xFE:                u16, // @private
    magic:                   u32, // Will be set to MIISELECTOR_MAGIC before launching the
}
// Maximum length of the localized name of a Guest Mii
MIISELECTOR_GUESTMII_NAME_LEN :: 12

// Structure written by AppletEd
MiiSelectorReturn :: struct {
    no_mii_selected:        u32, // 0 if a Mii was selected, 1 if the selection was
    guest_mii_was_selected: u32, // 1 if a Guest Mii was selected, 0 otherwise.
    guest_mii_index:        u32, // Index of the selected Guest Mii,
    mii:                    MiiData, // Data of selected Mii.
    _pad0x68:               u16, // @private
    checksum:               u16, // Checksum of the returned Mii data.
    guest_mii_name:         [12]u16, // Localized name of a Guest Mii,
}

// AppletEd options
MIISELECTOR_CANCEL     :: 1 // Show the cancel button
MIISELECTOR_GUESTS     :: 2 // Make Guets Miis selectable
MIISELECTOR_TOP        :: 4 // Show AppletEd on top screen
MIISELECTOR_GUESTSTART :: 8 // Start on guest page

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Init the error applet.
    errorInit :: proc(err: ^errorConf, type_: errorType, lang: CFG_Language) ---

    // Sets error code to display.
    errorCode :: proc(err: ^errorConf, error: i32) ---

    // Sets error text to display.
    errorText :: proc(err: ^errorConf, text: cstring) ---

    // Displays the error applet.
    errorDisp :: proc(err: ^errorConf) ---

    // Initialize Mii selector config
    miiSelectorInit :: proc(conf: ^MiiSelectorConf) ---

    // Launch the Mii selector library applet
    miiSelectorLaunch :: proc(conf: ^MiiSelectorConf, returnbuf: ^MiiSelectorReturn) ---

    // Sets title of the Mii selector library applet
    miiSelectorSetTitle :: proc(conf: ^MiiSelectorConf, text: cstring) ---

    // Specifies which special options are enabled in the Mii selector
    miiSelectorSetOptions :: proc(conf: ^MiiSelectorConf, options: u32) ---

    // Specifies which guest Miis will be selectable
    miiSelectorWhitelistGuestMii :: proc(conf: ^MiiSelectorConf, index: u32) ---

    // Specifies which guest Miis will be unselectable
    miiSelectorBlacklistGuestMii :: proc(conf: ^MiiSelectorConf, index: u32) ---

    // Specifies which user Miis will be selectable
    miiSelectorWhitelistUserMii :: proc(conf: ^MiiSelectorConf, index: u32) ---

    // Specifies which user Miis will be selectable
    miiSelectorBlacklistUserMii :: proc(conf: ^MiiSelectorConf, index: u32) ---

    // Get Mii name
    miiSelectorReturnGetName :: proc(returnbuf: ^MiiSelectorReturn, out: [^]u8, max_size: uint) ---

    // Get Mii Author
    miiSelectorReturnGetAuthor :: proc(returnbuf: ^MiiSelectorReturn, out: [^]u8, max_size: uint) ---

    // Verifies that the Mii data returned from the applet matches its checksum
    miiSelectorChecksumIsValid :: proc(returnbuf: ^MiiSelectorReturn) -> bool ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Specifies which Mii the cursor should start from
    @(link_name = "ctru_mii_selector_set_initial_index")
    miiSelectorSetInitialIndex :: proc(conf: ^MiiSelectorConf, index: u32) ---
}
