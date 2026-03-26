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
	.file	"ProcTex-Example"
	.text
	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#580
	sub	sp, sp, #580
	.pad	#4096
	sub	sp, sp, #4096
	add	lr, sp, #4096
	add	r9, lr, #428
	bl	romfs_init
	mov	r4, r0
	bl	gfxInitDefault
	mov	r0, #262144
	bl	C3D_Init
	mov	r0, #1
	mov	r1, #0
	mov	r6, #0
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
	str	r0, [sp, #172]
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
	mov	r7, r0
	mov	r0, r5
	mov	r1, #0
	mov	r2, #0
	bl	fseek
	mov	r0, r7
	bl	malloc
	mov	r1, #1
	mov	r2, r7
	mov	r3, r5
	mov	r4, r0
	bl	fread
	mov	r0, r5
	bl	fclose
	mov	r0, r4
	mov	r1, r7
	str	r4, [sp, #20]
	bl	DVLB_ParseFile
	add	lr, sp, #4096
	mov	r4, r0
	add	r5, lr, #432
	str	r6, [r9, #4]
	str	r6, [r9, #8]
	mov	r0, r5
	str	r6, [r9, #12]
	str	r6, [r9, #16]
	str	r6, [r9, #20]
	bl	shaderProgramInit
	ldr	r1, [r4, #20]
	mov	r0, r5
	str	r4, [sp, #16]
	bl	shaderProgramSetVsh
	mov	r0, r5
	bl	C3D_BindProgram
	ldr	r0, [r9, #4]
	ldr	r1, .LCPI0_3
	bl	shaderInstanceGetUniformLocation
	mov	r8, r0
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
	mov	r3, #2
	bl	AttrInfo_AddLoader
	mov	r0, #720
	bl	linearAlloc
	ldr	r1, .LCPI0_4
	mov	r2, #720
	mov	r4, r0
	bl	memcpy
	bl	C3D_GetBufInfo
	mov	r5, r0
	bl	BufInfo_Init
	mov	r0, #16
	mov	r1, r4
	stm	sp, {r0, r6}
	mov	r0, r5
	mov	r2, #20
	mov	r3, #2
	str	r4, [sp, #12]
	bl	BufInfo_Add
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
	add	lr, sp, #4096
	mov	r1, #0
	add	r5, lr, #408
	mov	r2, #8
	str	r6, [r9, #-20]
	mov	r0, r5
	str	r6, [r9, #-16]
	str	r6, [r9, #-12]
	str	r6, [r9, #-8]
	str	r6, [r9, #-4]
	str	r6, [r9]
	bl	C3D_ProcTexInit
	mov	r0, r5
	mov	r1, #3
	mov	r2, #3
	bl	c3d_proc_tex_clamp
	mov	r0, r5
	mov	r1, #0
	mov	r2, #6
	mov	r3, #6
	bl	c3d_proc_tex_combiner
	mov	r0, r5
	mov	r1, #0
	bl	c3d_proc_tex_noise_enable
	mov	r0, r5
	mov	r1, #0
	mov	r2, #0
	bl	c3d_proc_tex_shift
	mov	r0, r5
	mov	r1, #1
	bl	c3d_proc_tex_filter
	mov	r0, #0
	mov	r1, r5
	bl	C3D_ProcTexBind
	add	lr, sp, #3072
	mov	r1, #0
	add	r0, lr, #920
	mov	r2, #512
	bl	memset
	add	lr, sp, #3072
	mov	r1, #0
	add	r5, lr, #404
	mov	r2, #516
	mov	r0, r5
	bl	memset
	add	r0, sp, #272
	add	lr, sp, #4096
	add	r0, r0, #4
	str	r0, [sp, #184]
	add	r0, lr, #452
	add	r0, r0, #12
	str	r0, [sp, #180]
	add	r0, lr, #516
	add	r0, r0, #4
	str	r0, [sp, #176]
.LBB0_1:
	mov	r0, r6
	bl	__aeabi_ui2f
	mov	r1, #1006632960
	bl	__aeabi_fmul
	add	r6, r6, #1
	str	r0, [r5], #4
	cmp	r6, #129
	bne	.LBB0_1
	add	lr, sp, #3072
	add	r5, lr, #920
	add	r1, lr, #404
	mov	r0, r5
	bl	proc_tex_lut_from_array
	mov	r0, #2
	mov	r1, r5
	bl	C3D_ProcTexLutBind
	add	lr, sp, #2048
	mov	r1, #0
	add	r0, lr, #916
	mov	r2, #512
	mov	r5, #0
	bl	memset
	add	r6, sp, #2448
	mov	r1, #0
	mov	r2, #516
	mov	r0, r6
	bl	memset
	mov	r9, #4194304
	orr	r9, r9, #1073741824
.LBB0_3:
	mov	r0, r5
	bl	__aeabi_ui2f
	mov	r1, #1006632960
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r4, r0
	bl	__aeabi_fmul
	mov	r7, r0
	mov	r0, r4
	mov	r1, r4
	bl	__aeabi_fadd
	mov	r1, r0
	mov	r0, r9
	bl	__aeabi_fsub
	mov	r1, r0
	mov	r0, r7
	bl	__aeabi_fmul
	add	r5, r5, #1
	str	r0, [r6], #4
	cmp	r5, #129
	bne	.LBB0_3
	add	lr, sp, #2048
	add	r1, sp, #2448
	add	r4, lr, #916
	mov	r0, r4
	bl	proc_tex_lut_from_array
	mov	r0, #0
	mov	r1, r4
	mov	r5, #0
	bl	C3D_ProcTexLutBind
	add	r4, sp, #400
	mov	r1, #0
	mov	r2, #2048
	mov	r0, r4
	bl	memset
	ldr	r1, .LCPI0_5
	mov	r0, r4
	mov	r2, #0
	mov	r3, #8
	bl	ProcTexColorLut_Write
	mov	r0, r4
	bl	C3D_ProcTexColorLutBind
	mov	r0, #0
	bl	C3D_GetTexEnv
	mov	r4, r0
	bl	c3d_tex_env_init
	mov	r0, #6
	mov	r1, #3
	str	r0, [sp]
	mov	r0, r4
	mov	r2, #6
	mov	r3, #6
	bl	c3d_tex_env_src
	mov	r0, r4
	mov	r1, #3
	mov	r2, #0
	bl	c3d_tex_env_func
	add	r4, sp, #336
	mov	r1, #0
	mov	r2, #64
	mov	r0, r4
	bl	memset
	mov	r0, #29884416
	ldr	r1, .LCPI0_6
	ldr	r2, .LCPI0_7
	orr	r0, r0, #1073741824
	stm	sp, {r0, r5}
	mov	r0, r4
	mov	r3, #1056964608
	bl	mtx_persp_tilt
	ldr	r0, .LCPI0_8
	bl	printf
	ldr	r0, .LCPI0_9
	bl	printf
	bl	aptMainLoop
	tst	r0, #255
	beq	.LBB0_8
	lsl	r0, r8, #24
	mov	r10, #0
	asr	r0, r0, #24
	str	r0, [sp, #168]
	ldr	r0, [sp, #184]
	add	r1, r0, #56
	str	r1, [sp, #164]
	add	r1, r0, #52
	str	r1, [sp, #160]
	add	r1, r0, #48
	str	r1, [sp, #156]
	add	r1, r0, #40
	str	r1, [sp, #152]
	add	r1, r0, #36
	str	r1, [sp, #148]
	add	r1, r0, #28
	str	r1, [sp, #144]
	add	r1, r0, #24
	str	r1, [sp, #140]
	add	r1, r0, #16
	str	r1, [sp, #136]
	add	r1, r0, #12
	str	r1, [sp, #132]
	add	r1, r0, #4
	str	r1, [sp, #128]
	ldr	r1, [sp, #176]
	add	r2, r1, #56
	str	r2, [sp, #124]
	add	r2, r1, #52
	str	r2, [sp, #120]
	add	r2, r1, #48
	str	r2, [sp, #116]
	add	r2, r1, #44
	str	r2, [sp, #112]
	add	r2, r1, #40
	str	r2, [sp, #108]
	add	r2, r1, #36
	str	r2, [sp, #104]
	add	r2, r1, #32
	str	r2, [sp, #100]
	add	r2, r1, #28
	str	r2, [sp, #96]
	add	r2, r1, #24
	str	r2, [sp, #92]
	add	r2, r1, #20
	str	r2, [sp, #88]
	add	r2, r1, #16
	str	r2, [sp, #84]
	add	r2, r1, #12
	str	r2, [sp, #80]
	add	r2, r1, #8
	add	r1, r1, #4
	str	r1, [sp, #72]
	ldr	r1, [sp, #180]
	str	r2, [sp, #76]
	add	r2, r1, #48
	str	r2, [sp, #68]
	add	r2, r1, #44
	str	r2, [sp, #64]
	add	r2, r1, #40
	str	r2, [sp, #60]
	add	r2, r1, #36
	str	r2, [sp, #56]
	add	r2, r1, #32
	str	r2, [sp, #52]
	add	r2, r1, #28
	str	r2, [sp, #48]
	add	r2, r1, #24
	str	r2, [sp, #44]
	add	r2, r1, #20
	str	r2, [sp, #40]
	add	r2, r1, #16
	str	r2, [sp, #36]
	add	r2, r1, #12
	str	r2, [sp, #32]
	add	r2, r1, #8
	add	r1, r1, #4
	str	r1, [sp, #24]
	add	r1, r0, #44
	str	r1, [sp, #204]
	add	r1, r0, #32
	str	r1, [sp, #200]
	add	r1, r0, #20
	add	r0, r0, #8
	str	r2, [sp, #28]
	str	r1, [sp, #196]
	str	r0, [sp, #192]
.LBB0_6:
	bl	hidScanInput
	bl	hidKeysDown
	tst	r0, #8
	bne	.LBB0_8
	add	r0, sp, #272
	mov	r1, #0
	mov	r2, #64
	mov	r6, r0
	bl	memset
	ldr	r0, [sp, #192]
	mov	r2, #1065353216
	mov	r1, #0
	mov	r3, #10485760
	orr	r3, r3, #-1073741824
	add	lr, sp, #4096
	str	r2, [r0]
	add	r5, lr, #516
	ldr	r0, [sp, #196]
	add	r4, lr, #428
	str	r1, [r4, #24]
	str	r2, [r0]
	ldr	r0, [sp, #200]
	str	r1, [r4, #28]
	str	r1, [r4, #32]
	str	r2, [r0]
	ldr	r0, [sp, #204]
	str	r2, [r0]
	ldr	r0, [sp, #180]
	str	r2, [r0]
	ldr	r0, [sp, #24]
	str	r1, [r0]
	ldr	r0, [sp, #28]
	str	r1, [r0]
	ldr	r0, [sp, #32]
	str	r2, [r0]
	ldr	r0, [sp, #36]
	str	r1, [r0]
	ldr	r0, [sp, #40]
	str	r3, [r0]
	ldr	r0, [sp, #44]
	str	r2, [r0]
	ldr	r0, [sp, #48]
	str	r1, [r0]
	ldr	r0, [sp, #52]
	str	r1, [r0]
	ldr	r0, [sp, #56]
	str	r2, [r0]
	mov	r2, #64
	ldr	r0, [sp, #60]
	str	r1, [r0]
	ldr	r0, [sp, #64]
	str	r1, [r0]
	ldr	r0, [sp, #68]
	str	r1, [r0]
	mov	r0, r5
	bl	memset
	add	lr, sp, #4096
	mov	r0, r5
	add	r2, lr, #452
	mov	r1, r6
	bl	"c3d::Mtx_Multiply"
	ldr	r0, [sp, #176]
	ldr	r1, [sp, #184]
	ldr	r3, [sp, #76]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r0, [sp, #72]
	ldr	r1, [sp, #128]
	ldr	r11, [r3]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r0, [r4, #88]
	str	r0, [sp, #272]
	ldr	r0, [sp, #124]
	ldr	r3, [sp, #80]
	ldr	r2, [sp, #84]
	ldr	r0, [r0]
	str	r0, [sp, #188]
	ldr	r0, [sp, #120]
	ldr	r8, [r3]
	ldr	r3, [sp, #132]
	ldr	lr, [r0]
	ldr	r0, [sp, #116]
	str	r8, [r3]
	ldr	r3, [sp, #192]
	ldr	r9, [r0]
	ldr	r0, [sp, #112]
	str	r11, [r3]
	ldr	r3, [sp, #136]
	ldr	r12, [r0]
	ldr	r0, [sp, #108]
	ldr	r1, [sp, #88]
	ldr	r2, [r2]
	ldr	r4, [r0]
	ldr	r0, [sp, #104]
	str	r2, [r3]
	ldr	r2, [sp, #196]
	ldr	r5, [r0]
	ldr	r0, [sp, #100]
	ldr	r1, [r1]
	str	r1, [r2]
	ldr	r6, [r0]
	ldr	r0, [sp, #96]
	ldr	r1, [sp, #140]
	ldr	r7, [r0]
	ldr	r0, [sp, #92]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r0, [sp, #144]
	ldr	r1, [sp, #188]
	str	r7, [r0]
	ldr	r0, [sp, #200]
	str	r6, [r0]
	ldr	r0, [sp, #148]
	str	r5, [r0]
	ldr	r0, [sp, #152]
	str	r4, [r0]
	ldr	r0, [sp, #204]
	str	r12, [r0]
	ldr	r0, [sp, #156]
	str	r9, [r0]
	ldr	r0, [sp, #160]
	str	lr, [r0]
	ldr	r0, [sp, #164]
	str	r1, [r0]
	mov	r0, r10
	ldr	r1, .LCPI0_10
	bl	__aeabi_fadd
	ldr	r1, .LCPI0_11
	mov	r4, r0
	bl	__aeabi_fcmpge
	ldr	r1, .LCPI0_12
	mov	r9, r0
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r10, r0
	cmp	r9, #0
	moveq	r10, r4
	add	r4, sp, #272
	mov	r1, r10
	mov	r2, #1
	mov	r0, r4
	bl	mtx_rotate_y
	mov	r0, r10
	mov	r1, #1056964608
	bl	__aeabi_fmul
	mov	r1, r0
	mov	r0, r4
	mov	r2, #1
	bl	mtx_rotate_x
	add	r5, sp, #208
	mov	r1, #0
	mov	r2, #64
	mov	r0, r5
	bl	memset
	add	r1, sp, #336
	mov	r0, r5
	mov	r2, r4
	bl	"c3d::Mtx_Multiply"
	mov	r0, #1
	bl	C3D_FrameBegin
	ldr	r4, [sp, #172]
	mov	r1, #3
	mov	r2, #255
	mov	r3, #0
	mov	r0, r4
	bl	c3d_render_target_clear
	mov	r0, r4
	bl	C3D_FrameDrawOn
	ldr	r1, [sp, #168]
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
	bne	.LBB0_6
.LBB0_8:
	ldr	r0, [sp, #12]
	bl	linearFree
	add	lr, sp, #4096
	add	r0, lr, #432
	bl	shaderProgramFree
	ldr	r0, [sp, #16]
	bl	DVLB_Free
	ldr	r0, [sp, #20]
	bl	free
	bl	C3D_Fini
	bl	gfxExit
	bl	romfs_exit
	mov	r0, #0
	add	sp, sp, #580
	add	sp, sp, #4096
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI0_0:
	.long	".Lcsbs$ProcTex-Example$e"
.LCPI0_1:
	.long	".Lcsbs$ProcTex-Example$f"
.LCPI0_2:
	.long	".Lcsbs$ProcTex-Example$10"
.LCPI0_3:
	.long	".Lcsbs$ProcTex-Example$11"
.LCPI0_4:
	.long	"proctex_example::vertex_list"
.LCPI0_5:
	.long	"proctex_example::rainbow_colors"
.LCPI0_6:
	.long	1065749138
.LCPI0_7:
	.long	1070945621
.LCPI0_8:
	.long	".Lcsbs$ProcTex-Example$13"
.LCPI0_9:
	.long	".Lcsbs$ProcTex-Example$14"
.LCPI0_10:
	.long	1017370378
.LCPI0_11:
	.long	1086918619
.LCPI0_12:
	.long	3234402267
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

	.type	"proctex_example::vertex_list",%object
	.section	.rodata,"a",%progbits
	.p2align	2, 0x0
"proctex_example::vertex_list":
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x40400000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x40400000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x40400000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x40400000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x40400000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x40400000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x40400000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x40400000
	.long	0x40400000
	.long	0xbf800000
	.long	0xbf800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x40400000
	.size	"proctex_example::vertex_list", 720

	.type	"proctex_example::rainbow_colors",%object
	.data
	.p2align	2, 0x0
"proctex_example::rainbow_colors":
	.long	4278190335
	.long	4278222847
	.long	4278255615
	.long	4278255360
	.long	4294967040
	.long	4294901760
	.long	4294901887
	.long	4294902015
	.size	"proctex_example::rainbow_colors", 32

	.type	"runtime::default_random_generator_proc-.state-6353",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-6353"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-6353":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-6353", 1032

	.type	".Lcsbs$ProcTex-Example$e",%object
	.section	.rodata,"a",%progbits
".Lcsbs$ProcTex-Example$e":
	.asciz	"\033[5;1HromfsInit rc: 0x%08lX"
	.size	".Lcsbs$ProcTex-Example$e", 28

	.type	".Lcsbs$ProcTex-Example$f",%object
".Lcsbs$ProcTex-Example$f":
	.asciz	"romfs:/vshader.shbin"
	.size	".Lcsbs$ProcTex-Example$f", 21

	.type	".Lcsbs$ProcTex-Example$10",%object
".Lcsbs$ProcTex-Example$10":
	.asciz	"rb"
	.size	".Lcsbs$ProcTex-Example$10", 3

	.type	".Lcsbs$ProcTex-Example$11",%object
".Lcsbs$ProcTex-Example$11":
	.asciz	"mvp"
	.size	".Lcsbs$ProcTex-Example$11", 4

	.type	".Lcsbs$ProcTex-Example$13",%object
".Lcsbs$ProcTex-Example$13":
	.asciz	"\033[1;1HProcTex-Example (Phase 9)"
	.size	".Lcsbs$ProcTex-Example$13", 32

	.type	".Lcsbs$ProcTex-Example$14",%object
".Lcsbs$ProcTex-Example$14":
	.asciz	"\033[2;1HPress START to exit"
	.size	".Lcsbs$ProcTex-Example$14", 26

	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1
