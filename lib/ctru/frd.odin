package ctru

// ============================================================
// FRD — friends
// 3ds/services/frd.h, 3ds/services/frdn.h
//
// The friend list, the user's own friend code, Mii and presence, and friend notifications.
// ============================================================

FRIEND_COMMENT_LEN               :: 17
FRIEND_GAME_MODE_DESCRIPTION_LEN :: 128
NASC_INGAMESN_LEN                :: 12
NASC_KEYHASH_LEN                 :: 9
NASC_SVC_LEN                     :: 5
FRIEND_LIST_SIZE                 :: 100
NFS_TYPESTR_LEN                  :: 3

FriendComment :: [FRIEND_COMMENT_LEN]u16

FriendGameModeDescription :: [FRIEND_GAME_MODE_DESCRIPTION_LEN]u16

ScrambledFriendCode :: [6]u16

NfsTypeStr :: [NFS_TYPESTR_LEN]u8

// Friend key data
FriendKey :: struct #packed {
    principalId:     u32,
    padding:         u32,
    localFriendCode: u64,
}

// Game key data
GameKey :: struct #packed {
    titleId:  u64,
    version:  u16,
    reserved: [6]u8,
}

// Base profile data
Profile :: struct #packed {
    region:   u8, // The region code for the hardware.
    country:  u8, // Country code.
    area:     u8, // Area code.
    language: u8, // Language code.
    platform: u8, // Platform code.
    padding:  [3]u8,
}

// Friend profile data
FriendProfile :: struct #packed {
    profile:             Profile, // Base profile data of this friend.
    favoriteGame:        GameKey, // Favorite game of this friend.
    ncPrincipalId:       u32, // NC PrincipalID of this friend.
    personalMessage:     FriendComment, // Personal message (comment) of this friend.
    pad:                 [2]u8,
    lastOnlineTimestamp: i64, // NEX timestamp of when this friend was last seen online.
}

// Base presence data
Presence :: struct #packed {
    joinAvailabilityFlag: u32,
    matchmakeSystemType:  u32,
    joinGameId:           u32,
    joinGameMode:         u32,
    ownerPrincipalId:     u32,
    joinGroupId:          u32,
    applicationArg:       [20]u8,
}

// Current user's presence data
MyPresence :: struct #packed {
    presence:            Presence, // The actual presence data.
    gameModeDescription: FriendGameModeDescription, // The game mode description of the current user.
}

// Friend presence data
FriendPresence :: struct #packed {
    presence:          Presence, // The actual presence data.
    isPresenceLoaded:  bool, // Whether or not the presence data for this user has been loaded from the server.
    hasSentInvitation: bool, // Whether or not this friend has sent the current user an invitation.
    found:             bool, // Whether or not this friend was found.
    pad:               u8,
}

// Friend Mii data
FriendMii :: struct #packed {
    profanityFlag: bool, // Whether or not the Mii contains profanity.
    characterSet:  u8, // The character set for text data.
    dirtyFlag:     bool, // Whether or not the Mii is marked as "dirty" (needs to be uploaded to the server).
    pad:           u8,
    mii:           MiiData, // The actual Mii data.
}

// Friend playing game structure
FriendPlayingGame :: struct #packed {
    game:                GameKey, // Game key of the game.
    gameModeDescription: FriendGameModeDescription,
}

// Friend info structure
FriendInfo :: struct #packed {
    friendKey:      FriendKey, // FriendKey of this friend.
    addedTimestamp: i64, // NEX timestamp of when this friend was added to the current user's friend list.
    relationship:   u8, // The type of the relationship with this friend.
    pad:            [7]u8,
    friendProfile:  FriendProfile, // Friend profile data of this friend.
    screenName:     MiiScreenName, // The screen name of this friend.
    characterSet:   u8, // The character set used for the text parts of the data of this friend.
    pad2:           u8,
    mii:            FriendMii, // The Mii of this friend.
}

