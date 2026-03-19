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
	.file	"Image-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#372
	sub	sp, sp, #372
	bl	romfs_init
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
	ldr	r0, .LCPI0_0
	add	r1, sp, #348
	add	r2, sp, #328
	str	r9, [sp, #348]
	str	r9, [sp, #352]
	str	r9, [sp, #356]
	str	r9, [sp, #360]
	str	r9, [sp, #364]
	str	r9, [sp, #368]
	str	r9, [sp, #328]
	str	r9, [sp, #332]
	str	r9, [sp, #336]
	str	r9, [sp, #340]
	str	r9, [sp, #344]
	bl	load_t3x_image
	ldr	r0, .LCPI0_1
	add	r1, sp, #304
	add	r2, sp, #284
	str	r9, [sp, #304]
	str	r9, [sp, #308]
	str	r9, [sp, #312]
	str	r9, [sp, #316]
	str	r9, [sp, #320]
	str	r9, [sp, #324]
	str	r9, [sp, #284]
	str	r9, [sp, #288]
	str	r9, [sp, #292]
	str	r9, [sp, #296]
	str	r9, [sp, #300]
	bl	load_t3x_image
	ldr	r0, .LCPI0_2
	add	r1, sp, #260
	add	r2, sp, #240
	str	r9, [sp, #260]
	str	r9, [sp, #264]
	str	r9, [sp, #268]
	str	r9, [sp, #272]
	str	r9, [sp, #276]
	str	r9, [sp, #280]
	str	r9, [sp, #240]
	str	r9, [sp, #244]
	str	r9, [sp, #248]
	str	r9, [sp, #252]
	str	r9, [sp, #256]
	bl	load_t3x_image
	ldr	r0, .LCPI0_3
	add	r1, sp, #216
	add	r2, sp, #196
	str	r9, [sp, #216]
	str	r9, [sp, #220]
	str	r9, [sp, #224]
	str	r9, [sp, #228]
	str	r9, [sp, #232]
	str	r9, [sp, #236]
	str	r9, [sp, #196]
	str	r9, [sp, #200]
	str	r9, [sp, #204]
	str	r9, [sp, #208]
	str	r9, [sp, #212]
	bl	load_t3x_image
	ldr	r0, .LCPI0_4
	add	r1, sp, #172
	add	r2, sp, #152
	str	r9, [sp, #172]
	str	r9, [sp, #176]
	str	r9, [sp, #180]
	str	r9, [sp, #184]
	str	r9, [sp, #188]
	str	r9, [sp, #192]
	str	r9, [sp, #152]
	str	r9, [sp, #156]
	str	r9, [sp, #160]
	str	r9, [sp, #164]
	str	r9, [sp, #168]
	bl	load_t3x_image
	ldr	r0, .LCPI0_5
	add	r1, sp, #128
	add	r2, sp, #108
	str	r9, [sp, #128]
	str	r9, [sp, #132]
	str	r9, [sp, #136]
	str	r9, [sp, #140]
	str	r9, [sp, #144]
	str	r9, [sp, #148]
	str	r9, [sp, #108]
	str	r9, [sp, #112]
	str	r9, [sp, #116]
	str	r9, [sp, #120]
	str	r9, [sp, #124]
	bl	load_t3x_image
	ldr	r0, .LCPI0_6
	add	r1, sp, #84
	add	r2, sp, #64
	str	r9, [sp, #84]
	str	r9, [sp, #88]
	str	r9, [sp, #92]
	str	r9, [sp, #96]
	str	r9, [sp, #100]
	str	r9, [sp, #104]
	str	r9, [sp, #64]
	str	r9, [sp, #68]
	str	r9, [sp, #72]
	str	r9, [sp, #76]
	str	r9, [sp, #80]
	bl	load_t3x_image
	ldr	r0, .LCPI0_7
	add	r1, sp, #40
	add	r2, sp, #20
	str	r9, [sp, #40]
	str	r9, [sp, #44]
	str	r9, [sp, #48]
	str	r9, [sp, #52]
	str	r9, [sp, #56]
	str	r9, [sp, #60]
	str	r9, [sp, #20]
	str	r9, [sp, #24]
	str	r9, [sp, #28]
	str	r9, [sp, #32]
	str	r9, [sp, #36]
	bl	load_t3x_image
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_4
	mov	r6, #58720256
	mov	r7, #60817408
	mov	r5, #61865984
	mov	r8, #62390272
	ldr	r11, .LCPI0_9
	orr	r6, r6, #1073741824
	orr	r7, r7, #1073741824
	orr	r5, r5, #1073741824
	orr	r8, r8, #1073741824
	mov	r10, #1065353216
.LBB0_2:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_4
	ldr	r0, .LCPI0_8
	bl	printf
	mov	r0, r11
	bl	printf
	mov	r0, #1
	bl	C3D_FrameBegin
	mov	r0, r4
	mov	r1, #-16777216
	bl	C2D_TargetClear
	mov	r0, r4
	bl	c2d_scene_begin
	add	r0, sp, #84
	add	r1, sp, #64
	mov	r2, #0
	mov	r3, #0
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	add	r0, sp, #40
	add	r1, sp, #20
	mov	r2, #0
	mov	r3, #0
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	add	r0, sp, #128
	add	r1, sp, #108
	mov	r2, #0
	mov	r3, #0
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	add	r0, sp, #172
	add	r1, sp, #152
	mov	r2, r6
	mov	r3, #0
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	add	r0, sp, #216
	add	r1, sp, #196
	mov	r2, r6
	mov	r3, #1124073472
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	add	r0, sp, #260
	add	r1, sp, #240
	mov	r2, r7
	mov	r3, #1124073472
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	add	r0, sp, #304
	add	r1, sp, #284
	mov	r2, r5
	mov	r3, #1124073472
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	add	r0, sp, #348
	add	r1, sp, #328
	mov	r2, r8
	mov	r3, #1124073472
	str	r9, [sp]
	stmib	sp, {r9, r10}
	str	r10, [sp, #12]
	bl	c2d_draw_image_at
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	bne	.LBB0_2
.LBB0_4:
	add	r0, sp, #348
	bl	C3D_TexDelete
	add	r0, sp, #304
	bl	C3D_TexDelete
	add	r0, sp, #260
	bl	C3D_TexDelete
	add	r0, sp, #216
	bl	C3D_TexDelete
	add	r0, sp, #172
	bl	C3D_TexDelete
	add	r0, sp, #128
	bl	C3D_TexDelete
	add	r0, sp, #84
	bl	C3D_TexDelete
	add	r0, sp, #40
	bl	C3D_TexDelete
	bl	C2D_Fini
	bl	C3D_Fini
	bl	romfs_exit
	bl	gfxExit
	mov	r0, #0
	add	sp, sp, #372
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$Image-Example$2"
.LCPI0_1:
	.long	".Lcsbs$Image-Example$3"
.LCPI0_2:
	.long	".Lcsbs$Image-Example$4"
.LCPI0_3:
	.long	".Lcsbs$Image-Example$5"
.LCPI0_4:
	.long	".Lcsbs$Image-Example$6"
.LCPI0_5:
	.long	".Lcsbs$Image-Example$7"
.LCPI0_6:
	.long	".Lcsbs$Image-Example$8"
.LCPI0_7:
	.long	".Lcsbs$Image-Example$9"
.LCPI0_8:
	.long	".Lcsbs$Image-Example$a"
.LCPI0_9:
	.long	".Lcsbs$Image-Example$b"
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

	.type	".Lcsbs$Image-Example$2",%object
	.section	.rodata,"a",%progbits
".Lcsbs$Image-Example$2":
	.asciz	"romfs:/image_8x8.t3x"
	.size	".Lcsbs$Image-Example$2", 21

	.type	".Lcsbs$Image-Example$3",%object
".Lcsbs$Image-Example$3":
	.asciz	"romfs:/image_16x16.t3x"
	.size	".Lcsbs$Image-Example$3", 23

	.type	".Lcsbs$Image-Example$4",%object
".Lcsbs$Image-Example$4":
	.asciz	"romfs:/image_32x32.t3x"
	.size	".Lcsbs$Image-Example$4", 23

	.type	".Lcsbs$Image-Example$5",%object
".Lcsbs$Image-Example$5":
	.asciz	"romfs:/image_64x64.t3x"
	.size	".Lcsbs$Image-Example$5", 23

	.type	".Lcsbs$Image-Example$6",%object
".Lcsbs$Image-Example$6":
	.asciz	"romfs:/image_128x128.t3x"
	.size	".Lcsbs$Image-Example$6", 25

	.type	".Lcsbs$Image-Example$7",%object
".Lcsbs$Image-Example$7":
	.asciz	"romfs:/image_256x256.t3x"
	.size	".Lcsbs$Image-Example$7", 25

	.type	".Lcsbs$Image-Example$8",%object
".Lcsbs$Image-Example$8":
	.asciz	"romfs:/image_512x512.t3x"
	.size	".Lcsbs$Image-Example$8", 25

	.type	".Lcsbs$Image-Example$9",%object
".Lcsbs$Image-Example$9":
	.asciz	"romfs:/image_1024x1024.t3x"
	.size	".Lcsbs$Image-Example$9", 27

	.type	".Lcsbs$Image-Example$a",%object
".Lcsbs$Image-Example$a":
	.asciz	"\033[1;1HImage example"
	.size	".Lcsbs$Image-Example$a", 20

	.type	".Lcsbs$Image-Example$b",%object
".Lcsbs$Image-Example$b":
	.asciz	"\033[2;1HPress START to exit"
	.size	".Lcsbs$Image-Example$b", 26

	.type	"runtime::default_random_generator_proc-.state-3240",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-3240"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-3240":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-3240", 1032

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
