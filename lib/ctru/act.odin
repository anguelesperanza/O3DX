package ctru

// ============================================================
// ACT — Nintendo Network accounts
// 3ds/services/act.h
//
// Reads the console's Nintendo Network account information.
// ============================================================

ACCOUNT_ID_LEN                           :: 17
ACCOUNT_EMAIL_LEN                        :: 257
ACCOUNT_PASSWORD_LEN                     :: 18
ACT_NNAS_SUBDOMAIN_LEN                   :: 33
ACT_UUID_LEN                             :: 16
ACT_DEFAULT_ACCOUNT                      :: 0xFE
ACT_UUID_REGULAR                         :: -1
ACT_UUID_CURRENT_PROCESS                 :: -2
ACT_TRANSFERABLE_ID_BASE_COMMON          :: 0xFF
ACT_TRANSFERABLE_ID_BASE_CURRENT_ACCOUNT :: 0xFE

ActUuid :: [ACT_UUID_LEN]u8

ActNnasSubdomain :: [ACT_NNAS_SUBDOMAIN_LEN]u8

AccountId :: [17]u8

AccountPassword :: [ACCOUNT_PASSWORD_LEN]u8

AccountMailAddress :: [ACCOUNT_EMAIL_LEN]u8

// Enum for common / account specific info types
ACT_InfoType :: enum u8 {
    COMMON_NUM_ACCOUNTS                       = 0x1, // u8
    COMMON_CURRENT_ACCOUNT_SLOT               = 0x2, // u8
    COMMON_DEFAULT_ACCOUNT_SLOT               = 0x3, // u8
    COMMON_NETWORK_TIME_DIFF                  = 0x4, // s64, difference between server time and device time in nanoseconds.
    PERSISTENT_ID                             = 0x5, // u32
    COMMON_TRANSFERABLE_ID_BASE               = 0x6, // u64
    TRANSFERABLE_ID_BASE                      = 0x6, // u64
    MII                                       = 0x7, // CFLStoreData
    ACCOUNT_ID                                = 0x8, // AccountId
    MAIL_ADDRESS                              = 0x9, // AccountMailAddress
    BIRTH_DATE                                = 0xA, // BirthDate structure
    COUNTRY_NAME                              = 0xB, // char[2+1]
    PRINCIPAL_ID                              = 0xC, // u32
    STUB_0XD                                  = 0xD,
    IS_PASSWORD_CACHE_ENABLED                 = 0xE, // bool
    STUB_0XF                                  = 0xF,
    STUB_0X10                                 = 0x10,
    ACCOUNT_INFO                              = 0x11, // AccountInfo structure
    ACCOUNT_SERVER_TYPES                      = 0x12,
    GENDER                                    = 0x13, // u8, F = 0, M = 1
    LAST_AUTHENTICATION_RESULT                = 0x14, // Result
    ASSIGNED_ACCOUNT_ID                       = 0x15, // AccountId
    PARENTAL_CONTROL_SLOT_NUMBER              = 0x16, // u8
    SIMPLE_ADDRESS_ID                         = 0x17, // u32
    STUB_0X18                                 = 0x18,
    UTC_OFFSET                                = 0x19, // s64
    IS_COMMITTED                              = 0x1A, // bool
    MII_NAME                                  = 0x1B, // MiiScreenName
    NFS_PASSWORD                              = 0x1C, // char[0x10+1]
    HAS_ECI_VIRTUAL_ACCOUNT                   = 0x1D, // bool
    TIMEZONE_ID                               = 0x1E, // char[0x40+1]
    IS_MII_UPDATED                            = 0x1F, // bool
    IS_MAIL_ADDRESS_VALIDATED                 = 0x20, // bool
    ACCOUNT_ACCESS_TOKEN                      = 0x21, // AccountAccessToken structure
    COMMON_IS_APPLICATION_UPDATE_REQUIRED     = 0x22, // bool
    COMMON_DEFAULT_ACCOUNT_SERVER_TYPES       = 0x23, // AccountServerTypes
    IS_SERVER_ACCOUNT_DELETED                 = 0x24, // bool
    MII_IMAGE_URL                             = 0x25, // char[0x100+1]
    ASSIGNED_PRINCIPAL_ID                     = 0x26, // u32
    ACCOUNT_ACCESS_TOKEN_STATE                = 0x27, // u32, AccountAccessTokenState enum
    ACCOUNT_SERVER_ENVIRONMENT                = 0x28, // AccountServerTypesStr structure
    COMMON_DEFAULT_ACCOUNT_SERVER_ENVIRONMENT = 0x29, // AccountServerTypesStr structure
    COMMON_DEVICE_HASH                        = 0x2A, // u8[8]
    FP_LOCAL_ACCOUNT_ID                       = 0x2B, // u8
    AGE                                       = 0x2C, // u16
    IS_ENABLED_RECEIVE_ADS                    = 0x2D, // bool
    IS_OFF_DEVICE_ENABLED                     = 0x2E, // bool
    TRANSLATED_SIMPLE_ADDRESS_ID              = 0x2F, // u32
}

