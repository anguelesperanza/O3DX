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
	.file	"Triangle-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#100
	sub	sp, sp, #100
	bl	romfs_init
	mov	r4, r0
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #1
	mov	r1, #0
	mov	r8, #0
	bl	consoleInit
	ldr	r0, .LCPI0_0
	mov	r1, r4
	bl	printf
	mov	r0, #240
	mov	r1, #400
	mov	r2, #0
	mov	r3, #3
	bl	C3D_RenderTargetCreate
	mov	r1, #0
	mov	r2, #0
	mov	r3, #4096
	mov	r4, r0
	bl	C3D_RenderTargetSetOutput
	ldr	r0, .LCPI0_1
	ldr	r1, .LCPI0_2
	bl	fopen
	mov	r1, #0
	mov	r2, #2
	mov	r5, r0
	bl	fseek
	mov	r0, r5
	bl	ftell
	mov	r6, r0
	mov	r0, r5
	mov	r1, #0
	mov	r2, #0
	bl	fseek
	mov	r0, r6
	bl	malloc
	mov	r1, #1
	mov	r2, r6
	mov	r3, r5
	mov	r7, r0
	bl	fread
	mov	r0, r5
	bl	fclose
	ldr	r0, .LCPI0_3
	mov	r1, r6
	bl	printf
	mov	r0, r7
	mov	r1, r6
	str	r7, [sp, #12]
	bl	DVLB_ParseFile
	add	r5, sp, #80
	mov	r6, r0
	str	r8, [sp, #80]
	mov	r0, r5
	str	r8, [sp, #84]
	str	r8, [sp, #88]
	str	r8, [sp, #92]
	str	r8, [sp, #96]
	bl	shaderProgramInit
	ldr	r1, [r6, #20]
	mov	r0, r5
	str	r6, [sp, #8]
	bl	shaderProgramSetVsh
	mov	r0, r5
	bl	C3D_BindProgram
	ldr	r0, [sp, #80]
	ldr	r1, .LCPI0_4
	bl	shaderInstanceGetUniformLocation
	lsl	r0, r0, #24
	asr	r11, r0, #24
	ldr	r0, .LCPI0_5
	mov	r1, r11
	bl	printf
	bl	C3D_GetAttrInfo
	mov	r5, r0
	bl	AttrInfo_Init
	mov	r0, r5
	mov	r1, #0
	mov	r2, #3
	mov	r3, #3
	bl	AttrInfo_AddLoader
	mov	r0, r5
	mov	r1, #1
	mov	r2, #3
	mov	r3, #4
	bl	AttrInfo_AddLoader
	mov	r0, #84
	bl	linearAlloc
	ldr	r1, .LCPI0_6
	mov	r2, #84
	mov	r10, r0
	bl	memcpy
	bl	C3D_GetBufInfo
	mov	r5, r0
	bl	BufInfo_Init
	mov	r0, #16
	mov	r1, r10
	stm	sp, {r0, r8}
	mov	r0, r5
	mov	r2, #28
	mov	r3, #2
	bl	BufInfo_Add
	mov	r0, #0
	bl	C3D_GetTexEnv
	mov	r5, r0
	bl	c3d_tex_env_init
	mov	r0, r5
	mov	r1, #3
	mov	r2, #0
	mov	r3, #0
	str	r8, [sp]
	bl	c3d_tex_env_src
	mov	r0, r5
	mov	r1, #3
	mov	r2, #0
	bl	c3d_tex_env_func
	mov	r1, #1065353216
	mov	r0, #1065353216
	orr	r1, r1, #-2147483648
	str	r1, [sp, #48]
	ldr	r1, .LCPI0_7
	mov	r2, #0
	str	r0, [sp, #64]
	str	r0, [sp, #52]
	str	r0, [sp, #32]
	str	r0, [sp, #16]
	ldr	r0, .LCPI0_9
	str	r1, [sp, #44]
	ldr	r1, .LCPI0_8
	str	r1, [sp, #24]
	mov	r1, #1065353216
	str	r8, [sp, #76]
	str	r8, [sp, #72]
	str	r8, [sp, #68]
	str	r8, [sp, #60]
	str	r8, [sp, #56]
	str	r8, [sp, #40]
	str	r8, [sp, #36]
	str	r8, [sp, #28]
	str	r8, [sp, #20]
	bl	printf
	mov	r0, #0
	mov	r1, #1
	mov	r2, #31
	bl	C3D_DepthTest
	mov	r0, #0
	bl	C3D_CullFace
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_4
	ldr	r5, .LCPI0_10
	add	r9, sp, #16
	ldr	r6, .LCPI0_11
	ldr	r7, .LCPI0_12
	ldr	r8, .LCPI0_13
.LBB0_2:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_4
	mov	r0, r5
	bl	printf
	mov	r0, r6
	bl	printf
	mov	r0, r7
	bl	printf
	mov	r0, #1
	bl	C3D_FrameBegin
	mov	r0, r4
	mov	r1, #3
	mov	r2, r8
	mov	r3, #0
	bl	c3d_render_target_clear
	mov	r0, r4
	bl	C3D_FrameDrawOn
	mov	r0, #0
	mov	r1, r11
	mov	r2, r9
	bl	c3d_fvunif_mtx4x4
	mov	r0, #0
	mov	r1, #0
	mov	r2, #3
	bl	C3D_DrawArrays
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	bne	.LBB0_2
.LBB0_4:
	mov	r0, r10
	bl	linearFree
	add	r0, sp, #80
	bl	shaderProgramFree
	ldr	r0, [sp, #8]
	bl	DVLB_Free
	ldr	r0, [sp, #12]
	bl	free
	bl	C3D_Fini
	bl	gfxExit
	bl	romfs_exit
	mov	r0, #0
	add	sp, sp, #100
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$Triangle-Example$9"
.LCPI0_1:
	.long	".Lcsbs$Triangle-Example$a"
.LCPI0_2:
	.long	".Lcsbs$Triangle-Example$b"
.LCPI0_3:
	.long	".Lcsbs$Triangle-Example$c"
.LCPI0_4:
	.long	".Lcsbs$Triangle-Example$d"
.LCPI0_5:
	.long	".Lcsbs$Triangle-Example$e"
.LCPI0_6:
	.long	"triangle_example::vertex_list"
.LCPI0_7:
	.long	3148076810
.LCPI0_8:
	.long	3154675849
.LCPI0_9:
	.long	".Lcsbs$Triangle-Example$f"
.LCPI0_10:
	.long	".Lcsbs$Triangle-Example$10"
.LCPI0_11:
	.long	".Lcsbs$Triangle-Example$11"
.LCPI0_12:
	.long	".Lcsbs$Triangle-Example$12"
.LCPI0_13:
	.long	437923583
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

	.type	"triangle_example::vertex_list",%object
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
"triangle_example::vertex_list":
	.long	0x43480000
	.long	0x41a00000
	.long	0x3f000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x41a00000
	.long	0x435c0000
	.long	0x3f000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x43be0000
	.long	0x435c0000
	.long	0x3f000000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.size	"triangle_example::vertex_list", 84

	.type	".Lcsbs$Triangle-Example$9",%object
".Lcsbs$Triangle-Example$9":
	.asciz	"\033[5;1HromfsInit rc: 0x%08lX"
	.size	".Lcsbs$Triangle-Example$9", 28

	.type	".Lcsbs$Triangle-Example$a",%object
".Lcsbs$Triangle-Example$a":
	.asciz	"romfs:/vshader.shbin"
	.size	".Lcsbs$Triangle-Example$a", 21

	.type	".Lcsbs$Triangle-Example$b",%object
".Lcsbs$Triangle-Example$b":
	.asciz	"rb"
	.size	".Lcsbs$Triangle-Example$b", 3

	.type	".Lcsbs$Triangle-Example$c",%object
".Lcsbs$Triangle-Example$c":
	.asciz	"\033[3;1Hsh_size: %d    "
	.size	".Lcsbs$Triangle-Example$c", 22

	.type	".Lcsbs$Triangle-Example$d",%object
".Lcsbs$Triangle-Example$d":
	.asciz	"projection"
	.size	".Lcsbs$Triangle-Example$d", 11

	.type	".Lcsbs$Triangle-Example$e",%object
".Lcsbs$Triangle-Example$e":
	.asciz	"\033[6;1Huloc_proj: %d    "
	.size	".Lcsbs$Triangle-Example$e", 24

	.type	".Lcsbs$Triangle-Example$f",%object
".Lcsbs$Triangle-Example$f":
	.asciz	"\033[7;1Hm[0]=%08X %08X"
	.size	".Lcsbs$Triangle-Example$f", 21

	.type	".Lcsbs$Triangle-Example$10",%object
".Lcsbs$Triangle-Example$10":
	.asciz	"\033[1;1HTriangle Example"
	.size	".Lcsbs$Triangle-Example$10", 23

	.type	".Lcsbs$Triangle-Example$11",%object
".Lcsbs$Triangle-Example$11":
	.asciz	"\033[2;1HPress START to exit"
	.size	".Lcsbs$Triangle-Example$11", 26

	.type	".Lcsbs$Triangle-Example$12",%object
".Lcsbs$Triangle-Example$12":
	.asciz	"\033[4;1HCitro3D phase 5 demo"
	.size	".Lcsbs$Triangle-Example$12", 27

	.type	"runtime::default_random_generator_proc-.state-8192",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-8192"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-8192":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-8192", 1032

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
