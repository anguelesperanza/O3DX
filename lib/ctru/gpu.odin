package ctru

// ============================================================
// GPU command buffers, GX and registers
// 3ds/gpu/registers.h, 3ds/gpu/gx.h, 3ds/gpu/gpu.h
//
// Low-level GPU access: building GPU command lists (GPUCMD_*), the GX transfer and fill
// commands, and the GPU register addresses. citro3d does all of this for you; these are for code
// that drives the GPU directly.
// ============================================================

GPUREG_0000                            :: 0x0
GPUREG_0001                            :: 0x1
GPUREG_0002                            :: 0x2
GPUREG_0003                            :: 0x3
GPUREG_0004                            :: 0x4
GPUREG_0005                            :: 0x5
GPUREG_0006                            :: 0x6
GPUREG_0007                            :: 0x7
GPUREG_0008                            :: 0x8
GPUREG_0009                            :: 0x9
GPUREG_000A                            :: 0xA
GPUREG_000B                            :: 0xB
GPUREG_000C                            :: 0xC
GPUREG_000D                            :: 0xD
GPUREG_000E                            :: 0xE
GPUREG_000F                            :: 0xF
GPUREG_FINALIZE                        :: 0x10
GPUREG_0011                            :: 0x11
GPUREG_0012                            :: 0x12
GPUREG_0013                            :: 0x13
GPUREG_0014                            :: 0x14
GPUREG_0015                            :: 0x15
GPUREG_0016                            :: 0x16
GPUREG_0017                            :: 0x17
GPUREG_0018                            :: 0x18
GPUREG_0019                            :: 0x19
GPUREG_001A                            :: 0x1A
GPUREG_001B                            :: 0x1B
GPUREG_001C                            :: 0x1C
GPUREG_001D                            :: 0x1D
GPUREG_001E                            :: 0x1E
GPUREG_001F                            :: 0x1F
GPUREG_0020                            :: 0x20
GPUREG_0021                            :: 0x21
GPUREG_0022                            :: 0x22
GPUREG_0023                            :: 0x23
GPUREG_0024                            :: 0x24
GPUREG_0025                            :: 0x25
GPUREG_0026                            :: 0x26
GPUREG_0027                            :: 0x27
GPUREG_0028                            :: 0x28
GPUREG_0029                            :: 0x29
GPUREG_002A                            :: 0x2A
GPUREG_002B                            :: 0x2B
GPUREG_002C                            :: 0x2C
GPUREG_002D                            :: 0x2D
GPUREG_002E                            :: 0x2E
GPUREG_002F                            :: 0x2F
GPUREG_0030                            :: 0x30
GPUREG_0031                            :: 0x31
GPUREG_0032                            :: 0x32
GPUREG_0033                            :: 0x33
GPUREG_0034                            :: 0x34
GPUREG_0035                            :: 0x35
GPUREG_0036                            :: 0x36
GPUREG_0037                            :: 0x37
GPUREG_0038                            :: 0x38
GPUREG_0039                            :: 0x39
GPUREG_003A                            :: 0x3A
GPUREG_003B                            :: 0x3B
GPUREG_003C                            :: 0x3C
GPUREG_003D                            :: 0x3D
GPUREG_003E                            :: 0x3E
GPUREG_003F                            :: 0x3F
GPUREG_FACECULLING_CONFIG              :: 0x40
GPUREG_VIEWPORT_WIDTH                  :: 0x41
GPUREG_VIEWPORT_INVW                   :: 0x42
GPUREG_VIEWPORT_HEIGHT                 :: 0x43
GPUREG_VIEWPORT_INVH                   :: 0x44
GPUREG_0045                            :: 0x45
GPUREG_0046                            :: 0x46
GPUREG_FRAGOP_CLIP                     :: 0x47
GPUREG_FRAGOP_CLIP_DATA0               :: 0x48
GPUREG_FRAGOP_CLIP_DATA1               :: 0x49
GPUREG_FRAGOP_CLIP_DATA2               :: 0x4A
GPUREG_FRAGOP_CLIP_DATA3               :: 0x4B
GPUREG_004C                            :: 0x4C
GPUREG_DEPTHMAP_SCALE                  :: 0x4D
GPUREG_DEPTHMAP_OFFSET                 :: 0x4E
GPUREG_SH_OUTMAP_TOTAL                 :: 0x4F
GPUREG_SH_OUTMAP_O0                    :: 0x50
GPUREG_SH_OUTMAP_O1                    :: 0x51
GPUREG_SH_OUTMAP_O2                    :: 0x52
GPUREG_SH_OUTMAP_O3                    :: 0x53
GPUREG_SH_OUTMAP_O4                    :: 0x54
GPUREG_SH_OUTMAP_O5                    :: 0x55
GPUREG_SH_OUTMAP_O6                    :: 0x56
GPUREG_0057                            :: 0x57
GPUREG_0058                            :: 0x58
GPUREG_0059                            :: 0x59
GPUREG_005A                            :: 0x5A
GPUREG_005B                            :: 0x5B
GPUREG_005C                            :: 0x5C
GPUREG_005D                            :: 0x5D
GPUREG_005E                            :: 0x5E
GPUREG_005F                            :: 0x5F
GPUREG_0060                            :: 0x60
GPUREG_EARLYDEPTH_FUNC                 :: 0x61
GPUREG_EARLYDEPTH_TEST1                :: 0x62
GPUREG_EARLYDEPTH_CLEAR                :: 0x63
GPUREG_SH_OUTATTR_MODE                 :: 0x64
GPUREG_SCISSORTEST_MODE                :: 0x65
GPUREG_SCISSORTEST_POS                 :: 0x66
GPUREG_SCISSORTEST_DIM                 :: 0x67
GPUREG_VIEWPORT_XY                     :: 0x68
GPUREG_0069                            :: 0x69
GPUREG_EARLYDEPTH_DATA                 :: 0x6A
GPUREG_006B                            :: 0x6B
GPUREG_006C                            :: 0x6C
GPUREG_DEPTHMAP_ENABLE                 :: 0x6D
GPUREG_RENDERBUF_DIM                   :: 0x6E
GPUREG_SH_OUTATTR_CLOCK                :: 0x6F
GPUREG_0070                            :: 0x70
GPUREG_0071                            :: 0x71
GPUREG_0072                            :: 0x72
GPUREG_0073                            :: 0x73
GPUREG_0074                            :: 0x74
GPUREG_0075                            :: 0x75
GPUREG_0076                            :: 0x76
GPUREG_0077                            :: 0x77
GPUREG_0078                            :: 0x78
GPUREG_0079                            :: 0x79
GPUREG_007A                            :: 0x7A
GPUREG_007B                            :: 0x7B
GPUREG_007C                            :: 0x7C
GPUREG_007D                            :: 0x7D
GPUREG_007E                            :: 0x7E
GPUREG_007F                            :: 0x7F
GPUREG_TEXUNIT_CONFIG                  :: 0x80
GPUREG_TEXUNIT0_BORDER_COLOR           :: 0x81
GPUREG_TEXUNIT0_DIM                    :: 0x82
GPUREG_TEXUNIT0_PARAM                  :: 0x83
GPUREG_TEXUNIT0_LOD                    :: 0x84
GPUREG_TEXUNIT0_ADDR1                  :: 0x85
GPUREG_TEXUNIT0_ADDR2                  :: 0x86
GPUREG_TEXUNIT0_ADDR3                  :: 0x87
GPUREG_TEXUNIT0_ADDR4                  :: 0x88
GPUREG_TEXUNIT0_ADDR5                  :: 0x89
GPUREG_TEXUNIT0_ADDR6                  :: 0x8A
GPUREG_TEXUNIT0_SHADOW                 :: 0x8B
GPUREG_008C                            :: 0x8C
GPUREG_008D                            :: 0x8D
GPUREG_TEXUNIT0_TYPE                   :: 0x8E
GPUREG_LIGHTING_ENABLE0                :: 0x8F
GPUREG_0090                            :: 0x90
GPUREG_TEXUNIT1_BORDER_COLOR           :: 0x91
GPUREG_TEXUNIT1_DIM                    :: 0x92
GPUREG_TEXUNIT1_PARAM                  :: 0x93
GPUREG_TEXUNIT1_LOD                    :: 0x94
GPUREG_TEXUNIT1_ADDR                   :: 0x95
GPUREG_TEXUNIT1_TYPE                   :: 0x96
GPUREG_0097                            :: 0x97
GPUREG_0098                            :: 0x98
GPUREG_TEXUNIT2_BORDER_COLOR           :: 0x99
GPUREG_TEXUNIT2_DIM                    :: 0x9A
GPUREG_TEXUNIT2_PARAM                  :: 0x9B
GPUREG_TEXUNIT2_LOD                    :: 0x9C
GPUREG_TEXUNIT2_ADDR                   :: 0x9D
GPUREG_TEXUNIT2_TYPE                   :: 0x9E
GPUREG_009F                            :: 0x9F
GPUREG_00A0                            :: 0xA0
GPUREG_00A1                            :: 0xA1
GPUREG_00A2                            :: 0xA2
GPUREG_00A3                            :: 0xA3
GPUREG_00A4                            :: 0xA4
GPUREG_00A5                            :: 0xA5
GPUREG_00A6                            :: 0xA6
GPUREG_00A7                            :: 0xA7
GPUREG_TEXUNIT3_PROCTEX0               :: 0xA8
GPUREG_TEXUNIT3_PROCTEX1               :: 0xA9
GPUREG_TEXUNIT3_PROCTEX2               :: 0xAA
GPUREG_TEXUNIT3_PROCTEX3               :: 0xAB
GPUREG_TEXUNIT3_PROCTEX4               :: 0xA
GPUREG_TEXUNIT3_PROCTEX5               :: 0xD
GPUREG_00AE                            :: 0xAE
GPUREG_PROCTEX_LUT                     :: 0xAF
GPUREG_PROCTEX_LUT_DATA0               :: 0xB0
GPUREG_PROCTEX_LUT_DATA1               :: 0xB1
GPUREG_PROCTEX_LUT_DATA2               :: 0xB2
GPUREG_PROCTEX_LUT_DATA3               :: 0xB3
GPUREG_PROCTEX_LUT_DATA4               :: 0xB4
GPUREG_PROCTEX_LUT_DATA5               :: 0xB5
GPUREG_PROCTEX_LUT_DATA6               :: 0xB6
GPUREG_PROCTEX_LUT_DATA7               :: 0xB7
GPUREG_00B8                            :: 0xB8
GPUREG_00B9                            :: 0xB9
GPUREG_00BA                            :: 0xBA
GPUREG_00BB                            :: 0xBB
GPUREG_00BC                            :: 0xBC
GPUREG_00BD                            :: 0xBD
GPUREG_00BE                            :: 0xBE
GPUREG_00BF                            :: 0xBF
GPUREG_TEXENV0_SOURCE                  :: 0xC0
GPUREG_TEXENV0_OPERAND                 :: 0xC1
GPUREG_TEXENV0_COMBINER                :: 0xC2
GPUREG_TEXENV0_COLOR                   :: 0xC3
GPUREG_TEXENV0_SCALE                   :: 0xC4
GPUREG_00C5                            :: 0xC5
GPUREG_00C6                            :: 0xC6
GPUREG_00C7                            :: 0xC7
GPUREG_TEXENV1_SOURCE                  :: 0xC8
GPUREG_TEXENV1_OPERAND                 :: 0xC9
GPUREG_TEXENV1_COMBINER                :: 0xCA
GPUREG_TEXENV1_COLOR                   :: 0xCB
GPUREG_TEXENV1_SCALE                   :: 0xCC
GPUREG_00CD                            :: 0xCD
GPUREG_00CE                            :: 0xCE
GPUREG_00CF                            :: 0xCF
GPUREG_TEXENV2_SOURCE                  :: 0xD0
GPUREG_TEXENV2_OPERAND                 :: 0xD1
GPUREG_TEXENV2_COMBINER                :: 0xD2
GPUREG_TEXENV2_COLOR                   :: 0xD3
GPUREG_TEXENV2_SCALE                   :: 0xD4
GPUREG_00D5                            :: 0xD5
GPUREG_00D6                            :: 0xD6
GPUREG_00D7                            :: 0xD7
GPUREG_TEXENV3_SOURCE                  :: 0xD8
GPUREG_TEXENV3_OPERAND                 :: 0xD9
GPUREG_TEXENV3_COMBINER                :: 0xDA
GPUREG_TEXENV3_COLOR                   :: 0xDB
GPUREG_TEXENV3_SCALE                   :: 0xDC
GPUREG_00DD                            :: 0xDD
GPUREG_00DE                            :: 0xDE
GPUREG_00DF                            :: 0xDF
GPUREG_TEXENV_UPDATE_BUFFER            :: 0xE0
GPUREG_FOG_COLOR                       :: 0xE1
GPUREG_00E2                            :: 0xE2
GPUREG_00E3                            :: 0xE3
GPUREG_GAS_ATTENUATION                 :: 0xE4
GPUREG_GAS_ACCMAX                      :: 0xE5
GPUREG_FOG_LUT_INDEX                   :: 0xE6
GPUREG_00E7                            :: 0xE7
GPUREG_FOG_LUT_DATA0                   :: 0xE8
GPUREG_FOG_LUT_DATA1                   :: 0xE9
GPUREG_FOG_LUT_DATA2                   :: 0xEA
GPUREG_FOG_LUT_DATA3                   :: 0xEB
GPUREG_FOG_LUT_DATA4                   :: 0xEC
GPUREG_FOG_LUT_DATA5                   :: 0xED
GPUREG_FOG_LUT_DATA6                   :: 0xEE
GPUREG_FOG_LUT_DATA7                   :: 0xEF
GPUREG_TEXENV4_SOURCE                  :: 0xF0
GPUREG_TEXENV4_OPERAND                 :: 0xF1
GPUREG_TEXENV4_COMBINER                :: 0xF2
GPUREG_TEXENV4_COLOR                   :: 0xF3
GPUREG_TEXENV4_SCALE                   :: 0xF4
GPUREG_00F5                            :: 0xF5
GPUREG_00F6                            :: 0xF6
GPUREG_00F7                            :: 0xF7
GPUREG_TEXENV5_SOURCE                  :: 0xF8
GPUREG_TEXENV5_OPERAND                 :: 0xF9
GPUREG_TEXENV5_COMBINER                :: 0xFA
GPUREG_TEXENV5_COLOR                   :: 0xFB
GPUREG_TEXENV5_SCALE                   :: 0xFC
GPUREG_TEXENV_BUFFER_COLOR             :: 0xFD
GPUREG_00FE                            :: 0xFE
GPUREG_00FF                            :: 0xFF
GPUREG_COLOR_OPERATION                 :: 0x100
GPUREG_BLEND_FUNC                      :: 0x101
GPUREG_LOGIC_OP                        :: 0x102
GPUREG_BLEND_COLOR                     :: 0x103
GPUREG_FRAGOP_ALPHA_TEST               :: 0x104
GPUREG_STENCIL_TEST                    :: 0x105
GPUREG_STENCIL_OP                      :: 0x106
GPUREG_DEPTH_COLOR_MASK                :: 0x107
GPUREG_0108                            :: 0x108
GPUREG_0109                            :: 0x109
GPUREG_010A                            :: 0x10A
GPUREG_010B                            :: 0x10B
GPUREG_010C                            :: 0x10C
GPUREG_010D                            :: 0x10D
GPUREG_010E                            :: 0x10E
GPUREG_010F                            :: 0x10F
GPUREG_FRAMEBUFFER_INVALIDATE          :: 0x110
GPUREG_FRAMEBUFFER_FLUSH               :: 0x111
GPUREG_COLORBUFFER_READ                :: 0x112
GPUREG_COLORBUFFER_WRITE               :: 0x113
GPUREG_DEPTHBUFFER_READ                :: 0x114
GPUREG_DEPTHBUFFER_WRITE               :: 0x115
GPUREG_DEPTHBUFFER_FORMAT              :: 0x116
GPUREG_COLORBUFFER_FORMAT              :: 0x117
GPUREG_EARLYDEPTH_TEST2                :: 0x118
GPUREG_0119                            :: 0x119
GPUREG_011A                            :: 0x11A
GPUREG_FRAMEBUFFER_BLOCK32             :: 0x11B
GPUREG_DEPTHBUFFER_LOC                 :: 0x11C
GPUREG_COLORBUFFER_LOC                 :: 0x11D
GPUREG_FRAMEBUFFER_DIM                 :: 0x11E
GPUREG_011F                            :: 0x11F
GPUREG_GAS_LIGHT_XY                    :: 0x120
GPUREG_GAS_LIGHT_Z                     :: 0x121
GPUREG_GAS_LIGHT_Z_COLOR               :: 0x122
GPUREG_GAS_LUT_INDEX                   :: 0x123
GPUREG_GAS_LUT_DATA                    :: 0x124
GPUREG_GAS_ACCMAX_FEEDBACK             :: 0x125
GPUREG_GAS_DELTAZ_DEPTH                :: 0x126
GPUREG_0127                            :: 0x127
GPUREG_0128                            :: 0x128
GPUREG_0129                            :: 0x129
GPUREG_012A                            :: 0x12A
GPUREG_012B                            :: 0x12B
GPUREG_012C                            :: 0x12C
GPUREG_012D                            :: 0x12D
GPUREG_012E                            :: 0x12E
GPUREG_012F                            :: 0x12F
GPUREG_FRAGOP_SHADOW                   :: 0x130
GPUREG_0131                            :: 0x131
GPUREG_0132                            :: 0x132
GPUREG_0133                            :: 0x133
GPUREG_0134                            :: 0x134
GPUREG_0135                            :: 0x135
GPUREG_0136                            :: 0x136
GPUREG_0137                            :: 0x137
GPUREG_0138                            :: 0x138
GPUREG_0139                            :: 0x139
GPUREG_013A                            :: 0x13A
GPUREG_013B                            :: 0x13B
GPUREG_013C                            :: 0x13C
GPUREG_013D                            :: 0x13D
GPUREG_013E                            :: 0x13E
GPUREG_013F                            :: 0x13F
GPUREG_LIGHT0_SPECULAR0                :: 0x140
GPUREG_LIGHT0_SPECULAR1                :: 0x141
GPUREG_LIGHT0_DIFFUSE                  :: 0x142
GPUREG_LIGHT0_AMBIENT                  :: 0x143
GPUREG_LIGHT0_XY                       :: 0x144
GPUREG_LIGHT0_Z                        :: 0x145
GPUREG_LIGHT0_SPOTDIR_XY               :: 0x146
GPUREG_LIGHT0_SPOTDIR_Z                :: 0x147
GPUREG_0148                            :: 0x148
GPUREG_LIGHT0_CONFIG                   :: 0x149
GPUREG_LIGHT0_ATTENUATION_BIAS         :: 0x14A
GPUREG_LIGHT0_ATTENUATION_SCALE        :: 0x14B
GPUREG_014C                            :: 0x14C
GPUREG_014D                            :: 0x14D
GPUREG_014E                            :: 0x14E
GPUREG_014F                            :: 0x14F
GPUREG_LIGHT1_SPECULAR0                :: 0x150
GPUREG_LIGHT1_SPECULAR1                :: 0x151
GPUREG_LIGHT1_DIFFUSE                  :: 0x152
GPUREG_LIGHT1_AMBIENT                  :: 0x153
GPUREG_LIGHT1_XY                       :: 0x154
GPUREG_LIGHT1_Z                        :: 0x155
GPUREG_LIGHT1_SPOTDIR_XY               :: 0x156
GPUREG_LIGHT1_SPOTDIR_Z                :: 0x157
GPUREG_0158                            :: 0x158
GPUREG_LIGHT1_CONFIG                   :: 0x159
GPUREG_LIGHT1_ATTENUATION_BIAS         :: 0x15A
GPUREG_LIGHT1_ATTENUATION_SCALE        :: 0x15B
GPUREG_015C                            :: 0x15C
GPUREG_015D                            :: 0x15D
GPUREG_015E                            :: 0x15E
GPUREG_015F                            :: 0x15F
GPUREG_LIGHT2_SPECULAR0                :: 0x160
GPUREG_LIGHT2_SPECULAR1                :: 0x161
GPUREG_LIGHT2_DIFFUSE                  :: 0x162
GPUREG_LIGHT2_AMBIENT                  :: 0x163
GPUREG_LIGHT2_XY                       :: 0x164
GPUREG_LIGHT2_Z                        :: 0x165
GPUREG_LIGHT2_SPOTDIR_XY               :: 0x166
GPUREG_LIGHT2_SPOTDIR_Z                :: 0x167
GPUREG_0168                            :: 0x168
GPUREG_LIGHT2_CONFIG                   :: 0x169
GPUREG_LIGHT2_ATTENUATION_BIAS         :: 0x16A
GPUREG_LIGHT2_ATTENUATION_SCALE        :: 0x16B
GPUREG_016C                            :: 0x16C
GPUREG_016D                            :: 0x16D
GPUREG_016E                            :: 0x16E
GPUREG_016F                            :: 0x16F
GPUREG_LIGHT3_SPECULAR0                :: 0x170
GPUREG_LIGHT3_SPECULAR1                :: 0x171
GPUREG_LIGHT3_DIFFUSE                  :: 0x172
GPUREG_LIGHT3_AMBIENT                  :: 0x173
GPUREG_LIGHT3_XY                       :: 0x174
GPUREG_LIGHT3_Z                        :: 0x175
GPUREG_LIGHT3_SPOTDIR_XY               :: 0x176
GPUREG_LIGHT3_SPOTDIR_Z                :: 0x177
GPUREG_0178                            :: 0x178
GPUREG_LIGHT3_CONFIG                   :: 0x179
GPUREG_LIGHT3_ATTENUATION_BIAS         :: 0x17A
GPUREG_LIGHT3_ATTENUATION_SCALE        :: 0x17B
GPUREG_017C                            :: 0x17C
GPUREG_017D                            :: 0x17D
GPUREG_017E                            :: 0x17E
GPUREG_017F                            :: 0x17F
GPUREG_LIGHT4_SPECULAR0                :: 0x180
GPUREG_LIGHT4_SPECULAR1                :: 0x181
GPUREG_LIGHT4_DIFFUSE                  :: 0x182
GPUREG_LIGHT4_AMBIENT                  :: 0x183
GPUREG_LIGHT4_XY                       :: 0x184
GPUREG_LIGHT4_Z                        :: 0x185
GPUREG_LIGHT4_SPOTDIR_XY               :: 0x186
GPUREG_LIGHT4_SPOTDIR_Z                :: 0x187
GPUREG_0188                            :: 0x188
GPUREG_LIGHT4_CONFIG                   :: 0x189
GPUREG_LIGHT4_ATTENUATION_BIAS         :: 0x18A
GPUREG_LIGHT4_ATTENUATION_SCALE        :: 0x18B
GPUREG_018C                            :: 0x18C
GPUREG_018D                            :: 0x18D
GPUREG_018E                            :: 0x18E
GPUREG_018F                            :: 0x18F
GPUREG_LIGHT5_SPECULAR0                :: 0x190
GPUREG_LIGHT5_SPECULAR1                :: 0x191
GPUREG_LIGHT5_DIFFUSE                  :: 0x192
GPUREG_LIGHT5_AMBIENT                  :: 0x193
GPUREG_LIGHT5_XY                       :: 0x194
GPUREG_LIGHT5_Z                        :: 0x195
GPUREG_LIGHT5_SPOTDIR_XY               :: 0x196
GPUREG_LIGHT5_SPOTDIR_Z                :: 0x197
GPUREG_0198                            :: 0x198
GPUREG_LIGHT5_CONFIG                   :: 0x199
GPUREG_LIGHT5_ATTENUATION_BIAS         :: 0x19A
GPUREG_LIGHT5_ATTENUATION_SCALE        :: 0x19B
GPUREG_019C                            :: 0x19C
GPUREG_019D                            :: 0x19D
GPUREG_019E                            :: 0x19E
GPUREG_019F                            :: 0x19F
GPUREG_LIGHT6_SPECULAR0                :: 0x1A0
GPUREG_LIGHT6_SPECULAR1                :: 0x1A1
GPUREG_LIGHT6_DIFFUSE                  :: 0x1A2
GPUREG_LIGHT6_AMBIENT                  :: 0x1A3
GPUREG_LIGHT6_XY                       :: 0x1A4
GPUREG_LIGHT6_Z                        :: 0x1A5
GPUREG_LIGHT6_SPOTDIR_XY               :: 0x1A6
GPUREG_LIGHT6_SPOTDIR_Z                :: 0x1A7
GPUREG_01A8                            :: 0x1A8
GPUREG_LIGHT6_CONFIG                   :: 0x1A9
GPUREG_LIGHT6_ATTENUATION_BIAS         :: 0x1AA
GPUREG_LIGHT6_ATTENUATION_SCALE        :: 0x1AB
GPUREG_01AC                            :: 0x1AC
GPUREG_01AD                            :: 0x1AD
GPUREG_01AE                            :: 0x1AE
GPUREG_01AF                            :: 0x1AF
GPUREG_LIGHT7_SPECULAR0                :: 0x1B0
GPUREG_LIGHT7_SPECULAR1                :: 0x1B1
GPUREG_LIGHT7_DIFFUSE                  :: 0x1B2
GPUREG_LIGHT7_AMBIENT                  :: 0x1B3
GPUREG_LIGHT7_XY                       :: 0x1B4
GPUREG_LIGHT7_Z                        :: 0x1B5
GPUREG_LIGHT7_SPOTDIR_XY               :: 0x1B6
GPUREG_LIGHT7_SPOTDIR_Z                :: 0x1B7
GPUREG_01B8                            :: 0x1B8
GPUREG_LIGHT7_CONFIG                   :: 0x1B9
GPUREG_LIGHT7_ATTENUATION_BIAS         :: 0x1BA
GPUREG_LIGHT7_ATTENUATION_SCALE        :: 0x1BB
GPUREG_01BC                            :: 0x1BC
GPUREG_01BD                            :: 0x1BD
GPUREG_01BE                            :: 0x1BE
GPUREG_01BF                            :: 0x1BF
GPUREG_LIGHTING_AMBIENT                :: 0x1C0
GPUREG_01C1                            :: 0x1C1
GPUREG_LIGHTING_NUM_LIGHTS             :: 0x1C2
GPUREG_LIGHTING_CONFIG0                :: 0x1C3
GPUREG_LIGHTING_CONFIG1                :: 0x1C4
GPUREG_LIGHTING_LUT_INDEX              :: 0x1C5
GPUREG_LIGHTING_ENABLE1                :: 0x1C6
GPUREG_01C7                            :: 0x1C7
GPUREG_LIGHTING_LUT_DATA0              :: 0x1C8
GPUREG_LIGHTING_LUT_DATA1              :: 0x1C9
GPUREG_LIGHTING_LUT_DATA2              :: 0x1CA
GPUREG_LIGHTING_LUT_DATA3              :: 0x1CB
GPUREG_LIGHTING_LUT_DATA4              :: 0x1CC
GPUREG_LIGHTING_LUT_DATA5              :: 0x1CD
GPUREG_LIGHTING_LUT_DATA6              :: 0x1CE
GPUREG_LIGHTING_LUT_DATA7              :: 0x1CF
GPUREG_LIGHTING_LUTINPUT_ABS           :: 0x1D0
GPUREG_LIGHTING_LUTINPUT_SELECT        :: 0x1D1
GPUREG_LIGHTING_LUTINPUT_SCALE         :: 0x1D2
GPUREG_01D3                            :: 0x1D3
GPUREG_01D4                            :: 0x1D4
GPUREG_01D5                            :: 0x1D5
GPUREG_01D6                            :: 0x1D6
GPUREG_01D7                            :: 0x1D7
GPUREG_01D8                            :: 0x1D8
GPUREG_LIGHTING_LIGHT_PERMUTATION      :: 0x1D9
GPUREG_01DA                            :: 0x1DA
GPUREG_01DB                            :: 0x1DB
GPUREG_01DC                            :: 0x1DC
GPUREG_01DD                            :: 0x1DD
GPUREG_01DE                            :: 0x1DE
GPUREG_01DF                            :: 0x1DF
GPUREG_01E0                            :: 0x1E0
GPUREG_01E1                            :: 0x1E1
GPUREG_01E2                            :: 0x1E2
GPUREG_01E3                            :: 0x1E3
GPUREG_01E4                            :: 0x1E4
GPUREG_01E5                            :: 0x1E5
GPUREG_01E6                            :: 0x1E6
GPUREG_01E7                            :: 0x1E7
GPUREG_01E8                            :: 0x1E8
GPUREG_01E9                            :: 0x1E9
GPUREG_01EA                            :: 0x1EA
GPUREG_01EB                            :: 0x1EB
GPUREG_01EC                            :: 0x1EC
GPUREG_01ED                            :: 0x1ED
GPUREG_01EE                            :: 0x1EE
GPUREG_01EF                            :: 0x1EF
GPUREG_01F0                            :: 0x1F0
GPUREG_01F1                            :: 0x1F1
GPUREG_01F2                            :: 0x1F2
GPUREG_01F3                            :: 0x1F3
GPUREG_01F4                            :: 0x1F4
GPUREG_01F5                            :: 0x1F5
GPUREG_01F6                            :: 0x1F6
GPUREG_01F7                            :: 0x1F7
GPUREG_01F8                            :: 0x1F8
GPUREG_01F9                            :: 0x1F9
GPUREG_01FA                            :: 0x1FA
GPUREG_01FB                            :: 0x1FB
GPUREG_01FC                            :: 0x1FC
GPUREG_01FD                            :: 0x1FD
GPUREG_01FE                            :: 0x1FE
GPUREG_01FF                            :: 0x1FF
GPUREG_ATTRIBBUFFERS_LOC               :: 0x200
GPUREG_ATTRIBBUFFERS_FORMAT_LOW        :: 0x201
GPUREG_ATTRIBBUFFERS_FORMAT_HIGH       :: 0x202
GPUREG_ATTRIBBUFFER0_OFFSET            :: 0x203
GPUREG_ATTRIBBUFFER0_CONFIG1           :: 0x204
GPUREG_ATTRIBBUFFER0_CONFIG2           :: 0x205
GPUREG_ATTRIBBUFFER1_OFFSET            :: 0x206
GPUREG_ATTRIBBUFFER1_CONFIG1           :: 0x207
GPUREG_ATTRIBBUFFER1_CONFIG2           :: 0x208
GPUREG_ATTRIBBUFFER2_OFFSET            :: 0x209
GPUREG_ATTRIBBUFFER2_CONFIG1           :: 0x20A
GPUREG_ATTRIBBUFFER2_CONFIG2           :: 0x20B
GPUREG_ATTRIBBUFFER3_OFFSET            :: 0x20C
GPUREG_ATTRIBBUFFER3_CONFIG1           :: 0x20D
GPUREG_ATTRIBBUFFER3_CONFIG2           :: 0x20E
GPUREG_ATTRIBBUFFER4_OFFSET            :: 0x20F
GPUREG_ATTRIBBUFFER4_CONFIG1           :: 0x210
GPUREG_ATTRIBBUFFER4_CONFIG2           :: 0x211
GPUREG_ATTRIBBUFFER5_OFFSET            :: 0x212
GPUREG_ATTRIBBUFFER5_CONFIG1           :: 0x213
GPUREG_ATTRIBBUFFER5_CONFIG2           :: 0x214
GPUREG_ATTRIBBUFFER6_OFFSET            :: 0x215
GPUREG_ATTRIBBUFFER6_CONFIG1           :: 0x216
GPUREG_ATTRIBBUFFER6_CONFIG2           :: 0x217
GPUREG_ATTRIBBUFFER7_OFFSET            :: 0x218
GPUREG_ATTRIBBUFFER7_CONFIG1           :: 0x219
GPUREG_ATTRIBBUFFER7_CONFIG2           :: 0x21A
GPUREG_ATTRIBBUFFER8_OFFSET            :: 0x21B
GPUREG_ATTRIBBUFFER8_CONFIG1           :: 0x21C
GPUREG_ATTRIBBUFFER8_CONFIG2           :: 0x21D
GPUREG_ATTRIBBUFFER9_OFFSET            :: 0x21E
GPUREG_ATTRIBBUFFER9_CONFIG1           :: 0x21F
GPUREG_ATTRIBBUFFER9_CONFIG2           :: 0x220
GPUREG_ATTRIBBUFFERA_OFFSET            :: 0x221
GPUREG_ATTRIBBUFFERA_CONFIG1           :: 0x222
GPUREG_ATTRIBBUFFERA_CONFIG2           :: 0x223
GPUREG_ATTRIBBUFFERB_OFFSET            :: 0x224
GPUREG_ATTRIBBUFFERB_CONFIG1           :: 0x225
GPUREG_ATTRIBBUFFERB_CONFIG2           :: 0x226
GPUREG_INDEXBUFFER_CONFIG              :: 0x227
GPUREG_NUMVERTICES                     :: 0x228
GPUREG_GEOSTAGE_CONFIG                 :: 0x229
GPUREG_VERTEX_OFFSET                   :: 0x22A
GPUREG_022B                            :: 0x22B
GPUREG_022C                            :: 0x22C
GPUREG_POST_VERTEX_CACHE_NUM           :: 0x22D
GPUREG_DRAWARRAYS                      :: 0x22E
GPUREG_DRAWELEMENTS                    :: 0x22F
GPUREG_0230                            :: 0x230
GPUREG_VTX_FUNC                        :: 0x231
GPUREG_FIXEDATTRIB_INDEX               :: 0x232
GPUREG_FIXEDATTRIB_DATA0               :: 0x233
GPUREG_FIXEDATTRIB_DATA1               :: 0x234
GPUREG_FIXEDATTRIB_DATA2               :: 0x235
GPUREG_0236                            :: 0x236
GPUREG_0237                            :: 0x237
GPUREG_CMDBUF_SIZE0                    :: 0x238
GPUREG_CMDBUF_SIZE1                    :: 0x239
GPUREG_CMDBUF_ADDR0                    :: 0x23A
GPUREG_CMDBUF_ADDR1                    :: 0x23B
GPUREG_CMDBUF_JUMP0                    :: 0x23C
GPUREG_CMDBUF_JUMP1                    :: 0x23D
GPUREG_023E                            :: 0x23E
GPUREG_023F                            :: 0x23F
GPUREG_0240                            :: 0x240
GPUREG_0241                            :: 0x241
GPUREG_VSH_NUM_ATTR                    :: 0x242
GPUREG_0243                            :: 0x243
GPUREG_VSH_COM_MODE                    :: 0x244
GPUREG_START_DRAW_FUNC0                :: 0x245
GPUREG_0246                            :: 0x246
GPUREG_0247                            :: 0x247
GPUREG_0248                            :: 0x248
GPUREG_0249                            :: 0x249
GPUREG_VSH_OUTMAP_TOTAL1               :: 0x24A
GPUREG_024B                            :: 0x24B
GPUREG_024C                            :: 0x24C
GPUREG_024D                            :: 0x24D
GPUREG_024E                            :: 0x24E
GPUREG_024F                            :: 0x24F
GPUREG_0250                            :: 0x250
GPUREG_VSH_OUTMAP_TOTAL2               :: 0x251
GPUREG_GSH_MISC0                       :: 0x252
GPUREG_GEOSTAGE_CONFIG2                :: 0x253
GPUREG_GSH_MISC1                       :: 0x254
GPUREG_0255                            :: 0x255
GPUREG_0256                            :: 0x256
GPUREG_0257                            :: 0x257
GPUREG_0258                            :: 0x258
GPUREG_0259                            :: 0x259
GPUREG_025A                            :: 0x25A
GPUREG_025B                            :: 0x25B
GPUREG_025C                            :: 0x25C
GPUREG_025D                            :: 0x25D
GPUREG_PRIMITIVE_CONFIG                :: 0x25E
GPUREG_RESTART_PRIMITIVE               :: 0x25F
GPUREG_0260                            :: 0x260
GPUREG_0261                            :: 0x261
GPUREG_0262                            :: 0x262
GPUREG_0263                            :: 0x263
GPUREG_0264                            :: 0x264
GPUREG_0265                            :: 0x265
GPUREG_0266                            :: 0x266
GPUREG_0267                            :: 0x267
GPUREG_0268                            :: 0x268
GPUREG_0269                            :: 0x269
GPUREG_026A                            :: 0x26A
GPUREG_026B                            :: 0x26B
GPUREG_026C                            :: 0x26C
GPUREG_026D                            :: 0x26D
GPUREG_026E                            :: 0x26E
GPUREG_026F                            :: 0x26F
GPUREG_0270                            :: 0x270
GPUREG_0271                            :: 0x271
GPUREG_0272                            :: 0x272
GPUREG_0273                            :: 0x273
GPUREG_0274                            :: 0x274
GPUREG_0275                            :: 0x275
GPUREG_0276                            :: 0x276
GPUREG_0277                            :: 0x277
GPUREG_0278                            :: 0x278
GPUREG_0279                            :: 0x279
GPUREG_027A                            :: 0x27A
GPUREG_027B                            :: 0x27B
GPUREG_027C                            :: 0x27C
GPUREG_027D                            :: 0x27D
GPUREG_027E                            :: 0x27E
GPUREG_027F                            :: 0x27F
GPUREG_GSH_BOOLUNIFORM                 :: 0x280
GPUREG_GSH_INTUNIFORM_I0               :: 0x281
GPUREG_GSH_INTUNIFORM_I1               :: 0x282
GPUREG_GSH_INTUNIFORM_I2               :: 0x283
GPUREG_GSH_INTUNIFORM_I3               :: 0x284
GPUREG_0285                            :: 0x285
GPUREG_0286                            :: 0x286
GPUREG_0287                            :: 0x287
GPUREG_0288                            :: 0x288
GPUREG_GSH_INPUTBUFFER_CONFIG          :: 0x289
GPUREG_GSH_ENTRYPOINT                  :: 0x28A
GPUREG_GSH_ATTRIBUTES_PERMUTATION_LOW  :: 0x28B
GPUREG_GSH_ATTRIBUTES_PERMUTATION_HIGH :: 0x28C
GPUREG_GSH_OUTMAP_MASK                 :: 0x28D
GPUREG_028E                            :: 0x28E
GPUREG_GSH_CODETRANSFER_END            :: 0x28F
GPUREG_GSH_FLOATUNIFORM_CONFIG         :: 0x290
GPUREG_GSH_FLOATUNIFORM_DATA           :: 0x291
GPUREG_0299                            :: 0x299
GPUREG_029A                            :: 0x29A
GPUREG_GSH_CODETRANSFER_CONFIG         :: 0x29B
GPUREG_GSH_CODETRANSFER_DATA           :: 0x29C
GPUREG_02A4                            :: 0x2A4
GPUREG_GSH_OPDESCS_CONFIG              :: 0x2A5
GPUREG_GSH_OPDESCS_DATA                :: 0x2A6
GPUREG_02AE                            :: 0x2AE
GPUREG_02AF                            :: 0x2AF
GPUREG_VSH_BOOLUNIFORM                 :: 0x2B0
GPUREG_VSH_INTUNIFORM_I0               :: 0x2B1
GPUREG_VSH_INTUNIFORM_I1               :: 0x2B2
GPUREG_VSH_INTUNIFORM_I2               :: 0x2B3
GPUREG_VSH_INTUNIFORM_I3               :: 0x2B4
GPUREG_02B5                            :: 0x2B5
GPUREG_02B6                            :: 0x2B6
GPUREG_02B7                            :: 0x2B7
GPUREG_02B8                            :: 0x2B8
GPUREG_VSH_INPUTBUFFER_CONFIG          :: 0x2B9
GPUREG_VSH_ENTRYPOINT                  :: 0x2BA
GPUREG_VSH_ATTRIBUTES_PERMUTATION_LOW  :: 0x2BB
GPUREG_VSH_ATTRIBUTES_PERMUTATION_HIGH :: 0x2BC
GPUREG_VSH_OUTMAP_MASK                 :: 0x2BD
GPUREG_02BE                            :: 0x2BE
GPUREG_VSH_CODETRANSFER_END            :: 0x2BF
GPUREG_VSH_FLOATUNIFORM_CONFIG         :: 0x2C0
GPUREG_VSH_FLOATUNIFORM_DATA           :: 0x2C1
GPUREG_02C9                            :: 0x2C9
GPUREG_02CA                            :: 0x2CA
GPUREG_VSH_CODETRANSFER_CONFIG         :: 0x2CB
GPUREG_VSH_CODETRANSFER_DATA           :: 0x2CC
GPUREG_02D4                            :: 0x2D4
GPUREG_VSH_OPDESCS_CONFIG              :: 0x2D5
GPUREG_VSH_OPDESCS_DATA                :: 0x2D6
GPUREG_02DE                            :: 0x2DE
GPUREG_02DF                            :: 0x2DF
GPUREG_02E0                            :: 0x2E0
GPUREG_02E1                            :: 0x2E1
GPUREG_02E2                            :: 0x2E2
GPUREG_02E3                            :: 0x2E3
GPUREG_02E4                            :: 0x2E4
GPUREG_02E5                            :: 0x2E5
GPUREG_02E6                            :: 0x2E6
GPUREG_02E7                            :: 0x2E7
GPUREG_02E8                            :: 0x2E8
GPUREG_02E9                            :: 0x2E9
GPUREG_02EA                            :: 0x2EA
GPUREG_02EB                            :: 0x2EB
GPUREG_02EC                            :: 0x2EC
GPUREG_02ED                            :: 0x2ED
GPUREG_02EE                            :: 0x2EE
GPUREG_02EF                            :: 0x2EF
GPUREG_02F0                            :: 0x2F0
GPUREG_02F1                            :: 0x2F1
GPUREG_02F2                            :: 0x2F2
GPUREG_02F3                            :: 0x2F3
GPUREG_02F4                            :: 0x2F4
GPUREG_02F5                            :: 0x2F5
GPUREG_02F6                            :: 0x2F6
GPUREG_02F7                            :: 0x2F7
GPUREG_02F8                            :: 0x2F8
GPUREG_02F9                            :: 0x2F9
GPUREG_02FA                            :: 0x2FA
GPUREG_02FB                            :: 0x2FB
GPUREG_02FC                            :: 0x2FC
GPUREG_02FD                            :: 0x2FD
GPUREG_02FE                            :: 0x2FE
GPUREG_02FF                            :: 0x2FF

