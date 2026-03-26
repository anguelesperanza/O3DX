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
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, sp, #20
	bl	gfxInitDefault
	mov	r0, #0
	mov	r1, #0
	mov	r6, #0
	bl	consoleInit
	ldr	r0, .LCPI0_0
	bl	printf
	ldr	r0, .LCPI0_1
	bl	printf
	ldr	r0, .LCPI0_2
	bl	printf
	ldr	r0, .LCPI0_3
	bl	printf
	ldr	r0, .LCPI0_4
	bl	printf
	ldr	r0, .LCPI0_5
	bl	printf
	mov	r1, #237
	ldr	r0, .LCPI0_6
	orr	r1, r1, #256
	bl	mkdir
	ldr	r0, .LCPI0_7
	ldr	r1, .LCPI0_8
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	bl	fopen
	ldr	r8, .LCPI0_9
	cmp	r0, #0
	beq	.LBB0_2
	mov	r4, r0
	add	r0, sp, #4
	mov	r1, #1
	mov	r2, #16
	mov	r3, r4
	bl	fread
	mov	r5, r0
	mov	r0, r4
	bl	fclose
	cmp	r5, #16
	ldreq	r0, [sp, #4]
	cmpeq	r0, r8
	beq	.LBB0_19
.LBB0_2:
	mov	r7, #1
	mov	r0, #0
	mov	r1, #0
	str	r6, [sp, #12]
	str	r8, [sp, #4]
.LBB0_3:
	add	r1, r1, #1
	str	r1, [sp, #8]
	eor	r0, r0, r1
	ldr	r1, .LCPI0_10
	eor	r0, r0, r8
	str	r0, [sp, #16]
	ldr	r0, .LCPI0_7
	bl	fopen
	cmp	r0, #0
	beq	.LBB0_6
	mov	r4, r0
	add	r0, sp, #4
	mov	r1, #1
	mov	r2, #16
	mov	r3, r4
	bl	fwrite
	mov	r5, r0
	mov	r0, r4
	bl	fclose
	cmp	r5, #16
	bne	.LBB0_6
	ldr	r0, .LCPI0_11
	b	.LBB0_7
.LBB0_6:
	ldr	r0, .LCPI0_12
.LBB0_7:
	ldr	r1, .LCPI0_13
	cmp	r7, #0
	moveq	r1, r0
	ldr	r0, .LCPI0_14
	bl	printf
	ldr	r5, [sp, #8]
	ldr	r0, .LCPI0_15
	mov	r1, r5
	bl	printf
	ldr	r6, [sp, #12]
	ldr	r0, .LCPI0_16
	mov	r1, r6
	bl	printf
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_18
	ldr	r8, .LCPI0_7
	ldr	r10, .LCPI0_10
	ldr	r9, .LCPI0_18
	ldr	r11, .LCPI0_14
	ldr	r7, .LCPI0_15
	ldr	r4, .LCPI0_16
	b	.LBB0_12
.LBB0_9:
	mov	r1, r9
.LBB0_10:
	mov	r0, r11
	bl	printf
	ldr	r5, [sp, #8]
	mov	r0, r7
	mov	r1, r5
	bl	printf
	ldr	r6, [sp, #12]
	mov	r0, r4
	mov	r1, r6
	bl	printf
.LBB0_11:
	bl	gfxFlushBuffers
	bl	gfxSwapBuffers
	mov	r0, #2
	mov	r1, #1
	bl	gspWaitForEvent
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_18
.LBB0_12:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_16
	tst	r0, #1
	beq	.LBB0_11
	ldr	r0, [sp, #4]
	add	r1, r6, #10
	str	r1, [sp, #12]
	eor	r0, r0, r5
	eor	r0, r0, r1
	str	r0, [sp, #16]
	mov	r0, r8
	mov	r1, r10
	bl	fopen
	cmp	r0, #0
	beq	.LBB0_9
	mov	r5, r0
	add	r0, sp, #4
	mov	r1, #1
	mov	r2, #16
	mov	r3, r5
	bl	fwrite
	mov	r6, r0
	mov	r0, r5
	bl	fclose
	cmp	r6, #16
	ldr	r1, .LCPI0_17
	movne	r1, r9
	b	.LBB0_10
.LBB0_16:
	ldr	r0, [sp, #4]
	ldr	r1, .LCPI0_10
	eor	r0, r5, r0
	eor	r0, r0, r6
	str	r0, [sp, #16]
	ldr	r0, .LCPI0_7
	bl	fopen
	cmp	r0, #0
	beq	.LBB0_18
	mov	r4, r0
	add	r0, sp, #4
	mov	r1, #1
	mov	r2, #16
	mov	r3, r4
	bl	fwrite
	mov	r0, r4
	bl	fclose
.LBB0_18:
	bl	gfxExit
	mov	r0, #0
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB0_19:
	ldr	r1, [sp, #8]
	mov	r7, #0
	ldr	r2, [sp, #16]
	ldr	r0, [sp, #12]
	eor	r2, r1, r2
	eor	r2, r2, r0
	cmp	r2, r8
	bne	.LBB0_2
	b	.LBB0_3
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$SaveData-Example$15"
.LCPI0_1:
	.long	".Lcsbs$SaveData-Example$16"
.LCPI0_2:
	.long	".Lcsbs$SaveData-Example$17"
.LCPI0_3:
	.long	".Lcsbs$SaveData-Example$18"
.LCPI0_4:
	.long	".Lcsbs$SaveData-Example$19"
.LCPI0_5:
	.long	".Lcsbs$SaveData-Example$1a"
.LCPI0_6:
	.long	".Lcsbs$SaveData-Example$1"
.LCPI0_7:
	.long	".Lcsbs$SaveData-Example$2"
.LCPI0_8:
	.long	".Lcsbs$SaveData-Example$11"
.LCPI0_9:
	.long	1396790853
.LCPI0_10:
	.long	".Lcsbs$SaveData-Example$b"
.LCPI0_11:
	.long	".Lcsbs$SaveData-Example$1c"
.LCPI0_12:
	.long	".Lcsbs$SaveData-Example$1d"
.LCPI0_13:
	.long	".Lcsbs$SaveData-Example$1b"
.LCPI0_14:
	.long	".Lcsbs$SaveData-Example$12"
.LCPI0_15:
	.long	".Lcsbs$SaveData-Example$13"
.LCPI0_16:
	.long	".Lcsbs$SaveData-Example$14"
.LCPI0_17:
	.long	".Lcsbs$SaveData-Example$1e"
.LCPI0_18:
	.long	".Lcsbs$SaveData-Example$1f"
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

	.type	".Lcsbs$SaveData-Example$1",%object
	.section	.rodata,"a",%progbits
".Lcsbs$SaveData-Example$1":
	.asciz	"sdmc:/3ds/SaveData-Example"
	.size	".Lcsbs$SaveData-Example$1", 27

	.type	".Lcsbs$SaveData-Example$2",%object
".Lcsbs$SaveData-Example$2":
	.asciz	"sdmc:/3ds/SaveData-Example/save.bin"
	.size	".Lcsbs$SaveData-Example$2", 36

	.type	".Lcsbs$SaveData-Example$b",%object
".Lcsbs$SaveData-Example$b":
	.asciz	"wb"
	.size	".Lcsbs$SaveData-Example$b", 3

	.type	"runtime::default_random_generator_proc-.state-4878",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-4878"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-4878":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-4878", 1032

	.type	".Lcsbs$SaveData-Example$11",%object
	.section	.rodata,"a",%progbits
".Lcsbs$SaveData-Example$11":
	.asciz	"rb"
	.size	".Lcsbs$SaveData-Example$11", 3

	.type	".Lcsbs$SaveData-Example$12",%object
".Lcsbs$SaveData-Example$12":
	.asciz	"\033[8;1H  Status:     %s\033[K"
	.size	".Lcsbs$SaveData-Example$12", 26

	.type	".Lcsbs$SaveData-Example$13",%object
".Lcsbs$SaveData-Example$13":
	.asciz	"\033[9;1H  Play count: %u\033[K"
	.size	".Lcsbs$SaveData-Example$13", 26

	.type	".Lcsbs$SaveData-Example$14",%object
".Lcsbs$SaveData-Example$14":
	.asciz	"\033[10;1H  High score: %u\033[K"
	.size	".Lcsbs$SaveData-Example$14", 27

	.type	".Lcsbs$SaveData-Example$15",%object
".Lcsbs$SaveData-Example$15":
	.asciz	"\033[2J"
	.size	".Lcsbs$SaveData-Example$15", 5

	.type	".Lcsbs$SaveData-Example$16",%object
".Lcsbs$SaveData-Example$16":
	.asciz	"\033[1;1H=== SaveData-Example ==="
	.size	".Lcsbs$SaveData-Example$16", 31

	.type	".Lcsbs$SaveData-Example$17",%object
".Lcsbs$SaveData-Example$17":
	.asciz	"\033[3;1HFile: sdmc:/3ds/SaveData-Example/save.bin"
	.size	".Lcsbs$SaveData-Example$17", 48

	.type	".Lcsbs$SaveData-Example$18",%object
".Lcsbs$SaveData-Example$18":
	.asciz	"\033[5;1HSave data:"
	.size	".Lcsbs$SaveData-Example$18", 17

	.type	".Lcsbs$SaveData-Example$19",%object
".Lcsbs$SaveData-Example$19":
	.asciz	"\033[27;1H[A] High score +10 and save"
	.size	".Lcsbs$SaveData-Example$19", 35

	.type	".Lcsbs$SaveData-Example$1a",%object
".Lcsbs$SaveData-Example$1a":
	.asciz	"\033[28;1H[Start] Save and exit"
	.size	".Lcsbs$SaveData-Example$1a", 29

	.type	".Lcsbs$SaveData-Example$1b",%object
".Lcsbs$SaveData-Example$1b":
	.asciz	"New save created"
	.size	".Lcsbs$SaveData-Example$1b", 17

	.type	".Lcsbs$SaveData-Example$1c",%object
".Lcsbs$SaveData-Example$1c":
	.asciz	"Loaded + updated"
	.size	".Lcsbs$SaveData-Example$1c", 17

	.type	".Lcsbs$SaveData-Example$1d",%object
".Lcsbs$SaveData-Example$1d":
	.asciz	"Load OK, write failed"
	.size	".Lcsbs$SaveData-Example$1d", 22

	.type	".Lcsbs$SaveData-Example$1e",%object
".Lcsbs$SaveData-Example$1e":
	.asciz	"Score saved!"
	.size	".Lcsbs$SaveData-Example$1e", 13

	.type	".Lcsbs$SaveData-Example$1f",%object
".Lcsbs$SaveData-Example$1f":
	.asciz	"Write FAILED!"
	.size	".Lcsbs$SaveData-Example$1f", 14

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