// Friend Notification Event structure
NotificationEvent :: struct #packed {
    type_:   u8, // Type of event.
    padding: [7]u8,
    sender:  FriendKey, // Friend key of friend who caused this notification event to be sent.
}

// Game Authentication Data structure
GameAuthenticationData :: struct #packed {
    nascResult:     u32, // NASC result code for the LOGIN operation.
    httpStatusCode: u32, // HTTP status code for the NASC LOGIN operation.
    serverAddress:  [0x20]u8, // Address of the game server.
    serverPort:     u16, // Port of the game server.
    pad:            [6]u8,
    authToken:      [0x100]u8, // Game server authentication token.
    serverTime:     u64, // NEX timestamp for current server time.
}

// Service Locator Data strcture
ServiceLocatorData :: struct #packed {
    nascResult:     u32, // NASC result code for the SVCLOC operation.
    httpStatusCode: u32, // HTTP status code for the NASC LOGIN operation.
    serviceHost:    [0x80]u8, // Host address of the target service.
    serviceToken:   [0x100]u8, // Token for the target service.
    statusData:     u8, // `statusdata` value from the NASC response data.
    padding:        [7]u8,
    serverTime:     u64, // NEX timestamp for current server time.
}

// Encrypted inner Approach Context structure
ApproachContext :: struct #packed {
    friendProfile: FriendProfile,
    hasMii:        bool,
    profanityFlag: bool,
    characterSet:  u8,
    wrappedMii:    [0x70]u8,
    screenName:    MiiScreenName,
    reserved:      [0x10F]u8,
}

// Encrypted Approach Context structure
// Opaque here: the C type has a nested struct/union. 512 bytes.
EncryptedApproachContext :: struct #align(1) {
    _: [512]u8,
}

// Decrypted Approach Context structure
DecryptedApproachContext :: struct #packed {
    unknown0:      u8,
    unknown1:      u8,
    unknown2:      u8,
    unknown3:      u8,
    hasMii:        bool, // Whether or not this friend has a Mii.
    profanityFlag: bool,
    characterSet:  u8, // Character set for text data.
    pad:           u8,
    friendKey:     FriendKey, // Friend key of this friend.
    friendProfile: FriendProfile, // Friend profile of this friend.
    mii:           FriendMii, // Mii data of this friend.
    screenName:    MiiScreenName, // UTF-16 screen name of this friend.
    reserved:      [0x12A]u8,
}

// Enum for character set
CharacterSet :: enum u8 {
    JPN_USA_EUR = 0, // Character set for JPN, USA, and EUR(+AUS).
    CHN         = 1, // Character set for CHN.
    KOR         = 2, // Character set for KOR.
    TWN         = 3, // Character set for TWN.
}

// Enum for NASC Result
NASCResult :: enum u8 {
    SUCCESS                    = 0x1,
    SERVER_UNDER_MAINTENANCE   = 0x65,
    DEVICE_BANNED              = 0x66,
    INVALID_PRODUCT_CODE       = 0x6B,
    INVALID_REQUEST_PARAM      = 0x6D,
    SERVER_NO_LONGER_AVAILABLE = 0x6E,
    INVALID_SVC                = 0x70,
    INVALID_FPD_VERSION        = 0x77,
    INVALID_TITLE_VERSION      = 0x78,
    INVALID_DEVICE_CERTIFICATE = 0x79,
    INVALID_PID_HMAC           = 0x7A,
    BANNED_ROM_ID              = 0x7B,
    INVALID_GAME_ID            = 0x7D,
    INVALID_KEY_HASH           = 0x7F,
}

// Enum for NASC Server Environment
NASCEnvironment :: enum u8 {
    PRODUCTION  = 0,
    TESTING     = 1,
    DEVELOPMENT = 2,
}

