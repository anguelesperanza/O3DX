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
	.file	"Input-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#68
	sub	sp, sp, #68
	bl	romfs_init
	bl	irrst_init
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #4096
	bl	C2D_Init
	bl	C2D_Prepare
	mov	r0, #1
	mov	r1, #0
	mov	r7, #0
	bl	consoleInit
	mov	r0, #0
	mov	r1, #0
	bl	C2D_CreateScreenTarget
	mov	r4, r0
	ldr	r0, .LCPI0_0
	add	r1, sp, #44
	add	r2, sp, #24
	str	r7, [sp, #44]
	str	r7, [sp, #48]
	str	r7, [sp, #52]
	str	r7, [sp, #56]
	str	r7, [sp, #60]
	str	r7, [sp, #64]
	str	r7, [sp, #24]
	str	r7, [sp, #28]
	str	r7, [sp, #32]
	str	r7, [sp, #36]
	str	r7, [sp, #40]
	bl	load_t3x_image
	strh	r7, [sp, #22]
	strh	r7, [sp, #20]
	strh	r7, [sp, #18]
	strh	r7, [sp, #16]
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_50
	mov	r9, #45088768
	mov	r8, #52953088
	orr	r9, r9, #1073741824
	orr	r8, r8, #1073741824
	mvn	r5, #15
	b	.LBB0_3
.LBB0_2:
	ldr	r0, .LCPI0_14
	bl	printf
	ldr	r0, .LCPI0_15
	bl	printf
	mov	r0, r9
	bl	__aeabi_f2d
	mov	r6, r0
	mov	r0, r8
	mov	r5, r1
	bl	__aeabi_f2d
	mov	r2, r0
	ldr	r0, .LCPI0_16
	mov	r3, r1
	str	r6, [sp]
	str	r5, [sp, #4]
	bl	printf
	ldrsh	r1, [sp, #20]
	ldrsh	r2, [sp, #22]
	ldr	r0, .LCPI0_17
	bl	printf
	ldrsh	r1, [sp, #16]
	ldrsh	r2, [sp, #18]
	ldr	r0, .LCPI0_18
	bl	printf
	mov	r0, #1
	bl	C3D_FrameBegin
	mov	r0, r4
	mov	r1, #-16777216
	bl	C2D_TargetClear
	mov	r0, r4
	bl	c2d_scene_begin
	mov	r0, #1065353216
	add	r1, sp, #24
	str	r0, [sp, #8]
	mov	r2, r8
	str	r0, [sp, #12]
	add	r0, sp, #44
	mov	r3, r9
	str	r7, [sp]
	str	r7, [sp, #4]
	bl	c2d_draw_image_at
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	mvn	r5, #15
	beq	.LBB0_50
.LBB0_3:
	bl	hidScanInput
	bl	hidKeysDown
	mov	r10, r0
	bl	hidKeysHeld
	mov	r11, r0
	add	r0, sp, #20
	bl	hidCircleRead
	bl	irrst_scan
	add	r0, sp, #16
	bl	cstick_read
	tst	r10, #8
	bne	.LBB0_50
	mov	r0, r9
	mov	r1, #1073741824
	bl	__aeabi_fadd
	mov	r6, r0
	tst	r11, #128
	moveq	r6, r9
	mov	r1, #-1073741824
	mov	r0, r6
	bl	__aeabi_fadd
	mov	r9, r0
	tst	r11, #64
	mov	r0, r8
	mov	r1, #1073741824
	moveq	r9, r6
	bl	__aeabi_fadd
	mov	r6, r0
	tst	r11, #16
	moveq	r6, r8
	mov	r1, #-1073741824
	mov	r0, r6
	bl	__aeabi_fadd
	mov	r8, r0
	ldrsh	r0, [sp, #20]
	tst	r11, #32
	moveq	r8, r6
	cmp	r0, #17
	blt	.LBB0_6
	mov	r1, #255
	orr	r1, r1, #65280
	and	r0, r0, r1
	bl	__aeabi_ui2f
	mov	r1, #1703936
	orr	r1, r1, #1124073472
	bl	__aeabi_fdiv
	mov	r1, r0
	bl	__aeabi_fadd
	mov	r6, #8388608
	orr	r6, r6, #1073741824
	b	.LBB0_8
.LBB0_6:
	mov	r6, #8388608
	cmp	r0, r5
	orr	r6, r6, #1073741824
	bge	.LBB0_9
	bl	__aeabi_i2f
	mov	r1, #1703936
	orr	r1, r1, #1124073472
	bl	__aeabi_fdiv
	mov	r1, r0
	bl	__aeabi_fadd
.LBB0_8:
	mov	r1, r6
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r8
	bl	__aeabi_fadd
	mov	r8, r0
.LBB0_9:
	ldrsh	r0, [sp, #22]
	cmp	r0, #17
	blt	.LBB0_11
	mov	r1, #255
	orr	r1, r1, #65280
	and	r0, r0, r1
	bl	__aeabi_ui2f
	b	.LBB0_13
.LBB0_11:
	cmp	r0, r5
	bge	.LBB0_14
	bl	__aeabi_i2f
.LBB0_13:
	mov	r1, #1703936
	orr	r1, r1, #-1023410176
	bl	__aeabi_fdiv
	mov	r1, r0
	bl	__aeabi_fadd
	mov	r1, r6
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r9
	bl	__aeabi_fadd
	mov	r9, r0
.LBB0_14:
	ldrsh	r0, [sp, #16]
	cmp	r0, #17
	blt	.LBB0_16
	mov	r1, #255
	orr	r1, r1, #65280
	and	r0, r0, r1
	bl	__aeabi_ui2f
	b	.LBB0_18
.LBB0_16:
	cmp	r0, r5
	bge	.LBB0_19
	bl	__aeabi_i2f
.LBB0_18:
	mov	r1, #1703936
	orr	r1, r1, #1124073472
	bl	__aeabi_fdiv
	mov	r1, r0
	bl	__aeabi_fadd
	mov	r1, r6
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r8
	bl	__aeabi_fadd
	mov	r8, r0
.LBB0_19:
	ldrsh	r0, [sp, #18]
	cmp	r0, #17
	blt	.LBB0_21
	mov	r1, #255
	orr	r1, r1, #65280
	and	r0, r0, r1
	bl	__aeabi_ui2f
	b	.LBB0_36
.LBB0_21:
	cmp	r0, r5
	blt	.LBB0_35
	tst	r10, #16
	bne	.LBB0_37
.LBB0_23:
	tst	r10, #32
	bne	.LBB0_38
.LBB0_24:
	tst	r10, #64
	bne	.LBB0_39
.LBB0_25:
	tst	r10, #128
	bne	.LBB0_40
.LBB0_26:
	tst	r10, #1
	bne	.LBB0_41
.LBB0_27:
	tst	r10, #2
	bne	.LBB0_42
.LBB0_28:
	tst	r10, #1024
	bne	.LBB0_43
.LBB0_29:
	tst	r10, #2048
	bne	.LBB0_44
.LBB0_30:
	tst	r10, #512
	bne	.LBB0_45
.LBB0_31:
	tst	r10, #256
	bne	.LBB0_46
.LBB0_32:
	tst	r10, #16384
	bne	.LBB0_47
.LBB0_33:
	tst	r10, #32768
	bne	.LBB0_48
.LBB0_34:
	tst	r10, #4
	beq	.LBB0_2
	b	.LBB0_49
.LBB0_35:
	bl	__aeabi_i2f
.LBB0_36:
	mov	r1, #1703936
	orr	r1, r1, #-1023410176
	bl	__aeabi_fdiv
	mov	r1, r0
	bl	__aeabi_fadd
	mov	r1, r6
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r9
	bl	__aeabi_fadd
	mov	r9, r0
	tst	r10, #16
	beq	.LBB0_23
.LBB0_37:
	ldr	r0, .LCPI0_1
	bl	printf
	tst	r10, #32
	beq	.LBB0_24
.LBB0_38:
	ldr	r0, .LCPI0_2
	bl	printf
	tst	r10, #64
	beq	.LBB0_25
.LBB0_39:
	ldr	r0, .LCPI0_3
	bl	printf
	tst	r10, #128
	beq	.LBB0_26
.LBB0_40:
	ldr	r0, .LCPI0_4
	bl	printf
	tst	r10, #1
	beq	.LBB0_27
.LBB0_41:
	ldr	r0, .LCPI0_5
	bl	printf
	tst	r10, #2
	beq	.LBB0_28
.LBB0_42:
	ldr	r0, .LCPI0_6
	bl	printf
	tst	r10, #1024
	beq	.LBB0_29
.LBB0_43:
	ldr	r0, .LCPI0_7
	bl	printf
	tst	r10, #2048
	beq	.LBB0_30
.LBB0_44:
	ldr	r0, .LCPI0_8
	bl	printf
	tst	r10, #512
	beq	.LBB0_31
.LBB0_45:
	ldr	r0, .LCPI0_9
	bl	printf
	tst	r10, #256
	beq	.LBB0_32
.LBB0_46:
	ldr	r0, .LCPI0_10
	bl	printf
	tst	r10, #16384
	beq	.LBB0_33
.LBB0_47:
	ldr	r0, .LCPI0_11
	bl	printf
	tst	r10, #32768
	beq	.LBB0_34
.LBB0_48:
	ldr	r0, .LCPI0_12
	bl	printf
	tst	r10, #4
	beq	.LBB0_2
.LBB0_49:
	ldr	r0, .LCPI0_13
	bl	printf
	b	.LBB0_2
.LBB0_50:
	bl	irrst_exit
	add	r0, sp, #44
	bl	C3D_TexDelete
	bl	C2D_Fini
	bl	C3D_Fini
	bl	romfs_exit
	bl	gfxExit
	mov	r0, #0
	add	sp, sp, #68
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$Input-Example$5"
.LCPI0_1:
	.long	".Lcsbs$Input-Example$6"
.LCPI0_2:
	.long	".Lcsbs$Input-Example$7"
.LCPI0_3:
	.long	".Lcsbs$Input-Example$8"
.LCPI0_4:
	.long	".Lcsbs$Input-Example$9"
.LCPI0_5:
	.long	".Lcsbs$Input-Example$a"
.LCPI0_6:
	.long	".Lcsbs$Input-Example$b"
.LCPI0_7:
	.long	".Lcsbs$Input-Example$c"
.LCPI0_8:
	.long	".Lcsbs$Input-Example$d"
.LCPI0_9:
	.long	".Lcsbs$Input-Example$e"
.LCPI0_10:
	.long	".Lcsbs$Input-Example$f"
.LCPI0_11:
	.long	".Lcsbs$Input-Example$10"
.LCPI0_12:
	.long	".Lcsbs$Input-Example$11"
.LCPI0_13:
	.long	".Lcsbs$Input-Example$12"
.LCPI0_14:
	.long	".Lcsbs$Input-Example$14"
.LCPI0_15:
	.long	".Lcsbs$Input-Example$15"
.LCPI0_16:
	.long	".Lcsbs$Input-Example$16"
.LCPI0_17:
	.long	".Lcsbs$Input-Example$17"
.LCPI0_18:
	.long	".Lcsbs$Input-Example$18"
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

	.type	".Lcsbs$Input-Example$5",%object
	.section	.rodata,"a",%progbits
".Lcsbs$Input-Example$5":
	.asciz	"romfs:/player.t3x"
	.size	".Lcsbs$Input-Example$5", 18

	.type	".Lcsbs$Input-Example$6",%object
".Lcsbs$Input-Example$6":
	.asciz	"\033[7;1HDRight pressed "
	.size	".Lcsbs$Input-Example$6", 22

	.type	".Lcsbs$Input-Example$7",%object
".Lcsbs$Input-Example$7":
	.asciz	"\033[8;1HDLeft pressed  "
	.size	".Lcsbs$Input-Example$7", 22

	.type	".Lcsbs$Input-Example$8",%object
".Lcsbs$Input-Example$8":
	.asciz	"\033[9;1HDUp pressed    "
	.size	".Lcsbs$Input-Example$8", 22

	.type	".Lcsbs$Input-Example$9",%object
".Lcsbs$Input-Example$9":
	.asciz	"\033[10;1HDDown pressed  "
	.size	".Lcsbs$Input-Example$9", 23

	.type	".Lcsbs$Input-Example$a",%object
".Lcsbs$Input-Example$a":
	.asciz	"\033[11;1HA pressed  "
	.size	".Lcsbs$Input-Example$a", 19

	.type	".Lcsbs$Input-Example$b",%object
".Lcsbs$Input-Example$b":
	.asciz	"\033[12;1HB pressed  "
	.size	".Lcsbs$Input-Example$b", 19

	.type	".Lcsbs$Input-Example$c",%object
".Lcsbs$Input-Example$c":
	.asciz	"\033[13;1HX pressed  "
	.size	".Lcsbs$Input-Example$c", 19

	.type	".Lcsbs$Input-Example$d",%object
".Lcsbs$Input-Example$d":
	.asciz	"\033[14;1HY pressed  "
	.size	".Lcsbs$Input-Example$d", 19

	.type	".Lcsbs$Input-Example$e",%object
".Lcsbs$Input-Example$e":
	.asciz	"\033[15;1HL pressed  "
	.size	".Lcsbs$Input-Example$e", 19

	.type	".Lcsbs$Input-Example$f",%object
".Lcsbs$Input-Example$f":
	.asciz	"\033[16;1HR pressed  "
	.size	".Lcsbs$Input-Example$f", 19

	.type	".Lcsbs$Input-Example$10",%object
".Lcsbs$Input-Example$10":
	.asciz	"\033[17;1HZL pressed     "
	.size	".Lcsbs$Input-Example$10", 23

	.type	".Lcsbs$Input-Example$11",%object
".Lcsbs$Input-Example$11":
	.asciz	"\033[18;1HZR pressed     "
	.size	".Lcsbs$Input-Example$11", 23

	.type	".Lcsbs$Input-Example$12",%object
".Lcsbs$Input-Example$12":
	.asciz	"\033[19;1HSELECT pressed "
	.size	".Lcsbs$Input-Example$12", 23

	.type	".Lcsbs$Input-Example$14",%object
".Lcsbs$Input-Example$14":
	.asciz	"\033[1;1HInput example                "
	.size	".Lcsbs$Input-Example$14", 36

	.type	".Lcsbs$Input-Example$15",%object
".Lcsbs$Input-Example$15":
	.asciz	"\033[2;1HPress START to exit          "
	.size	".Lcsbs$Input-Example$15", 36

	.type	".Lcsbs$Input-Example$16",%object
".Lcsbs$Input-Example$16":
	.asciz	"\033[3;1HPos: %.1f, %.1f      "
	.size	".Lcsbs$Input-Example$16", 28

	.type	".Lcsbs$Input-Example$17",%object
".Lcsbs$Input-Example$17":
	.asciz	"\033[4;1HCircle: %d, %d      "
	.size	".Lcsbs$Input-Example$17", 27

	.type	".Lcsbs$Input-Example$18",%object
".Lcsbs$Input-Example$18":
	.asciz	"\033[5;1HCStick: %d, %d      "
	.size	".Lcsbs$Input-Example$18", 27

	.type	"runtime::default_random_generator_proc-.state-8909",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-8909"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-8909":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-8909", 1032

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
