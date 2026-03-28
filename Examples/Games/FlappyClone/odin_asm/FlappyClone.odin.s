	.syntax unified
	.eabi_attribute	67, "2.09"
	.eabi_attribute	6, 1
	.eabi_attribute	8, 1
	.eabi_attribute	34, 1
	.eabi_attribute	17, 1
	.eabi_attribute	20, 1
	.eabi_attribute	21, 0
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	28, 1
	.eabi_attribute	38, 1
	.eabi_attribute	14, 0
	.file	"FlappyClone"
	.text
	.p2align	2
	.type	"game_example::init_pipe_pair",%function
	.code	32
"game_example::init_pipe_pair":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	r4, r0
	str	r2, [r0, #80]
	ldr	r0, .LCPI0_0
	mov	r6, r1
	ldr	r3, .LCPI0_2
	mov	r8, r2
	ldr	r2, .LCPI0_1
	ldr	r1, [r0]
	mla	r7, r1, r3, r2
	str	r7, [r0]
	ldr	r0, .LCPI0_3
	umull	r1, r2, r7, r0
	mov	r1, #121
	sub	r0, r7, r2
	add	r0, r2, r0, lsr #1
	lsr	r0, r0, #6
	mul	r2, r0, r1
	sub	r0, r7, r2
	add	r0, r0, #60
	bl	__aeabi_ui2f
	add	r7, r4, #40
	str	r0, [r4, #84]
	mov	r1, r6
	mov	r2, #0
	mov	r0, r7
	mov	r9, #0
	bl	c2d_sprite_from_sheet
	mov	r0, r7
	mov	r1, #1056964608
	mov	r2, #1056964608
	bl	c2d_sprite_set_center
	mov	r5, #35651584
	ldr	r0, [r4, #84]
	orr	r5, r5, #1073741824
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r2, r0
	mov	r0, r7
	mov	r1, r8
	bl	c2d_sprite_set_pos
	mov	r0, r4
	mov	r1, r6
	mov	r2, #0
	bl	c2d_sprite_from_sheet
	mov	r0, r4
	mov	r1, #1056964608
	mov	r2, #1056964608
	bl	c2d_sprite_set_center
	mov	r1, #53739520
	mov	r0, r4
	orr	r1, r1, #1073741824
	bl	c2d_sprite_set_rotation_degrees
	mov	r5, #35651584
	ldr	r0, [r4, #84]
	orr	r5, r5, #-1073741824
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r2, r0
	mov	r0, r4
	mov	r1, r8
	bl	c2d_sprite_set_pos
	strb	r9, [r4, #88]
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	"game_example::_rng"
.LCPI0_1:
	.long	1013904223
.LCPI0_2:
	.long	1664525
.LCPI0_3:
	.long	248469183
.Lfunc_end0:
	.size	"game_example::init_pipe_pair", .Lfunc_end0-"game_example::init_pipe_pair"
	.fnend

	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, sp, #4
	.pad	#1024
	sub	sp, sp, #1024
	bl	romfs_init
	ldr	r0, .LCPI1_29
	ldr	r1, .LCPI1_30
	bl	fopen
	add	r6, sp, #776
	add	r5, sp, #856
	mov	r4, r0
	cmp	r4, #0
	add	r0, r5, #4
	str	r0, [sp, #112]
	beq	.LBB1_2
	ldr	r0, .LCPI1_31
	mov	r1, #4
	mov	r2, #1
	mov	r3, r4
	bl	fread
	mov	r0, r4
	bl	fclose
.LBB1_2:
	add	r0, r6, #40
	str	r0, [sp, #120]
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #4096
	bl	C2D_Init
	bl	C2D_Prepare
	bl	ndspInit
	mov	r0, #1
	bl	ndspSetOutputMode
	mov	r0, #0
	mov	r11, #0
	bl	ndspChnReset
	mov	r0, #0
	bl	ndspChnInitParams
	mov	r0, #0
	mov	r1, #1
	bl	ndspChnSetInterp
	ldr	r1, .LCPI1_32
	mov	r0, #0
	bl	ndsp_chn_set_rate
	mov	r0, #0
	mov	r1, #5
	bl	ndspChnSetFormat
	add	r4, sp, #936
	mov	r1, #0
	add	r0, r4, #8
	mov	r2, #40
	bl	memset
	mov	r0, #1065353216
	mov	r1, r4
	str	r0, [sp, #940]
	str	r0, [sp, #936]
	mov	r0, #0
	bl	ndspChnSetMix
	mov	r0, #0
	mov	r1, #0
	bl	C2D_CreateScreenTarget
	str	r0, [sp, #92]
	mov	r0, #1
	mov	r1, #0
	bl	C2D_CreateScreenTarget
	str	r0, [sp, #88]
	ldr	r0, .LCPI1_33
	bl	C2D_SpriteSheetLoad
	mov	r1, #40894464
	str	r11, [sp, #864]
	orr	r1, r1, #1073741824
	str	r1, [sp, #856]
	mov	r1, #49283072
	str	r11, [sp, #888]
	orr	r1, r1, #1073741824
	str	r1, [sp, #860]
	mov	r1, #1073741824
	str	r0, [sp, #876]
	str	r1, [sp, #868]
	mov	r1, #6
	str	r1, [sp, #884]
	add	r8, r5, #36
	ldr	r1, .LCPI1_34
	str	r11, [sp, #872]
	mov	r2, r8
	add	r12, r1, #36
	ldm	r12!, {r3, r4, r5, r6, r7}
	stm	r2!, {r3, r4, r5, r6, r7}
	ldm	r12, {r1, r3, r4, r5, r6, r7}
	stm	r2, {r1, r3, r4, r5, r6, r7}
	bl	c2d_sprite_sheet_count
	ldr	r1, [sp, #876]
	mov	r2, #0
	str	r0, [sp, #880]
	mov	r0, r8
	bl	c2d_sprite_from_sheet
	mov	r0, r8
	mov	r1, #1056964608
	mov	r2, #1056964608
	bl	c2d_sprite_set_center
	ldr	r0, [sp, #112]
	ldr	r1, [sp, #856]
	str	r8, [sp, #96]
	ldr	r2, [r0]
	mov	r0, r8
	bl	c2d_sprite_set_pos
	ldr	r0, .LCPI1_35
	ldr	r1, .LCPI1_30
	bl	fopen
	cmp	r0, #0
	beq	.LBB1_9
	add	r4, sp, #984
	mov	r9, r0
	mov	r1, #0
	mov	r2, #44
	mov	r0, r4
	mov	r5, #0
	bl	memset
	mov	r0, r4
	mov	r1, #44
	mov	r2, #1
	mov	r3, r9
	bl	fread
	cmp	r0, #1
	mov	r4, #0
	bne	.LBB1_8
	ldrb	r0, [sp, #984]
	mov	r5, #0
	cmp	r0, #82
	ldrbeq	r0, [sp, #985]
	cmpeq	r0, #73
	bne	.LBB1_8
	ldrb	r0, [sp, #986]
	cmp	r0, #70
	ldrbeq	r0, [sp, #987]
	cmpeq	r0, #70
	bne	.LBB1_8
	ldrb	r0, [sp, #992]
	cmp	r0, #87
	ldrbeq	r0, [sp, #993]
	cmpeq	r0, #65
	bne	.LBB1_8
	ldrb	r0, [sp, #994]
	cmp	r0, #86
	ldrbeq	r0, [sp, #995]
	cmpeq	r0, #69
	beq	.LBB1_97
.LBB1_8:
	mov	r0, r9
	bl	fclose
	b	.LBB1_10
.LBB1_9:
	mov	r5, #0
	mov	r4, #0
.LBB1_10:
	ldr	r0, .LCPI1_36
	str	r11, [sp, #840]
	str	r4, [sp, #836]
	str	r5, [sp, #832]
	str	r5, [sp, #828]
	str	r11, [sp, #844]
	str	r11, [sp, #848]
	str	r11, [sp, #852]
	bl	C2D_SpriteSheetLoad
	add	r5, sp, #776
	mov	r4, r0
	mov	r1, #0
	mov	r2, #44
	mov	r0, r5
	bl	memset
	ldr	r8, [sp, #120]
	mov	r0, #58720256
	orr	r0, r0, #1073741824
	mov	r2, #0
	str	r0, [r8, #8]!
	ldr	r0, .LCPI1_37
	mov	r1, r8
	str	r0, [r1, #-4]!
	mov	r0, r5
	str	r1, [sp, #100]
	mov	r1, r4
	bl	c2d_sprite_from_sheet
	mov	r0, r5
	mov	r1, #0
	mov	r2, #1056964608
	bl	c2d_sprite_set_center
	ldr	r0, .LCPI1_38
	bl	C2D_SpriteSheetLoad
	add	r4, sp, #500
	mov	r5, r0
	mov	r1, #0
	mov	r2, #276
	mov	r0, r4
	bl	memset
	mov	r2, #63438848
	mov	r0, r4
	orr	r2, r2, #1073741824
	mov	r1, r5
	bl	"game_example::init_pipe_pair"
	mov	r2, #786432
	add	r0, r4, #92
	orr	r2, r2, #1140850688
	mov	r1, r5
	str	r0, [sp, #108]
	bl	"game_example::init_pipe_pair"
	mov	r2, #3407872
	add	r0, r4, #184
	orr	r2, r2, #1140850688
	mov	r1, r5
	str	r0, [sp, #104]
	str	r5, [sp, #64]
	bl	"game_example::init_pipe_pair"
	mov	r0, #10
	bl	C2D_TextBufNew
	add	r4, sp, #472
	ldr	r2, .LCPI1_39
	mov	r1, r0
	str	r11, [sp, #472]
	mov	r0, r4
	str	r11, [sp, #476]
	str	r11, [sp, #480]
	str	r11, [sp, #484]
	str	r11, [sp, #488]
	str	r11, [sp, #492]
	str	r11, [sp, #496]
	bl	C2D_TextParse
	mov	r0, r4
	bl	C2D_TextOptimize
	mov	r0, #32
	bl	C2D_TextBufNew
	mov	r6, r0
	str	r11, [sp, #444]
	str	r11, [sp, #448]
	str	r11, [sp, #452]
	str	r11, [sp, #456]
	str	r11, [sp, #460]
	str	r11, [sp, #464]
	str	r11, [sp, #468]
	str	r11, [sp, #412]
	str	r11, [sp, #416]
	str	r11, [sp, #420]
	str	r11, [sp, #424]
	str	r11, [sp, #428]
	str	r11, [sp, #432]
	str	r11, [sp, #436]
	str	r11, [sp, #440]
	bl	C2D_TextBufClear
	ldr	r0, .LCPI1_40
	add	r5, sp, #412
	ldr	r4, .LCPI1_41
	mov	r1, #32
	ldr	r3, [r0]
	mov	r0, r5
	mov	r2, r4
	bl	snprintf
	add	r0, sp, #444
	mov	r1, r6
	mov	r2, r5
	str	r6, [sp, #84]
	bl	C2D_TextParse
	mov	r0, #8
	bl	C2D_TextBufNew
	add	r5, sp, #384
	ldr	r2, .LCPI1_42
	mov	r1, r0
	str	r11, [sp, #384]
	mov	r0, r5
	str	r11, [sp, #388]
	str	r11, [sp, #392]
	str	r11, [sp, #396]
	str	r11, [sp, #400]
	str	r11, [sp, #404]
	str	r11, [sp, #408]
	bl	C2D_TextParse
	mov	r0, r5
	bl	C2D_TextOptimize
	mov	r0, #32
	bl	C2D_TextBufNew
	mov	r6, r0
	mov	r0, #16
	str	r11, [sp, #356]
	str	r11, [sp, #360]
	str	r11, [sp, #364]
	str	r11, [sp, #368]
	str	r11, [sp, #372]
	str	r11, [sp, #376]
	str	r11, [sp, #380]
	str	r11, [sp, #324]
	str	r11, [sp, #328]
	str	r11, [sp, #332]
	str	r11, [sp, #336]
	str	r11, [sp, #340]
	str	r11, [sp, #344]
	str	r11, [sp, #348]
	str	r11, [sp, #352]
	bl	C2D_TextBufNew
	add	r5, sp, #296
	ldr	r2, .LCPI1_43
	mov	r1, r0
	str	r11, [sp, #296]
	mov	r0, r5
	str	r11, [sp, #300]
	str	r11, [sp, #304]
	str	r11, [sp, #308]
	str	r11, [sp, #312]
	str	r11, [sp, #316]
	str	r11, [sp, #320]
	bl	C2D_TextParse
	mov	r0, r5
	bl	C2D_TextOptimize
	mov	r0, r6
	bl	C2D_TextBufClear
	ldr	r0, .LCPI1_31
	add	r5, sp, #324
	mov	r1, #32
	mov	r2, r4
	ldr	r3, [r0]
	mov	r0, r5
	bl	snprintf
	add	r0, sp, #356
	mov	r1, r6
	mov	r2, r5
	str	r6, [sp, #28]
	bl	C2D_TextParse
	mov	r0, #16
	bl	C2D_TextBufNew
	mov	r4, r0
	mov	r0, #8
	bl	C2D_TextBufNew
	add	r9, sp, #268
	ldr	r2, .LCPI1_44
	mov	r5, r0
	mov	r1, r4
	mov	r0, r9
	str	r11, [sp, #268]
	str	r11, [sp, #272]
	str	r11, [sp, #276]
	str	r11, [sp, #280]
	str	r11, [sp, #284]
	str	r11, [sp, #288]
	str	r11, [sp, #292]
	str	r11, [sp, #240]
	str	r11, [sp, #244]
	str	r11, [sp, #248]
	str	r11, [sp, #252]
	str	r11, [sp, #256]
	str	r11, [sp, #260]
	str	r11, [sp, #264]
	bl	C2D_TextParse
	add	r4, sp, #240
	ldr	r2, .LCPI1_45
	mov	r1, r5
	mov	r0, r4
	bl	C2D_TextParse
	mov	r0, r9
	bl	C2D_TextOptimize
	mov	r0, r4
	bl	C2D_TextOptimize
	mov	r0, #16
	bl	C2D_TextBufNew
	mov	r4, r0
	mov	r0, #16
	bl	C2D_TextBufNew
	mov	r5, r0
	mov	r0, #8
	bl	C2D_TextBufNew
	mov	r9, r0
	mov	r0, #4
	bl	C2D_TextBufNew
	add	r7, sp, #212
	ldr	r2, .LCPI1_46
	mov	r10, r0
	mov	r1, r4
	mov	r0, r7
	str	r11, [sp, #212]
	str	r11, [sp, #216]
	str	r11, [sp, #220]
	str	r11, [sp, #224]
	str	r11, [sp, #228]
	str	r11, [sp, #232]
	str	r11, [sp, #236]
	str	r11, [sp, #184]
	str	r11, [sp, #188]
	str	r11, [sp, #192]
	str	r11, [sp, #196]
	str	r11, [sp, #200]
	str	r11, [sp, #204]
	str	r11, [sp, #208]
	str	r11, [sp, #156]
	str	r11, [sp, #160]
	str	r11, [sp, #164]
	str	r11, [sp, #168]
	str	r11, [sp, #172]
	str	r11, [sp, #176]
	str	r11, [sp, #180]
	str	r11, [sp, #152]
	str	r11, [sp, #148]
	str	r11, [sp, #144]
	str	r11, [sp, #140]
	str	r11, [sp, #136]
	str	r11, [sp, #132]
	str	r11, [sp, #128]
	bl	C2D_TextParse
	add	r4, sp, #184
	ldr	r2, .LCPI1_18
	mov	r1, r5
	mov	r0, r4
	bl	C2D_TextParse
	add	r6, sp, #156
	ldr	r2, .LCPI1_19
	mov	r1, r9
	mov	r0, r6
	bl	C2D_TextParse
	add	r5, sp, #128
	ldr	r2, .LCPI1_20
	mov	r1, r10
	mov	r0, r5
	bl	C2D_TextParse
	mov	r0, r7
	bl	C2D_TextOptimize
	mov	r0, r4
	bl	C2D_TextOptimize
	mov	r0, r6
	bl	C2D_TextOptimize
	mov	r0, r5
	bl	C2D_TextOptimize
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB1_93
	add	r0, sp, #828
	add	r1, sp, #500
	add	r0, r0, #4
	str	r0, [sp, #24]
	add	r0, r1, #88
	str	r0, [sp, #52]
	add	r0, r1, #224
	str	r0, [sp, #80]
	add	r0, r1, #132
	add	r2, r1, #80
	str	r0, [sp, #76]
	add	r0, r1, #40
	str	r0, [sp, #72]
	add	r0, r2, #188
	str	r0, [sp, #36]
	add	r0, r2, #184
	str	r0, [sp, #32]
	add	r0, r2, #96
	str	r0, [sp, #44]
	add	r0, r2, #92
	str	r0, [sp, #40]
	add	r0, r2, #4
	str	r0, [sp, #56]
	add	r9, sp, #776
	ldr	r0, [sp, #112]
	mov	r10, #0
	str	r2, [sp, #60]
	add	r0, r0, #4
	str	r0, [sp, #48]
	mov	r0, #0
	str	r8, [sp, #68]
	str	r0, [sp, #124]
	str	r0, [sp, #116]
	b	.LBB1_16
.LBB1_12:
	ldr	r4, [sp, #88]
	mov	r1, #-16777216
	mov	r0, r4
	bl	C2D_TargetClear
	mov	r0, r4
	bl	c2d_scene_begin
	mov	r2, #52428800
	orr	r2, r2, #1073741824
.LBB1_13:
	ldr	r0, .LCPI1_27
	mov	r3, #40894464
	str	r0, [sp, #4]
	orr	r3, r3, #1073741824
	str	r0, [sp, #8]
	add	r0, sp, #268
	mvn	r4, #0
	mov	r1, #10
	str	r10, [sp]
	str	r4, [sp, #12]
	bl	c2d_draw_text_color
	str	r4, [sp, #12]
	mov	r4, #47972352
	mov	r2, #42729472
	orr	r4, r4, #1073741824
	add	r0, sp, #384
	orr	r2, r2, #1073741824
	ldr	r5, .LCPI1_28
	mov	r1, #2
	mov	r3, r4
	str	r10, [sp]
	str	r5, [sp, #4]
	str	r5, [sp, #8]
	bl	c2d_draw_text_color
	mov	r2, #1441792
	add	r0, sp, #356
	orr	r2, r2, #1124073472
	str	r5, [sp, #4]
	str	r5, [sp, #8]
	mvn	r5, #255
	mov	r1, #2
	mov	r3, r4
	str	r10, [sp]
	str	r5, [sp, #12]
	bl	c2d_draw_text_color
	mov	r11, #4063232
	mov	r7, #1769472
	str	r5, [sp, #12]
	orr	r11, r11, #1124073472
	ldr	r8, [sp, #116]
	mov	r2, #45088768
	ldr	r5, .LCPI1_21
	orr	r7, r7, #1124073472
	cmp	r8, #0
	mov	r3, r11
	add	r0, sp, #128
	orr	r2, r2, #1073741824
	mov	r6, #1065353216
	mov	r4, r5
	moveq	r3, r7
	mov	r1, #2
	str	r10, [sp]
	mvneq	r4, #0
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	bl	c2d_draw_text_color
	str	r4, [sp, #12]
	mov	r4, #47710208
	orr	r4, r4, #1073741824
	add	r0, sp, #240
	mov	r1, #2
	mov	r3, r7
	mov	r2, r4
	str	r10, [sp]
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	bl	c2d_draw_text_color
	cmp	r8, #1
	mov	r0, r5
	mvneq	r0, #0
	mov	r1, #2
	str	r0, [sp, #12]
	add	r0, sp, #156
	mov	r2, r4
	mov	r3, r11
	ldr	r8, [sp, #68]
	str	r10, [sp]
	str	r6, [sp, #4]
	str	r6, [sp, #8]
.LBB1_14:
	bl	c2d_draw_text_color
.LBB1_15:
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB1_93
.LBB1_16:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB1_93
	mov	r4, r0
	ldr	r0, [sp, #100]
	ldr	r6, [sp, #120]
	ldr	r0, [r0]
	ldr	r1, [r6]
	bl	__aeabi_fadd
	str	r0, [r6]
	mov	r5, r0
	ldr	r6, [r8]
	mov	r1, r6
	bl	__aeabi_fcmpge
	cmp	r0, #0
	beq	.LBB1_19
	mov	r0, r5
	mov	r1, r6
	bl	__aeabi_fsub
	ldr	r1, [sp, #120]
	str	r0, [r1]
.LBB1_19:
	ldr	r0, [sp, #124]
	cmp	r0, #2
	beq	.LBB1_35
	cmp	r0, #1
	bne	.LBB1_37
	ldr	r5, [sp, #48]
	ldr	r1, .LCPI1_23
	ldr	r0, [r5]
	bl	__aeabi_fadd
	ldr	r1, .LCPI1_24
	tst	r4, #1
	movne	r0, r1
	str	r0, [r5]
	ldr	r5, [sp, #112]
	ldr	r1, [r5]
	bl	__aeabi_fadd
	mov	r6, #57671680
	mov	r4, r0
	orr	r6, r6, #1073741824
	mov	r1, r6
	bl	__aeabi_fcmpgt
	cmp	r0, #0
	mov	r1, #0
	movne	r4, r6
	mov	r0, r4
	bl	__aeabi_fcmplt
	ldr	r1, [sp, #888]
	cmp	r0, #0
	ldr	r0, [sp, #884]
	movne	r4, #0
	add	r1, r1, #1
	str	r4, [r5]
	cmp	r1, r0
	str	r1, [sp, #888]
	blo	.LBB1_23
	add	r3, sp, #872
	str	r10, [sp, #888]
	ldm	r3, {r0, r1, r3}
	add	r2, r0, #1
	ldr	r0, [sp, #96]
	cmp	r2, r3
	movhs	r2, r10
	str	r2, [sp, #872]
	bl	c2d_sprite_from_sheet
	ldr	r0, [sp, #112]
	ldr	r4, [r0]
.LBB1_23:
	ldr	r0, [sp, #856]
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r5, r0
	mov	r0, r4
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r0, [sp, #96]
	mov	r1, r5
	bl	c2d_sprite_set_pos
	ldr	r5, [sp, #60]
	mov	r1, #1069547520
	orr	r1, r1, #-2147483648
	ldr	r0, [r5]
	bl	__aeabi_fadd
	str	r0, [r5]
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	ldr	r6, [sp, #56]
	mov	r7, #35651584
	mov	r4, r0
	orr	r7, r7, #1073741824
	ldr	r0, [r6]
	mov	r1, r7
	bl	__aeabi_fadd
	mov	r1, r7
	bl	__aeabi_fadd
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r2, r0
	add	r0, sp, #500
	mov	r1, r4
	bl	c2d_sprite_set_pos
	ldr	r0, [r6]
	mov	r6, #35651584
	orr	r6, r6, #-1073741824
	mov	r1, r6
	bl	__aeabi_fadd
	mov	r1, r6
	bl	__aeabi_fadd
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r0, [sp, #72]
	mov	r1, r4
	bl	c2d_sprite_set_pos
	ldr	r0, [r5]
	mov	r1, #-1040187392
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.LBB1_25
	mov	r2, #64487424
	ldr	r1, [sp, #64]
	add	r0, sp, #500
	orr	r2, r2, #1073741824
	bl	"game_example::init_pipe_pair"
.LBB1_25:
	ldr	r6, [sp, #40]
	mov	r1, #1069547520
	orr	r1, r1, #-2147483648
	ldr	r0, [r6]
	bl	__aeabi_fadd
	str	r0, [r6]
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	ldr	r5, [sp, #44]
	mov	r7, #35651584
	mov	r4, r0
	orr	r7, r7, #1073741824
	ldr	r0, [r5]
	mov	r1, r7
	bl	__aeabi_fadd
	mov	r1, r7
	bl	__aeabi_fadd
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r0, [sp, #108]
	mov	r1, r4
	bl	c2d_sprite_set_pos
	ldr	r0, [r5]
	mov	r5, #35651584
	orr	r5, r5, #-1073741824
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r5
	bl	__aeabi_fadd
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r0, [sp, #76]
	mov	r1, r4
	bl	c2d_sprite_set_pos
	ldr	r0, [r6]
	mov	r1, #-1040187392
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.LBB1_27
	mov	r2, #64487424
	ldr	r0, [sp, #108]
	ldr	r1, [sp, #64]
	orr	r2, r2, #1073741824
	bl	"game_example::init_pipe_pair"
.LBB1_27:
	ldr	r6, [sp, #32]
	mov	r1, #1069547520
	orr	r1, r1, #-2147483648
	mov	r10, #0
	ldr	r0, [r6]
	bl	__aeabi_fadd
	str	r0, [r6]
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	ldr	r5, [sp, #36]
	mov	r7, #35651584
	mov	r4, r0
	orr	r7, r7, #1073741824
	ldr	r0, [r5]
	mov	r1, r7
	bl	__aeabi_fadd
	mov	r1, r7
	bl	__aeabi_fadd
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r0, [sp, #104]
	mov	r1, r4
	bl	c2d_sprite_set_pos
	ldr	r0, [r5]
	mov	r5, #35651584
	orr	r5, r5, #-1073741824
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r5
	bl	__aeabi_fadd
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r2, r0
	ldr	r0, [sp, #80]
	mov	r1, r4
	bl	c2d_sprite_set_pos
	ldr	r0, [r6]
	mov	r1, #-1040187392
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.LBB1_29
	mov	r2, #64487424
	ldr	r0, [sp, #104]
	ldr	r1, [sp, #64]
	orr	r2, r2, #1073741824
	bl	"game_example::init_pipe_pair"
.LBB1_29:
	ldr	r0, .LCPI1_11
	mov	r11, #1
	ldr	r4, [sp, #856]
	mov	r6, #0
	ldr	r5, [r0]
.LBB1_30:
	mov	r1, #92
	ldr	r0, [sp, #52]
	mla	r7, r6, r1, r0
	add	r6, r6, #1
	b	.LBB1_32
.LBB1_31:
	add	r6, r6, #1
	add	r7, r7, #92
	cmp	r6, #4
	beq	.LBB1_42
.LBB1_32:
	ldr	r0, [r7, #-8]
	mov	r1, #1107296256
	bl	__aeabi_fadd
	mov	r1, r4
	bl	__aeabi_fcmple
	cmp	r0, #0
	beq	.LBB1_31
	ldrb	r0, [r7]
	cmp	r0, #0
	bne	.LBB1_31
	mov	r0, #1
	add	r5, r5, #1
	strb	r0, [r7]
	mov	r11, #0
	ldr	r0, .LCPI1_11
	cmp	r6, #3
	str	r5, [r0]
	bne	.LBB1_30
	b	.LBB1_43
.LBB1_35:
	mov	r6, #0
	tst	r4, #64
	ldr	r1, [sp, #116]
	mov	r0, #1
	movne	r1, r6
	tst	r4, #128
	movne	r1, r0
	tst	r4, #1
	bne	.LBB1_65
	mov	r0, #2
	str	r1, [sp, #116]
	str	r0, [sp, #124]
	b	.LBB1_77
.LBB1_37:
	mov	r1, #0
	tst	r4, #64
	ldr	r0, [sp, #116]
	mov	r6, #1
	movne	r0, r1
	tst	r4, #128
	movne	r0, r6
	tst	r4, #1
	bne	.LBB1_73
	str	r1, [sp, #124]
	str	r0, [sp, #116]
	b	.LBB1_77
	.p2align	2
.LCPI1_29:
	.long	.Lcsbs$FlappyClone$e
	.p2align	2
.LCPI1_30:
	.long	.Lcsbs$FlappyClone$f
	.p2align	2
.LCPI1_31:
	.long	"game_example::high_score"
	.p2align	2
.LBB1_42:
	tst	r11, #1
	bne	.LBB1_45
.LBB1_43:
	ldrb	r0, [sp, #849]
	sub	r0, r0, #1
	cmp	r0, #2
	blo	.LBB1_45
	ldr	r1, [sp, #24]
	mov	r0, #0
	strb	r10, [sp, #849]
	bl	ndspChnWaveBufAdd
.LBB1_45:
	ldr	r0, [sp, #112]
	mov	r1, #57671680
	orr	r1, r1, #1073741824
	ldr	r10, [r0]
	mov	r0, r10
	bl	__aeabi_fcmpge
	cmp	r0, #0
	bne	.LBB1_59
	mov	r0, r10
	mov	r1, #0
	bl	__aeabi_fcmple
	cmp	r0, #0
	bne	.LBB1_59
	ldr	r0, [sp, #60]
	ldr	r11, [sp, #856]
	ldr	r1, [r0]
	mov	r0, r11
	bl	__aeabi_fsub
	bic	r6, r0, #-2147483648
	mov	r1, #26214400
	orr	r1, r1, #1073741824
	mov	r0, r6
	bl	__aeabi_fcmplt
	mov	r4, r0
	ldr	r0, [sp, #56]
	mov	r7, #35651584
	orr	r7, r7, #1073741824
	ldr	r5, [r0]
	mov	r1, r7
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r1, r7
	bl	__aeabi_fadd
	mov	r1, r0
	mov	r0, r10
	bl	__aeabi_fsub
	cmp	r4, #0
	beq	.LBB1_49
	mov	r1, #38273024
	bic	r0, r0, #-2147483648
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	cmp	r0, #0
	bne	.LBB1_59
.LBB1_49:
	mov	r1, #26214400
	mov	r0, r6
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	mov	r4, r0
	mov	r0, r5
	mov	r5, #35651584
	orr	r5, r5, #-1073741824
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r0
	mov	r0, r10
	bl	__aeabi_fsub
	cmp	r4, #0
	beq	.LBB1_51
	mov	r1, #38273024
	bic	r0, r0, #-2147483648
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	cmp	r0, #0
	bne	.LBB1_59
.LBB1_51:
	ldr	r0, [sp, #40]
	ldr	r1, [r0]
	mov	r0, r11
	bl	__aeabi_fsub
	bic	r6, r0, #-2147483648
	mov	r1, #26214400
	orr	r1, r1, #1073741824
	mov	r0, r6
	bl	__aeabi_fcmplt
	mov	r4, r0
	ldr	r0, [sp, #44]
	mov	r7, #35651584
	orr	r7, r7, #1073741824
	ldr	r5, [r0]
	mov	r1, r7
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r1, r7
	bl	__aeabi_fadd
	mov	r1, r0
	mov	r0, r10
	bl	__aeabi_fsub
	cmp	r4, #0
	beq	.LBB1_53
	mov	r1, #38273024
	bic	r0, r0, #-2147483648
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	cmp	r0, #0
	bne	.LBB1_59
.LBB1_53:
	mov	r1, #26214400
	mov	r0, r6
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	mov	r4, r0
	mov	r0, r5
	mov	r5, #35651584
	orr	r5, r5, #-1073741824
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r0
	mov	r0, r10
	bl	__aeabi_fsub
	cmp	r4, #0
	beq	.LBB1_55
	mov	r1, #38273024
	bic	r0, r0, #-2147483648
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	cmp	r0, #0
	bne	.LBB1_59
.LBB1_55:
	ldr	r0, [sp, #32]
	ldr	r1, [r0]
	mov	r0, r11
	bl	__aeabi_fsub
	bic	r6, r0, #-2147483648
	mov	r1, #26214400
	orr	r1, r1, #1073741824
	mov	r0, r6
	bl	__aeabi_fcmplt
	mov	r4, r0
	ldr	r0, [sp, #36]
	mov	r7, #35651584
	orr	r7, r7, #1073741824
	ldr	r5, [r0]
	mov	r1, r7
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r1, r7
	bl	__aeabi_fadd
	mov	r1, r0
	mov	r0, r10
	bl	__aeabi_fsub
	cmp	r4, #0
	beq	.LBB1_57
	mov	r1, #38273024
	bic	r0, r0, #-2147483648
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	cmp	r0, #0
	bne	.LBB1_59
.LBB1_57:
	mov	r1, #26214400
	mov	r0, r6
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	mov	r4, r0
	mov	r0, r5
	mov	r5, #35651584
	orr	r5, r5, #-1073741824
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r5
	bl	__aeabi_fadd
	mov	r1, r0
	mov	r0, r10
	bl	__aeabi_fsub
	mov	r1, #1
	mov	r6, #0
	cmp	r4, #0
	str	r1, [sp, #124]
	beq	.LBB1_77
	mov	r1, #38273024
	bic	r0, r0, #-2147483648
	orr	r1, r1, #1073741824
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.LBB1_77
.LBB1_59:
	ldr	r0, .LCPI1_11
	ldr	r5, .LCPI1_2
	ldr	r2, .LCPI1_22
	ldr	r0, [r0]
	ldr	r1, [r5]
	cmp	r0, r1
	mov	r1, #0
	movhi	r1, #1
	strb	r1, [r2]
	mov	r1, #2
	str	r1, [sp, #124]
	bls	.LBB1_75
	mov	r1, #237
	str	r0, [r5]
	ldr	r0, .LCPI1_25
	orr	r1, r1, #256
	bl	mkdir
	ldr	r0, .LCPI1_0
	ldr	r1, .LCPI1_26
	bl	fopen
	cmp	r0, #0
	beq	.LBB1_62
	mov	r4, r0
	mov	r0, r5
	mov	r1, #4
	mov	r2, #1
	mov	r3, r4
	bl	fwrite
	mov	r0, r4
	bl	fclose
.LBB1_62:
	ldr	r4, [sp, #28]
	mov	r0, r4
	bl	C2D_TextBufClear
	ldr	r3, [r5]
	add	r5, sp, #324
	ldr	r2, .LCPI1_12
	mov	r1, #32
	mov	r0, r5
	bl	snprintf
	add	r0, sp, #356
	mov	r1, r4
	mov	r2, r5
	bl	C2D_TextParse
	b	.LBB1_75
	.p2align	2
.LCPI1_32:
	.long	1194083328
	.p2align	2
.LCPI1_33:
	.long	.Lcsbs$FlappyClone$15
	.p2align	2
.LBB1_65:
	cmp	r1, #0
	bne	.LBB1_93
	ldr	r0, [sp, #112]
	mov	r1, #49283072
	orr	r1, r1, #1073741824
	mov	r5, #0
	ldr	r4, [sp, #64]
	mov	r2, #63438848
	str	r1, [r0]
	orr	r2, r2, #1073741824
	ldr	r0, .LCPI1_11
	mov	r1, r4
	str	r5, [r0]
	ldr	r0, [sp, #48]
	str	r5, [r0]
	add	r0, sp, #500
	bl	"game_example::init_pipe_pair"
	mov	r2, #786432
	ldr	r0, [sp, #108]
	orr	r2, r2, #1140850688
	mov	r1, r4
	bl	"game_example::init_pipe_pair"
	mov	r2, #3407872
	ldr	r0, [sp, #104]
	orr	r2, r2, #1140850688
	mov	r1, r4
	bl	"game_example::init_pipe_pair"
	ldr	r0, .LCPI1_22
	mov	r1, #0
	str	r1, [sp, #116]
	strb	r5, [r0]
	mov	r0, #1
	str	r0, [sp, #124]
	b	.LBB1_76
	.p2align	2
.LCPI1_34:
	.long	.Lggv$odin_main$1
	.p2align	2
.LCPI1_35:
	.long	.Lcsbs$FlappyClone$16
	.p2align	2
.LCPI1_36:
	.long	.Lcsbs$FlappyClone$17
	.p2align	2
.LCPI1_37:
	.long	1053609165
	.p2align	2
.LCPI1_38:
	.long	.Lcsbs$FlappyClone$18
	.p2align	2
.LCPI1_39:
	.long	.Lcsbs$FlappyClone$19
	.p2align	2
.LBB1_73:
	cmp	r0, #0
	bne	.LBB1_93
	mov	r0, #1
	str	r0, [sp, #124]
.LBB1_75:
	mov	r0, #0
	str	r0, [sp, #116]
.LBB1_76:
	mov	r6, #0
.LBB1_77:
	ldr	r4, [sp, #84]
	mov	r0, r4
	bl	C2D_TextBufClear
	ldr	r0, .LCPI1_11
	add	r5, sp, #412
	ldr	r2, .LCPI1_12
	mov	r1, #32
	ldr	r3, [r0]
	mov	r0, r5
	bl	snprintf
	add	r0, sp, #444
	mov	r1, r4
	mov	r2, r5
	bl	C2D_TextParse
	mov	r0, #1
	bl	C3D_FrameBegin
	ldr	r4, [sp, #92]
	mov	r1, #-16777216
	mov	r0, r4
	bl	C2D_TargetClear
	mov	r0, r4
	bl	c2d_scene_begin
	mov	r0, #63438848
	ldr	r1, [r8]
	orr	r0, r0, #1073741824
	bl	__aeabi_fdiv
	bl	__aeabi_f2iz
	add	r11, r0, #2
	ldr	r0, [sp, #120]
	ldr	r0, [r0]
	bl	__aeabi_f2iz
	bl	__aeabi_i2f
	mov	r7, #49283072
	cmp	r11, #1
	orr	r7, r7, #1073741824
	blt	.LBB1_80
	mov	r4, r0
	mov	r5, #0
.LBB1_79:
	mov	r0, r5
	bl	__aeabi_ui2f
	mov	r1, r0
	ldr	r0, [r8]
	bl	__aeabi_fmul
	mov	r1, r4
	bl	__aeabi_fsub
	mov	r1, r0
	mov	r0, r9
	mov	r2, r7
	bl	c2d_sprite_set_pos
	mov	r0, r9
	bl	c2d_draw_sprite
	add	r5, r5, #1
	cmp	r11, r5
	bne	.LBB1_79
.LBB1_80:
	cmp	r6, #0
	mov	r10, #0
	bne	.LBB1_12
	add	r0, sp, #500
	bl	c2d_draw_sprite
	ldr	r0, [sp, #72]
	bl	c2d_draw_sprite
	ldr	r0, [sp, #108]
	bl	c2d_draw_sprite
	ldr	r0, [sp, #76]
	bl	c2d_draw_sprite
	ldr	r0, [sp, #104]
	bl	c2d_draw_sprite
	ldr	r0, [sp, #80]
	bl	c2d_draw_sprite
	ldr	r0, [sp, #96]
	bl	c2d_draw_sprite
	ldr	r4, [sp, #88]
	mov	r1, #-16777216
	mov	r0, r4
	bl	C2D_TargetClear
	mov	r0, r4
	bl	c2d_scene_begin
	mov	r2, #52428800
	ldr	r0, [sp, #124]
	orr	r2, r2, #1073741824
	cmp	r0, #0
	beq	.LBB1_13
	ldr	r0, [sp, #124]
	cmp	r0, #1
	bne	.LBB1_89
	mov	r7, #18874368
	mov	r5, #47972352
	orr	r7, r7, #1073741824
	orr	r5, r5, #1073741824
	add	r0, sp, #472
	mov	r4, #1065353216
	mvn	r11, #0
	mov	r1, #2
	mov	r2, r7
	mov	r3, r5
	str	r10, [sp]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	str	r11, [sp, #12]
	bl	c2d_draw_text_color
	mov	r6, #45350912
	mvn	r0, #255
	orr	r6, r6, #1073741824
	str	r0, [sp, #12]
	add	r0, sp, #444
	mov	r1, #2
	mov	r2, r6
	mov	r3, r5
	str	r10, [sp]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	bl	c2d_draw_text_color
	mov	r5, #458752
	add	r0, sp, #384
	orr	r5, r5, #1124073472
	mov	r1, #2
	mov	r2, r7
	str	r10, [sp]
	mov	r3, r5
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	str	r11, [sp, #12]
	bl	c2d_draw_text_color
	mvn	r0, #255
	mov	r1, #2
	str	r0, [sp, #12]
	add	r0, sp, #356
	mov	r2, r6
	mov	r3, r5
	str	r10, [sp]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	b	.LBB1_14
	.p2align	2
.LCPI1_40:
	.long	"game_example::score"
	.p2align	2
.LCPI1_41:
	.long	.Lcsbs$FlappyClone$1a
	.p2align	2
.LCPI1_42:
	.long	.Lcsbs$FlappyClone$1b
	.p2align	2
.LCPI1_43:
	.long	.Lcsbs$FlappyClone$1c
	.p2align	2
.LCPI1_44:
	.long	.Lcsbs$FlappyClone$1d
	.p2align	2
.LBB1_89:
	ldr	r0, .LCPI1_27
	mov	r3, #32505856
	str	r0, [sp, #4]
	orr	r3, r3, #1073741824
	str	r0, [sp, #8]
	add	r0, sp, #212
	mvn	r4, #0
	mov	r1, #10
	str	r10, [sp]
	str	r4, [sp, #12]
	bl	c2d_draw_text_color
	mov	r5, #42729472
	add	r0, sp, #472
	orr	r5, r5, #1073741824
	ldr	r6, .LCPI1_28
	mov	r1, #2
	str	r10, [sp]
	mov	r2, r5
	mov	r3, r5
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	str	r4, [sp, #12]
	bl	c2d_draw_text_color
	mov	r11, #1441792
	mvn	r0, #255
	orr	r11, r11, #1124073472
	str	r0, [sp, #12]
	add	r0, sp, #444
	mov	r1, #2
	mov	r2, r11
	mov	r3, r5
	str	r10, [sp]
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	bl	c2d_draw_text_color
	str	r4, [sp, #12]
	mov	r4, r6
	str	r6, [sp, #4]
	add	r0, sp, #384
	str	r6, [sp, #8]
	mov	r6, #45613056
	orr	r6, r6, #1073741824
	mov	r2, r5
	mov	r1, #2
	str	r10, [sp]
	mov	r3, r6
	mvn	r5, #255
	bl	c2d_draw_text_color
	add	r0, sp, #356
	mov	r1, #2
	mov	r2, r11
	mov	r3, r6
	str	r10, [sp]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	str	r5, [sp, #12]
	bl	c2d_draw_text_color
	ldr	r0, .LCPI1_22
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.LBB1_91
	mov	r2, #52428800
	mov	r3, #49020928
	add	r0, sp, #296
	orr	r2, r2, #1073741824
	orr	r3, r3, #1073741824
	mov	r1, #10
	str	r10, [sp]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	str	r5, [sp, #12]
	bl	c2d_draw_text_color
.LBB1_91:
	mov	r11, #4063232
	mov	r7, #1769472
	str	r5, [sp, #12]
	orr	r11, r11, #1124073472
	ldr	r6, [sp, #116]
	mov	r2, #45088768
	ldr	r5, .LCPI1_21
	orr	r7, r7, #1124073472
	cmp	r6, #0
	mov	r3, r11
	add	r0, sp, #128
	orr	r2, r2, #1073741824
	mov	r8, #1065353216
	mov	r4, r5
	moveq	r3, r7
	mov	r1, #2
	str	r10, [sp]
	mvneq	r4, #0
	str	r8, [sp, #4]
	str	r8, [sp, #8]
	bl	c2d_draw_text_color
	str	r4, [sp, #12]
	mov	r4, #47710208
	orr	r4, r4, #1073741824
	add	r0, sp, #184
	mov	r1, #2
	mov	r3, r7
	mov	r2, r4
	str	r10, [sp]
	str	r8, [sp, #4]
	str	r8, [sp, #8]
	bl	c2d_draw_text_color
	cmp	r6, #1
	mov	r0, r5
	mvneq	r0, #0
	mov	r1, #2
	str	r0, [sp, #12]
	add	r0, sp, #156
	mov	r2, r4
	mov	r3, r11
	str	r10, [sp]
	str	r8, [sp, #4]
	str	r8, [sp, #8]
	bl	c2d_draw_text_color
	ldr	r8, [sp, #68]
	b	.LBB1_15
	.p2align	2
.LCPI1_45:
	.long	.Lcsbs$FlappyClone$1e
	.p2align	2
.LBB1_93:
	ldr	r0, [sp, #828]
	cmp	r0, #0
	beq	.LBB1_95
	bl	linearFree
.LBB1_95:
	bl	ndspExit
	bl	C2D_Fini
	bl	C3D_Fini
	bl	romfs_exit
	bl	gfxExit
	mov	r0, #0
	add	sp, sp, #4
	add	sp, sp, #1024
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI1_46:
	.long	.Lcsbs$FlappyClone$1f
	.p2align	2
.LBB1_97:
	ldr	r8, [sp, #1024]
	mov	r0, r8
	bl	linearAlloc
	cmp	r0, #0
	beq	.LBB1_101
	mov	r1, r8
	mov	r2, #1
	mov	r3, r9
	mov	r5, r0
	bl	fread
	cmp	r0, #1
	bne	.LBB1_100
	lsr	r4, r8, #1
	b	.LBB1_8
.LBB1_100:
	mov	r0, r5
	bl	linearFree
.LBB1_101:
	mov	r5, #0
	mov	r4, #0
	b	.LBB1_8
	.p2align	2
.LCPI1_0:
	.long	.Lcsbs$FlappyClone$e
.LCPI1_2:
	.long	"game_example::high_score"
.LCPI1_11:
	.long	"game_example::score"
.LCPI1_12:
	.long	.Lcsbs$FlappyClone$1a
.LCPI1_18:
	.long	.Lcsbs$FlappyClone$20
.LCPI1_19:
	.long	.Lcsbs$FlappyClone$21
.LCPI1_20:
	.long	.Lcsbs$FlappyClone$22
.LCPI1_21:
	.long	4287137928
.LCPI1_22:
	.long	"game_example::new_record"
.LCPI1_23:
	.long	1028443341
.LCPI1_24:
	.long	3220806042
.LCPI1_25:
	.long	.Lcsbs$FlappyClone$12
.LCPI1_26:
	.long	.Lcsbs$FlappyClone$13
.LCPI1_27:
	.long	1067030938
.LCPI1_28:
	.long	1063675494
.Lfunc_end1:
	.size	odin_main, .Lfunc_end1-odin_main
	.fnend

	.globl	__truncsfhf2
	.p2align	2
	.type	__truncsfhf2,%function
	.code	32
__truncsfhf2:
	.fnstart
	mov	r1, r0
	ldr	r0, .LCPI2_0
	mov	r3, #255
	and	r2, r1, r0
	mov	r0, #32768
	and	r3, r3, r1, lsr #23
	and	r0, r0, r1, lsr #16
	subs	r12, r3, #112
	bhi	.LBB2_3
	cmp	r3, #102
	movlo	pc, lr
.LBB2_2:
	rsb	r1, r3, #113
	orr	r2, r2, #8388608
	mov	r3, #4096
	and	r3, r3, r2, lsr r1
	lsl	r3, r3, #1
	add	r1, r3, r2, lsr r1
	orr	r0, r0, r1, lsr #13
	mov	pc, lr
.LBB2_3:
	cmp	r12, #143
	bne	.LBB2_6
	cmp	r2, #0
	orreq	r0, r0, #31744
	moveq	pc, lr
.LBB2_5:
	lsr	r3, r2, #13
	cmp	r2, #8192
	mov	r1, #1
	orrlo	r3, r1, r2, lsr #13
	orr	r0, r3, r0
	orr	r0, r0, #31744
	mov	pc, lr
.LBB2_6:
	tst	r1, #4096
	bne	.LBB2_9
	mov	r1, r2
	cmp	r12, #31
	bhs	.LBB2_10
.LBB2_8:
	lsr	r1, r1, #13
	orr	r1, r1, r12, lsl #10
	orr	r0, r1, r0
	mov	pc, lr
.LBB2_9:
	mov	r1, #1040384
	orr	r1, r1, #7340032
	cmp	r2, r1
	mov	r1, #0
	subhs	r12, r3, #111
	addlo	r1, r2, #8192
	cmp	r12, #31
	blo	.LBB2_8
.LBB2_10:
	.save	{r11, lr}
	push	{r11, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r1, .LCPI2_1
	orr	r0, r0, #31744
	str	r1, [sp]
	mov	r1, #232
	str	r1, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r2, r12, r1, r1
	str	r2, [sp]
	mla	r2, r1, lr, r12
	mla	r3, r1, lr, r2
	str	r3, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	ldr	r1, [sp]
	ldr	lr, [sp, #4]
	umull	r3, r12, r1, r1
	str	r3, [sp]
	mla	r3, r1, lr, r12
	mla	r2, r1, lr, r3
	str	r2, [sp, #4]
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI2_0:
	.long	8388607
.LCPI2_1:
	.long	3567587328
.Lfunc_end2:
	.size	__truncsfhf2, .Lfunc_end2-__truncsfhf2
	.cantunwind
	.fnend

	.globl	__aeabi_d2h
	.p2align	2
	.type	__aeabi_d2h,%function
	.code	32
__aeabi_d2h:
	.fnstart
	.save	{r11, lr}
	push	{r11, lr}
	bl	__aeabi_d2f
	pop	{r11, lr}
	b	__truncsfhf2
.Lfunc_end3:
	.size	__aeabi_d2h, .Lfunc_end3-__aeabi_d2h
	.cantunwind
	.fnend

	.globl	__truncdfhf2
	.p2align	2
	.type	__truncdfhf2,%function
	.code	32
__truncdfhf2:
	.fnstart
	.save	{r11, lr}
	push	{r11, lr}
	bl	__aeabi_d2f
	pop	{r11, lr}
	b	__truncsfhf2
.Lfunc_end4:
	.size	__truncdfhf2, .Lfunc_end4-__truncdfhf2
	.cantunwind
	.fnend

	.globl	__gnu_h2f_ieee
	.p2align	2
	.type	__gnu_h2f_ieee,%function
	.code	32
__gnu_h2f_ieee:
	.fnstart
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r0, #255
	orr	r0, r0, #32512
	mov	r1, #931135488
	and	r0, r4, r0
	orr	r1, r1, #1073741824
	lsl	r0, r0, #13
	bl	__aeabi_fmul
	mov	r1, #125829120
	mov	r5, r0
	orr	r1, r1, #1073741824
	orr	r6, r0, #1065353216
	bl	__aeabi_fcmpge
	cmp	r0, #0
	and	r0, r4, #32768
	orrne	r5, r6, #1073741824
	orr	r0, r5, r0, lsl #16
	pop	{r4, r5, r6, lr}
	mov	pc, lr
.Lfunc_end5:
	.size	__gnu_h2f_ieee, .Lfunc_end5-__gnu_h2f_ieee
	.cantunwind
	.fnend

	.globl	__gnu_f2h_ieee
	.p2align	2
	.type	__gnu_f2h_ieee,%function
	.code	32
__gnu_f2h_ieee:
	.fnstart
	b	__truncsfhf2
.Lfunc_end6:
	.size	__gnu_f2h_ieee, .Lfunc_end6-__gnu_f2h_ieee
	.cantunwind
	.fnend

	.globl	__extendhfsf2
	.p2align	2
	.type	__extendhfsf2,%function
	.code	32
__extendhfsf2:
	.fnstart
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r0, #255
	orr	r0, r0, #32512
	mov	r1, #931135488
	and	r0, r4, r0
	orr	r1, r1, #1073741824
	lsl	r0, r0, #13
	bl	__aeabi_fmul
	mov	r1, #125829120
	mov	r5, r0
	orr	r1, r1, #1073741824
	orr	r6, r0, #1065353216
	bl	__aeabi_fcmpge
	cmp	r0, #0
	and	r0, r4, #32768
	orrne	r5, r6, #1073741824
	orr	r0, r5, r0, lsl #16
	pop	{r4, r5, r6, lr}
	mov	pc, lr
.Lfunc_end7:
	.size	__extendhfsf2, .Lfunc_end7-__extendhfsf2
	.cantunwind
	.fnend

	.type	"game_example::_rng",%object
	.data
	.p2align	2, 0x0
"game_example::_rng":
	.long	12345
	.size	"game_example::_rng", 4

	.type	"game_example::score",%object
	.local	"game_example::score"
	.comm	"game_example::score",4,4
	.type	"game_example::high_score",%object
	.local	"game_example::high_score"
	.comm	"game_example::high_score",4,4
	.type	"game_example::new_record",%object
	.local	"game_example::new_record"
	.comm	"game_example::new_record",1,1
	.type	"runtime::default_random_generator_proc-.state-8904",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-8904"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-8904":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-8904", 1032

	.type	.Lcsbs$FlappyClone$e,%object
	.section	.rodata,"a",%progbits
.Lcsbs$FlappyClone$e:
	.asciz	"sdmc:/3ds/FlappyClone/highscore.dat"
	.size	.Lcsbs$FlappyClone$e, 36

	.type	.Lcsbs$FlappyClone$f,%object
.Lcsbs$FlappyClone$f:
	.asciz	"rb"
	.size	.Lcsbs$FlappyClone$f, 3

	.type	.Lcsbs$FlappyClone$12,%object
.Lcsbs$FlappyClone$12:
	.asciz	"sdmc:/3ds/FlappyClone"
	.size	.Lcsbs$FlappyClone$12, 22

	.type	.Lcsbs$FlappyClone$13,%object
.Lcsbs$FlappyClone$13:
	.asciz	"wb"
	.size	.Lcsbs$FlappyClone$13, 3

	.type	.Lggv$odin_main$1,%object
	.p2align	4, 0x0
.Lggv$odin_main$1:
	.long	0x42700000
	.long	0x42f00000
	.long	0x00000000
	.long	0x40000000
	.zero	20
	.zero	40
	.byte	0
	.zero	3
	.size	.Lggv$odin_main$1, 80

	.type	.Lcsbs$FlappyClone$15,%object
.Lcsbs$FlappyClone$15:
	.asciz	"romfs:/gfx/bird.t3x"
	.size	.Lcsbs$FlappyClone$15, 20

	.type	.Lcsbs$FlappyClone$16,%object
.Lcsbs$FlappyClone$16:
	.asciz	"romfs:/audio/retrocoin4.wav"
	.size	.Lcsbs$FlappyClone$16, 28

	.type	.Lcsbs$FlappyClone$17,%object
.Lcsbs$FlappyClone$17:
	.asciz	"romfs:/gfx/Background4.t3x"
	.size	.Lcsbs$FlappyClone$17, 27

	.type	.Lcsbs$FlappyClone$18,%object
.Lcsbs$FlappyClone$18:
	.asciz	"romfs:/gfx/pipe.t3x"
	.size	.Lcsbs$FlappyClone$18, 20

	.type	.Lcsbs$FlappyClone$19,%object
.Lcsbs$FlappyClone$19:
	.asciz	"Score:"
	.size	.Lcsbs$FlappyClone$19, 7

	.type	.Lcsbs$FlappyClone$1a,%object
.Lcsbs$FlappyClone$1a:
	.asciz	"%u"
	.size	.Lcsbs$FlappyClone$1a, 3

	.type	.Lcsbs$FlappyClone$1b,%object
.Lcsbs$FlappyClone$1b:
	.asciz	"Best:"
	.size	.Lcsbs$FlappyClone$1b, 6

	.type	.Lcsbs$FlappyClone$1c,%object
.Lcsbs$FlappyClone$1c:
	.asciz	"NEW BEST!"
	.size	.Lcsbs$FlappyClone$1c, 10

	.type	.Lcsbs$FlappyClone$1d,%object
.Lcsbs$FlappyClone$1d:
	.asciz	"FLAPPY CLONE"
	.size	.Lcsbs$FlappyClone$1d, 13

	.type	.Lcsbs$FlappyClone$1e,%object
.Lcsbs$FlappyClone$1e:
	.asciz	"Start"
	.size	.Lcsbs$FlappyClone$1e, 6

	.type	.Lcsbs$FlappyClone$1f,%object
.Lcsbs$FlappyClone$1f:
	.asciz	"GAME OVER"
	.size	.Lcsbs$FlappyClone$1f, 10

	.type	.Lcsbs$FlappyClone$20,%object
.Lcsbs$FlappyClone$20:
	.asciz	"Restart"
	.size	.Lcsbs$FlappyClone$20, 8

	.type	.Lcsbs$FlappyClone$21,%object
.Lcsbs$FlappyClone$21:
	.asciz	"Exit"
	.size	.Lcsbs$FlappyClone$21, 5

	.type	.Lcsbs$FlappyClone$22,%object
.Lcsbs$FlappyClone$22:
	.asciz	">"
	.size	.Lcsbs$FlappyClone$22, 2

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
