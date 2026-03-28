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
	.file	"Scale-Example"
	.text
	.p2align	2
	.type	"scale_example::[main.odin]::draw_cube",%function
	.code	32
"scale_example::[main.odin]::draw_cube":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#256
	sub	sp, sp, #256
	add	r6, sp, #64
	mov	r4, r2
	mov	r8, r1
	mov	r9, r0
	mov	r0, r6
	mov	r1, #0
	mov	r2, #64
	mov	r7, r3
	mov	r5, #0
	bl	memset
	str	r4, [sp, #128]
	add	r4, sp, #192
	mov	r0, #1065353216
	mov	r1, #-1056964608
	str	r1, [sp, #160]
	mov	r1, #0
	str	r0, [sp, #112]
	mov	r2, #64
	str	r0, [sp, #100]
	str	r0, [sp, #88]
	str	r0, [sp, #76]
	str	r0, [sp, #176]
	str	r0, [sp, #164]
	str	r0, [sp, #152]
	str	r0, [sp, #140]
	mov	r0, r4
	str	r5, [sp, #188]
	str	r5, [sp, #184]
	str	r5, [sp, #180]
	str	r5, [sp, #172]
	str	r5, [sp, #168]
	str	r5, [sp, #156]
	str	r5, [sp, #148]
	str	r5, [sp, #144]
	str	r5, [sp, #136]
	str	r5, [sp, #132]
	bl	memset
	add	r2, sp, #128
	mov	r0, r4
	mov	r1, r6
	bl	"c3d::Mtx_Multiply"
	ldr	r0, [sp, #252]
	add	r3, sp, #192
	str	r0, [sp, #124]
	add	r12, sp, #64
	ldr	r0, [sp, #248]
	str	r0, [sp, #120]
	ldr	r0, [sp, #244]
	str	r0, [sp, #116]
	ldr	r0, [sp, #240]
	str	r0, [sp, #112]
	ldr	r0, [sp, #236]
	str	r0, [sp, #108]
	ldr	r0, [sp, #232]
	str	r0, [sp, #104]
	ldr	r0, [sp, #228]
	str	r0, [sp, #100]
	ldr	r0, [sp, #224]
	str	r0, [sp, #96]
	ldr	r0, [sp, #220]
	str	r0, [sp, #92]
	ldr	r0, [sp, #216]
	str	r0, [sp, #88]
	ldr	r0, [sp, #212]
	str	r0, [sp, #84]
	ldr	r0, [sp, #208]
	str	r0, [sp, #80]
	ldm	r3, {r0, r1, r2, r3}
	ldr	r4, [sp, #288]
	stm	r12, {r0, r1, r2, r3}
	mov	r0, r6
	mov	r2, #1
	mov	r1, r4
	bl	mtx_rotate_y
	mov	r0, r4
	mov	r1, #1056964608
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	mov	r2, #1
	bl	mtx_rotate_x
	mov	r0, r6
	mov	r1, r7
	mov	r2, r7
	mov	r3, r7
	bl	mtx_scale
	mov	r4, sp
	mov	r1, #0
	mov	r0, r4
	mov	r2, #64
	bl	memset
	mov	r0, r4
	mov	r1, r9
	mov	r2, r6
	bl	"c3d::Mtx_Multiply"
	mov	r0, #0
	mov	r1, r8
	mov	r2, r4
	bl	c3d_fvunif_mtx4x4
	mov	r0, #0
	mov	r1, #0
	mov	r2, #36
	bl	C3D_DrawArrays
	add	sp, sp, #256
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
.Lfunc_end0:
	.size	"scale_example::[main.odin]::draw_cube", .Lfunc_end0-"scale_example::[main.odin]::draw_cube"
	.fnend

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
	bl	romfs_init
	mov	r5, r0
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #1
	mov	r1, #0
	mov	r4, #0
	bl	consoleInit
	ldr	r0, .LCPI1_0
	mov	r1, r5
	bl	printf
	mov	r0, #240
	mov	r1, #400
	mov	r2, #0
	mov	r3, #3
	bl	C3D_RenderTargetCreate
	mov	r1, #0
	mov	r2, #0
	mov	r3, #4096
	mov	r9, r0
	bl	C3D_RenderTargetSetOutput
	ldr	r0, .LCPI1_1
	ldr	r1, .LCPI1_2
	bl	fopen
	mov	r1, #0
	mov	r2, #2
	mov	r6, r0
	bl	fseek
	mov	r0, r6
	bl	ftell
	mov	r7, r0
	mov	r0, r6
	mov	r1, #0
	mov	r2, #0
	bl	fseek
	mov	r0, r7
	bl	malloc
	mov	r1, #1
	mov	r2, r7
	mov	r3, r6
	mov	r5, r0
	bl	fread
	mov	r0, r6
	bl	fclose
	mov	r0, r5
	mov	r1, r7
	str	r5, [sp, #20]
	bl	DVLB_ParseFile
	add	r6, sp, #88
	mov	r5, r0
	str	r4, [sp, #88]
	mov	r0, r6
	str	r4, [sp, #92]
	str	r4, [sp, #96]
	str	r4, [sp, #100]
	str	r4, [sp, #104]
	bl	shaderProgramInit
	ldr	r1, [r5, #20]
	mov	r0, r6
	str	r5, [sp, #16]
	bl	shaderProgramSetVsh
	mov	r0, r6
	bl	C3D_BindProgram
	ldr	r0, [sp, #88]
	ldr	r1, .LCPI1_3
	bl	shaderInstanceGetUniformLocation
	mov	r5, r0
	bl	C3D_GetAttrInfo
	mov	r6, r0
	bl	AttrInfo_Init
	mov	r0, r6
	mov	r1, #0
	mov	r2, #3
	mov	r3, #3
	bl	AttrInfo_AddLoader
	mov	r0, r6
	mov	r1, #1
	mov	r2, #3
	mov	r3, #4
	bl	AttrInfo_AddLoader
	mov	r0, #1008
	bl	linearAlloc
	ldr	r1, .LCPI1_4
	mov	r2, #1008
	mov	r7, r0
	bl	memcpy
	bl	C3D_GetBufInfo
	mov	r6, r0
	bl	BufInfo_Init
	mov	r0, #16
	mov	r1, r7
	stm	sp, {r0, r4}
	mov	r0, r6
	mov	r2, #28
	mov	r3, #2
	str	r7, [sp, #12]
	bl	BufInfo_Add
	mov	r0, #0
	bl	C3D_GetTexEnv
	mov	r6, r0
	bl	c3d_tex_env_init
	mov	r0, r6
	mov	r1, #3
	mov	r2, #0
	mov	r3, #0
	str	r4, [sp]
	bl	c3d_tex_env_src
	mov	r0, r6
	mov	r1, #3
	mov	r2, #0
	bl	c3d_tex_env_func
	mov	r1, #1065353216
	mov	r0, #1
	orr	r1, r1, #-2147483648
	mov	r2, #0
	bl	c3d_depth_map
	mov	r0, #1
	mov	r1, #7
	mov	r2, #31
	bl	C3D_DepthTest
	mov	r0, #0
	bl	C3D_CullFace
	add	r6, sp, #24
	mov	r1, #0
	mov	r2, #64
	mov	r0, r6
	bl	memset
	mov	r0, #29884416
	ldr	r1, .LCPI1_5
	ldr	r2, .LCPI1_6
	orr	r0, r0, #1073741824
	stm	sp, {r0, r4}
	mov	r0, r6
	mov	r3, #1056964608
	bl	mtx_persp_tilt
	ldr	r0, .LCPI1_7
	bl	printf
	ldr	r0, .LCPI1_8
	bl	printf
	ldr	r0, .LCPI1_9
	bl	printf
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB1_4
	lsl	r0, r5, #24
	mov	r5, #4194304
	mov	r7, #4194304
	add	r11, sp, #24
	orr	r5, r5, #-1073741824
	orr	r7, r7, #1073741824
	asr	r6, r0, #24
.LBB1_2:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB1_4
	mov	r0, #1
	bl	C3D_FrameBegin
	ldr	r2, .LCPI1_10
	mov	r0, r9
	mov	r1, #3
	mov	r3, #0
	bl	c3d_render_target_clear
	mov	r0, r9
	bl	C3D_FrameDrawOn
	ldr	r1, .LCPI1_11
	mov	r0, r4
	bl	__aeabi_fadd
	ldr	r1, .LCPI1_12
	mov	r8, r0
	bl	__aeabi_fcmpge
	ldr	r1, .LCPI1_13
	mov	r10, r0
	mov	r0, r8
	bl	__aeabi_fadd
	mov	r4, r0
	cmp	r10, #0
	moveq	r4, r8
	mov	r0, r11
	mov	r1, r6
	mov	r2, r5
	mov	r3, #1056964608
	str	r4, [sp]
	bl	"scale_example::[main.odin]::draw_cube"
	mov	r0, r11
	mov	r1, r6
	mov	r2, #0
	mov	r3, #1065353216
	str	r4, [sp]
	bl	"scale_example::[main.odin]::draw_cube"
	mov	r0, r11
	mov	r1, r6
	mov	r2, r7
	mov	r3, #1069547520
	str	r4, [sp]
	bl	"scale_example::[main.odin]::draw_cube"
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	bne	.LBB1_2
.LBB1_4:
	ldr	r0, [sp, #12]
	bl	linearFree
	add	r0, sp, #88
	bl	shaderProgramFree
	ldr	r0, [sp, #16]
	bl	DVLB_Free
	ldr	r0, [sp, #20]
	bl	free
	bl	C3D_Fini
	bl	gfxExit
	bl	romfs_exit
	mov	r0, #0
	add	sp, sp, #108
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI1_0:
	.long	".Lcsbs$Scale-Example$e"
.LCPI1_1:
	.long	".Lcsbs$Scale-Example$f"
.LCPI1_2:
	.long	".Lcsbs$Scale-Example$10"
.LCPI1_3:
	.long	".Lcsbs$Scale-Example$11"
.LCPI1_4:
	.long	"scale_example::vertex_list"
.LCPI1_5:
	.long	1065749138
.LCPI1_6:
	.long	1070945621
.LCPI1_7:
	.long	".Lcsbs$Scale-Example$12"
.LCPI1_8:
	.long	".Lcsbs$Scale-Example$13"
.LCPI1_9:
	.long	".Lcsbs$Scale-Example$14"
.LCPI1_10:
	.long	437923583
.LCPI1_11:
	.long	1017370378
.LCPI1_12:
	.long	1086918619
.LCPI1_13:
	.long	3234402267
.Lfunc_end1:
	.size	odin_main, .Lfunc_end1-odin_main
	.fnend

	.p2align	2
	.type	"c3d::Mtx_Multiply",%function
	.code	32
"c3d::Mtx_Multiply":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#148
	sub	sp, sp, #148
	add	r6, sp, #84
	mov	r4, r2
	str	r1, [sp, #76]
	mov	r5, r0
	mov	r0, r6
	mov	r1, #0
	mov	r2, #64
	mov	r11, #0
	bl	memset
	add	r0, r6, #4
	str	r0, [sp, #4]
	add	r0, r5, #4
	str	r0, [sp, #8]
	ldr	r0, [r4]
	str	r0, [sp, #72]
	ldr	r0, [r4, #4]
	str	r0, [sp, #68]
	ldr	r0, [r4, #8]
	str	r0, [sp, #64]
	ldr	r0, [r4, #12]
	str	r0, [sp, #60]
	ldr	r0, [r4, #16]
	str	r0, [sp, #56]
	ldr	r0, [r4, #20]
	str	r0, [sp, #52]
	ldr	r0, [r4, #24]
	str	r0, [sp, #48]
	ldr	r0, [r4, #28]
	str	r0, [sp, #44]
	ldr	r0, [r4, #32]
	str	r0, [sp, #40]
	ldr	r0, [r4, #36]
	str	r0, [sp, #36]
	ldr	r0, [r4, #40]
	str	r0, [sp, #32]
	ldr	r0, [r4, #44]
	str	r0, [sp, #28]
	ldr	r0, [r4, #48]
	str	r0, [sp, #24]
	ldr	r0, [r4, #52]
	str	r0, [sp, #20]
	ldr	r0, [r4, #56]
	str	r0, [sp, #16]
	ldr	r0, [r4, #60]
	str	r5, [sp]
	str	r0, [sp, #12]
.LBB2_1:
	ldr	r5, [sp, #76]
	ldr	r1, [sp, #72]
	ldr	r4, [r5, r11]!
	mov	r0, r4
	bl	__aeabi_fmul
	add	r7, sp, #84
	mov	r1, r0
	ldr	r0, [r7, r11]
	bl	__aeabi_fadd
	ldmib	r5, {r8, r10}
	mov	r6, r0
	ldr	r1, [sp, #56]
	mov	r0, r8
	ldr	r5, [r5, #12]
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #40]
	mov	r6, r0
	mov	r0, r10
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #24]
	mov	r6, r0
	mov	r0, r5
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #68]
	add	r9, r7, r11
	str	r0, [r7, r11]
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r1, r0
	ldmib	r9, {r0, r7}
	ldr	r2, [r9, #12]
	str	r2, [sp, #80]
	bl	__aeabi_fadd
	ldr	r1, [sp, #52]
	mov	r6, r0
	mov	r0, r8
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #36]
	mov	r6, r0
	mov	r0, r10
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #20]
	mov	r6, r0
	mov	r0, r5
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #64]
	str	r0, [r9, #4]
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r7
	bl	__aeabi_fadd
	ldr	r1, [sp, #48]
	mov	r6, r0
	mov	r0, r8
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #32]
	mov	r6, r0
	mov	r0, r10
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #16]
	mov	r6, r0
	mov	r0, r5
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_fadd
	ldr	r1, [sp, #60]
	str	r0, [r9, #8]
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r1, r0
	ldr	r0, [sp, #80]
	bl	__aeabi_fadd
	ldr	r1, [sp, #44]
	mov	r4, r0
	mov	r0, r8
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r4
	bl	__aeabi_fadd
	ldr	r1, [sp, #28]
	mov	r4, r0
	mov	r0, r10
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r4
	bl	__aeabi_fadd
	ldr	r1, [sp, #12]
	mov	r4, r0
	mov	r0, r5
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r4
	bl	__aeabi_fadd
	add	r11, r11, #16
	str	r0, [r9, #12]
	cmp	r11, #64
	bne	.LBB2_1
	ldr	r1, [sp]
	ldr	r0, [sp, #84]
	ldr	r4, [sp, #8]
	str	r0, [r1]
	ldr	r0, [sp, #4]
	add	r7, r0, #36
	ldr	r12, [r0, #32]
	ldm	r7, {r1, r2, r3, r7}
	str	r12, [r4, #32]
	add	r12, r4, #36
	stm	r12, {r1, r2, r3, r7}
	ldmib	r0, {r1, r2, r3, r7}
	ldr	r6, [r0, #52]
	ldr	r5, [r0, #56]
	str	r6, [r4, #52]
	str	r5, [r4, #56]
	ldr	lr, [r0]
	ldr	r6, [r0, #20]
	ldr	r5, [r0, #24]
	ldr	r12, [r0, #28]
	str	lr, [r4]
	stmib	r4, {r1, r2, r3, r7}
	str	r6, [r4, #20]
	str	r5, [r4, #24]
	str	r12, [r4, #28]
	add	sp, sp, #148
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.Lfunc_end2:
	.size	"c3d::Mtx_Multiply", .Lfunc_end2-"c3d::Mtx_Multiply"
	.cantunwind
	.fnend

	.globl	__truncsfhf2
	.p2align	2
	.type	__truncsfhf2,%function
	.code	32
__truncsfhf2:
	.fnstart
	mov	r1, r0
	ldr	r0, .LCPI3_0
	mov	r3, #255
	and	r2, r1, r0
	mov	r0, #32768
	and	r3, r3, r1, lsr #23
	and	r0, r0, r1, lsr #16
	subs	r12, r3, #112
	bhi	.LBB3_3
	cmp	r3, #102
	movlo	pc, lr
.LBB3_2:
	rsb	r1, r3, #113
	orr	r2, r2, #8388608
	mov	r3, #4096
	and	r3, r3, r2, lsr r1
	lsl	r3, r3, #1
	add	r1, r3, r2, lsr r1
	orr	r0, r0, r1, lsr #13
	mov	pc, lr
.LBB3_3:
	cmp	r12, #143
	bne	.LBB3_6
	cmp	r2, #0
	orreq	r0, r0, #31744
	moveq	pc, lr
.LBB3_5:
	lsr	r3, r2, #13
	cmp	r2, #8192
	mov	r1, #1
	orrlo	r3, r1, r2, lsr #13
	orr	r0, r3, r0
	orr	r0, r0, #31744
	mov	pc, lr
.LBB3_6:
	tst	r1, #4096
	bne	.LBB3_9
	mov	r1, r2
	cmp	r12, #31
	bhs	.LBB3_10
.LBB3_8:
	lsr	r1, r1, #13
	orr	r1, r1, r12, lsl #10
	orr	r0, r1, r0
	mov	pc, lr
.LBB3_9:
	mov	r1, #1040384
	orr	r1, r1, #7340032
	cmp	r2, r1
	mov	r1, #0
	subhs	r12, r3, #111
	addlo	r1, r2, #8192
	cmp	r12, #31
	blo	.LBB3_8
.LBB3_10:
	.save	{r11, lr}
	push	{r11, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r1, .LCPI3_1
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
.LCPI3_0:
	.long	8388607
.LCPI3_1:
	.long	3567587328
.Lfunc_end3:
	.size	__truncsfhf2, .Lfunc_end3-__truncsfhf2
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
.Lfunc_end4:
	.size	__aeabi_d2h, .Lfunc_end4-__aeabi_d2h
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
.Lfunc_end5:
	.size	__truncdfhf2, .Lfunc_end5-__truncdfhf2
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
.Lfunc_end6:
	.size	__gnu_h2f_ieee, .Lfunc_end6-__gnu_h2f_ieee
	.cantunwind
	.fnend

	.globl	__gnu_f2h_ieee
	.p2align	2
	.type	__gnu_f2h_ieee,%function
	.code	32
__gnu_f2h_ieee:
	.fnstart
	b	__truncsfhf2
.Lfunc_end7:
	.size	__gnu_f2h_ieee, .Lfunc_end7-__gnu_f2h_ieee
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
.Lfunc_end8:
	.size	__extendhfsf2, .Lfunc_end8-__extendhfsf2
	.cantunwind
	.fnend

	.type	"scale_example::vertex_list",%object
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
"scale_example::vertex_list":
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x00000000
	.long	0x3f800000
	.long	0x3f800000
	.size	"scale_example::vertex_list", 1008

	.type	"runtime::default_random_generator_proc-.state-8284",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-8284"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-8284":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-8284", 1032

	.type	".Lcsbs$Scale-Example$e",%object
	.section	.rodata,"a",%progbits
".Lcsbs$Scale-Example$e":
	.asciz	"\033[5;1HromfsInit rc: 0x%08lX"
	.size	".Lcsbs$Scale-Example$e", 28

	.type	".Lcsbs$Scale-Example$f",%object
".Lcsbs$Scale-Example$f":
	.asciz	"romfs:/vshader.shbin"
	.size	".Lcsbs$Scale-Example$f", 21

	.type	".Lcsbs$Scale-Example$10",%object
".Lcsbs$Scale-Example$10":
	.asciz	"rb"
	.size	".Lcsbs$Scale-Example$10", 3

	.type	".Lcsbs$Scale-Example$11",%object
".Lcsbs$Scale-Example$11":
	.asciz	"mvp"
	.size	".Lcsbs$Scale-Example$11", 4

	.type	".Lcsbs$Scale-Example$12",%object
".Lcsbs$Scale-Example$12":
	.asciz	"\033[1;1HScale-Example"
	.size	".Lcsbs$Scale-Example$12", 20

	.type	".Lcsbs$Scale-Example$13",%object
".Lcsbs$Scale-Example$13":
	.asciz	"\033[2;1HLeft=0.5x  Centre=1.0x  Right=1.5x"
	.size	".Lcsbs$Scale-Example$13", 41

	.type	".Lcsbs$Scale-Example$14",%object
".Lcsbs$Scale-Example$14":
	.asciz	"\033[3;1HPress START to exit"
	.size	".Lcsbs$Scale-Example$14", 26

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
