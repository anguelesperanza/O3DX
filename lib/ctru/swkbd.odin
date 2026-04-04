package ctru

// ============================================================
// Software Keyboard — 3ds/applets/swkbd.h
// Launches the system on-screen keyboard to collect text input.
//
// Typical usage:
//
//   state: ctru.SwkbdState
//   buf:   [256]u8
//
//   ctru.swkbdInit(&state, .NORMAL, 2, 255)
//   ctru.swkbdSetHintText(&state, "Enter your name")
//   button := ctru.swkbdInputText(&state, raw_data(&buf[:]), 256)
//   if button == .CONFIRM {
//       name := string(buf[:ctru.swkbdGetLength(&state)])
//   }
// ============================================================

// ── Enums ─────────────────────────────────────────────────────

/// Keyboard layout style.
SwkbdType :: enum i32 {
    NORMAL  = 0, // QWERTY + accents + symbols + mobile pages
    QWERTY  = 1, // QWERTY only
    NUMPAD  = 2, // Number pad
    WESTERN = 3, // No Japanese input on JPN systems; same as NORMAL elsewhere
}

/// Which inputs the keyboard will accept.
SwkbdValidInput :: enum i32 {
    ANYTHING           = 0, // All inputs accepted
    NOTEMPTY           = 1, // Empty strings rejected
    NOTEMPTY_NOTBLANK  = 2, // Empty or whitespace-only strings rejected
    NOTBLANK           = 3, // Whitespace-only rejected, empty accepted
    FIXEDLEN           = 4, // Input must equal maxTextLength exactly
}

/// Which dialog button was pressed.
SwkbdButton :: enum i32 {
    LEFT    = 0, // Left button (usually Cancel)
    MIDDLE  = 1, // Middle button (usually I Forgot)
    RIGHT   = 2, // Right button (usually OK / Confirm)
    CONFIRM = 2, // Alias for RIGHT
    NONE    = 3, // No button — check SwkbdResult for the actual reason
}

/// Password concealment mode.
SwkbdPasswordMode :: enum i32 {
    NONE       = 0, // Characters shown as typed
    HIDE       = 1, // Characters hidden immediately
    HIDE_DELAY = 2, // Characters hidden after a short delay
}

/// Return value from the filter callback.
SwkbdCallbackResult :: enum i32 {
    OK       = 0, // Input is valid
    CLOSE    = 1, // Show error message and close keyboard
    CONTINUE = 2, // Show error message and keep keyboard open
}

/// Detailed result code available after swkbdInputText returns SWKBD_BUTTON_NONE.
SwkbdResult :: enum i32 {
    NONE          = -1, // Unused sentinel
    INVALID_INPUT = -2, // Bad parameters passed to swkbd
    OUTOFMEM      = -3, // Memory allocation failed

    D0_CLICK  = 0, // Button pressed in 1-button dialog
    D1_CLICK0 = 1, // Left button in 2-button dialog
    D1_CLICK1 = 2, // Right button in 2-button dialog
    D2_CLICK0 = 3, // Left button in 3-button dialog
    D2_CLICK1 = 4, // Middle button in 3-button dialog
    D2_CLICK2 = 5, // Right button in 3-button dialog

    HOMEPRESSED  = 10, // HOME button pressed
    RESETPRESSED = 11, // Soft-reset combination pressed
    POWERPRESSED = 12, // POWER button pressed

    PARENTAL_OK   = 20, // Parental PIN verified
    PARENTAL_FAIL = 21, // Parental PIN incorrect

    BANNED_INPUT = 30, // Filter callback returned SWKBD_CALLBACK_CLOSE
}

// ── Filter / feature flag constants ────────────────────────────

SWKBD_FILTER_DIGITS    :: u32(1 << 0) // Restrict digit count
SWKBD_FILTER_AT        :: u32(1 << 1) // Disallow @
SWKBD_FILTER_PERCENT   :: u32(1 << 2) // Disallow %
SWKBD_FILTER_BACKSLASH :: u32(1 << 3) // Disallow backslash
SWKBD_FILTER_PROFANITY :: u32(1 << 4) // Use Nintendo profanity filter
SWKBD_FILTER_CALLBACK  :: u32(1 << 5) // Use custom filter callback

SWKBD_PARENTAL          :: u32(1 << 0) // Parental PIN mode
SWKBD_DARKEN_TOP_SCREEN :: u32(1 << 1) // Dim top screen while keyboard is open
SWKBD_PREDICTIVE_INPUT  :: u32(1 << 2) // Enable predictive input (needed for Kanji on JPN)
SWKBD_MULTILINE         :: u32(1 << 3) // Allow multi-line input
SWKBD_FIXED_WIDTH       :: u32(1 << 4) // Fixed-width character mode
SWKBD_ALLOW_HOME        :: u32(1 << 5) // Allow HOME button while keyboard is open
SWKBD_ALLOW_RESET       :: u32(1 << 6) // Allow soft-reset while keyboard is open
SWKBD_ALLOW_POWER       :: u32(1 << 7) // Allow POWER button while keyboard is open
SWKBD_DEFAULT_QWERTY    :: u32(1 << 9) // Start on QWERTY page

