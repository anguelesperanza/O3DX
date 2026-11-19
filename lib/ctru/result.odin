package ctru

// ============================================================
// Result codes
// 3ds/result.h
//
// Helpers for picking apart a Result: the level, summary, module and description fields, and the
// values each can take.
// ============================================================

// Result code level values.
RL_SUCCESS      :: 0
RL_INFO         :: 1
RL_FATAL        :: 0x1F
RL_RESET        :: 0x1E
RL_REINITIALIZE :: 0x1D
RL_USAGE        :: 0x1C
RL_PERMANENT    :: 0x1B
RL_TEMPORARY    :: 0x1A
RL_STATUS       :: 0x19

// Result code summary values.
RS_SUCCESS       :: 0
RS_NOP           :: 1
RS_WOULDBLOCK    :: 2
RS_OUTOFRESOURCE :: 3
RS_NOTFOUND      :: 4
RS_INVALIDSTATE  :: 5
RS_NOTSUPPORTED  :: 6
RS_INVALIDARG    :: 7
RS_WRONGARG      :: 8
RS_CANCELED      :: 9
RS_STATUSCHANGED :: 0xA
RS_INTERNAL      :: 0xB
RS_INVALIDRESVAL :: 0x3F

// Result code module values.
RM_COMMON        :: 0
RM_KERNEL        :: 1
RM_UTIL          :: 2
RM_FILE_SERVER   :: 3
RM_LOADER_SERVER :: 4
RM_TCB           :: 5
RM_OS            :: 6
RM_DBG           :: 7
RM_DMNT          :: 8
RM_PDN           :: 9
RM_GSP           :: 0xA
RM_I2C           :: 0xB
RM_GPIO          :: 0xC
RM_DD            :: 0xD
RM_CODEC         :: 0xE
RM_SPI           :: 0xF
RM_PXI           :: 0x10
RM_FS            :: 0x11
RM_DI            :: 0x12
RM_HID           :: 0x13
RM_CAM           :: 0x14
RM_PI            :: 0x15
RM_PM            :: 0x16
RM_PM_LOW        :: 0x17
RM_FSI           :: 0x18
RM_SRV           :: 0x19
RM_NDM           :: 0x1A
RM_NWM           :: 0x1B
RM_SOC           :: 0x1C
RM_LDR           :: 0x1D
RM_ACC           :: 0x1E
RM_ROMFS         :: 0x1F
RM_AM            :: 0x20
RM_HIO           :: 0x21
RM_UPDATER       :: 0x22
RM_MIC           :: 0x23
RM_FND           :: 0x24
RM_MP            :: 0x25
RM_MPWL          :: 0x26
RM_AC            :: 0x27
RM_HTTP          :: 0x28
RM_DSP           :: 0x29
RM_SND           :: 0x2A
RM_DLP           :: 0x2B
RM_HIO_LOW       :: 0x2C
RM_CSND          :: 0x2D
RM_SSL           :: 0x2E
RM_AM_LOW        :: 0x2F
RM_NEX           :: 0x30
RM_FRIENDS       :: 0x31
RM_RDT           :: 0x32
RM_APPLET        :: 0x33
RM_NIM           :: 0x34
RM_PTM           :: 0x35
RM_MIDI          :: 0x36
RM_MC            :: 0x37
RM_SWC           :: 0x38
RM_FATFS         :: 0x39
RM_NGC           :: 0x3A
RM_CARD          :: 0x3B
RM_CARDNOR       :: 0x3C
RM_SDMC          :: 0x3D
RM_BOSS          :: 0x3E
RM_DBM           :: 0x3F
RM_CONFIG        :: 0x40
RM_PS            :: 0x41
RM_CEC           :: 0x42
RM_IR            :: 0x43
RM_UDS           :: 0x44
RM_PL            :: 0x45
RM_CUP           :: 0x46
RM_GYROSCOPE     :: 0x47
RM_MCU           :: 0x48
RM_NS            :: 0x49
RM_NEWS          :: 0x4A
RM_RO            :: 0x4B
RM_GD            :: 0x4C
RM_CARD_SPI      :: 0x4D
RM_EC            :: 0x4E
RM_WEB_BROWSER   :: 0x4F
RM_TEST          :: 0x50
RM_ENC           :: 0x51
RM_PIA           :: 0x52
RM_ACT           :: 0x53
RM_VCTL          :: 0x54
RM_OLV           :: 0x55
RM_NEIA          :: 0x56
RM_NPNS          :: 0x57
RM_AVD           :: 0x5A
RM_L2B           :: 0x5B
RM_MVD           :: 0x5C
RM_NFC           :: 0x5D
RM_UART          :: 0x5E
RM_SPM           :: 0x5F
RM_QTM           :: 0x60
RM_NFP           :: 0x61
RM_APPLICATION   :: 0xFE
RM_INVALIDRESVAL :: 0xFF

// Result code generic description values.
RD_SUCCESS              :: 0
RD_INVALID_RESULT_VALUE :: 0x3FF
RD_TIMEOUT              :: 0x3FE
RD_OUT_OF_RANGE         :: 0x3FD
RD_ALREADY_EXISTS       :: 0x3FC
RD_CANCEL_REQUESTED     :: 0x3FB
RD_NOT_FOUND            :: 0x3FA
RD_ALREADY_INITIALIZED  :: 0x3F9
RD_NOT_INITIALIZED      :: 0x3F8
RD_INVALID_HANDLE       :: 0x3F7
RD_INVALID_POINTER      :: 0x3F6
RD_INVALID_ADDRESS      :: 0x3F5
RD_NOT_IMPLEMENTED      :: 0x3F4
RD_OUT_OF_MEMORY        :: 0x3F3
RD_MISALIGNED_SIZE      :: 0x3F2
RD_MISALIGNED_ADDRESS   :: 0x3F1
RD_BUSY                 :: 0x3F0
RD_NO_DATA              :: 0x3EF
RD_INVALID_COMBINATION  :: 0x3EE
RD_INVALID_ENUM_VALUE   :: 0x3ED
RD_INVALID_SIZE         :: 0x3EC
RD_ALREADY_DONE         :: 0x3EB
RD_NOT_AUTHORIZED       :: 0x3EA
RD_TOO_LARGE            :: 0x3E9
RD_INVALID_SELECTION    :: 0x3E8
