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
	.file	"DrawTextAlign-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#108
	sub	sp, sp, #108
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #4096
	bl	C2D_Init
	bl	C2D_Prepare
	mov	r0, #1
	mov	r1, #0
	mov	r9, #0
	bl	consoleInit
	mov	r0, #0
	mov	r1, #0
	bl	C2D_CreateScreenTarget
	mov	r4, r0
	mov	r0, #64
	bl	C2D_TextBufNew
	add	r8, sp, #80
	ldr	r2, .LCPI0_0
	mov	r5, r0
	str	r9, [sp, #80]
	mov	r0, r8
	mov	r1, r5
	str	r9, [sp, #84]
	str	r9, [sp, #88]
	str	r9, [sp, #92]
	str	r9, [sp, #96]
	str	r9, [sp, #100]
	str	r9, [sp, #104]
	str	r9, [sp, #52]
	str	r9, [sp, #56]
	str	r9, [sp, #60]
	str	r9, [sp, #64]
	str	r9, [sp, #68]
	str	r9, [sp, #72]
	str	r9, [sp, #76]
	str	r9, [sp, #24]
	str	r9, [sp, #28]
	str	r9, [sp, #32]
	str	r9, [sp, #36]
	str	r9, [sp, #40]
	str	r9, [sp, #44]
	str	r9, [sp, #48]
	bl	C2D_TextParse
	add	r6, sp, #52
	ldr	r2, .LCPI0_1
	mov	r1, r5
	mov	r0, r6
	bl	C2D_TextParse
	add	r7, sp, #24
	ldr	r2, .LCPI0_2
	mov	r1, r5
	str	r5, [sp, #20]
	mov	r0, r7
	bl	C2D_TextParse
	mov	r0, r8
	bl	C2D_TextOptimize
	mov	r0, r6
	bl	C2D_TextOptimize
	mov	r0, r7
	bl	C2D_TextOptimize
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_4
	mov	r6, #47972352
	mov	r5, #12910592
	mov	r8, #1441792
	ldr	r10, .LCPI0_8
	ldr	r11, .LCPI0_9
	orr	r6, r6, #1073741824
	add	r7, sp, #24
	orr	r5, r5, #1124073472
	orr	r8, r8, #1124073472
.LBB0_2:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_4
	ldr	r0, .LCPI0_3
	bl	printf
	ldr	r0, .LCPI0_4
	bl	printf
	ldr	r0, .LCPI0_5
	bl	printf
	ldr	r0, .LCPI0_6
	bl	printf
	mov	r0, #1
	bl	C3D_FrameBegin
	ldr	r1, .LCPI0_7
	mov	r0, r4
	bl	C2D_TargetClear
	mov	r0, r4
	bl	c2d_scene_begin
	mov	r2, #12582912
	mov	r3, #42729472
	mvn	r0, #0
	orr	r2, r2, #1073741824
	str	r0, [sp, #12]
	add	r0, sp, #80
	orr	r3, r3, #1073741824
	mov	r1, #2
	stm	sp, {r9, r10}
	str	r10, [sp, #8]
	bl	c2d_draw_text_color
	mov	r2, #55050240
	mvn	r0, #255
	str	r0, [sp, #12]
	add	r0, sp, #52
	orr	r2, r2, #1073741824
	mov	r1, #10
	mov	r3, r6
	stm	sp, {r9, r10}
	str	r10, [sp, #8]
	bl	c2d_draw_text_color
	mov	r0, r7
	mov	r1, #6
	mov	r2, r5
	mov	r3, r8
	stm	sp, {r9, r10}
	str	r10, [sp, #8]
	str	r11, [sp, #12]
	bl	c2d_draw_text_color
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	bne	.LBB0_2
.LBB0_4:
	ldr	r0, [sp, #20]
	bl	C2D_TextBufDelete
	bl	C2D_Fini
	bl	C3D_Fini
	bl	gfxExit
	mov	r0, #0
	add	sp, sp, #108
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$DrawTextAlign-Example$5"
.LCPI0_1:
	.long	".Lcsbs$DrawTextAlign-Example$6"
.LCPI0_2:
	.long	".Lcsbs$DrawTextAlign-Example$7"
.LCPI0_3:
	.long	".Lcsbs$DrawTextAlign-Example$8"
.LCPI0_4:
	.long	".Lcsbs$DrawTextAlign-Example$9"
.LCPI0_5:
	.long	".Lcsbs$DrawTextAlign-Example$a"
.LCPI0_6:
	.long	".Lcsbs$DrawTextAlign-Example$b"
.LCPI0_7:
	.long	4281211418
.LCPI0_8:
	.long	1060320051
.LCPI0_9:
	.long	4278231295
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

	.type	".Lcsbs$DrawTextAlign-Example$5",%object
	.section	.rodata,"a",%progbits
".Lcsbs$DrawTextAlign-Example$5":
	.asciz	"Left aligned"
	.size	".Lcsbs$DrawTextAlign-Example$5", 13

	.type	".Lcsbs$DrawTextAlign-Example$6",%object
".Lcsbs$DrawTextAlign-Example$6":
	.asciz	"-- Centered --"
	.size	".Lcsbs$DrawTextAlign-Example$6", 15

	.type	".Lcsbs$DrawTextAlign-Example$7",%object
".Lcsbs$DrawTextAlign-Example$7":
	.asciz	"Right aligned"
	.size	".Lcsbs$DrawTextAlign-Example$7", 14

	.type	".Lcsbs$DrawTextAlign-Example$8",%object
".Lcsbs$DrawTextAlign-Example$8":
	.asciz	"\033[1;1HDrawTextAlign Example"
	.size	".Lcsbs$DrawTextAlign-Example$8", 28

	.type	".Lcsbs$DrawTextAlign-Example$9",%object
".Lcsbs$DrawTextAlign-Example$9":
	.asciz	"\033[2;1HPress START to exit"
	.size	".Lcsbs$DrawTextAlign-Example$9", 26

	.type	".Lcsbs$DrawTextAlign-Example$a",%object
".Lcsbs$DrawTextAlign-Example$a":
	.asciz	"\033[4;1HShows left / center / right"
	.size	".Lcsbs$DrawTextAlign-Example$a", 34

	.type	".Lcsbs$DrawTextAlign-Example$b",%object
".Lcsbs$DrawTextAlign-Example$b":
	.asciz	"\033[5;1Halignment at scale 0.7."
	.size	".Lcsbs$DrawTextAlign-Example$b", 30

	.type	"runtime::default_random_generator_proc-.state-4323",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-4323"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-4323":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-4323", 1032

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