// ── Opaque types ───────────────────────────────────────────────
//
// These are passed by pointer to every swkbd* function.
// They must be the right size so Odin's stack allocation matches
// what libctru expects.
//
// sizeof(SwkbdState)        = 1024 bytes  (computed from swkbd.h layout)
// sizeof(SwkbdDictWord)     = 166  bytes  (u16[41] + u16[41] + u8 + bool)
// sizeof(SwkbdStatusData)   = 68   bytes  (u32[17])
// sizeof(SwkbdLearningData) = 42092 bytes (u32[0x291B])

/// Internal state for the software keyboard.  Allocate on the stack or heap;
/// initialise with swkbdInit before use.
SwkbdState :: struct #align(4) { _data: [256]u32 }  // 1024 bytes, 4-byte aligned

/// One word in the predictive input dictionary.
SwkbdDictWord :: struct #align(2) { _data: [83]u16 } // 166 bytes, 2-byte aligned

/// Saved keyboard state (for restoring between launches).
SwkbdStatusData :: struct { _data: [17]u32 }          // 68 bytes

/// Predictive-input learning data.
SwkbdLearningData :: struct { _data: [10523]u32 }     // 42092 bytes

/// Filter callback — return SwkbdCallbackResult.OK or set *ppMessage and return CLOSE/CONTINUE.
SwkbdCallbackFn :: #type proc "c" (user: rawptr, ppMessage: ^^u8, text: cstring, textlen: uint) -> SwkbdCallbackResult

// ── Foreign functions ──────────────────────────────────────────

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {

    // Initialise swkbd state.
    // type          — keyboard layout (see SwkbdType)
    // numButtons    — 1, 2 or 3 dialog buttons
    // maxTextLength — max UTF-16 code units in output, or -1 for a large default
    swkbdInit :: proc(swkbd: ^SwkbdState, type: SwkbdType, numButtons: i32, maxTextLength: i32) ---

    // Enable/disable features (SWKBD_PARENTAL, SWKBD_MULTILINE, etc.).
    swkbdSetFeatures :: proc(swkbd: ^SwkbdState, features: u32) ---

    // Set placeholder text shown when the text box is empty.
    swkbdSetHintText :: proc(swkbd: ^SwkbdState, text: cstring) ---

    // Configure a dialog button (text displayed on it, and whether pressing
    // it submits or discards the typed text).
    swkbdSetButton :: proc(swkbd: ^SwkbdState, button: SwkbdButton, text: cstring, submit: bool) ---

    // Pre-fill the text box with text when the keyboard opens.
    swkbdSetInitialText :: proc(swkbd: ^SwkbdState, text: cstring) ---

    // Fill in one entry in a custom predictive-input dictionary.
    // reading — the kana/romaji string the user types
    // text    — the word that will be suggested
    swkbdSetDictWord :: proc(word: ^SwkbdDictWord, reading: cstring, text: cstring) ---

    // Attach a custom dictionary for predictive input.
    swkbdSetDictionary :: proc(swkbd: ^SwkbdState, dict: ^SwkbdDictWord, wordCount: i32) ---

    // Configure keyboard state save/restore across launches.
    // in  — read data into the keyboard when it opens
    // out — write data out when it closes
    swkbdSetStatusData :: proc(swkbd: ^SwkbdState, data: ^SwkbdStatusData, in_: bool, out: bool) ---

    // Configure predictive-input learning data save/restore.
    swkbdSetLearningData :: proc(swkbd: ^SwkbdState, data: ^SwkbdLearningData, in_: bool, out: bool) ---

    // Attach a custom filter callback called on submit.
    swkbdSetFilterCallback :: proc(swkbd: ^SwkbdState, callback: SwkbdCallbackFn, user: rawptr) ---

    // Launch the keyboard and wait for the user to finish.
    // buf     — UTF-8 output buffer
    // bufsize — size of buf including null terminator
    // Returns which button was pressed; if SWKBD_BUTTON_NONE, call swkbdGetResult.
    swkbdInputText :: proc(swkbd: ^SwkbdState, buf: [^]u8, bufsize: uint) -> SwkbdButton ---
}

// ── Bridge (static-inline wrappers) ────────────────────────────

foreign import ctru_bridge "system:ctru_bridge"

@(default_calling_convention = "c")
foreign ctru_bridge {

    // Set password concealment mode (characters hidden as typed, with delay, or not).
    @(link_name = "swkbd_set_password_mode")
    swkbdSetPasswordMode :: proc(swkbd: ^SwkbdState, mode: SwkbdPasswordMode) ---

    // Configure which inputs are valid and which characters are filtered.
    // filterFlags — bitmask of SWKBD_FILTER_* constants
    // maxDigits   — max allowed digits when SWKBD_FILTER_DIGITS is set (0 = no digits)
    @(link_name = "swkbd_set_validation")
    swkbdSetValidation :: proc(swkbd: ^SwkbdState, validInput: SwkbdValidInput, filterFlags: u32, maxDigits: i32) ---

    // Set the Unicode codepoints for the two bottom keys of a numpad keyboard.
    // Pass 0 to hide a key.
    @(link_name = "swkbd_set_numpad_keys")
    swkbdSetNumpadKeys :: proc(swkbd: ^SwkbdState, left: i32, right: i32) ---

    // Retrieve the detailed SwkbdResult after swkbdInputText returns SWKBD_BUTTON_NONE.
    @(link_name = "swkbd_get_result")
    swkbdGetResult :: proc(swkbd: ^SwkbdState) -> SwkbdResult ---
}
