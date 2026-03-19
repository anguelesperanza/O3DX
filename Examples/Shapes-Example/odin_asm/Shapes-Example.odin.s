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
	.file	"Shapes-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, sp, #28
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #4096
	bl	C2D_Init
	bl	C2D_Prepare
	mov	r0, #1
	mov	r1, #0
	bl	consoleInit
	mov	r0, #0
	mov	r1, #0
	bl	C2D_CreateScreenTarget
	mov	r4, r0
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_4
	mov	r8, #38273024
	mov	r9, #29884416
	orr	r8, r8, #1073741824
	orr	r9, r9, #1073741824
	mvn	r11, #0
	mvn	r10, #65280
	mvn	r7, #255
.LBB0_2:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_4
	ldr	r0, .LCPI0_0
	bl	printf
	bl	c3d_get_processing_time
	bl	__aeabi_f2d
	mov	r5, #1572864
	mov	r2, #0
	orr	r5, r5, #1073741824
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r2, r0
	ldr	r0, .LCPI0_1
	mov	r3, r1
	bl	printf
	bl	c3d_get_drawing_time
	bl	__aeabi_f2d
	mov	r2, #0
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r2, r0
	ldr	r0, .LCPI0_2
	mov	r3, r1
	bl	printf
	bl	c3d_get_cmdbuf_usage
	bl	__aeabi_f2d
	mov	r3, #5832704
	mov	r2, #0
	orr	r3, r3, #1073741824
	bl	__aeabi_dmul
	mov	r2, r0
	ldr	r0, .LCPI0_3
	mov	r3, r1
	bl	printf
	mov	r0, #1
	bl	C3D_FrameBegin
	ldr	r1, .LCPI0_4
	mov	r0, r4
	bl	C2D_TargetClear
	mov	r0, r4
	bl	c2d_scene_begin
	mov	r5, #255
	mov	r1, #4063232
	orr	r5, r5, #-16777216
	orr	r1, r1, #1124073472
	add	r0, r5, #5376
	mov	r6, #57671680
	stmib	sp, {r0, r8}
	mvn	r2, #0
	mov	r3, #0
	ldr	r0, .LCPI0_5
	orr	r6, r6, #1073741824
	str	r0, [sp, #16]
	mov	r0, #0
	str	r0, [sp, #20]
	mov	r0, r9
	str	r6, [sp]
	str	r6, [sp, #12]
	bl	c2d_draw_triangle
	ldr	r0, .LCPI0_8
	mov	r1, #0
	str	r0, [sp, #4]
	mvn	r0, #13828096
	str	r0, [sp, #8]
	mov	r2, #0
	ldr	r0, .LCPI0_7
	mov	r3, r8
	str	r0, [sp, #12]
	ldr	r0, .LCPI0_6
	str	r0, [sp, #16]
	mov	r0, #11468800
	orr	r0, r0, #1124073472
	str	r8, [sp]
	bl	c2d_draw_rectangle
	mov	r3, #63438848
	stm	sp, {r6, r10}
	mvn	r6, #16711680
	add	r0, sp, #8
	orr	r3, r3, #1073741824
	stm	r0, {r6, r7, r11}
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	bl	c2d_draw_ellipse
	mov	r0, #55050240
	mov	r1, #49283072
	orr	r0, r0, #1073741824
	orr	r1, r1, #1073741824
	mov	r2, #0
	mov	r3, r8
	stm	sp, {r7, r11}
	str	r10, [sp, #8]
	str	r6, [sp, #12]
	bl	c2d_draw_circle
	mov	r0, #16711680
	mov	r1, r9
	orr	r0, r0, #-16777216
	str	r0, [sp, #4]
	mov	r0, #65280
	mov	r2, #0
	orr	r0, r0, #-16777216
	str	r0, [sp, #8]
	mov	r0, r9
	mov	r3, r9
	str	r5, [sp]
	str	r11, [sp, #12]
	bl	c2d_draw_circle
	ldr	r0, .LCPI0_9
	mov	r1, #5701632
	str	r0, [sp]
	orr	r1, r1, #1124073472
	ldr	r0, .LCPI0_10
	mov	r2, #0
	mov	r3, r9
	bl	c2d_draw_circle_solid
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	bne	.LBB0_2
.LBB0_4:
	bl	C2D_Fini
	bl	C3D_Fini
	bl	gfxExit
	mov	r0, #0
	add	sp, sp, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$Shapes-Example$2"
.LCPI0_1:
	.long	".Lcsbs$Shapes-Example$3"
.LCPI0_2:
	.long	".Lcsbs$Shapes-Example$4"
.LCPI0_3:
	.long	".Lcsbs$Shapes-Example$5"
.LCPI0_4:
	.long	1756420351
.LCPI0_5:
	.long	4293224743
.LCPI0_6:
	.long	4287097408
.LCPI0_7:
	.long	4279236312
.LCPI0_8:
	.long	4290342042
.LCPI0_9:
	.long	4292391016
.LCPI0_10:
	.long	1136361472
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

	.type	".Lcsbs$Shapes-Example$2",%object
	.section	.rodata,"a",%progbits
".Lcsbs$Shapes-Example$2":
	.asciz	"\033[1;1HSimple citro2d shapes example"
	.size	".Lcsbs$Shapes-Example$2", 36

	.type	".Lcsbs$Shapes-Example$3",%object
".Lcsbs$Shapes-Example$3":
	.asciz	"\033[2;1HCPU:     %6.2f%%\033[K"
	.size	".Lcsbs$Shapes-Example$3", 26

	.type	".Lcsbs$Shapes-Example$4",%object
".Lcsbs$Shapes-Example$4":
	.asciz	"\033[3;1HGPU:     %6.2f%%\033[K"
	.size	".Lcsbs$Shapes-Example$4", 26

	.type	".Lcsbs$Shapes-Example$5",%object
".Lcsbs$Shapes-Example$5":
	.asciz	"\033[4;1HCmdBuf:  %6.2f%%\033[K"
	.size	".Lcsbs$Shapes-Example$5", 26

	.type	"runtime::default_random_generator_proc-.state-3198",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-3198"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-3198":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-3198", 1032

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
