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
	.file	"SaveData-Example"
	.text
	.p2align	2
	.type	"save_data_example::write_save",%function
	.code	32
"save_data_example::write_save":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#68
	sub	sp, sp, #68
	mov	r4, r0
	add	r0, sp, #56
	mov	r8, #0
	str	r2, [sp, #28]
	mov	r5, r1
	mov	r1, #1
	mov	r2, #0
	str	r8, [sp, #64]
	str	r8, [sp, #60]
	str	r8, [sp, #56]
	bl	fsMakePath
	ldr	r0, [sp, #56]
	mov	r1, #3
	ldr	r2, .LCPI0_0
	str	r0, [sp, #32]
	add	r0, sp, #44
	str	r8, [sp, #44]
	str	r8, [sp, #48]
	str	r8, [sp, #52]
	ldr	r11, [sp, #60]
	ldr	r9, [sp, #64]
	bl	fsMakePath
	add	r10, sp, #44
	mov	r0, #16
	str	r0, [sp, #8]
	mov	r0, r4
	ldm	r10, {r6, r7, r10}
	mov	r1, r5
	mov	r3, r7
	str	r10, [sp]
	mov	r2, r6
	str	r8, [sp, #4]
	str	r8, [sp, #12]
	bl	FSUSER_CreateFile
	mov	r0, #2
	ldr	r2, [sp, #32]
	str	r0, [sp, #16]
	add	r0, sp, #40
	mov	r1, #9
	mov	r3, r11
	str	r8, [sp, #40]
	str	r9, [sp]
	stmib	sp, {r6, r7, r10}
	str	r8, [sp, #20]
	bl	FSUSER_OpenFileDirectly
	cmp	r0, #0
	beq	.LBB0_2
	mov	r1, r0
	ldr	r0, .LCPI0_1
	bl	printf
	b	.LBB0_4
.LBB0_2:
	ldr	r1, [sp, #28]
	mov	r0, #0
	str	r1, [sp]
	mov	r1, #16
	str	r0, [sp, #36]
	mov	r2, #0
	str	r1, [sp, #4]
	mov	r1, #1
	ldr	r0, [sp, #40]
	mov	r3, #0
	str	r1, [sp, #8]
	add	r1, sp, #36
	bl	FSFILE_Write
	mov	r4, r0
	ldr	r0, [sp, #40]
	bl	FSFILE_Close
	ldr	r2, [sp, #36]
	cmp	r4, #0
	mov	r0, #1
	cmpeq	r2, #16
	beq	.LBB0_5
	ldr	r0, .LCPI0_2
	mov	r1, r4
	bl	printf
.LBB0_4:
	mov	r0, #0
.LBB0_5:
	add	sp, sp, #68
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$SaveData-Example$2"
.LCPI0_1:
	.long	".Lcsbs$SaveData-Example$10"
.LCPI0_2:
	.long	".Lcsbs$SaveData-Example$11"
.Lfunc_end0:
	.size	"save_data_example::write_save", .Lfunc_end0-"save_data_example::write_save"
	.fnend

	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#104
	sub	sp, sp, #104
	bl	gfxInitDefault
	mov	r0, #0
	mov	r1, #0
	mov	r4, #0
	bl	consoleInit
	ldr	r0, .LCPI1_0
	bl	printf
	ldr	r0, .LCPI1_1
	bl	printf
	ldr	r0, .LCPI1_2
	bl	printf
	ldr	r0, .LCPI1_3
	bl	printf
	ldr	r0, .LCPI1_4
	bl	printf
	ldr	r0, .LCPI1_5
	bl	printf
	bl	fsInit
	cmp	r0, #0
	beq	.LBB1_2
	ldr	r0, .LCPI1_6
	bl	puts
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	ldr	r0, .LCPI1_7
	mov	r1, #1
	mov	r4, #1
	bl	svcSleepThread
	b	.LBB1_4
.LBB1_2:
	add	r0, sp, #52
	mov	r1, #1
	mov	r2, #0
	str	r4, [sp, #68]
	str	r4, [sp, #64]
	str	r4, [sp, #52]
	str	r4, [sp, #56]
	str	r4, [sp, #60]
	mov	r4, #1
	bl	fsMakePath
	ldr	r0, [sp, #60]
	mov	r1, #9
	ldr	r2, [sp, #52]
	ldr	r3, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #64
	bl	FSUSER_OpenArchive
	cmp	r0, #0
	beq	.LBB1_6
	mov	r1, r0
	ldr	r0, .LCPI1_8
	bl	printf
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	ldr	r0, .LCPI1_7
	mov	r1, #1
	bl	svcSleepThread
	bl	fsExit
.LBB1_4:
	bl	gfxExit
.LBB1_5:
	mov	r0, r4
	add	sp, sp, #104
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
.LBB1_6:
	ldr	r2, .LCPI1_9
	add	r0, sp, #40
	mov	r6, #0
	mov	r1, #3
	str	r6, [sp, #48]
	str	r6, [sp, #44]
	str	r6, [sp, #40]
	bl	fsMakePath
	add	r7, sp, #40
	ldr	r0, [sp, #64]
	ldr	r1, [sp, #68]
	ldm	r7, {r2, r3, r7}
	str	r7, [sp]
	str	r6, [sp, #4]
	bl	FSUSER_CreateDirectory
	add	r0, sp, #92
	mov	r1, #1
	mov	r2, #0
	str	r6, [sp, #24]
	str	r6, [sp, #28]
	mov	r8, #1
	str	r6, [sp, #32]
	str	r6, [sp, #36]
	str	r6, [sp, #92]
	str	r6, [sp, #96]
	str	r6, [sp, #100]
	bl	fsMakePath
	add	r7, sp, #92
	ldr	r2, .LCPI1_10
	add	r0, sp, #80
	mov	r1, #3
	ldm	r7, {r4, r5, r7}
	str	r6, [sp, #80]
	str	r6, [sp, #84]
	str	r6, [sp, #88]
	bl	fsMakePath
	add	r2, sp, #80
	mov	r3, r5
	str	r6, [sp, #76]
	ldm	r2, {r0, r1, r2}
	str	r7, [sp]
	stmib	sp, {r0, r1, r2, r8}
	add	r0, sp, #76
	mov	r1, #9
	mov	r2, r4
	str	r6, [sp, #20]
	bl	FSUSER_OpenFileDirectly
	ldr	r5, .LCPI1_11
	cmp	r0, #0
	bne	.LBB1_9
	mov	r1, #16
	ldr	r0, [sp, #76]
	add	r2, sp, #24
	str	r1, [sp, #4]
	add	r1, sp, #72
	str	r2, [sp]
	mov	r2, #0
	mov	r3, #0
	str	r6, [sp, #72]
	bl	FSFILE_Read
	mov	r4, r0
	ldr	r0, [sp, #76]
	bl	FSFILE_Close
	cmp	r4, #0
	bne	.LBB1_9
	ldr	r0, [sp, #72]
	cmp	r0, #16
	ldreq	r0, [sp, #24]
	cmpeq	r0, r5
	beq	.LBB1_18
.LBB1_9:
	mov	r0, #0
	mov	r4, #1
	mov	r1, #0
	str	r0, [sp, #32]
	str	r5, [sp, #24]
.LBB1_10:
	add	r1, r1, #1
	str	r1, [sp, #28]
	eor	r0, r0, r1
	ldr	r1, [sp, #68]
	eor	r0, r0, r5
	str	r0, [sp, #36]
	ldr	r0, [sp, #64]
	add	r2, sp, #24
	bl	"save_data_example::write_save"
	ldr	r1, .LCPI1_12
	tst	r0, #255
	ldr	r2, .LCPI1_13
	ldr	r0, .LCPI1_15
	moveq	r2, r1
	ldr	r1, .LCPI1_14
	cmp	r4, #0
	moveq	r1, r2
	bl	printf
	ldr	r1, [sp, #28]
	ldr	r0, .LCPI1_16
	bl	printf
	ldr	r1, [sp, #32]
	ldr	r0, .LCPI1_17
	bl	printf
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB1_17
	ldr	r8, .LCPI1_18
	add	r9, sp, #24
	ldr	r4, .LCPI1_19
	ldr	r5, .LCPI1_15
	ldr	r6, .LCPI1_16
	ldr	r7, .LCPI1_17
	b	.LBB1_13
.LBB1_12:
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	mov	r0, #2
	mov	r1, #1
	bl	gspWaitForEvent
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB1_17
.LBB1_13:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB1_16
	tst	r0, #1
	beq	.LBB1_12
	add	r2, sp, #24
	ldm	r2, {r0, r1, r2}
	eor	r0, r0, r1
	add	r1, r2, #10
	eor	r0, r0, r1
	str	r1, [sp, #32]
	str	r0, [sp, #36]
	mov	r2, r9
	ldr	r0, [sp, #64]
	ldr	r1, [sp, #68]
	bl	"save_data_example::write_save"
	tst	r0, #255
	mov	r1, r4
	moveq	r1, r8
	mov	r0, r5
	bl	printf
	ldr	r1, [sp, #28]
	mov	r0, r6
	bl	printf
	ldr	r1, [sp, #32]
	mov	r0, r7
	bl	printf
	b	.LBB1_12
.LBB1_16:
	add	r2, sp, #24
	ldm	r2, {r0, r1, r2}
	eor	r0, r1, r0
	ldr	r1, [sp, #68]
	eor	r0, r0, r2
	str	r0, [sp, #36]
	ldr	r0, [sp, #64]
	add	r2, sp, #24
	bl	"save_data_example::write_save"
.LBB1_17:
	ldr	r0, [sp, #64]
	ldr	r1, [sp, #68]
	bl	FSUSER_CloseArchive
	bl	fsExit
	bl	gfxExit
	mov	r4, #0
	b	.LBB1_5
.LBB1_18:
	ldr	r1, [sp, #28]
	mov	r4, #0
	ldr	r2, [sp, #36]
	ldr	r0, [sp, #32]
	eor	r2, r1, r2
	eor	r2, r2, r0
	cmp	r2, r5
	bne	.LBB1_9
	b	.LBB1_10
	.p2align	2
.LCPI1_0:
	.long	".Lcsbs$SaveData-Example$17"
.LCPI1_1:
	.long	".Lcsbs$SaveData-Example$18"
.LCPI1_2:
	.long	".Lcsbs$SaveData-Example$19"
.LCPI1_3:
	.long	".Lcsbs$SaveData-Example$1a"
.LCPI1_4:
	.long	".Lcsbs$SaveData-Example$1b"
.LCPI1_5:
	.long	".Lcsbs$SaveData-Example$1c"
.LCPI1_6:
	.long	.Lstr
.LCPI1_7:
	.long	705032704
.LCPI1_8:
	.long	".Lcsbs$SaveData-Example$1e"
.LCPI1_9:
	.long	".Lcsbs$SaveData-Example$1"
.LCPI1_10:
	.long	".Lcsbs$SaveData-Example$2"
.LCPI1_11:
	.long	1396790853
.LCPI1_12:
	.long	".Lcsbs$SaveData-Example$21"
.LCPI1_13:
	.long	".Lcsbs$SaveData-Example$20"
.LCPI1_14:
	.long	".Lcsbs$SaveData-Example$1f"
.LCPI1_15:
	.long	".Lcsbs$SaveData-Example$14"
.LCPI1_16:
	.long	".Lcsbs$SaveData-Example$15"
.LCPI1_17:
	.long	".Lcsbs$SaveData-Example$16"
.LCPI1_18:
	.long	".Lcsbs$SaveData-Example$23"
.LCPI1_19:
	.long	".Lcsbs$SaveData-Example$22"
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

	.type	".Lcsbs$SaveData-Example$1",%object
	.section	.rodata,"a",%progbits
".Lcsbs$SaveData-Example$1":
	.asciz	"/3ds/SaveData-Example"
	.size	".Lcsbs$SaveData-Example$1", 22

	.type	".Lcsbs$SaveData-Example$2",%object
".Lcsbs$SaveData-Example$2":
	.asciz	"/3ds/SaveData-Example/save.bin"
	.size	".Lcsbs$SaveData-Example$2", 31

	.type	"runtime::default_random_generator_proc-.state-4862",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-4862"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-4862":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-4862", 1032

	.type	".Lcsbs$SaveData-Example$10",%object
	.section	.rodata,"a",%progbits
".Lcsbs$SaveData-Example$10":
	.asciz	"  [write] OpenFileDirectly rc=0x%08lX\n"
	.size	".Lcsbs$SaveData-Example$10", 39

	.type	".Lcsbs$SaveData-Example$11",%object
".Lcsbs$SaveData-Example$11":
	.asciz	"  [write] Write rc=0x%08lX wrote=%u\n"
	.size	".Lcsbs$SaveData-Example$11", 37

	.type	".Lcsbs$SaveData-Example$14",%object
".Lcsbs$SaveData-Example$14":
	.asciz	"\033[8;1H  Status:     %s\033[K"
	.size	".Lcsbs$SaveData-Example$14", 26

	.type	".Lcsbs$SaveData-Example$15",%object
".Lcsbs$SaveData-Example$15":
	.asciz	"\033[9;1H  Play count: %u\033[K"
	.size	".Lcsbs$SaveData-Example$15", 26

	.type	".Lcsbs$SaveData-Example$16",%object
".Lcsbs$SaveData-Example$16":
	.asciz	"\033[10;1H  High score: %u\033[K"
	.size	".Lcsbs$SaveData-Example$16", 27

	.type	".Lcsbs$SaveData-Example$17",%object
".Lcsbs$SaveData-Example$17":
	.asciz	"\033[2J"
	.size	".Lcsbs$SaveData-Example$17", 5

	.type	".Lcsbs$SaveData-Example$18",%object
".Lcsbs$SaveData-Example$18":
	.asciz	"\033[1;1H=== SaveData-Example ==="
	.size	".Lcsbs$SaveData-Example$18", 31

	.type	".Lcsbs$SaveData-Example$19",%object
".Lcsbs$SaveData-Example$19":
	.asciz	"\033[3;1HFile: SD:/3ds/SaveData-Example/save.bin"
	.size	".Lcsbs$SaveData-Example$19", 46

	.type	".Lcsbs$SaveData-Example$1a",%object
".Lcsbs$SaveData-Example$1a":
	.asciz	"\033[5;1HSave data:"
	.size	".Lcsbs$SaveData-Example$1a", 17

	.type	".Lcsbs$SaveData-Example$1b",%object
".Lcsbs$SaveData-Example$1b":
	.asciz	"\033[27;1H[A] High score +10 and save"
	.size	".Lcsbs$SaveData-Example$1b", 35

	.type	".Lcsbs$SaveData-Example$1c",%object
".Lcsbs$SaveData-Example$1c":
	.asciz	"\033[28;1H[Start] Save and exit"
	.size	".Lcsbs$SaveData-Example$1c", 29

	.type	".Lcsbs$SaveData-Example$1e",%object
".Lcsbs$SaveData-Example$1e":
	.asciz	"\033[13;1HERROR: could not open SDMC archive (rc=%d)\n"
	.size	".Lcsbs$SaveData-Example$1e", 51

	.type	".Lcsbs$SaveData-Example$1f",%object
".Lcsbs$SaveData-Example$1f":
	.asciz	"New save created"
	.size	".Lcsbs$SaveData-Example$1f", 17

	.type	".Lcsbs$SaveData-Example$20",%object
".Lcsbs$SaveData-Example$20":
	.asciz	"Loaded + updated"
	.size	".Lcsbs$SaveData-Example$20", 17

	.type	".Lcsbs$SaveData-Example$21",%object
".Lcsbs$SaveData-Example$21":
	.asciz	"Load OK, write failed"
	.size	".Lcsbs$SaveData-Example$21", 22

	.type	".Lcsbs$SaveData-Example$22",%object
".Lcsbs$SaveData-Example$22":
	.asciz	"Score saved!"
	.size	".Lcsbs$SaveData-Example$22", 13

	.type	".Lcsbs$SaveData-Example$23",%object
".Lcsbs$SaveData-Example$23":
	.asciz	"Write FAILED!"
	.size	".Lcsbs$SaveData-Example$23", 14

	.type	.Lstr,%object
	.section	.rodata.str1.1,"aMS",%progbits,1
.Lstr:
	.asciz	"\033[13;1HERROR: fsInit failed"
	.size	.Lstr, 28

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
