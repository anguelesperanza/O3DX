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
	.file	"SpinningCube-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#556
	sub	sp, sp, #556
	bl	romfs_init
	mov	r4, r0
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #1
	mov	r1, #0
	mov	r7, #0
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
	str	r0, [sp, #188]
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
	mov	r4, r0
	bl	fread
	mov	r0, r5
	bl	fclose
	ldr	r0, .LCPI0_3
	mov	r1, r6
	bl	printf
	mov	r0, r4
	mov	r1, r6
	str	r4, [sp, #24]
	bl	DVLB_ParseFile
	add	r5, sp, #408
	mov	r4, r0
	str	r7, [sp, #408]
	mov	r0, r5
	str	r7, [sp, #412]
	str	r7, [sp, #416]
	str	r7, [sp, #420]
	str	r7, [sp, #424]
	bl	shaderProgramInit
	ldr	r1, [r4, #20]
	mov	r0, r5
	str	r4, [sp, #20]
	bl	shaderProgramSetVsh
	mov	r0, r5
	bl	C3D_BindProgram
	ldr	r0, [sp, #408]
	ldr	r1, .LCPI0_4
	bl	shaderInstanceGetUniformLocation
	lsl	r0, r0, #24
	asr	r4, r0, #24
	ldr	r0, .LCPI0_5
	mov	r1, r4
	bl	printf
	ldr	r0, .LCPI0_6
	mov	r1, r4
	str	r4, [sp, #184]
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
	mov	r0, #1008
	bl	linearAlloc
	ldr	r1, .LCPI0_7
	mov	r2, #1008
	mov	r4, r0
	bl	memcpy
	bl	C3D_GetBufInfo
	mov	r5, r0
	bl	BufInfo_Init
	mov	r0, #16
	mov	r1, r4
	stm	sp, {r0, r7}
	mov	r0, r5
	mov	r2, #28
	mov	r3, #2
	str	r4, [sp, #16]
	bl	BufInfo_Add
	mov	r0, #0
	bl	C3D_GetTexEnv
	mov	r5, r0
	bl	c3d_tex_env_init
	mov	r0, r5
	mov	r1, #3
	mov	r2, #0
	mov	r3, #0
	str	r7, [sp]
	bl	c3d_tex_env_src
	mov	r0, r5
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
	add	r5, sp, #344
	mov	r1, #0
	mov	r2, #64
	mov	r0, r5
	bl	memset
	mov	r0, #46661632
	ldr	r1, .LCPI0_8
	ldr	r2, .LCPI0_9
	orr	r0, r0, #1073741824
	ldr	r3, .LCPI0_10
	stm	sp, {r0, r7}
	mov	r0, r5
	bl	mtx_persp_tilt
	ldr	r0, .LCPI0_11
	bl	printf
	ldr	r0, .LCPI0_12
	bl	printf
	ldr	r0, .LCPI0_13
	bl	printf
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_4
	add	r0, sp, #280
	mov	r10, #0
	add	r1, r0, #4
	add	r0, sp, #428
	add	r3, r1, #56
	str	r3, [sp, #168]
	add	r3, r1, #52
	str	r3, [sp, #164]
	add	r3, r1, #48
	str	r3, [sp, #160]
	add	r3, r1, #40
	str	r3, [sp, #156]
	add	r3, r1, #36
	str	r3, [sp, #152]
	add	r3, r1, #28
	str	r3, [sp, #148]
	add	r3, r1, #24
	str	r3, [sp, #144]
	add	r3, r1, #16
	add	r2, r0, #12
	add	r0, sp, #492
	str	r3, [sp, #140]
	add	r3, r1, #12
	add	r0, r0, #4
	str	r3, [sp, #136]
	add	r3, r1, #4
	str	r3, [sp, #132]
	add	r3, r0, #56
	str	r3, [sp, #128]
	add	r3, r0, #52
	str	r3, [sp, #124]
	add	r3, r0, #48
	str	r3, [sp, #120]
	add	r3, r0, #44
	str	r3, [sp, #116]
	add	r3, r0, #40
	str	r3, [sp, #112]
	add	r3, r0, #36
	str	r3, [sp, #108]
	add	r3, r0, #32
	str	r3, [sp, #104]
	add	r3, r0, #28
	str	r3, [sp, #100]
	add	r3, r0, #24
	str	r3, [sp, #96]
	add	r3, r0, #20
	str	r3, [sp, #92]
	add	r3, r0, #16
	str	r3, [sp, #88]
	add	r3, r0, #12
	str	r3, [sp, #84]
	add	r3, r0, #8
	str	r0, [sp, #172]
	add	r0, r0, #4
	str	r0, [sp, #76]
	add	r0, r2, #48
	str	r0, [sp, #72]
	add	r0, r2, #44
	str	r0, [sp, #68]
	add	r0, r2, #40
	str	r0, [sp, #64]
	add	r0, r2, #36
	str	r0, [sp, #60]
	add	r0, r2, #32
	str	r0, [sp, #56]
	add	r0, r2, #28
	str	r0, [sp, #52]
	add	r0, r2, #24
	str	r0, [sp, #48]
	add	r0, r2, #20
	str	r0, [sp, #44]
	add	r0, r2, #16
	str	r0, [sp, #40]
	add	r0, r2, #12
	str	r0, [sp, #36]
	add	r0, r2, #8
	str	r0, [sp, #32]
	add	r0, r2, #4
	str	r0, [sp, #28]
	add	r0, r1, #44
	str	r0, [sp, #212]
	add	r0, r1, #32
	str	r0, [sp, #208]
	add	r0, r1, #20
	str	r0, [sp, #204]
	add	r0, r1, #8
	str	r3, [sp, #80]
	str	r2, [sp, #176]
	str	r1, [sp, #180]
	str	r0, [sp, #200]
.LBB0_2:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_4
	add	r0, sp, #280
	mov	r1, #0
	mov	r2, #64
	mov	r5, r0
	bl	memset
	ldr	r0, [sp, #200]
	mov	r2, #1065353216
	ldr	r1, [sp, #28]
	mov	r3, #-1073741824
	add	r4, sp, #492
	str	r2, [r0]
	ldr	r0, [sp, #204]
	str	r2, [r0]
	ldr	r0, [sp, #208]
	str	r2, [r0]
	ldr	r0, [sp, #212]
	str	r2, [r0]
	ldr	r0, [sp, #176]
	str	r2, [r0]
	mov	r0, #0
	str	r0, [r1]
	ldr	r1, [sp, #32]
	str	r0, [sp, #436]
	str	r0, [sp, #432]
	str	r0, [r1]
	ldr	r1, [sp, #36]
	str	r0, [sp, #428]
	str	r2, [r1]
	ldr	r1, [sp, #40]
	str	r0, [r1]
	ldr	r1, [sp, #44]
	str	r3, [r1]
	ldr	r1, [sp, #48]
	str	r2, [r1]
	ldr	r1, [sp, #52]
	str	r0, [r1]
	ldr	r1, [sp, #56]
	str	r0, [r1]
	ldr	r1, [sp, #60]
	str	r2, [r1]
	mov	r2, #64
	ldr	r1, [sp, #64]
	str	r0, [r1]
	ldr	r1, [sp, #68]
	str	r0, [r1]
	ldr	r1, [sp, #72]
	str	r0, [r1]
	mov	r0, r4
	mov	r1, #0
	bl	memset
	add	r2, sp, #428
	mov	r0, r4
	mov	r1, r5
	bl	"c3d::Mtx_Multiply"
	ldr	r0, [sp, #172]
	ldr	r1, [sp, #180]
	ldr	r5, [sp, #84]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r0, [sp, #76]
	ldr	r1, [sp, #132]
	ldr	r3, [sp, #80]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r0, [sp, #492]
	str	r0, [sp, #280]
	ldr	r0, [sp, #128]
	ldr	r11, [r5]
	ldr	r5, [sp, #200]
	ldr	r0, [r0]
	str	r0, [sp, #196]
	ldr	r0, [sp, #124]
	ldr	r2, [sp, #88]
	ldr	r3, [r3]
	ldr	r0, [r0]
	str	r0, [sp, #192]
	ldr	r0, [sp, #120]
	str	r3, [r5]
	ldr	r3, [sp, #140]
	ldr	r8, [r0]
	ldr	r0, [sp, #116]
	ldr	r1, [sp, #92]
	ldr	r2, [r2]
	ldr	r9, [r0]
	ldr	r0, [sp, #112]
	str	r2, [r3]
	ldr	r2, [sp, #204]
	ldr	lr, [r0]
	ldr	r0, [sp, #108]
	ldr	r1, [r1]
	str	r1, [r2]
	ldr	r4, [r0]
	ldr	r0, [sp, #104]
	ldr	r1, [sp, #144]
	ldr	r12, [sp, #136]
	ldr	r7, [r0]
	ldr	r0, [sp, #100]
	str	r11, [r12]
	ldr	r6, [r0]
	ldr	r0, [sp, #96]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r0, [sp, #148]
	ldr	r1, [sp, #192]
	str	r6, [r0]
	ldr	r0, [sp, #208]
	str	r7, [r0]
	ldr	r0, [sp, #152]
	str	r4, [r0]
	ldr	r0, [sp, #156]
	str	lr, [r0]
	ldr	r0, [sp, #212]
	str	r9, [r0]
	ldr	r0, [sp, #160]
	str	r8, [r0]
	ldr	r0, [sp, #164]
	str	r1, [r0]
	ldr	r0, [sp, #168]
	ldr	r1, [sp, #196]
	str	r1, [r0]
	mov	r0, r10
	ldr	r1, .LCPI0_14
	bl	__aeabi_fadd
	ldr	r1, .LCPI0_15
	mov	r8, r0
	bl	__aeabi_fcmpge
	ldr	r1, .LCPI0_16
	mov	r9, r0
	mov	r0, r8
	bl	__aeabi_fadd
	mov	r10, r0
	cmp	r9, #0
	add	r4, sp, #280
	moveq	r10, r8
	mov	r1, r10
	mov	r2, #1
	mov	r0, r4
	bl	mtx_rotate_y
	add	r5, sp, #216
	mov	r1, #0
	mov	r2, #64
	mov	r0, r5
	bl	memset
	add	r1, sp, #344
	mov	r0, r5
	mov	r2, r4
	bl	"c3d::Mtx_Multiply"
	mov	r0, #1
	bl	C3D_FrameBegin
	ldr	r4, [sp, #188]
	mov	r1, #3
	ldr	r2, .LCPI0_17
	mov	r3, #0
	mov	r0, r4
	bl	c3d_render_target_clear
	mov	r0, r4
	bl	C3D_FrameDrawOn
	ldr	r1, [sp, #184]
	mov	r0, #0
	mov	r2, r5
	bl	c3d_fvunif_mtx4x4
	mov	r0, #0
	mov	r1, #0
	mov	r2, #36
	bl	C3D_DrawArrays
	mov	r0, #0
	bl	C3D_FrameEnd
	bl	aptMainLoop
	tst	r0, #255
	bne	.LBB0_2
.LBB0_4:
	ldr	r0, [sp, #16]
	bl	linearFree
	add	r0, sp, #408
	bl	shaderProgramFree
	ldr	r0, [sp, #20]
	bl	DVLB_Free
	ldr	r0, [sp, #24]
	bl	free
	bl	C3D_Fini
	bl	gfxExit
	bl	romfs_exit
	mov	r0, #0
	add	sp, sp, #556
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$SpinningCube-Example$e"
.LCPI0_1:
	.long	".Lcsbs$SpinningCube-Example$f"
.LCPI0_2:
	.long	".Lcsbs$SpinningCube-Example$10"
.LCPI0_3:
	.long	".Lcsbs$SpinningCube-Example$11"
.LCPI0_4:
	.long	".Lcsbs$SpinningCube-Example$12"
.LCPI0_5:
	.long	".Lcsbs$SpinningCube-Example$13"
.LCPI0_6:
	.long	".Lcsbs$SpinningCube-Example$14"
.LCPI0_7:
	.long	"spinning_cube_example::vertex_list"
.LCPI0_8:
	.long	1065749138
.LCPI0_9:
	.long	1070945621
.LCPI0_10:
	.long	1008981770
.LCPI0_11:
	.long	".Lcsbs$SpinningCube-Example$15"
.LCPI0_12:
	.long	".Lcsbs$SpinningCube-Example$16"
.LCPI0_13:
	.long	".Lcsbs$SpinningCube-Example$17"
.LCPI0_14:
	.long	1017370378
.LCPI0_15:
	.long	1086918619
.LCPI0_16:
	.long	3234402267
.LCPI0_17:
	.long	437923583
.Lfunc_end0:
	.size	odin_main, .Lfunc_end0-odin_main
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
.LBB1_1:
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
	bne	.LBB1_1
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
.Lfunc_end1:
	.size	"c3d::Mtx_Multiply", .Lfunc_end1-"c3d::Mtx_Multiply"
	.cantunwind
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

	.type	"spinning_cube_example::vertex_list",%object
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
"spinning_cube_example::vertex_list":
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
	.size	"spinning_cube_example::vertex_list", 1008

	.type	"runtime::default_random_generator_proc-.state-6277",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-6277"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-6277":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-6277", 1032

	.type	".Lcsbs$SpinningCube-Example$e",%object
	.section	.rodata,"a",%progbits
".Lcsbs$SpinningCube-Example$e":
	.asciz	"\033[5;1HromfsInit rc: 0x%08lX"
	.size	".Lcsbs$SpinningCube-Example$e", 28

	.type	".Lcsbs$SpinningCube-Example$f",%object
".Lcsbs$SpinningCube-Example$f":
	.asciz	"romfs:/vshader.shbin"
	.size	".Lcsbs$SpinningCube-Example$f", 21

	.type	".Lcsbs$SpinningCube-Example$10",%object
".Lcsbs$SpinningCube-Example$10":
	.asciz	"rb"
	.size	".Lcsbs$SpinningCube-Example$10", 3

	.type	".Lcsbs$SpinningCube-Example$11",%object
".Lcsbs$SpinningCube-Example$11":
	.asciz	"\033[3;1Hsh_size: %d    "
	.size	".Lcsbs$SpinningCube-Example$11", 22

	.type	".Lcsbs$SpinningCube-Example$12",%object
".Lcsbs$SpinningCube-Example$12":
	.asciz	"mvp"
	.size	".Lcsbs$SpinningCube-Example$12", 4

	.type	".Lcsbs$SpinningCube-Example$13",%object
".Lcsbs$SpinningCube-Example$13":
	.asciz	"uloc_mvp = %d\n"
	.size	".Lcsbs$SpinningCube-Example$13", 15

	.type	".Lcsbs$SpinningCube-Example$14",%object
".Lcsbs$SpinningCube-Example$14":
	.asciz	"\033[6;1Huloc_mvp: %d    "
	.size	".Lcsbs$SpinningCube-Example$14", 23

	.type	".Lcsbs$SpinningCube-Example$15",%object
".Lcsbs$SpinningCube-Example$15":
	.asciz	"\033[1;1HSpinningCube - Phase 8 (RH)"
	.size	".Lcsbs$SpinningCube-Example$15", 34

	.type	".Lcsbs$SpinningCube-Example$16",%object
".Lcsbs$SpinningCube-Example$16":
	.asciz	"\033[2;1HPress START to exit"
	.size	".Lcsbs$SpinningCube-Example$16", 26

	.type	".Lcsbs$SpinningCube-Example$17",%object
".Lcsbs$SpinningCube-Example$17":
	.asciz	"\033[4;1HCitro3D math library demo"
	.size	".Lcsbs$SpinningCube-Example$17", 32

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