ACT_AsyncRequestType :: enum u8 {
    INQUIRE_BINDING_TO_EXISTENT_SERVER_ACCOUNT = 0x1, // ExistentServerAccountData struct
    BIND_TO_EXISTENT_SERVER_ACCOUNT            = 0x2, // u32, parentalConsentApprovalId
    ACQUIRE_EULA                               = 0x3, // EulaList structure (dynamically sized)
    ACQUIRE_EULA_LIST                          = 0x3, // EulaList structure (dynamically sized)
    ACQUIRE_EULA_LANGUAGE_LIST                 = 0x3, // EulaList structure with only the languageNameOffsets populated (dynamically sized)
    ACQUIRE_TIMEZONE_LIST                      = 0x4, // TimezoneList structure
    ACQUIRE_ACCOUNT_INFO                       = 0x5, // INFO_TYPE_MAIL_ADDRESS: AccountMailAddress
    ACQUIRE_ACCOUNT_ID_BY_PRINCIPAL_ID_MULTI   = 0x6, // AccountId[count]
    ACQUIRE_ACCOUNT_ID_BY_PRINCIPAL_ID         = 0x7, // AccountId
    ACQUIRE_PRINCIPAL_ID_BY_ACCOUNT_ID_MULTI   = 0x8, // u32[count]
    ACQUIRE_PRINCIPAL_ID_BY_ACCOUNT_ID         = 0x9, // u32
    APPROVE_BY_CREDIT_CARD                     = 0xA, // u32, approvalId
    SEND_COPPA_CODE_MAIL                       = 0xB, // CoppaCodeMailData structure
    ACQUIRE_MII                                = 0xC, // CFLStoreData[count]
    ACQUIRE_ACCOUNT_INFO_RAW                   = 0xD, // char[0xC00+1], NULL-terminate ASCII raw profile XML data
}

// Enum for Mii image type
MiiImageType :: enum u8 {
    IMAGE_PRIMARY = 0, // The user's primary Mii image.
    IMAGE_1       = 1,
    IMAGE_2       = 2,
    IMAGE_3       = 3,
    IMAGE_4       = 4,
    IMAGE_5       = 5,
    IMAGE_6       = 6,
    IMAGE_7       = 7,
    IMAGE_8       = 8,
}

// Enum for NNAS (Nintendo Network Authentication Server) type
NnasServerType :: enum u8 {
    PRODUCTION          = 0,
    GAME_DEVELOPMENT    = 1,
    SYSTEM_DEVELOPMENT  = 2,
    LIBRARY_DEVELOPMENT = 3,
    STAGING             = 4,
}

// Enum for account access token state
AccountAccessTokenState :: enum u8 {
    UNINITIALIZED = 0,
    EXPIRED       = 1,
    VALID         = 2,
}

// Enum for account access token invalidation action
InvalidateAccessTokenAction :: enum u8 {
    ACCESS_TOKEN  = 1, // Invalidates only the account token itself (and the expiry date).
    REFRESH_TOKEN = 2, // Invalidates only the refresh token.
}

// Coppa Code Mail Data Structure
CoppaCodeMailData :: struct {
    coppaCode:   [6]u8,
    parentEmail: AccountMailAddress,
}

// Mii CFLStoreData (CTR Face Library Store Data) structure
CFLStoreData :: struct #packed {
    miiData: MiiData,
    pad:     [2]u8,
    crc16:   u16,
}

// Birth date structure
BirthDate :: struct #packed {
    year:  u16,
    month: u8,
    day:   u8,
}