// Enum for notification event types
FriendNotificationTypes :: enum u8 {
    USER_WENT_ONLINE                     = 0x1, // Self went online
    USER_WENT_OFFLINE                    = 0x2, // Self went offline
    FRIEND_WENT_ONLINE                   = 0x3, // Friend Went Online
    FRIEND_UPDATED_PRESENCE              = 0x4, // Friend Presence changed (with matching GameJoinID)
    FRIEND_UPDATED_MII                   = 0x5, // Friend Mii changed
    FRIEND_UPDATED_PROFILE               = 0x6, // Friend Profile changed
    FRIEND_WENT_OFFLINE                  = 0x7, // Friend went offline
    FRIEND_REGISTERED_USER               = 0x8, // Friend registered self as friend
    FRIEND_SENT_JOINABLE_INVITATION      = 0x9, // Friend sent invitation (with matching GameJoinID)
    FRIEND_CHANGED_GAME_MODE_DESCRIPTION = 0x91, // Friend changed game mode description
    FRIEND_CHANGED_FAVORITE_GAME         = 0x92, // Friend changed favorite game
    FRIEND_CHANGED_COMMENT               = 0x93, // Friend changed comment
    FRIEND_CHANGED_ANY_PRESENCE          = 0x94, // Friend Presence changed (with nonmatching GameJoinID)
    FRIEND_SENT_ANY_INVITATION           = 0x95, // Friend sent invitiation (with nonmatching GameJoinID)
}

// Enum for notification event mask
FriendNotificationMask :: enum u16 {
    USER_WENT_ONLINE                = 0x1,
    USER_WENT_OFFLINE               = 0x2,
    FRIEND_WENT_ONLINE              = 0x4,
    FRIEND_UPDATED_PRESENCE         = 0x8,
    FRIEND_UPDATED_MII              = 0x10,
    FRIEND_UPDATED_PROFILE          = 0x20,
    FRIEND_WENT_OFFLINE             = 0x40,
    FRIEND_REGISTERED_USER          = 0x80,
    FRIEND_SENT_JOINABLE_INVITATION = 0x100,
}

// Enum for friend relationship type
RelationshipType :: enum u8 {
    INCOMPLETE = 0, // Provisionally registered friend.
    COMPLETE   = 1, // Fully registered friend.
    NOT_FOUND  = 2, // Friend not registered at all.
    DELETED    = 3, // Relationship was deleted.
    LOCAL      = 4, // Provisionally registered friend (but this relationship has not been sent to the server yet).
}

// Enum for friend attributes according to relationship type
FriendAttributes :: enum u8 {
    EVER_REGISTERED       = 1, // Whether or not the current user has ever been in a friend relationship with the friend. This is set when the relationship type is either incomplete, complete, local, or deleted.
    REGISTRATION_COMPLETE = 2, // Whether or not the current user has been fully registered by this friend. Set only when the relationship type is complete.
}

// Enum for NAT mapping type
NatMappingType :: enum u8 {
    UNKNOWN              = 0,
    ENDPOINT_INDEPENDENT = 1,
    ENDPOINT_DEPENDENT   = 2,
}

