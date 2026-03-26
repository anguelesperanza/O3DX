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
	.file	"Audio-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#116
	sub	sp, sp, #116
	bl	gfxInitDefault
	mov	r0, #0
	mov	r1, #0
	bl	consoleInit
	bl	romfs_init
	cmp	r0, #0
	beq	.LBB0_2
	ldr	r0, .LCPI0_0
	bl	puts
	ldr	r0, .LCPI0_1
	bl	puts
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	ldr	r0, .LCPI0_2
	mov	r1, #0
	bl	svcSleepThread
	b	.LBB0_15
.LBB0_2:
	bl	ndspInit
	cmp	r0, #0
	beq	.LBB0_4
	mov	r1, r0
	ldr	r0, .LCPI0_3
	bl	printf
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	ldr	r0, .LCPI0_4
	mov	r1, #1
	bl	svcSleepThread
	b	.LBB0_14
.LBB0_4:
	ldr	r0, .LCPI0_5
	ldr	r1, .LCPI0_6
	bl	fopen
	cmp	r0, #0
	beq	.LBB0_13
	mov	r5, r0
	mov	r0, #0
	str	r0, [sp, #108]
	mov	r1, #1
	str	r0, [sp, #112]
	mov	r2, #4
	str	r0, [sp, #104]
	add	r0, sp, #112
	mov	r3, r5
	bl	fread
	cmp	r0, #4
	bne	.LBB0_12
	add	r0, sp, #108
	mov	r1, #4
	mov	r2, #1
	mov	r3, r5
	bl	fread
	cmp	r0, #1
	bne	.LBB0_12
	add	r0, sp, #104
	mov	r1, #1
	mov	r2, #4
	mov	r3, r5
	bl	fread
	cmp	r0, #4
	bne	.LBB0_12
	ldrb	r0, [sp, #112]
	cmp	r0, #82
	ldrbeq	r0, [sp, #113]
	cmpeq	r0, #73
	bne	.LBB0_12
	ldrb	r0, [sp, #114]
	cmp	r0, #70
	ldrbeq	r0, [sp, #115]
	cmpeq	r0, #70
	bne	.LBB0_12
	ldrb	r0, [sp, #104]
	cmp	r0, #87
	ldrbeq	r0, [sp, #105]
	cmpeq	r0, #65
	bne	.LBB0_12
	ldrb	r0, [sp, #106]
	cmp	r0, #86
	ldrbeq	r0, [sp, #107]
	cmpeq	r0, #69
	beq	.LBB0_17
.LBB0_12:
	mov	r0, r5
	bl	fclose
.LBB0_13:
	ldr	r0, .LCPI0_27
	bl	puts
	ldr	r0, .LCPI0_28
	bl	puts
	ldr	r0, .LCPI0_29
	bl	puts
	ldr	r0, .LCPI0_30
	bl	puts
	ldr	r0, .LCPI0_31
	bl	puts
	ldr	r0, .LCPI0_32
	bl	puts
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	ldr	r0, .LCPI0_33
	mov	r1, #1
	bl	svcSleepThread
	bl	ndspExit
.LBB0_14:
	bl	romfs_exit
.LBB0_15:
	bl	gfxExit
	mov	r0, #1
.LBB0_16:
	add	sp, sp, #116
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB0_17:
	add	r0, sp, #100
	mov	r10, #0
	mov	r1, #1
	mov	r2, #4
	mov	r3, r5
	str	r10, [sp, #96]
	str	r10, [sp, #100]
	bl	fread
	cmp	r0, #4
	bne	.LBB0_12
	add	r4, sp, #96
	add	r11, sp, #100
	mov	r8, #0
	mov	r6, #0
	mov	r9, #0
	mov	r7, #0
.LBB0_19:
	mov	r0, r4
	mov	r1, #4
	mov	r2, #1
	mov	r3, r5
	bl	fread
	cmp	r0, #1
	bne	.LBB0_12
	ldrb	r3, [sp, #102]
	ldrb	r2, [sp, #100]
	ldrb	r1, [sp, #101]
	cmp	r3, #116
	ldrb	r0, [sp, #103]
	cmpeq	r2, #102
	bne	.LBB0_22
	cmp	r1, #109
	cmpeq	r0, #32
	beq	.LBB0_28
.LBB0_22:
	cmp	r3, #116
	bne	.LBB0_25
	cmp	r2, #100
	cmpeq	r1, #97
	bne	.LBB0_25
	cmp	r0, #97
	beq	.LBB0_37
.LBB0_25:
	ldr	r0, [sp, #96]
	and	r1, r0, #1
	add	r1, r1, r0
.LBB0_26:
	mov	r0, r5
	mov	r2, #1
	bl	fseek
.LBB0_27:
	mov	r0, r11
	mov	r1, #1
	mov	r2, #4
	mov	r3, r5
	str	r10, [sp, #96]
	str	r10, [sp, #100]
	bl	fread
	cmp	r0, #4
	beq	.LBB0_19
	b	.LBB0_12
.LBB0_28:
	add	r0, sp, #94
	mov	r1, #2
	mov	r2, #1
	mov	r3, r5
	strh	r10, [sp, #92]
	strh	r10, [sp, #94]
	str	r10, [sp, #88]
	str	r10, [sp, #84]
	strh	r10, [sp, #82]
	strh	r10, [sp, #80]
	bl	fread
	cmp	r0, #1
	bne	.LBB0_12
	add	r0, sp, #92
	mov	r1, #2
	mov	r2, #1
	mov	r3, r5
	bl	fread
	cmp	r0, #1
	bne	.LBB0_12
	add	r0, sp, #88
	mov	r1, #4
	mov	r2, #1
	mov	r3, r5
	bl	fread
	cmp	r0, #1
	bne	.LBB0_12
	add	r0, sp, #84
	mov	r1, #4
	mov	r2, #1
	mov	r3, r5
	bl	fread
	cmp	r0, #1
	bne	.LBB0_12
	add	r0, sp, #82
	mov	r1, #2
	mov	r2, #1
	mov	r3, r5
	bl	fread
	cmp	r0, #1
	bne	.LBB0_12
	add	r0, sp, #80
	mov	r1, #2
	mov	r2, #1
	mov	r3, r5
	bl	fread
	cmp	r0, #1
	ldrheq	r0, [sp, #94]
	cmpeq	r0, #1
	bne	.LBB0_12
	ldrh	r7, [sp, #92]
	sub	r0, r7, #1
	cmp	r0, #1
	bhi	.LBB0_12
	ldrh	r6, [sp, #80]
	cmp	r6, #16
	cmpne	r6, #8
	bne	.LBB0_12
	ldr	r0, [sp, #96]
	mov	r8, #1
	ldr	r9, [sp, #88]
	sub	r1, r0, #16
	cmp	r1, #0
	bgt	.LBB0_26
	b	.LBB0_27
.LBB0_37:
	mov	r0, r5
	bl	ftell
	cmp	r8, #0
	beq	.LBB0_12
	ldr	r11, [sp, #96]
	mov	r4, r0
	mov	r0, r11
	bl	linearAlloc
	cmp	r0, #0
	str	r0, [sp, #4]
	beq	.LBB0_12
	mov	r0, r5
	mov	r1, r4
	mov	r2, #0
	bl	fseek
	ldr	r0, [sp, #4]
	mov	r1, #1
	mov	r2, r11
	mov	r3, r5
	bl	fread
	cmp	r0, r11
	bne	.LBB0_55
	mov	r0, r5
	bl	fclose
	lsr	r0, r6, #3
	mul	r5, r0, r7
	cmp	r5, #0
	beq	.LBB0_57
	mov	r0, #1
	mov	r10, #1
	bl	ndspSetOutputMode
	mov	r0, #1065353216
	bl	ndsp_set_master_vol
	mov	r0, #0
	bl	ndspChnReset
	mov	r0, #0
	bl	ndspChnInitParams
	mov	r0, #0
	mov	r1, #1
	bl	ndspChnSetInterp
	mov	r0, r9
	bl	__aeabi_ui2f
	mov	r1, r0
	mov	r0, #0
	bl	ndsp_chn_set_rate
	mov	r0, r11
	mov	r1, r5
	bl	__aeabi_uidiv
	cmp	r7, #1
	mov	r8, r0
	cmpeq	r6, #8
	beq	.LBB0_45
	cmp	r7, #1
	moveq	r10, #5
	cmpeq	r6, #16
	beq	.LBB0_45
	cmp	r7, #2
	moveq	r10, #2
	cmpeq	r6, #8
	beq	.LBB0_45
	eor	r0, r6, #16
	eor	r1, r7, #2
	orrs	r0, r1, r0
	mov	r10, #5
	moveq	r10, #6
.LBB0_45:
	mov	r0, #0
	mov	r1, r10
	mov	r11, #0
	bl	ndspChnSetFormat
	add	r4, sp, #32
	mov	r1, #0
	add	r0, r4, #8
	mov	r2, #40
	bl	memset
	mov	r5, #1065353216
	mov	r0, #0
	mov	r1, r4
	str	r5, [sp, #36]
	str	r5, [sp, #32]
	bl	ndspChnSetMix
	ldr	r0, [sp, #4]
	add	r1, sp, #8
	str	r0, [sp, #8]
	mov	r0, #1
	str	r11, [sp, #24]
	str	r11, [sp, #28]
	strb	r0, [sp, #24]
	mov	r0, #0
	str	r11, [sp, #20]
	str	r11, [sp, #16]
	str	r8, [sp, #12]
	bl	ndspChnWaveBufAdd
	ldr	r0, .LCPI0_7
	bl	printf
	ldr	r0, .LCPI0_8
	bl	printf
	ldr	r0, .LCPI0_9
	bl	printf
	ldr	r0, .LCPI0_10
	mov	r1, r9
	bl	printf
	ldr	r0, .LCPI0_11
	mov	r1, r7
	bl	printf
	ldr	r0, .LCPI0_12
	mov	r1, r6
	bl	printf
	ldr	r0, .LCPI0_13
	mov	r1, r8
	bl	printf
	ldr	r0, .LCPI0_14
	bl	printf
	ldr	r0, .LCPI0_15
	bl	printf
	ldr	r0, .LCPI0_16
	bl	printf
	ldr	r0, .LCPI0_17
	bl	printf
	ldr	r0, .LCPI0_18
	bl	printf
	ldr	r0, .LCPI0_19
	bl	printf
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_56
	mov	r6, #46661632
	ldr	r8, .LCPI0_23
	ldr	r9, .LCPI0_24
	orr	r6, r6, #1073741824
	ldr	r7, .LCPI0_25
	ldr	r4, .LCPI0_26
	b	.LBB0_48
.LBB0_47:
	ldr	r0, .LCPI0_22
	cmp	r11, #0
	mov	r1, r8
	moveq	r1, r0
	mov	r0, r9
	bl	printf
	mov	r0, r5
	mov	r1, r6
	bl	__aeabi_fmul
	mov	r1, #1056964608
	bl	__aeabi_fadd
	bl	__aeabi_f2iz
	mov	r1, r0
	mov	r0, r7
	bl	printf
	mov	r0, #0
	bl	ndspChnGetSamplePos
	mov	r1, r0
	mov	r0, r4
	bl	printf
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	mov	r0, #2
	mov	r1, #1
	bl	gspWaitForEvent
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_56
.LBB0_48:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_56
	mov	r10, r0
	tst	r0, #1
	beq	.LBB0_51
	rsbs	r0, r11, #0
	adc	r1, r11, r0
	mov	r0, #0
	bl	ndspChnSetPaused
	eor	r11, r11, #1
.LBB0_51:
	mov	r0, #64
	orr	r0, r0, #1073741824
	tst	r10, r0
	beq	.LBB0_53
	ldr	r1, .LCPI0_20
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r1, #1065353216
	mov	r5, r0
	bl	__aeabi_fcmpgt
	cmp	r0, #0
	movne	r5, #1065353216
	mov	r0, r5
	bl	ndsp_set_master_vol
.LBB0_53:
	mov	r0, #128
	orr	r0, r0, #-2147483648
	tst	r10, r0
	beq	.LBB0_47
	ldr	r1, .LCPI0_21
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r1, #0
	mov	r5, r0
	bl	__aeabi_fcmplt
	cmp	r0, #0
	movne	r5, #0
	mov	r0, r5
	bl	ndsp_set_master_vol
	b	.LBB0_47
.LBB0_55:
	ldr	r0, [sp, #4]
	bl	linearFree
	b	.LBB0_12
.LBB0_56:
	mov	r0, #0
	bl	ndspChnWaveBufClear
	ldr	r0, [sp, #4]
	bl	linearFree
	bl	ndspExit
	bl	romfs_exit
	bl	gfxExit
	mov	r0, #0
	b	.LBB0_16
.LBB0_57:
	.inst	0xe7ffdefe
	.p2align	2
.LCPI0_0:
	.long	.Lstr.6
.LCPI0_1:
	.long	.Lstr.7
.LCPI0_2:
	.long	4000000000
.LCPI0_3:
	.long	".Lcsbs$Audio-Example$13"
.LCPI0_4:
	.long	705032704
.LCPI0_5:
	.long	".Lcsbs$Audio-Example$14"
.LCPI0_6:
	.long	".Lcsbs$Audio-Example$9"
.LCPI0_7:
	.long	".Lcsbs$Audio-Example$1b"
.LCPI0_8:
	.long	".Lcsbs$Audio-Example$1c"
.LCPI0_9:
	.long	".Lcsbs$Audio-Example$1d"
.LCPI0_10:
	.long	".Lcsbs$Audio-Example$1e"
.LCPI0_11:
	.long	".Lcsbs$Audio-Example$1f"
.LCPI0_12:
	.long	".Lcsbs$Audio-Example$20"
.LCPI0_13:
	.long	".Lcsbs$Audio-Example$21"
.LCPI0_14:
	.long	".Lcsbs$Audio-Example$22"
.LCPI0_15:
	.long	".Lcsbs$Audio-Example$23"
.LCPI0_16:
	.long	".Lcsbs$Audio-Example$24"
.LCPI0_17:
	.long	".Lcsbs$Audio-Example$25"
.LCPI0_18:
	.long	".Lcsbs$Audio-Example$26"
.LCPI0_19:
	.long	".Lcsbs$Audio-Example$27"
.LCPI0_20:
	.long	1028443341
.LCPI0_21:
	.long	3175926989
.LCPI0_22:
	.long	".Lcsbs$Audio-Example$29"
.LCPI0_23:
	.long	".Lcsbs$Audio-Example$28"
.LCPI0_24:
	.long	".Lcsbs$Audio-Example$2a"
.LCPI0_25:
	.long	".Lcsbs$Audio-Example$2b"
.LCPI0_26:
	.long	".Lcsbs$Audio-Example$2c"
.LCPI0_27:
	.long	.Lstr
.LCPI0_28:
	.long	.Lstr.1
.LCPI0_29:
	.long	.Lstr.2
.LCPI0_30:
	.long	.Lstr.3
.LCPI0_31:
	.long	.Lstr.4
.LCPI0_32:
	.long	.Lstr.5
.LCPI0_33:
	.long	3705032704
.Lfunc_end0:
	.size	odin_main, .Lfunc_end0-odin_main
	.fnend

	.globl	__truncsfhf2
	.p2align	2
	.type	__truncsfhf2,%function
	.code	32
__truncsfhf2:
	.fnstart
	mov	r1, r0
	ldr	r0, .LCPI1_0
	mov	r3, #255
	and	r2, r1, r0
	mov	r0, #32768
	and	r3, r3, r1, lsr #23
	and	r0, r0, r1, lsr #16
	subs	r12, r3, #112
	bhi	.LBB1_3
	cmp	r3, #102
	movlo	pc, lr
.LBB1_2:
	rsb	r1, r3, #113
	orr	r2, r2, #8388608
	mov	r3, #4096
	and	r3, r3, r2, lsr r1
	lsl	r3, r3, #1
	add	r1, r3, r2, lsr r1
	orr	r0, r0, r1, lsr #13
	mov	pc, lr
.LBB1_3:
	cmp	r12, #143
	bne	.LBB1_6
	cmp	r2, #0
	orreq	r0, r0, #31744
	moveq	pc, lr
.LBB1_5:
	lsr	r3, r2, #13
	cmp	r2, #8192
	mov	r1, #1
	orrlo	r3, r1, r2, lsr #13
	orr	r0, r3, r0
	orr	r0, r0, #31744
	mov	pc, lr
.LBB1_6:
	tst	r1, #4096
	bne	.LBB1_9
	mov	r1, r2
	cmp	r12, #31
	bhs	.LBB1_10
.LBB1_8:
	lsr	r1, r1, #13
	orr	r1, r1, r12, lsl #10
	orr	r0, r1, r0
	mov	pc, lr
.LBB1_9:
	mov	r1, #1040384
	orr	r1, r1, #7340032
	cmp	r2, r1
	mov	r1, #0
	subhs	r12, r3, #111
	addlo	r1, r2, #8192
	cmp	r12, #31
	blo	.LBB1_8
.LBB1_10:
	.save	{r11, lr}
	push	{r11, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r1, .LCPI1_1
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
.LCPI1_0:
	.long	8388607
.LCPI1_1:
	.long	3567587328
.Lfunc_end1:
	.size	__truncsfhf2, .Lfunc_end1-__truncsfhf2
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
.Lfunc_end2:
	.size	__aeabi_d2h, .Lfunc_end2-__aeabi_d2h
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
.Lfunc_end3:
	.size	__truncdfhf2, .Lfunc_end3-__truncdfhf2
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
.Lfunc_end4:
	.size	__gnu_h2f_ieee, .Lfunc_end4-__gnu_h2f_ieee
	.cantunwind
	.fnend

	.globl	__gnu_f2h_ieee
	.p2align	2
	.type	__gnu_f2h_ieee,%function
	.code	32
__gnu_f2h_ieee:
	.fnstart
	b	__truncsfhf2
.Lfunc_end5:
	.size	__gnu_f2h_ieee, .Lfunc_end5-__gnu_f2h_ieee
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
.Lfunc_end6:
	.size	__extendhfsf2, .Lfunc_end6-__extendhfsf2
	.cantunwind
	.fnend

	.type	".Lcsbs$Audio-Example$9",%object
	.section	.rodata,"a",%progbits
".Lcsbs$Audio-Example$9":
	.asciz	"rb"
	.size	".Lcsbs$Audio-Example$9", 3

	.type	"runtime::default_random_generator_proc-.state-4863",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-4863"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-4863":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-4863", 1032

	.type	".Lcsbs$Audio-Example$13",%object
	.section	.rodata,"a",%progbits
".Lcsbs$Audio-Example$13":
	.asciz	"ERROR: ndspInit failed (rc=0x%08lX)\n"
	.size	".Lcsbs$Audio-Example$13", 37

	.type	".Lcsbs$Audio-Example$14",%object
".Lcsbs$Audio-Example$14":
	.asciz	"romfs:/audio.wav"
	.size	".Lcsbs$Audio-Example$14", 17

	.type	".Lcsbs$Audio-Example$1b",%object
".Lcsbs$Audio-Example$1b":
	.asciz	"\033[2J"
	.size	".Lcsbs$Audio-Example$1b", 5

	.type	".Lcsbs$Audio-Example$1c",%object
".Lcsbs$Audio-Example$1c":
	.asciz	"\033[1;1H=== Audio-Example ==="
	.size	".Lcsbs$Audio-Example$1c", 28

	.type	".Lcsbs$Audio-Example$1d",%object
".Lcsbs$Audio-Example$1d":
	.asciz	"\033[3;1HFile:     romfs:/audio.wav"
	.size	".Lcsbs$Audio-Example$1d", 33

	.type	".Lcsbs$Audio-Example$1e",%object
".Lcsbs$Audio-Example$1e":
	.asciz	"\033[4;1HRate:     %u Hz"
	.size	".Lcsbs$Audio-Example$1e", 22

	.type	".Lcsbs$Audio-Example$1f",%object
".Lcsbs$Audio-Example$1f":
	.asciz	"\033[5;1HChannels: %u"
	.size	".Lcsbs$Audio-Example$1f", 19

	.type	".Lcsbs$Audio-Example$20",%object
".Lcsbs$Audio-Example$20":
	.asciz	"\033[6;1HBit depth:%u-bit"
	.size	".Lcsbs$Audio-Example$20", 23

	.type	".Lcsbs$Audio-Example$21",%object
".Lcsbs$Audio-Example$21":
	.asciz	"\033[7;1HFrames:   %u"
	.size	".Lcsbs$Audio-Example$21", 19

	.type	".Lcsbs$Audio-Example$22",%object
".Lcsbs$Audio-Example$22":
	.asciz	"\033[9;1HStatus:  "
	.size	".Lcsbs$Audio-Example$22", 16

	.type	".Lcsbs$Audio-Example$23",%object
".Lcsbs$Audio-Example$23":
	.asciz	"\033[10;1HVolume:  "
	.size	".Lcsbs$Audio-Example$23", 17

	.type	".Lcsbs$Audio-Example$24",%object
".Lcsbs$Audio-Example$24":
	.asciz	"\033[11;1HPosition:"
	.size	".Lcsbs$Audio-Example$24", 17

	.type	".Lcsbs$Audio-Example$25",%object
".Lcsbs$Audio-Example$25":
	.asciz	"\033[27;1H[A] Pause/Resume"
	.size	".Lcsbs$Audio-Example$25", 24

	.type	".Lcsbs$Audio-Example$26",%object
".Lcsbs$Audio-Example$26":
	.asciz	"\033[28;1H[Up/Down] Volume +/-5%%"
	.size	".Lcsbs$Audio-Example$26", 31

	.type	".Lcsbs$Audio-Example$27",%object
".Lcsbs$Audio-Example$27":
	.asciz	"\033[29;1H[Start] Exit"
	.size	".Lcsbs$Audio-Example$27", 20

	.type	".Lcsbs$Audio-Example$28",%object
".Lcsbs$Audio-Example$28":
	.asciz	"Paused "
	.size	".Lcsbs$Audio-Example$28", 8

	.type	".Lcsbs$Audio-Example$29",%object
".Lcsbs$Audio-Example$29":
	.asciz	"Playing"
	.size	".Lcsbs$Audio-Example$29", 8

	.type	".Lcsbs$Audio-Example$2a",%object
".Lcsbs$Audio-Example$2a":
	.asciz	"\033[9;10H%s\033[K"
	.size	".Lcsbs$Audio-Example$2a", 13

	.type	".Lcsbs$Audio-Example$2b",%object
".Lcsbs$Audio-Example$2b":
	.asciz	"\033[10;10H%d%%\033[K"
	.size	".Lcsbs$Audio-Example$2b", 16

	.type	".Lcsbs$Audio-Example$2c",%object
".Lcsbs$Audio-Example$2c":
	.asciz	"\033[11;10H%u\033[K"
	.size	".Lcsbs$Audio-Example$2c", 14

	.type	.Lstr,%object
	.section	.rodata.str1.1,"aMS",%progbits,1
.Lstr:
	.asciz	"ERROR: could not load romfs:/audio.wav\n"
	.size	.Lstr, 40

	.type	.Lstr.1,%object
.Lstr.1:
	.asciz	"The file must be an uncompressed PCM WAV:"
	.size	.Lstr.1, 42

	.type	.Lstr.2,%object
.Lstr.2:
	.asciz	"  - 8-bit or 16-bit samples"
	.size	.Lstr.2, 28

	.type	.Lstr.3,%object
.Lstr.3:
	.asciz	"  - Mono or stereo\n"
	.size	.Lstr.3, 20

	.type	.Lstr.4,%object
.Lstr.4:
	.asciz	"Add audio.wav to the romfs/ folder,"
	.size	.Lstr.4, 36

	.type	.Lstr.5,%object
.Lstr.5:
	.asciz	"then rebuild."
	.size	.Lstr.5, 14

	.type	.Lstr.6,%object
.Lstr.6:
	.asciz	"ERROR: romfsInit failed"
	.size	.Lstr.6, 24

	.type	.Lstr.7,%object
.Lstr.7:
	.asciz	"Ensure the .3dsx was built with --romfs."
	.size	.Lstr.7, 41

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
