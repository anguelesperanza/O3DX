package ctru

// ============================================================
// NEWS — notifications
// 3ds/services/news.h
//
// Adds notifications to the HOME Menu notification list.
// ============================================================

// Notification header data.
NotificationHeader :: struct {
    dataSet:    bool,
    unread:     bool,
    enableJPEG: bool,
    isSpotPass: bool,
    isOptedOut: bool,
    unkData:    [3]u8,
    processID:  u64,
    unkData2:   [8]u8,
    jumpParam:  u64,
    unkData3:   [8]u8,
    time:       u64,
    title:      [32]u16,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes NEWS.
    newsInit :: proc() -> Result ---

    // Exits NEWS.
    newsExit :: proc() ---

    // Adds a notification to the home menu Notifications applet.
    NEWS_AddNotification :: proc(title: ^u16, titleLength: u32, message: ^u16, messageLength: u32, imageData: rawptr, imageSize: u32, jpeg: bool) -> Result ---

    // Gets current total notifications number.
    NEWS_GetTotalNotifications :: proc(num: ^u32) -> Result ---

    // Sets a custom header for a specific notification.
    NEWS_SetNotificationHeader :: proc(news_id: u32, header: ^NotificationHeader) -> Result ---

    // Gets the header of a specific notification.
    NEWS_GetNotificationHeader :: proc(news_id: u32, header: ^NotificationHeader) -> Result ---

    // Sets a custom message for a specific notification.
    NEWS_SetNotificationMessage :: proc(news_id: u32, message: ^u16, size: u32) -> Result ---

    // Gets the message of a specific notification.
    NEWS_GetNotificationMessage :: proc(news_id: u32, message: ^u16, size: ^u32) -> Result ---

    // Sets a custom image for a specific notification.
    NEWS_SetNotificationImage :: proc(news_id: u32, buffer: rawptr, size: u32) -> Result ---

    // Gets the image of a specific notification.
    NEWS_GetNotificationImage :: proc(news_id: u32, buffer: rawptr, size: ^u32) -> Result ---
}
