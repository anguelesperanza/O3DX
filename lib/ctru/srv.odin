package ctru

// ============================================================
// Service manager (srv:)
// 3ds/srv.h
//
// Gets handles to system services by name, and registers or subscribes to notifications.
// ============================================================

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes the service API.
    srvInit :: proc() -> Result ---

    // Exits the service API.
    srvExit :: proc() ---

    // Makes srvGetServiceHandle non-blocking for the current thread (or blocking, the default), in
    // case of unavailable (full) requested services.
    srvSetBlockingPolicy :: proc(nonBlocking: bool) ---

    // Gets the current service API session handle.
    srvGetSessionHandle :: proc() -> ^Handle ---

    // Retrieves a service handle, retrieving from the environment handle list if possible.
    srvGetServiceHandle :: proc(out: ^Handle, name: cstring) -> Result ---

    // Registers the current process as a client to the service API.
    srvRegisterClient :: proc() -> Result ---

    // Enables service notificatios, returning a notification semaphore.
    srvEnableNotification :: proc(semaphoreOut: ^Handle) -> Result ---

    // Registers the current process as a service.
    srvRegisterService :: proc(out: ^Handle, name: cstring, maxSessions: i32) -> Result ---

    // Unregisters the current process as a service.
    srvUnregisterService :: proc(name: cstring) -> Result ---

    // Retrieves a service handle.
    srvGetServiceHandleDirect :: proc(out: ^Handle, name: cstring) -> Result ---

    // Registers a port.
    srvRegisterPort :: proc(name: cstring, clientHandle: Handle) -> Result ---

    // Unregisters a port.
    srvUnregisterPort :: proc(name: cstring) -> Result ---

    // Retrieves a port handle.
    srvGetPort :: proc(out: ^Handle, name: cstring) -> Result ---

    // Waits for a port to be registered.
    srvWaitForPortRegistered :: proc(name: cstring) -> Result ---

    // Subscribes to a notification.
    srvSubscribe :: proc(notificationId: u32) -> Result ---

    // Unsubscribes from a notification.
    srvUnsubscribe :: proc(notificationId: u32) -> Result ---

    // Receives a notification.
    srvReceiveNotification :: proc(notificationIdOut: ^u32) -> Result ---

    // Publishes a notification to subscribers.
    srvPublishToSubscriber :: proc(notificationId: u32, flags: u32) -> Result ---

    // Publishes a notification to subscribers and retrieves a list of all processes that were
    // notified.
    srvPublishAndGetSubscriber :: proc(processIdCountOut: ^u32, processIdsOut: ^u32, notificationId: u32) -> Result ---

    // Checks whether a service is registered.
    srvIsServiceRegistered :: proc(registeredOut: ^bool, name: cstring) -> Result ---

    // Checks whether a port is registered.
    srvIsPortRegistered :: proc(registeredOut: ^bool, name: cstring) -> Result ---
}
