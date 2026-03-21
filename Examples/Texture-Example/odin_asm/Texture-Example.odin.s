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
	.file	"Texture-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#148
	sub	sp, sp, #148
	bl	romfs_init
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #1
	mov	r1, #0
	mov	r5, #0
	bl	consoleInit
	mov	r0, #240
	mov	r1, #400
	mov	r2, #0
	mov	r3, #3
	bl	C3D_RenderTargetCreate
	mov	r1, #0
	mov	r2, #0
	mov	r3, #4096
	str	r0, [sp, #32]
	bl	C3D_RenderTargetSetOutput
	ldr	r0, .LCPI0_0
	ldr	r1, .LCPI0_1
	bl	fopen
	mov	r1, #0
	mov	r2, #2
	mov	r4, r0
	bl	fseek
	mov	r0, r4
	bl	ftell
	mov	r7, r0
	mov	r0, r4
	mov	r1, #0
	mov	r2, #0
	bl	fseek
	mov	r0, r7
	bl	malloc
	mov	r1, #1
	mov	r2, r7
	mov	r3, r4
	mov	r6, r0
	bl	fread
	mov	r0, r4
	bl	fclose
	mov	r0, r6
	mov	r1, r7
	str	r6, [sp, #28]
	bl	DVLB_ParseFile
	add	r4, sp, #128
	mov	r6, r0
	str	r5, [sp, #128]
	mov	r0, r4
	str	r5, [sp, #132]
	str	r5, [sp, #136]
	str	r5, [sp, #140]
	str	r5, [sp, #144]
	bl	shaderProgramInit
	ldr	r1, [r6, #20]
	mov	r0, r4
	str	r6, [sp, #24]
	bl	shaderProgramSetVsh
	mov	r0, r4
	bl	C3D_BindProgram
	ldr	r0, [sp, #128]
	ldr	r1, .LCPI0_2
	bl	shaderInstanceGetUniformLocation
	str	r0, [sp, #12]
	bl	C3D_GetAttrInfo
	mov	r4, r0
	bl	AttrInfo_Init
	mov	r0, r4
	mov	r1, #0
	mov	r2, #3
	mov	r3, #3
	bl	AttrInfo_AddLoader
	mov	r0, r4
	mov	r1, #1
	mov	r2, #3
	mov	r3, #2
	bl	AttrInfo_AddLoader
	mov	r0, #120
	bl	linearAlloc
	ldr	r1, .LCPI0_3
	mov	r2, #120
	mov	r4, r0
	bl	memcpy
	bl	C3D_GetBufInfo
	mov	r6, r0
	bl	BufInfo_Init
	mov	r0, #16
	mov	r1, r4
	stm	sp, {r0, r5}
	mov	r0, r6
	mov	r2, #20
	mov	r3, #2
	str	r4, [sp, #20]
	bl	BufInfo_Add
	add	r4, sp, #104
	mov	r1, #64
	mov	r2, #64
	mov	r3, #0
	mov	r0, r4
	str	r5, [sp, #104]
	str	r5, [sp, #108]
	str	r5, [sp, #112]
	str	r5, [sp, #116]
	str	r5, [sp, #120]
	str	r5, [sp, #124]
	bl	c3d_tex_init
	add	r0, sp, #40
	add	r0, r0, #4
	str	r0, [sp, #16]
	mov	r0, r4
	bl	c3d_tex2d_get_image_ptr
	str	r0, [sp, #36]
	b	.LBB0_2
.LBB0_1:
	add	r5, r5, #1
	cmp	r5, #64
	beq	.LBB0_11
.LBB0_2:
	mov	r1, #8
	and	r2, r5, #1
	and	r1, r1, r5, lsl #2
	and	lr, r5, #56
	orr	r1, r1, r2, lsl #1
	and	r2, r5, #4
	mov	r4, #0
	mov	r7, #0
	orr	r0, r1, r2, lsl #3
	mov	r1, #0
	mov	r12, r5
	b	.LBB0_5
.LBB0_3:
	cmp	r5, #31
	mov	r2, #0
	movhi	r2, #1
	cmp	r1, #32
	mov	r6, #0
	movlo	r6, #1
	and	r2, r6, r2
	rsb	r9, r2, #0
	sub	r2, r2, #1
	mov	r11, r2
.LBB0_4:
	and	r10, r1, #1
	and	r5, r7, #4
	orr	r3, r0, r10
	add	r8, lr, r1, lsr #3
	orr	r3, r3, r5
	and	r5, r4, #16
	orr	r3, r3, r5
	ldr	r5, [sp, #36]
	mov	r6, #255
	add	r1, r1, #1
	lsl	r3, r3, #2
	add	r4, r4, #4
	orr	r3, r3, r8, lsl #8
	add	r7, r7, #2
	cmp	r1, #64
	strb	r6, [r5, r3]!
	strb	r9, [r5, #1]
	strb	r11, [r5, #2]
	strb	r2, [r5, #3]
	mov	r5, r12
	beq	.LBB0_1
.LBB0_5:
	cmp	r1, #31
	cmpls	r5, #32
	blo	.LBB0_9
	cmp	r1, #32
	blo	.LBB0_3
	cmp	r5, #32
	bhs	.LBB0_3
	mov	r11, #255
	mov	r2, #0
	b	.LBB0_10
.LBB0_9:
	mov	r11, #0
	mov	r2, #255
.LBB0_10:
	mov	r9, #0
	b	.LBB0_4
.LBB0_11:
	add	r5, sp, #104
	mov	r0, r5
	bl	C3D_TexFlush
	mov	r0, r5
	mov	r1, #1
	mov	r2, #1
	bl	c3d_tex_set_filter
	mov	r0, r5
	mov	r1, #0
	mov	r2, #0
	mov	r4, #0
	bl	c3d_tex_set_wrap
	mov	r0, #0
	bl	C3D_GetTexEnv
	mov	r5, r0
	bl	c3d_tex_env_init
	mov	r0, #3
	mov	r1, #3
	str	r0, [sp]
	mov	r0, r5
	mov	r2, #3
	mov	r3, #3
	bl	c3d_tex_env_src
	mov	r0, r5
	mov	r1, #3
	mov	r2, #0
	bl	c3d_tex_env_func
	ldr	r7, [sp, #16]
	mov	r1, #1065353216
	mov	r0, #1065353216
	orr	r1, r1, #-2147483648
	ldr	r2, .LCPI0_4
	ldr	r3, .LCPI0_5
	str	r2, [r7, #24]
	mov	r2, #31
	str	r1, [r7, #28]
	mov	r1, #1
	str	r0, [r7, #32]
	str	r0, [r7, #44]
	str	r0, [r7, #12]
	str	r0, [sp, #40]
	mov	r0, #0
	str	r4, [r7, #36]
	str	r4, [r7, #40]
	str	r4, [r7, #48]
	str	r4, [r7, #52]
	str	r4, [r7, #56]
	str	r4, [r7]
	stmib	r7, {r3, r4}
	str	r4, [r7, #16]
	str	r4, [r7, #20]
	bl	C3D_DepthTest
	mov	r0, #0
	bl	C3D_CullFace
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_15
	ldr	r0, [sp, #12]
	add	r10, sp, #104
	ldr	r8, .LCPI0_6
	add	r11, sp, #40
	ldr	r7, .LCPI0_7
	ldr	r4, .LCPI0_8
	lsl	r0, r0, #24
	ldr	r9, .LCPI0_9
	asr	r6, r0, #24
	ldr	r5, [sp, #32]
.LBB0_13:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_15
	mov	r0, r8
	bl	printf
	mov	r0, r7
	bl	printf
	mov	r0, r4
	bl	printf
	mov	r0, #1
	bl	C3D_FrameBegin
	mov	r0, r5
	mov	r1, #3
	mov	r2, r9
	mov	r3, #0
	bl	c3d_render_target_clear
	mov	r0, r5
	bl	C3D_FrameDrawOn
	mov	r0, #0
	mov	r1, r10
	bl	C3D_TexBind
	mov	r0, #0
	mov	r1, r6
	mov	r2, r11
	bl	c3d_fvunif_mtx4x4
	mov	r0, #0
	mov	r1, #0
	mov	r2, #6
	bl	C3D_DrawArrays
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	bne	.LBB0_13
.LBB0_15:
	add	r0, sp, #104
	bl	C3D_TexDelete
	ldr	r0, [sp, #20]
	bl	linearFree
	add	r0, sp, #128
	bl	shaderProgramFree
	ldr	r0, [sp, #24]
	bl	DVLB_Free
	ldr	r0, [sp, #28]
	bl	free
	bl	C3D_Fini
	bl	gfxExit
	bl	romfs_exit
	mov	r0, #0
	add	sp, sp, #148
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$Texture-Example$9"
.LCPI0_1:
	.long	".Lcsbs$Texture-Example$a"
.LCPI0_2:
	.long	".Lcsbs$Texture-Example$b"
.LCPI0_3:
	.long	"texture_example::vertex_list"
.LCPI0_4:
	.long	3148076810
.LCPI0_5:
	.long	3154675849
.LCPI0_6:
	.long	".Lcsbs$Texture-Example$c"
.LCPI0_7:
	.long	".Lcsbs$Texture-Example$d"
.LCPI0_8:
	.long	".Lcsbs$Texture-Example$e"
.LCPI0_9:
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

	.type	"texture_example::vertex_list",%object
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
"texture_example::vertex_list":
	.long	0x42c80000
	.long	0x41a00000
	.long	0x3f000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x42c80000
	.long	0x435c0000
	.long	0x3f000000
	.long	0x00000000
	.long	0x00000000
	.long	0x43960000
	.long	0x435c0000
	.long	0x3f000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x42c80000
	.long	0x41a00000
	.long	0x3f000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x43960000
	.long	0x435c0000
	.long	0x3f000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x43960000
	.long	0x41a00000
	.long	0x3f000000
	.long	0x3f800000
	.long	0x3f800000
	.size	"texture_example::vertex_list", 120

	.type	".Lcsbs$Texture-Example$9",%object
".Lcsbs$Texture-Example$9":
	.asciz	"romfs:/vshader.shbin"
	.size	".Lcsbs$Texture-Example$9", 21

	.type	".Lcsbs$Texture-Example$a",%object
".Lcsbs$Texture-Example$a":
	.asciz	"rb"
	.size	".Lcsbs$Texture-Example$a", 3

	.type	".Lcsbs$Texture-Example$b",%object
".Lcsbs$Texture-Example$b":
	.asciz	"projection"
	.size	".Lcsbs$Texture-Example$b", 11

	.type	".Lcsbs$Texture-Example$c",%object
".Lcsbs$Texture-Example$c":
	.asciz	"\033[1;1HTexture Example"
	.size	".Lcsbs$Texture-Example$c", 22

	.type	".Lcsbs$Texture-Example$d",%object
".Lcsbs$Texture-Example$d":
	.asciz	"\033[2;1HPress START to exit"
	.size	".Lcsbs$Texture-Example$d", 26

	.type	".Lcsbs$Texture-Example$e",%object
".Lcsbs$Texture-Example$e":
	.asciz	"\033[3;1HPhase 6: C3D texture pipeline"
	.size	".Lcsbs$Texture-Example$e", 36

	.type	"runtime::default_random_generator_proc-.state-4136",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-4136"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-4136":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-4136", 1032

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