// Supported transfer pixel formats.
GX_TRANSFER_FORMAT :: enum u8 {
    RGBA8  = 0, // 8-bit Red + 8-bit Green + 8-bit Blue + 8-bit Alpha
    RGB8   = 1, // 8-bit Red + 8-bit Green + 8-bit Blue
    RGB565 = 2, // 5-bit Red + 6-bit Green + 5-bit Blue
    RGB5A1 = 3, // 5-bit Red + 5-bit Green + 5-bit Blue + 1-bit Alpha
    RGBA4  = 4, // 4-bit Red + 4-bit Green + 4-bit Blue + 4-bit Alpha
}

// Anti-aliasing modes Please remember that the framebuffer is sideways. Hence if you activate 2x1
// anti-aliasing the destination dimensions are w = 240*2 and h = 400
GX_TRANSFER_SCALE :: enum u8 {
    NO = 0, // No anti-aliasing
    X  = 1, // 2x1 anti-aliasing
    XY = 2, // 2x2 anti-aliasing
}

// GX transfer control flags
GX_FILL_CONTROL :: enum u16 {
    FILL_TRIGGER     = 0x1, // Trigger the PPF event
    FILL_FINISHED    = 0x2, // Indicates if the memory fill is complete. You should not use it when requesting a transfer.
    FILL_16BIT_DEPTH = 0x0, // The buffer has a 16 bit per pixel depth
    FILL_24BIT_DEPTH = 0x100, // The buffer has a 24 bit per pixel depth
    FILL_32BIT_DEPTH = 0x200, // The buffer has a 32 bit per pixel depth
}
// Updates gas additive blend results.
GX_CMDLIST_UPDATE_GAS_ACC :: 0x1
// Flushes the command list.
GX_CMDLIST_FLUSH :: 0x2