// Account info structure
AccountInfo :: struct #packed {
    persistentId:       u32,
    pad:                [4]u8,
    transferableIdBase: u64,
    mii:                CFLStoreData,
    screenName:         MiiScreenName,
    accountId:          [17]u8,
    pad2:               u8,
    birthDate:          BirthDate,
    principalId:        u32,
}

// Account Timezone structure
AccountTimezone :: struct #packed {
    timezoneArea: [65]u8,
    pad:          [3]u8,
    timezoneId:   [65]u8,
    pad2:         [3]u8,
    utcOffset:    i64,
}

// Timezone List structure
TimezoneList :: struct #packed {
    capacity:  u32,
    count:     u32,
    timezones: [32]AccountTimezone,
}

// EULA Info structure
EulaInfo :: struct #packed {
    countryCode:  [3]u8, // ISO 3166-1 A-2 country code
    languageCode: [3]u8, // ISO 639 Set 1 language code
    eulaVersion:  u16,
}

// Existent Server Account Data structure
ExistentServerAccountData :: struct #packed {
    hasMii:            bool,
    pad:               [3]u8,
    miiData:           CFLStoreData,
    principalId:       u32,
    coppaRequiredFlag: bool,
    pad2:              [3]u8,
    coppaMailData:     CoppaCodeMailData,
    pad3:              u8,
    birthDate:         BirthDate,
}

// EULA entry header structure
EulaEntry :: struct #packed {
    countryCode:        [3]u8, // ISO 3166-1 A-2 country code
    pad:                u8,
    languageCode:       [3]u8, // ISO 639 Set 1 language code
    pad2:               u8,
    eulaVersion:        u16,
    pad3:               [2]u8,
    nextEntryOffset:    u32, // Offset of next EULA entry, relative to full data blob.
    eulaTypeOffset:     u32, // Offset of the EulaType within textData.
    agreeTextOffset:    u32, // Offset of the AgreeText within textData.
    nonAgreeTextOffset: u32, // Offset of the NonAgreeText within textData.
    languageNameOffset: u32, // Offset of the LanguageName within textData.
    mainTitleOffset:    u32, // Offset of the MainTitle within textData.
    mainTextOffset:     u32, // Offset of the MainText within textData.
    subTitleOffset:     u32, // Offset of the SubTitle within textData.
    subTextOffset:      u32, // Offset of the SubText within textData.
    textData:           [0]u8,
}

// Support Context structure
SupportContext :: struct #packed {
    accountId:    AccountId, // Account ID of the account.
    pad:          [3]u8,
    serialNumber: u32, // Serial number of the console (only digits).
    principalId:  u32,
    randomNumber: u16, // Random number based on the principalId and serialNumber.
    pad2:         [2]u8,
}

// EULA list structure
EulaList :: struct {
    numEntries: u8, // Number of entries within the list.
    entries:    [0]u8, // EULA Entries (dynamically sized)
}

// Device Info structure
DeviceInfo :: struct {
    deviceId:     u32,
    serialNumber: [16]u8,
}

// NEX service token structure
NexServiceToken :: struct {
    serviceToken: [513]u8,
    pad:          [3]u8,
    password:     [65]u8,
    pad2:         [3]u8,
    serverHost:   [0x10]u8,
    serverPort:   u16,
    pad3:         [2]u8,
}

// Credit Card Info structure
CreditCardInfo :: struct {
    cardType:        u8,
    cardNumber:      [17]u8,
    securityCode:    [4]u8,
    expirationMonth: u8,
    expirationYear:  u8,
    postalCode:      [7]u8,
    mailAddress:     AccountMailAddress,
}

// V1 Independent service token structure
IndependentServiceTokenV1 :: struct {
    token: [513]u8, // base64
}

// V2 Independent service token structure
IndependentServiceTokenV2 :: struct {
    token:      [513]u8, // base64
    iv:         [25]u8, // base64
    signature:  [345]u8, // base64
    nfsTypeStr: NfsTypeStr,
}

// Account server types structure (raw format)
AccountServerTypes :: struct {
    nnasType: u8, // NNAS (Nintendo Network Authentication Server) type
    nfsType:  u8, // NFS (Nintendo Friend Server) type
    nfsNo:    u8, // NFS (Nintendo Friend Server) number
    pad:      u8,
}