// Enum for NAT filtering type
NatFilteringType :: enum u8 {
    UNKNOWN          = 0,
    PORT_INDEPENDENT = 1,
    PORT_DEPENDENT   = 2,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes friend services.
    frdInit :: proc(forceUser: bool) -> Result ---

    // Exits friend services.
    frdExit :: proc() ---

    // Get the friend user/admin service handle.
    frdGetSessionHandle :: proc() -> ^Handle ---

    // Gets the login status of the current user.
    FRD_HasLoggedIn :: proc(state: ^bool) -> Result ---

    // Gets the online status of the current user.
    FRD_IsOnline :: proc(state: ^bool) -> Result ---

    // Log in to Nintendo's friend server.
    FRD_Login :: proc(event: Handle) -> Result ---

    // Logs out of Nintendo's friend server.
    FRD_Logout :: proc() -> Result ---

    // Gets the current user's friend key.
    FRD_GetMyFriendKey :: proc(key: ^FriendKey) -> Result ---

    // Gets the current user's privacy information.
    FRD_GetMyPreference :: proc(isPublicMode: ^bool, isShowGameName: ^bool, isShowPlayedGame: ^bool) -> Result ---

    // Gets the current user's profile information.
    FRD_GetMyProfile :: proc(profile: ^Profile) -> Result ---

    // Gets the current user's presence information.
    FRD_GetMyPresence :: proc(presence: ^MyPresence) -> Result ---

    // Gets the current user's screen name.
    FRD_GetMyScreenName :: proc(name: ^MiiScreenName) -> Result ---

    // Gets the current user's Mii data.
    FRD_GetMyMii :: proc(mii: ^FriendMii) -> Result ---

    // Gets the ID of the current local account.
    FRD_GetMyLocalAccountId :: proc(localAccountId: ^u8) -> Result ---

    // Gets the current user's playing game.
    FRD_GetMyPlayingGame :: proc(playingGame: ^GameKey) -> Result ---

    // Gets the current user's favourite game.
    FRD_GetMyFavoriteGame :: proc(favoriteGame: ^GameKey) -> Result ---

    // Gets the NcPrincipalId for the current user.
    FRD_GetMyNcPrincipalId :: proc(ncPrincipalId: ^u32) -> Result ---

    // Gets the current user's comment on their friend profile.
    FRD_GetMyComment :: proc(comment: ^FriendComment) -> Result ---

    // Gets the current friend account's NEX password.
    FRD_GetMyPassword :: proc(password: [^]u8, bufsize: u32) -> Result ---

    // Gets the current user's friend key list.
    FRD_GetFriendKeyList :: proc(friendKeyList: ^FriendKey, num: ^u32, offset: u32, size: u32) -> Result ---

    // Gets friend presence data for the current user's friends.
    FRD_GetFriendPresence :: proc(friendPresences: ^FriendPresence, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Gets screen names for the current user's friends.
    FRD_GetMiiScreenName :: proc(screenNames: ^MiiScreenName, screenNamesLen: u32, characterSets: ^u8, characterSetsLen: u32, friendKeyList: ^FriendKey, count: u32, maskNonAscii: bool, profanityFlag: bool) -> Result ---

    // Gets the current user's friends' Mii data.
    FRD_GetFriendMii :: proc(miiList: ^FriendMii, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Get the current user's friends' profile data.
    FRD_GetFriendProfile :: proc(profiles: ^Profile, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Get the relationship type for the current user's friends.
    FRD_GetFriendRelationship :: proc(relationships: ^u8, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Get attributes for the current user's friends.
    FRD_GetFriendAttributeFlags :: proc(attributes: ^u32, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Get the current user's friends' playing game.
    FRD_GetFriendPlayingGame :: proc(playingGames: ^FriendPlayingGame, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Get the current user's friends' favourite games.
    FRD_GetFriendFavoriteGame :: proc(favoriteGames: ^GameKey, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Get info about the current user's friends.
    FRD_GetFriendInfo :: proc(infos: ^FriendInfo, friendKeyList: ^FriendKey, count: u32, maskNonAscii: bool, profanityFlag: bool) -> Result ---

    // Gets whether a friend code is included in the current user's friend list.
    FRD_IsInFriendList :: proc(friendCode: u64, isFromList: ^bool) -> Result ---

    // Unscrambles a scrambled friend code.
    FRD_UnscrambleLocalFriendCode :: proc(unscrambled: ^u64, scrambled: ^ScrambledFriendCode, count: u32) -> Result ---

    // Updates the game mode description string.
    FRD_UpdateGameModeDescription :: proc(desc: ^FriendGameModeDescription) -> Result ---

    // Updates the current user's presence data and game mode description.
    FRD_UpdateMyPresence :: proc(presence: ^Presence, desc: ^FriendGameModeDescription) -> Result ---

    // Sends an invitation to the current user's friends.
    FRD_SendInvitation :: proc(friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Registers the event handle that will be signaled to inform the session of various status
    // changes.
    FRD_AttachToEventNotification :: proc(event: Handle) -> Result ---

    // Sets the notification mask for the event notification system.
    FRD_SetNotificationMask :: proc(mask: FriendNotificationMask) -> Result ---

    // Get Latest Event Notification
    FRD_GetEventNotification :: proc(event: ^NotificationEvent, count: u32, recievedNotifCount: ^u32) -> Result ---

    // Get the result of the last internal operation.
    FRD_GetLastResponseResult :: proc() -> Result ---

    // Returns the friend code using the given principal ID.
    FRD_PrincipalIdToFriendCode :: proc(principalId: u32, friendCode: ^u64) -> Result ---

    // Returns the principal ID using the given friend code.
    FRD_FriendCodeToPrincipalId :: proc(friendCode: u64, principalId: ^u32) -> Result ---

    // Checks if the friend code is valid.
    FRD_IsValidFriendCode :: proc(friendCode: u64, isValid: ^bool) -> Result ---

    // Get a support error code (XXX-YYYY) for the given result code.
    FRD_ResultToErrorCode :: proc(errorCode: ^u32, res: Result) -> Result ---

    // Requests game server authentication.
    FRD_RequestGameAuthentication :: proc(serverId: u32, ingamesn: ^u16, ingamesnSize: u32, majorSdkVersion: u8, minorSdkVersion: u8, completionEvent: Handle) -> Result ---

    // Get game server authentication data requested using FRD_RequestGameAuthentication.
    FRD_GetGameAuthenticationData :: proc(data: ^GameAuthenticationData) -> Result ---

    // Request service locator info for a given NEX server.
    FRD_RequestServiceLocator :: proc(serverId: u32, keyhash: [^]u8, svc: [^]u8, majorSdkVersion: u8, minorSdkVersion: u8, completionEvent: Handle) -> Result ---

    // Get service locator data requested using FRD_RequestServiceLocator.
    FRD_GetServiceLocatorData :: proc(data: ^ServiceLocatorData) -> Result ---

    // Starts an internal task to determine the NAT properties of the current internet connection.
    FRD_DetectNatProperties :: proc(completionEvent: Handle) -> Result ---

    // Returns NAT properties for the current internet connection.
    FRD_GetNatProperties :: proc(natMappingType: ^u32, natFilteringType: ^u32) -> Result ---

    // Returns the difference (in nanoseconds) between server time and device time. This difference
    // is calculated every time the system logs into friend services.
    FRD_GetServerTimeDifference :: proc(diff: ^u64) -> Result ---

    // Configures the current session to allow or disallow running the friends service in sleep mode
    // (half-awake mode).
    FRD_AllowHalfAwake :: proc(allow: bool) -> Result ---

    // Gets the server environment configuration for the current user.
    FRD_GetServerTypes :: proc(nascEnvironment: ^u8, nfsType: ^u8, nfsNo: ^u8) -> Result ---

    // Gets the comment (personal) message of the current user's friends.
    FRD_GetFriendComment :: proc(comments: ^FriendComment, commentsLen: u32, friendKeyList: ^FriendKey, count: u32) -> Result ---

    // Sets the Friend API to use a specific SDK version.
    FRD_SetClientSdkVersion :: proc(sdkVer: u32) -> Result ---

    // Gets the current user's encrypted approach context.
    FRD_GetMyApproachContext :: proc(ctx: ^EncryptedApproachContext) -> Result ---

    // Adds a friend using their encrypted approach context.
    FRD_AddFriendWithApproach :: proc(unkbuf: ^u8, unkbufSize: u32, ctx: ^EncryptedApproachContext, completionEvent: Handle) -> Result ---

    // Decrypts an encrypted approach context.
    FRD_DecryptApproachContext :: proc(decryptedContext: ^DecryptedApproachContext, encryptedContext: ^EncryptedApproachContext, maskNonAscii: bool, characterSet: u8) -> Result ---

    // Gets extended NAT properties. This is the same as FRD_GetNatProperties, with this version
    // also returning the NAT Mapping Port Increment.
    FRD_GetExtendedNatProperties :: proc(natMappingType: ^u32, natFilteringType: ^u32, natMappingPortIncrement: ^u32) -> Result ---

    // Creates a new local friends account.
    FRDA_CreateLocalAccount :: proc(localAccountId: u8, nascEnvironment: u8, nfsType: u8, nfsNo: u8) -> Result ---

    // Deletes a local friends account.
    FRDA_DeleteLocalAccount :: proc(localAccountId: u8) -> Result ---

    // Loads a local friends account.
    FRDA_LoadLocalAccount :: proc(localAccountId: u8) -> Result ---

    // Unloads the currently active local account.
    FRDA_UnloadLocalAccount :: proc() -> Result ---

    // Saves all data of the friends module.
    FRDA_Save :: proc() -> Result ---

    // Adds a friend online ("Internet" option).
    FRDA_AddFriendOnline :: proc(event: Handle, principalId: u32) -> Result ---

    // Adds a friend offline ("Local" option).
    FRDA_AddFriendOffline :: proc(friendKey: ^FriendKey, mii: ^FriendMii, friendProfile: ^FriendProfile, screenName: ^MiiScreenName, profanityFlag: bool, characterSet: u8) -> Result ---

    // Updates a friend's display name.
    FRDA_UpdateMiiScreenName :: proc(friendKey: ^FriendKey, screenName: ^MiiScreenName, characterSet: u8) -> Result ---

    // Remove a friend.
    FRDA_RemoveFriend :: proc(principalId: u32, localFriendCode: u64) -> Result ---

    // Updates the game being played by the current user.
    FRDA_UpdatePlayingGame :: proc(playingGame: ^GameKey) -> Result ---

    // Updates the current user's friend list preferences.
    FRDA_UpdatePreference :: proc(isPublicMode: bool, isShowGameMode: bool, isShowPlayedMode: bool) -> Result ---

    // Updates the current user's Mii.
    FRDA_UpdateMii :: proc(mii: ^FriendMii, screenName: ^MiiScreenName, profanityFlag: bool, characterSet: u8) -> Result ---

    // Updates the current user's favorite game.
    FRDA_UpdateFavoriteGame :: proc(favoriteGame: ^GameKey) -> Result ---

    // Sets the NcPrincipalId of the current user.
    FRDA_SetNcPrincipalId :: proc(ncPrincipalId: u32) -> Result ---

    // Updates the current user's comment (personal message).
    FRDA_UpdateComment :: proc(comment: ^FriendComment) -> Result ---

    // Increments the move count in the current local account's save data.
    FRDA_IncrementMoveCount :: proc() -> Result ---

    // Initializes the friend network daemon service.
    frdnInit :: proc() -> Result ---

    // Exits the friend network daemon service.
    frdnExit :: proc() ---

    // Get the friend network daemon service handle.
    frdnGetSessionHandle :: proc() -> ^Handle ---

    // Gets the handle signaled whenever the friends daemon changes its status.
    FRDN_GetHandleOfNdmStatusChangedEvent :: proc(evt: ^Handle) -> Result ---

    // Resumes the friends daemon.
    FRDN_Resume :: proc() -> Result ---

    // Suspends the friends daemon.
    FRDN_SuspendAsync :: proc(immediately: bool) -> Result ---

    // Queries the status of the friends daemon.
    FRDN_QueryStatus :: proc(status: ^u8) -> Result ---
}