// GX command entry
// Opaque here: the C type has a union or bitfields. 32 bytes.
gxCmdEntry_s :: struct #align(4) {
    _: [32]u8,
}

// GX command queue structure
gxCmdQueue_s :: struct {
    entries:    ^gxCmdEntry_s, // Pointer to array of GX command entries
    maxEntries: u16, // Capacity of the command array
    numEntries: u16, // Number of commands in the queue
    curEntry:   u16, // Index of the first pending command to be submitted to GX
    lastEntry:  u16, // Number of commands completed by GX
    callback:   proc "c" (arg0: rawptr),
    user:       rawptr, // Data for user callback
}
tag_gxCmdQueue_s :: gxCmdQueue_s

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Clears a GX command queue.
    gxCmdQueueClear :: proc(queue: ^gxCmdQueue_s) ---

    // Adds a command to a GX command queue.
    gxCmdQueueAdd :: proc(queue: ^gxCmdQueue_s, entry: ^gxCmdEntry_s) ---

    // Runs a GX command queue, causing it to begin processing incoming commands as they arrive.
    gxCmdQueueRun :: proc(queue: ^gxCmdQueue_s) ---

    // Stops a GX command queue from processing incoming commands.
    gxCmdQueueStop :: proc(queue: ^gxCmdQueue_s) ---

    // Waits for a GX command queue to finish executing pending commands.
    gxCmdQueueWait :: proc(queue: ^gxCmdQueue_s, timeout: i64) -> bool ---

    // Selects a command queue to which GX_* functions will add commands instead of immediately
    // submitting them to GX.
    GX_BindQueue :: proc(queue: ^gxCmdQueue_s) ---

    // Requests a DMA.
    GX_RequestDma :: proc(src: ^u32, dst: ^u32, length: u32) -> Result ---

    // Processes a GPU command list.
    GX_ProcessCommandList :: proc(buf0a: ^u32, buf0s: u32, flags: u8) -> Result ---

    // Fills the memory of two buffers with the given values.
    GX_MemoryFill :: proc(buf0a: ^u32, buf0v: u32, buf0e: ^u32, control0: u16, buf1a: ^u32, buf1v: u32, buf1e: ^u32, control1: u16) -> Result ---

    // Initiates a display transfer.
    GX_DisplayTransfer :: proc(inadr: ^u32, indim: u32, outadr: ^u32, outdim: u32, flags: u32) -> Result ---

    // Initiates a texture copy.
    GX_TextureCopy :: proc(inadr: ^u32, indim: u32, outadr: ^u32, outdim: u32, size: u32, flags: u32) -> Result ---

    // Flushes the cache regions of three buffers. (This command cannot be queued in a GX command
    // queue)
    GX_FlushCacheRegions :: proc(buf0a: ^u32, buf0s: u32, buf1a: ^u32, buf1s: u32, buf2a: ^u32, buf2s: u32) -> Result ---

    // Adds raw GPU commands to the current command buffer.
    GPUCMD_AddRawCommands :: proc(cmd: ^u32, size: u32) ---

    // Adds a GPU command to the current command buffer.
    GPUCMD_Add :: proc(header: u32, param: ^u32, paramlength: u32) ---

    // Splits the current GPU command buffer.
    GPUCMD_Split :: proc(addr: ^^u32, size: ^u32) ---
}