// Account server types structure (string format)
AccountServerTypesStr :: struct {
    nnasSubdomain: ActNnasSubdomain, // NNAS (Nintendo Network Authentication Server) subdomain
    nfsTypeStr:    NfsTypeStr, // NFS (Nintendo Friend Server) type string (letter + number)
}

// Account access token structure
AccountAccessToken :: struct {
    state:        u8, // AccountAccessTokenState enum
    accessToken:  [33]u8,
    refreshToken: [41]u8,
    pad:          u8,
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes ACT services.
    actInit :: proc(forceUser: bool) -> Result ---

    // Exits ACT services.
    actExit :: proc() ---

    // Get the ACT user/admin service handle.
    actGetSessionHandle :: proc() -> ^Handle ---

    // Initializes the current ACT session.
    ACT_Initialize :: proc(sdkVersion: u32, sharedMemSize: u32, sharedMem: Handle) -> Result ---

    // Returns a support error code (XXX-YYYY) for the given ACT result code.
    ACT_ResultToErrorCode :: proc(code: Result) -> Result ---

    // Gets the result of the last internal operation.
    ACT_GetLastResponseResult :: proc() -> Result ---

    // Cancels any currently running async operation.
    ACT_Cancel :: proc() -> Result ---

    // Retrieves information not specific to any one account.
    ACT_GetCommonInfo :: proc(output: rawptr, outputSize: u32, infoType: u32) -> Result ---

    // Retrieves information of a certain account.
    ACT_GetAccountInfo :: proc(output: rawptr, outputSize: u32, accountSlot: u8, infoType: u32) -> Result ---

    // Returns the data resulting from an async request.
    ACT_GetAsyncResult :: proc(outReadSize: ^u32, output: rawptr, outputSize: u32, requestType: u32) -> Result ---

    // Gets one of the Mii images of a certain account.
    ACT_GetMiiImage :: proc(outSize: ^u32, output: rawptr, outputSize: u32, accountSlot: u8, miiImageType: u8) -> Result ---

    // Sets the NFS (Nintendo Friend Server) password for a certain account.
    ACT_SetNfsPassword :: proc(accountSlot: u8, password: [^]u8) -> Result ---

    // Sets the `IsApplicationUpdateRequired` field in the internal account manager.
    ACT_SetIsApplicationUpdateRequired :: proc(required: bool) -> Result ---

    // Acquires a list of EULA agreements for the specified country.
    ACT_AcquireEulaList :: proc(countryCode: u8, completionEvent: Handle) -> Result ---

    // Acquires a list of timezones for the specified country and language combination.
    ACT_AcquireTimezoneList :: proc(countryCode: u8, languageCode: u8, completionEvent: Handle) -> Result ---

    // Generates a UUID.
    ACT_GenerateUuid :: proc(uuid: ^ActUuid, uniqueId: u32) -> Result ---

    // Gets a specific account's UUID.
    ACT_GetUuid :: proc(uuid: ^ActUuid, accountSlot: u8, uniqueId: u32) -> Result ---

    // Finds the account slot number of the account having the specified UUID.
    ACT_FindSlotNoByUuid :: proc(accountSlot: ^u8, uuid: ^ActUuid, uniqueId: u32) -> Result ---

    // Saves all pending changes to the ACT system save data.
    ACT_Save :: proc() -> Result ---

    // Returns a TransferableID for a certain account.
    ACT_GetTransferableId :: proc(transferableId: ^u64, accountSlot: u8, saltValue: u8) -> Result ---

    // Acquires an account-specific service token for a NEX server.
    ACT_AcquireNexServiceToken :: proc(accountSlot: u8, serverId: u32, doParentralControlsCheck: bool, callerProcessId: u32, completionEvent: Handle) -> Result ---

    // Gets a NEX service token requested using ACT_AcquireNexServiceToken.
    ACT_GetNexServiceToken :: proc(token: ^NexServiceToken) -> Result ---

    // Requests a V1 independent service token for a specific account.
    ACT_AcquireIndependentServiceToken :: proc(accountSlot: u8, clientId: [^]u8, cacheDuration: u32, doParentalControlsCheck: bool, shared: bool, callerProcessId: u32, completionEvent: Handle) -> Result ---

    // Gets a V1 independent service token requested using ACT_AcquireIndependentServiceToken.
    ACT_GetIndependentServiceToken :: proc(token: ^IndependentServiceTokenV1) -> Result ---

    // Acquires account information for the specified account.
    ACT_AcquireAccountInfo :: proc(accountSlot: u8, infoType: u32, completionEvent: Handle) -> Result ---

    // Acquires account IDs from a list of principal IDs.
    ACT_AcquireAccountIdByPrincipalId :: proc(principalIds: ^u32, principalIdsSize: u32, unk: u8, completionEvent: Handle) -> Result ---

    // Acquires principal IDs from a list of account IDs.
    ACT_AcquirePrincipalIdByAccountId :: proc(accountIds: ^AccountId, accountIdsSize: u32, completionHandle: Handle) -> Result ---

    // Acquires Miis corresponding to a given list of persistent IDs.
    ACT_AcquireMii :: proc(persistentIds: ^u32, persistentIdsSize: u32, completionEvent: Handle) -> Result ---

    // Acquires raw (XML) account info for the specified account.
    ACT_AcquireAccountInfoRaw :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Gets a cached V1 independent service token for a specific account.
    ACT_GetCachedIndependentServiceToken :: proc(token: ^IndependentServiceTokenV1, accountSlot: u8, clientId: [^]u8, cacheDuration: u32, doParentralControlsCheck: bool, shared: bool) -> Result ---

    // Inquires whether or not the given email address is available for creating a new account.
    ACT_InquireMailAddressAvailability :: proc(mailAddress: ^AccountMailAddress, completionEvent: Handle) -> Result ---

    // Acquires the EULA for the given country and language combination.
    ACT_AcquireEula :: proc(countryCode: u8, languageCode: [^]u8, completionEvent: Handle) -> Result ---

    // Acquires a list of languages the EULA is available in for a given country.
    ACT_AcquireEulaLanguageList :: proc(countryCode: u8, completionEvent: Handle) -> Result ---

    // Requests a V2 independent service token for a specific account.
    ACT_AcquireIndependentServiceTokenV2 :: proc(accountSlot: u8, clientId: [^]u8, cacheDuration: u32, doParentalControlsCheck: bool, shared: bool, callerProcessId: u32, completionEvent: Handle) -> Result ---

    // Gets a V2 independent service token requested using ACT_AcquireIndependentServiceTokenV2.
    ACT_GetIndependentServiceTokenV2 :: proc(token: ^IndependentServiceTokenV2) -> Result ---

    // Gets a cached V2 independent service token for a specific account.
    ACT_GetCachedIndependentServiceTokenV2 :: proc(token: ^IndependentServiceTokenV2, accountSlot: u8, clientId: [^]u8, cacheDuration: u32, doParentralControlsCheck: bool, shared: bool) -> Result ---

    // Swaps the account slot numbers of two accounts.
    ACTA_SwapAccounts :: proc(accountSlot1: u8, accountSlot2: u8) -> Result ---

    // Creates a new local console account.
    ACTA_CreateConsoleAccount :: proc() -> Result ---

    // Sets a local console account as committed.
    ACTA_CommitConsoleAccount :: proc(accountSlot: u8) -> Result ---

    // Clears (but does not delete) account data for the given account slot. The FpLocalAccountId
    // will not be cleared.
    ACTA_UnbindServerAccount :: proc(accountSlot: u8, completely: bool) -> Result ---

    // Deletes a local console account.
    ACTA_DeleteConsoleAccount :: proc(accountSlot: u8) -> Result ---

    // Loads ("logs in to") a local console account.
    ACTA_LoadConsoleAccount :: proc(accountSlot: u8, doPasswordCheck: bool, password: ^AccountPassword, useNullPassword: bool, dryRun: bool) -> Result ---

    // Unloads the currently loaded local console account.
    ACTA_UnloadConsoleAccount :: proc() -> Result ---

    // Enables or disables the account password cache for a specific account. When the account
    // password cache is enabled, entering the password is not required to log into the account.
    ACTA_EnableAccountPasswordCache :: proc(accountSlot: u8, enabled: bool) -> Result ---

    // Sets the default account that is loaded when the ACT module is initialized.
    ACTA_SetDefaultAccount :: proc(accountSlot: u8) -> Result ---

    // Replaces the AccountId with the AssignedAccountId for a specific account.
    ACTA_ReplaceAccountId :: proc(accountSlot: u8) -> Result ---

    // Creates a support context for a specific account.
    ACTA_GetSupportContext :: proc(supportContext: ^SupportContext, accountSlot: u8) -> Result ---

    // Sets server environment settings for a specific account. This will also update CFG
    // configuration block 0x150002 accordingly.
    ACTA_SetHostServerSettings :: proc(accountSlot: u8, nnasType: u8, nfsType: u8, nfsNo: u8) -> Result ---

    // Sets default server environment settings. This will also update CFG configuration block
    // 0x150002 accordingly.
    ACTA_SetDefaultHostServerSettings :: proc(nnasType: u8, nfsType: u8, nfsNo: u8) -> Result ---

    // Sets server environment settings (in string form) for a specific account. This will also
    // update CFG configuration block 0x150002 accordingly.
    ACTA_SetHostServerSettingsStr :: proc(accountSlot: u8, nnasSubdomain: ^ActNnasSubdomain, nfsTypeStr: ^NfsTypeStr) -> Result ---

    // Sets default server environment settings (in string form). This will also update CFG
    // configuration block 0x150002 accordingly.
    ACTA_SetDefaultHostServerSettingsStr :: proc(nnasSubdomain: ^ActNnasSubdomain, nfsTypeStr: ^NfsTypeStr) -> Result ---

    // Sets the internal base value for generating new persistent IDs.
    ACTA_SetPersistentIdHead :: proc(head: u32) -> Result ---

    // Sets the internal base value for generating new transferable IDs.
    ACTA_SetTransferableIdCounter :: proc(counter: u16) -> Result ---

    // Updates a specific account's Mii data and screen name.
    ACTA_UpdateMiiData :: proc(accountSlot: u8, miiData: ^CFLStoreData, screenName: ^MiiScreenName) -> Result ---

    // Updates a Mii image of a specific account.
    ACTA_UpdateMiiImage :: proc(accountSlot: u8, miiImageType: u8, image: rawptr, imageSize: u32) -> Result ---

    // Checks whether or not the given account ID is available for creating a new server account.
    ACTA_InquireAccountIdAvailability :: proc(accountSlot: u8, accountId: ^AccountId, completionEvent: Handle) -> Result ---

    // Links a new server account to a local console account. In other words, this creates and links
    // an NNID.
    ACTA_BindToNewServerAccount :: proc(accountSlot: u8, accountId: ^AccountId, mailAddress: ^AccountMailAddress, password: ^AccountPassword, isParentEmail: bool, marketingFlag: bool, offDeviceFlag: bool, birthDateTimestatmp: i64, gender: u8, region: u32, timezone: ^AccountTimezone, eulaInfo: ^EulaInfo, parentalConsentTimestamp: i64, parentalConsentId: u32, completionEvent: Handle) -> Result ---

    // Links a local console account to an existing server account. In other words, this links an
    // existing NNID.
    ACTA_BindToExistentServerAccount :: proc(accountSlot: u8, accountId: ^AccountId, mailAddress: ^AccountMailAddress, password: ^AccountPassword, completionEvent: Handle) -> Result ---

    // Acquires information about an existing server account.
    ACTA_InquireBindingToExistentServerAccount :: proc(accountSlot: u8, accountId: ^AccountId, mailAddress: ^AccountMailAddress, password: ^AccountPassword, completionEvent: Handle) -> Result ---

    // Deletes a server account. In other words, this deletes an NNID (server-side).
    ACTA_DeleteServerAccount :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Acquires an account token for a specific account.
    ACTA_AcquireAccountTokenEx :: proc(accountSlot: u8, password: ^AccountPassword, useNullPassword: bool, completionEvent: Handle) -> Result ---

    // Submits a EULA agreement to the account server.
    ACTA_AgreeEula :: proc(accountSlot: u8, eulaInfo: ^EulaInfo, agreementTimestamp: i64, completionEvent: Handle) -> Result ---

    // Reloads account information from the server for a specific account.
    ACTA_SyncAccountInfo :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Invalidates a specific account's access token in different ways.
    ACTA_InvalidateAccountToken :: proc(accountSlot: u8, invalidationActionMask: u32) -> Result ---

    // Updates the account password for a specific account.
    ACTA_UpdateAccountPassword :: proc(accountSlot: u8, newPassword: ^AccountPassword, completionEvent: Handle) -> Result ---

    // Requests the issuing of a temporary password (valid for 24 hours) to the email address
    // associated with a specific account.
    ACTA_ReissueAccountPassword :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Sets the account password input for a specific account. This value is not stored in the save
    // data and only resides in memory. Following up a call to this command with a call to
    // ACTA_EnableAccountPasswordCache will lead to the account password cache being updated.
    ACTA_SetAccountPasswordInput :: proc(accountSlot: u8, passwordInput: ^AccountPassword) -> Result ---

    // Uploads the Mii data of a specific account to the account server.
    ACTA_UploadMii :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Inactivates the device association for a specific account.
    ACTA_InactivateDeviceAssociation :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Validates the email address of a specific account using the code received via the
    // confirmation email.
    ACTA_ValidateMailAddress :: proc(accountSlot: u8, confirmationCode: u32, completionEvent: Handle) -> Result ---

    // Requests parental approval for a specific account.
    ACTA_SendPostingApprovalMail :: proc(accountSlot: u8, parentalEmail: ^AccountMailAddress, completionEvent: Handle) -> Result ---

    // Requests the email address confirmation mail to be resent for a specific account.
    ACTA_SendConfirmationMail :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Registers a parental email address to be used in case the parental controls PIN has been
    // forgotten for a specific account.
    ACTA_SendConfirmationMailForPin :: proc(accountSlot: u8, parentalEmail: ^AccountMailAddress, completionEvent: Handle) -> Result ---

    // Sends the master key for resetting parental controls to a parental email for a specific
    // account.
    ACTA_SendMasterKeyMailForPin :: proc(accountSlot: u8, masterKey: u32, parentalEmail: ^AccountMailAddress, completionEvent: Handle) -> Result ---

    // Requests COPPA parental consent using credit card information.
    ACTA_ApproveByCreditCard :: proc(accountSlot: u8, cardInfo: ^CreditCardInfo, completionEvent: Handle) -> Result ---

    // Requests a COPPA code for a specific account.
    ACTA_SendCoppaCodeMail :: proc(accountSlot: u8, principalId: u32, completionEvent: Handle) -> Result ---

    // Set a flag in a specifc account's data that determines whether or not it is necessary to
    // upload the account Mii data to the account server.
    ACTA_SetIsMiiUpdated :: proc(accountSlot: u8, isDirty: bool) -> Result ---

    // Initializes a server account transfer of a specific account to another device.
    ACTA_ReserveTransfer :: proc(accountSlot: u8, newDevice: ^DeviceInfo, operatorData: [^]u8, operatorSize: u32, completionEvent: Handle) -> Result ---

    // Finalizes a server account transfer of a specifc account to another device.
    ACTA_CompleteTransfer :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Inactivates the account-device association for a specific account. In other words, this
    // deletes an NNID.
    ACTA_InactivateAccountDeviceAssociation :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Set the internal network time field.
    ACTA_SetNetworkTime :: proc(timestamp: i64) -> Result ---

    // Updates the account info of a specific account using raw XML data.
    ACTA_UpdateAccountInfo :: proc(accountSlot: u8, xmlData: [^]u8, xmlDataSize: u32, completionEvent: Handle) -> Result ---

    // Updates the email address of a specific account.
    ACTA_UpdateAccountMailAddress :: proc(accountSlot: u8, newEmail: ^AccountMailAddress, completionEvent: Handle) -> Result ---

    // Deletes the device association for a specific account.
    ACTA_DeleteDeviceAssociation :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Deletes the account-device association for a specific account.
    ACTA_DeleteAccountDeviceAssociation :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Cancels a pending server account transfer of a specific account to another device.
    ACTA_CancelTransfer :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---

    // Cancels any running HTTP requests, saves all pending changes to the system save data, then
    // signals unloadFinishedEvent. Then, waits for remountAndBlockEvent, and once this has been
    // signaled, remounts the system save, and blocks subsequent attempts to save the system save
    // data (which can be bypassed by entering and exiting sleep mode).
    ACTA_ReloadAndBlockSaveData :: proc(unloadFinishedEvent: Handle, remountAndBlockEvent: Handle) -> Result ---

    // Initializes server-side account deletion for a specific account. In other words, this deletes
    // an NNID.
    ACTA_ReserveServerAccountDeletion :: proc(accountSlot: u8, completionEvent: Handle) -> Result ---
}