foreign import ctru_bridge "system:ctru_bridge"

// Static inline in the C header, or float arguments: called through
// the C wrappers in bridge.c.
@(default_calling_convention = "c")
foreign ctru_bridge {
    // Sets the completion callback for a GX command queue.
    @(link_name = "ctru_gx_cmd_queue_set_callback")
    gxCmdQueueSetCallback :: proc(queue: ^gxCmdQueue_s, callback: proc "c" (arg0: rawptr), user: rawptr) ---

    // Sets the GPU command buffer to use.
    @(link_name = "ctru_gpucmd_set_buffer")
    GPUCMD_SetBuffer :: proc(adr: ^u32, size: u32, offset: u32) ---

    // Sets the offset of the GPU command buffer.
    @(link_name = "ctru_gpucmd_set_buffer_offset")
    GPUCMD_SetBufferOffset :: proc(offset: u32) ---

    // Gets the current GPU command buffer.
    @(link_name = "ctru_gpucmd_get_buffer")
    GPUCMD_GetBuffer :: proc(addr: ^^u32, size: ^u32, offset: ^u32) ---

    // Converts a 32-bit float to a 16-bit float.
    @(link_name = "ctru_f_32tof_16")
    f32tof16 :: proc(f: f32) -> u32 ---

    // Converts a 32-bit float to a 20-bit float.
    @(link_name = "ctru_f_32tof_20")
    f32tof20 :: proc(f: f32) -> u32 ---

    // Converts a 32-bit float to a 24-bit float.
    @(link_name = "ctru_f_32tof_24")
    f32tof24 :: proc(f: f32) -> u32 ---

    // Converts a 32-bit float to a 31-bit float.
    @(link_name = "ctru_f_32tof_31")
    f32tof31 :: proc(f: f32) -> u32 ---

    // Adds a command with a single parameter to the current command buffer.
    @(link_name = "ctru_gpucmd_add_single_param")
    GPUCMD_AddSingleParam :: proc(header: u32, param: u32) ---
}
