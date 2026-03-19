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
	.file	"POC-Example"
	.text
	.p2align	2
	.type	"__$equal$$struct{file_path:string,line:i32,column:i32,procedure:string}",%function
	.code	32
"__$equal$$struct{file_path:string,line:i32,column:i32,procedure:string}":
	.fnstart
	cmp	r0, r1
	moveq	r0, #1
	moveq	pc, lr
.LBB0_1:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, sp, #28
	ldr	r2, [r1, #4]
	mov	r5, r0
	ldr	r6, [r0, #4]
	mov	r0, #0
	cmp	r6, r2
	bne	.LBB0_36
	cmp	r6, #0
	ldrne	r2, [r1]
	ldrne	r3, [r5]
	strne	r2, [sp, #16]
	strne	r3, [sp, #12]
	cmpne	r3, r2
	bne	.LBB0_22
.LBB0_3:
	ldr	r2, [r1, #8]
	ldr	r3, [r5, #8]
	cmp	r3, r2
	bne	.LBB0_36
	ldr	r2, [r1, #12]
	ldr	r3, [r5, #12]
	cmp	r3, r2
	bne	.LBB0_36
	ldr	r2, [r1, #20]
	ldr	r3, [r5, #20]
	cmp	r3, r2
	bne	.LBB0_36
	cmp	r3, #0
	beq	.LBB0_21
	ldr	r0, [r1, #16]
	ldr	r1, [r5, #16]
	str	r0, [sp, #16]
	cmp	r1, r0
	str	r1, [sp, #12]
	beq	.LBB0_21
	mov	r11, #0
	cmp	r3, #8
	blo	.LBB0_17
	bics	lr, r3, #15
	beq	.LBB0_14
	sub	r0, lr, #1
	mov	r7, #0
	bic	r0, r0, #15
	str	r3, [sp, #8]
	add	r11, r0, #16
.LBB0_11:
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #12]
	ldrb	r0, [r1, r7]!
	ldrb	r3, [r2, r7]!
	str	r0, [sp, #24]
	str	r3, [sp, #20]
	ldrb	r0, [r1, #15]
	ldrb	r3, [r2, #15]
	ldrb	r6, [r2, #14]
	subs	r0, r3, r0
	ldrb	r3, [r1, #14]
	movne	r0, #1
	ldrb	r12, [r2, #12]
	subs	r3, r6, r3
	ldrb	r6, [r2, #13]
	movne	r3, #1
	orr	r0, r3, r0, lsl #1
	ldrb	r3, [r1, #13]
	ldrb	r5, [r2, #10]
	subs	r3, r6, r3
	ldrb	r6, [r1, #12]
	movne	r3, #1
	ldrb	r4, [r2, #8]
	subs	r6, r12, r6
	ldrb	r9, [r2, #1]
	movne	r6, #1
	orr	r3, r6, r3, lsl #1
	orr	r0, r3, r0, lsl #2
	ldrb	r3, [r1, #11]
	ldrb	r6, [r2, #11]
	ldrb	r10, [r2, #2]
	subs	r3, r6, r3
	ldrb	r6, [r1, #10]
	movne	r3, #1
	ldrb	r8, [r2, #3]
	subs	r6, r5, r6
	ldrb	r5, [r2, #9]
	movne	r6, #1
	orr	r3, r6, r3, lsl #1
	ldrb	r6, [r1, #9]
	subs	r6, r5, r6
	ldrb	r5, [r1, #8]
	movne	r6, #1
	subs	r5, r4, r5
	ldrb	r4, [r1, #2]
	movne	r5, #1
	orr	r6, r5, r6, lsl #1
	orr	r3, r6, r3, lsl #2
	ldrb	r6, [r2, #7]
	orr	r12, r3, r0, lsl #4
	ldrb	r0, [r1, #7]
	ldrb	r5, [r2, #6]
	subs	r0, r6, r0
	ldrb	r6, [r1, #6]
	movne	r0, #1
	ldrb	r3, [r1, #3]
	subs	r6, r5, r6
	ldrb	r5, [r2, #5]
	movne	r6, #1
	orr	r0, r6, r0, lsl #1
	ldrb	r6, [r1, #5]
	ldrb	r2, [r2, #4]
	subs	r6, r5, r6
	ldrb	r5, [r1, #1]
	ldrb	r1, [r1, #4]
	movne	r6, #1
	subs	r1, r2, r1
	movne	r1, #1
	orr	r1, r1, r6, lsl #1
	orr	r0, r1, r0, lsl #2
	subs	r1, r8, r3
	movne	r1, #1
	subs	r2, r10, r4
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #20]
	subs	r2, r3, r2
	movne	r2, #1
	subs	r3, r9, r5
	movne	r3, #1
	orr	r2, r2, r3, lsl #1
	orr	r1, r2, r1, lsl #2
	orr	r0, r1, r0, lsl #4
	mov	r1, #255
	and	r0, r0, #255
	orr	r1, r1, #65280
	orr	r0, r0, r12, lsl #8
	tst	r0, r1
	bne	.LBB0_35
	add	r7, r7, #16
	cmp	r7, lr
	blo	.LBB0_11
	ldr	r3, [sp, #8]
.LBB0_14:
	sub	r0, r3, r11
	bic	r0, r0, #3
	cmp	r11, r0
	bhs	.LBB0_17
.LBB0_15:
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #12]
	ldr	r1, [r1, r11]
	ldr	r2, [r2, r11]
	cmp	r2, r1
	bne	.LBB0_35
	add	r11, r11, #4
	cmp	r11, r0
	blo	.LBB0_15
.LBB0_17:
	cmp	r3, r11
	bls	.LBB0_21
	ldr	r0, [sp, #12]
	sub	r2, r3, r11
	ldr	r1, [sp, #16]
	add	r0, r0, r11
	add	r1, r1, r11
.LBB0_19:
	ldrb	r3, [r0], #1
	ldrb	r7, [r1], #1
	cmp	r3, r7
	bne	.LBB0_35
	subs	r2, r2, #1
	bne	.LBB0_19
.LBB0_21:
	mov	r0, #1
	b	.LBB0_36
.LBB0_22:
	mov	lr, #0
	cmp	r6, #8
	blo	.LBB0_31
	bics	r3, r6, #15
	beq	.LBB0_28
	sub	r2, r3, #1
	mov	r7, #0
	bic	r2, r2, #15
	str	r6, [sp]
	add	lr, r2, #16
	stmib	sp, {r1, r5}
.LBB0_25:
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r3, [sp, #12]
	ldrb	r0, [r2, r7]!
	str	r0, [sp, #24]
	ldrb	r0, [r3, r7]!
	str	r0, [sp, #20]
	ldrb	r4, [r2, #15]
	ldrb	r0, [r3, #15]
	ldrb	r6, [r3, #14]
	subs	r0, r0, r4
	ldrb	r4, [r2, #14]
	movne	r0, #1
	ldrb	r5, [r3, #12]
	subs	r4, r6, r4
	ldrb	r6, [r3, #13]
	movne	r4, #1
	orr	r0, r4, r0, lsl #1
	ldrb	r4, [r2, #13]
	ldrb	r10, [r2, #3]
	subs	r4, r6, r4
	ldrb	r6, [r2, #12]
	movne	r4, #1
	ldrb	r11, [r3, #1]
	subs	r5, r5, r6
	ldrb	r6, [r3, #10]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	orr	r8, r4, r0, lsl #2
	ldrb	r4, [r2, #11]
	ldrb	r5, [r3, #11]
	ldrb	r0, [r3, #8]
	subs	r4, r5, r4
	ldrb	r5, [r2, #10]
	movne	r4, #1
	ldrb	r9, [r3, #2]
	subs	r5, r6, r5
	ldrb	r6, [r3, #9]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	ldrb	r5, [r2, #9]
	ldrb	r12, [r3, #3]
	subs	r5, r6, r5
	ldrb	r6, [r2, #8]
	movne	r5, #1
	subs	r0, r0, r6
	ldrb	r6, [r2, #2]
	movne	r0, #1
	orr	r0, r0, r5, lsl #1
	ldrb	r5, [r3, #6]
	orr	r0, r0, r4, lsl #2
	ldrb	r4, [r3, #7]
	orr	r8, r0, r8, lsl #4
	ldrb	r0, [r2, #7]
	subs	r0, r4, r0
	ldrb	r4, [r2, #6]
	movne	r0, #1
	subs	r4, r5, r4
	ldrb	r5, [r3, #5]
	movne	r4, #1
	orr	r0, r4, r0, lsl #1
	ldrb	r4, [r2, #5]
	ldrb	r3, [r3, #4]
	subs	r4, r5, r4
	ldrb	r5, [r2, #1]
	ldrb	r2, [r2, #4]
	movne	r4, #1
	subs	r2, r3, r2
	movne	r2, #1
	orr	r2, r2, r4, lsl #1
	orr	r0, r2, r0, lsl #2
	subs	r2, r12, r10
	movne	r2, #1
	subs	r3, r9, r6
	movne	r3, #1
	orr	r2, r3, r2, lsl #1
	ldr	r3, [sp, #24]
	ldr	r6, [sp, #20]
	subs	r3, r6, r3
	movne	r3, #1
	subs	r6, r11, r5
	movne	r6, #1
	orr	r3, r3, r6, lsl #1
	orr	r2, r3, r2, lsl #2
	orr	r0, r2, r0, lsl #4
	mov	r2, #255
	and	r0, r0, #255
	orr	r2, r2, #65280
	orr	r0, r0, r8, lsl #8
	tst	r0, r2
	bne	.LBB0_35
	add	r7, r7, #16
	mov	r3, r1
	cmp	r7, r1
	blo	.LBB0_25
	ldr	r6, [sp]
	mov	r0, #0
	ldmib	sp, {r1, r5}
.LBB0_28:
	sub	r2, r6, lr
	bic	r2, r2, #3
	cmp	lr, r2
	bhs	.LBB0_31
.LBB0_29:
	ldr	r3, [sp, #16]
	ldr	r7, [r3, lr]
	ldr	r3, [sp, #12]
	ldr	r3, [r3, lr]
	cmp	r3, r7
	bne	.LBB0_35
	add	lr, lr, #4
	cmp	lr, r2
	blo	.LBB0_29
.LBB0_31:
	cmp	r6, lr
	bls	.LBB0_3
	ldr	r2, [sp, #12]
	sub	r7, r6, lr
	ldr	r3, [sp, #16]
	add	r2, r2, lr
	add	r3, r3, lr
.LBB0_33:
	ldrb	r6, [r2], #1
	ldrb	r4, [r3], #1
	cmp	r6, r4
	bne	.LBB0_35
	subs	r7, r7, #1
	bne	.LBB0_33
	b	.LBB0_3
.LBB0_35:
	mov	r0, #0
.LBB0_36:
	add	sp, sp, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.Lfunc_end0:
	.size	"__$equal$$struct{file_path:string,line:i32,column:i32,procedure:string}", .Lfunc_end0-"__$equal$$struct{file_path:string,line:i32,column:i32,procedure:string}"
	.cantunwind
	.fnend

	.p2align	2
	.type	"__$equal$$struct{name:string,base:^runtime::Type_Info,pkg:string,loc:^runtime::Source_Code_Location}",%function
	.code	32
"__$equal$$struct{name:string,base:^runtime::Type_Info,pkg:string,loc:^runtime::Source_Code_Location}":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#36
	sub	sp, sp, #36
	mov	r5, #1
	cmp	r0, r1
	beq	.LBB1_32
	mov	r9, r0
	ldr	r0, [r0, #4]
	ldr	r2, [r1, #4]
	str	r0, [sp, #16]
	cmp	r0, r2
	bne	.LBB1_31
	ldr	r0, [sp, #16]
	cmp	r0, #0
	ldrne	r0, [r1]
	ldrne	r2, [r9]
	strne	r0, [sp, #24]
	strne	r2, [sp, #20]
	cmpne	r2, r0
	bne	.LBB1_7
.LBB1_3:
	ldr	r0, [r1, #8]
	ldr	r2, [r9, #8]
	cmp	r2, r0
	bne	.LBB1_31
	ldr	r2, [r9, #16]
	ldr	r0, [r1, #16]
	str	r2, [sp, #4]
	cmp	r2, r0
	bne	.LBB1_31
	ldr	r0, [sp, #4]
	cmp	r0, #0
	ldrne	r0, [r1, #12]
	ldrne	r2, [r9, #12]
	strne	r0, [sp, #20]
	strne	r2, [sp, #16]
	cmpne	r2, r0
	bne	.LBB1_19
.LBB1_6:
	ldr	r0, [r1, #20]
	ldr	r1, [r9, #20]
	cmp	r1, r0
	movne	r5, #0
	b	.LBB1_32
.LBB1_7:
	ldr	r0, [sp, #16]
	mov	r12, #0
	cmp	r0, #8
	blo	.LBB1_15
	ldr	r0, [sp, #16]
	bics	lr, r0, #15
	beq	.LBB1_12
	sub	r2, lr, #1
	mov	r6, #0
	bic	r2, r2, #15
	str	r9, [sp, #8]
	add	r12, r2, #16
	str	r1, [sp, #12]
.LBB1_10:
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #20]
	ldrb	r0, [r3, r6]!
	str	r0, [sp, #32]
	ldrb	r0, [r2, r6]!
	str	r0, [sp, #28]
	ldrb	r4, [r3, #15]
	ldrb	r0, [r2, #15]
	ldrb	r7, [r2, #14]
	subs	r0, r0, r4
	ldrb	r4, [r3, #14]
	movne	r0, #1
	ldrb	r5, [r2, #12]
	subs	r4, r7, r4
	ldrb	r7, [r2, #13]
	movne	r4, #1
	orr	r0, r4, r0, lsl #1
	ldrb	r4, [r3, #13]
	ldrb	r1, [r2, #8]
	subs	r4, r7, r4
	ldrb	r7, [r3, #12]
	movne	r4, #1
	ldrb	r10, [r2, #1]
	subs	r5, r5, r7
	ldrb	r7, [r2, #10]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	orr	r0, r4, r0, lsl #2
	ldrb	r4, [r3, #11]
	ldrb	r5, [r2, #11]
	ldrb	r11, [r2, #2]
	subs	r4, r5, r4
	ldrb	r5, [r3, #10]
	movne	r4, #1
	ldrb	r9, [r2, #3]
	subs	r5, r7, r5
	ldrb	r7, [r2, #9]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	ldrb	r5, [r3, #9]
	subs	r5, r7, r5
	ldrb	r7, [r3, #8]
	movne	r5, #1
	subs	r1, r1, r7
	ldrb	r7, [r3, #3]
	movne	r1, #1
	orr	r1, r1, r5, lsl #1
	ldrb	r5, [r3, #2]
	orr	r1, r1, r4, lsl #2
	ldrb	r4, [r2, #6]
	orr	r8, r1, r0, lsl #4
	ldrb	r0, [r3, #7]
	ldrb	r1, [r2, #7]
	subs	r0, r1, r0
	ldrb	r1, [r3, #6]
	movne	r0, #1
	subs	r1, r4, r1
	ldrb	r4, [r2, #5]
	movne	r1, #1
	orr	r0, r1, r0, lsl #1
	ldrb	r1, [r3, #5]
	ldrb	r2, [r2, #4]
	subs	r1, r4, r1
	ldrb	r4, [r3, #1]
	ldrb	r3, [r3, #4]
	movne	r1, #1
	subs	r2, r2, r3
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	orr	r0, r1, r0, lsl #2
	subs	r1, r9, r7
	movne	r1, #1
	subs	r2, r11, r5
	movne	r2, #1
	orr	r7, r2, r1, lsl #1
	ldr	r1, [sp, #32]
	mov	r5, #1
	ldr	r2, [sp, #28]
	ldr	r9, [sp, #8]
	subs	r2, r2, r1
	ldr	r1, [sp, #12]
	movne	r2, #1
	subs	r3, r10, r4
	movne	r3, #1
	orr	r2, r2, r3, lsl #1
	orr	r2, r2, r7, lsl #2
	orr	r0, r2, r0, lsl #4
	mov	r2, #255
	and	r0, r0, #255
	orr	r2, r2, #65280
	orr	r0, r0, r8, lsl #8
	tst	r0, r2
	bne	.LBB1_31
	add	r6, r6, #16
	cmp	r6, lr
	blo	.LBB1_10
.LBB1_12:
	ldr	r0, [sp, #16]
	sub	r0, r0, r12
	bic	r2, r0, #3
	cmp	r12, r2
	bhs	.LBB1_15
.LBB1_13:
	ldr	r0, [sp, #24]
	ldr	r3, [sp, #20]
	ldr	r0, [r0, r12]
	ldr	r3, [r3, r12]
	cmp	r3, r0
	bne	.LBB1_31
	add	r12, r12, #4
	cmp	r12, r2
	blo	.LBB1_13
.LBB1_15:
	ldr	r0, [sp, #16]
	cmp	r0, r12
	bls	.LBB1_3
	ldr	r0, [sp, #20]
	add	r2, r0, r12
	ldr	r0, [sp, #24]
	add	r3, r0, r12
	ldr	r0, [sp, #16]
	sub	r7, r0, r12
.LBB1_17:
	ldrb	r0, [r2], #1
	ldrb	r6, [r3], #1
	cmp	r0, r6
	bne	.LBB1_31
	subs	r7, r7, #1
	bne	.LBB1_17
	b	.LBB1_3
.LBB1_19:
	ldr	r0, [sp, #4]
	mov	r8, #0
	cmp	r0, #8
	blo	.LBB1_27
	ldr	r0, [sp, #4]
	bics	r2, r0, #15
	beq	.LBB1_24
	sub	r0, r2, #1
	mov	r6, #0
	bic	r0, r0, #15
	str	r1, [sp, #12]
	add	r8, r0, #16
	str	r2, [sp]
.LBB1_22:
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #16]
	ldrb	r0, [r3, r6]!
	ldrb	r1, [r2, r6]!
	str	r0, [sp, #32]
	str	r1, [sp, #28]
	ldrb	r0, [r3, #15]
	ldrb	r1, [r2, #15]
	ldrb	r7, [r2, #14]
	subs	r0, r1, r0
	ldrb	r1, [r3, #14]
	movne	r0, #1
	ldrb	r5, [r2, #12]
	subs	r1, r7, r1
	ldrb	r7, [r2, #13]
	movne	r1, #1
	orr	r0, r1, r0, lsl #1
	ldrb	r1, [r3, #13]
	ldrb	r4, [r2, #8]
	subs	r1, r7, r1
	ldrb	r7, [r3, #12]
	movne	r1, #1
	ldrb	r12, [r3, #2]
	subs	r5, r5, r7
	ldrb	r7, [r2, #10]
	movne	r5, #1
	orr	r1, r5, r1, lsl #1
	orr	r0, r1, r0, lsl #2
	ldrb	r1, [r3, #11]
	ldrb	r5, [r2, #11]
	ldrb	r10, [r2, #1]
	subs	r1, r5, r1
	ldrb	r5, [r3, #10]
	movne	r1, #1
	ldrb	r11, [r2, #2]
	subs	r5, r7, r5
	ldrb	r7, [r2, #9]
	movne	r5, #1
	orr	r1, r5, r1, lsl #1
	ldrb	r5, [r3, #9]
	ldrb	lr, [r2, #3]
	subs	r5, r7, r5
	ldrb	r7, [r3, #8]
	movne	r5, #1
	subs	r4, r4, r7
	ldrb	r7, [r3, #3]
	movne	r4, #1
	orr	r4, r4, r5, lsl #1
	mov	r5, #1
	orr	r1, r4, r1, lsl #2
	ldrb	r4, [r2, #6]
	orr	r0, r1, r0, lsl #4
	str	r0, [sp, #24]
	ldrb	r0, [r3, #7]
	ldrb	r1, [r2, #7]
	subs	r0, r1, r0
	ldrb	r1, [r3, #6]
	movne	r0, #1
	subs	r1, r4, r1
	ldrb	r4, [r2, #5]
	movne	r1, #1
	orr	r0, r1, r0, lsl #1
	ldrb	r1, [r3, #5]
	ldrb	r2, [r2, #4]
	subs	r1, r4, r1
	ldrb	r4, [r3, #1]
	ldrb	r3, [r3, #4]
	movne	r1, #1
	subs	r2, r2, r3
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	orr	r0, r1, r0, lsl #2
	subs	r1, lr, r7
	movne	r1, #1
	subs	r2, r11, r12
	movne	r2, #1
	orr	r7, r2, r1, lsl #1
	ldr	r1, [sp, #32]
	ldr	r2, [sp, #28]
	subs	r2, r2, r1
	ldr	r1, [sp, #12]
	movne	r2, #1
	subs	r3, r10, r4
	movne	r3, #1
	orr	r2, r2, r3, lsl #1
	orr	r2, r2, r7, lsl #2
	orr	r0, r2, r0, lsl #4
	ldr	r2, [sp, #24]
	and	r0, r0, #255
	orr	r0, r0, r2, lsl #8
	mov	r2, #255
	orr	r2, r2, #65280
	tst	r0, r2
	bne	.LBB1_31
	ldr	r2, [sp]
	add	r6, r6, #16
	cmp	r6, r2
	blo	.LBB1_22
.LBB1_24:
	ldr	r0, [sp, #4]
	sub	r0, r0, r8
	bic	r2, r0, #3
	cmp	r8, r2
	bhs	.LBB1_27
.LBB1_25:
	ldr	r0, [sp, #20]
	ldr	r3, [sp, #16]
	ldr	r0, [r0, r8]
	ldr	r3, [r3, r8]
	cmp	r3, r0
	bne	.LBB1_31
	add	r8, r8, #4
	cmp	r8, r2
	blo	.LBB1_25
.LBB1_27:
	ldr	r0, [sp, #4]
	cmp	r0, r8
	bls	.LBB1_6
	ldr	r0, [sp, #16]
	add	r2, r0, r8
	ldr	r0, [sp, #20]
	add	r3, r0, r8
	ldr	r0, [sp, #4]
	sub	r7, r0, r8
.LBB1_29:
	ldrb	r0, [r2], #1
	ldrb	r6, [r3], #1
	cmp	r0, r6
	bne	.LBB1_31
	subs	r7, r7, #1
	bne	.LBB1_29
	b	.LBB1_6
.LBB1_31:
	mov	r5, #0
.LBB1_32:
	mov	r0, r5
	add	sp, sp, #36
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.Lfunc_end1:
	.size	"__$equal$$struct{name:string,base:^runtime::Type_Info,pkg:string,loc:^runtime::Source_Code_Location}", .Lfunc_end1-"__$equal$$struct{name:string,base:^runtime::Type_Info,pkg:string,loc:^runtime::Source_Code_Location}"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::nil_allocator_proc",%function
	.code	32
"runtime::nil_allocator_proc":
	.fnstart
	.save	{r11, lr}
	push	{r11, lr}
	and	r1, r2, #255
	cmp	r1, #7
	bhi	.LBB2_6
	mov	r12, #1
	mov	r2, #52
	tst	r2, r12, lsl r1
	bne	.LBB2_5
	mov	r2, #65
	mov	lr, #1
	tst	r2, r12, lsl r1
	bne	.LBB2_7
	mov	r2, #136
	tst	r2, r12, lsl r1
	beq	.LBB2_6
	cmp	r3, #0
	movne	r3, #1
	mov	lr, r3
	b	.LBB2_7
.LBB2_5:
	mov	lr, #4
	b	.LBB2_7
.LBB2_6:
	mov	lr, #0
.LBB2_7:
	mov	r1, #0
	strb	lr, [r0, #8]
	str	r1, [r0]
	str	r1, [r0, #4]
	pop	{r11, lr}
	mov	pc, lr
.Lfunc_end2:
	.size	"runtime::nil_allocator_proc", .Lfunc_end2-"runtime::nil_allocator_proc"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::udivmod128",%function
	.code	32
"runtime::udivmod128":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, sp, #28
	mov	r4, r2
	ldr	r10, [sp, #68]
	ldr	r6, [sp, #64]
	mov	r12, r0
	ldr	r7, [sp, #84]
	mov	r9, r3
	ldr	r2, [sp, #80]
	orrs	r0, r6, r10
	ldr	r8, [sp, #76]
	ldr	r11, [sp, #72]
	ldr	r5, [sp, #88]
	beq	.LBB3_6
	orrs	r0, r11, r8
	beq	.LBB3_8
	orrs	r0, r2, r7
	beq	.LBB3_12
	mov	r0, r7
	mov	r11, r12
	mov	r8, r4
	mov	r5, r2
	bl	__clzsi2
	mov	r4, r0
	mov	r0, r5
	bl	__clzsi2
	cmp	r7, #0
	ldr	r1, .LCPI3_0
	addeq	r4, r0, #32
	orr	r0, r6, r6, lsr #1
	mov	r6, #32
	orr	r0, r0, r0, lsr #2
	orr	r0, r0, r0, lsr #4
	orr	r0, r0, r0, lsr #8
	orr	r0, r0, r0, lsr #16
	mvn	r0, r0
	and	r1, r1, r0, lsr #1
	sub	r0, r0, r1
	ldr	r1, .LCPI3_1
	and	r2, r1, r0, lsr #2
	and	r0, r0, r1
	add	r0, r0, r2
	ldr	r1, .LCPI3_2
	add	r0, r0, r0, lsr #4
	and	r0, r0, r1
	ldr	r1, .LCPI3_3
	mul	r5, r0, r1
	mov	r0, r10
	bl	__clzsi2
	cmp	r10, #0
	addeq	r0, r6, r5, lsr #24
	sub	r1, r4, r0
	cmp	r1, #64
	bhs	.LBB3_29
	add	lr, r1, #1
	str	r11, [sp, #4]
	cmp	lr, #64
	bne	.LBB3_30
	mov	r6, r8
	mov	r2, #0
	mov	lr, #64
	mov	r12, #0
	ldr	r11, [sp, #64]
	b	.LBB3_26
.LBB3_6:
	orrs	r0, r2, r7
	beq	.LBB3_17
	cmp	r5, #0
	movne	r0, #0
	stmne	r5, {r4, r9}
	strne	r0, [r5, #8]
	strne	r0, [r5, #12]
	mov	r0, #0
	str	r0, [r12]
	str	r0, [r12, #4]
	str	r0, [r12, #8]
	str	r0, [r12, #12]
	b	.LBB3_42
.LBB3_8:
	orrs	r0, r2, r7
	beq	.LBB3_44
	orrs	r0, r4, r9
	beq	.LBB3_21
	subs	r0, r2, #1
	sbc	r1, r7, #0
	and	r6, r2, r0
	and	r3, r7, r1
	orrs	r3, r6, r3
	bne	.LBB3_28
	ldr	r3, [sp, #88]
	ldr	r6, [sp, #64]
	cmp	r3, #0
	andne	r0, r0, r6
	andne	r1, r1, r10
	strne	r0, [r3, #8]
	mov	r0, #0
	strne	r1, [r3, #12]
	mov	r5, r6
	str	r0, [r12, #12]
	str	r0, [r12, #8]
	rsb	r0, r7, #0
	ldr	r1, .LCPI3_4
	and	r0, r7, r0
	stmne	r3, {r4, r9}
	cmp	r7, #0
	mul	r3, r0, r1
	adr	r0, .LCPI3_6
	ldrb	r6, [r0, r3, lsr #27]
	rsb	r3, r2, #0
	and	r3, r2, r3
	moveq	r6, #32
	cmp	r2, #0
	mul	r7, r3, r1
	ldrb	r0, [r0, r7, lsr #27]
	moveq	r0, #32
	addeq	r0, r6, #32
	subs	r2, r0, #32
	lsr	r1, r10, r0
	movpl	r1, #0
	str	r1, [r12, #4]
	lsr	r1, r5, r0
	rsb	r0, r0, #32
	orr	r0, r1, r10, lsl r0
	lsrpl	r0, r10, r2
	str	r0, [r12]
	b	.LBB3_42
.LBB3_12:
	subs	r0, r11, #1
	sbc	r1, r8, #0
	and	r2, r11, r0
	and	r3, r8, r1
	orrs	r2, r2, r3
	bne	.LBB3_24
	ldr	r3, [sp, #88]
	cmp	r3, #0
	beq	.LBB3_15
	mov	r2, #0
	and	r0, r0, r4
	and	r1, r1, r9
	stm	r3, {r0, r1, r2}
	str	r2, [r3, #12]
.LBB3_15:
	eor	r0, r11, #1
	orrs	r0, r0, r8
	bne	.LBB3_33
	stm	r12, {r4, r9}
	str	r6, [r12, #8]
	str	r10, [r12, #12]
	b	.LBB3_42
.LBB3_17:
	cmp	r5, #0
	beq	.LBB3_31
	orrs	r0, r11, r8
	beq	.LBB3_44
	mov	r0, #0
	mov	r1, r9
	str	r0, [r5, #8]
	mov	r2, r11
	str	r0, [r5, #12]
	mov	r0, r4
	mov	r3, r8
	mov	r6, r12
	bl	__aeabi_uldivmod
	stm	r5, {r2, r3}
	mov	r12, r6
	b	.LBB3_32
.LCPI3_6:
	.ascii	"\000\001\034\002\035\016\030\003\036\026\024\017\031\021\004\b\037\033\r\027\025\023\020\007\032\f\022\006\013\005\n\t"
	.p2align	2
.LBB3_21:
	mov	r0, r6
	mov	r1, r10
	mov	r3, r7
	mov	r4, r12
	mov	r8, r2
	mov	r9, r7
	bl	__aeabi_uldivmod
	ldr	r5, [sp, #88]
	cmp	r5, #0
	beq	.LBB3_23
	umull	r3, r7, r0, r8
	mov	r2, #0
	str	r2, [r5]
	subs	r3, r6, r3
	mla	r6, r0, r9, r7
	mla	r7, r1, r8, r6
	sbc	r7, r10, r7
	stmib	r5, {r2, r3, r7}
.LBB3_23:
	mov	r2, #0
	stm	r4, {r0, r1, r2}
	str	r2, [r4, #12]
	b	.LBB3_42
.LBB3_24:
	mov	r0, r8
	mov	r5, r6
	str	r12, [sp, #4]
	mov	r6, r4
	bl	__clzsi2
	mov	r4, r0
	mov	r0, r11
	mov	r7, r8
	mov	r8, r5
	bl	__clzsi2
	cmp	r7, #0
	ldr	r1, .LCPI3_0
	addeq	r4, r0, #32
	orr	r0, r5, r5, lsr #1
	mov	r7, #32
	orr	r0, r0, r0, lsr #2
	orr	r0, r0, r0, lsr #4
	orr	r0, r0, r0, lsr #8
	orr	r0, r0, r0, lsr #16
	mvn	r0, r0
	and	r1, r1, r0, lsr #1
	sub	r0, r0, r1
	ldr	r1, .LCPI3_1
	and	r2, r1, r0, lsr #2
	and	r0, r0, r1
	add	r0, r0, r2
	ldr	r1, .LCPI3_2
	add	r0, r0, r0, lsr #4
	and	r0, r0, r1
	ldr	r1, .LCPI3_3
	mul	r5, r0, r1
	mov	r0, r10
	bl	__clzsi2
	cmp	r10, #0
	addeq	r0, r7, r5, lsr #24
	sub	r7, r4, r0
	add	lr, r7, #65
	cmp	lr, #64
	bne	.LBB3_35
	mov	r2, #0
	mov	lr, #64
	mov	r12, #0
	mov	r11, r8
.LBB3_26:
	mov	r8, #0
.LBB3_27:
	mov	r1, #0
	b	.LBB3_39
.LBB3_28:
	mov	r0, r7
	mov	r11, r12
	mov	r8, r4
	mov	r5, r2
	bl	__clzsi2
	mov	r4, r0
	mov	r0, r5
	bl	__clzsi2
	cmp	r7, #0
	ldr	r7, [sp, #64]
	addeq	r4, r0, #32
	ldr	r1, .LCPI3_0
	mov	r6, #32
	orr	r0, r7, r7, lsr #1
	orr	r0, r0, r0, lsr #2
	orr	r0, r0, r0, lsr #4
	orr	r0, r0, r0, lsr #8
	orr	r0, r0, r0, lsr #16
	mvn	r0, r0
	and	r1, r1, r0, lsr #1
	sub	r0, r0, r1
	ldr	r1, .LCPI3_1
	and	r2, r1, r0, lsr #2
	and	r0, r0, r1
	add	r0, r0, r2
	ldr	r1, .LCPI3_2
	add	r0, r0, r0, lsr #4
	and	r0, r0, r1
	ldr	r1, .LCPI3_3
	mul	r5, r0, r1
	mov	r0, r10
	bl	__clzsi2
	cmp	r10, #0
	addeq	r0, r6, r5, lsr #24
	sub	r0, r4, r0
	cmp	r0, #63
	blo	.LBB3_37
.LBB3_29:
	ldr	r1, [sp, #88]
	cmp	r1, #0
	ldrne	r0, [sp, #64]
	strne	r0, [r1, #8]
	mov	r0, #0
	stmne	r1, {r8, r9}
	strne	r10, [r1, #12]
	str	r0, [r11]
	str	r0, [r11, #4]
	str	r0, [r11, #8]
	str	r0, [r11, #12]
	b	.LBB3_42
.LBB3_30:
	rsb	r2, r1, #63
	ldr	r12, [sp, #64]
	rsb	r3, r2, #32
	rsbs	r1, r1, #31
	lsl	r4, r8, r2
	rsb	r6, lr, #32
	lsr	r0, r8, r3
	lsr	r3, r12, r3
	orr	r0, r0, r9, lsl r2
	orr	r3, r3, r10, lsl r2
	lslpl	r0, r8, r1
	lslpl	r3, r12, r1
	lsl	r1, r12, r2
	lsr	r2, r8, lr
	movpl	r4, #0
	movpl	r1, #0
	subs	r7, lr, #32
	orr	r2, r2, r9, lsl r6
	lsrpl	r2, r9, r7
	orr	r11, r1, r2
	lsr	r2, r9, lr
	lsr	r1, r10, lr
	movpl	r2, #0
	orr	r3, r3, r2
	lsr	r2, r12, lr
	orr	r8, r2, r10, lsl r6
	lsrpl	r8, r10, r7
	movpl	r1, #0
	mov	r2, #0
	mov	r12, #0
	mov	r6, r4
	mov	r9, r0
	mov	r10, r3
	b	.LBB3_39
.LBB3_31:
	orrs	r0, r11, r8
	beq	.LBB3_44
.LBB3_32:
	mov	r0, #0
	mov	r1, r9
	str	r0, [r12, #8]
	mov	r2, r11
	str	r0, [r12, #12]
	mov	r0, r4
	mov	r3, r8
	mov	r4, r12
	bl	__aeabi_uldivmod
	stm	r4, {r0, r1}
	b	.LBB3_42
.LBB3_33:
	rsb	r0, r8, #0
	ldr	r1, .LCPI3_4
	rsb	r3, r11, #0
	and	r0, r8, r0
	and	r3, r11, r3
	cmp	r8, #0
	mul	r2, r0, r1
	adr	r0, .LCPI3_7
	mov	r5, r6
	mul	r7, r3, r1
	ldrb	r2, [r0, r2, lsr #27]
	moveq	r2, #32
	ldrb	r0, [r0, r7, lsr #27]
	cmp	r11, #0
	moveq	r0, #32
	addeq	r0, r2, #32
	rsb	r1, r0, #64
	rsbs	r3, r0, #32
	rsb	r2, r1, #32
	lsr	r5, r5, r0
	orr	r5, r5, r10, lsl r3
	lsr	r4, r4, r0
	lsr	r2, r6, r2
	lsr	r7, r10, r0
	orr	r2, r2, r10, lsl r1
	lsl	r1, r6, r1
	lslpl	r2, r6, r3
	movpl	r1, #0
	subs	r6, r0, #32
	orr	r3, r4, r9, lsl r3
	movpl	r7, #0
	lsrpl	r5, r10, r6
	lsrpl	r3, r9, r6
	lsr	r6, r9, r0
	str	r5, [r12, #8]
	movpl	r6, #0
	cmp	r0, #0
	orrne	r3, r3, r1
	orrne	r6, r6, r2
	stm	r12, {r3, r6}
	str	r7, [r12, #12]
	b	.LBB3_42
.LCPI3_7:
	.ascii	"\000\001\034\002\035\016\030\003\036\026\024\017\031\021\004\b\037\033\r\027\025\023\020\007\032\f\022\006\013\005\n\t"
	.p2align	2
.LBB3_35:
	mov	r1, r8
	cmp	lr, #63
	bhi	.LBB3_43
	rsb	r2, lr, #32
	lsr	r0, r1, lr
	lsr	r5, r6, lr
	mov	r12, r1
	orr	r8, r0, r10, lsl r2
	subs	r0, lr, #32
	orr	r2, r5, r9, lsl r2
	lsr	r1, r10, lr
	lsr	r3, r9, lr
	lsrpl	r8, r10, r0
	lsrpl	r2, r9, r0
	mvn	r0, r7
	movpl	r1, #0
	movpl	r3, #0
	lsl	r7, r12, r0
	subs	r5, r0, #32
	movpl	r7, #0
	orr	r11, r7, r2
	rsb	r7, r0, #32
	lsr	r4, r12, r7
	lsr	r7, r6, r7
	orr	r4, r4, r10, lsl r0
	orr	r9, r7, r9, lsl r0
	lslpl	r4, r12, r5
	lslpl	r9, r6, r5
	lsl	r6, r6, r0
	orr	r10, r4, r3
	movpl	r6, #0
	b	.LBB3_38
.LBB3_37:
	add	lr, r0, #1
	mov	r3, r8
	mov	r12, r7
	subs	r2, r0, #31
	lsr	r1, r7, lr
	rsb	r7, r0, #31
	lsr	r5, r3, lr
	rsb	r0, r0, #63
	orr	r8, r1, r10, lsl r7
	lsr	r1, r10, lr
	lsr	r6, r9, lr
	orr	r5, r5, r9, lsl r7
	lsrpl	r8, r10, r2
	lsrpl	r5, r9, r2
	movpl	r1, #0
	movpl	r6, #0
	lsl	r2, r12, r0
	cmp	r7, #0
	movpl	r2, #0
	str	r11, [sp, #4]
	orr	r11, r2, r5
	rsb	r2, r0, #32
	lsr	r4, r12, r2
	orr	r4, r4, r10, lsl r0
	lslpl	r4, r12, r7
	orr	r10, r4, r6
	lsr	r6, r3, r2
	orr	r9, r6, r9, lsl r0
	lslpl	r9, r3, r7
	lsl	r3, r3, r0
	movpl	r3, #0
	mov	r6, r3
.LBB3_38:
	mov	r2, #0
	mov	r12, #0
.LBB3_39:
	mov	r5, #0
	mov	r3, r6
.LBB3_40:
	ldr	r6, [sp, #72]
	lsl	r0, r1, #1
	lsl	r1, r11, #1
	str	r9, [sp, #20]
	orr	r9, r1, r9, lsr #31
	str	r2, [sp, #24]
	subs	r1, r9, r6
	lsl	r2, r8, #1
	str	r1, [sp, #8]
	orr	r4, r2, r10, lsr #31
	ldr	r1, [sp, #76]
	lsl	r2, r10, #1
	orr	r7, r2, r11, lsr #31
	str	r5, [sp, #16]
	sbcs	r1, r7, r1
	str	r1, [sp, #12]
	ldr	r1, [sp, #80]
	orr	r0, r0, r8, lsr #31
	mvn	r8, r7
	mvn	r11, r4
	sbcs	r5, r4, r1
	ldr	r1, [sp, #84]
	mvn	r10, r0
	sbc	r2, r0, r1
	mov	r1, lr
	mvn	lr, r9
	adds	r6, r6, lr
	mov	lr, r1
	ldr	r1, [sp, #76]
	adcs	r6, r1, r8
	ldr	r1, [sp, #80]
	mov	r8, r5
	adcs	r6, r1, r11
	mov	r1, r2
	ldr	r2, [sp, #84]
	ldr	r11, [sp, #8]
	adcs	r6, r2, r10
	ldr	r2, [sp, #24]
	movpl	r1, r0
	ldr	r0, [sp, #16]
	ldr	r10, [sp, #12]
	movpl	r8, r4
	orr	r4, r0, r2, lsl #1
	lsl	r0, r3, #1
	movpl	r10, r7
	lsr	r7, r6, #31
	orr	r0, r0, r12, lsr #31
	lsl	r6, r12, #1
	orr	r12, r6, r2, lsr #31
	ldr	r2, [sp, #20]
	movpl	r11, r9
	subs	lr, lr, #1
	mov	r5, r7
	lsl	r6, r2, #1
	orr	r9, r6, r3, lsr #31
	mov	r2, r4
	mov	r3, r0
	bne	.LBB3_40
	ldr	r2, [sp, #88]
	orr	r3, r7, r4, lsl #1
	lsl	r7, r9, #1
	lsr	r6, r12, #31
	cmp	r2, #0
	orr	r7, r7, r0, lsr #31
	strne	r1, [r2, #12]
	orr	r0, r6, r0, lsl #1
	ldr	r1, [sp, #4]
	lsl	r6, r12, #1
	orr	r6, r6, r4, lsr #31
	strne	r11, [r2]
	strne	r10, [r2, #4]
	strne	r8, [r2, #8]
	stm	r1, {r3, r6}
	str	r0, [r1, #8]
	str	r7, [r1, #12]
.LBB3_42:
	add	sp, sp, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB3_43:
	add	r0, r7, #1
	rsb	r2, r7, #31
	mov	r8, lr
	mov	lr, r1
	lsr	r1, r1, r0
	orr	r11, r1, r10, lsl r2
	subs	r4, r7, #31
	lsr	r12, r10, r0
	lsr	r1, r9, r0
	lsr	r0, r6, r0
	rsb	r7, r7, #63
	orr	r0, r0, r9, lsl r2
	mov	r3, r6
	lsrpl	r11, r10, r4
	movpl	r12, #0
	movpl	r1, #0
	lsrpl	r0, r9, r4
	lsl	r6, lr, r7
	cmp	r2, #0
	movpl	r6, #0
	orr	r0, r6, r0
	rsb	r6, r7, #32
	lsr	r4, lr, r6
	lsr	r6, r3, r6
	orr	r4, r4, r10, lsl r7
	mov	r10, r12
	lslpl	r4, lr, r2
	mov	lr, r8
	orr	r4, r4, r1
	orr	r1, r6, r9, lsl r7
	lslpl	r1, r3, r2
	lsl	r2, r3, r7
	mov	r12, r1
	movpl	r2, #0
	mov	r8, #0
	mov	r6, r0
	mov	r9, r4
	b	.LBB3_27
.LBB3_44:
	.inst	0xe7ffdefe
	.p2align	2
.LCPI3_0:
	.long	1431655765
.LCPI3_1:
	.long	858993459
.LCPI3_2:
	.long	252645135
.LCPI3_3:
	.long	16843009
.LCPI3_4:
	.long	125613361
.Lfunc_end3:
	.size	"runtime::udivmod128", .Lfunc_end3-"runtime::udivmod128"
	.cantunwind
	.fnend

	.globl	odin_main
	.p2align	2
	.type	odin_main,%function
	.code	32
odin_main:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.setfp	r11, sp, #28
	add	r11, sp, #28
	.pad	#508
	sub	sp, sp, #508
	.pad	#4096
	sub	sp, sp, #4096
	bic	sp, sp, #15
	add	r4, sp, #252
	mov	r1, #0
	mov	r2, #4096
	mov	r10, #0
	mov	r0, r4
	mov	r5, #4096
	bl	memset
	ldr	r0, .LCPI4_35
	add	r9, sp, #168
	str	r0, [sp, #216]
	mov	r7, #0
	ldr	r0, .LCPI4_36
	str	r0, [sp, #212]
	ldr	r0, .LCPI4_37
	str	r0, [sp, #196]
	ldr	r0, .LCPI4_38
	str	r0, [sp, #232]
	add	r0, sp, #180
	stm	r0, {r4, r5, r10}
	add	r0, sp, #180
	mov	r4, #0
	str	r0, [sp, #208]
	ldr	r0, .LCPI4_39
	str	r0, [sp, #204]
	add	r0, sp, #64
	ldr	r6, .LCPI4_40
	orr	r5, r0, #8
	ldr	r8, .LCPI4_41
	str	r10, [sp, #220]
	str	r10, [sp, #200]
	str	r10, [sp, #224]
	str	r10, [sp, #228]
	str	r10, [sp, #236]
	str	r10, [sp, #240]
	str	r10, [sp, #244]
	str	r10, [sp, #248]
	str	r10, [sp, #192]
	str	r10, [sp, #176]
	b	.LBB4_4
.LBB4_1:
	sub	r4, r4, #1
.LBB4_2:
	str	r4, [sp, #176]
.LBB4_3:
	add	r7, r0, r7
	cmp	r7, #14
	bge	.LBB4_12
.LBB4_4:
	add	r1, r6, r7
	rsb	r2, r7, #14
	mov	r0, r9
	str	r10, [sp, #172]
	str	r10, [sp, #168]
	bl	"runtime::string_decode_rune"
	ldr	r1, [sp, #168]
	ldr	r0, [sp, #172]
	sub	r2, r1, #42
	cmp	r2, #5
	bhi	.LBB4_8
	adr	r1, .LJTI4_0
	ldr	pc, [r1, r2, lsl #2]
	.p2align	2
.LJTI4_0:
	.long	.LBB4_7
	.long	.LBB4_11
	.long	.LBB4_3
	.long	.LBB4_1
	.long	.LBB4_3
	.long	.LBB4_10
.LBB4_7:
	lsl	r4, r4, #1
	b	.LBB4_2
.LBB4_8:
	cmp	r1, r8
	bne	.LBB4_3
	mul	r1, r4, r4
	mov	r4, r1
	b	.LBB4_2
.LBB4_10:
	add	r1, r4, r4, lsr #31
	asr	r4, r1, #1
	b	.LBB4_2
.LBB4_11:
	add	r4, r4, #1
	b	.LBB4_2
.LBB4_12:
	add	r0, sp, #196
	ldr	r8, .LCPI4_39
	str	r0, [sp, #4]
	add	r7, sp, #180
	ldr	r0, .LCPI4_53
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #4480
	mov	r1, #128
	mov	r2, r8
	mov	r3, r7
	str	r4, [sp, #164]
	str	r4, [sp, #160]
	str	r4, [sp, #156]
	str	r4, [sp, #152]
	str	r4, [sp, #148]
	bl	"runtime::mem_alloc_bytes"
	add	lr, sp, #4096
	add	r1, lr, #268
	ldrb	r0, [r1, #124]
	cmp	r0, #0
	bne	.LBB4_14
	ldr	r0, [r1, #116]
	mov	r1, #0
	str	r0, [sp, #148]
	cmp	r0, #0
	str	r7, [sp, #164]
	movne	r0, #1
	str	r8, [sp, #160]
	lsl	r0, r0, #7
	str	r1, [sp, #152]
	str	r0, [sp, #156]
.LBB4_14:
	add	r7, sp, #4480
	add	r0, sp, #64
	mov	r9, #0
	add	r0, r0, #16
	str	r0, [sp, #32]
	b	.LBB4_17
.LBB4_15:
	ldr	r0, .LCPI4_54
	str	r0, [r5]
	ldr	r0, .LCPI4_55
	str	r0, [r5, #4]
	add	r0, sp, #60
	str	r0, [sp, #64]
	mov	r0, #63
	str	r0, [sp, #60]
.LBB4_16:
	mov	r0, r7
	mov	r1, #0
	mov	r2, #88
	bl	memset
	add	lr, sp, #4096
	ldr	r1, .LCPI4_56
	add	r0, lr, #268
	add	r3, sp, #196
	mov	r2, #118
	str	r1, [r0, #156]
	add	r1, sp, #148
	str	r1, [r0, #160]
	add	r1, sp, #64
	mov	r0, r7
	bl	"fmt::fmt_value"
	add	r9, r10, r9
	mov	r6, r8
	cmp	r9, #14
	bge	.LBB4_19
.LBB4_17:
	add	r1, r6, r9
	rsb	r2, r9, #14
	add	r0, sp, #136
	str	r4, [sp, #140]
	str	r4, [sp, #136]
	mov	r8, r6
	bl	"runtime::string_decode_rune"
	ldr	r0, [sp, #136]
	ldr	r10, [sp, #140]
	cmp	r0, #127
	str	r0, [sp, #132]
	bgt	.LBB4_15
	ldr	r0, [sp, #32]
	mov	r1, #0
	mov	r2, #48
	bl	memset
	ldr	r0, .LCPI4_43
	str	r0, [r5]
	ldr	r0, .LCPI4_44
	str	r0, [r5, #4]
	add	r0, sp, #132
	str	r4, [sp, #68]
	str	r0, [sp, #64]
	b	.LBB4_16
.LBB4_19:
	ldr	r0, .LCPI4_57
	add	lr, sp, #4096
	str	r0, [r5, #4]
	add	r7, sp, #4480
	ldr	r0, .LCPI4_58
	add	r8, lr, #268
	str	r0, [r5, #20]
	mov	r10, #0
	ldr	r0, .LCPI4_59
	str	r0, [r5, #36]
	ldr	r0, .LCPI4_60
	str	r0, [r5, #52]
	ldr	r0, .LCPI4_61
	str	r0, [sp, #44]
	ldr	r0, .LCPI4_62
	str	r0, [sp, #40]
	ldr	r0, [sp, #148]
	str	r0, [sp, #52]
	add	r0, sp, #52
	ldr	r1, .LCPI4_63
	str	r0, [sp, #64]
	add	r0, sp, #176
	str	r1, [r5]
	ldr	r1, .LCPI4_64
	str	r0, [sp, #80]
	add	r0, sp, #40
	str	r1, [r5, #16]
	ldr	r1, .LCPI4_65
	str	r0, [sp, #96]
	add	r0, sp, #36
	ldr	r4, [sp, #204]
	ldr	r6, [sp, #208]
	str	r1, [r5, #32]
	ldr	r1, .LCPI4_18
	mov	r2, r4
	str	r0, [sp, #112]
	add	r0, sp, #196
	str	r1, [r5, #48]
	mov	r3, r6
	ldr	r1, [sp, #152]
	str	r0, [sp, #4]
	ldr	r0, .LCPI4_21
	str	r1, [sp, #56]
	mov	r1, #0
	str	r0, [sp]
	mov	r0, r7
	str	r10, [sp, #68]
	str	r10, [sp, #84]
	str	r10, [sp, #36]
	str	r10, [r8, #-16]
	str	r10, [r8, #-12]
	str	r10, [r8, #-8]
	str	r10, [r8, #-4]
	str	r10, [r8]
	bl	"runtime::mem_alloc_bytes"
	ldrb	r0, [r8, #124]
	cmp	r0, #0
	bne	.LBB4_21
	mov	r1, #0
	ldr	r0, [r8, #116]
	str	r0, [r8, #-16]
	str	r1, [r8, #-12]
	stmda	r8, {r1, r4, r6}
.LBB4_21:
	ldr	r4, .LCPI4_22
	mov	r0, #15
	mov	r9, #0
	str	r0, [r8, #108]
	add	r0, r7, #48
	str	r10, [r8, #196]
	str	r10, [r8, #200]
	str	r10, [r8, #112]
	str	r0, [sp, #32]
	b	.LBB4_24
.LBB4_22:
	mov	r9, r1
.LBB4_23:
	cmp	r9, #16
	bge	.LBB4_125
.LBB4_24:
	mov	r0, r7
	mov	r1, #0
	mov	r2, #40
	bl	memset
	ldr	r0, .LCPI4_10
	add	lr, sp, #4096
	str	r0, [r8, #156]
	add	r0, lr, #252
	str	r0, [r8, #160]
	mov	r1, #0
	ldr	r0, [sp, #32]
	mov	r2, #36
	bl	memset
	cmp	r9, #16
	mov	r0, #16
	movhi	r0, r9
	mov	r5, r9
.LBB4_25:
	cmp	r0, r5
	beq	.LBB4_154
	ldrb	r1, [r4, r5]
	cmp	r1, #37
	beq	.LBB4_30
	cmp	r1, #123
	cmpne	r1, #125
	beq	.LBB4_30
	add	r5, r5, #1
	cmp	r5, #16
	bne	.LBB4_25
	mov	r5, #16
.LBB4_30:
	cmp	r5, r9
	ble	.LBB4_34
	cmp	r9, #0
	bmi	.LBB4_160
	cmp	r5, #17
	bhs	.LBB4_160
	add	r0, sp, #196
	add	lr, sp, #4096
	str	r0, [sp]
	add	r0, lr, #288
	add	lr, sp, #4096
	add	r2, r4, r9
	sub	r3, r5, r9
	add	r1, lr, #252
	ldr	r6, [r8, #-12]
	bl	"runtime::_append_elems"
	ldr	r0, [r8, #-12]
	ldr	r1, [r8, #200]
	sub	r0, r0, r6
	add	r0, r0, r1
	str	r0, [r8, #200]
.LBB4_34:
	cmp	r5, #15
	bhi	.LBB4_125
	ldrb	r0, [r4, r5]
	add	r1, r5, #1
	cmp	r0, #37
	beq	.LBB4_48
	cmp	r0, #123
	beq	.LBB4_42
	cmp	r0, #125
	bne	.LBB4_22
	mov	r9, #16
	cmp	r5, #15
	beq	.LBB4_40
	ldrb	r0, [r4, r1]
	cmp	r0, #125
	addeq	r1, r5, #2
	mov	r9, r1
.LBB4_40:
	ldr	r5, [r8, #156]
	mov	r0, #125
	ldr	r1, [r8, #160]
	cmp	r5, #0
	strb	r0, [r8, #212]
	beq	.LBB4_23
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #1
	add	lr, sp, #4096
	str	r0, [sp]
	add	r0, lr, #288
	add	lr, sp, #4096
	mov	r2, #4
	add	r3, lr, #480
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	b	.LBB4_109
.LBB4_42:
	ldrb	r0, [r4, r1]
	cmp	r0, #58
	beq	.LBB4_45
	cmp	r0, #123
	beq	.LBB4_74
	cmp	r0, #125
	bne	.LBB4_78
.LBB4_45:
	mov	r5, r1
.LBB4_46:
	ldr	r0, [r8, #108]
	ldr	r1, [r8, #112]
	orrs	r2, r0, r1
	beq	.LBB4_87
	rsb	r2, r1, #0
	ldr	r6, .LCPI4_25
	and	r2, r1, r2
	cmp	r1, #0
	rsb	r1, r0, #0
	mov	r9, #1
	and	r1, r0, r1
	mul	r3, r2, r6
	adr	r2, .LCPI4_51
	mul	r7, r1, r6
	ldrb	r3, [r2, r3, lsr #27]
	moveq	r3, #32
	ldrb	r6, [r2, r7, lsr #27]
	cmp	r0, #0
	moveq	r6, #32
	addeq	r6, r3, #32
	b	.LBB4_91
.LBB4_48:
	cmp	r5, #15
	beq	.LBB4_52
	ldrb	r0, [r4, r1]
	cmp	r0, #37
	bne	.LBB4_52
	ldr	r6, [r8, #156]
	mov	r0, #37
	b	.LBB4_75
.LCPI4_51:
	.ascii	"\000\001\034\002\035\016\030\003\036\026\024\017\031\021\004\b\037\033\r\027\025\023\020\007\032\f\022\006\013\005\n\t"
	.p2align	2
.LBB4_52:
	add	r0, sp, #64
	str	r0, [sp]
	mov	r0, #4
	add	lr, sp, #4096
	str	r0, [sp, #4]
	add	r0, sp, #196
	add	r3, lr, #376
	str	r0, [sp, #8]
	mov	r0, r7
	mov	r2, #16
	bl	"fmt::wprintf.parse_options-0"
	mov	r9, r0
	cmp	r0, #15
	bgt	.LBB4_60
	cmp	r9, #16
	bhs	.LBB4_167
	ldrb	r0, [r4, r9]
	cmp	r0, #91
	bne	.LBB4_60
	cmp	r9, #13
	bhi	.LBB4_59
	add	r0, r4, r9
	rsb	r12, r9, #16
	add	r2, r0, #1
	sub	r3, r9, #15
	mov	r0, #0
.LBB4_57:
	ldrb	r7, [r2, -r0]
	cmp	r7, #93
	beq	.LBB4_111
	sub	r0, r0, #1
	cmp	r3, r0
	bne	.LBB4_57
.LBB4_59:
	add	r9, r9, #1
.LBB4_60:
	ldr	r0, [r8, #108]
	ldr	r1, [r8, #112]
	orrs	r2, r0, r1
	beq	.LBB4_62
	rsb	r2, r1, #0
	ldr	r6, .LCPI4_25
	and	r2, r1, r2
	cmp	r1, #0
	rsb	r1, r0, #0
	and	r1, r0, r1
	mul	r3, r2, r6
	adr	r2, .LCPI4_51
	mul	r7, r1, r6
	mov	r6, #0
	ldrb	r3, [r2, r3, lsr #27]
	moveq	r3, #32
	ldrb	r5, [r2, r7, lsr #27]
	cmp	r0, #0
	moveq	r5, #32
	addeq	r5, r3, #32
	b	.LBB4_66
.LBB4_62:
	ldr	r5, [r8, #156]
	cmp	r5, #0
	beq	.LBB4_65
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #20
	add	lr, sp, #4096
	str	r0, [sp]
	add	r0, lr, #288
	ldr	r1, [r8, #160]
	mov	r2, #4
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	ldr	r3, .LCPI4_27
.LBB4_64:
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r8, #20]
	ldr	r1, [r8, #200]
	add	r0, r1, r0
	str	r0, [r8, #200]
.LBB4_65:
	mov	r5, #0
	mov	r6, #1
.LBB4_66:
	cmp	r9, #16
	bge	.LBB4_120
	bhs	.LBB4_162
	mov	r1, r4
	add	r7, sp, #4480
	ldrb	r0, [r1, r9]!
	cmp	r0, #32
	bne	.LBB4_71
	ldr	r5, [r8, #156]
	cmp	r5, #0
	beq	.LBB4_23
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #11
	add	lr, sp, #4096
	str	r0, [sp]
	add	r0, lr, #288
	ldr	r1, [r8, #160]
	mov	r2, #4
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	ldr	r3, .LCPI4_28
	b	.LBB4_109
.LBB4_71:
	add	lr, sp, #4096
	rsb	r2, r9, #16
	add	r0, lr, #288
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	bl	"utf8::decode_rune_in_bytes"
	ldr	r0, [r8, #24]
	cmp	r6, #0
	add	r9, r0, r9
	bne	.LBB4_23
	mov	r6, #1
	subs	r1, r5, #32
	lsl	r0, r6, r5
	ldr	r3, [r8, #108]
	movpl	r0, #0
	ldr	r2, [r8, #20]
	bic	r0, r3, r0
	rsb	r3, r5, #32
	ldr	r7, [r8, #112]
	lsr	r3, r6, r3
	str	r0, [r8, #108]
	lslpl	r3, r6, r1
	cmp	r5, #4
	bic	r1, r7, r3
	str	r1, [r8, #112]
	bhs	.LBB4_171
	add	r0, sp, #64
	add	r7, sp, #4480
	add	r1, r0, r5, lsl #4
	add	r3, sp, #196
	mov	r0, r7
	bl	"fmt::fmt_arg"
	b	.LBB4_23
.LBB4_74:
	ldr	r6, [r8, #156]
	mov	r0, #123
.LBB4_75:
	ldr	r1, [r8, #160]
	cmp	r6, #0
	strb	r0, [r8, #212]
	beq	.LBB4_77
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #1
	add	lr, sp, #4096
	str	r0, [sp]
	add	r0, lr, #288
	add	lr, sp, #4096
	mov	r2, #4
	add	r3, lr, #480
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r8, #20]
	ldr	r1, [r8, #200]
	add	r0, r1, r0
	str	r0, [r8, #200]
.LBB4_77:
	add	r9, r5, #2
	b	.LBB4_23
.LBB4_78:
	mov	r6, #0
	mov	r5, r1
.LBB4_79:
	cmp	r5, #16
	beq	.LBB4_157
	ldrb	r0, [r4, r5]
	sub	r2, r0, #48
	cmp	r2, #9
	bhi	.LBB4_83
	add	r2, r6, r6, lsl #2
	add	r5, r5, #1
	cmp	r5, #16
	add	r0, r0, r2, lsl #1
	sub	r6, r0, #48
	bne	.LBB4_79
	mov	r5, #16
.LBB4_83:
	cmp	r5, r1
	ble	.LBB4_46
	mov	r9, #1
	cmp	r6, #3
	bls	.LBB4_91
	ldr	r6, [r8, #156]
	cmp	r6, #0
	beq	.LBB4_90
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #23
	add	lr, sp, #4096
	str	r0, [sp]
	add	r0, lr, #288
	ldr	r1, [r8, #160]
	mov	r2, #4
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	ldr	r3, .LCPI4_24
	b	.LBB4_89
.LBB4_87:
	ldr	r6, [r8, #156]
	cmp	r6, #0
	beq	.LBB4_90
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #20
	ldr	r1, [r8, #160]
	add	lr, sp, #4096
	ldr	r3, .LCPI4_27
	str	r0, [sp]
	add	r0, lr, #288
	mov	r2, #4
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
.LBB4_89:
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r8, #20]
	ldr	r1, [r8, #200]
	add	r0, r1, r0
	str	r0, [r8, #200]
.LBB4_90:
	mov	r9, #0
	mov	r6, #0
.LBB4_91:
	cmp	r5, #15
	bgt	.LBB4_122
	cmp	r5, #16
	bhs	.LBB4_165
	ldrb	r0, [r4, r5]
	mov	r7, #118
	cmp	r0, #58
	bne	.LBB4_103
	add	r0, sp, #64
	str	r0, [sp]
	mov	r0, #4
	add	lr, sp, #4096
	str	r0, [sp, #4]
	add	r0, sp, #196
	str	r0, [sp, #8]
	add	r1, r5, #1
	add	r0, sp, #4480
	add	r3, lr, #376
	mov	r2, #16
	bl	"fmt::wprintf.parse_options-0"
	cmp	r0, #16
	bge	.LBB4_120
	mov	r7, r0
	bhs	.LBB4_168
	mov	r1, r4
	ldrb	r0, [r1, r7]!
	cmp	r0, #125
	bne	.LBB4_100
	ldr	r5, [r8, #156]
	cmp	r5, #0
	beq	.LBB4_99
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #11
	ldr	r1, [r8, #160]
	add	lr, sp, #4096
	ldr	r3, .LCPI4_28
	str	r0, [sp]
	add	r0, lr, #288
	mov	r2, #4
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r8, #20]
	ldr	r1, [r8, #200]
	add	r0, r1, r0
	str	r0, [r8, #200]
.LBB4_99:
	add	r9, r7, #1
	add	r7, sp, #4480
	b	.LBB4_23
.LBB4_100:
	add	lr, sp, #4096
	rsb	r2, r7, #16
	add	r0, lr, #288
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	bl	"utf8::decode_rune_in_bytes"
	ldr	r0, [r8, #24]
	add	r5, r0, r7
	cmp	r5, #16
	bge	.LBB4_122
	cmn	r5, #1
	ble	.LBB4_176
	ldr	r7, [r8, #20]
.LBB4_103:
	mov	r10, r9
	mov	r0, #0
	add	lr, sp, #4096
	str	r0, [r8, #20]
	add	r1, r4, r5
	str	r0, [r8, #24]
	rsb	r2, r5, #16
	add	r0, lr, #288
	bl	"utf8::decode_rune_in_bytes"
	ldr	r1, [r8, #24]
	ldr	r0, [r8, #20]
	add	r9, r1, r5
	cmp	r0, #125
	bne	.LBB4_107
	cmp	r10, #0
	beq	.LBB4_110
	cmp	r6, #4
	mov	r10, #0
	bhs	.LBB4_182
	add	r0, sp, #64
	add	r3, sp, #196
	add	r1, r0, r6, lsl #4
	add	r0, sp, #4480
	mov	r2, r7
	mov	r7, r0
	bl	"fmt::fmt_arg"
	mov	r5, #1
	subs	r1, r6, #32
	lsl	r0, r5, r6
	ldr	r2, [r8, #108]
	movpl	r0, #0
	ldr	r3, [r8, #112]
	bic	r0, r2, r0
	rsb	r2, r6, #32
	str	r0, [r8, #108]
	lsr	r2, r5, r2
	lslpl	r2, r5, r1
	bic	r1, r3, r2
	str	r1, [r8, #112]
	b	.LBB4_23
.LBB4_107:
	ldr	r5, [r8, #156]
	add	r7, sp, #4480
	mov	r10, #0
	cmp	r5, #0
	beq	.LBB4_23
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #23
	add	lr, sp, #4096
	str	r0, [sp]
	add	r0, lr, #288
	ldr	r1, [r8, #160]
	mov	r2, #4
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	ldr	r3, .LCPI4_29
.LBB4_109:
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r8, #20]
	ldr	r1, [r8, #200]
	add	r0, r1, r0
	str	r0, [r8, #200]
	b	.LBB4_23
.LBB4_110:
	add	r7, sp, #4480
	mov	r10, #0
	b	.LBB4_23
.LBB4_111:
	rsb	r7, r9, #15
	mov	r3, #0
	mov	r5, #0
.LBB4_112:
	ldrb	r6, [r2, r3]
	sub	r1, r6, #48
	cmp	r1, #9
	bhi	.LBB4_114
	add	r1, r5, r5, lsl #2
	add	r3, r3, #1
	cmp	r7, r3
	add	r1, r6, r1, lsl #1
	sub	r5, r1, #48
	bne	.LBB4_112
	b	.LBB4_115
.LBB4_114:
	add	r12, r3, #1
.LBB4_115:
	add	r1, r12, r0
	sub	r0, r9, r0
	sub	r1, r1, #1
	add	r9, r0, #2
	rsbs	r2, r1, #0
	mov	r6, #0
	adc	r1, r1, r2
	cmp	r12, #1
	mov	r2, #0
	movhi	r2, #1
	ands	r1, r2, r1
	moveq	r5, r1
	cmp	r1, #1
	bne	.LBB4_117
	cmp	r5, #4
	blo	.LBB4_66
.LBB4_117:
	cmp	r1, #0
	beq	.LBB4_60
	ldr	r5, [r8, #156]
	cmp	r5, #0
	beq	.LBB4_65
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #23
	ldr	r1, [r8, #160]
	add	lr, sp, #4096
	ldr	r3, .LCPI4_24
	str	r0, [sp]
	add	r0, lr, #288
	mov	r2, #4
	str	r10, [r8, #20]
	str	r10, [r8, #24]
	str	r10, [r8, #28]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	b	.LBB4_64
.LBB4_120:
	ldr	r4, [r8, #156]
	cmp	r4, #0
	beq	.LBB4_125
	mov	r0, #0
	ldr	r1, [r8, #160]
	str	r0, [r8, #20]
	add	lr, sp, #4096
	str	r0, [r8, #24]
	str	r0, [r8, #28]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #11
	ldr	r3, .LCPI4_28
	str	r0, [sp]
	add	r0, lr, #288
	b	.LBB4_124
.LBB4_122:
	ldr	r4, [r8, #156]
	cmp	r4, #0
	beq	.LBB4_125
	mov	r0, #0
	add	lr, sp, #4096
	str	r0, [r8, #20]
	str	r0, [r8, #24]
	str	r0, [r8, #28]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #23
	str	r0, [sp]
	add	r0, lr, #288
	ldr	r1, [r8, #160]
	ldr	r3, .LCPI4_29
.LBB4_124:
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r8, #20]
	ldr	r1, [r8, #200]
	add	r0, r1, r0
	str	r0, [r8, #200]
.LBB4_125:
	ldr	r4, [r8, #108]
	ldr	r6, [r8, #112]
	orrs	r0, r4, r6
	beq	.LBB4_153
	add	lr, sp, #4096
	mov	r1, #0
	add	r5, lr, #288
	mov	r2, #40
	ldr	r7, [r8, #156]
	mov	r0, r5
	ldr	r9, [r8, #160]
	ldr	r10, [r8, #200]
	bl	memset
	add	r0, r5, #48
	mov	r1, #0
	mov	r2, #36
	str	r7, [r8, #60]
	str	r9, [r8, #64]
	bl	memset
	cmp	r7, #0
	str	r10, [r8, #104]
	beq	.LBB4_128
	mov	r0, #0
	add	lr, sp, #4096
	str	r0, [r8, #212]
	mov	r1, r9
	str	r0, [r8, #216]
	mov	r2, #4
	str	r0, [r8, #220]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #9
	ldr	r3, .LCPI4_30
	str	r0, [sp]
	add	r0, lr, #480
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r8, #212]
	add	r0, r10, r0
	str	r0, [r8, #104]
.LBB4_128:
	rsb	r0, r6, #0
	mov	r12, r7
	ldr	r7, .LCPI4_25
	rsb	r2, r4, #0
	and	r0, r6, r0
	and	r2, r4, r2
	cmp	r6, #0
	mul	r1, r0, r7
	adr	r0, .LCPI4_52
	mul	r3, r2, r7
	ldrb	r1, [r0, r1, lsr #27]
	moveq	r1, #32
	ldrb	r7, [r0, r3, lsr #27]
	cmp	r4, #0
	moveq	r7, #32
	addeq	r7, r1, #32
	subs	r0, r4, #1
	sbc	r1, r6, #0
	cmp	r7, #3
	bhi	.LBB4_156
	add	r3, sp, #64
	and	r5, r0, r4
	and	r4, r1, r6
	add	r1, r3, r7, lsl #4
	add	lr, sp, #4096
	ldr	r3, [r3, r7, lsl #4]
	add	r0, lr, #272
	add	r6, r0, #8
	ldr	r0, [r1, #8]
	ldr	r2, [r1, #12]
	cmp	r3, #0
	ldr	lr, [r1, #4]
	add	r1, sp, #4096
	add	r8, r1, #268
	str	r0, [r6]
	orrsne	r0, r0, r2
	str	r6, [sp, #32]
	str	r2, [r6, #4]
	stmib	r8, {r3, lr}
	bne	.LBB4_133
	cmp	r12, #0
	beq	.LBB4_143
	mov	r0, #0
	add	lr, sp, #4096
	str	r0, [r8, #212]
	mov	r6, r12
	str	r0, [r8, #216]
	mov	r1, r9
	str	r0, [r8, #220]
	mov	r2, #4
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #5
	ldr	r3, .LCPI4_31
	str	r0, [sp]
	add	r0, lr, #480
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r8, #212]
	ldr	r1, [r8, #104]
	add	r0, r1, r0
	str	r0, [r8, #104]
	b	.LBB4_143
.LCPI4_52:
	.ascii	"\000\001\034\002\035\016\030\003\036\026\024\017\031\021\004\b\037\033\r\027\025\023\020\007\032\f\022\006\013\005\n\t"
	.p2align	2
.LBB4_133:
	add	lr, sp, #4096
	add	r3, sp, #196
	add	r0, lr, #288
	add	lr, sp, #4096
	add	r1, lr, #272
	mov	r2, #118
	bl	"fmt::fmt_arg"
	b	.LBB4_143
	.p2align	2
.LCPI4_35:
	.long	"runtime::default_logger_proc"
	.p2align	2
.LCPI4_36:
	.long	"runtime::default_assertion_failure_proc"
	.p2align	2
.LCPI4_37:
	.long	"runtime::nil_allocator_proc"
	.p2align	2
.LCPI4_38:
	.long	"runtime::default_random_generator_proc"
	.p2align	2
.LCPI4_39:
	.long	"mem::small_stack_allocator_proc"
	.p2align	2
.LCPI4_40:
	.long	".Lcsbs$POC-Example$e1"
	.p2align	2
.LCPI4_41:
	.long	128515
	.p2align	2
.LBB4_141:
	add	lr, sp, #4096
	add	r3, sp, #196
	add	r0, lr, #288
	add	lr, sp, #4096
	add	r1, lr, #272
	mov	r2, #118
	bl	"fmt::fmt_arg"
.LBB4_142:
	and	r5, r9, r5
	and	r4, r10, r4
.LBB4_143:
	orrs	r0, r5, r4
	beq	.LBB4_151
	rsb	r0, r4, #0
	ldr	r7, .LCPI4_25
	rsb	r2, r5, #0
	and	r0, r4, r0
	and	r2, r5, r2
	cmp	r4, #0
	mul	r1, r0, r7
	adr	r0, .LCPI4_52
	ldr	r6, [r8, #60]
	mul	r3, r2, r7
	ldrb	r1, [r0, r1, lsr #27]
	moveq	r1, #32
	ldrb	r7, [r0, r3, lsr #27]
	cmp	r5, #0
	moveq	r7, #32
	addeq	r7, r1, #32
	subs	r9, r5, #1
	sbc	r10, r4, #0
	cmp	r6, #0
	beq	.LBB4_146
	mov	r0, #0
	ldr	r1, [r8, #64]
	str	r0, [r8, #212]
	add	lr, sp, #4096
	str	r0, [r8, #216]
	mov	r2, #4
	str	r0, [r8, #220]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI4_32
	str	r0, [sp]
	add	r0, lr, #480
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r8, #212]
	ldr	r1, [r8, #104]
	add	r0, r1, r0
	str	r0, [r8, #104]
.LBB4_146:
	cmp	r7, #4
	bhs	.LBB4_156
	add	r3, sp, #64
	add	lr, sp, #4096
	add	r1, r3, r7, lsl #4
	ldr	r6, [sp, #32]
	ldr	r3, [r3, r7, lsl #4]
	add	r8, lr, #268
	ldr	r2, [r1, #4]
	ldr	r0, [r1, #8]
	ldr	r1, [r1, #12]
	cmp	r3, #0
	stm	r6, {r0, r1}
	orrsne	r0, r0, r1
	str	r3, [r8, #4]
	str	r2, [r8, #8]
	bne	.LBB4_141
	ldr	r6, [r8, #60]
	cmp	r6, #0
	beq	.LBB4_142
	mov	r0, #0
	ldr	r1, [r8, #64]
	str	r0, [r8, #212]
	add	lr, sp, #4096
	str	r0, [r8, #216]
	mov	r2, #4
	str	r0, [r8, #220]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #5
	ldr	r3, .LCPI4_31
	str	r0, [sp]
	add	r0, lr, #480
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r8, #212]
	ldr	r1, [r8, #104]
	add	r0, r1, r0
	str	r0, [r8, #104]
	b	.LBB4_142
	.p2align	2
.LCPI4_53:
	.long	".Lscl$[odin_main993]"
	.p2align	2
.LBB4_151:
	ldr	r4, [r8, #60]
	mov	r0, #41
	ldr	r1, [r8, #64]
	cmp	r4, #0
	strb	r0, [r8, #211]
	beq	.LBB4_153
	mov	r0, #0
	add	lr, sp, #4096
	str	r0, [r8, #212]
	mov	r2, #4
	str	r0, [r8, #216]
	str	r0, [r8, #220]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #196
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, lr, #480
	add	lr, sp, #4352
	add	r3, lr, #223
	mov	lr, pc
	mov	pc, r4
.LBB4_153:
	add	lr, sp, #4096
	mov	r0, #0
	add	r1, lr, #252
	add	lr, sp, #4096
	strb	r0, [r8, #20]
	add	r0, sp, #4480
	add	r2, lr, #288
	add	r3, sp, #196
	bl	"runtime::_append_elem"
	ldr	r1, [r8, #-16]
	ldr	r0, .LCPI4_33
	bl	printf
	sub	sp, r11, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB4_154:
	mov	r2, #194
	mov	r1, #16
	stm	sp, {r0, r1}
	orr	r2, r2, #512
	mov	r1, #43
	ldr	r0, .LCPI4_23
	mov	r3, #24
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LBB4_156:
	mov	r0, #4
	mov	r1, #43
	str	r0, [sp, #4]
	mov	r2, #832
	ldr	r0, .LCPI4_23
	mov	r3, #16
	str	r7, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB4_157:
	mov	r0, #16
	mov	r2, #143
	str	r0, [sp]
	orr	r2, r2, #768
	str	r0, [sp, #4]
	mov	r1, #43
	ldr	r0, .LCPI4_23
	mov	r3, #10
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI4_54:
	.long	586708279
	.p2align	2
.LCPI4_55:
	.long	1164085392
	.p2align	2
.LBB4_160:
	mov	r0, #16
	mov	r2, #198
	str	r0, [sp, #8]
	orr	r2, r2, #512
	ldr	r0, .LCPI4_23
	mov	r1, #43
	mov	r3, #34
	str	r9, [sp]
	str	r5, [sp, #4]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI4_56:
	.long	"strings::[builder.odin]::_builder_stream_proc"
	.p2align	2
.LBB4_162:
	mov	r0, #16
	mov	r2, #242
	str	r0, [sp, #4]
	orr	r2, r2, #512
	ldr	r0, .LCPI4_23
	mov	r1, #43
	mov	r3, #18
	str	r9, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI4_43:
	.long	586708279
	.p2align	2
.LCPI4_44:
	.long	1164085392
	.p2align	2
.LBB4_165:
	mov	r0, #16
	mov	r2, #17
	str	r0, [sp, #4]
	orr	r2, r2, #768
	ldr	r0, .LCPI4_23
	mov	r1, #43
	mov	r3, #22
	str	r5, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LBB4_167:
	mov	r0, #16
	mov	r2, #187
	str	r0, [sp, #4]
	orr	r2, r2, #768
	ldr	r0, .LCPI4_23
	mov	r1, #43
	mov	r3, #32
	str	r9, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB4_168:
	mov	r0, #16
	mov	r1, #43
	str	r0, [sp, #4]
	mov	r2, #792
	ldr	r0, .LCPI4_23
	mov	r3, #19
	str	r7, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI4_57:
	.long	706738861
	.p2align	2
.LCPI4_58:
	.long	2524010688
	.p2align	2
.LBB4_171:
	mov	r0, #4
	mov	r1, #43
	str	r0, [sp, #4]
	mov	r2, #764
	ldr	r0, .LCPI4_23
	mov	r3, #23
	str	r5, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI4_59:
	.long	3302160237
	.p2align	2
.LCPI4_60:
	.long	541389484
	.p2align	2
.LCPI4_61:
	.long	3727887515
	.p2align	2
.LCPI4_62:
	.long	668764353
	.p2align	2
.LBB4_176:
	mov	r0, #16
	mov	r1, #43
	str	r0, [sp, #4]
	mov	r2, #808
	str	r0, [sp, #8]
	mov	r3, #46
	ldr	r0, .LCPI4_23
	str	r5, [sp]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI4_63:
	.long	3594887409
	.p2align	2
.LCPI4_64:
	.long	675385718
	.p2align	2
.LCPI4_65:
	.long	1181551897
	.p2align	2
.LBB4_182:
	mov	r0, #4
	mov	r2, #47
	str	r0, [sp, #4]
	orr	r2, r2, #768
	ldr	r0, .LCPI4_23
	mov	r1, #43
	mov	r3, #23
	str	r6, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI4_10:
	.long	"strings::[builder.odin]::_builder_stream_proc"
.LCPI4_18:
	.long	4252869916
.LCPI4_21:
	.long	".Lscl$[caprintf12739]"
.LCPI4_22:
	.long	".Lcsbs$POC-Example$e4"
.LCPI4_23:
	.long	".Lcsbs$POC-Example$156"
.LCPI4_24:
	.long	".Lcsbs$POC-Example$1a9"
.LCPI4_25:
	.long	125613361
.LCPI4_27:
	.long	".Lcsbs$POC-Example$1a8"
.LCPI4_28:
	.long	".Lcsbs$POC-Example$166"
.LCPI4_29:
	.long	".Lcsbs$POC-Example$167"
.LCPI4_30:
	.long	".Lcsbs$POC-Example$168"
.LCPI4_31:
	.long	".Lcsbs$POC-Example$169"
.LCPI4_32:
	.long	".Lcsbs$POC-Example$130"
.LCPI4_33:
	.long	".Lcsbs$POC-Example$e0"
.Lfunc_end4:
	.size	odin_main, .Lfunc_end4-odin_main
	.fnend

	.section	.text.unlikely.,"ax",%progbits
	.p2align	2
	.type	"runtime::slice_handle_error",%function
	.code	32
"runtime::slice_handle_error":
	.fnstart
	.pad	#24
	sub	sp, sp, #24
	mov	r12, #0
	stm	sp, {r0, r1, r2, r3, r12}
	mov	r0, sp
	str	r12, [sp, #20]
	bl	"runtime::print_caller_location"
	ldr	r0, [sp, #24]
	asr	r1, r0, #31
	bl	"runtime::print_i64"
	ldr	r0, [sp, #28]
	asr	r1, r0, #31
	bl	"runtime::print_i64"
	ldr	r0, [sp, #32]
	asr	r1, r0, #31
	bl	"runtime::print_i64"
	.inst	0xe7ffdefe
.Lfunc_end5:
	.size	"runtime::slice_handle_error", .Lfunc_end5-"runtime::slice_handle_error"
	.cantunwind
	.fnend

	.text
	.p2align	2
	.type	"io::write_u64",%function
	.code	32
"io::write_u64":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.pad	#128
	sub	sp, sp, #128
	add	r7, sp, #48
	mov	r8, r2
	mov	r5, r1
	mov	r4, r0
	mov	r0, r7
	mov	r1, #0
	mov	r2, #64
	mov	r6, #0
	mov	r10, #64
	bl	memset
	mov	r0, #36
	ldr	r9, [sp, #172]
	str	r0, [sp, #24]
	mov	r1, r7
	ldr	r0, .LCPI6_0
	mov	r2, #64
	str	r0, [sp, #20]
	mov	r0, #10
	str	r0, [sp, #8]
	ldr	r0, [sp, #164]
	str	r0, [sp, #4]
	ldr	r0, [sp, #160]
	str	r0, [sp]
	add	r0, sp, #40
	str	r6, [sp, #44]
	str	r6, [sp, #40]
	str	r9, [sp, #32]
	str	r6, [sp, #28]
	str	r10, [sp, #16]
	str	r6, [sp, #12]
	bl	"strconv::write_bits"
	cmp	r5, #0
	beq	.LBB6_2
	ldr	r0, [sp, #44]
	mov	r1, #0
	ldr	r3, [sp, #40]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #112
	str	r1, [sp, #120]
	str	r1, [sp, #116]
	str	r1, [sp, #112]
	str	r1, [sp, #8]
	str	r1, [sp, #12]
	str	r1, [sp, #16]
	mov	r1, r8
	ldr	r7, [sp, #168]
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r6, [sp, #112]
	ldr	r0, [sp, #120]
	ldr	r1, [r7]
	add	r1, r1, r6
	str	r1, [r7]
	b	.LBB6_3
.LBB6_2:
	mvn	r0, #0
.LBB6_3:
	str	r6, [r4]
	str	r0, [r4, #4]
	add	sp, sp, #128
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
	.p2align	2
.LCPI6_0:
	.long	".Lcsbs$POC-Example$0"
.Lfunc_end6:
	.size	"io::write_u64", .Lfunc_end6-"io::write_u64"
	.fnend

	.p2align	2
	.type	"io::write_i64",%function
	.code	32
"io::write_i64":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#136
	sub	sp, sp, #136
	add	r7, sp, #52
	mov	r8, r2
	mov	r5, r1
	mov	r4, r0
	mov	r0, r7
	mov	r1, #0
	mov	r2, #65
	mov	r6, #0
	bl	memset
	mov	r0, #36
	ldr	r9, [sp, #180]
	str	r0, [sp, #24]
	mov	r1, r7
	ldr	r0, .LCPI7_0
	mov	r2, #65
	str	r0, [sp, #20]
	mov	r0, #64
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp, #12]
	mov	r0, #10
	str	r0, [sp, #8]
	ldr	r0, [sp, #172]
	str	r0, [sp, #4]
	ldr	r0, [sp, #168]
	str	r0, [sp]
	add	r0, sp, #40
	str	r6, [sp, #44]
	str	r6, [sp, #40]
	str	r9, [sp, #32]
	str	r6, [sp, #28]
	bl	"strconv::write_bits"
	cmp	r5, #0
	beq	.LBB7_2
	ldr	r0, [sp, #44]
	mov	r1, #0
	ldr	r3, [sp, #40]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #120
	str	r1, [sp, #128]
	str	r1, [sp, #124]
	str	r1, [sp, #120]
	str	r1, [sp, #8]
	str	r1, [sp, #12]
	str	r1, [sp, #16]
	mov	r1, r8
	ldr	r7, [sp, #176]
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	cmp	r7, #0
	ldr	r6, [sp, #120]
	ldr	r0, [sp, #128]
	ldrne	r1, [r7]
	addne	r1, r1, r6
	strne	r1, [r7]
	b	.LBB7_3
.LBB7_2:
	mvn	r0, #0
.LBB7_3:
	str	r6, [r4]
	str	r0, [r4, #4]
	add	sp, sp, #136
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI7_0:
	.long	".Lcsbs$POC-Example$0"
.Lfunc_end7:
	.size	"io::write_i64", .Lfunc_end7-"io::write_i64"
	.fnend

	.section	.text.unlikely.,"ax",%progbits
	.p2align	2
	.type	"runtime::multi_pointer_slice_handle_error",%function
	.code	32
"runtime::multi_pointer_slice_handle_error":
	.fnstart
	.pad	#24
	sub	sp, sp, #24
	mov	r12, #0
	stm	sp, {r0, r1, r2, r3, r12}
	mov	r0, sp
	str	r12, [sp, #20]
	bl	"runtime::print_caller_location"
	mov	r0, #0
	mov	r1, #0
	bl	"runtime::print_i64"
	ldr	r0, [sp, #24]
	asr	r1, r0, #31
	bl	"runtime::print_i64"
	.inst	0xe7ffdefe
.Lfunc_end8:
	.size	"runtime::multi_pointer_slice_handle_error", .Lfunc_end8-"runtime::multi_pointer_slice_handle_error"
	.cantunwind
	.fnend

	.text
	.p2align	2
	.type	"runtime::default_random_generator_proc",%function
	.code	32
"runtime::default_random_generator_proc":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r9, r0
	ldr	r0, .LCPI9_0
	mov	r5, r2
	mov	r6, r3
.LPC9_0:
	ldr	r2, [pc, r0]
	bl	__aeabi_read_tp
	cmp	r9, #0
	addeq	r9, r0, r2
	cmp	r1, #2
	beq	.LBB9_15
	cmp	r1, #1
	beq	.LBB9_11
	cmp	r1, #0
	bne	.LBB9_25
	ldrb	r0, [r9, #1028]
	cmp	r0, #0
	beq	.LBB9_26
	ldr	r0, [r9, #1024]
	ldr	r8, [sp, #40]
	cmp	r0, #992
	bgt	.LBB9_27
	bne	.LBB9_7
	mov	r0, r9
	mov	r1, r8
	bl	"runtime::[random_generator_chacha8.odin]::chacha8rand_refill"
	ldr	r0, [r9, #1024]
.LBB9_7:
	cmp	r0, #984
	bgt	.LBB9_28
	tst	r0, #7
	bne	.LBB9_29
	cmp	r6, #8
	bne	.LBB9_16
	mov	r1, r9
	ldr	r0, [r1, r0]!
	ldr	r2, [r1, #4]
	str	r0, [r5]
	mov	r0, #0
	str	r2, [r5, #4]
	str	r0, [r1]
	str	r0, [r1, #4]
	ldr	r0, [r9, #1024]
	add	r0, r0, #8
	str	r0, [r9, #1024]
	b	.LBB9_25
.LBB9_11:
	cmp	r6, #0
	beq	.LBB9_23
	add	r0, r9, #992
	mov	r1, #0
	cmp	r6, #1
	str	r1, [r0, #28]
	str	r1, [r0, #24]
	str	r1, [r0, #20]
	str	r1, [r0, #16]
	str	r1, [r0, #12]
	str	r1, [r0, #8]
	str	r1, [r0, #4]
	str	r1, [r0]
	blt	.LBB9_14
	cmp	r6, #32
	mov	r1, r5
	movhs	r6, #32
	mov	r2, r6
	bl	memmove
.LBB9_14:
	mov	r0, #992
	str	r0, [r9, #1024]
	mov	r0, #1
	b	.LBB9_24
.LBB9_15:
	cmp	r6, #4
	ldreq	r0, [r5]
	orreq	r0, r0, #11
	streq	r0, [r5]
	b	.LBB9_25
.LBB9_16:
	cmp	r6, #1
	bge	.LBB9_19
	b	.LBB9_25
.LBB9_17:
	mov	r0, r9
	mov	r1, r8
	bl	"runtime::[random_generator_chacha8.odin]::chacha8rand_refill"
.LBB9_18:
	sub	r6, r6, r7
	add	r5, r5, r7
	cmp	r6, #0
	ble	.LBB9_25
.LBB9_19:
	ldr	r0, [r9, #1024]
	rsb	r7, r0, #992
	rsb	r2, r0, #1024
	cmp	r6, r7
	movlt	r7, r6
	cmp	r7, r2
	movlt	r2, r7
	cmp	r2, #1
	blt	.LBB9_21
	add	r1, r9, r0
	mov	r0, r5
	bl	memmove
	ldr	r0, [r9, #1024]
.LBB9_21:
	add	r1, r7, #7
	asr	r2, r1, #31
	add	r1, r1, r2, lsr #29
	bic	r2, r1, #7
	add	r4, r0, r2
	cmp	r4, #992
	bge	.LBB9_17
	add	r0, r9, r0
	mov	r1, #0
	bl	memset
	str	r4, [r9, #1024]
	b	.LBB9_18
.LBB9_23:
	mov	r0, #0
.LBB9_24:
	strb	r0, [r9, #1028]
.LBB9_25:
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
.LBB9_26:
	.inst	0xe7ffdefe
.LBB9_27:
	ldr	r0, [r8, #16]
	mov	r3, #38
	ldr	r4, .LCPI9_2
	cmp	r0, #0
	ldr	r2, .LCPI9_4
	movne	r4, r0
	ldr	r0, .LCPI9_3
	ldr	r1, .LCPI9_1
	b	.LBB9_30
.LBB9_28:
	ldr	r0, [r8, #16]
	mov	r3, #54
	ldr	r4, .LCPI9_2
	cmp	r0, #0
	ldr	r2, .LCPI9_6
	movne	r4, r0
	ldr	r0, .LCPI9_3
	ldr	r1, .LCPI9_5
	b	.LBB9_30
.LBB9_29:
	ldr	r0, [r8, #16]
	mov	r3, #61
	ldr	r4, .LCPI9_2
	cmp	r0, #0
	ldr	r2, .LCPI9_8
	movne	r4, r0
	ldr	r0, .LCPI9_3
	ldr	r1, .LCPI9_7
.LBB9_30:
	str	r1, [sp]
	mov	r1, #17
	str	r8, [sp, #4]
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI9_0:
.Ltmp0:
	.long	"runtime::default_random_generator_proc-.state-11174"(GOTTPOFF)-((.LPC9_0+8)-.Ltmp0)
.LCPI9_1:
	.long	".Lscl$[default_random_generator_proc2154]"
.LCPI9_2:
	.long	"runtime::default_assertion_failure_proc"
.LCPI9_3:
	.long	".Lcsbs$POC-Example$1aa"
.LCPI9_4:
	.long	".Lcsbs$POC-Example$fe"
.LCPI9_5:
	.long	".Lscl$[default_random_generator_proc2479]"
.LCPI9_6:
	.long	".Lcsbs$POC-Example$100"
.LCPI9_7:
	.long	".Lscl$[default_random_generator_proc2581]"
.LCPI9_8:
	.long	".Lcsbs$POC-Example$101"
.Lfunc_end9:
	.size	"runtime::default_random_generator_proc", .Lfunc_end9-"runtime::default_random_generator_proc"
	.fnend

	.p2align	2
	.type	"strconv::write_bits",%function
	.code	32
"strconv::write_bits":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#156
	sub	sp, sp, #156
	add	r7, sp, #24
	mov	r11, r2
	str	r1, [sp, #20]
	mov	r4, r0
	mov	r0, r7
	mov	r1, #0
	mov	r2, #129
	bl	memset
	ldr	r1, [sp, #204]
	ldr	r2, [sp, #196]
	ldr	r0, [sp, #192]
	cmp	r1, #0
	str	r4, [sp, #16]
	beq	.LBB10_5
	ldr	r1, [sp, #208]
	sub	r1, r1, #8
	ror	r1, r1, #3
	cmp	r1, #7
	bhi	.LBB10_50
	adr	r3, .LJTI10_0
	ldr	pc, [r3, r1, lsl #2]
	.p2align	2
.LJTI10_0:
	.long	.LBB10_4
	.long	.LBB10_7
	.long	.LBB10_50
	.long	.LBB10_8
	.long	.LBB10_50
	.long	.LBB10_50
	.long	.LBB10_50
	.long	.LBB10_6
.LBB10_4:
	lsl	r1, r0, #24
	and	r0, r0, #255
	asr	r2, r1, #24
	eor	r2, r2, r1, asr #31
	lsr	r8, r0, #7
	sub	r5, r2, r1, asr #31
	b	.LBB10_9
.LBB10_5:
	mov	r8, #0
	mov	r5, r0
	mov	r1, r2
	b	.LBB10_10
.LBB10_6:
	eor	r0, r0, r2, asr #31
	eor	r1, r2, r2, asr #31
	subs	r5, r0, r2, asr #31
	lsr	r8, r2, #31
	sbc	r1, r1, r2, asr #31
	b	.LBB10_10
.LBB10_7:
	lsl	r1, r0, #16
	asr	r2, r1, #16
	eor	r2, r2, r1, asr #31
	sub	r5, r2, r1, asr #31
	mov	r1, #255
	orr	r1, r1, #65280
	and	r0, r0, r1
	lsr	r8, r0, #15
	b	.LBB10_9
.LBB10_8:
	cmp	r0, #0
	mov	r5, r0
	rsbmi	r5, r0, #0
	lsr	r8, r0, #31
.LBB10_9:
	mov	r1, #0
.LBB10_10:
	ldr	r6, [sp, #200]
	mov	r4, #128
	ldr	r9, [sp, #216]
	ldr	r10, [sp, #212]
	subs	r0, r5, r6
	sbcs	r0, r1, #0
	bhs	.LBB10_12
	mov	r0, r5
	mov	r5, #129
	b	.LBB10_17
.LBB10_12:
	cmp	r4, #129
	bhs	.LBB10_43
	mov	r0, r5
	mov	r2, r6
	mov	r3, #0
	bl	__aeabi_uldivmod
	mul	r2, r0, r6
	sub	r2, r5, r2
	cmp	r9, r2
	bls	.LBB10_42
	ldrb	r2, [r10, r2]
	mov	r5, r0
	strb	r2, [r7, r4]
	subs	r2, r0, r6
	sub	r4, r4, #1
	sbcs	r2, r1, #0
	bhs	.LBB10_12
	cmp	r4, #129
	bhs	.LBB10_46
	add	r5, r4, #1
.LBB10_17:
	mov	r2, r6
	mov	r3, #0
	bl	__aeabi_uldivmod
	cmp	r9, r2
	bls	.LBB10_45
	ldrb	r0, [sp, #220]
	ldrb	r1, [r10, r2]
	tst	r0, #1
	strb	r1, [r7, r4]
	beq	.LBB10_31
	sub	r1, r6, #2
	ror	r1, r1, #1
	cmp	r1, #7
	bhi	.LBB10_31
	adr	r2, .LJTI10_1
	ldr	pc, [r2, r1, lsl #2]
	.p2align	2
.LJTI10_1:
	.long	.LBB10_22
	.long	.LBB10_31
	.long	.LBB10_31
	.long	.LBB10_26
	.long	.LBB10_31
	.long	.LBB10_24
	.long	.LBB10_31
	.long	.LBB10_28
.LBB10_22:
	sub	r1, r5, #2
	mov	r2, #98
	cmp	r1, #129
	blo	.LBB10_29
	mov	r0, #129
	str	r1, [sp]
	str	r0, [sp, #4]
	mov	r1, #52
	ldr	r0, .LCPI10_0
	mov	r2, #83
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_24:
	sub	r1, r5, #2
	mov	r2, #122
	cmp	r1, #129
	blo	.LBB10_29
	mov	r0, #129
	str	r1, [sp]
	str	r0, [sp, #4]
	mov	r1, #52
	ldr	r0, .LCPI10_0
	mov	r2, #86
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_26:
	sub	r1, r5, #2
	mov	r2, #111
	cmp	r1, #129
	blo	.LBB10_29
	mov	r0, #129
	str	r1, [sp]
	str	r0, [sp, #4]
	mov	r1, #52
	ldr	r0, .LCPI10_0
	mov	r2, #84
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_28:
	sub	r1, r5, #2
	mov	r2, #120
	cmp	r1, #129
	bhs	.LBB10_49
.LBB10_29:
	sub	r4, r1, #1
	strb	r2, [r7, r1]
	cmp	r4, #129
	bhs	.LBB10_47
	mov	r1, #48
	strb	r1, [r7, r4]
.LBB10_31:
	cmp	r8, #0
	beq	.LBB10_34
	ldr	r6, [sp, #20]
	sub	r4, r4, #1
	mov	r0, #45
	cmp	r4, #129
	blo	.LBB10_36
	mov	r0, #129
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #97
	b	.LBB10_44
.LBB10_34:
	ldr	r6, [sp, #20]
	cmp	r0, #2
	blo	.LBB10_37
	sub	r4, r4, #1
	mov	r0, #43
	cmp	r4, #129
	bhs	.LBB10_48
.LBB10_36:
	strb	r0, [r7, r4]
.LBB10_37:
	rsb	r5, r4, #129
	mov	r2, r11
	cmp	r11, r5
	movge	r2, r5
	cmp	r2, #1
	blt	.LBB10_39
	add	r1, r7, r4
	mov	r0, r6
	bl	memcpy
.LBB10_39:
	cmp	r11, #0
	bmi	.LBB10_41
	cmp	r5, r11
	ldrle	r0, [sp, #16]
	strle	r6, [r0]
	strle	r5, [r0, #4]
	addle	sp, sp, #156
	pople	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	movle	pc, lr
.LBB10_41:
	mov	r0, #0
	mov	r1, #52
	stm	sp, {r0, r5, r11}
	mov	r2, #104
	mov	r3, #19
	ldr	r0, .LCPI10_0
	bl	"runtime::slice_handle_error"
.LBB10_42:
	ldr	r0, .LCPI10_0
	mov	r1, #52
	stm	sp, {r2, r9}
	mov	r2, #75
	mov	r3, #23
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_43:
	mov	r0, #129
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #75
.LBB10_44:
	ldr	r0, .LCPI10_0
	mov	r3, #11
	str	r4, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_45:
	ldr	r0, .LCPI10_0
	mov	r1, #52
	stm	sp, {r2, r9}
	mov	r2, #78
	mov	r3, #22
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_46:
	mov	r0, #129
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #78
	ldr	r0, .LCPI10_0
	mov	r3, #10
	str	r4, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_47:
	mov	r0, #129
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #91
	ldr	r0, .LCPI10_0
	mov	r3, #12
	str	r4, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_48:
	mov	r0, #129
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #99
	b	.LBB10_44
.LBB10_49:
	mov	r0, #129
	str	r1, [sp]
	str	r0, [sp, #4]
	mov	r1, #52
	ldr	r0, .LCPI10_0
	mov	r2, #87
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB10_50:
	ldr	r0, [sp, #224]
	mov	r3, #41
	str	r0, [sp, #4]
	ldr	r2, .LCPI10_4
	ldr	r1, [r0, #16]
	ldr	r0, .LCPI10_1
	str	r0, [sp]
	cmp	r1, #0
	ldr	r0, .LCPI10_3
	ldr	r4, .LCPI10_2
	movne	r4, r1
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI10_0:
	.long	".Lcsbs$POC-Example$f1"
.LCPI10_1:
	.long	".Lscl$[is_integer_negative1101]"
.LCPI10_2:
	.long	"runtime::default_assertion_failure_proc"
.LCPI10_3:
	.long	".Lcsbs$POC-Example$17b"
.LCPI10_4:
	.long	".Lcsbs$POC-Example$f0"
.Lfunc_end10:
	.size	"strconv::write_bits", .Lfunc_end10-"strconv::write_bits"
	.fnend

	.p2align	2
	.type	"runtime::slice_expr_error_hi",%function
	.code	32
"runtime::slice_expr_error_hi":
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	.pad	#16
	sub	sp, sp, #16
	ldr	lr, [sp, #24]
	ldr	r12, [sp, #28]
	cmp	lr, #0
	bmi	.LBB11_2
	cmp	lr, r12
	addle	sp, sp, #16
	pople	{r4, lr}
	movle	pc, lr
.LBB11_2:
	mov	r4, #0
	str	r12, [sp, #8]
	stm	sp, {r4, lr}
	bl	"runtime::slice_handle_error"
.Lfunc_end11:
	.size	"runtime::slice_expr_error_hi", .Lfunc_end11-"runtime::slice_expr_error_hi"
	.cantunwind
	.fnend

	.p2align	2
	.type	"utf8::decode_rune_in_bytes",%function
	.code	32
"utf8::decode_rune_in_bytes":
	.fnstart
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r12, #253
	cmp	r2, #0
	orr	r12, r12, #65280
	ble	.LBB12_3
	ldrb	r3, [r1]
	ldr	r6, .LCPI12_0
	ldrb	r4, [r6, r3]
	sub	r6, r3, #245
	cmn	r6, #52
	bhi	.LBB12_4
	mov	r6, #253
	and	r1, r4, #1
	rsb	r2, r1, #0
	sub	r1, r1, #1
	orr	r6, r6, #65280
	and	r1, r1, r3
	and	r2, r2, r6
	mov	lr, #1
	orr	r12, r1, r2
	b	.LBB12_8
.LBB12_3:
	mov	lr, #0
	b	.LBB12_8
.LBB12_4:
	add	r5, r3, #62
	lsr	r6, r4, #4
	and	r5, r5, #255
	cmp	r5, #51
	bhs	.LBB12_18
	and	r4, r4, #7
	mov	lr, #1
	cmp	r2, r4
	blo	.LBB12_8
	cmp	r2, #1
	beq	.LBB12_19
	ldr	r4, .LCPI12_1
	add	r6, r4, r6, lsl #1
	ldrb	r4, [r1, #1]
	ldrb	r7, [r6]
	cmp	r4, r7
	ldrbhs	r6, [r6, #1]
	cmphs	r6, r4
	bhs	.LBB12_9
.LBB12_8:
	stm	r0, {r12, lr}
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r11, lr}
	mov	pc, lr
.LBB12_9:
	cmp	r5, #29
	bhi	.LBB12_11
	and	r1, r3, #31
	and	r2, r4, #63
	mov	lr, #2
	orr	r12, r2, r1, lsl #6
	b	.LBB12_8
.LBB12_11:
	cmp	r2, #2
	bls	.LBB12_22
	ldrsb	r5, [r1, #2]
	cmn	r5, #65
	bgt	.LBB12_8
	and	r6, r3, #240
	cmp	r6, #224
	bne	.LBB12_15
	and	r2, r4, #63
	and	r1, r3, #15
	mov	lr, #3
	lsl	r2, r2, #6
	orr	r1, r2, r1, lsl #12
	and	r2, r5, #63
	orr	r12, r1, r2
	b	.LBB12_8
.LBB12_15:
	cmp	r2, #3
	beq	.LBB12_23
	ldrsb	r1, [r1, #3]
	cmn	r1, #65
	bgt	.LBB12_8
	and	r2, r3, #7
	and	r3, r4, #63
	and	r1, r1, #63
	mov	lr, #4
	lsl	r3, r3, #12
	orr	r2, r3, r2, lsl #18
	and	r3, r5, #63
	orr	r2, r2, r3, lsl #6
	orr	r12, r2, r1
	b	.LBB12_8
.LBB12_18:
	mov	r0, #5
	mov	r1, #53
	str	r0, [sp, #4]
	mov	r2, #124
	ldr	r0, .LCPI12_2
	mov	r3, #26
	str	r6, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB12_19:
	mov	r0, #1
	mov	r1, #53
	str	r0, [sp]
	mov	r2, #128
.LBB12_20:
	str	r0, [sp, #4]
.LBB12_21:
	mov	r3, #10
	ldr	r0, .LCPI12_2
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB12_22:
	mov	r0, #2
	mov	r1, #53
	stm	sp, {r0, r2}
	mov	r2, #135
	b	.LBB12_21
.LBB12_23:
	mov	r0, #3
	mov	r1, #53
	str	r0, [sp]
	mov	r2, #142
	b	.LBB12_20
	.p2align	2
.LCPI12_0:
	.long	"runtime::string_decode_rune-.accept_sizes-11694"
.LCPI12_1:
	.long	"utf8::accept_ranges"
.LCPI12_2:
	.long	".Lcsbs$POC-Example$104"
.Lfunc_end12:
	.size	"utf8::decode_rune_in_bytes", .Lfunc_end12-"utf8::decode_rune_in_bytes"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::mem_alloc_bytes",%function
	.code	32
"runtime::mem_alloc_bytes":
	.fnstart
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	.pad	#32
	sub	sp, sp, #32
	mov	r5, r1
	mov	r4, r0
	mov	r0, #0
	mov	r1, #0
	cmp	r5, #0
	beq	.LBB13_3
	mov	r6, r2
	cmp	r2, #0
	mov	r2, #0
	beq	.LBB13_4
	mov	r0, #1
	ldr	r1, [sp, #48]
	stm	sp, {r0, r2}
	add	r0, sp, #20
	ldr	r12, [sp, #52]
	str	r1, [sp, #12]
	mov	r1, r3
	mov	r3, r5
	strb	r2, [sp, #28]
	str	r2, [sp, #24]
	str	r2, [sp, #20]
	str	r2, [sp, #8]
	str	r12, [sp, #16]
	mov	lr, pc
	mov	pc, r6
	ldrb	r0, [sp, #28]
	ldr	r1, [sp, #20]
	ldr	r2, [sp, #24]
	b	.LBB13_4
.LBB13_3:
	mov	r2, #0
.LBB13_4:
	strb	r0, [r4, #8]
	stm	r4, {r1, r2}
	add	sp, sp, #32
	pop	{r4, r5, r6, lr}
	mov	pc, lr
.Lfunc_end13:
	.size	"runtime::mem_alloc_bytes", .Lfunc_end13-"runtime::mem_alloc_bytes"
	.fnend

	.p2align	2
	.type	"strconv::format_digits",%function
	.code	32
"strconv::format_digits":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.setfp	r11, sp, #28
	add	r11, sp, #28
	.pad	#60
	sub	sp, sp, #60
	bic	sp, sp, #15
	ldr	r7, [r11, #20]
	mov	r9, r0
	mov	r10, r1
	mov	r8, r2
	and	r0, r7, #255
	sub	r1, r0, #69
	cmp	r1, #34
	bhi	.LBB14_18
	adr	r2, .LJTI14_0
	ldr	r4, [r11, #16]
	ldr	r5, [r11, #12]
	ldr	r0, [r11, #8]
	ldr	pc, [r2, r1, lsl #2]
	.p2align	2
.LJTI14_0:
	.long	.LBB14_3
	.long	.LBB14_9
	.long	.LBB14_15
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_18
	.long	.LBB14_3
	.long	.LBB14_9
	.long	.LBB14_15
.LBB14_3:
	mov	r1, #43
	cmp	r0, #0
	movne	r1, #45
	cmn	r8, #1
	strb	r1, [sp, #48]
	ble	.LBB14_102
	cmp	r8, #0
	mov	r7, r8
	movne	r7, #1
	beq	.LBB14_6
	add	r1, sp, #48
	mov	r0, r10
	mov	r2, r7
	bl	memcpy
.LBB14_6:
	ldr	r0, [r5, #8]
	cmp	r0, #0
	beq	.LBB14_27
	ldr	r0, [r5, #4]
	cmp	r0, #0
	beq	.LBB14_108
	ldr	r0, [r5]
	ldrb	r0, [r0]
	b	.LBB14_28
.LBB14_9:
	mov	r2, #43
	cmp	r0, #0
	mov	r1, #0
	movne	r2, #45
	cmn	r8, #1
	strh	r1, [sp, #48]
	strb	r1, [sp, #50]
	strb	r2, [sp, #48]
	ble	.LBB14_103
	cmp	r8, #0
	mov	r6, r8
	movne	r6, #1
	beq	.LBB14_12
	add	r1, sp, #48
	mov	r0, r10
	mov	r2, r6
	bl	memcpy
.LBB14_12:
	ldr	r0, [r5, #12]
	str	r9, [sp, #28]
	cmp	r0, #1
	blt	.LBB14_24
	ldmib	r5, {r1, r2}
	cmp	r2, r0
	mov	r7, r0
	movlt	r7, r2
	cmp	r1, #0
	cmppl	r2, #0
	bpl	.LBB14_41
.LBB14_14:
	mov	r0, #0
	str	r1, [sp, #8]
	stm	sp, {r0, r7}
	mov	r1, #57
	mov	r2, #159
	ldr	r0, .LCPI14_0
	mov	r3, #31
	bl	"runtime::slice_handle_error"
.LBB14_15:
	mov	r12, r7
	ldr	r7, [r5, #8]
	ldr	r2, [r5, #12]
	cmp	r7, r2
	mov	r1, r7
	movlt	r1, r4
	cmp	r4, r7
	movle	r1, r4
	cmp	r3, #0
	sub	r6, r2, #1
	movne	r1, #6
	cmn	r6, #4
	blt	.LBB14_22
	cmp	r6, r1
	bge	.LBB14_22
	cmp	r4, r2
	mov	r1, #0
	movle	r7, r4
	sub	r2, r7, r2
	stm	sp, {r0, r5}
	add	r0, sp, #32
	bic	r2, r2, r2, asr #31
	str	r1, [sp, #36]
	str	r1, [sp, #32]
	mov	r1, #102
	str	r2, [sp, #8]
	mov	r2, r8
	str	r1, [sp, #12]
	mov	r1, r10
	bl	"strconv::format_digits"
	ldr	r0, [sp, #32]
	ldr	r1, [sp, #36]
	b	.LBB14_23
.LBB14_18:
	mov	r0, #37
	cmn	r8, #1
	strb	r7, [sp, #49]
	strb	r0, [sp, #48]
	ble	.LBB14_102
	cmp	r8, #2
	mov	r5, r8
	movhs	r5, #2
	cmp	r8, #0
	beq	.LBB14_21
	add	r1, sp, #48
	mov	r0, r10
	mov	r2, r5
	bl	memcpy
.LBB14_21:
	str	r10, [r9]
	str	r5, [r9, #4]
	b	.LBB14_89
.LBB14_22:
	mov	r1, #0
	cmp	r4, r7
	movlt	r7, r4
	sub	r2, r7, #1
	stm	sp, {r0, r5}
	add	r0, sp, #40
	str	r1, [sp, #44]
	str	r1, [sp, #40]
	sub	r1, r12, #2
	str	r2, [sp, #8]
	mov	r2, r8
	str	r1, [sp, #12]
	mov	r1, r10
	bl	"strconv::format_digits"
	ldr	r0, [sp, #40]
	ldr	r1, [sp, #44]
.LBB14_23:
	stm	r9, {r0, r1}
	b	.LBB14_89
.LBB14_24:
	sub	r5, r8, r6
	mov	r0, #48
	cmp	r5, #1
	strb	r0, [sp, #48]
	movge	r5, #1
	blt	.LBB14_26
	add	r0, r10, r6
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
.LBB14_26:
	add	r6, r5, r6
	b	.LBB14_51
.LBB14_27:
	mov	r0, #48
.LBB14_28:
	sub	r5, r8, r7
	strb	r0, [sp, #48]
	cmp	r5, #1
	movge	r5, #1
	blt	.LBB14_30
	add	r0, r10, r7
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
.LBB14_30:
	add	r6, r5, r7
	cmp	r4, #1
	str	r9, [sp, #28]
	blt	.LBB14_40
	mov	r0, #46
	cmn	r6, #1
	strb	r0, [sp, #48]
	ble	.LBB14_99
	sub	r5, r8, r6
	mov	r0, #1
	cmp	r5, #1
	movge	r5, r0
	blt	.LBB14_34
	add	r0, r10, r6
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
.LBB14_34:
	ldr	r1, [r11, #12]
	mov	r9, r10
	add	r10, r4, #1
	add	r6, r5, r6
	ldr	r0, [r1, #8]
	cmp	r0, r10
	movlt	r10, r0
	cmp	r10, #2
	blt	.LBB14_69
	ldr	r0, [r1, #4]
	cmp	r10, r0
	bgt	.LBB14_109
	cmn	r6, #1
	ble	.LBB14_99
	sub	r0, r8, r6
	sub	r5, r10, #1
	cmp	r0, r5
	movlt	r5, r0
	cmp	r5, #1
	blt	.LBB14_39
	ldr	r0, [r11, #12]
	mov	r2, r5
	ldr	r0, [r0]
	add	r1, r0, #1
	add	r0, r9, r6
	bl	memmove
.LBB14_39:
	add	r6, r5, r6
	cmp	r10, r4
	bhi	.LBB14_70
	b	.LBB14_90
.LBB14_40:
	mov	r9, r10
	b	.LBB14_70
.LBB14_41:
	cmp	r7, r1
	bgt	.LBB14_14
	sub	r5, r8, r6
	cmp	r5, r7
	movge	r5, r7
	cmp	r5, #1
	blt	.LBB14_44
	ldr	r1, [r11, #12]
	add	r0, r10, r6
	mov	r2, r5
	ldr	r1, [r1]
	bl	memmove
	ldr	r0, [r11, #12]
	ldr	r0, [r0, #12]
.LBB14_44:
	add	r6, r5, r6
	cmp	r7, r0
	bge	.LBB14_51
	mov	r9, #48
	b	.LBB14_47
.LBB14_46:
	add	r7, r7, #1
	add	r6, r5, r6
	cmp	r7, r0
	bge	.LBB14_51
.LBB14_47:
	cmp	r6, #0
	strb	r9, [sp, #48]
	bmi	.LBB14_99
	cmp	r8, r6
	blt	.LBB14_99
	sub	r5, r8, r6
	cmp	r5, #1
	movge	r5, #1
	blt	.LBB14_46
	add	r0, r10, r6
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
	ldr	r0, [r11, #12]
	ldr	r4, [r11, #16]
	ldr	r0, [r0, #12]
	b	.LBB14_46
.LBB14_51:
	cmp	r4, #1
	blt	.LBB14_66
	mov	r0, #46
	cmp	r6, #0
	strb	r0, [sp, #48]
	bmi	.LBB14_99
	cmp	r8, r6
	blt	.LBB14_99
	sub	r5, r8, r6
	mov	r7, #1
	cmp	r5, #1
	movge	r5, r7
	blt	.LBB14_56
	add	r0, r10, r6
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
	ldr	r4, [r11, #16]
.LBB14_56:
	add	r6, r5, r6
	mov	r9, #0
	b	.LBB14_58
.LBB14_57:
	add	r9, r9, #1
	add	r6, r5, r6
	cmp	r4, r9
	beq	.LBB14_66
.LBB14_58:
	ldr	r5, [r11, #12]
	mov	r2, #48
	ldr	r0, [r5, #12]
	adds	r1, r9, r0
	bmi	.LBB14_62
	ldr	r3, [r5, #8]
	cmp	r1, r3
	bge	.LBB14_62
	ldr	r2, [r5, #4]
	cmp	r1, r2
	bhs	.LBB14_101
	ldr	r1, [r5]
	add	r0, r1, r0
	ldrb	r2, [r0, r9]
.LBB14_62:
	cmp	r6, #0
	strb	r2, [sp, #48]
	bmi	.LBB14_99
	cmp	r8, r6
	blt	.LBB14_99
	sub	r5, r8, r6
	cmp	r5, #1
	movge	r5, r7
	blt	.LBB14_57
	add	r0, r10, r6
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
	ldr	r4, [r11, #16]
	b	.LBB14_57
.LBB14_66:
	cmp	r6, #0
	bmi	.LBB14_106
	cmp	r6, r8
	bgt	.LBB14_106
	ldr	r0, [sp, #28]
	str	r10, [r0]
	str	r6, [r0, #4]
	b	.LBB14_89
.LBB14_69:
	mov	r10, #1
	cmp	r10, r4
	bls	.LBB14_90
.LBB14_70:
	ldr	r0, [r11, #20]
	cmp	r6, #0
	strb	r0, [sp, #48]
	bmi	.LBB14_99
	cmp	r8, r6
	blt	.LBB14_99
	sub	r7, r8, r6
	ldr	r5, [r11, #12]
	cmp	r7, #1
	movge	r7, #1
	blt	.LBB14_74
	add	r0, r9, r6
	add	r1, sp, #48
	mov	r2, r7
	bl	memcpy
.LBB14_74:
	ldr	r10, [r5, #8]
	ldr	r0, [r5, #12]
	cmp	r10, #0
	subne	r10, r0, #1
	mov	r0, #43
	cmp	r10, #0
	movmi	r0, #45
	rsbmi	r10, r10, #0
	adds	r6, r7, r6
	strb	r0, [sp, #48]
	bmi	.LBB14_99
	cmp	r8, r6
	blt	.LBB14_99
	sub	r5, r8, r6
	cmp	r5, #1
	movge	r5, #1
	blt	.LBB14_78
	add	r0, r9, r6
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
.LBB14_78:
	add	r5, r5, r6
	cmp	r10, #10
	bge	.LBB14_80
	mov	r0, #48
	strb	r0, [sp, #48]
	add	r0, r10, #48
	b	.LBB14_82
.LBB14_80:
	cmp	r10, #100
	bhs	.LBB14_96
	and	r0, r10, #255
	mov	r1, #205
	mul	r2, r0, r1
	mov	r0, #48
	orr	r0, r0, r2, lsr #11
	strb	r0, [sp, #48]
	lsr	r0, r2, #11
	add	r0, r0, r0, lsl #2
	sub	r0, r10, r0, lsl #1
	orr	r0, r0, #48
.LBB14_82:
	cmp	r5, #0
	strb	r0, [sp, #49]
	bmi	.LBB14_105
	cmp	r8, r5
	blt	.LBB14_105
	sub	r0, r8, r5
	ldr	r6, [sp, #28]
	cmp	r0, #2
	mov	r7, r0
	movge	r7, #2
	cmp	r0, #0
	ble	.LBB14_86
.LBB14_85:
	add	r0, r9, r5
	add	r1, sp, #48
	mov	r2, r7
	bl	memcpy
.LBB14_86:
	adds	r0, r7, r5
	bmi	.LBB14_104
	cmp	r0, r8
	bgt	.LBB14_104
	str	r9, [r6]
	str	r0, [r6, #4]
.LBB14_89:
	sub	sp, r11, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB14_90:
	mov	r7, #48
	b	.LBB14_92
.LBB14_91:
	add	r10, r10, #1
	add	r6, r5, r6
	cmp	r10, r4
	bgt	.LBB14_70
.LBB14_92:
	cmp	r6, #0
	strb	r7, [sp, #48]
	bmi	.LBB14_99
	cmp	r8, r6
	blt	.LBB14_99
	sub	r5, r8, r6
	cmp	r5, #1
	movge	r5, #1
	blt	.LBB14_91
	add	r0, r9, r6
	add	r1, sp, #48
	mov	r2, r5
	bl	memcpy
	ldr	r4, [r11, #16]
	b	.LBB14_91
.LBB14_96:
	ldr	r0, .LCPI14_1
	cmp	r5, #0
	umull	r1, r2, r10, r0
	mov	r0, #48
	add	r0, r0, r2, lsr #5
	strb	r0, [sp, #48]
	ldr	r0, .LCPI14_2
	umull	r1, r2, r10, r0
	lsr	r0, r2, #3
	add	r1, r0, r0, lsl #2
	sub	r1, r10, r1, lsl #1
	orr	r1, r1, #48
	strb	r1, [sp, #50]
	mov	r1, #255
	and	r1, r1, r2, lsr #3
	mov	r2, #205
	mul	r3, r1, r2
	lsr	r1, r3, #11
	add	r1, r1, r1, lsl #2
	sub	r0, r0, r1, lsl #1
	orr	r0, r0, #48
	strb	r0, [sp, #49]
	bmi	.LBB14_105
	cmp	r8, r5
	blt	.LBB14_105
	sub	r0, r8, r5
	ldr	r6, [sp, #28]
	cmp	r0, #3
	mov	r7, r0
	movge	r7, #3
	cmp	r0, #1
	bge	.LBB14_85
	b	.LBB14_86
.LBB14_99:
	str	r6, [sp]
.LBB14_100:
	ldr	r0, .LCPI14_0
	mov	r1, #57
	mov	r2, #146
	mov	r3, #22
	str	r8, [sp, #4]
	str	r8, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB14_101:
	ldr	r0, .LCPI14_0
	mov	r3, #22
	stm	sp, {r1, r2}
	mov	r1, #57
	mov	r2, #174
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB14_102:
	mov	r0, #0
	str	r0, [sp]
	b	.LBB14_100
.LBB14_103:
	str	r1, [sp]
	b	.LBB14_100
.LBB14_104:
	mov	r1, #0
	str	r0, [sp, #4]
	str	r1, [sp]
	b	.LBB14_107
.LBB14_105:
	str	r5, [sp]
	b	.LBB14_100
.LBB14_106:
	mov	r0, #0
	stm	sp, {r0, r6}
.LBB14_107:
	ldr	r0, .LCPI14_0
	mov	r1, #57
	mov	r2, #143
	mov	r3, #13
	str	r8, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB14_108:
	mov	r0, #0
	mov	r1, #57
	str	r0, [sp]
	mov	r2, #186
	str	r0, [sp, #4]
	mov	r3, #21
	ldr	r0, .LCPI14_0
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB14_109:
	str	r0, [sp, #8]
	mov	r1, #1
	ldr	r0, .LCPI14_0
	mov	r2, #195
	stm	sp, {r1, r10}
	mov	r1, #57
	mov	r3, #32
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI14_0:
	.long	".Lcsbs$POC-Example$f5"
.LCPI14_1:
	.long	1374389535
.LCPI14_2:
	.long	3435973837
.Lfunc_end14:
	.size	"strconv::format_digits", .Lfunc_end14-"strconv::format_digits"
	.cantunwind
	.fnend

	.p2align	2
	.type	"strconv_decimal::assign",%function
	.code	32
"strconv_decimal::assign":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.pad	#72
	sub	sp, sp, #72
	add	r9, sp, #8
	mov	r7, r2
	mov	r4, r0
	mov	r1, #0
	mov	r0, r9
	mov	r2, #64
	mov	r6, r3
	mov	r8, #0
	bl	memset
	orrs	r0, r7, r6
	beq	.LBB15_11
	ldr	r10, .LCPI15_0
	mov	r12, #246
	ldr	lr, .LCPI15_1
	mov	r1, #0
.LBB15_2:
	cmp	r1, #64
	beq	.LBB15_15
	lsr	r2, r7, #1
	orr	r2, r2, r6, lsl #31
	adds	r3, r2, r6, lsr #1
	adc	r3, r3, #0
	umull	r5, r0, r3, r10
	bic	r5, r0, #3
	add	r0, r5, r0, lsr #2
	sub	r0, r3, r0
	subs	r0, r2, r0
	umull	r2, r3, r0, r10
	mla	r5, r2, r12, r7
	add	r5, r5, #48
	strb	r5, [r9, r1]
	mla	r5, r0, lr, r3
	rsc	r0, r8, r6, lsr #1
	add	r1, r1, #1
	mla	r3, r0, r10, r5
	subs	r0, r7, #10
	sbcs	r0, r6, #0
	mov	r7, r2
	mov	r6, r3
	bhs	.LBB15_2
	sub	r1, r1, #1
	mov	r0, #0
	str	r0, [r4, #384]
.LBB15_5:
	cmp	r0, #384
	bhs	.LBB15_16
	ldrb	r2, [r9, r1]
	sub	r3, r1, #1
	add	r1, r1, #1
	strb	r2, [r4, r0]
	cmp	r1, #1
	mov	r1, r3
	ldr	r2, [r4, #384]
	add	r0, r2, #1
	str	r0, [r4, #384]
	bgt	.LBB15_5
	mov	r1, r4
	cmn	r2, #-2147483646
	str	r0, [r1, #388]!
	bhi	.LBB15_12
.LBB15_8:
	cmp	r0, #384
	bhi	.LBB15_17
	ldrb	r3, [r4, r2]
	cmp	r3, #48
	bne	.LBB15_14
	sub	r3, r2, #1
	str	r2, [r4, #384]
	add	r2, r2, #1
	cmp	r2, #1
	mov	r2, r3
	bhi	.LBB15_8
	b	.LBB15_13
.LBB15_11:
	mov	r0, #0
	add	r1, r4, #388
	str	r0, [r4, #384]
	b	.LBB15_13
.LBB15_12:
	cmp	r0, #0
	bne	.LBB15_14
.LBB15_13:
	mov	r0, #0
	str	r0, [r1]
.LBB15_14:
	add	sp, sp, #72
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
.LBB15_15:
	mov	r0, #64
	mov	r1, #59
	str	r0, [sp]
	mov	r2, #180
	str	r0, [sp, #4]
	mov	r3, #7
	ldr	r0, .LCPI15_2
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB15_16:
	mov	r1, #384
	stm	sp, {r0, r1}
	mov	r1, #59
	ldr	r0, .LCPI15_2
	mov	r2, #187
	mov	r3, #12
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB15_17:
	mov	r0, #384
	str	r2, [sp]
	str	r0, [sp, #4]
	mov	r1, #59
	ldr	r0, .LCPI15_2
	mov	r2, #158
	mov	r3, #30
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI15_0:
	.long	3435973837
.LCPI15_1:
	.long	3435973836
.LCPI15_2:
	.long	".Lcsbs$POC-Example$108"
.Lfunc_end15:
	.size	"strconv_decimal::assign", .Lfunc_end15-"strconv_decimal::assign"
	.cantunwind
	.fnend

	.p2align	2
	.type	"io::write_encoded_rune",%function
	.code	32
"io::write_encoded_rune":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#92
	sub	sp, sp, #92
	ldr	r10, [sp, #128]
	mov	r7, #0
	ldr	r9, [sp, #136]
	mov	r11, r2
	ldr	r8, [sp, #132]
	mov	r5, r1
	mov	r4, r0
	cmp	r10, #0
	str	r7, [sp, #64]
	beq	.LBB16_3
	mov	r0, #39
	cmp	r5, #0
	strb	r0, [sp, #71]
	beq	.LBB16_34
	mov	r0, #0
	add	r7, sp, #71
	str	r0, [sp, #80]
	mov	r6, r3
	str	r0, [sp, #76]
	mov	r1, r11
	str	r0, [sp, #72]
	mov	r2, #4
	str	r0, [sp, #8]
	mov	r3, r7
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #72
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r7, [sp, #72]
	mov	r3, r6
	ldr	r0, [sp, #80]
	str	r7, [sp, #64]
	cmp	r0, #0
	bne	.LBB16_35
.LBB16_3:
	sub	r0, r3, #7
	cmp	r0, #20
	bhi	.LBB16_8
	adr	r1, .LJTI16_0
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI16_0:
	.long	.LBB16_6
	.long	.LBB16_17
	.long	.LBB16_23
	.long	.LBB16_25
	.long	.LBB16_27
	.long	.LBB16_15
	.long	.LBB16_19
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_8
	.long	.LBB16_21
.LBB16_6:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	ldr	r3, .LCPI16_7
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	str	r9, [sp, #20]
	b	.LBB16_29
.LBB16_8:
	cmp	r3, #31
	bgt	.LBB16_37
	cmp	r5, #0
	beq	.LBB16_34
	str	r3, [sp, #36]
	mov	r0, #2
	ldr	r3, .LCPI16_8
	mov	r6, #0
	str	r0, [sp]
	add	r0, sp, #72
	mov	r1, r11
	mov	r2, #4
	str	r6, [sp, #80]
	str	r6, [sp, #76]
	str	r6, [sp, #72]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #72]
	ldr	r0, [sp, #80]
	add	r7, r7, r1
	str	r7, [sp, #64]
	cmp	r0, #0
	bne	.LBB16_35
	mov	r0, #36
	mov	r2, #2
	str	r0, [sp, #24]
	ldr	r0, .LCPI16_9
	str	r0, [sp, #20]
	mov	r0, #64
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp, #12]
	mov	r0, #16
	str	r0, [sp, #8]
	ldr	r0, [sp, #36]
	str	r6, [sp, #52]
	str	r6, [sp, #48]
	asr	r1, r0, #31
	stm	sp, {r0, r1}
	add	r0, sp, #48
	add	r1, sp, #62
	strh	r6, [sp, #62]
	str	r9, [sp, #32]
	str	r6, [sp, #28]
	bl	"strconv::write_bits"
	ldr	r6, [sp, #52]
	ldr	r3, [sp, #48]
	cmp	r6, #2
	beq	.LBB16_41
	cmp	r6, #1
	beq	.LBB16_40
	cmp	r6, #0
	bne	.LBB16_31
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_10
	b	.LBB16_29
.LBB16_15:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_4
	b	.LBB16_29
.LBB16_17:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_6
	b	.LBB16_29
.LBB16_19:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_2
	b	.LBB16_29
.LBB16_21:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_5
	b	.LBB16_29
.LBB16_23:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_1
	b	.LBB16_29
.LBB16_25:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_3
	b	.LBB16_29
.LBB16_27:
	cmp	r5, #0
	beq	.LBB16_34
	mov	r0, #0
	str	r9, [sp, #20]
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	ldr	r3, .LCPI16_0
.LBB16_29:
	mov	r1, r11
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #72]
	ldr	r0, [sp, #80]
	add	r7, r7, r1
.LBB16_30:
	cmp	r0, #0
	str	r7, [sp, #64]
	bne	.LBB16_35
.LBB16_31:
	cmp	r10, #0
	beq	.LBB16_36
	mov	r0, #39
	cmp	r5, #0
	strb	r0, [sp, #71]
	beq	.LBB16_39
	mov	r0, #0
	add	r3, sp, #71
	str	r0, [sp, #80]
	mov	r1, r11
	str	r0, [sp, #76]
	mov	r2, #4
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #72
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #72]
	ldr	r2, [sp, #64]
	ldr	r0, [sp, #80]
	add	r7, r2, r1
	b	.LBB16_35
.LBB16_34:
	mvn	r0, #0
.LBB16_35:
	str	r0, [r4, #4]
	ldr	r0, [r8]
	str	r7, [r4]
	add	r0, r0, r7
	str	r0, [r8]
	add	sp, sp, #92
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB16_36:
	mov	r0, #0
	ldr	r7, [sp, #64]
	b	.LBB16_35
.LBB16_37:
	add	r0, sp, #64
	mov	r1, r5
	stm	sp, {r0, r9}
	add	r0, sp, #40
	mov	r2, r11
	bl	"io::write_rune"
	ldr	r0, [sp, #44]
	cmp	r0, #0
	beq	.LBB16_31
.LBB16_38:
	ldr	r7, [sp, #64]
	b	.LBB16_35
.LBB16_39:
	mvn	r0, #0
	ldr	r7, [sp, #64]
	b	.LBB16_35
.LBB16_40:
	mov	r7, r3
	add	r3, sp, #64
	mov	r0, r5
	mov	r1, r11
	mov	r2, #48
	str	r9, [sp]
	bl	"io::write_byte"
	mov	r3, r7
	cmp	r0, #0
	bne	.LBB16_38
.LBB16_41:
	mov	r0, #0
	mov	r1, r11
	str	r0, [sp, #80]
	mov	r2, #4
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #72
	str	r9, [sp, #20]
	str	r6, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #72]
	ldr	r2, [sp, #64]
	ldr	r0, [sp, #80]
	add	r7, r2, r1
	b	.LBB16_30
	.p2align	2
.LCPI16_0:
	.long	".Lcsbs$POC-Example$110"
.LCPI16_1:
	.long	".Lcsbs$POC-Example$10f"
.LCPI16_2:
	.long	".Lcsbs$POC-Example$10e"
.LCPI16_3:
	.long	".Lcsbs$POC-Example$10d"
.LCPI16_4:
	.long	".Lcsbs$POC-Example$10c"
.LCPI16_5:
	.long	".Lcsbs$POC-Example$10b"
.LCPI16_6:
	.long	".Lcsbs$POC-Example$10a"
.LCPI16_7:
	.long	".Lcsbs$POC-Example$109"
.LCPI16_8:
	.long	".Lcsbs$POC-Example$112"
.LCPI16_9:
	.long	".Lcsbs$POC-Example$0"
.LCPI16_10:
	.long	".Lcsbs$POC-Example$114"
.Lfunc_end16:
	.size	"io::write_encoded_rune", .Lfunc_end16-"io::write_encoded_rune"
	.fnend

	.p2align	2
	.type	"strconv_decimal::shift_right",%function
	.code	32
"strconv_decimal::shift_right":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r5, [r0, #384]
	mov	r3, #0
	mov	r2, #0
	bic	r4, r5, r5, asr #31
.LBB17_1:
	cmp	r4, r3
	beq	.LBB17_4
	cmp	r3, #384
	beq	.LBB17_29
	ldrb	r6, [r0, r3]
	add	r2, r2, r2, lsl #2
	add	r3, r3, #1
	add	r2, r6, r2, lsl #1
	sub	r2, r2, #48
	lsrs	r6, r2, r1
	beq	.LBB17_1
	b	.LBB17_10
.LBB17_4:
	cmp	r2, #0
	beq	.LBB17_7
	lsrs	r3, r2, r1
	beq	.LBB17_8
	mov	r3, r4
	b	.LBB17_10
.LBB17_7:
	mov	r1, #0
	str	r1, [r0, #384]
	b	.LBB17_28
.LBB17_8:
	mov	r3, r4
.LBB17_9:
	add	r2, r2, r2, lsl #2
	add	r3, r3, #1
	lsl	r2, r2, #1
	lsrs	r6, r2, r1
	beq	.LBB17_9
.LBB17_10:
	ldr	r6, [r0, #388]
	mov	r12, #0
	cmp	r3, r5
	sub	r6, r6, r3
	add	r6, r6, #1
	str	r6, [r0, #388]
	mvn	r6, #0
	mvn	lr, r6, lsl r1
	bge	.LBB17_14
	mov	r5, #384
	cmp	r5, r3
	rsb	r4, r3, #384
	add	r5, r0, r3
	movlo	r4, r12
	mov	r8, #48
.LBB17_12:
	cmp	r4, r12
	beq	.LBB17_30
	add	r7, r8, r2, lsr r1
	and	r2, r2, lr
	ldrb	r6, [r5, r12]
	add	r2, r2, r2, lsl #2
	strb	r7, [r0, r12]
	add	r12, r12, #1
	add	r2, r6, r2, lsl #1
	ldr	r7, [r0, #384]
	add	r6, r3, r12
	sub	r2, r2, #48
	cmp	r6, r7
	blt	.LBB17_12
.LBB17_14:
	cmp	r2, #0
	beq	.LBB17_22
	mov	r3, #1
	b	.LBB17_18
.LBB17_16:
	cmp	r4, #0
	strbne	r3, [r0, #393]
.LBB17_17:
	ands	r2, r2, lr
	add	r2, r2, r2, lsl #2
	lsl	r2, r2, #1
	beq	.LBB17_21
.LBB17_18:
	lsr	r4, r2, r1
	cmp	r12, #384
	bge	.LBB17_16
	bhs	.LBB17_32
	add	r4, r4, #48
	strb	r4, [r0, r12]
	add	r12, r12, #1
	b	.LBB17_17
.LBB17_21:
	str	r12, [r0, #384]
	b	.LBB17_23
.LBB17_22:
	cmp	r12, #0
	str	r12, [r0, #384]
	beq	.LBB17_27
.LBB17_23:
	sub	r1, r12, #1
.LBB17_24:
	cmp	r12, #384
	bhi	.LBB17_31
	ldrb	r2, [r0, r1]
	cmp	r2, #48
	bne	.LBB17_28
	sub	r2, r1, #1
	str	r1, [r0, #384]
	add	r1, r1, #1
	cmp	r1, #1
	mov	r1, r2
	bhi	.LBB17_24
.LBB17_27:
	mov	r1, #0
	str	r1, [r0, #388]
.LBB17_28:
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.LBB17_29:
	mov	r0, #384
	mov	r1, #59
	str	r0, [sp]
	mov	r2, #220
	str	r0, [sp, #4]
	mov	r3, #22
	ldr	r0, .LCPI17_0
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB17_30:
	mov	r0, #384
	add	r1, r3, r12
	str	r0, [sp, #4]
	mov	r2, #228
	ldr	r0, .LCPI17_0
	mov	r3, #22
	str	r1, [sp]
	mov	r1, #59
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB17_31:
	mov	r0, #384
	str	r1, [sp]
	str	r0, [sp, #4]
	mov	r1, #59
	ldr	r0, .LCPI17_0
	mov	r2, #158
	mov	r3, #30
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB17_32:
	mov	r0, #384
	mov	r1, #59
	str	r0, [sp, #4]
	mov	r2, #240
	ldr	r0, .LCPI17_0
	mov	r3, #13
	str	r12, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI17_0:
	.long	".Lcsbs$POC-Example$108"
.Lfunc_end17:
	.size	"strconv_decimal::shift_right", .Lfunc_end17-"strconv_decimal::shift_right"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::print_u64",%function
	.code	32
"runtime::print_u64":
	.fnstart
	subs	r2, r0, #10
	sbcs	r2, r1, #0
	movlo	pc, lr
.LBB18_1:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	ldr	r2, .LCPI18_0
	mov	lr, #0
	ldr	r12, .LCPI18_1
.LBB18_2:
	lsr	r3, r0, #1
	orr	r3, r3, r1, lsl #31
	adds	r4, r3, r1, lsr #1
	adc	r4, r4, #0
	umull	r5, r6, r4, r2
	bic	r5, r6, #3
	add	r5, r5, r6, lsr #2
	sub	r4, r4, r5
	subs	r3, r3, r4
	umull	r4, r5, r3, r2
	mla	r6, r3, r12, r5
	rsc	r3, lr, r1, lsr #1
	rsbs	r0, r0, #99
	rscs	r0, r1, #0
	mla	r5, r3, r2, r6
	mov	r0, r4
	mov	r1, r5
	blo	.LBB18_2
	pop	{r4, r5, r6, lr}
	mov	pc, lr
	.p2align	2
.LCPI18_0:
	.long	3435973837
.LCPI18_1:
	.long	3435973836
.Lfunc_end18:
	.size	"runtime::print_u64", .Lfunc_end18-"runtime::print_u64"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::[random_generator_chacha8.odin]::chacha8rand_refill",%function
	.code	32
"runtime::[random_generator_chacha8.odin]::chacha8rand_refill":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#180
	sub	sp, sp, #180
	ldrb	r2, [r0, #1028]
	cmp	r2, #1
	bne	.LBB19_8
	ldr	r2, [r0, #996]
	ldr	r1, .LCPI19_4
	ldr	r5, [r0, #1000]
	ldr	r7, .LCPI19_5
	add	r10, r2, r1
	ldr	r1, [r0, #1012]
	str	r1, [sp, #88]
	add	r7, r5, r7
	add	r12, r1, r10, ror #16
	ldr	r1, [r0, #1016]
	str	r5, [sp, #96]
	eor	lr, r12, r2
	add	r6, r1, r7, ror #16
	str	r1, [sp, #84]
	eor	r5, r6, r5
	ldr	r3, [r0, #1004]
	add	r8, r10, lr, ror #20
	str	r2, [sp, #100]
	add	r9, r7, r5, ror #20
	str	r3, [sp, #92]
	eor	r7, r9, r7, ror #16
	ldr	r11, [r0, #992]
	str	r0, [sp, #12]
	add	r1, r6, r7, ror #24
	str	r1, [sp, #80]
	eor	r6, r1, r5, ror #20
	ldr	r5, .LCPI19_6
	str	r0, [sp, #108]
	add	r1, r8, r6, ror #25
	str	r1, [sp, #76]
	ldr	r1, [r0, #1020]
	add	r5, r3, r5
	str	r1, [sp, #72]
	add	r1, r1, r5, ror #16
	str	r11, [sp, #104]
	eor	r2, r1, r3
	add	r3, r5, r2, ror #20
	str	r3, [sp, #68]
	eor	r5, r3, r5, ror #16
	eor	r3, r8, r10, ror #16
	add	r1, r1, r5, ror #24
	str	r1, [sp, #64]
	eor	r1, r1, r2, ror #20
	add	r2, r9, r1, ror #25
	str	r2, [sp, #60]
	eor	r2, r2, r3, ror #24
	ror	r1, r1, #25
	str	r1, [sp, #32]
	ror	r1, r6, #25
	ror	r2, r2, #16
	str	r1, [sp, #28]
	str	r2, [sp, #56]
	add	r2, r12, r3, ror #24
	eor	r3, r2, lr, ror #20
	str	r2, [sp, #52]
	ldr	r2, .LCPI19_7
	ror	r1, r3, #25
	add	r2, r11, r2
	str	r2, [sp, #48]
	add	r2, r2, r3, ror #25
	str	r2, [sp, #44]
	ror	r2, r5, #24
	str	r1, [sp, #24]
	str	r2, [sp, #40]
	ror	r2, r7, #24
	ldr	r7, [r0, #1008]
	mov	r0, #0
	str	r2, [sp, #36]
	mov	r2, #0
	str	r7, [sp, #20]
.LBB19_2:
	mov	r12, #0
	str	r0, [sp, #16]
.LBB19_3:
	ldr	r1, [sp, #48]
	str	r2, [sp, #116]
	eor	r0, r2, r1
	str	r12, [sp, #112]
	add	r2, r7, r0, ror #16
	eor	r8, r2, r11
	add	r3, r1, r8, ror #20
	ldr	r1, [sp, #68]
	eor	r0, r3, r0, ror #16
	add	r2, r2, r0, ror #24
	eor	r3, r2, r8, ror #20
	add	r7, r1, r3, ror #25
	ldr	r1, [sp, #36]
	eor	r4, r7, r1
	ldr	r1, [sp, #52]
	add	r5, r1, r4, ror #16
	eor	r3, r5, r3, ror #25
	add	r6, r7, r3, ror #20
	eor	r12, r6, r4, ror #16
	add	lr, r5, r12, ror #24
	eor	r3, lr, r3, ror #20
	ror	r1, r3, #25
	ldr	r3, [sp, #64]
	str	r1, [sp, #168]
	ldr	r1, [sp, #76]
	eor	r0, r1, r0, ror #24
	add	r7, r3, r0, ror #16
	ldr	r3, [sp, #28]
	eor	r9, r7, r3
	ldr	r3, [sp, #56]
	add	r1, r1, r9, ror #20
	str	r1, [sp, #176]
	eor	r4, r1, r0, ror #16
	ldr	r1, [sp, #32]
	ror	r0, r4, #24
	add	r7, r7, r4, ror #24
	str	r0, [sp, #160]
	add	r0, r2, r3
	eor	r2, r0, r1
	ldr	r1, [sp, #60]
	add	r1, r1, r2, ror #20
	str	r1, [sp, #172]
	eor	r10, r1, r3
	ldr	r3, [sp, #80]
	add	r5, r0, r10, ror #24
	eor	r2, r5, r2, ror #20
	ror	r1, r2, #25
	eor	r2, r7, r9, ror #20
	ror	r0, r2, #25
	ldr	r2, [sp, #40]
	str	r0, [sp, #152]
	ror	r0, r12, #24
	str	r0, [sp, #156]
	ldr	r0, [sp, #44]
	add	r0, r0, r8, ror #20
	eor	r2, r0, r2
	add	r12, r3, r2, ror #16
	ldr	r3, [sp, #24]
	eor	r11, r12, r3
	ror	r3, r10, #24
	str	r3, [sp, #164]
	add	r0, r0, r11, ror #20
	eor	r2, r0, r2, ror #16
	add	r9, r12, r2, ror #24
	ror	r4, r2, #24
	eor	r2, r9, r11, ror #20
	ldr	r11, [sp, #152]
	ror	r3, r2, #25
	mov	r2, #8
.LBB19_4:
	add	r6, r1, r6
	str	r2, [sp, #152]
	eor	r2, r4, r6
	str	r2, [sp, #136]
	add	r2, r7, r2, ror #16
	str	r2, [sp, #132]
	eor	r1, r2, r1
	ldr	r2, [sp, #168]
	str	r1, [sp, #144]
	mov	r7, r3
	add	r8, r6, r1, ror #20
	add	r1, r0, r2
	ldr	r0, [sp, #160]
	eor	r4, r1, r0
	add	r5, r5, r4, ror #16
	eor	r2, r5, r2
	add	r0, r1, r2, ror #20
	str	r0, [sp, #168]
	eor	r0, r0, r4, ror #16
	str	r0, [sp, #160]
	add	r0, r5, r0, ror #24
	str	r0, [sp, #120]
	eor	r4, r0, r2, ror #20
	ldr	r0, [sp, #172]
	add	r2, r11, r0
	ldr	r0, [sp, #156]
	add	r10, r8, r4, ror #25
	eor	r5, r2, r0
	ldr	r0, [sp, #176]
	add	r6, r9, r5, ror #16
	eor	r9, r6, r11
	add	r11, r2, r9, ror #20
	add	r2, r7, r0
	ldr	r0, [sp, #164]
	eor	r12, r11, r5, ror #16
	eor	r5, r2, r0
	eor	r3, r10, r12, ror #24
	add	r12, r6, r12, ror #24
	ldr	r6, [sp, #160]
	add	r0, lr, r5, ror #16
	eor	r7, r0, r7
	add	lr, r2, r7, ror #20
	eor	r2, lr, r5, ror #16
	add	r5, r0, r2, ror #24
	add	r0, r5, r3, ror #16
	str	r0, [sp, #128]
	eor	r0, r0, r4, ror #25
	str	r0, [sp, #140]
	add	r4, r10, r0, ror #20
	str	r4, [sp, #148]
	eor	r0, r4, r3, ror #16
	str	r0, [sp, #124]
	ror	r1, r0, #24
	ldr	r0, [sp, #136]
	str	r1, [sp, #156]
	eor	r8, r8, r0, ror #16
	ldr	r0, [sp, #132]
	add	r4, r0, r8, ror #24
	ldr	r0, [sp, #144]
	eor	r1, r4, r0, ror #20
	ldr	r0, [sp, #120]
	add	r11, r11, r1, ror #25
	eor	r2, r11, r2, ror #24
	add	r10, r0, r2, ror #16
	eor	r0, r5, r7, ror #20
	eor	r1, r10, r1, ror #25
	ldr	r5, [sp, #124]
	add	r11, r11, r1, ror #20
	str	r11, [sp, #172]
	eor	r11, r11, r2, ror #16
	ror	r2, r11, #24
	str	r2, [sp, #164]
	eor	r2, r12, r9, ror #20
	add	r3, lr, r2, ror #25
	eor	r6, r3, r6, ror #24
	add	r9, r4, r6, ror #16
	eor	r2, r9, r2, ror #25
	add	r3, r3, r2, ror #20
	str	r3, [sp, #176]
	eor	r6, r3, r6, ror #16
	ror	r3, r6, #24
	str	r3, [sp, #160]
	ldr	r3, [sp, #168]
	add	r3, r3, r0, ror #25
	eor	r7, r3, r8, ror #24
	add	r4, r12, r7, ror #16
	eor	r8, r4, r0, ror #25
	add	r0, r3, r8, ror #20
	eor	r3, r0, r7, ror #16
	ldr	r7, [sp, #128]
	add	lr, r7, r5, ror #24
	ldr	r5, [sp, #140]
	ror	r12, r3, #24
	eor	r7, lr, r5, ror #20
	add	r5, r10, r11, ror #24
	eor	r1, r5, r1, ror #20
	ror	r7, r7, #25
	str	r7, [sp, #168]
	add	r7, r9, r6, ror #24
	eor	r2, r7, r2, ror #20
	add	r9, r4, r3, ror #24
	ldr	r6, [sp, #148]
	ror	r1, r1, #25
	ror	r11, r2, #25
	eor	r2, r9, r8, ror #20
	mov	r4, r12
	ror	r3, r2, #25
	ldr	r2, [sp, #152]
	sub	r2, r2, #2
	cmp	r2, #2
	bhi	.LBB19_4
	ldr	r2, [sp, #108]
	ldr	r12, [sp, #112]
	str	r0, [r2, r12, lsl #2]!
	add	r12, r12, #1
	ldr	r0, [sp, #156]
	cmp	r12, #4
	str	r0, [r2, #224]
	ldr	r0, [sp, #164]
	str	r0, [r2, #208]
	ldr	r0, [sp, #160]
	str	r0, [r2, #192]
	ldr	r0, [sp, #72]
	str	r4, [r2, #240]
	add	r0, r7, r0
	str	r0, [r2, #176]
	ldr	r0, [sp, #84]
	ldr	r7, [sp, #20]
	add	r0, r9, r0
	str	r0, [r2, #160]
	ldr	r0, [sp, #88]
	str	r6, [r2, #48]
	add	r0, lr, r0
	str	r0, [r2, #144]
	add	r0, r5, r7
	str	r0, [r2, #128]
	ldr	r0, [sp, #92]
	add	r0, r1, r0
	str	r0, [r2, #112]
	ldr	r0, [sp, #96]
	add	r0, r11, r0
	str	r0, [r2, #96]
	ldr	r0, [sp, #100]
	ldr	r11, [sp, #104]
	add	r0, r3, r0
	str	r0, [r2, #80]
	ldr	r0, [sp, #168]
	add	r0, r0, r11
	str	r0, [r2, #64]
	ldr	r0, [sp, #172]
	str	r0, [r2, #32]
	ldr	r0, [sp, #176]
	str	r0, [r2, #16]
	ldr	r2, [sp, #116]
	add	r2, r2, #1
	bne	.LBB19_3
	ldr	r0, [sp, #108]
	add	r0, r0, #256
	str	r0, [sp, #108]
	ldr	r0, [sp, #16]
	add	r0, r0, #1
	cmp	r0, #4
	bne	.LBB19_2
	ldr	r1, [sp, #12]
	mov	r0, #0
	str	r0, [r1, #1024]
	add	sp, sp, #180
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB19_8:
	ldr	r0, [r1, #16]
	mov	r3, #32
	ldr	r4, .LCPI19_1
	cmp	r0, #0
	ldr	r2, .LCPI19_3
	movne	r4, r0
	ldr	r0, .LCPI19_2
	str	r1, [sp, #4]
	ldr	r1, .LCPI19_0
	str	r1, [sp]
	mov	r1, #17
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI19_0:
	.long	".Lscl$[chacha8rand_refill4437]"
.LCPI19_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI19_2:
	.long	".Lcsbs$POC-Example$1aa"
.LCPI19_3:
	.long	".Lcsbs$POC-Example$115"
.LCPI19_4:
	.long	857760878
.LCPI19_5:
	.long	2036477234
.LCPI19_6:
	.long	1797285236
.LCPI19_7:
	.long	1634760805
.Lfunc_end19:
	.size	"runtime::[random_generator_chacha8.odin]::chacha8rand_refill", .Lfunc_end19-"runtime::[random_generator_chacha8.odin]::chacha8rand_refill"
	.fnend

	.p2align	2
	.type	"runtime::print_i64",%function
	.code	32
"runtime::print_i64":
	.fnstart
	eor	r0, r0, r1, asr #31
	eor	r2, r1, r1, asr #31
	subs	r0, r0, r1, asr #31
	sbc	r1, r2, r1, asr #31
	subs	r2, r0, #10
	sbcs	r2, r1, #0
	movlo	pc, lr
.LBB20_1:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	ldr	r2, .LCPI20_0
	mov	lr, #0
	ldr	r12, .LCPI20_1
.LBB20_2:
	lsr	r3, r0, #1
	orr	r3, r3, r1, lsl #31
	adds	r4, r3, r1, lsr #1
	adc	r4, r4, #0
	umull	r5, r6, r4, r2
	bic	r5, r6, #3
	add	r5, r5, r6, lsr #2
	sub	r4, r4, r5
	subs	r3, r3, r4
	umull	r4, r5, r3, r2
	mla	r6, r3, r12, r5
	rsc	r3, lr, r1, lsr #1
	rsbs	r0, r0, #99
	rscs	r0, r1, #0
	mla	r5, r3, r2, r6
	mov	r0, r4
	mov	r1, r5
	blo	.LBB20_2
	pop	{r4, r5, r6, lr}
	mov	pc, lr
	.p2align	2
.LCPI20_0:
	.long	3435973837
.LCPI20_1:
	.long	3435973836
.Lfunc_end20:
	.size	"runtime::print_i64", .Lfunc_end20-"runtime::print_i64"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::mem_free_with_size",%function
	.code	32
"runtime::mem_free_with_size":
	.fnstart
	cmp	r0, #0
	moveq	pc, lr
.LBB21_1:
	.save	{r4, lr}
	push	{r4, lr}
	.pad	#32
	sub	sp, sp, #32
	mov	r4, r2
	cmp	r2, #0
	beq	.LBB21_3
	ldr	r2, .LCPI21_0
	mov	lr, #0
	stmib	sp, {r0, r1, r2}
	add	r0, sp, #20
	mov	r1, r3
	ldr	r12, [sp, #40]
	mov	r2, #1
	mov	r3, #0
	strb	lr, [sp, #28]
	str	lr, [sp, #24]
	str	lr, [sp, #20]
	str	r12, [sp, #16]
	str	lr, [sp]
	mov	lr, pc
	mov	pc, r4
.LBB21_3:
	add	sp, sp, #32
	pop	{r4, lr}
	mov	pc, lr
	.p2align	2
.LCPI21_0:
	.long	".Lscl$[builder_destroy6211]"
.Lfunc_end21:
	.size	"runtime::mem_free_with_size", .Lfunc_end21-"runtime::mem_free_with_size"
	.fnend

	.p2align	2
	.type	"io::write_escaped_rune",%function
	.code	32
"io::write_escaped_rune":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#60
	sub	sp, sp, #60
	mov	r11, r0
	mov	r0, #0
	cmp	r3, #92
	str	r0, [sp, #32]
	ldrbne	r0, [sp, #96]
	mov	r5, r1
	ldr	r10, [sp, #100]
	cmpne	r3, r0
	bne	.LBB22_4
	mov	r0, #92
	cmp	r5, #0
	strb	r0, [sp, #39]
	beq	.LBB22_38
	mov	r4, r3
	add	r0, sp, #40
	add	r3, sp, #39
	mov	r7, #0
	mov	r8, #1
	mov	r6, r2
	mov	r1, r2
	mov	r2, #4
	str	r7, [sp, #48]
	str	r7, [sp, #44]
	str	r7, [sp, #40]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r10, [sp, #20]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #40]
	ldr	r2, [sp, #32]
	ldr	r0, [sp, #48]
	add	r1, r2, r1
	str	r1, [sp, #32]
	cmp	r0, #0
	bne	.LBB22_39
	add	r0, sp, #40
	add	r3, sp, #39
	mov	r1, r6
	mov	r2, #4
	strb	r4, [sp, #39]
	str	r7, [sp, #48]
	str	r7, [sp, #44]
	str	r7, [sp, #40]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r10, [sp, #20]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #40]
	ldr	r2, [sp, #32]
	ldr	r0, [sp, #48]
	add	r1, r2, r1
	b	.LBB22_39
.LBB22_4:
	cmp	r3, #255
	bgt	.LBB22_9
	sub	r0, r3, #32
	cmp	r0, #95
	blo	.LBB22_8
	cmp	r3, #161
	blt	.LBB22_9
	cmp	r3, #173
	beq	.LBB22_9
.LBB22_8:
	add	r0, sp, #32
	mov	r1, #0
	stmib	sp, {r0, r10}
	add	r0, sp, #24
	str	r1, [sp]
	mov	r1, r5
	bl	"io::write_encoded_rune"
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #28]
	b	.LBB22_39
.LBB22_9:
	sub	r0, r3, #7
	cmp	r0, #20
	bhi	.LBB22_14
	adr	r1, .LJTI22_0
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI22_0:
	.long	.LBB22_12
	.long	.LBB22_23
	.long	.LBB22_29
	.long	.LBB22_31
	.long	.LBB22_33
	.long	.LBB22_21
	.long	.LBB22_25
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_14
	.long	.LBB22_27
.LBB22_12:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	ldr	r3, .LCPI22_7
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	str	r10, [sp, #20]
	b	.LBB22_35
.LBB22_14:
	cmp	r3, #32
	bge	.LBB22_40
	mov	r8, r3
	add	r3, sp, #32
	mov	r0, r5
	mov	r6, r2
	mov	r1, r2
	mov	r2, #92
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	add	r3, sp, #32
	mov	r0, r5
	mov	r1, r6
	mov	r2, #120
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	mov	r0, #15
	ldr	r4, .LCPI22_8
	and	r0, r0, r8, lsr #4
	add	r3, sp, #32
	mov	r1, r6
	str	r10, [sp]
	ldrb	r2, [r4, r0]
	mov	r0, r5
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	and	r0, r8, #15
	str	r10, [sp]
	ldrb	r2, [r4, r0]
.LBB22_19:
	add	r3, sp, #32
	mov	r0, r5
.LBB22_20:
	mov	r1, r6
	bl	"io::write_byte"
	cmp	r0, #0
	moveq	r0, #0
	b	.LBB22_37
.LBB22_21:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	str	r10, [sp, #20]
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	ldr	r3, .LCPI22_4
	b	.LBB22_35
.LBB22_23:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	str	r10, [sp, #20]
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	ldr	r3, .LCPI22_6
	b	.LBB22_35
.LBB22_25:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	str	r10, [sp, #20]
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	ldr	r3, .LCPI22_2
	b	.LBB22_35
.LBB22_27:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	str	r10, [sp, #20]
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	ldr	r3, .LCPI22_5
	b	.LBB22_35
.LBB22_29:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	str	r10, [sp, #20]
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	ldr	r3, .LCPI22_1
	b	.LBB22_35
.LBB22_31:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	str	r10, [sp, #20]
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	ldr	r3, .LCPI22_3
	b	.LBB22_35
.LBB22_33:
	cmp	r5, #0
	beq	.LBB22_38
	mov	r0, #0
	str	r10, [sp, #20]
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #40
	ldr	r3, .LCPI22_0
.LBB22_35:
	mov	r1, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #40]
	ldr	r2, [sp, #32]
	ldr	r0, [sp, #48]
	add	r1, r2, r1
	str	r1, [sp, #32]
	cmp	r0, #0
	bne	.LBB22_39
	mov	r0, #0
.LBB22_37:
	ldr	r1, [sp, #32]
	b	.LBB22_39
.LBB22_38:
	mvn	r0, #0
	mov	r1, #0
.LBB22_39:
	str	r1, [r11]
	str	r0, [r11, #4]
	add	sp, sp, #60
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB22_40:
	lsr	r0, r3, #16
	cmp	r0, #16
	bls	.LBB22_42
	mov	r8, #253
	orr	r8, r8, #65280
	b	.LBB22_43
.LBB22_42:
	mov	r8, r3
	cmp	r0, #0
	bne	.LBB22_49
.LBB22_43:
	add	r3, sp, #32
	mov	r0, r5
	mov	r6, r2
	mov	r1, r2
	mov	r2, #92
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	add	r3, sp, #32
	mov	r0, r5
	mov	r1, r6
	mov	r2, #117
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	ldr	r9, .LCPI22_8
	add	r3, sp, #32
	mov	r0, r5
	mov	r1, r6
	str	r10, [sp]
	ldrb	r2, [r9, r8, lsr #12]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	mov	r4, #15
	and	r0, r4, r8, lsr #8
	add	r3, sp, #32
	mov	r1, r6
	ldrb	r2, [r9, r0]
	mov	r0, r5
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	and	r0, r4, r8, lsr #4
	add	r3, sp, #32
	mov	r1, r6
	str	r10, [sp]
	ldrb	r2, [r9, r0]
	mov	r0, r5
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	and	r0, r8, #15
	str	r10, [sp]
	ldrb	r2, [r9, r0]
	b	.LBB22_19
.LBB22_49:
	add	r3, sp, #32
	mov	r0, r5
	mov	r6, r2
	mov	r1, r2
	mov	r2, #92
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	add	r3, sp, #32
	mov	r0, r5
	mov	r1, r6
	mov	r2, #85
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	add	r3, sp, #32
	mov	r0, r5
	mov	r1, r6
	mov	r2, #48
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	add	r3, sp, #32
	mov	r0, r5
	mov	r1, r6
	mov	r2, #48
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	ldr	r9, .LCPI22_8
	add	r3, sp, #32
	mov	r0, r5
	mov	r1, r6
	str	r10, [sp]
	mov	r7, r5
	ldrb	r2, [r9, r8, lsr #20]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	mov	r4, #15
	and	r0, r4, r8, lsr #16
	add	r3, sp, #32
	mov	r1, r6
	ldrb	r2, [r9, r0]
	mov	r0, r7
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	and	r0, r4, r8, lsr #12
	add	r3, sp, #32
	mov	r1, r6
	str	r10, [sp]
	ldrb	r2, [r9, r0]
	mov	r0, r7
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	mov	r4, #15
	and	r0, r4, r8, lsr #8
	add	r3, sp, #32
	mov	r1, r6
	ldrb	r2, [r9, r0]
	mov	r0, r7
	str	r10, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	and	r0, r4, r8, lsr #4
	add	r3, sp, #32
	mov	r1, r6
	str	r10, [sp]
	ldrb	r2, [r9, r0]
	mov	r0, r7
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB22_37
	and	r0, r8, #15
	str	r10, [sp]
	add	r3, sp, #32
	ldrb	r2, [r9, r0]
	mov	r0, r7
	b	.LBB22_20
	.p2align	2
.LCPI22_0:
	.long	".Lcsbs$POC-Example$110"
.LCPI22_1:
	.long	".Lcsbs$POC-Example$10f"
.LCPI22_2:
	.long	".Lcsbs$POC-Example$10e"
.LCPI22_3:
	.long	".Lcsbs$POC-Example$10d"
.LCPI22_4:
	.long	".Lcsbs$POC-Example$10c"
.LCPI22_5:
	.long	".Lcsbs$POC-Example$10b"
.LCPI22_6:
	.long	".Lcsbs$POC-Example$10a"
.LCPI22_7:
	.long	".Lcsbs$POC-Example$109"
.LCPI22_8:
	.long	".Lcsbs$POC-Example$3"
.Lfunc_end22:
	.size	"io::write_escaped_rune", .Lfunc_end22-"io::write_escaped_rune"
	.fnend

	.p2align	2
	.type	"strings::[builder.odin]::_builder_stream_proc",%function
	.code	32
"strings::[builder.odin]::_builder_stream_proc":
	.fnstart
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.pad	#16
	sub	sp, sp, #16
	sub	r7, r2, #4
	mov	r4, r0
	cmp	r7, #5
	bhi	.LBB23_7
	adr	r5, .LJTI23_0
	mov	r2, #0
	mov	r0, #912
	ldr	r12, [sp, #60]
	mov	r6, #0
	ldr	pc, [r5, r7, lsl #2]
	.p2align	2
.LJTI23_0:
	.long	.LBB23_3
	.long	.LBB23_7
	.long	.LBB23_7
	.long	.LBB23_4
	.long	.LBB23_6
	.long	.LBB23_8
.LBB23_3:
	ldr	r7, [sp, #40]
	add	r0, sp, #8
	mov	r2, r3
	ldr	r5, [r1, #4]
	str	r12, [sp]
	mov	r6, r1
	mov	r3, r7
	bl	"runtime::_append_elems"
	ldr	r0, [r6, #4]
	mov	r2, #0
	sub	r0, r0, r5
	cmp	r0, r7
	movlt	r2, #1
	b	.LBB23_5
.LBB23_4:
	ldr	r0, [r1, #4]
.LBB23_5:
	asr	r6, r0, #31
	b	.LBB23_8
.LBB23_6:
	ldr	r6, [r1, #8]
	mov	r5, r1
	ldr	r0, [r1]
	ldr	r2, [r1, #12]
	ldr	r3, [r1, #16]
	mov	r1, r6
	str	r12, [sp]
	bl	"runtime::mem_free_with_size"
	mov	r0, #0
	mov	r6, #0
	str	r0, [r5, #16]
	mov	r2, #0
	str	r0, [r5, #12]
	str	r0, [r5, #8]
	str	r0, [r5, #4]
	str	r0, [r5]
	b	.LBB23_8
.LBB23_7:
	mov	r0, #0
	mvn	r2, #0
	mov	r6, #0
.LBB23_8:
	stm	r4, {r0, r6}
	str	r2, [r4, #8]
	add	sp, sp, #16
	pop	{r4, r5, r6, r7, r11, lr}
	mov	pc, lr
.Lfunc_end23:
	.size	"strings::[builder.odin]::_builder_stream_proc", .Lfunc_end23-"strings::[builder.odin]::_builder_stream_proc"
	.fnend

	.p2align	2
	.type	"runtime::print_caller_location",%function
	.code	32
"runtime::print_caller_location":
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #8]
	asr	r1, r0, #31
	bl	"runtime::print_u64"
	ldr	r0, [r4, #12]
	cmp	r0, #0
	popeq	{r4, lr}
	moveq	pc, lr
.LBB24_1:
	asr	r1, r0, #31
	pop	{r4, lr}
	b	"runtime::print_u64"
.Lfunc_end24:
	.size	"runtime::print_caller_location", .Lfunc_end24-"runtime::print_caller_location"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::_mem_resize",%function
	.code	32
"runtime::_mem_resize":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#92
	sub	sp, sp, #92
	ldr	r7, [sp, #128]
	mov	r4, r0
	mov	r0, #0
	cmp	r7, #0
	beq	.LBB25_8
	ldr	r9, [sp, #132]
	cmp	r3, #0
	ldr	r10, [sp, #140]
	ldr	r5, [sp, #136]
	beq	.LBB25_6
	cmp	r1, #0
	beq	.LBB25_11
	cmp	r2, r3
	bne	.LBB25_12
	cmn	r3, #1
	ble	.LBB25_19
	mov	r6, r1
	b	.LBB25_10
.LBB25_6:
	cmp	r1, #0
	beq	.LBB25_8
	add	r0, sp, #80
	mov	r6, #0
	stmib	sp, {r1, r2, r5, r10}
	mov	r1, r9
	mov	r2, #1
	mov	r3, #0
	strb	r6, [sp, #88]
	str	r6, [sp, #84]
	str	r6, [sp, #80]
	str	r6, [sp]
	mov	lr, pc
	mov	pc, r7
	ldrb	r0, [sp, #88]
	b	.LBB25_9
.LBB25_8:
	mov	r6, #0
.LBB25_9:
	mov	r3, #0
.LBB25_10:
	strb	r0, [r4, #8]
	str	r6, [r4]
	str	r3, [r4, #4]
	add	sp, sp, #92
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB25_11:
	mov	r1, #1
	strb	r0, [sp, #76]
	str	r1, [sp]
	add	r1, sp, #8
	stm	r1, {r0, r5, r10}
	mov	r1, r9
	mov	r2, #0
	str	r0, [sp, #72]
	str	r0, [sp, #68]
	str	r0, [sp, #4]
	add	r0, sp, #68
	mov	lr, pc
	mov	pc, r7
	ldrb	r0, [sp, #76]
	ldr	r6, [sp, #68]
	ldr	r3, [sp, #72]
	b	.LBB25_10
.LBB25_12:
	add	r0, sp, #56
	mov	r11, #0
	mov	r8, #1
	str	r1, [sp, #28]
	stmib	sp, {r1, r2, r5, r10}
	mov	r1, r9
	mov	r6, r3
	str	r2, [sp, #24]
	mov	r2, #3
	strb	r11, [sp, #64]
	str	r11, [sp, #60]
	str	r11, [sp, #56]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r7
	ldrb	r0, [sp, #64]
	cmp	r0, #4
	bne	.LBB25_18
	add	r0, sp, #44
	mov	r1, r9
	mov	r2, #0
	mov	r3, r6
	strb	r11, [sp, #52]
	str	r11, [sp, #48]
	str	r11, [sp, #44]
	stm	sp, {r8, r11}
	str	r11, [sp, #8]
	str	r5, [sp, #12]
	str	r10, [sp, #16]
	mov	lr, pc
	mov	pc, r7
	ldrb	r0, [sp, #52]
	ldr	r6, [sp, #44]
	ldr	r3, [sp, #48]
	cmp	r0, #0
	bne	.LBB25_10
	ldr	r0, [sp, #24]
	cmn	r0, #1
	ble	.LBB25_20
	ldr	r1, [sp, #28]
	cmp	r3, r0
	mov	r2, r0
	str	r3, [sp, #20]
	movlt	r2, r3
	cmp	r2, #1
	blt	.LBB25_17
	ldr	r1, [sp, #28]
	mov	r0, r6
	bl	memmove
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #24]
.LBB25_17:
	str	r1, [sp, #4]
	add	r1, sp, #8
	mov	r2, #0
	stm	r1, {r0, r5, r10}
	add	r0, sp, #32
	strb	r2, [sp, #40]
	mov	r1, r9
	str	r2, [sp, #36]
	mov	r3, #0
	str	r2, [sp, #32]
	str	r2, [sp]
	mov	r2, #1
	mov	lr, pc
	mov	pc, r7
	ldrb	r0, [sp, #40]
	ldr	r3, [sp, #20]
	b	.LBB25_10
.LBB25_18:
	ldr	r6, [sp, #56]
	ldr	r3, [sp, #60]
	b	.LBB25_10
.LBB25_19:
	ldr	r0, .LCPI25_0
	mov	r1, #52
	str	r3, [sp]
	mov	r2, #202
	mov	r3, #24
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB25_20:
	str	r0, [sp]
	mov	r1, #52
	ldr	r0, .LCPI25_0
	mov	r2, #220
	mov	r3, #28
	bl	"runtime::multi_pointer_slice_handle_error"
	.p2align	2
.LCPI25_0:
	.long	".Lcsbs$POC-Example$11b"
.Lfunc_end25:
	.size	"runtime::_mem_resize", .Lfunc_end25-"runtime::_mem_resize"
	.fnend

	.p2align	2
	.type	"runtime::print_typeid",%function
	.code	32
"runtime::print_typeid":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	r5, r0
	orrs	r0, r0, r1
	beq	.LBB26_7
	mov	r8, #73
	mov	r0, r5
	orr	r8, r8, #256
	mov	r3, #0
	mov	r9, r1
	mov	r7, #0
	mov	r2, r8
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI26_0
	mov	r6, #0
	ldr	r12, .LCPI26_1
	b	.LBB26_3
.LBB26_2:
	adds	r0, r2, #1
	mov	r2, #0
	adc	r3, r3, #0
	subs	r1, r0, r8
	sbcs	r1, r3, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r7, #1
	adc	r1, r6, #0
	subs	r4, r7, #328
	sbcs	r4, r6, #0
	mov	r7, r0
	mov	r6, r1
	bhs	.LBB26_6
.LBB26_3:
	ldr	r0, [lr, r2, lsl #2]
	cmp	r0, #0
	beq	.LBB26_2
	ldr	r1, [r0, #16]
	ldr	r4, [r0, #20]
	eor	r1, r1, r5
	eor	r4, r4, r9
	orrs	r1, r1, r4
	bne	.LBB26_2
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	b	"runtime::print_type"
.LBB26_6:
	mov	r0, r12
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	b	"runtime::print_type"
.LBB26_7:
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI26_0:
	.long	.L__$type_info_data
.LCPI26_1:
	.long	".L__$ti-0"
.Lfunc_end26:
	.size	"runtime::print_typeid", .Lfunc_end26-"runtime::print_typeid"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::print_type",%function
	.code	32
"runtime::print_type":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r4, r0
	mov	r8, #255
.LBB27_1:
	cmp	r4, #0
	beq	.LBB27_45
	ldr	r0, [r4, #64]
	ldr	r1, [r4, #68]
	subs	r0, r0, #2
	sbc	r1, r1, #0
	rsbs	r2, r0, #25
	rscs	r1, r1, #0
	blo	.LBB27_45
	adr	r1, .LJTI27_0
	add	r3, r4, #16
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI27_0:
	.long	.LBB27_33
	.long	.LBB27_45
	.long	.LBB27_40
	.long	.LBB27_40
	.long	.LBB27_40
	.long	.LBB27_45
	.long	.LBB27_39
	.long	.LBB27_45
	.long	.LBB27_45
	.long	.LBB27_17
	.long	.LBB27_5
	.long	.LBB27_9
	.long	.LBB27_6
	.long	.LBB27_26
	.long	.LBB27_5
	.long	.LBB27_5
	.long	.LBB27_35
	.long	.LBB27_14
	.long	.LBB27_31
	.long	.LBB27_5
	.long	.LBB27_8
	.long	.LBB27_19
	.long	.LBB27_6
	.long	.LBB27_25
	.long	.LBB27_5
	.long	.LBB27_41
.LBB27_5:
	ldr	r4, [r4, #24]
	b	.LBB27_1
.LBB27_6:
	ldr	r5, [r4, #24]
	ldr	r0, [r4, #32]
.LBB27_7:
	asr	r1, r0, #31
	bl	"runtime::print_u64"
	b	.LBB27_27
.LBB27_8:
	ldr	r0, [r4, #24]
	ldr	r4, [r4, #28]
	bl	"runtime::print_type"
	b	.LBB27_1
.LBB27_9:
	ldr	r0, [r4, #24]
	ldr	r4, [r4, #28]
	cmp	r0, #0
	beq	.LBB27_18
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r1, r1, #18
	orrs	r1, r1, r2
	bne	.LBB27_52
	ldr	r5, [r0, #28]
	cmp	r5, #1
	blt	.LBB27_18
	ldr	r6, [r0, #24]
.LBB27_13:
	ldr	r0, [r6], #4
	bl	"runtime::print_type"
	subs	r5, r5, #1
	bne	.LBB27_13
	b	.LBB27_18
.LBB27_14:
	ldr	r0, [r3, #32]
	ldr	r5, [r4, #56]
	and	r1, r8, r0, lsr #8
	sub	r2, r1, #2
	cmp	r2, #2
	blo	.LBB27_27
	cmp	r1, #1
	bne	.LBB27_46
	ldr	r0, [r3, #36]
	b	.LBB27_7
.LBB27_17:
	ldr	r4, [r4, #24]
.LBB27_18:
	cmp	r4, #0
	bne	.LBB27_1
	b	.LBB27_45
.LBB27_19:
	ldr	r0, [r4, #24]
	ldr	r7, [r4, #28]
	ldr	r12, [r3, #24]
	ldr	r5, [r0, #64]
	ldr	r6, [r0, #68]
	eor	r1, r5, #1
	ldr	r9, [r3, #32]
	orrs	r1, r1, r6
	ldr	r10, [r3, #36]
	ldr	r1, [r3, #28]
	ldrb	r4, [r4, #32]
	bne	.LBB27_22
	mov	r3, r0
.LBB27_21:
	ldr	r3, [r3, #32]
	ldr	r5, [r3, #64]
	ldr	r6, [r3, #68]
	eor	r2, r5, #1
	orrs	r2, r2, r6
	beq	.LBB27_21
.LBB27_22:
	eor	r2, r5, #3
	orrs	r2, r2, r6
	beq	.LBB27_29
	eor	r2, r5, #21
	orrs	r2, r2, r6
	bne	.LBB27_28
	bl	"runtime::print_type"
	b	.LBB27_29
.LBB27_25:
	ldr	r0, [r4, #36]
	ldr	r5, [r3, #24]
	ldr	r6, [r4, #24]
	asr	r1, r0, #31
	bl	"runtime::print_u64"
	asr	r1, r5, #31
	mov	r0, r5
	bl	"runtime::print_u64"
	mov	r4, r6
	b	.LBB27_1
.LBB27_26:
	ldr	r0, [r4, #28]
	ldr	r5, [r4, #24]
	bl	"runtime::print_type"
.LBB27_27:
	mov	r4, r5
	b	.LBB27_1
.LBB27_28:
	mov	r0, r12
	bl	"runtime::print_i64"
	mov	r0, r9
	mov	r1, r10
	bl	"runtime::print_i64"
.LBB27_29:
	cmp	r4, #0
	beq	.LBB27_45
	mov	r4, r7
	b	.LBB27_1
.LBB27_31:
	ldrb	r0, [r3, #28]
	ldr	r5, [r4, #24]
	cmp	r0, #0
	ldr	r6, [r4, #28]
	ldrne	r0, [r4, #4]
	asrne	r1, r0, #31
	blne	"runtime::print_u64"
	cmp	r6, #1
	blt	.LBB27_45
.LBB27_32:
	ldr	r0, [r5], #4
	bl	"runtime::print_type"
	subs	r6, r6, #1
	bne	.LBB27_32
	b	.LBB27_45
.LBB27_33:
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	ldr	r2, .LCPI27_3
	ldr	r3, .LCPI27_4
	eor	r2, r0, r2
	eor	r3, r1, r3
	orrs	r2, r3, r2
	beq	.LBB27_45
	ldr	r2, .LCPI27_5
	ldr	r3, .LCPI27_6
	eor	r2, r1, r2
	eor	r3, r0, r3
	orrs	r2, r2, r3
	ldrne	r2, .LCPI27_7
	eorne	r1, r1, r2
	ldrne	r2, .LCPI27_8
	eorne	r0, r0, r2
	orrsne	r0, r1, r0
	bne	.LBB27_40
	b	.LBB27_45
.LBB27_35:
	ldr	r5, [r4, #36]
	cmp	r5, #1
	blt	.LBB27_45
	ldr	r6, [r4, #24]
	mov	r7, #0
	ldr	r4, [r4, #28]
.LBB27_37:
	cmp	r4, r7
	beq	.LBB27_51
	ldr	r0, [r6, r7, lsl #2]
	bl	"runtime::print_type"
	add	r7, r7, #1
	cmp	r5, r7
	bne	.LBB27_37
	b	.LBB27_45
.LBB27_39:
	ldr	r2, .LCPI27_1
	ldm	r3, {r0, r1}
	eor	r1, r1, r2
	ldr	r2, .LCPI27_2
	eor	r0, r0, r2
	orrs	r0, r0, r1
	beq	.LBB27_45
.LBB27_40:
	ldr	r0, [r4]
	lsl	r0, r0, #3
	asr	r1, r0, #31
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	"runtime::print_u64"
.LBB27_41:
	ldr	r0, [r4, #24]
	ldr	r5, [r4, #32]
	ldr	r6, [r4, #36]
	ldr	r4, [r4, #48]
	bl	"runtime::print_type"
	cmp	r4, #0
	bpl	.LBB27_44
	str	r4, [sp]
	mov	r2, #235
	ldr	r0, .LCPI27_0
	b	.LBB27_54
.LBB27_43:
	ldr	r0, [r5], #4
	bl	"runtime::print_type"
	ldr	r0, [r6], #4
	mov	r1, #0
	bl	"runtime::print_u64"
	subs	r4, r4, #1
.LBB27_44:
	bne	.LBB27_43
.LBB27_45:
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
.LBB27_46:
	ldr	r5, [r3, #28]
	tst	r0, #8
	ldr	r6, [r4, #24]
	beq	.LBB27_48
	ldr	r0, [r4, #4]
	asr	r1, r0, #31
	bl	"runtime::print_u64"
.LBB27_48:
	cmp	r5, #0
	bmi	.LBB27_53
	cmp	r5, #1
	blt	.LBB27_45
.LBB27_50:
	ldr	r0, [r6], #4
	bl	"runtime::print_type"
	subs	r5, r5, #1
	bne	.LBB27_50
	b	.LBB27_45
.LBB27_51:
	mov	r2, #106
	ldr	r0, .LCPI27_0
	orr	r2, r2, #256
	mov	r1, #49
	mov	r3, #20
	str	r4, [sp]
	str	r4, [sp, #4]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB27_52:
	add	r1, r0, #24
	mov	r0, #344
	bl	"runtime::type_assertion_check2_contextless.handle_error-0"
.LBB27_53:
	ldr	r0, .LCPI27_0
	mov	r2, #175
	str	r5, [sp]
.LBB27_54:
	orr	r2, r2, #256
	mov	r1, #49
	mov	r3, #28
	bl	"runtime::multi_pointer_slice_handle_error"
	.p2align	2
.LCPI27_0:
	.long	".Lcsbs$POC-Example$113"
.LCPI27_1:
	.long	747444013
.LCPI27_2:
	.long	1593006517
.LCPI27_3:
	.long	2524010688
.LCPI27_4:
	.long	675385718
.LCPI27_5:
	.long	2428448026
.LCPI27_6:
	.long	2660435127
.LCPI27_7:
	.long	426601705
.LCPI27_8:
	.long	2698242406
.Lfunc_end27:
	.size	"runtime::print_type", .Lfunc_end27-"runtime::print_type"
	.cantunwind
	.fnend

	.p2align	2
	.type	"io::write_byte",%function
	.code	32
"io::write_byte":
	.fnstart
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	.pad	#48
	sub	sp, sp, #48
	cmp	r0, #0
	strb	r2, [sp, #31]
	beq	.LBB28_2
	mov	r5, r0
	ldr	r0, [sp, #64]
	str	r0, [sp, #20]
	mov	r0, #1
	mov	r2, #0
	mov	r4, r3
	str	r0, [sp]
	add	r0, sp, #32
	add	r3, sp, #31
	str	r2, [sp, #40]
	str	r2, [sp, #36]
	str	r2, [sp, #32]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	cmp	r4, #0
	ldr	r0, [sp, #40]
	ldrne	r1, [r4]
	ldrne	r2, [sp, #32]
	addne	r1, r1, r2
	strne	r1, [r4]
	b	.LBB28_3
.LBB28_2:
	mvn	r0, #0
.LBB28_3:
	add	sp, sp, #48
	pop	{r4, r5, r11, lr}
	mov	pc, lr
.Lfunc_end28:
	.size	"io::write_byte", .Lfunc_end28-"io::write_byte"
	.fnend

	.p2align	2
	.type	"runtime::[error_checks.odin]::type_assertion_variant_type",%function
	.code	32
"runtime::[error_checks.odin]::type_assertion_variant_type":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#12
	sub	sp, sp, #12
	mov	r9, r0
	orrs	r0, r0, r1
	beq	.LBB29_25
	mov	r8, r2
	mov	r10, r1
	cmp	r2, #0
	beq	.LBB29_26
	mov	r11, #73
	mov	r0, r9
	orr	r11, r11, #256
	mov	r1, r10
	mov	r3, #0
	mov	r6, #0
	mov	r2, r11
	bl	__aeabi_uldivmod
	ldr	r1, .LCPI29_0
	mov	r4, #0
	ldr	r12, .LCPI29_1
	b	.LBB29_4
.LBB29_3:
	adds	r0, r2, #1
	adc	r3, r3, #0
	subs	r2, r0, r11
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r6, #1
	adc	r7, r4, #0
	subs	r6, r6, #328
	sbcs	r6, r4, #0
	mov	r6, r0
	mov	r4, r7
	bhs	.LBB29_6
.LBB29_4:
	ldr	r0, [r1, r2, lsl #2]
	cmp	r0, #0
	beq	.LBB29_3
	ldr	r5, [r0, #16]
	ldr	r7, [r0, #20]
	eor	r5, r5, r9
	eor	r7, r7, r10
	orrs	r7, r5, r7
	bne	.LBB29_3
	b	.LBB29_8
.LBB29_6:
	mov	r0, r12
	b	.LBB29_8
.LBB29_7:
	ldr	r0, [r0, #32]
.LBB29_8:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r3, r1, #1
	orrs	r3, r3, r2
	beq	.LBB29_7
	eor	r3, r1, #20
	orrs	r3, r3, r2
	beq	.LBB29_11
	eor	r0, r1, #9
	orrs	r0, r0, r2
	ldreq	r9, [r8, #8]
	ldreq	r10, [r8, #12]
	b	.LBB29_26
.LBB29_11:
	ldr	r3, [r0, #36]
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #28]
	cmp	r3, #0
	beq	.LBB29_16
	ldr	r3, [r3]
	sub	r6, r3, #1
	mov	r3, #0
	cmp	r6, #15
	bhi	.LBB29_22
	ldrb	r7, [r0, #45]
	ldr	r0, [r0, #32]
	adr	r5, .LJTI29_0
	add	r0, r0, r8
	ldr	pc, [r5, r6, lsl #2]
	.p2align	2
.LJTI29_0:
	.long	.LBB29_19
	.long	.LBB29_20
	.long	.LBB29_22
	.long	.LBB29_15
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_15
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_22
	.long	.LBB29_15
.LBB29_15:
	ldr	r3, [r0]
	cmp	r7, #0
	subeq	r3, r3, #1
	cmp	r3, #0
	bpl	.LBB29_22
	b	.LBB29_25
.LBB29_16:
	ldr	r0, [r8]
	cmp	r0, #0
	beq	.LBB29_25
	cmp	r1, #0
	beq	.LBB29_27
	ldr	r0, [r2]
	b	.LBB29_24
.LBB29_19:
	ldrb	r3, [r0]
	cmp	r7, #0
	bne	.LBB29_22
	b	.LBB29_21
.LBB29_20:
	ldrh	r3, [r0]
	cmp	r7, #0
	bne	.LBB29_22
.LBB29_21:
	sub	r3, r3, #1
	cmp	r3, #0
	bmi	.LBB29_25
.LBB29_22:
	cmp	r3, r1
	bge	.LBB29_26
	ldr	r0, [r2, r3, lsl #2]
.LBB29_24:
	ldr	r9, [r0, #16]
	ldr	r10, [r0, #20]
	b	.LBB29_26
.LBB29_25:
	mov	r9, #0
	mov	r10, #0
.LBB29_26:
	mov	r0, r9
	mov	r1, r10
	add	sp, sp, #12
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB29_27:
	mov	r0, #0
	mov	r2, #2
	str	r0, [sp]
	orr	r2, r2, #256
	str	r0, [sp, #4]
	mov	r1, #56
	ldr	r0, .LCPI29_2
	mov	r3, #23
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI29_0:
	.long	.L__$type_info_data
.LCPI29_1:
	.long	".L__$ti-0"
.LCPI29_2:
	.long	".Lcsbs$POC-Example$151"
.Lfunc_end29:
	.size	"runtime::[error_checks.odin]::type_assertion_variant_type", .Lfunc_end29-"runtime::[error_checks.odin]::type_assertion_variant_type"
	.cantunwind
	.fnend

	.p2align	2
	.type	"strconv_decimal::shift_left",%function
	.code	32
"strconv_decimal::shift_left":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, .LCPI30_0
	add	r3, r1, r1, lsl #1
	ldr	lr, [r0, #384]
	ldr	r12, [r2, r3, lsl #2]!
	ldr	r3, [r2, #8]
	cmp	r3, #1
	blt	.LBB30_6
	ldr	r4, [r2, #4]
	bic	r2, lr, lr, asr #31
	mov	r5, r0
.LBB30_2:
	cmp	r2, #0
	beq	.LBB30_5
	ldrb	r6, [r4]
	ldrb	r7, [r5]
	cmp	r7, r6
	bne	.LBB30_24
	add	r4, r4, #1
	add	r5, r5, #1
	sub	r2, r2, #1
	subs	r3, r3, #1
	bne	.LBB30_2
	b	.LBB30_6
.LBB30_5:
	sub	r12, r12, #1
.LBB30_6:
	subs	r7, lr, #1
	bmi	.LBB30_13
.LBB30_7:
	ldr	lr, .LCPI30_1
	add	r3, r0, r12
	mov	r2, #0
	mov	r8, #1
	b	.LBB30_10
.LBB30_8:
	add	r4, r7, #48
	strb	r4, [r3, r6]
.LBB30_9:
	sub	r7, r6, #1
	cmp	r6, #0
	ble	.LBB30_12
.LBB30_10:
	ldrb	r5, [r0, r7]
	mov	r6, r7
	add	r4, r12, r6
	cmp	r4, #384
	sub	r5, r5, #48
	add	r5, r2, r5, lsl r1
	umull	r2, r7, r5, lr
	lsr	r2, r7, #3
	add	r7, r2, r2, lsl #2
	rsb	r7, r7, #0
	add	r7, r5, r7, lsl #1
	blt	.LBB30_8
	cmp	r7, #0
	strbne	r8, [r0, #393]
	b	.LBB30_9
.LBB30_12:
	cmp	r5, #10
	bhs	.LBB30_19
.LBB30_13:
	ldr	r1, [r0, #384]
	ldr	r2, [r0, #388]
	add	r3, r1, r12
	add	r2, r2, r12
	str	r2, [r0, #388]
	bic	r1, r3, r3, asr #31
	cmp	r1, #384
	movge	r1, #384
	cmp	r3, #1
	str	r1, [r0, #384]
	blt	.LBB30_17
	sub	r1, r1, #1
.LBB30_15:
	ldrb	r2, [r0, r1]
	cmp	r2, #48
	bne	.LBB30_18
	sub	r2, r1, #1
	str	r1, [r0, #384]
	add	r1, r1, #1
	cmp	r1, #1
	mov	r1, r2
	bhi	.LBB30_15
.LBB30_17:
	mov	r1, #0
	str	r1, [r0, #388]
.LBB30_18:
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.LBB30_19:
	sub	r1, r12, #1
	mov	r3, #1
	b	.LBB30_22
.LBB30_20:
	add	r5, r5, #48
	strb	r5, [r0, r1]
.LBB30_21:
	sub	r1, r1, #1
	cmp	r4, #9
	bls	.LBB30_13
.LBB30_22:
	mov	r4, r2
	cmp	r1, #384
	umull	r2, r5, r4, lr
	lsr	r2, r5, #3
	add	r5, r2, r2, lsl #2
	rsb	r5, r5, #0
	add	r5, r4, r5, lsl #1
	blt	.LBB30_20
	cmp	r5, #0
	strbne	r3, [r0, #393]
	b	.LBB30_21
.LBB30_24:
	sublo	r12, r12, #1
	subs	r7, lr, #1
	bpl	.LBB30_7
	b	.LBB30_13
	.p2align	2
.LCPI30_0:
	.long	"strconv_decimal::[decimal.odin]::_shift_left_offsets"
.LCPI30_1:
	.long	3435973837
.Lfunc_end30:
	.size	"strconv_decimal::shift_left", .Lfunc_end30-"strconv_decimal::shift_left"
	.cantunwind
	.fnend

	.p2align	2
	.type	"io::write_string16",%function
	.code	32
"io::write_string16":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, sp, #20
	ldr	r4, [sp, #56]
	cmp	r4, #1
	blt	.LBB31_13
	ldr	r8, [sp, #60]
	add	r9, sp, #12
	mov	r5, r3
	mov	r10, r2
	mov	r7, r1
	mov	r6, #0
	mov	r11, #0
	str	r0, [sp, #8]
.LBB31_2:
	cmp	r11, r4
	bhs	.LBB31_15
	add	r0, r5, r11, lsl #1
	ldrh	r0, [r0]
	sub	r1, r0, #57344
	cmn	r1, #2048
	bhs	.LBB31_5
	mov	r3, r0
	b	.LBB31_9
.LBB31_5:
	mov	r3, #253
	lsr	r1, r0, #10
	orr	r3, r3, #65280
	cmp	r1, #54
	bhi	.LBB31_9
	add	r1, r11, #1
	cmp	r1, r4
	bge	.LBB31_9
	bhs	.LBB31_16
	add	r2, r5, r1, lsl #1
	ldrh	r12, [r2]
	and	r2, r12, #64512
	cmp	r2, #56320
	ldreq	r2, .LCPI31_1
	addeq	r0, r12, r0, lsl #10
	moveq	r11, r1
	addeq	r3, r0, r2
.LBB31_9:
	ldr	r0, [sp, #64]
	mov	r1, r7
	str	r0, [sp, #4]
	mov	r0, r9
	mov	r2, r10
	str	r8, [sp]
	bl	"io::write_rune"
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #16]
	add	r6, r1, r6
	cmp	r2, #0
	bne	.LBB31_12
	add	r11, r11, #1
	cmp	r11, r4
	blt	.LBB31_2
	mov	r2, #0
.LBB31_12:
	ldr	r0, [sp, #8]
	b	.LBB31_14
.LBB31_13:
	mov	r6, #0
	mov	r2, #0
.LBB31_14:
	str	r6, [r0]
	str	r2, [r0, #4]
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB31_15:
	ldr	r0, .LCPI31_0
	mov	r1, #41
	mov	r2, #336
	mov	r3, #19
	str	r11, [sp]
	str	r4, [sp, #4]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB31_16:
	ldr	r0, .LCPI31_0
	mov	r2, #340
	stm	sp, {r1, r4}
	mov	r1, #41
	mov	r3, #28
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI31_0:
	.long	".Lcsbs$POC-Example$154"
.LCPI31_1:
	.long	4238353408
.Lfunc_end31:
	.size	"io::write_string16", .Lfunc_end31-"io::write_string16"
	.fnend

	.p2align	2
	.type	"io::write_rune",%function
	.code	32
"io::write_rune":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	.pad	#48
	sub	sp, sp, #48
	ldr	r12, [sp, #76]
	mov	r5, r1
	ldr	r8, [sp, #72]
	mov	r4, r0
	cmp	r3, #127
	bgt	.LBB32_4
	cmp	r5, #0
	strb	r3, [sp, #31]
	beq	.LBB32_13
	mov	r0, #0
	add	r3, sp, #31
	str	r0, [sp, #40]
	mov	r1, r2
	str	r0, [sp, #36]
	mov	r2, #4
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #32
	str	r12, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [sp, #40]
	str	r0, [r4, #4]
	rsbs	r1, r0, #0
	adc	r1, r0, r1
	cmp	r0, #0
	str	r1, [r4]
	bne	.LBB32_14
	ldr	r0, [r8]
	add	r0, r0, #1
	b	.LBB32_12
.LBB32_4:
	lsrs	r0, r3, #11
	bne	.LBB32_6
	mvn	r0, #63
	orr	r6, r0, r3, lsr #6
	mov	r1, #2
	mov	r7, #0
	mov	r0, #0
	b	.LBB32_9
.LBB32_6:
	mov	r0, #260096
	mov	r1, #253
	orr	r0, r0, #1835008
	orr	r1, r1, #65280
	and	r0, r3, r0
	cmp	r0, #55296
	lsr	r0, r3, #16
	moveq	r3, r1
	cmp	r0, #16
	movhi	r3, r1
	cmp	r0, #0
	bne	.LBB32_8
	mvn	r0, #31
	orr	r6, r0, r3, lsr #12
	and	r0, r3, #63
	mvn	r1, #127
	orr	r7, r0, r1
	lsr	r3, r3, #6
	mov	r1, #3
	mov	r0, #0
	b	.LBB32_9
.LBB32_8:
	mov	r7, #63
	mvn	r0, #15
	orr	r6, r0, r3, lsr #18
	and	r0, r3, #63
	and	r7, r7, r3, lsr #6
	mvn	r1, #127
	orr	r0, r0, r1
	orr	r7, r7, r1
	lsr	r3, r3, #12
	mov	r1, #4
.LBB32_9:
	strb	r0, [sp, #30]
	and	r0, r3, #63
	cmp	r5, #0
	orr	r0, r0, #128
	strb	r7, [sp, #29]
	strb	r6, [sp, #27]
	strb	r0, [sp, #28]
	beq	.LBB32_13
	mov	r0, #0
	add	r3, sp, #27
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #32
	str	r1, [sp]
	mov	r1, r2
	mov	r2, #4
	str	r12, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #40]
	ldr	r0, [sp, #32]
	cmp	r1, #0
	stm	r4, {r0, r1}
	bne	.LBB32_14
	ldr	r1, [r8]
	add	r0, r1, r0
.LBB32_12:
	str	r0, [r8]
	b	.LBB32_14
.LBB32_13:
	mvn	r0, #0
	mov	r1, #0
	str	r1, [r4]
	str	r0, [r4, #4]
.LBB32_14:
	add	sp, sp, #48
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.Lfunc_end32:
	.size	"io::write_rune", .Lfunc_end32-"io::write_rune"
	.fnend

	.p2align	2
	.type	"strconv_decimal::shift",%function
	.code	32
"strconv_decimal::shift":
	.fnstart
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	mov	r4, r0
	ldr	r0, [r0, #384]
	cmp	r0, #0
	beq	.LBB33_5
	mov	r5, r1
	cmp	r1, #1
	blt	.LBB33_4
	cmp	r5, #29
	blo	.LBB33_6
.LBB33_3:
	mov	r0, r4
	mov	r1, #28
	bl	"strconv_decimal::shift_left"
	sub	r1, r5, #28
	cmp	r5, #56
	mov	r5, r1
	bhi	.LBB33_3
	b	.LBB33_7
.LBB33_4:
	cmn	r5, #1
	ble	.LBB33_8
.LBB33_5:
	pop	{r4, r5, r11, lr}
	mov	pc, lr
.LBB33_6:
	mov	r1, r5
.LBB33_7:
	mov	r0, r4
	pop	{r4, r5, r11, lr}
	b	"strconv_decimal::shift_left"
.LBB33_8:
	cmn	r5, #29
	bhi	.LBB33_10
.LBB33_9:
	mov	r0, r4
	mov	r1, #28
	bl	"strconv_decimal::shift_right"
	add	r0, r5, #28
	cmn	r5, #56
	mov	r5, r0
	blo	.LBB33_9
	b	.LBB33_11
.LBB33_10:
	mov	r0, r5
.LBB33_11:
	rsb	r1, r0, #0
	mov	r0, r4
	pop	{r4, r5, r11, lr}
	b	"strconv_decimal::shift_right"
.Lfunc_end33:
	.size	"strconv_decimal::shift", .Lfunc_end33-"strconv_decimal::shift"
	.cantunwind
	.fnend

	.p2align	2
	.type	"io::write_quoted_rune",%function
	.code	32
"io::write_quoted_rune":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#60
	sub	sp, sp, #60
	mov	r10, #39
	mov	r6, r3
	mov	r8, r2
	mov	r11, r1
	mov	r4, r0
	mov	r9, #0
	cmp	r0, #0
	mov	r7, #0
	strb	r10, [sp, #39]
	beq	.LBB34_2
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r1, r11
	str	r0, [sp, #44]
	mov	r2, #4
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [sp, #48]
	rsbs	r1, r0, #0
	adc	r7, r0, r1
.LBB34_2:
	add	r0, sp, #28
	mov	r1, r4
	mov	r2, r11
	mov	r3, r8
	str	r10, [sp]
	str	r6, [sp, #4]
	bl	"io::write_escaped_rune"
	ldr	r5, [sp, #28]
	cmp	r4, #0
	strb	r10, [sp, #39]
	beq	.LBB34_4
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r1, r11
	str	r0, [sp, #44]
	mov	r2, #4
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [sp, #48]
	rsbs	r1, r0, #0
	adc	r9, r0, r1
.LBB34_4:
	add	r0, r5, r7
	add	r0, r0, r9
	add	sp, sp, #60
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.Lfunc_end34:
	.size	"io::write_quoted_rune", .Lfunc_end34-"io::write_quoted_rune"
	.fnend

	.p2align	2
	.type	"strconv_decimal::round",%function
	.code	32
"strconv_decimal::round":
	.fnstart
	cmp	r1, #0
	bmi	.LBB35_16
	ldr	r2, [r0, #384]
	cmp	r1, r2
	bge	.LBB35_16
	cmp	r1, #384
	bhs	.LBB35_21
	ldrb	r12, [r0, r1]
	cmp	r12, #53
	addeq	r3, r1, #1
	cmpeq	r3, r2
	beq	.LBB35_10
	cmp	r12, #52
	bhi	.LBB35_11
	cmp	r1, #0
	str	r1, [r0, #384]
	beq	.LBB35_9
.LBB35_6:
	sub	r1, r1, #1
.LBB35_7:
	ldrb	r2, [r0, r1]
	cmp	r2, #48
	movne	pc, lr
.LBB35_8:
	sub	r2, r1, #1
	str	r1, [r0, #384]
	add	r1, r1, #1
	cmp	r1, #1
	mov	r1, r2
	bhi	.LBB35_7
.LBB35_9:
	mov	r1, #0
	b	.LBB35_15
.LBB35_10:
	ldrb	r2, [r0, #393]
	cmp	r2, #0
	beq	.LBB35_17
.LBB35_11:
	cmp	r1, #0
	beq	.LBB35_14
	add	r2, r0, r1
	sub	r1, r1, #1
	ldrb	r2, [r2, #-1]
	cmp	r2, #56
	bhi	.LBB35_11
	add	r2, r2, #1
	strb	r2, [r0, r1]
	add	r1, r1, #1
	str	r1, [r0, #384]
	mov	pc, lr
.LBB35_14:
	mov	r1, #1
	str	r1, [r0, #384]
	mov	r1, #49
	strb	r1, [r0]
	ldr	r1, [r0, #388]
	add	r1, r1, #1
.LBB35_15:
	str	r1, [r0, #388]
.LBB35_16:
	mov	pc, lr
.LBB35_17:
	cmp	r1, #0
	beq	.LBB35_20
	add	r2, r1, r0
	ldrb	r2, [r2, #-1]
	tst	r2, #1
	bne	.LBB35_11
	str	r1, [r0, #384]
	b	.LBB35_6
.LBB35_20:
	mov	r1, #0
	str	r1, [r0, #384]
	mov	r1, #0
	b	.LBB35_15
.LBB35_21:
	.pad	#8
	sub	sp, sp, #8
	mov	r0, #384
	mov	r2, #191
	str	r0, [sp, #4]
	orr	r2, r2, #256
	ldr	r0, .LCPI35_0
	mov	r3, #14
	str	r1, [sp]
	mov	r1, #59
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI35_0:
	.long	".Lcsbs$POC-Example$108"
.Lfunc_end35:
	.size	"strconv_decimal::round", .Lfunc_end35-"strconv_decimal::round"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_string",%function
	.code	32
"runtime::write_string":
	.fnstart
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	.pad	#16
	sub	sp, sp, #16
	ldr	r4, [r0]
	mov	r5, #0
	cmp	r2, r4
	ble	.LBB36_5
	cmn	r4, #1
	ble	.LBB36_6
	ldr	r5, [sp, #32]
	sub	r2, r2, r4
	cmp	r2, r5
	movlt	r5, r2
	cmp	r5, #1
	blt	.LBB36_4
	add	r1, r4, r1
	mov	r4, r0
	mov	r2, r5
	mov	r0, r1
	mov	r1, r3
	bl	memmove
	mov	r0, r4
	ldr	r4, [r4]
.LBB36_4:
	add	r1, r4, r5
	mov	r5, #1
	str	r1, [r0]
.LBB36_5:
	mov	r0, r5
	add	sp, sp, #16
	pop	{r4, r5, r11, lr}
	mov	pc, lr
.LBB36_6:
	str	r2, [sp, #4]
	mov	r1, #49
	str	r2, [sp, #8]
	mov	r2, #13
	ldr	r0, .LCPI36_0
	orr	r2, r2, #512
	mov	r3, #17
	str	r4, [sp]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI36_0:
	.long	".Lcsbs$POC-Example$113"
.Lfunc_end36:
	.size	"runtime::write_string", .Lfunc_end36-"runtime::write_string"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_byte",%function
	.code	32
"runtime::write_byte":
	.fnstart
	.save	{r11, lr}
	push	{r11, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	lr, [r0]
	mov	r12, #0
	cmp	lr, r2
	bge	.LBB37_3
	bhs	.LBB37_4
	strb	r3, [r1, lr]
	mov	r12, #1
	ldr	r1, [r0]
	add	r1, r1, #1
	str	r1, [r0]
.LBB37_3:
	mov	r0, r12
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
.LBB37_4:
	str	r2, [sp, #4]
	mov	r2, #23
	ldr	r0, .LCPI37_0
	orr	r2, r2, #512
	mov	r1, #49
	mov	r3, #8
	str	lr, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI37_0:
	.long	".Lcsbs$POC-Example$113"
.Lfunc_end37:
	.size	"runtime::write_byte", .Lfunc_end37-"runtime::write_byte"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_u64",%function
	.code	32
"runtime::write_u64":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#156
	sub	sp, sp, #156
	ldr	r11, [r0]
	mov	r4, r0
	mov	r0, #0
	cmp	r2, r11
	ble	.LBB38_12
	add	r10, sp, #24
	mov	r7, r1
	str	r2, [sp, #20]
	mov	r1, #0
	mov	r0, r10
	mov	r2, #129
	ldr	r6, [sp, #196]
	mov	r8, #0
	ldr	r9, [sp, #192]
	mov	r5, #129
	bl	memset
	subs	r0, r9, #10
	sbcs	r0, r6, #0
	blo	.LBB38_7
	ldr	r1, .LCPI38_1
	mov	lr, r4
	ldr	r12, .LCPI38_2
	mov	r0, #128
	ldr	r3, .LCPI38_3
	str	r7, [sp, #16]
.LBB38_3:
	cmp	r0, #129
	bhs	.LBB38_13
	lsr	r4, r9, #1
	orr	r4, r4, r6, lsl #31
	adds	r7, r4, r6, lsr #1
	adc	r7, r7, #0
	umull	r5, r2, r7, r1
	bic	r5, r2, #3
	add	r2, r5, r2, lsr #2
	sub	r2, r7, r2
	subs	r2, r4, r2
	umull	r4, r7, r2, r1
	add	r5, r4, r4, lsl #2
	sub	r5, r9, r5, lsl #1
	ldrb	r5, [r12, r5]
	strb	r5, [r10, r0]
	mla	r5, r2, r3, r7
	rsc	r2, r8, r6, lsr #1
	sub	r0, r0, #1
	mla	r7, r2, r1, r5
	rsbs	r2, r9, #99
	rscs	r2, r6, #0
	mov	r9, r4
	mov	r6, r7
	blo	.LBB38_3
	cmp	r0, #129
	bhs	.LBB38_15
	ldr	r7, [sp, #16]
	add	r5, r0, #1
	mov	r9, r4
	mov	r4, lr
	b	.LBB38_8
.LBB38_7:
	mov	r0, #128
.LBB38_8:
	ldr	r1, .LCPI38_2
	cmn	r11, #1
	ldr	r2, [sp, #20]
	ldrb	r1, [r1, r9]
	strb	r1, [r10, r0]
	ble	.LBB38_14
	sub	r1, r2, r11
	rsb	r6, r5, #130
	cmp	r1, r6
	movlt	r6, r1
	cmp	r6, #1
	blt	.LBB38_11
	add	r1, r10, r0
	add	r0, r11, r7
	mov	r2, r6
	bl	memcpy
	ldr	r11, [r4]
.LBB38_11:
	add	r0, r11, r6
	str	r0, [r4]
	mov	r0, #1
.LBB38_12:
	add	sp, sp, #156
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB38_13:
	mov	r1, #129
	stm	sp, {r0, r1}
	mov	r1, #49
	ldr	r0, .LCPI38_0
	mov	r2, #552
	mov	r3, #14
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB38_14:
	str	r2, [sp, #4]
	mov	r1, #49
	str	r2, [sp, #8]
	mov	r2, #13
	ldr	r0, .LCPI38_0
	orr	r2, r2, #512
	mov	r3, #17
	str	r11, [sp]
	bl	"runtime::slice_handle_error"
.LBB38_15:
	mov	r2, #43
	mov	r1, #129
	stm	sp, {r0, r1}
	orr	r2, r2, #512
	mov	r1, #49
	ldr	r0, .LCPI38_0
	mov	r3, #13
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI38_0:
	.long	".Lcsbs$POC-Example$113"
.LCPI38_1:
	.long	3435973837
.LCPI38_2:
	.long	".Lcsbs$POC-Example$0"
.LCPI38_3:
	.long	3435973836
.Lfunc_end38:
	.size	"runtime::write_u64", .Lfunc_end38-"runtime::write_u64"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_i64",%function
	.code	32
"runtime::write_i64":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#156
	sub	sp, sp, #156
	ldr	r8, [r0]
	mov	r11, r0
	mov	r0, #0
	cmp	r2, r8
	ble	.LBB39_15
	add	r9, sp, #24
	mov	r6, r2
	str	r1, [sp, #20]
	mov	r1, #0
	mov	r0, r9
	mov	r2, #129
	ldr	r5, [sp, #196]
	mov	r10, #0
	ldr	r7, [sp, #192]
	mov	r4, #129
	bl	memset
	eor	r0, r7, r5, asr #31
	eor	r1, r5, r5, asr #31
	subs	r7, r0, r5, asr #31
	mov	r0, #128
	sbc	r2, r1, r5, asr #31
	subs	r1, r7, #10
	sbcs	r1, r2, #0
	blo	.LBB39_7
	ldr	r3, .LCPI39_1
	ldr	r12, .LCPI39_2
	ldr	lr, .LCPI39_3
	str	r6, [sp, #16]
.LBB39_3:
	cmp	r0, #129
	bhs	.LBB39_16
	lsr	r1, r7, #1
	orr	r1, r1, r2, lsl #31
	adds	r6, r1, r2, lsr #1
	adc	r6, r6, #0
	umull	r4, r5, r6, r3
	bic	r4, r5, #3
	add	r4, r4, r5, lsr #2
	sub	r4, r6, r4
	subs	r4, r1, r4
	umull	r1, r5, r4, r3
	add	r6, r1, r1, lsl #2
	sub	r6, r7, r6, lsl #1
	ldrb	r6, [r12, r6]
	strb	r6, [r9, r0]
	mla	r6, r4, lr, r5
	rsc	r4, r10, r2, lsr #1
	sub	r0, r0, #1
	mla	r5, r4, r3, r6
	rsbs	r4, r7, #99
	rscs	r2, r2, #0
	mov	r7, r1
	mov	r2, r5
	blo	.LBB39_3
	cmp	r0, #129
	bhs	.LBB39_18
	ldr	r6, [sp, #16]
	add	r4, r0, #1
	b	.LBB39_8
.LBB39_7:
	mov	r1, r7
.LBB39_8:
	ldr	r2, .LCPI39_2
	ldr	r3, [sp, #196]
	ldrb	r1, [r2, r1]
	cmn	r3, #1
	strb	r1, [r9, r0]
	bgt	.LBB39_11
	sub	r0, r4, #2
	cmp	r0, #129
	bhs	.LBB39_19
	mov	r1, #45
	strb	r1, [r9, r0]
.LBB39_11:
	cmn	r8, #1
	ble	.LBB39_17
	sub	r1, r6, r8
	rsb	r6, r0, #129
	cmp	r1, r6
	movlt	r6, r1
	cmp	r6, #1
	blt	.LBB39_14
	add	r1, r9, r0
	ldr	r0, [sp, #20]
	mov	r2, r6
	add	r0, r8, r0
	bl	memcpy
	ldr	r8, [r11]
.LBB39_14:
	add	r0, r8, r6
	str	r0, [r11]
	mov	r0, #1
.LBB39_15:
	add	sp, sp, #156
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB39_16:
	mov	r1, #129
	stm	sp, {r0, r1}
	mov	r1, #49
	ldr	r0, .LCPI39_0
	mov	r2, #572
	mov	r3, #14
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB39_17:
	mov	r2, #13
	ldr	r0, .LCPI39_0
	orr	r2, r2, #512
	mov	r1, #49
	mov	r3, #17
	str	r8, [sp]
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB39_18:
	mov	r2, #63
	mov	r1, #129
	stm	sp, {r0, r1}
	orr	r2, r2, #512
	mov	r1, #49
	ldr	r0, .LCPI39_0
	mov	r3, #13
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB39_19:
	mov	r2, #65
	mov	r1, #129
	stm	sp, {r0, r1}
	orr	r2, r2, #512
	mov	r1, #49
	ldr	r0, .LCPI39_0
	mov	r3, #14
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI39_0:
	.long	".Lcsbs$POC-Example$113"
.LCPI39_1:
	.long	3435973837
.LCPI39_2:
	.long	".Lcsbs$POC-Example$0"
.LCPI39_3:
	.long	3435973836
.Lfunc_end39:
	.size	"runtime::write_i64", .Lfunc_end39-"runtime::write_i64"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_typeid",%function
	.code	32
"runtime::write_typeid":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, sp, #20
	ldr	r11, [sp, #60]
	mov	r10, r2
	ldr	r8, [sp, #56]
	mov	r5, r0
	orrs	r0, r8, r11
	beq	.LBB40_7
	mov	r9, #73
	str	r1, [sp, #12]
	orr	r9, r9, #256
	mov	r0, r8
	mov	r1, r11
	mov	r3, #0
	mov	r2, r9
	str	r5, [sp, #16]
	mov	r7, #0
	bl	__aeabi_uldivmod
	ldr	r1, .LCPI40_0
	mov	r0, #0
	ldr	r12, .LCPI40_1
	b	.LBB40_3
.LBB40_2:
	adds	r6, r2, #1
	adc	r3, r3, #0
	subs	r2, r6, r9
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r6
	adds	r6, r7, #1
	adc	r5, r0, #0
	subs	r7, r7, #328
	sbcs	r0, r0, #0
	mov	r7, r6
	mov	r0, r5
	bhs	.LBB40_5
.LBB40_3:
	ldr	r5, [r1, r2, lsl #2]
	cmp	r5, #0
	beq	.LBB40_2
	ldr	r6, [r5, #16]
	ldr	r4, [r5, #20]
	eor	r6, r6, r8
	eor	r4, r4, r11
	orrs	r6, r6, r4
	bne	.LBB40_2
	b	.LBB40_6
.LBB40_5:
	mov	r5, r12
.LBB40_6:
	ldr	r0, [sp, #16]
	mov	r2, r10
	ldr	r1, [sp, #12]
	mov	r3, r5
	bl	"runtime::write_write_type"
	tst	r0, #1
	movne	r0, #1
	b	.LBB40_12
.LBB40_7:
	ldr	r2, [r5]
	mov	r0, #0
	cmp	r10, r2
	ble	.LBB40_12
	cmn	r2, #1
	ble	.LBB40_13
	sub	r0, r10, r2
	cmp	r0, #3
	mov	r4, r0
	movge	r4, #3
	cmp	r0, #1
	blt	.LBB40_11
	add	r0, r2, r1
	ldr	r1, .LCPI40_2
	mov	r2, r4
	bl	memcpy
	ldr	r2, [r5]
.LBB40_11:
	add	r0, r2, r4
	str	r0, [r5]
	mov	r0, #1
.LBB40_12:
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB40_13:
	stm	sp, {r2, r10}
	mov	r2, #13
	orr	r2, r2, #512
	ldr	r0, .LCPI40_3
	mov	r1, #49
	mov	r3, #17
	str	r10, [sp, #8]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI40_0:
	.long	.L__$type_info_data
.LCPI40_1:
	.long	".L__$ti-0"
.LCPI40_2:
	.long	".Lcsbs$POC-Example$11c"
.LCPI40_3:
	.long	".Lcsbs$POC-Example$113"
.Lfunc_end40:
	.size	"runtime::write_typeid", .Lfunc_end40-"runtime::write_typeid"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_rune",%function
	.code	32
"runtime::write_rune":
	.fnstart
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.pad	#16
	sub	sp, sp, #16
	ldr	r4, [sp, #40]
	cmp	r4, #127
	bhi	.LBB41_4
	ldr	r7, [r1]
	mov	r5, #0
	mov	r6, #0
	cmp	r7, r3
	bge	.LBB41_15
	cmp	r7, r3
	bhs	.LBB41_16
	strb	r4, [r2, r7]
	mov	r5, #1
	ldr	r2, [r1]
	add	r2, r2, #1
	str	r2, [r1]
	b	.LBB41_14
.LBB41_4:
	lsrs	r7, r4, #11
	bne	.LBB41_6
	mvn	r7, #63
	orr	r12, r7, r4, lsr #6
	mov	r7, #2
	mov	lr, #0
	mov	r5, #0
	b	.LBB41_9
.LBB41_6:
	mov	r7, #260096
	mov	r6, #253
	orr	r7, r7, #1835008
	orr	r6, r6, #65280
	and	r7, r4, r7
	cmp	r7, #55296
	lsr	r7, r4, #16
	moveq	r4, r6
	cmp	r7, #16
	movhi	r4, r6
	cmp	r7, #0
	bne	.LBB41_8
	mvn	r7, #31
	orr	r12, r7, r4, lsr #12
	and	r7, r4, #63
	mvn	r6, #127
	orr	lr, r7, r6
	lsr	r4, r4, #6
	mov	r7, #3
	mov	r5, #0
	b	.LBB41_9
.LBB41_8:
	mvn	r7, #15
	orr	r12, r7, r4, lsr #18
	and	r7, r4, #63
	mvn	r6, #127
	orr	r5, r7, r6
	mov	r7, #63
	and	r7, r7, r4, lsr #6
	lsr	r4, r4, #12
	orr	lr, r7, r6
	mov	r7, #4
.LBB41_9:
	and	r6, r4, #63
	ldr	r4, [r1]
	orr	r6, r6, #128
	strb	r5, [sp, #15]
	strb	r6, [sp, #13]
	mov	r5, #0
	cmp	r3, r4
	mov	r6, #0
	strb	lr, [sp, #14]
	strb	r12, [sp, #12]
	ble	.LBB41_15
	cmn	r4, #1
	ble	.LBB41_17
	sub	r3, r3, r4
	cmp	r3, r7
	movlt	r7, r3
	cmp	r3, #1
	mov	r3, r4
	blt	.LBB41_13
	add	r2, r4, r2
	add	r3, sp, #12
	mov	r5, r0
	mov	r6, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, r7
	bl	memcpy
	ldr	r3, [r6]
	mov	r1, r6
	mov	r0, r5
.LBB41_13:
	add	r2, r3, r7
	str	r2, [r1]
	sub	r5, r2, r4
.LBB41_14:
	mov	r6, #1
.LBB41_15:
	strb	r6, [r0, #4]
	str	r5, [r0]
	add	sp, sp, #16
	pop	{r4, r5, r6, r7, r11, lr}
	mov	pc, lr
.LBB41_16:
	mov	r2, #23
	ldr	r0, .LCPI41_0
	orr	r2, r2, #512
	str	r3, [sp, #4]
	mov	r1, #49
	mov	r3, #8
	str	r7, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB41_17:
	mov	r2, #13
	ldr	r0, .LCPI41_0
	orr	r2, r2, #512
	str	r3, [sp, #4]
	str	r3, [sp, #8]
	mov	r1, #49
	mov	r3, #17
	str	r4, [sp]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI41_0:
	.long	".Lcsbs$POC-Example$113"
.Lfunc_end41:
	.size	"runtime::write_rune", .Lfunc_end41-"runtime::write_rune"
	.cantunwind
	.fnend

	.p2align	2
	.type	"reflect::struct_field_value_by_name",%function
	.code	32
"reflect::struct_field_value_by_name":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#100
	sub	sp, sp, #100
	mov	r10, r2
	ldr	r2, [r1]
	str	r3, [sp, #52]
	cmp	r2, #0
	ldrne	r9, [r1, #8]
	ldrne	r5, [r1, #12]
	orrsne	r1, r9, r5
	bne	.LBB42_2
	mov	r1, #0
	str	r1, [r0]
	str	r1, [r0, #4]
	str	r1, [r0, #8]
	str	r1, [r0, #12]
	b	.LBB42_36
.LBB42_2:
	mov	r8, #73
	str	r0, [sp, #40]
	orr	r8, r8, #256
	str	r2, [sp, #32]
	mov	r0, r9
	mov	r1, r5
	mov	r2, r8
	mov	r3, #0
	mov	r4, #0
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI42_0
	mov	r6, #0
	ldr	r11, .LCPI42_1
	b	.LBB42_4
.LBB42_3:
	adds	r0, r2, #1
	mov	r2, #0
	adc	r3, r3, #0
	subs	r1, r0, r8
	sbcs	r1, r3, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r4, #1
	adc	r1, r6, #0
	subs	r7, r4, #328
	sbcs	r7, r6, #0
	mov	r4, r0
	mov	r6, r1
	bhs	.LBB42_6
.LBB42_4:
	ldr	r0, [lr, r2, lsl #2]
	cmp	r0, #0
	beq	.LBB42_3
	ldr	r1, [r0, #16]
	ldr	r12, [r0, #20]
	eor	r1, r1, r9
	eor	r7, r12, r5
	orrs	r1, r1, r7
	bne	.LBB42_3
	b	.LBB42_8
.LBB42_6:
	mov	r0, r11
	b	.LBB42_8
.LBB42_7:
	ldr	r0, [r0, #32]
.LBB42_8:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r3, r1, #1
	orrs	r3, r3, r2
	beq	.LBB42_7
	eor	r1, r1, #19
	orrs	r1, r1, r2
	bne	.LBB42_34
	ldr	r1, [r0, #44]
	str	r1, [sp, #28]
	cmp	r1, #0
	bmi	.LBB42_37
	beq	.LBB42_34
	ldr	r1, [r0, #24]
	mov	r4, #0
	str	r1, [sp, #20]
	ldr	r1, [r0, #28]
	str	r1, [sp, #36]
	ldr	r1, [r0, #32]
	ldr	r0, [r0, #36]
	str	r0, [sp, #16]
	add	r0, sp, #64
	add	r0, r0, #8
	str	r0, [sp, #8]
	add	r0, sp, #80
	str	r1, [sp, #24]
	add	r0, r0, #8
	str	r0, [sp, #12]
	ldr	r0, [sp, #52]
	bic	r0, r0, #15
	str	r0, [sp, #48]
	sub	r0, r0, #1
	bic	r0, r0, #15
	add	r0, r0, #16
	str	r0, [sp, #4]
	b	.LBB42_14
.LBB42_13:
	ldr	r0, [sp, #28]
	add	r4, r4, #1
	cmp	r4, r0
	beq	.LBB42_34
.LBB42_14:
	ldr	r0, [sp, #36]
	ldr	r1, [sp, #52]
	str	r4, [sp, #44]
	ldr	r12, [r0, r4, lsl #3]!
	ldr	r0, [r0, #4]
	cmp	r0, r1
	bne	.LBB42_30
	ldr	r0, [sp, #52]
	cmp	r0, #0
	cmpne	r10, r12
	beq	.LBB42_35
	ldr	r1, [sp, #52]
	mov	r0, #0
	cmp	r1, #8
	blo	.LBB42_26
	ldr	r0, [sp, #48]
	cmp	r0, #0
	beq	.LBB42_22
	mov	r1, #0
.LBB42_19:
	mov	r7, r10
	mov	lr, r10
	ldrb	r0, [r7, r1]!
	mov	r3, r12
	str	r0, [sp, #60]
	mov	r0, r12
	ldrb	r2, [r0, r1]!
	ldrb	r4, [r7, #15]
	ldrb	r5, [r0, #15]
	ldrb	r6, [r0, #14]
	subs	r5, r5, r4
	ldrb	r4, [r7, #14]
	movne	r5, #1
	str	r2, [sp, #56]
	subs	r6, r6, r4
	ldrb	r4, [r0, #13]
	movne	r6, #1
	ldrb	r2, [r0, #12]
	orr	r6, r6, r5, lsl #1
	ldrb	r5, [r7, #13]
	ldrb	r8, [r0, #8]
	subs	r5, r4, r5
	ldrb	r4, [r7, #12]
	movne	r5, #1
	ldrb	r10, [r7, #3]
	subs	r2, r2, r4
	ldrb	r4, [r7, #11]
	movne	r2, #1
	ldrb	r11, [r0, #1]
	orr	r2, r2, r5, lsl #1
	ldrb	r5, [r0, #11]
	orr	r2, r2, r6, lsl #2
	ldrb	r6, [r0, #10]
	subs	r4, r5, r4
	ldrb	r5, [r7, #10]
	movne	r4, #1
	ldrb	r9, [r0, #2]
	subs	r5, r6, r5
	ldrb	r6, [r0, #9]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	ldrb	r5, [r7, #9]
	ldrb	r12, [r0, #3]
	subs	r5, r6, r5
	ldrb	r6, [r7, #8]
	movne	r5, #1
	subs	r6, r8, r6
	movne	r6, #1
	orr	r5, r6, r5, lsl #1
	orr	r4, r5, r4, lsl #2
	ldrb	r5, [r0, #7]
	orr	r8, r4, r2, lsl #4
	ldrb	r2, [r7, #7]
	ldrb	r6, [r0, #6]
	subs	r2, r5, r2
	ldrb	r5, [r7, #6]
	movne	r2, #1
	ldrb	r4, [r7, #2]
	subs	r5, r6, r5
	ldrb	r6, [r0, #5]
	movne	r5, #1
	orr	r2, r5, r2, lsl #1
	ldrb	r5, [r7, #5]
	ldrb	r0, [r0, #4]
	subs	r5, r6, r5
	ldrb	r6, [r7, #1]
	ldrb	r7, [r7, #4]
	movne	r5, #1
	subs	r0, r0, r7
	movne	r0, #1
	orr	r0, r0, r5, lsl #1
	orr	r0, r0, r2, lsl #2
	subs	r2, r12, r10
	movne	r2, #1
	subs	r7, r9, r4
	movne	r7, #1
	mov	r12, r3
	orr	r2, r7, r2, lsl #1
	ldr	r3, [sp, #60]
	ldr	r7, [sp, #56]
	mov	r10, lr
	subs	r3, r7, r3
	movne	r3, #1
	subs	r7, r11, r6
	movne	r7, #1
	orr	r3, r3, r7, lsl #1
	orr	r2, r3, r2, lsl #2
	orr	r0, r2, r0, lsl #4
	mov	r2, #255
	and	r0, r0, #255
	orr	r2, r2, #65280
	orr	r0, r0, r8, lsl #8
	tst	r0, r2
	bne	.LBB42_30
	ldr	r0, [sp, #48]
	add	r1, r1, #16
	cmp	r1, r0
	blo	.LBB42_19
	ldr	r0, [sp, #4]
	b	.LBB42_23
.LBB42_22:
	mov	r0, #0
.LBB42_23:
	ldr	r1, [sp, #52]
	sub	r1, r1, r0
	bic	r1, r1, #3
	cmp	r0, r1
	bhs	.LBB42_26
.LBB42_24:
	ldr	r2, [r10, r0]
	ldr	r3, [r12, r0]
	cmp	r3, r2
	bne	.LBB42_30
	add	r0, r0, #4
	cmp	r0, r1
	blo	.LBB42_24
.LBB42_26:
	ldr	r1, [sp, #52]
	cmp	r1, r0
	bls	.LBB42_35
	ldr	r3, [sp, #52]
	add	r1, r12, r0
	add	r2, r10, r0
	sub	r0, r3, r0
.LBB42_28:
	ldrb	r3, [r1], #1
	ldrb	r7, [r2], #1
	cmp	r3, r7
	bne	.LBB42_30
	subs	r0, r0, #1
	bne	.LBB42_28
	b	.LBB42_35
.LBB42_30:
	ldr	r0, [sp, #136]
	ldr	r4, [sp, #44]
	cmp	r0, #0
	beq	.LBB42_13
	ldr	r0, [sp, #16]
	ldrb	r0, [r0, r4]
	cmp	r0, #0
	beq	.LBB42_13
	ldr	r0, [sp, #20]
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #52]
	ldr	r0, [r0, r4, lsl #2]
	ldr	r1, [r0, #16]
	ldr	r0, [r0, #20]
	str	r0, [r2, #4]
	mov	r0, #0
	str	r0, [sp, #84]
	str	r0, [sp, #64]
	str	r0, [sp, #68]
	str	r0, [sp, #72]
	str	r0, [sp, #76]
	ldr	r0, [sp, #24]
	str	r1, [r2]
	mov	r2, r10
	ldr	r1, [sp, #32]
	ldr	r0, [r0, r4, lsl #2]
	add	r0, r0, r1
	str	r0, [sp, #80]
	mov	r0, #1
	add	r1, sp, #80
	str	r0, [sp]
	add	r0, sp, #64
	bl	"reflect::struct_field_value_by_name"
	ldr	r0, [sp, #64]
	cmp	r0, #0
	ldrne	r2, [sp, #8]
	ldmne	r2, {r1, r2}
	orrsne	r3, r1, r2
	beq	.LBB42_13
	ldr	r7, [sp, #40]
	ldr	r3, [sp, #68]
	stm	r7, {r0, r3}
	str	r1, [r7, #8]
	str	r2, [r7, #12]
	b	.LBB42_36
.LBB42_34:
	ldr	r1, [sp, #40]
	mov	r0, #0
	str	r0, [r1]
	str	r0, [r1, #4]
	str	r0, [r1, #8]
	str	r0, [r1, #12]
	b	.LBB42_36
.LBB42_35:
	ldr	r7, [sp, #44]
	mov	r0, #0
	ldr	r3, [sp, #24]
	ldr	r1, [sp, #20]
	ldr	r3, [r3, r7, lsl #2]
	ldr	r1, [r1, r7, lsl #2]
	ldr	r7, [sp, #32]
	add	r3, r3, r7
	ldr	r7, [sp, #40]
	ldr	r2, [r1, #16]
	ldr	r1, [r1, #20]
	str	r3, [r7]
	stmib	r7, {r0, r2}
	str	r1, [r7, #12]
.LBB42_36:
	add	sp, sp, #100
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB42_37:
	ldr	r0, [sp, #28]
	mov	r2, #7
	str	r0, [sp]
	orr	r2, r2, #512
	ldr	r0, .LCPI42_2
	mov	r1, #51
	mov	r3, #25
	bl	"runtime::multi_pointer_slice_handle_error"
	.p2align	2
.LCPI42_0:
	.long	.L__$type_info_data
.LCPI42_1:
	.long	".L__$ti-0"
.LCPI42_2:
	.long	".Lcsbs$POC-Example$158"
.Lfunc_end42:
	.size	"reflect::struct_field_value_by_name", .Lfunc_end42-"reflect::struct_field_value_by_name"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_encoded_rune",%function
	.code	32
"runtime::write_encoded_rune":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	.pad	#24
	sub	sp, sp, #24
	ldr	r7, [r0]
	mov	r5, r3
	mov	r3, #0
	cmp	r7, r2
	bge	.LBB43_52
	bhs	.LBB43_56
	mov	r6, #39
	strb	r6, [r1, r7]
	sub	r6, r5, #7
	cmp	r6, #20
	ldr	r7, [r0]
	add	r7, r7, #1
	str	r7, [r0]
	bhi	.LBB43_9
	adr	r4, .LJTI43_0
	ldr	pc, [r4, r6, lsl #2]
	.p2align	2
.LJTI43_0:
	.long	.LBB43_5
	.long	.LBB43_18
	.long	.LBB43_30
	.long	.LBB43_34
	.long	.LBB43_38
	.long	.LBB43_14
	.long	.LBB43_22
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_9
	.long	.LBB43_26
.LBB43_5:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_8
	b	.LBB43_46
.LBB43_9:
	cmp	r5, #0
	ble	.LBB43_42
	cmp	r5, #31
	bhi	.LBB43_53
	mov	r3, #2
	mov	r7, r0
	str	r3, [sp]
	mov	r4, r1
	ldr	r3, .LCPI43_9
	mov	r6, r2
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB43_55
	ldr	r8, .LCPI43_10
	mov	r0, r7
	mov	r1, r4
	mov	r2, r6
	ldrb	r3, [r8, r5, lsr #4]
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB43_55
	and	r0, r5, #15
	mov	r1, r4
	mov	r2, r6
	ldrb	r3, [r8, r0]
	mov	r0, r7
	bl	"runtime::write_byte"
	mov	r3, r0
	mov	r2, r6
	mov	r0, r7
	b	.LBB43_54
.LBB43_14:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_5
	b	.LBB43_46
.LBB43_18:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_7
	b	.LBB43_46
.LBB43_22:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_3
	b	.LBB43_46
.LBB43_26:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_6
	b	.LBB43_46
.LBB43_30:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_2
	b	.LBB43_46
.LBB43_34:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_4
	b	.LBB43_46
.LBB43_38:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #2
	mov	r5, r3
	movge	r5, #2
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_1
	b	.LBB43_46
.LBB43_42:
	cmp	r2, r7
	ble	.LBB43_52
	cmn	r7, #1
	ble	.LBB43_58
	sub	r3, r2, r7
	cmp	r3, #4
	mov	r5, r3
	movge	r5, #4
	cmp	r3, #1
	blt	.LBB43_47
	mov	r4, r1
	add	r3, r7, r1
	ldr	r1, .LCPI43_11
.LBB43_46:
	mov	r6, r0
	mov	r7, r2
	mov	r0, r3
	mov	r2, r5
	bl	memcpy
	mov	r2, r7
	ldr	r7, [r6]
	mov	r0, r6
	b	.LBB43_48
.LBB43_47:
	mov	r4, r1
.LBB43_48:
	add	r1, r7, r5
	str	r1, [r0]
.LBB43_49:
	ldr	r1, [r0]
	mov	r3, #0
	cmp	r1, r2
	bge	.LBB43_52
	bhs	.LBB43_59
	mov	r2, #39
	mov	r3, #1
	strb	r2, [r4, r1]
	ldr	r1, [r0]
	add	r1, r1, #1
	str	r1, [r0]
.LBB43_52:
	mov	r0, r3
	add	sp, sp, #24
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.LBB43_53:
	strb	r3, [sp, #20]
	mov	r6, r2
	str	r3, [sp, #16]
	add	r3, sp, #16
	str	r5, [sp]
	mov	r5, r0
	mov	r0, r3
	mov	r3, r1
	mov	r1, r5
	mov	r4, r3
	mov	r2, r3
	mov	r3, r6
	bl	"runtime::write_rune"
	mov	r0, r5
	mov	r2, r6
	ldrb	r3, [sp, #20]
.LBB43_54:
	tst	r3, #1
	bne	.LBB43_49
	b	.LBB43_52
.LBB43_55:
	mov	r3, r0
	b	.LBB43_52
.LBB43_56:
	str	r7, [sp]
.LBB43_57:
	str	r2, [sp, #4]
	mov	r2, #23
	ldr	r0, .LCPI43_0
	orr	r2, r2, #512
	mov	r1, #49
	mov	r3, #8
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB43_58:
	str	r2, [sp, #4]
	mov	r1, #49
	str	r2, [sp, #8]
	mov	r2, #13
	ldr	r0, .LCPI43_0
	orr	r2, r2, #512
	mov	r3, #17
	str	r7, [sp]
	bl	"runtime::slice_handle_error"
.LBB43_59:
	str	r1, [sp]
	b	.LBB43_57
	.p2align	2
.LCPI43_0:
	.long	".Lcsbs$POC-Example$113"
.LCPI43_1:
	.long	".Lcsbs$POC-Example$110"
.LCPI43_2:
	.long	".Lcsbs$POC-Example$10f"
.LCPI43_3:
	.long	".Lcsbs$POC-Example$10e"
.LCPI43_4:
	.long	".Lcsbs$POC-Example$10d"
.LCPI43_5:
	.long	".Lcsbs$POC-Example$10c"
.LCPI43_6:
	.long	".Lcsbs$POC-Example$10b"
.LCPI43_7:
	.long	".Lcsbs$POC-Example$10a"
.LCPI43_8:
	.long	".Lcsbs$POC-Example$109"
.LCPI43_9:
	.long	".Lcsbs$POC-Example$112"
.LCPI43_10:
	.long	".Lcsbs$POC-Example$0"
.LCPI43_11:
	.long	".Lcsbs$POC-Example$111"
.Lfunc_end43:
	.size	"runtime::write_encoded_rune", .Lfunc_end43-"runtime::write_encoded_rune"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::write_write_type",%function
	.code	32
"runtime::write_write_type":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, sp, #28
	mov	r10, r2
	mov	r5, r1
	mov	r6, r0
	cmp	r3, #0
	beq	.LBB44_5
	add	r0, r3, #16
	mov	r7, r3
	ldr	r1, [r0, #48]
	ldr	r2, [r0, #52]
	subs	r1, r1, #1
	sbc	r2, r2, #0
	rsbs	r3, r1, #26
	rscs	r2, r2, #0
	blo	.LBB44_188
	adr	r2, .LJTI44_0
	ldr	pc, [r2, r1, lsl #2]
	.p2align	2
.LJTI44_0:
	.long	.LBB44_4
	.long	.LBB44_39
	.long	.LBB44_31
	.long	.LBB44_33
	.long	.LBB44_12
	.long	.LBB44_62
	.long	.LBB44_70
	.long	.LBB44_37
	.long	.LBB44_83
	.long	.LBB44_22
	.long	.LBB44_79
	.long	.LBB44_11
	.long	.LBB44_13
	.long	.LBB44_69
	.long	.LBB44_7
	.long	.LBB44_32
	.long	.LBB44_6
	.long	.LBB44_43
	.long	.LBB44_75
	.long	.LBB44_96
	.long	.LBB44_54
	.long	.LBB44_66
	.long	.LBB44_84
	.long	.LBB44_109
	.long	.LBB44_24
	.long	.LBB44_23
	.long	.LBB44_115
.LBB44_4:
	ldr	r0, [r7, #28]
	ldr	r3, [r7, #24]
	b	.LBB44_175
.LBB44_5:
	ldr	r3, .LCPI44_62
	mov	r0, #3
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	b	.LBB44_187
.LBB44_6:
	mov	r0, #2
	ldr	r4, [r7, #24]
	str	r0, [sp]
	ldr	r3, .LCPI44_63
	b	.LBB44_81
.LBB44_7:
	ldrb	r0, [r7, #56]
	ldr	r8, [r7, #24]
	ldr	r9, [r7, #28]
	cmp	r0, #0
	beq	.LBB44_9
	ldr	r3, .LCPI44_64
	mov	r0, #7
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_9:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #91
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r9
	bl	"runtime::write_write_type"
	b	.LBB44_113
.LBB44_11:
	mov	r0, #3
	ldr	r4, [r7, #24]
	str	r0, [sp]
	ldr	r3, .LCPI44_65
	b	.LBB44_81
.LBB44_12:
	ldr	r3, .LCPI44_66
	mov	r0, #7
	b	.LBB44_63
.LBB44_13:
	ldr	r3, .LCPI44_67
	mov	r0, #4
	ldr	r4, [r7, #24]
	mov	r1, r5
	ldr	r7, [r7, #28]
	mov	r2, r10
	str	r0, [sp]
	mov	r0, r6
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	cmp	r4, #0
	beq	.LBB44_165
	ldr	r0, [r4, #64]
	ldr	r1, [r4, #68]
	eor	r0, r0, #18
	orrs	r0, r0, r1
	bne	.LBB44_199
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #40
	ldr	r11, [r4, #24]
	ldr	r4, [r4, #28]
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r9, .LCPI44_68
	mov	r8, #0
	str	r7, [sp, #24]
	bic	r7, r4, r4, asr #31
.LBB44_18:
	cmp	r7, r8
	beq	.LBB44_179
	ldr	r4, [r11, r8, lsl #2]
	sub	r0, r8, #1
	cmn	r0, #-2147483646
	bhi	.LBB44_21
	mov	r0, #2
	mov	r1, r5
	str	r0, [sp]
	mov	r0, r6
	mov	r2, r10
	mov	r3, r9
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_21:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	bl	"runtime::write_write_type"
	add	r8, r8, #1
	tst	r0, #1
	beq	.LBB44_187
	b	.LBB44_18
.LBB44_22:
	mov	r0, #6
	ldr	r3, .LCPI44_69
	b	.LBB44_175
.LBB44_23:
	mov	r0, #6
	ldr	r4, [r7, #24]
	str	r0, [sp]
	ldr	r3, .LCPI44_70
	b	.LBB44_81
.LBB44_24:
	ldr	r4, [r0, #24]
	ldr	r0, [r0, #28]
	ldr	r8, [r7, #24]
	ldr	r7, [r7, #36]
	and	r0, r0, #255
	cmp	r0, #1
	bne	.LBB44_26
	ldr	r3, .LCPI44_0
	mov	r0, #11
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_26:
	ldr	r3, .LCPI44_1
	mov	r0, #7
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	asr	r0, r7, #31
	mov	r1, r5
	str	r0, [sp, #4]
	mov	r0, r6
	mov	r2, r10
	str	r7, [sp]
	bl	"runtime::write_u64"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_2
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	asr	r0, r4, #31
	mov	r1, r5
	str	r0, [sp, #4]
	mov	r0, r6
	mov	r2, r10
	str	r4, [sp]
	bl	"runtime::write_u64"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_3
	mov	r0, #1
	b	.LBB44_141
.LBB44_31:
	mov	r0, #4
	ldr	r3, .LCPI44_50
	b	.LBB44_175
.LBB44_32:
	mov	r0, #9
	ldr	r4, [r7, #24]
	str	r0, [sp]
	ldr	r3, .LCPI44_29
	b	.LBB44_81
.LBB44_33:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #102
	ldrb	r4, [r7, #24]
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r0, [r7]
	mov	r2, r10
	lsl	r0, r0, #3
	asr	r1, r0, #31
	stm	sp, {r0, r1}
	mov	r0, r6
	mov	r1, r5
	bl	"runtime::write_u64"
	tst	r0, #1
	beq	.LBB44_187
	cmp	r4, #2
	beq	.LBB44_172
	cmp	r4, #1
	beq	.LBB44_136
	b	.LBB44_188
.LBB44_37:
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	ldr	r2, .LCPI44_41
	eor	r0, r0, r2
	ldr	r2, .LCPI44_42
	eor	r1, r1, r2
	orrs	r0, r1, r0
	bne	.LBB44_128
	mov	r0, #4
	ldr	r3, .LCPI44_43
	b	.LBB44_175
.LBB44_39:
	ldr	r1, [r0]
	ldr	r3, .LCPI44_52
	ldr	r0, [r0, #4]
	ldr	r2, .LCPI44_51
	eor	r3, r1, r3
	ldrh	r4, [r7, #24]
	eor	r2, r0, r2
	orrs	r2, r3, r2
	beq	.LBB44_131
	ldr	r2, .LCPI44_53
	ldr	r3, .LCPI44_54
	eor	r2, r1, r2
	eor	r3, r0, r3
	orrs	r2, r2, r3
	beq	.LBB44_130
	ldr	r2, .LCPI44_55
	eor	r1, r1, r2
	ldr	r2, .LCPI44_56
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB44_137
	ldr	r3, .LCPI44_59
	mov	r0, #3
	b	.LBB44_132
.LBB44_43:
	ldr	r0, [r7, #24]
	ldr	r4, [r7, #36]
	str	r0, [sp, #16]
	ldr	r0, [r7, #28]
	cmp	r4, #1
	str	r0, [sp, #20]
	ldr	r0, [r7, #32]
	str	r0, [sp, #24]
	beq	.LBB44_45
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #40
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_45:
	bic	r11, r4, r4, asr #31
	mov	r8, #0
	str	r4, [sp, #12]
.LBB44_46:
	cmp	r11, r8
	beq	.LBB44_163
	ldr	r1, [sp, #24]
	sub	r0, r8, #1
	cmn	r0, #-2147483646
	ldr	r4, [r1, r8, lsl #3]!
	ldr	r9, [r1, #4]
	bhi	.LBB44_49
	ldr	r3, .LCPI44_2
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_49:
	ldr	r0, [sp, #20]
	cmp	r0, r8
	beq	.LBB44_198
	ldr	r0, [sp, #16]
	cmp	r9, #1
	ldr	r7, [r0, r8, lsl #2]
	blt	.LBB44_53
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	str	r9, [sp]
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_8
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_53:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r7
	bl	"runtime::write_write_type"
	add	r8, r8, #1
	tst	r0, #1
	beq	.LBB44_187
	b	.LBB44_46
.LBB44_54:
	ldr	r3, .LCPI44_13
	mov	r0, #5
	ldr	r4, [r7, #24]
	mov	r1, r5
	ldr	r8, [r7, #28]
	mov	r2, r10
	ldr	r7, [r7, #32]
	str	r0, [sp]
	mov	r0, r6
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	bl	"runtime::write_write_type"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_6
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	bic	r7, r7, r7, asr #31
	mov	r9, #0
.LBB44_58:
	cmp	r7, r9
	beq	.LBB44_174
	mov	r1, r8
	sub	r0, r9, #1
	ldr	r4, [r1, r9, lsl #3]!
	cmn	r0, #-2147483646
	ldr	r11, [r1, #4]
	bhi	.LBB44_61
	ldr	r3, .LCPI44_2
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_61:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	str	r11, [sp]
	bl	"runtime::write_string"
	add	r9, r9, #1
	tst	r0, #1
	beq	.LBB44_187
	b	.LBB44_58
.LBB44_62:
	mov	r0, #10
	ldr	r3, .LCPI44_46
.LBB44_63:
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
.LBB44_64:
	tst	r0, #1
	beq	.LBB44_187
	ldr	r0, [r7]
	mov	r2, r10
	lsl	r0, r0, #3
	asr	r1, r0, #31
	stm	sp, {r0, r1}
	mov	r0, r6
	mov	r1, r5
	bl	"runtime::write_u64"
	b	.LBB44_186
.LBB44_66:
	ldr	r3, .LCPI44_27
	mov	r0, #4
	ldr	r4, [r7, #24]
	mov	r1, r5
	ldr	r7, [r7, #28]
	mov	r2, r10
	str	r0, [sp]
	mov	r0, r6
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	bl	"runtime::write_write_type"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #93
	bl	"runtime::write_byte"
	b	.LBB44_183
.LBB44_69:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #91
	ldr	r8, [r7, #24]
	ldr	r4, [r7, #32]
	bl	"runtime::write_byte"
	b	.LBB44_111
.LBB44_70:
	ldrh	r4, [r7, #24]
	tst	r4, #255
	beq	.LBB44_72
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #99
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_72:
	ldr	r3, .LCPI44_44
	mov	r0, #6
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	bic	r0, r4, #255
	cmp	r0, #256
	bne	.LBB44_188
	mov	r0, #2
	ldr	r3, .LCPI44_45
	b	.LBB44_175
.LBB44_75:
	ldr	r4, [r0, #32]
	mov	r1, #255
	ldr	r8, [r7, #56]
	and	r1, r1, r4, lsr #8
	cmp	r1, #3
	beq	.LBB44_140
	cmp	r1, #2
	beq	.LBB44_139
	cmp	r1, #1
	bne	.LBB44_144
	ldr	r3, .LCPI44_20
	mov	r1, r5
	ldr	r4, [r0, #36]
	mov	r0, #5
	str	r0, [sp]
	mov	r0, r6
	mov	r2, r10
	b	.LBB44_110
.LBB44_79:
	ldr	r4, [r7, #24]
	cmp	r4, #0
	beq	.LBB44_129
	ldr	r3, .LCPI44_37
	mov	r0, #1
	str	r0, [sp]
.LBB44_81:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	b	.LBB44_185
.LBB44_83:
	mov	r0, #3
	ldr	r3, .LCPI44_40
	b	.LBB44_175
.LBB44_84:
	ldrb	r1, [r7, #32]
	mov	r2, r10
	ldr	r3, .LCPI44_10
	str	r1, [sp, #20]
	ldr	r1, [r0, #28]
	ldr	r9, [r7, #24]
	ldr	r4, [r7, #28]
	ldr	r11, [r0, #24]
	ldr	r7, [r0, #32]
	ldr	r8, [r0, #36]
	mov	r0, #8
	str	r1, [sp, #24]
	mov	r1, r5
	str	r0, [sp]
	mov	r0, r6
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r2, [r9, #64]
	lsr	r0, r7, #16
	ldr	r3, [r9, #68]
	lsr	r1, r7, #8
	str	r4, [sp, #12]
	eor	r4, r2, #1
	orrs	r4, r4, r3
	str	r7, [sp, #16]
	bne	.LBB44_88
	mov	r4, r9
.LBB44_87:
	ldr	r4, [r4, #32]
	ldr	r2, [r4, #64]
	ldr	r3, [r4, #68]
	eor	r7, r2, #1
	orrs	r7, r7, r3
	beq	.LBB44_87
.LBB44_88:
	orr	r7, r0, r8, lsl #16
	eor	r0, r2, #3
	orr	r4, r1, r8, lsl #24
	orrs	r0, r0, r3
	beq	.LBB44_166
	eor	r0, r2, #21
	orrs	r0, r0, r3
	bne	.LBB44_169
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r9
	bl	"runtime::write_write_type"
.LBB44_91:
	tst	r0, #1
	beq	.LBB44_187
	ldr	r0, [sp, #20]
	cmp	r0, #0
	beq	.LBB44_95
	ldr	r3, .LCPI44_12
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, [sp, #12]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_write_type"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_95:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #93
	b	.LBB44_190
.LBB44_96:
	ldr	r3, .LCPI44_15
	mov	r1, r5
	ldr	r4, [r0, #28]
	mov	r0, #6
	ldr	r8, [r7, #24]
	mov	r2, r10
	ldr	r9, [r7, #28]
	str	r0, [sp]
	mov	r0, r6
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	tst	r4, #255
	beq	.LBB44_101
	ldr	r3, .LCPI44_16
	mov	r0, #7
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r0, [r7, #4]
	mov	r2, r10
	asr	r1, r0, #31
	stm	sp, {r0, r1}
	mov	r0, r6
	mov	r1, r5
	bl	"runtime::write_u64"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_17
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_101:
	tst	r4, #65280
	beq	.LBB44_103
	ldr	r3, .LCPI44_18
	mov	r0, #8
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_103:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #123
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
	bic	r11, r9, r9, asr #31
	ldr	r9, .LCPI44_2
	mov	r7, #0
.LBB44_105:
	cmp	r11, r7
	beq	.LBB44_174
	ldr	r4, [r8, r7, lsl #2]
	sub	r0, r7, #1
	cmn	r0, #-2147483646
	bhi	.LBB44_108
	mov	r0, #2
	mov	r1, r5
	str	r0, [sp]
	mov	r0, r6
	mov	r2, r10
	mov	r3, r9
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_108:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	bl	"runtime::write_write_type"
	add	r7, r7, #1
	tst	r0, #1
	beq	.LBB44_187
	b	.LBB44_105
.LBB44_109:
	ldr	r3, .LCPI44_4
	mov	r0, #6
	ldr	r8, [r7, #24]
	mov	r1, r5
	ldr	r4, [r7, #32]
	mov	r2, r10
	str	r0, [sp]
	mov	r0, r6
.LBB44_110:
	bl	"runtime::write_string"
.LBB44_111:
	tst	r0, #1
	beq	.LBB44_187
	asr	r0, r4, #31
	mov	r1, r5
	str	r0, [sp, #4]
	mov	r0, r6
	mov	r2, r10
	str	r4, [sp]
	bl	"runtime::write_u64"
.LBB44_113:
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #93
	bl	"runtime::write_byte"
	b	.LBB44_142
.LBB44_115:
	ldr	r0, [r7, #28]
	mov	r1, r5
	ldr	r3, .LCPI44_5
	mov	r2, r10
	str	r0, [sp, #24]
	mov	r0, #10
	ldr	r4, [r7, #48]
	ldr	r9, [r7, #24]
	ldr	r8, [r7, #32]
	ldr	r11, [r7, #36]
	str	r0, [sp]
	mov	r0, r6
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r9
	bl	"runtime::write_write_type"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_6
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	cmp	r4, #0
	bmi	.LBB44_200
	mov	r7, #0
	str	r4, [sp, #20]
.LBB44_120:
	cmp	r4, r7
	beq	.LBB44_189
	ldr	r1, [sp, #24]
	sub	r0, r7, #1
	cmn	r0, #-2147483646
	ldr	r4, [r1, r7, lsl #3]!
	ldr	r9, [r1, #4]
	bhi	.LBB44_123
	ldr	r3, .LCPI44_2
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_123:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	str	r9, [sp]
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_8
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, [r8, r7, lsl #2]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_write_type"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_9
	mov	r0, #3
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r0, [r11, r7, lsl #2]
	mov	r1, r5
	mov	r2, r10
	str	r0, [sp]
	mov	r0, #0
	str	r0, [sp, #4]
	mov	r0, r6
	bl	"runtime::write_u64"
	ldr	r4, [sp, #20]
	add	r7, r7, #1
	tst	r0, #1
	beq	.LBB44_187
	b	.LBB44_120
.LBB44_128:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #98
	bl	"runtime::write_byte"
	b	.LBB44_64
.LBB44_129:
	mov	r0, #6
	ldr	r3, .LCPI44_38
	b	.LBB44_175
.LBB44_130:
	mov	r0, #7
	ldr	r3, .LCPI44_57
	b	.LBB44_132
.LBB44_131:
	mov	r0, #4
	ldr	r3, .LCPI44_58
.LBB44_132:
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
.LBB44_133:
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, #2
	cmp	r0, r4, lsr #8
	beq	.LBB44_173
	lsr	r0, r4, #8
	cmp	r0, #1
	bne	.LBB44_188
.LBB44_136:
	mov	r0, #2
	ldr	r3, .LCPI44_48
	b	.LBB44_175
.LBB44_137:
	mov	r3, #105
	tst	r4, #255
	moveq	r3, #117
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r0, [r7]
	mov	r2, r10
	lsl	r0, r0, #3
	asr	r1, r0, #31
	stm	sp, {r0, r1}
	mov	r0, r6
	mov	r1, r5
	bl	"runtime::write_u64"
	b	.LBB44_133
.LBB44_139:
	ldr	r3, .LCPI44_19
	mov	r0, #6
	b	.LBB44_141
.LBB44_140:
	mov	r0, #13
	ldr	r3, .LCPI44_21
.LBB44_141:
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
.LBB44_142:
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r8
	b	.LBB44_185
.LBB44_144:
	ldr	r3, .LCPI44_22
	mov	r1, r5
	ldr	r8, [r0, #28]
	mov	r0, #7
	ldr	r11, [r7, #24]
	mov	r2, r10
	ldr	r9, [r7, #28]
	str	r0, [sp]
	mov	r0, r6
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	and	r4, r4, #255
	tst	r4, #1
	beq	.LBB44_147
	ldr	r3, .LCPI44_23
	mov	r0, #8
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_147:
	tst	r4, #2
	beq	.LBB44_149
	ldr	r3, .LCPI44_24
	mov	r0, #11
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_149:
	tst	r4, #4
	beq	.LBB44_151
	ldr	r3, .LCPI44_25
	mov	r0, #13
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_151:
	tst	r4, #16
	beq	.LBB44_153
	ldr	r3, .LCPI44_26
	mov	r0, #8
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_153:
	tst	r4, #8
	bne	.LBB44_194
.LBB44_154:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #123
	bl	"runtime::write_byte"
	tst	r0, #1
	beq	.LBB44_187
	cmp	r8, #0
	bmi	.LBB44_202
	mov	r4, r9
	mov	r7, #0
	str	r9, [sp, #24]
.LBB44_157:
	cmp	r8, r7
	beq	.LBB44_189
	mov	r1, r4
	mov	r9, r8
	ldr	r4, [r1, r7, lsl #3]!
	sub	r0, r7, #1
	cmn	r0, #-2147483646
	ldr	r8, [r1, #4]
	bhi	.LBB44_160
	ldr	r3, .LCPI44_2
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
.LBB44_160:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r4
	str	r8, [sp]
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_8
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	ldr	r4, [sp, #24]
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, [r11, r7, lsl #2]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_write_type"
	add	r7, r7, #1
	tst	r0, #1
	mov	r8, r9
	beq	.LBB44_187
	b	.LBB44_157
.LBB44_163:
	ldr	r0, [sp, #12]
	cmp	r0, #1
	beq	.LBB44_188
	mov	r0, #1
	ldr	r3, .LCPI44_31
	b	.LBB44_175
.LBB44_165:
	ldr	r3, .LCPI44_33
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	b	.LBB44_180
.LBB44_166:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r11
	bl	"runtime::write_encoded_rune"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_11
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, #255
	ldr	r1, [sp, #16]
	orr	r0, r0, #65280
	mov	r2, r10
	and	r0, r0, r4, lsl #8
	and	r1, r1, #255
	orr	r0, r0, r7, lsl #16
	orr	r3, r0, r1
	mov	r0, r6
	mov	r1, r5
	bl	"runtime::write_encoded_rune"
	b	.LBB44_91
.LBB44_169:
	ldr	r0, [sp, #24]
	mov	r1, r5
	str	r0, [sp, #4]
	mov	r0, r6
	mov	r2, r10
	mov	r9, r4
	str	r11, [sp]
	bl	"runtime::write_i64"
	ldr	r4, [sp, #16]
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_11
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, #255
	and	r1, r4, #255
	orr	r0, r0, #65280
	mov	r2, r10
	and	r0, r0, r9, lsl #8
	orr	r0, r0, r7, lsl #16
	orr	r0, r0, r1
	mov	r1, r5
	stm	sp, {r0, r8}
	mov	r0, r6
	bl	"runtime::write_i64"
	b	.LBB44_91
.LBB44_172:
	mov	r0, #2
.LBB44_173:
	ldr	r3, .LCPI44_49
	b	.LBB44_175
.LBB44_174:
	mov	r0, #1
	ldr	r3, .LCPI44_14
.LBB44_175:
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	b	.LBB44_186
	.p2align	2
.LCPI44_62:
	.long	".Lcsbs$POC-Example$11c"
	.p2align	2
.LCPI44_63:
	.long	".Lcsbs$POC-Example$136"
	.p2align	2
.LCPI44_64:
	.long	".Lcsbs$POC-Example$134"
	.p2align	2
.LBB44_179:
	ldr	r3, .LCPI44_31
	mov	r0, #1
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	ldr	r7, [sp, #24]
.LBB44_180:
	tst	r0, #1
	beq	.LBB44_187
	cmp	r7, #0
	beq	.LBB44_188
	ldr	r3, .LCPI44_34
	mov	r0, #4
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
.LBB44_183:
	tst	r0, #1
	beq	.LBB44_187
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, r7
.LBB44_185:
	bl	"runtime::write_write_type"
.LBB44_186:
	tst	r0, #1
	movne	r0, #1
.LBB44_187:
	add	sp, sp, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB44_188:
	mov	r0, #1
	b	.LBB44_187
.LBB44_189:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	mov	r3, #125
.LBB44_190:
	bl	"runtime::write_byte"
	b	.LBB44_186
	.p2align	2
.LCPI44_65:
	.long	".Lcsbs$POC-Example$12c"
	.p2align	2
.LCPI44_66:
	.long	".Lcsbs$POC-Example$123"
	.p2align	2
.LCPI44_67:
	.long	".Lcsbs$POC-Example$12e"
	.p2align	2
.LBB44_194:
	ldr	r3, .LCPI44_16
	mov	r0, #7
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r0, [r7, #4]
	mov	r2, r10
	asr	r1, r0, #31
	stm	sp, {r0, r1}
	mov	r0, r6
	mov	r1, r5
	bl	"runtime::write_u64"
	tst	r0, #1
	beq	.LBB44_187
	ldr	r3, .LCPI44_17
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r10
	bl	"runtime::write_string"
	tst	r0, #1
	bne	.LBB44_154
	b	.LBB44_187
	.p2align	2
.LCPI44_68:
	.long	".Lcsbs$POC-Example$130"
	.p2align	2
.LBB44_198:
	ldr	r0, [sp, #20]
	mov	r2, #9
	str	r0, [sp]
	orr	r2, r2, #768
	str	r0, [sp, #4]
	mov	r1, #49
	ldr	r0, .LCPI44_7
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB44_199:
	mov	r0, #247
	add	r1, r4, #24
	orr	r0, r0, #512
	bl	"runtime::type_assertion_check2_contextless.handle_error-0"
.LBB44_200:
	str	r4, [sp]
	mov	r2, #138
	ldr	r0, .LCPI44_7
.LBB44_201:
	orr	r2, r2, #768
	mov	r1, #49
	mov	r3, #28
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB44_202:
	ldr	r0, .LCPI44_7
	mov	r2, #78
	str	r8, [sp]
	b	.LBB44_201
	.p2align	2
.LCPI44_69:
	.long	".Lcsbs$POC-Example$129"
	.p2align	2
.LCPI44_70:
	.long	".Lcsbs$POC-Example$12d"
	.p2align	2
.LCPI44_0:
	.long	".Lcsbs$POC-Example$14d"
.LCPI44_1:
	.long	".Lcsbs$POC-Example$14e"
.LCPI44_2:
	.long	".Lcsbs$POC-Example$130"
.LCPI44_3:
	.long	".Lcsbs$POC-Example$14f"
.LCPI44_4:
	.long	".Lcsbs$POC-Example$14c"
.LCPI44_5:
	.long	".Lcsbs$POC-Example$14a"
.LCPI44_6:
	.long	".Lcsbs$POC-Example$146"
.LCPI44_7:
	.long	".Lcsbs$POC-Example$113"
.LCPI44_8:
	.long	".Lcsbs$POC-Example$133"
.LCPI44_9:
	.long	".Lcsbs$POC-Example$14b"
.LCPI44_10:
	.long	".Lcsbs$POC-Example$147"
.LCPI44_11:
	.long	".Lcsbs$POC-Example$148"
.LCPI44_12:
	.long	".Lcsbs$POC-Example$149"
.LCPI44_13:
	.long	".Lcsbs$POC-Example$145"
.LCPI44_14:
	.long	".Lcsbs$POC-Example$144"
.LCPI44_15:
	.long	".Lcsbs$POC-Example$142"
.LCPI44_16:
	.long	".Lcsbs$POC-Example$140"
.LCPI44_17:
	.long	".Lcsbs$POC-Example$141"
.LCPI44_18:
	.long	".Lcsbs$POC-Example$143"
.LCPI44_19:
	.long	".Lcsbs$POC-Example$139"
.LCPI44_20:
	.long	".Lcsbs$POC-Example$138"
.LCPI44_21:
	.long	".Lcsbs$POC-Example$13a"
.LCPI44_22:
	.long	".Lcsbs$POC-Example$13b"
.LCPI44_23:
	.long	".Lcsbs$POC-Example$13c"
.LCPI44_24:
	.long	".Lcsbs$POC-Example$13d"
.LCPI44_25:
	.long	".Lcsbs$POC-Example$13e"
.LCPI44_26:
	.long	".Lcsbs$POC-Example$13f"
.LCPI44_27:
	.long	".Lcsbs$POC-Example$137"
.LCPI44_29:
	.long	".Lcsbs$POC-Example$135"
.LCPI44_31:
	.long	".Lcsbs$POC-Example$131"
.LCPI44_33:
	.long	".Lcsbs$POC-Example$12f"
.LCPI44_34:
	.long	".Lcsbs$POC-Example$132"
.LCPI44_37:
	.long	".Lcsbs$POC-Example$12b"
.LCPI44_38:
	.long	".Lcsbs$POC-Example$12a"
.LCPI44_40:
	.long	".Lcsbs$POC-Example$128"
.LCPI44_41:
	.long	747444013
.LCPI44_42:
	.long	1593006517
.LCPI44_43:
	.long	".Lcsbs$POC-Example$127"
.LCPI44_44:
	.long	".Lcsbs$POC-Example$125"
.LCPI44_45:
	.long	".Lcsbs$POC-Example$126"
.LCPI44_46:
	.long	".Lcsbs$POC-Example$124"
.LCPI44_48:
	.long	".Lcsbs$POC-Example$120"
.LCPI44_49:
	.long	".Lcsbs$POC-Example$121"
.LCPI44_50:
	.long	".Lcsbs$POC-Example$122"
.LCPI44_51:
	.long	2698242406
.LCPI44_52:
	.long	426601705
.LCPI44_53:
	.long	2428448026
.LCPI44_54:
	.long	2660435127
.LCPI44_55:
	.long	675385718
.LCPI44_56:
	.long	2524010688
.LCPI44_57:
	.long	".Lcsbs$POC-Example$11f"
.LCPI44_58:
	.long	".Lcsbs$POC-Example$11e"
.LCPI44_59:
	.long	".Lcsbs$POC-Example$11d"
.Lfunc_end44:
	.size	"runtime::write_write_type", .Lfunc_end44-"runtime::write_write_type"
	.cantunwind
	.fnend

	.p2align	2
	.type	"reflect::write_typeid_writer",%function
	.code	32
"reflect::write_typeid_writer":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, sp, #28
	mov	r6, #73
	ldr	r11, [sp, #64]
	ldr	r8, [sp, #68]
	orr	r6, r6, #256
	str	r2, [sp, #12]
	mov	r9, r1
	mov	r10, r0
	mov	r0, r11
	mov	r1, r8
	mov	r2, r6
	mov	r3, #0
	mov	r7, #0
	bl	__aeabi_uldivmod
	ldr	r0, .LCPI45_0
	mov	r12, #0
	b	.LBB45_2
.LBB45_1:
	adds	r1, r2, #1
	adc	r3, r3, #0
	subs	r2, r1, r6
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r1
	adds	r1, r7, #1
	adc	r5, r12, #0
	subs	r7, r7, #328
	sbcs	r7, r12, #0
	mov	r7, r1
	mov	r12, r5
	bhs	.LBB45_4
.LBB45_2:
	ldr	r4, [r0, r2, lsl #2]
	cmp	r4, #0
	beq	.LBB45_1
	ldr	r1, [r4, #20]
	ldr	lr, [r4, #16]
	eor	r1, r1, r8
	eor	r5, lr, r11
	orrs	r1, r5, r1
	bne	.LBB45_1
	b	.LBB45_5
.LBB45_4:
	ldr	r4, .LCPI45_1
.LBB45_5:
	mov	r0, #0
	ldr	r2, [sp, #12]
	str	r0, [sp, #20]
	mov	r1, r9
	str	r0, [sp, #16]
	mov	r3, r4
	ldr	r0, [sp, #72]
	str	r0, [sp]
	ldr	r0, [sp, #76]
	str	r0, [sp, #4]
	add	r0, sp, #16
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #16]
	ldr	r1, [sp, #20]
	stm	r10, {r0, r1}
	add	sp, sp, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI45_0:
	.long	.L__$type_info_data
.LCPI45_1:
	.long	".L__$ti-0"
.Lfunc_end45:
	.size	"reflect::write_typeid_writer", .Lfunc_end45-"reflect::write_typeid_writer"
	.fnend

	.p2align	2
	.type	"runtime::string_eq",%function
	.code	32
"runtime::string_eq":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, sp, #20
	mov	r5, r0
	mov	r0, #0
	cmp	r1, r3
	bne	.LBB46_2
	cmp	r1, #0
	mov	r0, #1
	cmpne	r5, r2
	bne	.LBB46_3
.LBB46_2:
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB46_3:
	mov	r4, #0
	cmp	r1, #8
	blo	.LBB46_12
	bics	r7, r1, #15
	beq	.LBB46_9
	sub	r3, r7, #1
	mov	r12, #0
	bic	r3, r3, #15
	str	r1, [sp, #4]
	add	r0, r3, #16
	str	r0, [sp]
	str	r2, [sp, #16]
	str	r5, [sp, #12]
	str	r7, [sp, #8]
.LBB46_6:
	mov	r6, r2
	mov	r4, r5
	ldrb	r2, [r4, r12]!
	ldrb	r1, [r6, r12]!
	ldrb	r3, [r4, #15]
	ldrb	r7, [r6, #15]
	ldrb	r8, [r4, #14]
	subs	r3, r3, r7
	ldrb	r7, [r6, #14]
	movne	r3, #1
	ldrb	lr, [r4, #12]
	subs	r7, r8, r7
	ldrb	r5, [r4, #10]
	movne	r7, #1
	orr	r8, r7, r3, lsl #1
	ldrb	r7, [r6, #13]
	ldrb	r3, [r4, #13]
	ldrb	r11, [r6, #3]
	subs	r3, r3, r7
	ldrb	r7, [r6, #12]
	movne	r3, #1
	ldrb	r9, [r4, #1]
	subs	r7, lr, r7
	ldrb	r10, [r4, #2]
	movne	r7, #1
	orr	r3, r7, r3, lsl #1
	orr	lr, r3, r8, lsl #2
	ldrb	r7, [r6, #11]
	ldrb	r3, [r4, #11]
	ldrb	r0, [r4, #3]
	subs	r3, r3, r7
	ldrb	r7, [r6, #10]
	movne	r3, #1
	subs	r5, r5, r7
	ldrb	r7, [r4, #9]
	movne	r5, #1
	orr	r8, r5, r3, lsl #1
	ldrb	r5, [r6, #9]
	ldrb	r3, [r4, #8]
	subs	r5, r7, r5
	ldrb	r7, [r6, #8]
	movne	r5, #1
	subs	r3, r3, r7
	ldrb	r7, [r4, #6]
	movne	r3, #1
	orr	r3, r3, r5, lsl #1
	ldrb	r5, [r4, #7]
	orr	r3, r3, r8, lsl #2
	ldrb	r8, [r6, #1]
	orr	lr, r3, lr, lsl #4
	ldrb	r3, [r6, #7]
	subs	r3, r5, r3
	ldrb	r5, [r6, #6]
	movne	r3, #1
	subs	r5, r7, r5
	ldrb	r7, [r4, #5]
	movne	r5, #1
	orr	r3, r5, r3, lsl #1
	ldrb	r5, [r6, #5]
	ldrb	r4, [r4, #4]
	subs	r5, r7, r5
	ldrb	r7, [r6, #2]
	ldrb	r6, [r6, #4]
	movne	r5, #1
	subs	r4, r4, r6
	movne	r4, #1
	subs	r0, r0, r11
	orr	r4, r4, r5, lsl #1
	movne	r0, #1
	orr	r3, r4, r3, lsl #2
	subs	r4, r10, r7
	movne	r4, #1
	subs	r1, r2, r1
	movne	r1, #1
	subs	r2, r9, r8
	movne	r2, #1
	orr	r0, r4, r0, lsl #1
	orr	r1, r1, r2, lsl #1
	orr	r0, r1, r0, lsl #2
	mov	r1, #255
	orr	r0, r0, r3, lsl #4
	orr	r1, r1, #65280
	and	r0, r0, #255
	orr	r0, r0, lr, lsl #8
	tst	r0, r1
	bne	.LBB46_16
	ldr	r7, [sp, #8]
	add	r12, r12, #16
	ldr	r2, [sp, #16]
	ldr	r5, [sp, #12]
	cmp	r12, r7
	blo	.LBB46_6
	ldr	r1, [sp, #4]
	mov	r0, #1
	ldr	r4, [sp]
.LBB46_9:
	sub	r3, r1, r4
	bic	r7, r3, #3
	cmp	r4, r7
	bhs	.LBB46_12
.LBB46_10:
	ldr	r3, [r2, r4]
	ldr	r6, [r5, r4]
	cmp	r6, r3
	bne	.LBB46_16
	add	r4, r4, #4
	cmp	r4, r7
	blo	.LBB46_10
.LBB46_12:
	cmp	r1, r4
	bls	.LBB46_2
	sub	r1, r1, r4
	add	r2, r2, r4
	add	r3, r5, r4
.LBB46_14:
	ldrb	r6, [r2], #1
	ldrb	r7, [r3], #1
	cmp	r7, r6
	bne	.LBB46_16
	subs	r1, r1, #1
	bne	.LBB46_14
	b	.LBB46_2
.LBB46_16:
	mov	r0, #0
	b	.LBB46_2
.Lfunc_end46:
	.size	"runtime::string_eq", .Lfunc_end46-"runtime::string_eq"
	.cantunwind
	.fnend

	.p2align	2
	.type	"reflect::write_type_writer",%function
	.code	32
"reflect::write_type_writer":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#428
	sub	sp, sp, #428
	ldr	r6, [sp, #468]
	mov	r12, r2
	str	r0, [sp, #60]
	mov	r0, #0
	cmp	r3, #0
	str	r0, [sp, #400]
	beq	.LBB47_6
	add	r0, r3, #16
	str	r1, [sp, #56]
	ldr	r1, [r0, #48]
	ldr	r2, [r0, #52]
	subs	r1, r1, #1
	sbc	r2, r2, #0
	rsbs	r7, r1, #26
	rscs	r2, r2, #0
	blo	.LBB47_223
	adr	r2, .LJTI47_0
	str	r12, [sp, #52]
	ldr	pc, [r2, r1, lsl #2]
	.p2align	2
.LJTI47_0:
	.long	.LBB47_4
	.long	.LBB47_50
	.long	.LBB47_36
	.long	.LBB47_41
	.long	.LBB47_18
	.long	.LBB47_73
	.long	.LBB47_86
	.long	.LBB47_47
	.long	.LBB47_108
	.long	.LBB47_27
	.long	.LBB47_103
	.long	.LBB47_15
	.long	.LBB47_21
	.long	.LBB47_81
	.long	.LBB47_11
	.long	.LBB47_38
	.long	.LBB47_8
	.long	.LBB47_55
	.long	.LBB47_94
	.long	.LBB47_135
	.long	.LBB47_68
	.long	.LBB47_76
	.long	.LBB47_116
	.long	.LBB47_147
	.long	.LBB47_32
	.long	.LBB47_29
	.long	.LBB47_166
.LBB47_4:
	ldr	r4, [sp, #56]
	cmp	r4, #0
	beq	.LBB47_265
	ldr	r7, [r3, #24]
	mov	r1, #0
	ldr	r0, [r3, #28]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r1, [sp, #416]
	mov	r3, r7
	str	r1, [sp, #412]
	str	r1, [sp, #408]
	str	r1, [sp, #8]
	str	r1, [sp, #12]
	str	r1, [sp, #16]
	mov	r1, r12
	str	r6, [sp, #20]
	b	.LBB47_112
.LBB47_6:
	cmp	r1, #0
	beq	.LBB47_265
	str	r0, [sp, #416]
	mov	r4, r1
	str	r0, [sp, #412]
	mov	r1, r12
	str	r0, [sp, #408]
	mov	r2, #4
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	ldr	r3, .LCPI47_69
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	b	.LBB47_266
.LBB47_8:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r7, [r3, #24]
	mov	r0, #2
	ldr	r3, .LCPI47_70
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #408
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	stm	sp, {r0, r6}
	add	r0, sp, #264
	mov	r3, r7
	str	r4, [sp, #268]
	str	r4, [sp, #264]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #268]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_11:
	ldrb	r0, [r3, #56]
	ldr	r8, [r3, #24]
	ldr	r7, [r3, #28]
	cmp	r0, #0
	ldr	r5, [sp, #56]
	beq	.LBB47_208
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r3, .LCPI47_71
	str	r0, [sp, #416]
	mov	r1, r12
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #7
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r1
	ldr	r12, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	b	.LBB47_209
.LBB47_15:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r7, [r3, #24]
	mov	r0, #3
	ldr	r3, .LCPI47_72
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #408
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	stm	sp, {r0, r6}
	add	r0, sp, #344
	mov	r3, r7
	str	r4, [sp, #348]
	str	r4, [sp, #344]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #348]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_18:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r7, .LCPI47_73
	str	r0, [sp, #416]
	mov	r4, r3
	str	r0, [sp, #412]
	mov	r1, r12
	str	r0, [sp, #408]
	mov	r2, #4
	str	r0, [sp, #8]
	mov	r3, r7
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #7
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r0, [r4]
	add	r1, sp, #400
	str	r1, [sp, #8]
	ldr	r1, [sp, #56]
	lsl	r0, r0, #3
	str	r7, [sp, #12]
	asr	r3, r0, #31
	stm	sp, {r0, r3}
	add	r0, sp, #376
	bl	"io::write_i64"
	ldr	r0, [sp, #380]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_21:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r0, [r3, #28]
	mov	r1, r12
	str	r0, [sp, #48]
	mov	r0, #0
	ldr	r4, [r3, #24]
	mov	r2, #4
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #4
	ldr	r3, .LCPI47_74
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	cmp	r4, #0
	beq	.LBB47_275
	ldr	r0, [r4, #64]
	ldr	r2, [r4, #68]
	ldr	r5, [sp, #56]
	eor	r0, r0, #18
	orrs	r0, r0, r2
	bne	.LBB47_307
	mov	r0, #1
	ldr	r3, .LCPI47_75
	ldr	r9, [r4, #24]
	mov	r10, #0
	ldr	r4, [r4, #28]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r10, [sp, #416]
	str	r10, [sp, #412]
	str	r10, [sp, #408]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	bic	r8, r4, r4, asr #31
	add	r11, sp, #328
	mov	r4, #0
	b	.LBB47_182
.LBB47_27:
	ldr	r4, [sp, #56]
	cmp	r4, #0
	beq	.LBB47_265
	mov	r0, #0
	str	r6, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #6
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_76
	b	.LBB47_110
.LBB47_29:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r7, [r3, #24]
	mov	r0, #6
	ldr	r3, .LCPI47_77
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #408
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	stm	sp, {r0, r6}
	add	r0, sp, #336
	mov	r3, r7
	str	r4, [sp, #340]
	str	r4, [sp, #336]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #340]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_32:
	ldr	r10, [r0, #24]
	ldr	r0, [r0, #28]
	ldr	r8, [r3, #24]
	ldr	r7, [r3, #36]
	and	r0, r0, #255
	ldr	r4, [sp, #56]
	cmp	r0, #1
	bne	.LBB47_187
	cmp	r4, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r3, .LCPI47_78
	str	r0, [sp, #416]
	mov	r1, r12
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #11
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r1
	ldr	r12, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r4, [sp, #56]
	b	.LBB47_188
.LBB47_36:
	ldr	r4, [sp, #56]
	cmp	r4, #0
	beq	.LBB47_265
	mov	r0, #0
	str	r6, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #4
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_79
	b	.LBB47_110
.LBB47_38:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r7, [r3, #24]
	mov	r0, #9
	ldr	r3, .LCPI47_80
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #408
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	stm	sp, {r0, r6}
	add	r0, sp, #272
	mov	r3, r7
	str	r4, [sp, #276]
	str	r4, [sp, #272]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #276]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_41:
	ldr	r5, [sp, #56]
	mov	r0, #102
	ldrb	r8, [r3, #24]
	cmp	r5, #0
	strb	r0, [sp, #407]
	beq	.LBB47_265
	mov	r0, #0
	add	lr, sp, #256
	str	r0, [sp, #416]
	add	r7, lr, #151
	str	r0, [sp, #412]
	mov	r4, r3
	str	r0, [sp, #408]
	mov	r1, r12
	str	r0, [sp, #8]
	mov	r2, #4
	str	r0, [sp, #12]
	mov	r3, r7
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r0, [r4]
	add	r1, sp, #400
	ldr	r4, [sp, #56]
	str	r1, [sp, #8]
	lsl	r0, r0, #3
	str	r7, [sp, #12]
	asr	r3, r0, #31
	stm	sp, {r0, r3}
	add	r0, sp, #384
	mov	r1, r4
	bl	"io::write_i64"
	ldr	r0, [sp, #388]
	cmp	r0, #0
	bne	.LBB47_304
	cmp	r8, #2
	beq	.LBB47_277
	ldr	r1, [sp, #52]
	cmp	r8, #1
	ldr	r2, [sp, #468]
	bne	.LBB47_223
	mov	r0, #0
	ldr	r3, .LCPI47_81
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #408
	str	r2, [sp, #20]
	b	.LBB47_92
.LBB47_47:
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	ldr	r2, .LCPI47_82
	ldr	r5, [sp, #56]
	eor	r0, r0, r2
	ldr	r2, .LCPI47_83
	eor	r1, r1, r2
	orrs	r0, r1, r0
	bne	.LBB47_195
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	str	r6, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #4
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_84
	b	.LBB47_220
.LBB47_50:
	ldr	r1, [r0]
	ldr	r7, .LCPI47_85
	ldr	r0, [r0, #4]
	ldr	r2, .LCPI47_86
	eor	r7, r1, r7
	ldr	r5, [sp, #56]
	eor	r2, r0, r2
	orrs	r2, r7, r2
	beq	.LBB47_218
	ldr	r2, .LCPI47_87
	ldr	r7, .LCPI47_88
	eor	r2, r1, r2
	eor	r7, r0, r7
	orrs	r2, r2, r7
	beq	.LBB47_216
	ldr	r2, .LCPI47_89
	eor	r1, r1, r2
	ldr	r2, .LCPI47_90
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB47_226
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r3, .LCPI47_91
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	b	.LBB47_220
.LBB47_55:
	ldr	r0, [r3, #24]
	ldr	r7, [r3, #36]
	ldr	r4, [sp, #56]
	str	r0, [sp, #36]
	cmp	r7, #1
	ldr	r0, [r3, #28]
	str	r0, [sp, #40]
	ldr	r0, [r3, #32]
	str	r0, [sp, #44]
	bne	.LBB47_198
	rsbs	r0, r4, #0
	adc	r0, r4, r0
	str	r0, [sp, #48]
.LBB47_57:
	mov	r9, #0
	mov	r6, #0
	bic	r0, r7, r7, asr #31
	str	r7, [sp, #32]
	str	r0, [sp, #56]
	b	.LBB47_59
.LBB47_58:
	add	r0, sp, #400
	mov	r2, r3
	stm	sp, {r0, r7}
	add	r0, sp, #312
	mov	r1, r4
	mov	r3, r10
	str	r9, [sp, #316]
	str	r9, [sp, #312]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #316]
	add	r6, r6, #1
	cmp	r0, #0
	bne	.LBB47_304
.LBB47_59:
	ldr	r0, [sp, #56]
	cmp	r0, r6
	beq	.LBB47_272
	ldr	r1, [sp, #44]
	sub	r0, r6, #1
	ldr	r3, [sp, #52]
	cmn	r0, #-2147483646
	ldr	r7, [sp, #468]
	ldr	r8, [r1, r6, lsl #3]!
	ldr	r11, [r1, #4]
	bhi	.LBB47_63
	ldr	r0, [sp, #48]
	cmp	r0, #0
	bne	.LBB47_274
	mov	r0, #2
	mov	r1, r3
	ldr	r3, .LCPI47_92
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r9, [sp, #416]
	str	r9, [sp, #412]
	str	r9, [sp, #408]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r1
	ldr	r3, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_63:
	ldr	r0, [sp, #40]
	cmp	r0, r6
	beq	.LBB47_306
	ldr	r0, [sp, #36]
	cmp	r11, #1
	ldr	r10, [r0, r6, lsl #2]
	blt	.LBB47_58
	ldr	r0, [sp, #48]
	cmp	r0, #0
	bne	.LBB47_274
	add	r0, sp, #408
	mov	r1, r3
	mov	r2, #4
	mov	r3, r8
	str	r9, [sp, #416]
	str	r9, [sp, #412]
	str	r9, [sp, #408]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r7, [sp, #20]
	str	r11, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	mov	r0, #2
	ldr	r3, .LCPI47_93
	str	r0, [sp]
	add	r0, sp, #408
	mov	r2, #4
	str	r9, [sp, #416]
	str	r9, [sp, #412]
	str	r9, [sp, #408]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r1
	ldr	r3, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	beq	.LBB47_58
	b	.LBB47_266
.LBB47_68:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r7, [r3, #24]
	mov	r0, #5
	ldr	r9, [r3, #28]
	mov	r4, #0
	ldr	r8, [r3, #32]
	mov	r1, r12
	ldr	r3, .LCPI47_94
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	add	r0, sp, #400
	stm	sp, {r0, r6}
	add	r0, sp, #176
	mov	r3, r7
	mov	r1, r5
	str	r4, [sp, #180]
	str	r4, [sp, #176]
	mov	r4, r2
	mov	r7, r6
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #180]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #2
	ldr	r3, .LCPI47_95
	str	r0, [sp]
	add	r0, sp, #408
	mov	r6, #0
	mov	r1, r4
	mov	r2, #4
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	bic	r8, r8, r8, asr #31
	mov	r1, r4
	mov	r11, #0
	b	.LBB47_203
.LBB47_73:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r7, .LCPI47_96
	str	r0, [sp, #416]
	mov	r4, r3
	str	r0, [sp, #412]
	mov	r1, r12
	str	r0, [sp, #408]
	mov	r2, #4
	str	r0, [sp, #8]
	mov	r3, r7
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #10
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r0, [r4]
	add	r1, sp, #400
	str	r1, [sp, #8]
	ldr	r1, [sp, #56]
	lsl	r0, r0, #3
	str	r7, [sp, #12]
	asr	r3, r0, #31
	stm	sp, {r0, r3}
	add	r0, sp, #368
	bl	"io::write_i64"
	ldr	r0, [sp, #372]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_76:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r7, [r3, #24]
	mov	r0, #4
	ldr	r8, [r3, #28]
	mov	r4, #0
	ldr	r3, .LCPI47_97
	mov	r1, r12
	str	r0, [sp]
	add	r0, sp, #408
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	add	r0, sp, #400
	stm	sp, {r0, r6}
	add	r0, sp, #256
	mov	r3, r7
	mov	r1, r5
	str	r4, [sp, #260]
	str	r4, [sp, #256]
	mov	r4, r2
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #260]
	cmp	r0, #0
	bne	.LBB47_304
	add	r7, sp, #400
	mov	r0, r5
	mov	r1, r4
	mov	r2, #93
	mov	r3, r7
	str	r6, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	mov	r1, r5
	str	r0, [sp, #252]
	mov	r2, r4
	str	r0, [sp, #248]
	add	r0, sp, #248
	mov	r3, r8
	str	r7, [sp]
	str	r6, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #252]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_81:
	ldr	r4, [sp, #56]
	cmp	r4, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r9, [r3, #24]
	ldr	r7, [r3, #32]
	mov	r1, r12
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	ldr	r3, .LCPI47_98
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r3, [sp, #468]
	add	r5, r2, r1
	ldr	r4, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	asr	r0, r7, #31
	add	r8, sp, #400
	stmib	sp, {r0, r8}
	add	r0, sp, #304
	mov	r1, r5
	mov	r2, r4
	str	r7, [sp]
	mov	r7, r3
	str	r3, [sp, #12]
	bl	"io::write_i64"
	ldr	r0, [sp, #308]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #1
	ldr	r3, .LCPI47_99
	str	r0, [sp]
	add	r0, sp, #408
	mov	r6, #0
	mov	r1, r4
	mov	r2, #4
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r1, [sp, #56]
	add	r0, sp, #296
	mov	r2, r4
	mov	r3, r9
	str	r6, [sp, #300]
	str	r6, [sp, #296]
	str	r8, [sp]
	str	r7, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #300]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_86:
	ldrh	r4, [r3, #24]
	ldr	r5, [sp, #56]
	tst	r4, #255
	beq	.LBB47_88
	add	r3, sp, #400
	mov	r0, r5
	mov	r1, r12
	mov	r2, #99
	str	r6, [sp]
	bl	"io::write_byte"
	ldr	r6, [sp, #468]
	cmp	r0, #0
	ldr	r12, [sp, #52]
	bne	.LBB47_304
.LBB47_88:
	cmp	r5, #0
	beq	.LBB47_274
	mov	r0, #0
	ldr	r3, .LCPI47_100
	str	r0, [sp, #416]
	mov	r1, r12
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #6
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	bic	r0, r4, #255
	cmp	r0, #256
	bne	.LBB47_223
	mov	r0, #0
	str	r7, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_101
.LBB47_92:
	mov	r2, #4
	ldr	r4, [sp, #56]
	b	.LBB47_112
	.p2align	2
.LCPI47_69:
	.long	".Lcsbs$POC-Example$11c"
	.p2align	2
.LBB47_94:
	ldr	r4, [r0, #32]
	mov	r1, #255
	ldr	r7, [r3, #56]
	ldr	r5, [sp, #56]
	and	r1, r1, r4, lsr #8
	cmp	r1, #3
	beq	.LBB47_236
	cmp	r1, #2
	beq	.LBB47_232
	cmp	r1, #1
	bne	.LBB47_245
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r8, [r0, #36]
	mov	r0, #5
	ldr	r3, .LCPI47_102
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #408
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	asr	r0, r8, #31
	stmib	sp, {r0, r4, r6}
	add	r0, sp, #240
	mov	r4, r2
	mov	r1, r5
	str	r8, [sp]
	bl	"io::write_i64"
	ldr	r0, [sp, #244]
	cmp	r0, #0
	bne	.LBB47_304
	add	r8, sp, #400
	mov	r0, r5
	mov	r1, r4
	mov	r2, #93
	mov	r3, r8
	str	r6, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	mov	r1, r5
	str	r0, [sp, #236]
	mov	r2, r4
	str	r0, [sp, #232]
	add	r0, sp, #232
	mov	r3, r7
	str	r8, [sp]
	str	r6, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r5, [sp, #400]
	ldr	r0, [sp, #236]
	b	.LBB47_266
	.p2align	2
.LCPI47_70:
	.long	".Lcsbs$POC-Example$136"
	.p2align	2
.LBB47_103:
	ldr	r7, [r3, #24]
	ldr	r5, [sp, #56]
	cmp	r7, #0
	beq	.LBB47_213
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #1
	ldr	r3, .LCPI47_103
	str	r0, [sp]
	add	r0, sp, #408
	mov	r4, #0
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	stm	sp, {r0, r6}
	add	r0, sp, #352
	mov	r3, r7
	str	r4, [sp, #356]
	str	r4, [sp, #352]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #356]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
	.p2align	2
.LCPI47_71:
	.long	".Lcsbs$POC-Example$134"
	.p2align	2
.LBB47_108:
	ldr	r4, [sp, #56]
	cmp	r4, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r3, .LCPI47_104
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
.LBB47_110:
	mov	r1, r12
.LBB47_111:
	mov	r2, #4
.LBB47_112:
	mov	lr, pc
	mov	pc, r4
	b	.LBB47_222
	.p2align	2
.LCPI47_72:
	.long	".Lcsbs$POC-Example$12c"
	.p2align	2
.LCPI47_73:
	.long	".Lcsbs$POC-Example$123"
	.p2align	2
.LCPI47_74:
	.long	".Lcsbs$POC-Example$12e"
	.p2align	2
.LBB47_116:
	ldr	r4, [sp, #56]
	cmp	r4, #0
	beq	.LBB47_265
	ldr	r10, [r0, #24]
	mov	r1, r12
	ldr	r11, [r0, #28]
	mov	r2, #4
	ldr	r8, [r0, #32]
	ldr	r9, [r0, #36]
	ldrb	r0, [r3, #32]
	str	r0, [sp, #48]
	ldr	r0, [r3, #28]
	str	r0, [sp, #44]
	mov	r0, #0
	ldr	r7, [r3, #24]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #8
	ldr	r3, .LCPI47_105
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	lr, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	lsr	r0, r8, #16
	ldr	r5, [sp, #56]
	orr	r0, r0, r9, lsl #16
	str	r0, [sp, #40]
	lsr	r0, r8, #8
	cmp	r7, #0
	orr	r0, r0, r9, lsl #24
	str	r0, [sp, #36]
	beq	.LBB47_286
	ldr	r0, [r7, #64]
	ldr	r1, [r7, #68]
	eor	r3, r0, #21
	orrs	r3, r3, r1
	beq	.LBB47_124
	eor	r3, r0, #1
	orrs	r12, r3, r1
	bne	.LBB47_281
	mov	r3, r7
.LBB47_122:
	ldr	r3, [r3, #32]
	ldr	r4, [r3, #64]
	ldr	r5, [r3, #68]
	eor	r6, r4, #1
	orrs	r6, r6, r5
	beq	.LBB47_122
	eor	r3, r4, #21
	orrs	r3, r3, r5
	ldr	r5, [sp, #56]
	bne	.LBB47_279
.LBB47_124:
	mov	r0, #0
	mov	r1, r5
	str	r0, [sp, #172]
	mov	r3, r7
	str	r0, [sp, #168]
	add	r0, sp, #400
	stm	sp, {r0, lr}
	add	r0, sp, #168
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #172]
	cmp	r0, #0
	bne	.LBB47_304
.LBB47_125:
	ldr	r0, [sp, #48]
	cmp	r0, #0
	beq	.LBB47_128
	ldr	r6, [sp, #52]
	mov	r0, #2
	ldr	r3, .LCPI47_106
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r7, [sp, #468]
	mov	r1, r6
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r3, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	add	r0, sp, #400
	ldr	r3, [sp, #44]
	mov	r2, r6
	stm	sp, {r0, r7}
	add	r0, sp, #128
	mov	r1, r5
	str	r4, [sp, #132]
	str	r4, [sp, #128]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #132]
	cmp	r0, #0
	bne	.LBB47_304
.LBB47_128:
	ldr	r1, [sp, #52]
	add	r3, sp, #400
	ldr	r0, [sp, #468]
	mov	r2, #93
	str	r0, [sp]
	mov	r0, r5
	b	.LBB47_303
	.p2align	2
.LCPI47_75:
	.long	".Lcsbs$POC-Example$160"
	.p2align	2
.LCPI47_76:
	.long	".Lcsbs$POC-Example$129"
	.p2align	2
.LCPI47_77:
	.long	".Lcsbs$POC-Example$12d"
	.p2align	2
.LCPI47_78:
	.long	".Lcsbs$POC-Example$14d"
	.p2align	2
.LCPI47_79:
	.long	".Lcsbs$POC-Example$122"
	.p2align	2
.LCPI47_80:
	.long	".Lcsbs$POC-Example$135"
	.p2align	2
.LBB47_135:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r4, [r0, #28]
	mov	r0, #0
	ldr	r7, .LCPI47_107
	mov	r1, r12
	ldr	r8, [r3, #24]
	mov	r2, #4
	ldr	r10, [r3, #28]
	mov	r9, r3
	str	r0, [sp, #416]
	mov	r3, r7
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #6
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	tst	r4, #65280
	beq	.LBB47_139
	mov	r0, #0
	ldr	r3, .LCPI47_108
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #8
	ldr	r5, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_139:
	tst	r4, #16711680
	beq	.LBB47_141
	mov	r0, #0
	ldr	r3, .LCPI47_109
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #12
	ldr	r5, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_141:
	tst	r4, #255
	beq	.LBB47_145
	mov	r0, #0
	ldr	r3, .LCPI47_110
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #7
	ldr	r4, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r1
	ldr	r4, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r0, [r9, #4]
	add	r1, sp, #400
	ldr	r5, [sp, #56]
	str	r1, [sp, #8]
	asr	r2, r0, #31
	stm	sp, {r0, r2}
	add	r0, sp, #192
	mov	r1, r5
	mov	r2, r4
	str	r7, [sp, #12]
	bl	"io::write_i64"
	ldr	r0, [sp, #196]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	ldr	r3, .LCPI47_111
	str	r0, [sp, #416]
	mov	r1, r4
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	mov	r1, r4
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_145:
	ldr	r4, [sp, #56]
	add	r11, sp, #400
	mov	r2, #123
	str	r7, [sp]
	mov	r3, r11
	mov	r0, r4
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB47_304
	bic	r9, r10, r10, asr #31
	mov	r6, #0
	mov	r10, #0
	b	.LBB47_269
.LBB47_147:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r7, [r3, #24]
	ldr	r4, [r3, #32]
	mov	r1, r12
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #6
	ldr	r3, .LCPI47_112
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	add	r0, sp, #400
	asr	r1, r4, #31
	str	r0, [sp, #8]
	add	r0, sp, #96
	str	r1, [sp, #4]
	mov	r1, r5
	str	r4, [sp]
	str	r6, [sp, #12]
	mov	r4, r2
	bl	"io::write_i64"
	ldr	r0, [sp, #100]
	cmp	r0, #0
	bne	.LBB47_304
	add	r8, sp, #400
	mov	r0, r5
	mov	r1, r4
	mov	r2, #93
	mov	r3, r8
	str	r6, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	mov	r1, r5
	str	r0, [sp, #92]
	mov	r2, r4
	str	r0, [sp, #88]
	add	r0, sp, #88
	mov	r3, r7
	str	r8, [sp]
	str	r6, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #92]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
	.p2align	2
.LCPI47_81:
	.long	".Lcsbs$POC-Example$120"
	.p2align	2
.LCPI47_82:
	.long	747444013
	.p2align	2
.LCPI47_83:
	.long	1593006517
	.p2align	2
.LCPI47_84:
	.long	".Lcsbs$POC-Example$127"
	.p2align	2
.LCPI47_85:
	.long	426601705
	.p2align	2
.LCPI47_86:
	.long	2698242406
	.p2align	2
.LCPI47_87:
	.long	2428448026
	.p2align	2
.LCPI47_88:
	.long	2660435127
	.p2align	2
.LCPI47_89:
	.long	675385718
	.p2align	2
.LCPI47_90:
	.long	2524010688
	.p2align	2
.LCPI47_91:
	.long	".Lcsbs$POC-Example$11d"
	.p2align	2
.LCPI47_92:
	.long	".Lcsbs$POC-Example$130"
	.p2align	2
.LCPI47_93:
	.long	".Lcsbs$POC-Example$133"
	.p2align	2
.LCPI47_94:
	.long	".Lcsbs$POC-Example$145"
	.p2align	2
.LBB47_166:
	ldr	r5, [sp, #56]
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r0, [r3, #32]
	mov	r4, #0
	str	r0, [sp, #48]
	mov	r1, r12
	ldr	r0, [r3, #36]
	mov	r2, #4
	str	r0, [sp, #44]
	mov	r0, #10
	ldr	r10, [r3, #48]
	ldr	r7, [r3, #24]
	ldr	r11, [r3, #28]
	ldr	r3, .LCPI47_113
	str	r0, [sp]
	add	r0, sp, #408
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	add	r0, sp, #400
	stm	sp, {r0, r6}
	add	r0, sp, #120
	mov	r3, r7
	mov	r1, r5
	str	r4, [sp, #124]
	str	r4, [sp, #120]
	mov	r4, r2
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #124]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	ldr	r3, .LCPI47_95
	str	r0, [sp, #416]
	mov	r1, r4
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	cmp	r10, #0
	bmi	.LBB47_308
	ldr	r4, [sp, #56]
	mov	r7, #0
	mov	r9, #0
.LBB47_172:
	cmp	r10, r9
	beq	.LBB47_301
	mov	r1, r11
	ldr	r6, [sp, #468]
	ldr	r8, [r1, r9, lsl #3]!
	sub	r0, r9, #1
	cmn	r0, #-2147483646
	ldr	r4, [r1, #4]
	ldr	r1, [sp, #52]
	bhi	.LBB47_175
	mov	r0, #2
	ldr	r3, .LCPI47_92
	ldr	r5, [sp, #56]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #416]
	str	r7, [sp, #412]
	str	r7, [sp, #408]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_175:
	str	r4, [sp]
	add	r0, sp, #408
	ldr	r4, [sp, #56]
	mov	r2, #4
	mov	r3, r8
	str	r7, [sp, #416]
	str	r7, [sp, #412]
	str	r7, [sp, #408]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	mov	r0, #2
	ldr	r3, .LCPI47_93
	ldr	r4, [sp, #56]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #416]
	str	r7, [sp, #412]
	str	r7, [sp, #408]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r1
	ldr	r4, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r0, [sp, #48]
	mov	r2, r4
	ldr	r5, [sp, #56]
	str	r7, [sp, #116]
	ldr	r3, [r0, r9, lsl #2]
	add	r0, sp, #400
	stm	sp, {r0, r6}
	add	r0, sp, #112
	mov	r1, r5
	str	r7, [sp, #112]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #116]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #3
	ldr	r3, .LCPI47_114
	str	r0, [sp]
	add	r0, sp, #408
	mov	r1, r4
	mov	r2, #4
	str	r7, [sp, #416]
	str	r7, [sp, #412]
	str	r7, [sp, #408]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r0, [sp, #44]
	mov	r2, r4
	ldr	r4, [sp, #56]
	ldr	r0, [r0, r9, lsl #2]
	mov	r1, r4
	stm	sp, {r0, r7}
	add	r0, sp, #400
	str	r0, [sp, #8]
	add	r0, sp, #104
	str	r6, [sp, #12]
	bl	"io::write_u64"
	ldr	r0, [sp, #108]
	add	r9, r9, #1
	cmp	r0, #0
	beq	.LBB47_172
	b	.LBB47_304
	.p2align	2
.LCPI47_95:
	.long	".Lcsbs$POC-Example$146"
	.p2align	2
.LBB47_181:
	ldr	r5, [sp, #56]
	add	r0, sp, #400
	stm	sp, {r0, r6}
	mov	r0, r11
	mov	r3, r7
	mov	r1, r5
	str	r10, [sp, #332]
	str	r10, [sp, #328]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #332]
	add	r4, r4, #1
	cmp	r0, #0
	bne	.LBB47_304
.LBB47_182:
	cmp	r8, r4
	beq	.LBB47_290
	ldr	r7, [r9, r4, lsl #2]
	sub	r0, r4, #1
	ldr	r2, [sp, #52]
	ldr	r6, [sp, #468]
	cmn	r0, #-2147483646
	bhi	.LBB47_181
	mov	r0, #2
	ldr	r3, .LCPI47_92
	ldr	r5, [sp, #56]
	mov	r1, r2
	str	r0, [sp]
	add	r0, sp, #408
	mov	r2, #4
	str	r10, [sp, #416]
	str	r10, [sp, #412]
	str	r10, [sp, #408]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	beq	.LBB47_181
	b	.LBB47_266
	.p2align	2
.LCPI47_96:
	.long	".Lcsbs$POC-Example$124"
	.p2align	2
.LCPI47_97:
	.long	".Lcsbs$POC-Example$137"
	.p2align	2
.LBB47_187:
	cmp	r4, #0
	beq	.LBB47_265
.LBB47_188:
	mov	r0, #0
	ldr	r3, .LCPI47_115
	str	r0, [sp, #416]
	mov	r1, r12
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #7
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r1
	ldr	r4, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	asr	r0, r7, #31
	add	r9, sp, #400
	stmib	sp, {r0, r9}
	add	r0, sp, #80
	mov	r1, r5
	mov	r2, r4
	str	r7, [sp]
	str	r6, [sp, #12]
	bl	"io::write_i64"
	ldr	r0, [sp, #84]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	ldr	r3, .LCPI47_92
	str	r0, [sp, #416]
	mov	r1, r4
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	asr	r0, r10, #31
	stmib	sp, {r0, r9}
	add	r0, sp, #72
	mov	r2, r4
	mov	r1, r5
	mov	r7, r6
	str	r6, [sp, #12]
	mov	r6, r4
	str	r10, [sp]
	bl	"io::write_i64"
	ldr	r0, [sp, #76]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #1
	ldr	r3, .LCPI47_99
	str	r0, [sp]
	add	r0, sp, #408
	mov	r4, #0
	mov	r1, r6
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r1, [sp, #56]
	add	r0, sp, #64
	mov	r2, r6
	mov	r3, r8
	str	r4, [sp, #68]
	str	r4, [sp, #64]
	str	r9, [sp]
	str	r7, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #68]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
	.p2align	2
.LCPI47_98:
	.long	".Lcsbs$POC-Example$161"
	.p2align	2
.LBB47_195:
	add	r8, sp, #400
	mov	r4, r3
	mov	r0, r5
	mov	r1, r12
	mov	r2, #98
	mov	r3, r8
	str	r6, [sp]
	mov	r7, r12
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB47_304
	ldr	r0, [r4]
	mov	r2, r7
	str	r6, [sp, #12]
	lsl	r0, r0, #3
	asr	r1, r0, #31
	stm	sp, {r0, r1, r8}
	add	r0, sp, #360
	mov	r1, r5
	bl	"io::write_i64"
	ldr	r0, [sp, #364]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
	.p2align	2
.LCPI47_99:
	.long	".Lcsbs$POC-Example$14f"
	.p2align	2
.LBB47_198:
	cmp	r4, #0
	beq	.LBB47_265
	mov	r0, #0
	ldr	r3, .LCPI47_75
	str	r0, [sp, #48]
	mov	r0, #1
	mov	r1, #0
	str	r0, [sp]
	add	r0, sp, #408
	str	r1, [sp, #416]
	str	r1, [sp, #412]
	mov	r2, #4
	str	r1, [sp, #408]
	str	r1, [sp, #8]
	str	r1, [sp, #12]
	str	r1, [sp, #16]
	mov	r1, r12
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r4, [sp, #56]
	b	.LBB47_57
	.p2align	2
.LCPI47_100:
	.long	".Lcsbs$POC-Example$125"
	.p2align	2
.LBB47_202:
	str	r4, [sp]
	add	r0, sp, #408
	ldr	r4, [sp, #56]
	mov	r2, #4
	mov	r3, r10
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	add	r11, r11, #1
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_203:
	cmp	r8, r11
	beq	.LBB47_295
	mov	r2, r9
	sub	r0, r11, #1
	ldr	r10, [r2, r11, lsl #3]!
	cmn	r0, #-2147483646
	ldr	r4, [r2, #4]
	bhi	.LBB47_202
	mov	r0, #2
	ldr	r3, .LCPI47_2
	ldr	r5, [sp, #56]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	beq	.LBB47_202
	b	.LBB47_266
	.p2align	2
.LCPI47_101:
	.long	".Lcsbs$POC-Example$126"
	.p2align	2
.LCPI47_102:
	.long	".Lcsbs$POC-Example$138"
	.p2align	2
.LBB47_208:
	cmp	r5, #0
	beq	.LBB47_265
.LBB47_209:
	mov	r0, #1
	ldr	r3, .LCPI47_32
	str	r0, [sp]
	add	r0, sp, #408
	mov	r4, #0
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r5, [sp, #56]
	add	r0, sp, #288
	mov	r3, r7
	add	r9, sp, #400
	str	r4, [sp, #292]
	mov	r7, r2
	mov	r1, r5
	str	r4, [sp, #288]
	str	r9, [sp]
	mov	r4, r6
	str	r6, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #292]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #1
	ldr	r3, .LCPI47_3
	str	r0, [sp]
	add	r0, sp, #408
	mov	r6, #0
	mov	r1, r7
	mov	r2, #4
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r1, [sp, #56]
	add	r0, sp, #280
	mov	r2, r7
	mov	r3, r8
	str	r6, [sp, #284]
	str	r6, [sp, #280]
	str	r9, [sp]
	str	r4, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #284]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_213:
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	str	r6, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #6
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_45
	b	.LBB47_220
	.p2align	2
.LCPI47_103:
	.long	".Lcsbs$POC-Example$12b"
	.p2align	2
.LBB47_216:
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	str	r6, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #7
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_64
	b	.LBB47_220
.LBB47_218:
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #0
	str	r6, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #4
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_65
.LBB47_220:
	mov	r1, r12
.LBB47_221:
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
.LBB47_222:
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
.LBB47_223:
	mov	r0, #0
	ldr	r5, [sp, #400]
	b	.LBB47_266
	.p2align	2
.LCPI47_104:
	.long	".Lcsbs$POC-Example$128"
	.p2align	2
.LCPI47_105:
	.long	".Lcsbs$POC-Example$147"
	.p2align	2
.LBB47_226:
	ldrh	r4, [r3, #24]
	add	r8, sp, #400
	mov	r2, #105
	mov	r9, r3
	tst	r4, #255
	mov	r0, r5
	moveq	r2, #117
	mov	r1, r12
	mov	r3, r8
	str	r6, [sp]
	mov	r7, r12
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB47_304
	ldr	r0, [r9]
	mov	r2, r7
	str	r6, [sp, #12]
	lsl	r0, r0, #3
	asr	r1, r0, #31
	stm	sp, {r0, r1, r8}
	add	r0, sp, #392
	mov	r1, r5
	bl	"io::write_i64"
	ldr	r0, [sp, #396]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #2
	cmp	r0, r4, lsr #8
	beq	.LBB47_296
	ldr	r1, [sp, #52]
	lsr	r0, r4, #8
	ldr	r2, [sp, #468]
	cmp	r0, #1
	bne	.LBB47_223
	ldr	r4, [sp, #56]
	cmp	r4, #0
	beq	.LBB47_274
	mov	r0, #0
	str	r2, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_55
	b	.LBB47_111
.LBB47_232:
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #6
	ldr	r3, .LCPI47_20
	str	r0, [sp]
	add	r0, sp, #408
	mov	r4, #0
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	stm	sp, {r0, r6}
	add	r0, sp, #224
	mov	r3, r7
	str	r4, [sp, #228]
	str	r4, [sp, #224]
	bl	"reflect::write_type_writer"
	ldr	r5, [sp, #400]
	ldr	r0, [sp, #228]
	b	.LBB47_266
	.p2align	2
.LCPI47_106:
	.long	".Lcsbs$POC-Example$149"
	.p2align	2
.LBB47_236:
	cmp	r5, #0
	beq	.LBB47_265
	mov	r0, #13
	ldr	r3, .LCPI47_22
	str	r0, [sp]
	add	r0, sp, #408
	mov	r4, #0
	mov	r1, r12
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	stm	sp, {r0, r6}
	add	r0, sp, #216
	mov	r3, r7
	str	r4, [sp, #220]
	str	r4, [sp, #216]
	bl	"reflect::write_type_writer"
	ldr	r5, [sp, #400]
	ldr	r0, [sp, #220]
	b	.LBB47_266
	.p2align	2
.LCPI47_107:
	.long	".Lcsbs$POC-Example$142"
	.p2align	2
.LCPI47_108:
	.long	".Lcsbs$POC-Example$143"
	.p2align	2
.LCPI47_109:
	.long	".Lcsbs$POC-Example$162"
	.p2align	2
.LCPI47_110:
	.long	".Lcsbs$POC-Example$140"
	.p2align	2
.LCPI47_111:
	.long	".Lcsbs$POC-Example$141"
	.p2align	2
.LCPI47_112:
	.long	".Lcsbs$POC-Example$14c"
	.p2align	2
.LBB47_245:
	cmp	r5, #0
	beq	.LBB47_265
	ldr	r10, [r0, #28]
	mov	r1, r12
	ldr	r0, [r3, #24]
	mov	r2, #4
	str	r0, [sp, #48]
	mov	r0, #0
	ldr	r7, .LCPI47_23
	mov	r9, r3
	ldr	r8, [r3, #28]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	mov	r3, r7
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #7
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	and	r7, r4, #255
	tst	r7, #1
	beq	.LBB47_249
	mov	r0, #0
	ldr	r3, .LCPI47_24
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #8
	ldr	r4, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_249:
	tst	r7, #2
	beq	.LBB47_251
	mov	r0, #0
	ldr	r3, .LCPI47_25
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #11
	ldr	r4, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_251:
	tst	r7, #4
	beq	.LBB47_253
	mov	r0, #0
	ldr	r3, .LCPI47_26
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #13
	ldr	r4, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_253:
	tst	r7, #16
	beq	.LBB47_255
	mov	r0, #0
	ldr	r3, .LCPI47_27
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #8
	ldr	r4, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r6, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_255:
	tst	r7, #8
	bne	.LBB47_298
.LBB47_256:
	ldr	r0, [sp, #56]
	add	r3, sp, #400
	mov	r2, #123
	str	r6, [sp]
	bl	"io::write_byte"
	cmp	r0, #0
	bne	.LBB47_304
	cmp	r10, #0
	bmi	.LBB47_310
	mov	r6, #0
	mov	r9, #0
.LBB47_259:
	cmp	r10, r9
	beq	.LBB47_305
	mov	r1, r8
	ldr	r7, [sp, #468]
	ldr	r11, [r1, r9, lsl #3]!
	sub	r0, r9, #1
	cmn	r0, #-2147483646
	ldr	r4, [r1, #4]
	ldr	r1, [sp, #52]
	bhi	.LBB47_262
	mov	r0, #2
	ldr	r3, .LCPI47_2
	ldr	r5, [sp, #56]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
.LBB47_262:
	str	r4, [sp]
	add	r0, sp, #408
	ldr	r4, [sp, #56]
	mov	r2, #4
	mov	r3, r11
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r2, r3
	ldr	r1, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	mov	r0, #2
	ldr	r3, .LCPI47_8
	ldr	r4, [sp, #56]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r0, [sp, #48]
	ldr	r1, [sp, #56]
	str	r6, [sp, #204]
	ldr	r3, [r0, r9, lsl #2]
	add	r0, sp, #400
	stm	sp, {r0, r7}
	add	r0, sp, #200
	str	r6, [sp, #200]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #204]
	add	r9, r9, #1
	cmp	r0, #0
	beq	.LBB47_259
	b	.LBB47_304
.LBB47_265:
	mvn	r0, #0
	mov	r5, #0
.LBB47_266:
	ldr	r3, [sp, #60]
	ldr	r2, [sp, #464]
	str	r0, [r3, #4]
	ldr	r0, [r2]
	str	r5, [r3]
	add	r0, r0, r5
	str	r0, [r2]
	add	sp, sp, #428
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI47_113:
	.long	".Lcsbs$POC-Example$14a"
	.p2align	2
.LBB47_268:
	str	r4, [sp, #4]
	add	r0, sp, #184
	ldr	r4, [sp, #56]
	mov	r3, r7
	str	r6, [sp, #188]
	str	r6, [sp, #184]
	mov	r1, r4
	str	r11, [sp]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #188]
	add	r10, r10, #1
	cmp	r0, #0
	bne	.LBB47_304
.LBB47_269:
	cmp	r9, r10
	beq	.LBB47_302
	ldr	r7, [r8, r10, lsl #2]
	sub	r0, r10, #1
	ldr	r2, [sp, #52]
	ldr	r4, [sp, #468]
	cmn	r0, #-2147483646
	bhi	.LBB47_268
	str	r4, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI47_2
	mov	r1, r2
	ldr	r4, [sp, #56]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #416]
	str	r6, [sp, #412]
	str	r6, [sp, #408]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r4, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	beq	.LBB47_268
	b	.LBB47_266
.LBB47_272:
	ldr	r0, [sp, #32]
	ldr	r1, [sp, #52]
	ldr	r2, [sp, #468]
	cmp	r0, #1
	beq	.LBB47_223
	ldr	r0, [sp, #48]
	cmp	r0, #0
	beq	.LBB47_276
.LBB47_274:
	mvn	r0, #0
	ldr	r5, [sp, #400]
	b	.LBB47_266
.LBB47_275:
	mov	r0, #0
	ldr	r3, .LCPI47_40
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	ldr	r4, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #468]
	ldr	r1, [sp, #52]
	b	.LBB47_291
.LBB47_276:
	mov	r0, #0
	str	r2, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_34
	b	.LBB47_111
.LBB47_277:
	mov	r0, #0
	ldr	r3, .LCPI47_56
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #468]
	str	r0, [sp, #20]
	mov	r0, #2
.LBB47_278:
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r1, [sp, #52]
	b	.LBB47_111
.LBB47_279:
	cmp	r12, #0
	bne	.LBB47_281
.LBB47_280:
	ldr	r7, [r7, #32]
	ldr	r0, [r7, #64]
	ldr	r1, [r7, #68]
	eor	r3, r0, #1
	orrs	r3, r3, r1
	beq	.LBB47_280
.LBB47_281:
	eor	r0, r0, #3
	orrs	r0, r0, r1
	bne	.LBB47_286
	mov	r0, #1
	add	r4, sp, #400
	stm	sp, {r0, r4, lr}
	add	r0, sp, #160
	mov	r1, r5
	mov	r3, r10
	mov	r6, r2
	mov	r7, lr
	bl	"io::write_encoded_rune"
	ldr	r0, [sp, #164]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	ldr	r3, .LCPI47_12
	str	r0, [sp, #416]
	mov	r1, r6
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	mov	r0, #1
	ldr	r1, [sp, #36]
	stm	sp, {r0, r4, r7}
	mov	r0, #255
	orr	r0, r0, #65280
	and	r0, r0, r1, lsl #8
	ldr	r1, [sp, #40]
	ldr	r5, [sp, #56]
	mov	r2, r6
	orr	r0, r0, r1, lsl #16
	and	r1, r8, #255
	orr	r3, r0, r1
	add	r0, sp, #152
	mov	r1, r5
	bl	"io::write_encoded_rune"
	ldr	r0, [sp, #156]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_125
	.p2align	2
.LCPI47_114:
	.long	".Lcsbs$POC-Example$14b"
	.p2align	2
.LBB47_286:
	add	r0, sp, #144
	mov	r1, r5
	add	r4, sp, #400
	stm	sp, {r10, r11}
	mov	r6, r2
	str	r4, [sp, #8]
	mov	r7, lr
	str	lr, [sp, #12]
	bl	"io::write_i64"
	ldr	r0, [sp, #148]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	ldr	r3, .LCPI47_12
	str	r0, [sp, #416]
	mov	r1, r6
	str	r0, [sp, #412]
	mov	r2, #4
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	str	r0, [sp]
	add	r0, sp, #408
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r1
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r1, [sp, #36]
	mov	r0, #255
	orr	r0, r0, #65280
	ldr	r5, [sp, #56]
	mov	r2, r6
	str	r4, [sp, #8]
	and	r0, r0, r1, lsl #8
	ldr	r1, [sp, #40]
	str	r7, [sp, #12]
	orr	r0, r0, r1, lsl #16
	and	r1, r8, #255
	orr	r0, r0, r1
	mov	r1, r5
	stm	sp, {r0, r9}
	add	r0, sp, #136
	bl	"io::write_i64"
	ldr	r0, [sp, #140]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_125
	.p2align	2
.LCPI47_115:
	.long	".Lcsbs$POC-Example$14e"
	.p2align	2
.LBB47_290:
	mov	r0, #0
	ldr	r4, [sp, #52]
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	mov	r1, r4
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	ldr	r3, .LCPI47_34
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r7, [sp, #468]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	mov	r1, r4
.LBB47_291:
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r3
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	ldr	r0, [sp, #48]
	cmp	r0, #0
	beq	.LBB47_223
	mov	r0, #4
	ldr	r3, .LCPI47_41
	ldr	r5, [sp, #56]
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #408
	mov	r2, #4
	str	r4, [sp, #416]
	str	r4, [sp, #412]
	str	r4, [sp, #408]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	add	r0, sp, #400
	ldr	r1, [sp, #56]
	ldr	r3, [sp, #48]
	stm	sp, {r0, r7}
	add	r0, sp, #320
	str	r4, [sp, #324]
	str	r4, [sp, #320]
	bl	"reflect::write_type_writer"
	ldr	r0, [sp, #324]
	cmp	r0, #0
	bne	.LBB47_304
	b	.LBB47_223
.LBB47_295:
	ldr	r0, [sp, #56]
	add	r3, sp, #400
	mov	r2, #125
	str	r7, [sp]
	b	.LBB47_303
.LBB47_296:
	ldr	r1, [sp, #52]
	cmp	r5, #0
	ldr	r2, [sp, #468]
	beq	.LBB47_274
	mov	r0, #0
	str	r2, [sp, #20]
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r3, .LCPI47_56
	b	.LBB47_221
.LBB47_298:
	mov	r0, #0
	ldr	r3, .LCPI47_18
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #7
	ldr	r4, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r1, [sp, #408]
	ldr	r3, [sp, #400]
	ldr	r0, [sp, #416]
	ldr	r7, [sp, #468]
	add	r5, r3, r1
	ldr	r2, [sp, #52]
	cmp	r0, #0
	str	r5, [sp, #400]
	bne	.LBB47_266
	ldr	r0, [r9, #4]
	add	r1, sp, #400
	str	r1, [sp, #8]
	ldr	r1, [sp, #56]
	asr	r3, r0, #31
	stm	sp, {r0, r3}
	add	r0, sp, #208
	str	r7, [sp, #12]
	bl	"io::write_i64"
	ldr	r0, [sp, #212]
	cmp	r0, #0
	bne	.LBB47_304
	mov	r0, #0
	ldr	r4, [sp, #52]
	str	r0, [sp, #416]
	mov	r2, #4
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	mov	r1, r4
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	ldr	r3, .LCPI47_19
	ldr	r5, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #408
	ldr	r6, [sp, #468]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #408]
	mov	r1, r4
	ldr	r2, [sp, #400]
	ldr	r0, [sp, #416]
	add	r5, r2, r3
	str	r5, [sp, #400]
	cmp	r0, #0
	bne	.LBB47_266
	b	.LBB47_256
.LBB47_301:
	mov	r0, #0
	ldr	r3, .LCPI47_10
	str	r0, [sp, #416]
	str	r0, [sp, #412]
	str	r0, [sp, #408]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #468]
	str	r0, [sp, #20]
	mov	r0, #1
	b	.LBB47_278
.LBB47_302:
	ldr	r1, [sp, #52]
	add	r3, sp, #400
	ldr	r0, [sp, #468]
	mov	r2, #125
	str	r0, [sp]
	mov	r0, r4
.LBB47_303:
	bl	"io::write_byte"
	cmp	r0, #0
	beq	.LBB47_223
.LBB47_304:
	ldr	r5, [sp, #400]
	b	.LBB47_266
.LBB47_305:
	ldr	r0, [sp, #468]
	add	r3, sp, #400
	str	r0, [sp]
	mov	r2, #125
	ldr	r0, [sp, #56]
	ldr	r1, [sp, #52]
	b	.LBB47_303
.LBB47_306:
	ldr	r0, [sp, #40]
	mov	r2, #118
	str	r0, [sp]
	orr	r2, r2, #512
	str	r0, [sp, #4]
	mov	r1, #49
	ldr	r0, .LCPI47_7
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB47_307:
	add	r0, r4, #24
	str	r0, [sp, #16]
	ldr	r0, .LCPI47_36
	mov	r1, #49
	str	r0, [sp, #12]
	mov	r2, #608
	ldr	r0, .LCPI47_37
	mov	r3, #9
	str	r0, [sp, #8]
	ldr	r0, .LCPI47_38
	str	r0, [sp, #4]
	ldr	r0, .LCPI47_39
	str	r0, [sp]
	ldr	r0, .LCPI47_7
	str	r7, [sp, #20]
	bl	"runtime::type_assertion_check2_with_context.handle_error-0"
.LBB47_308:
	mov	r2, #246
	ldr	r0, .LCPI47_7
	orr	r2, r2, #512
	mov	r1, #49
.LBB47_309:
	mov	r3, #28
	str	r10, [sp]
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB47_310:
	ldr	r0, .LCPI47_7
	mov	r1, #49
	mov	r2, #700
	b	.LBB47_309
	.p2align	2
.LCPI47_2:
	.long	".Lcsbs$POC-Example$130"
.LCPI47_3:
	.long	".Lcsbs$POC-Example$14f"
.LCPI47_7:
	.long	".Lcsbs$POC-Example$15f"
.LCPI47_8:
	.long	".Lcsbs$POC-Example$133"
.LCPI47_10:
	.long	".Lcsbs$POC-Example$144"
.LCPI47_12:
	.long	".Lcsbs$POC-Example$163"
.LCPI47_18:
	.long	".Lcsbs$POC-Example$140"
.LCPI47_19:
	.long	".Lcsbs$POC-Example$141"
.LCPI47_20:
	.long	".Lcsbs$POC-Example$139"
.LCPI47_22:
	.long	".Lcsbs$POC-Example$13a"
.LCPI47_23:
	.long	".Lcsbs$POC-Example$13b"
.LCPI47_24:
	.long	".Lcsbs$POC-Example$13c"
.LCPI47_25:
	.long	".Lcsbs$POC-Example$13d"
.LCPI47_26:
	.long	".Lcsbs$POC-Example$13e"
.LCPI47_27:
	.long	".Lcsbs$POC-Example$13f"
.LCPI47_32:
	.long	".Lcsbs$POC-Example$161"
.LCPI47_34:
	.long	".Lcsbs$POC-Example$131"
.LCPI47_36:
	.long	4135237592
.LCPI47_37:
	.long	3661965974
.LCPI47_38:
	.long	761227683
.LCPI47_39:
	.long	396265691
.LCPI47_40:
	.long	".Lcsbs$POC-Example$12f"
.LCPI47_41:
	.long	".Lcsbs$POC-Example$132"
.LCPI47_45:
	.long	".Lcsbs$POC-Example$12a"
.LCPI47_55:
	.long	".Lcsbs$POC-Example$120"
.LCPI47_56:
	.long	".Lcsbs$POC-Example$121"
.LCPI47_64:
	.long	".Lcsbs$POC-Example$11f"
.LCPI47_65:
	.long	".Lcsbs$POC-Example$11e"
.Lfunc_end47:
	.size	"reflect::write_type_writer", .Lfunc_end47-"reflect::write_type_writer"
	.fnend

	.p2align	2
	.type	"runtime::default_logger_proc",%function
	.code	32
"runtime::default_logger_proc":
	.fnstart
	mov	pc, lr
.Lfunc_end48:
	.size	"runtime::default_logger_proc", .Lfunc_end48-"runtime::default_logger_proc"
	.cantunwind
	.fnend

	.p2align	2
	.type	"reflect::struct_tag_lookup",%function
	.code	32
"reflect::struct_tag_lookup":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#60
	sub	sp, sp, #60
	cmp	r2, #0
	str	r3, [sp, #56]
	beq	.LBB49_43
	mov	r7, r1
	ldr	r1, [sp, #96]
	bic	r1, r1, #15
	str	r1, [sp, #32]
	sub	r3, r1, #1
	bic	r3, r3, #15
	add	r1, r3, #16
	str	r1, [sp, #16]
.LBB49_2:
	mov	r6, #0
	cmp	r2, #1
	blt	.LBB49_6
.LBB49_3:
	ldrb	r3, [r7, r6]
	cmp	r3, #32
	bne	.LBB49_6
	add	r6, r6, #1
	cmp	r2, r6
	bne	.LBB49_3
	mov	r6, r2
	b	.LBB49_7
.LBB49_6:
	cmp	r6, r2
	bgt	.LBB49_52
.LBB49_7:
	sub	r4, r2, r6
	cmp	r4, #1
	blt	.LBB49_43
	sub	r3, r6, r2
	add	r12, r7, r6
	mov	r2, #0
.LBB49_9:
	ldrb	r5, [r12, -r2]
	cmp	r5, #34
	cmpne	r5, #58
	beq	.LBB49_13
	cmp	r5, #32
	subhs	r5, r5, #127
	cmphs	r5, #33
	blo	.LBB49_13
	sub	r2, r2, #1
	cmp	r3, r2
	bne	.LBB49_9
	mov	r3, r4
	b	.LBB49_15
.LBB49_13:
	cmp	r2, #0
	beq	.LBB49_43
	rsb	r3, r2, #0
.LBB49_15:
	add	r2, r3, #1
	cmp	r4, r2
	ble	.LBB49_43
	cmp	r3, r4
	bhs	.LBB49_48
	ldrb	r5, [r12, r3]
	cmp	r5, #58
	bne	.LBB49_43
	cmp	r4, r2
	bls	.LBB49_49
	mov	r10, r12
	ldrb	r5, [r10, r2]!
	cmp	r5, #34
	bne	.LBB49_43
	cmp	r3, r4
	bgt	.LBB49_51
	cmn	r2, #1
	ble	.LBB49_50
	sub	r5, r4, r2
	cmp	r5, #2
	blt	.LBB49_43
	mov	r2, #1
	str	r7, [sp, #28]
.LBB49_24:
	cmp	r2, r5
	bhs	.LBB49_47
	ldrb	r4, [r10, r2]
	cmp	r4, #34
	beq	.LBB49_27
	cmp	r4, #92
	addeq	r2, r2, #1
	add	r2, r2, #1
	cmp	r2, r5
	blt	.LBB49_24
	b	.LBB49_43
.LBB49_27:
	str	r0, [sp, #24]
	add	r0, r2, #1
	str	r0, [sp, #20]
	ldr	r0, [sp, #96]
	cmp	r0, r3
	bne	.LBB49_42
	ldr	r0, [sp, #56]
	cmp	r0, r12
	beq	.LBB49_45
	ldr	r0, [sp, #96]
	mov	r3, #0
	cmp	r0, #8
	blo	.LBB49_38
	ldr	r0, [sp, #32]
	cmp	r0, #0
	beq	.LBB49_35
	mov	r8, #0
	str	r12, [sp, #52]
.LBB49_32:
	ldr	r11, [sp, #52]
	ldr	r3, [sp, #56]
	ldrb	r0, [r11, r8]!
	str	r0, [sp, #48]
	ldrb	r0, [r3, r8]!
	ldrb	r7, [r11, #15]
	ldrb	r4, [r3, #15]
	str	r0, [sp, #44]
	subs	r7, r4, r7
	ldrb	r4, [r11, #14]
	ldrb	r0, [r3, #14]
	movne	r7, #1
	ldrb	r9, [r3, #8]
	subs	r0, r0, r4
	ldrb	r4, [r3, #13]
	movne	r0, #1
	orr	lr, r0, r7, lsl #1
	ldrb	r7, [r11, #13]
	ldrb	r0, [r3, #12]
	subs	r7, r4, r7
	ldrb	r4, [r11, #12]
	movne	r7, #1
	ldrb	r12, [r11, #3]
	subs	r0, r0, r4
	ldrb	r4, [r3, #11]
	movne	r0, #1
	ldrb	r1, [r11, #4]
	orr	r0, r0, r7, lsl #1
	ldrb	r7, [r11, #11]
	orr	lr, r0, lr, lsl #2
	ldrb	r0, [r3, #10]
	subs	r7, r4, r7
	ldrb	r4, [r11, #10]
	movne	r7, #1
	subs	r0, r0, r4
	ldrb	r4, [r11, #9]
	movne	r0, #1
	orr	r0, r0, r7, lsl #1
	ldrb	r7, [r3, #9]
	subs	r4, r7, r4
	ldrb	r7, [r11, #8]
	movne	r4, #1
	subs	r7, r9, r7
	movne	r7, #1
	orr	r4, r7, r4, lsl #1
	orr	r0, r4, r0, lsl #2
	ldrb	r4, [r3, #7]
	orr	r0, r0, lr, lsl #4
	str	r0, [sp, #40]
	ldrb	r0, [r11, #7]
	ldrb	r7, [r3, #6]
	subs	r0, r4, r0
	ldrb	r4, [r11, #6]
	movne	r0, #1
	ldrb	lr, [r3, #2]
	subs	r4, r7, r4
	ldrb	r7, [r3, #5]
	movne	r4, #1
	orr	r9, r4, r0, lsl #1
	ldrb	r4, [r11, #5]
	ldrb	r0, [r11, #1]
	subs	r4, r7, r4
	str	r0, [sp, #36]
	ldrb	r7, [r11, #2]
	movne	r4, #1
	ldrb	r11, [r3, #1]
	ldrb	r0, [r3, #3]
	ldrb	r3, [r3, #4]
	subs	r1, r3, r1
	movne	r1, #1
	subs	r0, r0, r12
	movne	r0, #1
	subs	r3, lr, r7
	movne	r3, #1
	orr	r0, r3, r0, lsl #1
	ldr	r3, [sp, #48]
	orr	r1, r1, r4, lsl #1
	ldr	r7, [sp, #44]
	orr	r1, r1, r9, lsl #2
	ldr	r12, [sp, #52]
	subs	r3, r7, r3
	ldr	r7, [sp, #36]
	movne	r3, #1
	subs	r7, r11, r7
	movne	r7, #1
	orr	r3, r3, r7, lsl #1
	orr	r0, r3, r0, lsl #2
	orr	r0, r0, r1, lsl #4
	ldr	r1, [sp, #40]
	and	r0, r0, #255
	orr	r0, r0, r1, lsl #8
	mov	r1, #255
	orr	r1, r1, #65280
	tst	r0, r1
	bne	.LBB49_42
	ldr	r0, [sp, #32]
	add	r8, r8, #16
	cmp	r8, r0
	blo	.LBB49_32
	ldr	r3, [sp, #16]
.LBB49_35:
	ldr	r0, [sp, #96]
	sub	r0, r0, r3
	bic	r4, r0, #3
	cmp	r3, r4
	bhs	.LBB49_38
.LBB49_36:
	ldr	r1, [sp, #56]
	ldr	r0, [r12, r3]
	ldr	r1, [r1, r3]
	cmp	r1, r0
	bne	.LBB49_42
	add	r3, r3, #4
	cmp	r3, r4
	blo	.LBB49_36
.LBB49_38:
	ldr	r0, [sp, #96]
	cmp	r0, r3
	bls	.LBB49_45
	ldr	r0, [sp, #56]
	ldr	r1, [sp, #28]
	add	r4, r0, r3
	ldr	r0, [sp, #96]
	sub	r7, r0, r3
	add	r0, r3, r6
	add	r1, r1, r0
.LBB49_40:
	ldrb	r0, [r4], #1
	ldrb	r3, [r1], #1
	cmp	r0, r3
	bne	.LBB49_42
	subs	r7, r7, #1
	bne	.LBB49_40
	b	.LBB49_45
.LBB49_42:
	ldr	r0, [sp, #20]
	mov	r3, #0
	mov	r6, #0
	mov	r1, #0
	subs	r2, r5, r0
	add	r7, r10, r0
	ldr	r0, [sp, #24]
	bne	.LBB49_2
	b	.LBB49_44
.LBB49_43:
	mov	r3, #0
	mov	r6, #0
	mov	r1, #0
.LBB49_44:
	strb	r1, [r0, #8]
	stm	r0, {r3, r6}
	add	sp, sp, #60
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB49_45:
	add	r0, r2, #-2147483647
	cmp	r0, #-2147483647
	bls	.LBB49_54
	sub	r6, r2, #1
	add	r3, r10, #1
	mov	r1, #1
	ldr	r0, [sp, #24]
	b	.LBB49_44
.LBB49_47:
	ldr	r0, .LCPI49_0
	mov	r1, #51
	stm	sp, {r2, r5}
	mov	r2, #732
	mov	r3, #23
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB49_48:
	mov	r2, #213
	ldr	r0, .LCPI49_0
	orr	r2, r2, #512
	stm	sp, {r3, r4}
	mov	r1, #51
	mov	r3, #8
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB49_49:
	stm	sp, {r2, r4}
	mov	r2, #213
	orr	r2, r2, #512
	ldr	r0, .LCPI49_0
	mov	r1, #51
	mov	r3, #23
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB49_50:
	stm	sp, {r2, r4}
	mov	r2, #217
	str	r4, [sp, #8]
	ldr	r0, .LCPI49_0
	b	.LBB49_53
.LBB49_51:
	mov	r0, #0
	mov	r1, #51
	stm	sp, {r0, r3, r4}
	mov	r2, #728
	mov	r3, #19
	ldr	r0, .LCPI49_0
	bl	"runtime::slice_handle_error"
.LBB49_52:
	ldr	r0, .LCPI49_0
	str	r2, [sp, #4]
	str	r2, [sp, #8]
	mov	r2, #190
	str	r6, [sp]
.LBB49_53:
	orr	r2, r2, #512
	mov	r1, #51
	mov	r3, #8
	bl	"runtime::slice_handle_error"
.LBB49_54:
	mov	r0, #1
	mov	r1, #51
	stm	sp, {r0, r2}
	mov	r2, #235
	orr	r2, r2, #512
	ldr	r0, [sp, #20]
	mov	r3, #14
	str	r0, [sp, #8]
	ldr	r0, .LCPI49_0
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI49_0:
	.long	".Lcsbs$POC-Example$158"
.Lfunc_end49:
	.size	"reflect::struct_tag_lookup", .Lfunc_end49-"reflect::struct_tag_lookup"
	.cantunwind
	.fnend

	.section	.text.unlikely.,"ax",%progbits
	.p2align	2
	.type	"runtime::default_assertion_failure_proc",%function
	.code	32
"runtime::default_assertion_failure_proc":
	.fnstart
	.inst	0xe7ffdefe
.Lfunc_end50:
	.size	"runtime::default_assertion_failure_proc", .Lfunc_end50-"runtime::default_assertion_failure_proc"
	.cantunwind
	.fnend

	.text
	.p2align	2
	.type	"reflect::enum_string",%function
	.code	32
"reflect::enum_string":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#44
	sub	sp, sp, #44
	mov	r9, r0
	ldr	r0, [r1]
	ldr	r6, [r1, #12]
	ldr	r11, [r1, #8]
	cmp	r0, #0
	ldr	r3, [r1, #4]
	add	r1, sp, #24
	stm	r1, {r0, r3, r11}
	orrsne	r0, r11, r6
	str	r6, [sp, #36]
	bne	.LBB51_2
.LBB51_1:
	mov	r0, #0
	str	r0, [r9]
	b	.LBB51_17
.LBB51_2:
	mov	r10, #73
	mov	r8, r2
	orr	r10, r10, #256
	mov	r0, r11
	mov	r1, r6
	mov	r3, #0
	mov	r2, r10
	mov	r4, #0
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI51_0
	mov	r7, #0
	ldr	r12, .LCPI51_1
	b	.LBB51_4
.LBB51_3:
	adds	r0, r2, #1
	mov	r2, #0
	adc	r3, r3, #0
	subs	r1, r0, r10
	sbcs	r1, r3, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r4, #1
	adc	r1, r7, #0
	subs	r4, r4, #328
	sbcs	r4, r7, #0
	mov	r4, r0
	mov	r7, r1
	bhs	.LBB51_6
.LBB51_4:
	ldr	r0, [lr, r2, lsl #2]
	cmp	r0, #0
	beq	.LBB51_3
	ldr	r1, [r0, #16]
	ldr	r5, [r0, #20]
	eor	r1, r1, r11
	eor	r5, r5, r6
	orrs	r1, r1, r5
	bne	.LBB51_3
	b	.LBB51_7
.LBB51_6:
	mov	r0, r12
.LBB51_7:
	ldr	r1, [r0, #64]
	ldr	r3, [r0, #68]
	eor	r2, r1, #1
	orrs	r2, r2, r3
	bne	.LBB51_10
	mov	r2, r8
.LBB51_9:
	ldr	r0, [r0, #32]
	ldr	r1, [r0, #64]
	ldr	r3, [r0, #68]
	eor	r7, r1, #1
	orrs	r7, r7, r3
	beq	.LBB51_9
	b	.LBB51_11
.LBB51_10:
	mov	r2, r8
.LBB51_11:
	eor	r1, r1, #21
	orrs	r1, r1, r3
	bne	.LBB51_19
	ldr	r7, [r0, #28]
	add	r1, sp, #24
	ldr	r8, [r0, #32]
	mov	r5, #0
	ldr	r6, [r0, #36]
	ldr	r4, [r0, #40]
	add	r0, sp, #8
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	strb	r5, [sp, #16]
	bl	"reflect::as_i64"
	ldr	r2, [sp, #8]
	sub	r0, r7, #8
	ldr	r3, [sp, #12]
	bic	r1, r4, r4, asr #31
.LBB51_13:
	cmp	r1, r5
	beq	.LBB51_1
	ldr	r7, [r6]
	add	r0, r0, #8
	ldr	r4, [r6, #4]
	add	r6, r6, #8
	eor	r7, r7, r2
	add	r5, r5, #1
	eor	r4, r4, r3
	orrs	r7, r7, r4
	bne	.LBB51_13
	sub	r1, r5, #1
	cmp	r1, r8
	bhs	.LBB51_18
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	r1, [r9]
.LBB51_17:
	str	r0, [r9, #4]
	add	sp, sp, #44
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB51_18:
	mov	r2, #251
	ldr	r0, .LCPI51_6
	orr	r2, r2, #512
	stm	sp, {r1, r8}
	mov	r1, #51
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB51_19:
	ldr	r0, [r2, #16]
	mov	r3, #39
	ldr	r4, .LCPI51_3
	cmp	r0, #0
	str	r2, [sp, #4]
	movne	r4, r0
	ldr	r0, .LCPI51_4
	ldr	r2, .LCPI51_5
	ldr	r1, .LCPI51_2
	str	r1, [sp]
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI51_0:
	.long	.L__$type_info_data
.LCPI51_1:
	.long	".L__$ti-0"
.LCPI51_2:
	.long	".Lscl$[enum_string21545]"
.LCPI51_3:
	.long	"runtime::default_assertion_failure_proc"
.LCPI51_4:
	.long	".Lcsbs$POC-Example$17b"
.LCPI51_5:
	.long	".Lcsbs$POC-Example$16b"
.LCPI51_6:
	.long	".Lcsbs$POC-Example$158"
.Lfunc_end51:
	.size	"reflect::enum_string", .Lfunc_end51-"reflect::enum_string"
	.fnend

	.p2align	2
	.type	"runtime::_append_elem",%function
	.code	32
"runtime::_append_elem":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r6, r1
	ldr	r1, [r1, #4]
	mov	r7, r2
	ldr	r2, [r6, #8]
	mov	r4, r0
	add	r0, r1, #1
	mov	r8, r3
	mov	r5, #0
	cmp	r2, r0
	bge	.LBB52_2
	mov	r0, #8
	add	r1, r0, r2, lsl #1
	ldr	r2, .LCPI52_0
	mov	r0, r6
	mov	r3, r8
	bl	"runtime::_reserve_dynamic_array"
	ldmib	r6, {r1, r2}
	b	.LBB52_3
.LBB52_2:
	mov	r0, #0
.LBB52_3:
	sub	r2, r2, r1
	cmp	r2, #1
	blt	.LBB52_6
	ldr	r2, [r6]
	cmp	r2, #0
	beq	.LBB52_7
	ldrb	r3, [r7]
	mov	r5, #1
	strb	r3, [r2, r1]
	ldr	r1, [r6, #4]
	add	r1, r1, #1
	str	r1, [r6, #4]
.LBB52_6:
	strb	r0, [r4, #4]
	str	r5, [r4]
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.LBB52_7:
	ldr	r0, [r8, #16]
	mov	r3, #11
	ldr	r4, .LCPI52_1
	cmp	r0, #0
	ldr	r2, .LCPI52_3
	movne	r4, r0
	ldr	r0, .LCPI52_2
	ldr	r1, .LCPI52_0
	str	r1, [sp]
	mov	r1, #17
	str	r8, [sp, #4]
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI52_0:
	.long	".Lscl$[caprintf12827]"
.LCPI52_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI52_2:
	.long	".Lcsbs$POC-Example$1aa"
.LCPI52_3:
	.long	".Lcsbs$POC-Example$16d"
.Lfunc_end52:
	.size	"runtime::_append_elem", .Lfunc_end52-"runtime::_append_elem"
	.fnend

	.p2align	2
	.type	"runtime::_append_elems",%function
	.code	32
"runtime::_append_elems":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r4, r0
	mov	r7, #0
	mov	r0, #0
	cmp	r1, #0
	beq	.LBB53_8
	mov	r5, r3
	cmp	r3, #0
	ble	.LBB53_8
	mov	r6, r1
	ldmib	r1, {r0, r1}
	ldr	r8, [sp, #32]
	add	r3, r0, r5
	cmp	r1, r3
	bge	.LBB53_4
	ldr	r3, .LCPI53_0
	cmp	r5, #8
	mov	r0, r5
	mov	r7, r2
	movls	r0, #8
	add	r1, r0, r1, lsl #1
	mov	r2, r3
	mov	r0, r6
	mov	r3, r8
	bl	"runtime::_reserve_dynamic_array"
	mov	r2, r7
	mov	r7, r0
	ldmib	r6, {r0, r1}
.LBB53_4:
	sub	r1, r1, r0
	cmp	r1, r5
	movlt	r5, r1
	cmp	r1, #1
	blt	.LBB53_7
	ldr	r1, [r6]
	cmp	r1, #0
	beq	.LBB53_9
	add	r0, r1, r0
	mov	r1, r2
	mov	r2, r5
	bl	memmove
	ldr	r0, [r6, #4]
	add	r0, r0, r5
	str	r0, [r6, #4]
.LBB53_7:
	mov	r0, r5
.LBB53_8:
	strb	r7, [r4, #4]
	str	r0, [r4]
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.LBB53_9:
	ldr	r0, [r8, #16]
	mov	r3, #11
	ldr	r4, .LCPI53_1
	cmp	r0, #0
	ldr	r2, .LCPI53_3
	movne	r4, r0
	ldr	r0, .LCPI53_2
	ldr	r1, .LCPI53_0
	str	r1, [sp]
	mov	r1, #17
	str	r8, [sp, #4]
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI53_0:
	.long	".Lscl$[_builder_stream_proc5347]"
.LCPI53_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI53_2:
	.long	".Lcsbs$POC-Example$1aa"
.LCPI53_3:
	.long	".Lcsbs$POC-Example$16d"
.Lfunc_end53:
	.size	"runtime::_append_elems", .Lfunc_end53-"runtime::_append_elems"
	.fnend

	.p2align	2
	.type	"runtime::string_decode_rune",%function
	.code	32
"runtime::string_decode_rune":
	.fnstart
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r12, #253
	cmp	r2, #0
	orr	r12, r12, #65280
	ble	.LBB54_3
	ldrb	r3, [r1]
	ldr	r6, .LCPI54_0
	ldrb	r4, [r6, r3]
	sub	r6, r3, #245
	cmn	r6, #52
	bhi	.LBB54_4
	mov	r6, #253
	and	r1, r4, #1
	rsb	r2, r1, #0
	sub	r1, r1, #1
	orr	r6, r6, #65280
	and	r1, r1, r3
	and	r2, r2, r6
	mov	lr, #1
	orr	r12, r1, r2
	b	.LBB54_8
.LBB54_3:
	mov	lr, #0
	b	.LBB54_8
.LBB54_4:
	add	r5, r3, #62
	lsr	r6, r4, #4
	and	r5, r5, #255
	cmp	r5, #51
	bhs	.LBB54_18
	and	r4, r4, #7
	mov	lr, #1
	cmp	r2, r4
	blo	.LBB54_8
	cmp	r2, #1
	beq	.LBB54_19
	ldr	r4, .LCPI54_1
	add	r6, r4, r6, lsl #1
	ldrb	r4, [r1, #1]
	ldrb	r7, [r6]
	cmp	r4, r7
	ldrbhs	r6, [r6, #1]
	cmphs	r6, r4
	bhs	.LBB54_9
.LBB54_8:
	stm	r0, {r12, lr}
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r11, lr}
	mov	pc, lr
.LBB54_9:
	cmp	r5, #29
	bhi	.LBB54_11
	and	r1, r3, #31
	and	r2, r4, #63
	mov	lr, #2
	orr	r12, r2, r1, lsl #6
	b	.LBB54_8
.LBB54_11:
	cmp	r2, #2
	bls	.LBB54_22
	ldrsb	r5, [r1, #2]
	cmn	r5, #65
	bgt	.LBB54_8
	and	r6, r3, #240
	cmp	r6, #224
	bne	.LBB54_15
	and	r2, r4, #63
	and	r1, r3, #15
	mov	lr, #3
	lsl	r2, r2, #6
	orr	r1, r2, r1, lsl #12
	and	r2, r5, #63
	orr	r12, r1, r2
	b	.LBB54_8
.LBB54_15:
	cmp	r2, #3
	beq	.LBB54_23
	ldrsb	r1, [r1, #3]
	cmn	r1, #65
	bgt	.LBB54_8
	and	r2, r3, #7
	and	r3, r4, #63
	and	r1, r1, #63
	mov	lr, #4
	lsl	r3, r3, #12
	orr	r2, r3, r2, lsl #18
	and	r3, r5, #63
	orr	r2, r2, r3, lsl #6
	orr	r12, r2, r1
	b	.LBB54_8
.LBB54_18:
	mov	r0, #5
	mov	r2, #7
	str	r0, [sp, #4]
	orr	r2, r2, #768
	ldr	r0, .LCPI54_2
	mov	r1, #52
	mov	r3, #26
	str	r6, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB54_19:
	mov	r0, #1
	mov	r2, #11
.LBB54_20:
	str	r0, [sp]
	str	r0, [sp, #4]
.LBB54_21:
	ldr	r0, .LCPI54_2
	orr	r2, r2, #768
	mov	r1, #52
	mov	r3, #10
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB54_22:
	mov	r0, #2
	stm	sp, {r0, r2}
	mov	r2, #18
	b	.LBB54_21
.LBB54_23:
	mov	r0, #3
	mov	r2, #25
	b	.LBB54_20
	.p2align	2
.LCPI54_0:
	.long	"runtime::string_decode_rune-.accept_sizes-11694"
.LCPI54_1:
	.long	"runtime::string_decode_rune-.accept_ranges-12021"
.LCPI54_2:
	.long	".Lcsbs$POC-Example$11b"
.Lfunc_end54:
	.size	"runtime::string_decode_rune", .Lfunc_end54-"runtime::string_decode_rune"
	.cantunwind
	.fnend

	.p2align	2
	.type	"strings::split_iterator",%function
	.code	32
"strings::split_iterator":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#76
	sub	sp, sp, #76
	ldr	r2, [r1, #4]
	ldr	r9, [r1]
	cmp	r2, #15
	bgt	.LBB55_5
	cmp	r2, #1
	blt	.LBB55_17
	mov	r10, #0
.LBB55_3:
	ldrb	r3, [r9, r10]
	cmp	r3, #44
	beq	.LBB55_13
	add	r10, r10, #1
	cmp	r2, r10
	bne	.LBB55_3
	b	.LBB55_17
.LBB55_5:
	str	r0, [sp, #16]
	mov	r0, #1
	add	r4, r0, r2, lsr #4
	mov	r10, #0
	str	r1, [sp, #20]
	str	r2, [sp, #24]
	str	r9, [sp, #68]
.LBB55_6:
	ldrb	r2, [r9, r10]!
	ldrb	r0, [r9, #15]
	str	r0, [sp, #64]
	sub	r0, r0, #44
	ldrb	r1, [r9, #14]
	rsbs	r3, r0, #0
	str	r1, [sp, #48]
	adc	r0, r0, r3
	sub	r3, r1, #44
	rsbs	r7, r3, #0
	ldrb	r1, [r9, #13]
	adc	r3, r3, r7
	str	r1, [sp, #56]
	orr	r0, r3, r0, lsl #1
	sub	r3, r1, #44
	ldrb	r1, [r9, #12]
	rsbs	r7, r3, #0
	adc	r3, r3, r7
	ldrb	r11, [r9, #8]
	sub	r7, r1, #44
	ldrb	r8, [r9, #6]
	rsbs	r6, r7, #0
	str	r1, [sp, #28]
	adc	r7, r7, r6
	ldrb	r1, [r9, #5]
	orr	r3, r7, r3, lsl #1
	str	r1, [sp, #40]
	orr	r7, r3, r0, lsl #2
	ldrb	r0, [r9, #11]
	str	r0, [sp, #60]
	sub	r0, r0, #44
	ldrb	r12, [r9, #2]
	rsbs	r3, r0, #0
	ldrb	lr, [r9, #1]
	adc	r3, r0, r3
	ldrb	r0, [r9, #10]
	str	r0, [sp, #36]
	sub	r6, r0, #44
	ldrb	r0, [r9, #9]
	rsbs	r5, r6, #0
	str	r0, [sp, #44]
	adc	r6, r6, r5
	sub	r5, r0, #44
	orr	r6, r6, r3, lsl #1
	rsbs	r3, r5, #0
	adc	r3, r5, r3
	sub	r5, r11, #44
	rsbs	r0, r5, #0
	adc	r0, r5, r0
	orr	r0, r0, r3, lsl #1
	orr	r0, r0, r6, lsl #2
	orr	r0, r0, r7, lsl #4
	str	r0, [sp, #72]
	ldrb	r0, [r9, #7]
	str	r0, [sp, #52]
	sub	r0, r0, #44
	rsbs	r3, r0, #0
	adc	r0, r0, r3
	sub	r3, r8, #44
	rsbs	r7, r3, #0
	adc	r3, r3, r7
	sub	r7, r1, #44
	rsbs	r6, r7, #0
	orr	r0, r3, r0, lsl #1
	adc	r5, r7, r6
	ldrb	r7, [r9, #4]
	ldrb	r6, [r9, #3]
	mov	r9, r2
	sub	r3, r7, #44
	str	r6, [sp, #32]
	rsbs	r1, r3, #0
	adc	r1, r3, r1
	orr	r1, r1, r5, lsl #1
	orr	r0, r1, r0, lsl #2
	sub	r1, r6, #44
	rsbs	r3, r1, #0
	adc	r1, r1, r3
	sub	r3, r12, #44
	rsbs	r5, r3, #0
	adc	r3, r3, r5
	orr	r1, r3, r1, lsl #1
	sub	r3, r2, #44
	rsbs	r5, r3, #0
	adc	r3, r3, r5
	sub	r5, lr, #44
	rsbs	r2, r5, #0
	adc	r2, r5, r2
	orr	r2, r3, r2, lsl #1
	orr	r1, r2, r1, lsl #2
	orr	r0, r1, r0, lsl #4
	ldr	r1, [sp, #72]
	and	r0, r0, #255
	orr	r0, r0, r1, lsl #8
	mov	r1, #255
	orr	r1, r1, #65280
	tst	r0, r1
	bne	.LBB55_11
	ldr	r9, [sp, #68]
	sub	r4, r4, #1
	add	r10, r10, #16
	cmp	r4, #1
	bgt	.LBB55_6
	ldr	r2, [sp, #24]
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #16]
	cmp	r10, r2
	bge	.LBB55_17
.LBB55_9:
	ldrb	r3, [r9, r10]
	cmp	r3, #44
	beq	.LBB55_12
	add	r10, r10, #1
	cmp	r2, r10
	bne	.LBB55_9
	b	.LBB55_17
.LBB55_11:
	subs	r0, r9, #44
	mvn	r2, #0
	mvnne	r0, #0
	cmp	r11, #44
	moveq	r2, #8
	cmp	r0, r2
	ldr	r1, [sp, #28]
	movlo	r2, r0
	cmp	r7, #44
	mvn	r0, #0
	moveq	r0, #4
	cmp	r1, #44
	mvn	r1, #0
	mvn	r3, #0
	moveq	r1, #12
	cmp	r0, r1
	movlo	r1, r0
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #36]
	cmp	r12, #44
	mvn	r0, #0
	moveq	r0, #2
	cmp	r2, #44
	mvn	r2, #0
	ldr	r7, [sp, #64]
	moveq	r2, #10
	cmp	r0, r2
	movlo	r2, r0
	ldr	r0, [sp, #48]
	cmp	r8, #44
	mvn	r4, #0
	moveq	r3, #6
	cmp	r0, #44
	mvn	r0, #0
	ldr	r9, [sp, #68]
	moveq	r0, #14
	cmp	r3, r0
	movlo	r0, r3
	cmp	r2, r0
	movlo	r0, r2
	cmp	r1, r0
	ldr	r2, [sp, #44]
	movlo	r0, r1
	cmp	lr, #44
	mvn	r1, #0
	moveq	r1, #1
	cmp	r2, #44
	mvn	r2, #0
	mvn	r3, #0
	moveq	r2, #9
	cmp	r1, r2
	movlo	r2, r1
	ldr	r1, [sp, #40]
	cmp	r1, #44
	ldr	r1, [sp, #56]
	moveq	r3, #5
	cmp	r1, #44
	mvn	r1, #0
	moveq	r1, #13
	cmp	r3, r1
	movlo	r1, r3
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #60]
	cmp	r2, #44
	mvn	r2, #0
	moveq	r2, #3
	cmp	r3, #44
	mvn	r3, #0
	moveq	r3, #11
	cmp	r2, r3
	movlo	r3, r2
	ldr	r2, [sp, #52]
	cmp	r2, #44
	mvn	r2, #0
	moveq	r2, #7
	cmp	r7, #44
	moveq	r4, #15
	cmp	r2, r4
	movlo	r4, r2
	cmp	r3, r4
	movlo	r4, r3
	cmp	r1, r4
	movlo	r4, r1
	cmp	r0, r4
	add	r2, sp, #16
	movlo	r4, r0
	and	r0, r4, #255
	add	r10, r0, r10
	ldm	r2, {r0, r1, r2}
.LBB55_12:
	cmn	r10, #1
	ble	.LBB55_17
.LBB55_13:
	cmp	r10, r2
	bgt	.LBB55_21
	adds	r3, r10, #1
	bmi	.LBB55_22
	cmp	r2, r3
	blt	.LBB55_22
	sub	r6, r2, r3
	mov	r7, #1
	mov	r2, r3
	b	.LBB55_19
.LBB55_17:
	cmn	r2, #1
	ble	.LBB55_20
	cmp	r2, #0
	mov	r7, r2
	movne	r7, #1
	mov	r6, #0
	mov	r10, r2
.LBB55_19:
	add	r2, r9, r2
	strb	r7, [r0, #8]
	stm	r0, {r9, r10}
	stm	r1, {r2, r6}
	add	sp, sp, #76
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB55_20:
	ldr	r0, .LCPI55_0
	str	r2, [sp]
	str	r2, [sp, #4]
	str	r2, [sp, #8]
	mov	r2, #20
	b	.LBB55_23
.LBB55_21:
	mov	r0, #0
	str	r2, [sp, #8]
	mov	r2, #22
	stm	sp, {r0, r10}
	orr	r2, r2, #1024
	ldr	r0, .LCPI55_0
	mov	r1, #51
	mov	r3, #10
	bl	"runtime::slice_handle_error"
.LBB55_22:
	str	r3, [sp]
	str	r2, [sp, #4]
	str	r2, [sp, #8]
	mov	r2, #24
	ldr	r0, .LCPI55_0
.LBB55_23:
	orr	r2, r2, #1024
	mov	r1, #51
	mov	r3, #9
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI55_0:
	.long	".Lcsbs$POC-Example$16e"
.Lfunc_end55:
	.size	"strings::split_iterator", .Lfunc_end55-"strings::split_iterator"
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::fmt_bad_verb",%function
	.code	32
"fmt::fmt_bad_verb":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#92
	sub	sp, sp, #92
	mov	r9, r0
	mov	r4, r2
	ldrb	r8, [r0, #8]
	add	r11, r9, #84
	ldr	r6, [r9, #40]
	mov	r0, #1
	ldr	r2, [r9, #44]
	mov	r5, r1
	cmp	r6, #0
	strb	r0, [r9, #8]
	beq	.LBB56_2
	mov	r0, #0
	ldr	r3, .LCPI56_0
	str	r0, [sp, #80]
	mov	r1, r2
	str	r0, [sp, #76]
	mov	r2, #4
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #72
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r1, [r9, #40]
	ldr	r2, [r9, #44]
	ldr	r0, [r9, #84]
	ldr	r3, [sp, #72]
	add	r0, r0, r3
	str	r0, [r9, #84]
	b	.LBB56_3
.LBB56_2:
	mov	r1, #0
.LBB56_3:
	add	r0, sp, #60
	mov	r3, r5
	str	r11, [sp]
	str	r4, [sp, #4]
	bl	"io::write_rune"
	ldr	r5, [r9, #40]
	mov	r0, #40
	ldr	r1, [r9, #44]
	cmp	r5, #0
	strb	r0, [sp, #71]
	beq	.LBB56_5
	mov	r0, #0
	add	r3, sp, #71
	str	r0, [sp, #80]
	mov	r2, #4
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #72
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r11]
	ldr	r1, [sp, #72]
	add	r0, r0, r1
	str	r0, [r11]
.LBB56_5:
	add	r7, r9, #48
	ldr	r6, [r9, #60]
	ldr	r5, [r9, #40]
	add	r3, sp, #40
	ldm	r7, {r0, r2, r7}
	ldr	r1, [r9, #44]
	cmp	r0, #0
	stm	r3, {r0, r2, r7}
	orrsne	r0, r7, r6
	str	r6, [sp, #52]
	bne	.LBB56_8
	cmp	r5, #0
	beq	.LBB56_16
	mov	r0, #0
	ldr	r3, .LCPI56_1
	str	r0, [sp, #80]
	mov	r2, #4
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #5
	str	r0, [sp]
	add	r0, sp, #72
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r11]
	ldr	r1, [sp, #72]
	add	r0, r0, r1
	str	r0, [r11]
	b	.LBB56_16
.LBB56_8:
	mov	r10, #73
	str	r1, [sp, #24]
	orr	r10, r10, #256
	mov	r0, r7
	mov	r1, r6
	mov	r3, #0
	mov	r2, r10
	str	r8, [sp, #36]
	str	r5, [sp, #28]
	mov	r8, #0
	str	r4, [sp, #32]
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI56_2
	mov	r0, #0
	ldr	r12, .LCPI56_3
	b	.LBB56_10
.LBB56_9:
	adds	r1, r2, #1
	adc	r3, r3, #0
	subs	r2, r1, r10
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r1
	adds	r1, r8, #1
	adc	r4, r0, #0
	subs	r5, r8, #328
	sbcs	r0, r0, #0
	mov	r8, r1
	mov	r0, r4
	bhs	.LBB56_12
.LBB56_10:
	ldr	r5, [lr, r2, lsl #2]
	cmp	r5, #0
	beq	.LBB56_9
	ldr	r4, [r5, #16]
	ldr	r1, [r5, #20]
	eor	r4, r4, r7
	eor	r1, r1, r6
	orrs	r1, r4, r1
	bne	.LBB56_9
	b	.LBB56_13
.LBB56_12:
	mov	r5, r12
.LBB56_13:
	ldr	r1, [sp, #28]
	add	r0, sp, #72
	ldr	r2, [sp, #24]
	mov	r3, r5
	ldr	r4, [sp, #32]
	str	r11, [sp]
	str	r4, [sp, #4]
	bl	"reflect::write_type_writer"
	ldr	r5, [r9, #40]
	mov	r0, #61
	ldr	r1, [r9, #44]
	cmp	r5, #0
	strb	r0, [sp, #71]
	beq	.LBB56_15
	mov	r0, #0
	add	r3, sp, #71
	str	r0, [sp, #80]
	mov	r2, #4
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #72
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r11]
	ldr	r1, [sp, #72]
	add	r0, r0, r1
	str	r0, [r11]
.LBB56_15:
	add	r1, sp, #40
	mov	r0, r9
	mov	r2, #118
	mov	r3, r4
	bl	"fmt::fmt_value"
	ldr	r8, [sp, #36]
.LBB56_16:
	ldr	r5, [r9, #40]
	mov	r0, #41
	ldr	r1, [r9, #44]
	cmp	r5, #0
	strb	r0, [sp, #71]
	beq	.LBB56_18
	mov	r0, #0
	add	r3, sp, #71
	str	r0, [sp, #80]
	mov	r2, #4
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #72
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r11]
	ldr	r1, [sp, #72]
	add	r0, r0, r1
	str	r0, [r11]
.LBB56_18:
	strb	r8, [r9, #8]
	add	sp, sp, #92
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI56_0:
	.long	".Lcsbs$POC-Example$16f"
.LCPI56_1:
	.long	".Lcsbs$POC-Example$169"
.LCPI56_2:
	.long	.L__$type_info_data
.LCPI56_3:
	.long	".L__$ti-0"
.Lfunc_end56:
	.size	"fmt::fmt_bad_verb", .Lfunc_end56-"fmt::fmt_bad_verb"
	.fnend

	.p2align	2
	.type	"fmt::fmt_bool",%function
	.code	32
"fmt::fmt_bool":
	.fnstart
	sub	r12, r2, #116
	cmp	r12, #3
	bhi	.LBB57_3
	cmp	r12, #1
	beq	.LBB57_3
	.save	{r11, lr}
	push	{r11, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r2, .LCPI57_0
	cmp	r1, #0
	str	r3, [sp]
	ldr	r3, .LCPI57_1
	movne	r3, r2
	mov	r2, #5
	mov	r1, r3
	movne	r2, #4
	mov	r3, #115
	bl	"fmt::fmt_string"
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
.LBB57_3:
	mov	r1, r2
	mov	r2, r3
	b	"fmt::fmt_bad_verb"
	.p2align	2
.LCPI57_0:
	.long	".Lcsbs$POC-Example$e7"
.LCPI57_1:
	.long	".Lcsbs$POC-Example$ed"
.Lfunc_end57:
	.size	"fmt::fmt_bool", .Lfunc_end57-"fmt::fmt_bool"
	.fnend

	.p2align	2
	.type	"fmt::_fmt_int",%function
	.code	32
"fmt::_fmt_int":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#332
	sub	sp, sp, #332
	ldr	r11, [sp, #372]
	mov	r8, r3
	ldr	r5, [sp, #376]
	mov	r9, r2
	mov	r10, r0
	cmp	r11, #0
	beq	.LBB58_3
	sub	r0, r5, #8
	ror	r0, r0, #3
	cmp	r0, #7
	bhi	.LBB58_35
	mov	r1, #1
	mov	r2, #139
	tst	r2, r1, lsl r0
	beq	.LBB58_35
.LBB58_3:
	ldrb	r0, [r10, #5]
	cmp	r0, #0
	ldrbeq	r0, [r10, #6]
	cmpeq	r0, #0
	beq	.LBB58_5
	ldr	r0, [r10, #12]
	ldr	r1, [r10, #16]
	add	r0, r0, r1
	add	r0, r0, #3
	cmp	r0, #256
	bgt	.LBB58_36
.LBB58_5:
	add	r7, sp, #52
	mov	r1, #0
	mov	r2, #256
	ldr	r4, [sp, #368]
	mov	r0, r7
	mov	r6, #256
	bl	memset
	mov	r0, #1
	cmp	r11, #0
	bne	.LBB58_21
	ldrb	r1, [r10, #4]
	cmp	r1, #0
	beq	.LBB58_21
	sub	r1, r4, #2
	ror	r1, r1, #1
	cmp	r1, #7
	bhi	.LBB58_21
	adr	r2, .LJTI58_0
	orr	r3, r7, #2
	ldr	pc, [r2, r1, lsl #2]
	.p2align	2
.LJTI58_0:
	.long	.LBB58_10
	.long	.LBB58_21
	.long	.LBB58_21
	.long	.LBB58_14
	.long	.LBB58_21
	.long	.LBB58_12
	.long	.LBB58_21
	.long	.LBB58_16
.LBB58_10:
	ldr	r7, [r10, #40]
	mov	r0, #48
	ldr	r1, [r10, #44]
	mov	r4, r3
	cmp	r7, #0
	strb	r0, [sp, #311]
	beq	.LBB58_20
	ldr	r0, [sp, #388]
	add	lr, sp, #256
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #312
	add	r3, lr, #55
	mov	r6, #0
	mov	r2, #4
	str	r6, [sp, #320]
	str	r6, [sp, #316]
	str	r6, [sp, #312]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r2, [sp, #312]
	ldr	r7, [r10, #40]
	add	r0, r0, r2
	str	r0, [r10, #84]
	ldr	r1, [r10, #44]
	mov	r0, #98
	b	.LBB58_18
.LBB58_12:
	ldr	r7, [r10, #40]
	mov	r0, #48
	ldr	r1, [r10, #44]
	mov	r4, r3
	cmp	r7, #0
	strb	r0, [sp, #311]
	beq	.LBB58_20
	ldr	r0, [sp, #388]
	add	lr, sp, #256
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #312
	add	r3, lr, #55
	mov	r6, #0
	mov	r2, #4
	str	r6, [sp, #320]
	str	r6, [sp, #316]
	str	r6, [sp, #312]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r2, [sp, #312]
	ldr	r7, [r10, #40]
	add	r0, r0, r2
	str	r0, [r10, #84]
	ldr	r1, [r10, #44]
	mov	r0, #122
	b	.LBB58_18
.LBB58_14:
	ldr	r7, [r10, #40]
	mov	r0, #48
	ldr	r1, [r10, #44]
	mov	r4, r3
	cmp	r7, #0
	strb	r0, [sp, #311]
	beq	.LBB58_20
	ldr	r0, [sp, #388]
	add	lr, sp, #256
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #312
	add	r3, lr, #55
	mov	r6, #0
	mov	r2, #4
	str	r6, [sp, #320]
	str	r6, [sp, #316]
	str	r6, [sp, #312]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r2, [sp, #312]
	ldr	r7, [r10, #40]
	add	r0, r0, r2
	str	r0, [r10, #84]
	ldr	r1, [r10, #44]
	mov	r0, #111
	b	.LBB58_18
.LBB58_16:
	ldr	r7, [r10, #40]
	mov	r0, #48
	ldr	r1, [r10, #44]
	mov	r4, r3
	cmp	r7, #0
	strb	r0, [sp, #311]
	beq	.LBB58_20
	ldr	r0, [sp, #388]
	add	lr, sp, #256
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #312
	add	r3, lr, #55
	mov	r6, #0
	mov	r2, #4
	str	r6, [sp, #320]
	str	r6, [sp, #316]
	str	r6, [sp, #312]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r2, [sp, #312]
	ldr	r7, [r10, #40]
	ldr	r1, [r10, #44]
	add	r0, r0, r2
	str	r0, [r10, #84]
	mov	r0, #120
.LBB58_18:
	cmp	r7, #0
	strb	r0, [sp, #311]
	beq	.LBB58_20
	ldr	r0, [sp, #388]
	add	lr, sp, #256
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #312
	add	r3, lr, #55
	mov	r2, #4
	str	r6, [sp, #320]
	str	r6, [sp, #316]
	str	r6, [sp, #312]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #312]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB58_20:
	mov	r7, r4
	ldr	r4, [sp, #368]
	mov	r6, #254
	mov	r0, #0
.LBB58_21:
	ldrb	r1, [r10, #6]
	cmp	r1, #0
	beq	.LBB58_23
	ldr	r1, [r10, #16]
	cmp	r1, #0
	orrseq	r1, r9, r8
	beq	.LBB58_29
.LBB58_23:
	sub	r1, r4, #2
	ror	r1, r1, #1
	cmp	r1, #7
	bhi	.LBB58_34
	mov	r2, #1
	mov	r3, #185
	tst	r3, r2, lsl r1
	beq	.LBB58_34
	ldrb	r3, [r10, #4]
	mov	r12, r8
	ldr	r1, [sp, #384]
	mov	lr, r11
	ldr	r2, [sp, #380]
	cmp	r3, #0
	mov	r8, #0
	mov	r3, #0
	beq	.LBB58_27
	ldrb	r3, [r10, #3]
	mov	r11, r2
	mov	r2, r1
	mov	r1, r5
	rsbs	r5, r3, #0
	adc	r3, r3, r5
	mov	r5, r1
	and	r3, r0, r3
	mov	r1, r2
	mov	r2, r11
.LBB58_27:
	ldrb	r0, [r10, #1]
	ldr	r11, [sp, #388]
	cmp	r0, #0
	add	r0, sp, #40
	str	r2, [sp, #20]
	mov	r2, r6
	str	r1, [sp, #24]
	mov	r1, r7
	orrne	r3, r3, #2
	str	r8, [sp, #44]
	str	r8, [sp, #40]
	str	r11, [sp, #32]
	stm	sp, {r9, r12}
	str	r4, [sp, #8]
	str	lr, [sp, #12]
	str	r5, [sp, #16]
	str	r3, [sp, #28]
	bl	"strconv::write_bits"
	ldr	r1, [sp, #40]
	mov	r0, r10
	ldr	r2, [sp, #44]
	mov	r3, r11
	ldrb	r5, [r10, #3]
	strb	r8, [r10, #3]
	bl	"fmt::_pad"
	strb	r5, [r10, #3]
.LBB58_28:
	add	sp, sp, #332
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB58_29:
	ldr	r4, [r10, #12]
	cmp	r4, #1
	blt	.LBB58_28
	ldrb	r0, [r10, #2]
	add	lr, sp, #256
	mov	r6, #32
	add	r8, lr, #55
	cmp	r0, #0
	add	r11, sp, #312
	moveq	r6, #48
	mov	r9, #1
	mov	r7, #0
	b	.LBB58_32
.LBB58_31:
	subs	r4, r4, #1
	beq	.LBB58_28
.LBB58_32:
	ldr	r5, [r10, #40]
	ldr	r1, [r10, #44]
	cmp	r5, #0
	strb	r6, [sp, #311]
	beq	.LBB58_31
	ldr	r0, [sp, #388]
	mov	r2, #4
	str	r0, [sp, #20]
	mov	r0, r11
	mov	r3, r8
	str	r7, [sp, #320]
	str	r7, [sp, #316]
	str	r7, [sp, #312]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #312]
	add	r0, r0, r1
	str	r0, [r10, #84]
	b	.LBB58_31
.LBB58_34:
	ldr	r1, [sp, #388]
	mov	r3, #30
	ldr	r4, .LCPI58_1
	ldr	r2, .LCPI58_5
	ldr	r0, [r1, #16]
	str	r1, [sp, #4]
	cmp	r0, #0
	ldr	r1, .LCPI58_4
	b	.LBB58_37
.LBB58_35:
	ldr	r1, [sp, #388]
	mov	r3, #41
	ldr	r4, .LCPI58_1
	ldr	r2, .LCPI58_7
	ldr	r0, [r1, #16]
	str	r1, [sp, #4]
	cmp	r0, #0
	ldr	r1, .LCPI58_6
	b	.LBB58_37
.LBB58_36:
	ldr	r1, [sp, #388]
	mov	r3, #53
	ldr	r4, .LCPI58_1
	ldr	r2, .LCPI58_3
	ldr	r0, [r1, #16]
	str	r1, [sp, #4]
	cmp	r0, #0
	ldr	r1, .LCPI58_0
.LBB58_37:
	movne	r4, r0
	ldr	r0, .LCPI58_2
	str	r1, [sp]
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI58_0:
	.long	".Lscl$[_fmt_int30347]"
.LCPI58_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI58_2:
	.long	".Lcsbs$POC-Example$17b"
.LCPI58_3:
	.long	".Lcsbs$POC-Example$170"
.LCPI58_4:
	.long	".Lscl$[_fmt_int31242]"
.LCPI58_5:
	.long	".Lcsbs$POC-Example$172"
.LCPI58_6:
	.long	".Lscl$[is_integer_negative1101]"
.LCPI58_7:
	.long	".Lcsbs$POC-Example$f0"
.Lfunc_end58:
	.size	"fmt::_fmt_int", .Lfunc_end58-"fmt::_fmt_int"
	.fnend

	.p2align	2
	.type	"fmt::_fmt_int_128",%function
	.code	32
"fmt::_fmt_int_128":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#660
	sub	sp, sp, #660
	mov	r11, r2
	ldr	r2, [r1, #4]
	str	r2, [sp, #108]
	mov	r5, r3
	ldr	r2, [r1, #8]
	ldr	r7, [r1]
	ldr	r8, [r1, #12]
	ldrb	r1, [r0, #5]
	str	r2, [sp, #100]
	cmp	r1, #0
	ldrbeq	r1, [r0, #6]
	cmpeq	r1, #0
	beq	.LBB59_2
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #16]
	add	r1, r2, r1
	add	r1, r1, #3
	cmp	r1, #256
	bgt	.LBB59_98
.LBB59_2:
	add	r4, sp, #256
	str	r0, [sp, #68]
	mov	r1, #0
	mov	r2, #256
	mov	r0, r4
	mov	r6, #0
	mov	r9, #256
	bl	memset
	cmp	r5, #0
	bne	.LBB59_9
	ldr	r3, [sp, #68]
	ldrb	r0, [r3, #4]
	cmp	r0, #0
	beq	.LBB59_19
	sub	r0, r11, #2
	ror	r0, r0, #1
	cmp	r0, #7
	bhi	.LBB59_19
	adr	r1, .LJTI59_0
	orr	r10, r4, #2
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI59_0:
	.long	.LBB59_7
	.long	.LBB59_19
	.long	.LBB59_19
	.long	.LBB59_12
	.long	.LBB59_19
	.long	.LBB59_10
	.long	.LBB59_19
	.long	.LBB59_14
.LBB59_7:
	ldr	r4, [r3, #40]
	mov	r0, #48
	ldr	r1, [r3, #44]
	cmp	r4, #0
	strb	r0, [sp, #659]
	beq	.LBB59_18
	ldr	r0, [sp, #704]
	add	lr, sp, #512
	str	r0, [sp, #20]
	add	r0, sp, #512
	add	r3, lr, #147
	mov	r6, #0
	mov	r9, #1
	mov	r2, #4
	str	r6, [sp, #520]
	str	r6, [sp, #516]
	str	r6, [sp, #512]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #512]
	ldr	r0, [r3, #84]
	ldr	r4, [r3, #40]
	add	r0, r0, r2
	str	r0, [r3, #84]
	ldr	r1, [r3, #44]
	mov	r0, #98
	b	.LBB59_16
.LBB59_9:
	ldr	r3, [sp, #68]
	b	.LBB59_19
.LBB59_10:
	ldr	r4, [r3, #40]
	mov	r0, #48
	ldr	r1, [r3, #44]
	cmp	r4, #0
	strb	r0, [sp, #659]
	beq	.LBB59_18
	ldr	r0, [sp, #704]
	add	lr, sp, #512
	str	r0, [sp, #20]
	add	r0, sp, #512
	add	r3, lr, #147
	mov	r6, #0
	mov	r9, #1
	mov	r2, #4
	str	r6, [sp, #520]
	str	r6, [sp, #516]
	str	r6, [sp, #512]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #512]
	ldr	r0, [r3, #84]
	ldr	r4, [r3, #40]
	add	r0, r0, r2
	str	r0, [r3, #84]
	ldr	r1, [r3, #44]
	mov	r0, #122
	b	.LBB59_16
.LBB59_12:
	ldr	r4, [r3, #40]
	mov	r0, #48
	ldr	r1, [r3, #44]
	cmp	r4, #0
	strb	r0, [sp, #659]
	beq	.LBB59_18
	ldr	r0, [sp, #704]
	add	lr, sp, #512
	str	r0, [sp, #20]
	add	r0, sp, #512
	add	r3, lr, #147
	mov	r6, #0
	mov	r9, #1
	mov	r2, #4
	str	r6, [sp, #520]
	str	r6, [sp, #516]
	str	r6, [sp, #512]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #512]
	ldr	r0, [r3, #84]
	ldr	r4, [r3, #40]
	add	r0, r0, r2
	str	r0, [r3, #84]
	ldr	r1, [r3, #44]
	mov	r0, #111
	b	.LBB59_16
.LBB59_14:
	ldr	r4, [r3, #40]
	mov	r0, #48
	ldr	r1, [r3, #44]
	cmp	r4, #0
	strb	r0, [sp, #659]
	beq	.LBB59_18
	ldr	r0, [sp, #704]
	add	lr, sp, #512
	str	r0, [sp, #20]
	add	r0, sp, #512
	add	r3, lr, #147
	mov	r6, #0
	mov	r9, #1
	mov	r2, #4
	str	r6, [sp, #520]
	str	r6, [sp, #516]
	str	r6, [sp, #512]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #512]
	ldr	r0, [r3, #84]
	ldr	r4, [r3, #40]
	ldr	r1, [r3, #44]
	add	r0, r0, r2
	str	r0, [r3, #84]
	mov	r0, #120
.LBB59_16:
	cmp	r4, #0
	strb	r0, [sp, #659]
	beq	.LBB59_18
	ldr	r0, [sp, #704]
	add	lr, sp, #512
	str	r0, [sp, #20]
	add	r0, sp, #512
	add	r3, lr, #147
	mov	r2, #4
	str	r6, [sp, #520]
	str	r6, [sp, #516]
	str	r6, [sp, #512]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r3, [sp, #68]
	ldr	r1, [sp, #512]
	ldr	r0, [r3, #84]
	add	r0, r0, r1
	str	r0, [r3, #84]
.LBB59_18:
	mov	r9, #254
	mov	r6, #1
	mov	r4, r10
.LBB59_19:
	ldrb	r0, [r3, #6]
	cmp	r0, #0
	beq	.LBB59_21
	ldr	r0, [r3, #16]
	cmp	r0, #0
	ldreq	r0, [sp, #100]
	ldreq	r1, [sp, #108]
	orreq	r0, r7, r0
	orreq	r1, r1, r8
	orrseq	r0, r0, r1
	beq	.LBB59_48
.LBB59_21:
	sub	r0, r11, #2
	mov	r10, r7
	ror	r7, r0, #1
	cmp	r7, #7
	bhi	.LBB59_97
	mov	r1, #1
	mov	r0, #185
	tst	r0, r1, lsl r7
	beq	.LBB59_97
	ldrb	r0, [r3, #4]
	str	r0, [sp, #36]
	cmp	r0, #0
	beq	.LBB59_25
	ldrb	r0, [r3, #3]
	cmp	r0, #0
	movne	r0, #1
	orr	r1, r6, r0
.LBB59_25:
	ldrb	r0, [r3, #1]
	mov	r2, #140
	str	r1, [sp, #44]
	mov	r1, #140
	str	r0, [sp, #28]
	add	r0, sp, #512
	str	r1, [sp, #32]
	mov	r1, #0
	mov	r6, #0
	bl	memset
	cmp	r5, #0
	beq	.LBB59_27
	ldr	r1, [sp, #108]
	eor	r2, r10, r8, asr #31
	ldr	r0, [sp, #100]
	subs	r10, r2, r8, asr #31
	eor	r1, r1, r8, asr #31
	eor	r3, r8, r8, asr #31
	eor	r0, r0, r8, asr #31
	sbcs	r1, r1, r8, asr #31
	sbcs	r2, r0, r8, asr #31
	lsr	r6, r8, #31
	sbc	r5, r3, r8, asr #31
	b	.LBB59_28
.LBB59_27:
	mov	r5, r8
	ldr	r1, [sp, #108]
	ldr	r2, [sp, #100]
.LBB59_28:
	subs	r0, r10, r11
	str	r7, [sp, #48]
	sbcs	r0, r1, #0
	mov	r7, r10
	sbcs	r0, r2, #0
	str	r6, [sp, #40]
	sbcs	r0, r5, #0
	str	r9, [sp, #52]
	str	r4, [sp, #56]
	str	r11, [sp, #104]
	bhs	.LBB59_30
	mov	r0, #139
	mov	r12, r7
	str	r0, [sp, #60]
	mov	lr, r1
	mov	r8, r2
	mov	r10, r5
	b	.LBB59_44
.LBB59_30:
	add	r0, sp, #224
	mov	r3, #140
	mov	r10, r5
	mov	r8, r2
	mov	lr, r1
	mov	r12, r7
	add	r0, r0, #16
	str	r0, [sp, #64]
.LBB59_31:
	str	r8, [sp, #116]
	mov	r8, r1
	orr	r0, r7, r2
	orr	r1, r1, r5
	orr	r0, r0, r1
	str	lr, [sp, #120]
	rsbs	r1, r0, #0
	str	r12, [sp, #124]
	adc	r0, r0, r1
	rsbs	r1, r11, #0
	adc	r1, r11, r1
	str	r3, [sp, #76]
	orr	r0, r1, r0
	str	r0, [sp, #112]
	mov	r0, r5
	mov	r6, r2
	bl	__clzsi2
	mov	r9, r0
	mov	r0, r6
	bl	__clzsi2
	cmp	r5, #0
	addeq	r9, r0, #32
	mov	r0, r8
	bl	__clzsi2
	mov	r4, r11
	mov	r11, r0
	mov	r0, r7
	str	r7, [sp, #80]
	bl	__clzsi2
	cmp	r8, #0
	str	r8, [sp, #108]
	addeq	r11, r0, #32
	orrs	r0, r6, r5
	mov	r0, r4
	str	r6, [sp, #100]
	str	r5, [sp, #96]
	addeq	r9, r11, #64
	bl	__clzsi2
	add	r0, r0, #96
	ldr	r1, [sp, #112]
	subs	r7, r0, r9
	mov	r0, #0
	sbcs	r9, r0, #0
	ldr	r8, [sp, #116]
	sbcs	r11, r0, #0
	ldr	lr, [sp, #120]
	sbc	r0, r0, #0
	rsbs	r2, r7, #127
	rscs	r2, r9, #0
	ldr	r12, [sp, #124]
	rscs	r2, r11, #0
	rscs	r2, r0, #0
	mov	r2, #0
	movlo	r2, #1
	orrs	r2, r1, r2
	movne	r10, #0
	movne	r8, #0
	movne	lr, #0
	movne	r12, #0
	bne	.LBB59_39
	eor	r2, r7, #127
	orr	r3, r9, r0
	orr	r2, r2, r11
	orrs	r2, r2, r3
	beq	.LBB59_39
	ldr	r1, [sp, #80]
	mov	r8, #0
	str	r1, [sp, #240]
	str	r8, [sp, #236]
	str	r8, [sp, #232]
	str	r8, [sp, #228]
	str	r8, [sp, #224]
	ldr	r1, [sp, #108]
	str	r1, [sp, #244]
	ldr	r1, [sp, #100]
	str	r1, [sp, #248]
	ldr	r1, [sp, #96]
	str	r1, [sp, #252]
	mov	r1, #12
	str	r0, [sp, #120]
	rsb	r0, r7, #127
	ldr	r3, [sp, #64]
	and	r2, r1, r0, lsr #3
	and	r0, r0, #31
	eor	r1, r0, #31
	ldr	r2, [r3, -r2]!
	ldr	r6, [r3, #4]
	ldr	r5, [r3, #8]
	ldr	r3, [r3, #12]
	lsl	lr, r3, r0
	lsr	r3, r5, #1
	orr	r3, lr, r3, lsr r1
	str	r3, [sp, #124]
	lsl	r3, r5, r0
	lsrs	r5, r6, #1
	adds	r12, r7, #1
	orr	r10, r3, r5, lsr r1
	lsl	r3, r6, r0
	lsl	r0, r2, r0
	adcs	lr, r9, #0
	str	r0, [sp, #72]
	ldr	r0, [sp, #120]
	lsr	r6, r2, #1
	adcs	r4, r11, #0
	orr	r3, r3, r6, lsr r1
	adcs	r1, r0, #0
	adcs	r0, r8, #0
	beq	.LBB59_35
	ldr	r5, [sp, #124]
	mov	r0, #0
	ldr	r7, [sp, #72]
	mov	r1, #0
	mov	r6, #0
	str	r0, [sp, #100]
	b	.LBB59_38
.LBB59_35:
	mov	r11, #0
	add	r2, sp, #192
	str	r11, [sp, #220]
	mov	r8, r10
	str	r11, [sp, #216]
	mov	r10, r2
	str	r11, [sp, #212]
	and	r5, r12, #31
	str	r11, [sp, #208]
	ldr	r0, [sp, #80]
	str	r0, [sp, #192]
	ldr	r0, [sp, #108]
	str	r0, [sp, #196]
	ldr	r0, [sp, #100]
	str	r0, [sp, #200]
	ldr	r0, [sp, #96]
	str	r0, [sp, #204]
	mov	r0, #12
	and	r0, r0, r12, lsr #3
	str	r3, [sp, #120]
	add	r2, r2, r0
	ldmib	r2, {r3, r7}
	lsr	r6, r7, r5
	lsl	r7, r7, #1
	ldr	r2, [r2, #12]
	str	r2, [sp, #116]
	ldr	r0, [r10, r0]
	lsl	r9, r2, #1
	eor	r2, r5, #31
	orr	r9, r6, r9, lsl r2
	lsr	r6, r3, r5
	lsr	r0, r0, r5
	lsl	r3, r3, #1
	orr	r10, r0, r3, lsl r2
	ldr	r0, [sp, #104]
	orr	r6, r6, r7, lsl r2
	mov	r2, #0
	subs	r0, r0, #1
	str	r0, [sp, #96]
	sbcs	r0, r11, #0
	str	r0, [sp, #92]
	sbcs	r0, r11, #0
	str	r0, [sp, #88]
	sbc	r0, r11, #0
	str	r0, [sp, #84]
	ldr	r0, [sp, #116]
	ldr	r11, [sp, #72]
	str	r2, [sp, #100]
	lsr	r0, r0, r5
	ldr	r5, [sp, #124]
	str	r0, [sp, #112]
	mov	r0, #0
	str	r0, [sp, #116]
.LBB59_36:
	ldr	r0, [sp, #112]
	lsl	r7, r6, #1
	str	r5, [sp, #124]
	orr	r7, r7, r10, lsr #31
	lsl	r3, r9, #1
	lsl	r2, r0, #1
	lsl	r0, r10, #1
	orr	r0, r0, r5, lsr #31
	ldr	r5, [sp, #96]
	orr	r3, r3, r6, lsr #31
	orr	r2, r2, r9, lsr #31
	subs	r5, r5, r0
	mov	r6, #1
	ldr	r5, [sp, #92]
	sbcs	r5, r5, r7
	ldr	r5, [sp, #88]
	sbcs	r5, r5, r3
	ldr	r5, [sp, #84]
	sbc	r5, r5, r2
	and	r6, r6, r5, asr #31
	str	r6, [sp, #108]
	ldr	r6, [sp, #104]
	and	r5, r6, r5, asr #31
	subs	r10, r0, r5
	ldr	r5, [sp, #100]
	sbcs	r6, r7, #0
	sbcs	r9, r3, #0
	sbc	r0, r2, #0
	subs	r12, r12, #1
	sbcs	lr, lr, #0
	str	r0, [sp, #112]
	sbcs	r4, r4, #0
	sbc	r1, r1, #0
	orr	r2, r12, r4
	orr	r0, lr, r1
	orrs	r0, r2, r0
	ldr	r2, [sp, #120]
	ldr	r0, [sp, #116]
	orr	r7, r0, r11, lsl #1
	lsl	r0, r2, #1
	orr	r0, r0, r11, lsr #31
	orr	r3, r5, r0
	lsl	r0, r8, #1
	orr	r0, r0, r2, lsr #31
	mov	r11, r7
	orr	r2, r5, r0
	ldr	r0, [sp, #124]
	str	r3, [sp, #120]
	lsl	r0, r0, #1
	orr	r0, r0, r8, lsr #31
	mov	r8, r2
	orr	r5, r5, r0
	ldr	r0, [sp, #108]
	str	r0, [sp, #116]
	bne	.LBB59_36
	ldr	r6, [sp, #100]
	mov	r10, r2
	mov	r1, r6
.LBB59_38:
	lsl	r2, r3, #1
	orr	r12, r0, r7, lsl #1
	ldr	r0, [sp, #100]
	orr	r2, r2, r7, lsr #31
	orr	lr, r0, r2
	lsl	r2, r10, #1
	orr	r2, r2, r3, lsr #31
	orr	r8, r1, r2
	lsl	r1, r5, #1
	orr	r1, r1, r10, lsr #31
	orr	r10, r6, r1
.LBB59_39:
	ldr	r6, [sp, #76]
	sub	r3, r6, #1
	cmp	r3, #140
	bhs	.LBB59_90
	ldr	r11, [sp, #104]
	ldr	r1, [sp, #80]
	mul	r0, r12, r11
	sub	r0, r1, r0
	ldr	r1, [sp, #700]
	cmp	r1, r0
	bls	.LBB59_89
	ldr	r1, [sp, #696]
	mov	r4, r10
	mov	r7, r12
	mov	r2, r8
	mov	r5, r4
	ldrb	r0, [r1, r0]
	add	r1, sp, #512
	strb	r0, [r1, r3]
	subs	r0, r12, r11
	sbcs	r0, lr, #0
	sbcs	r0, r8, #0
	mov	r1, lr
	sbcs	r0, r4, #0
	bhs	.LBB59_31
	sub	r1, r6, #2
	cmp	r1, #140
	bhs	.LBB59_92
	mov	r10, r4
	str	r1, [sp, #60]
	str	r3, [sp, #32]
.LBB59_44:
	orr	r0, r12, r8
	orr	r1, lr, r10
	orr	r0, r0, r1
	str	r12, [sp, #124]
	rsbs	r1, r0, #0
	mov	r6, lr
	adc	r0, r0, r1
	rsbs	r1, r11, #0
	adc	r1, r11, r1
	orr	r5, r1, r0
	mov	r0, r10
	bl	__clzsi2
	mov	r9, r0
	mov	r0, r8
	bl	__clzsi2
	cmp	r10, #0
	addeq	r9, r0, #32
	mov	r0, r6
	bl	__clzsi2
	mov	r4, r0
	ldr	r0, [sp, #124]
	bl	__clzsi2
	cmp	r6, #0
	str	r6, [sp, #120]
	addeq	r4, r0, #32
	orrs	r0, r8, r10
	mov	r0, r11
	str	r8, [sp, #116]
	str	r10, [sp, #88]
	addeq	r9, r4, #64
	bl	__clzsi2
	add	r0, r0, #96
	mov	r1, #0
	subs	r0, r0, r9
	ldr	r6, [sp, #124]
	sbcs	r2, r1, #0
	sbcs	r3, r1, #0
	sbc	r7, r1, #0
	rsbs	r4, r0, #127
	rscs	r4, r2, #0
	rscs	r4, r3, #0
	rscs	r4, r7, #0
	movlo	r1, #1
	orrs	r1, r5, r1
	mov	r1, r6
	movne	r1, #0
	bne	.LBB59_56
	eor	r5, r0, #127
	orr	r4, r2, r7
	orr	r5, r5, r3
	orrs	r5, r5, r4
	ldr	r5, [sp, #60]
	beq	.LBB59_57
	mov	r8, #0
	str	r6, [sp, #176]
	str	r8, [sp, #172]
	mov	r5, #12
	str	r8, [sp, #168]
	adds	r12, r0, #1
	str	r8, [sp, #164]
	adcs	lr, r2, #0
	str	r8, [sp, #160]
	adcs	r3, r3, #0
	ldr	r1, [sp, #120]
	str	r1, [sp, #180]
	ldr	r11, [sp, #116]
	str	r11, [sp, #184]
	ldr	r1, [sp, #88]
	str	r1, [sp, #188]
	rsb	r1, r0, #127
	and	r10, r1, #31
	and	r4, r5, r1, lsr #3
	add	r5, sp, #160
	add	r5, r5, #16
	ldr	r9, [r5, -r4]!
	adcs	r4, r7, #0
	adcs	r0, r8, #0
	lsl	r1, r9, r10
	beq	.LBB59_53
	mov	r11, #0
	mov	r5, r1
	b	.LBB59_55
.LBB59_48:
	ldr	r6, [r3, #12]
	cmp	r6, #1
	blt	.LBB59_81
	ldrb	r0, [r3, #2]
	add	lr, sp, #512
	mov	r7, #32
	add	r9, lr, #147
	cmp	r0, #0
	add	r10, sp, #512
	moveq	r7, #48
	mov	r8, #1
	mov	r4, #0
	b	.LBB59_51
.LBB59_50:
	subs	r6, r6, #1
	beq	.LBB59_81
.LBB59_51:
	ldr	r5, [r3, #40]
	ldr	r1, [r3, #44]
	cmp	r5, #0
	strb	r7, [sp, #659]
	beq	.LBB59_50
	ldr	r0, [sp, #704]
	mov	r2, #4
	str	r0, [sp, #20]
	mov	r0, r10
	mov	r3, r9
	str	r4, [sp, #520]
	str	r4, [sp, #516]
	str	r4, [sp, #512]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r3, [sp, #68]
	ldr	r1, [sp, #512]
	ldr	r0, [r3, #84]
	add	r0, r0, r1
	str	r0, [r3, #84]
	b	.LBB59_50
.LBB59_53:
	ldr	r0, [r5, #4]
	eor	r7, r10, #31
	str	lr, [sp, #92]
	mov	lr, #0
	str	r1, [sp, #108]
	ldr	r2, [r5, #12]
	ldr	r1, [r5, #8]
	lsl	r2, r2, r10
	lsr	r5, r1, #1
	lsl	r1, r1, r10
	orr	r2, r2, r5, lsr r7
	str	r2, [sp, #112]
	lsrs	r2, r0, #1
	lsl	r0, r0, r10
	orr	r1, r1, r2, lsr r7
	str	r1, [sp, #100]
	lsr	r1, r9, #1
	add	r10, sp, #128
	orr	r0, r0, r1, lsr r7
	str	r0, [sp, #96]
	str	lr, [sp, #156]
	and	r7, r12, #31
	str	lr, [sp, #152]
	eor	r5, r7, #31
	str	lr, [sp, #148]
	str	lr, [sp, #144]
	str	r6, [sp, #128]
	ldr	r0, [sp, #120]
	str	r0, [sp, #132]
	str	r11, [sp, #136]
	ldr	r0, [sp, #88]
	str	r0, [sp, #140]
	mov	r0, #12
	and	r0, r0, r12, lsr #3
	add	r2, r10, r0
	ldmib	r2, {r1, r6, r11}
	lsl	r2, r11, #1
	lsr	r8, r6, r7
	str	r12, [sp, #116]
	orr	r12, r8, r2, lsl r5
	ldr	r0, [r10, r0]
	lsr	r2, r1, r7
	lsl	r1, r1, #1
	lsl	r6, r6, #1
	mov	r8, #0
	orr	r9, r2, r6, lsl r5
	lsr	r0, r0, r7
	orr	r1, r0, r1, lsl r5
	ldr	r0, [sp, #104]
	subs	r0, r0, #1
	str	r0, [sp, #80]
	sbcs	r0, lr, #0
	str	r0, [sp, #76]
	sbcs	r0, lr, #0
	str	r0, [sp, #72]
	mov	r0, #0
	str	r0, [sp, #120]
	sbc	r0, lr, #0
	lsr	lr, r11, r7
	str	r0, [sp, #64]
.LBB59_54:
	lsl	r5, lr, #1
	lsl	r0, r12, #1
	orr	r5, r5, r12, lsr #31
	ldr	r12, [sp, #112]
	lsl	r7, r9, #1
	lsl	r2, r1, #1
	orr	r7, r7, r1, lsr #31
	ldr	r1, [sp, #80]
	orr	r2, r2, r12, lsr #31
	orr	r0, r0, r9, lsr #31
	subs	r1, r1, r2
	mov	r6, #1
	ldr	r1, [sp, #76]
	sbcs	r1, r1, r7
	ldr	r1, [sp, #72]
	sbcs	r1, r1, r0
	ldr	r1, [sp, #64]
	sbc	r1, r1, r5
	and	r11, r6, r1, asr #31
	mov	r6, r4
	mov	r4, r3
	ldr	r3, [sp, #104]
	and	r1, r3, r1, asr #31
	subs	r1, r2, r1
	ldr	r2, [sp, #116]
	sbcs	r9, r7, #0
	str	r1, [sp, #88]
	sbcs	r10, r0, #0
	ldr	r0, [sp, #92]
	sbc	lr, r5, #0
	subs	r2, r2, #1
	sbcs	r0, r0, #0
	str	r2, [sp, #116]
	sbcs	r3, r4, #0
	str	r0, [sp, #92]
	sbc	r4, r6, #0
	orr	r2, r2, r3
	orr	r1, r0, r4
	ldr	r6, [sp, #96]
	orrs	r1, r2, r1
	ldr	r2, [sp, #108]
	ldr	r1, [sp, #120]
	lsl	r7, r12, #1
	mov	r12, r10
	str	r11, [sp, #120]
	orr	r5, r1, r2, lsl #1
	lsl	r1, r6, #1
	orr	r1, r1, r2, lsr #31
	str	r5, [sp, #108]
	orr	r0, r8, r1
	str	r0, [sp, #84]
	ldr	r0, [sp, #100]
	lsl	r2, r0, #1
	orr	r7, r7, r0, lsr #31
	orr	r2, r2, r6, lsr #31
	orr	r6, r8, r7
	orr	r1, r8, r2
	str	r1, [sp, #100]
	ldr	r1, [sp, #88]
	mov	r8, #0
	ldr	r7, [sp, #84]
	str	r6, [sp, #112]
	str	r7, [sp, #96]
	bne	.LBB59_54
.LBB59_55:
	orr	r1, r11, r5, lsl #1
	ldr	r11, [sp, #104]
	ldr	r6, [sp, #124]
.LBB59_56:
	ldr	r5, [sp, #60]
.LBB59_57:
	mul	r0, r11, r1
	ldr	r1, [sp, #700]
	sub	r0, r6, r0
	cmp	r1, r0
	bls	.LBB59_91
	ldr	r1, [sp, #696]
	add	r3, sp, #512
	ldr	r6, [sp, #56]
	ldr	r2, [sp, #52]
	ldrb	r0, [r1, r0]
	ldr	r7, [sp, #48]
	strb	r0, [r3, r5]
	ldr	r0, [sp, #44]
	cmp	r0, #0
	bne	.LBB59_73
	cmp	r7, #7
	bhi	.LBB59_73
	adr	r0, .LJTI59_1
	ldr	pc, [r0, r7, lsl #2]
	.p2align	2
.LJTI59_1:
	.long	.LBB59_62
	.long	.LBB59_73
	.long	.LBB59_73
	.long	.LBB59_66
	.long	.LBB59_64
	.long	.LBB59_68
	.long	.LBB59_73
	.long	.LBB59_70
.LBB59_62:
	ldr	r0, [sp, #32]
	mov	r1, #98
	sub	r0, r0, #2
	cmp	r0, #140
	blo	.LBB59_71
	mov	r1, #140
	stm	sp, {r0, r1}
	mov	r1, #52
	ldr	r0, .LCPI59_4
	mov	r2, #188
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_64:
	ldr	r0, [sp, #32]
	mov	r1, #100
	sub	r0, r0, #2
	cmp	r0, #140
	blo	.LBB59_71
	mov	r1, #140
	stm	sp, {r0, r1}
	mov	r1, #52
	ldr	r0, .LCPI59_4
	mov	r2, #190
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_66:
	ldr	r0, [sp, #32]
	mov	r1, #111
	sub	r0, r0, #2
	cmp	r0, #140
	blo	.LBB59_71
	mov	r1, #140
	stm	sp, {r0, r1}
	mov	r1, #52
	ldr	r0, .LCPI59_4
	mov	r2, #189
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_68:
	ldr	r0, [sp, #32]
	mov	r1, #122
	sub	r0, r0, #2
	cmp	r0, #140
	blo	.LBB59_71
	mov	r1, #140
	stm	sp, {r0, r1}
	mov	r1, #52
	ldr	r0, .LCPI59_4
	mov	r2, #191
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_70:
	ldr	r0, [sp, #32]
	mov	r1, #120
	sub	r0, r0, #2
	cmp	r0, #140
	bhs	.LBB59_96
.LBB59_71:
	sub	r5, r0, #1
	strb	r1, [r3, r0]
	cmp	r5, #140
	bhs	.LBB59_93
	mov	r0, #48
	strb	r0, [r3, r5]
.LBB59_73:
	ldr	r0, [sp, #40]
	cmp	r0, #0
	beq	.LBB59_76
	sub	r5, r5, #1
	mov	r0, #45
	cmp	r5, #140
	blo	.LBB59_78
	mov	r0, #140
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #202
	b	.LBB59_95
.LBB59_76:
	ldr	r0, [sp, #28]
	cmp	r0, #0
	beq	.LBB59_79
	sub	r5, r5, #1
	mov	r0, #43
	cmp	r5, #140
	bhs	.LBB59_94
.LBB59_78:
	strb	r0, [r3, r5]
.LBB59_79:
	rsb	r4, r5, #140
	add	r1, r3, r5
	cmp	r2, r4
	mov	r0, r6
	movge	r2, r4
	bl	memcpy
	ldr	r0, [sp, #36]
	cmp	r0, #0
	ldr	r0, [sp, #68]
	ldrbne	r1, [r0, #3]
	cmpne	r1, #0
	bne	.LBB59_82
.LBB59_80:
	ldr	r3, [sp, #704]
	mov	r1, #0
	ldrb	r5, [r0, #3]
	mov	r2, r4
	strb	r1, [r0, #3]
	mov	r1, r6
	mov	r4, r0
	bl	"fmt::_pad"
	strb	r5, [r4, #3]
.LBB59_81:
	add	sp, sp, #660
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB59_82:
	ldr	r1, [r0, #20]
	cmp	r1, #0
	bne	.LBB59_80
	cmp	r7, #7
	bhi	.LBB59_80
	mov	r2, #169
	mov	r1, #1
	tst	r1, r2, lsr r7
	beq	.LBB59_80
	ldr	r6, [r0, #40]
	mov	r2, #48
	ldr	r1, [r0, #44]
	cmp	r6, #0
	strb	r2, [sp, #659]
	beq	.LBB59_88
	ldr	r0, .LCPI59_5
	add	lr, sp, #512
	add	r3, lr, #147
	mov	r5, #0
	mov	r8, #1
	mov	r2, #4
	ldrb	r9, [r0, r7]
	ldr	r0, [sp, #704]
	str	r0, [sp, #20]
	add	r0, sp, #512
	str	r5, [sp, #520]
	str	r5, [sp, #516]
	str	r5, [sp, #512]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #68]
	ldr	r2, [sp, #512]
	strb	r9, [sp, #659]
	ldr	r7, [r0, #40]
	ldr	r1, [r0, #44]
	ldr	r3, [r0, #84]
	cmp	r7, #0
	add	r2, r3, r2
	str	r2, [r0, #84]
	beq	.LBB59_88
	ldr	r0, [sp, #704]
	add	lr, sp, #512
	str	r0, [sp, #20]
	add	r0, sp, #512
	add	r3, lr, #147
	mov	r2, #4
	str	r5, [sp, #520]
	str	r5, [sp, #516]
	str	r5, [sp, #512]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [sp, #68]
	ldr	r1, [sp, #512]
	ldr	r2, [r0, #84]
	add	r1, r2, r1
	str	r1, [r0, #84]
.LBB59_88:
	ldr	r6, [sp, #56]
	b	.LBB59_80
.LBB59_89:
	stm	sp, {r0, r1}
	mov	r1, #52
	mov	r2, #181
	ldr	r0, .LCPI59_4
	mov	r3, #17
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_90:
	mov	r0, #140
	str	r3, [sp]
	str	r0, [sp, #4]
	mov	r1, #52
	ldr	r0, .LCPI59_4
	mov	r2, #181
	mov	r3, #5
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_91:
	stm	sp, {r0, r1}
	mov	r1, #52
	mov	r2, #183
	ldr	r0, .LCPI59_4
	mov	r3, #22
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_92:
	mov	r0, #140
	str	r1, [sp]
	str	r0, [sp, #4]
	mov	r1, #52
	ldr	r0, .LCPI59_4
	mov	r2, #183
	mov	r3, #10
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_93:
	mov	r0, #140
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #196
	ldr	r0, .LCPI59_4
	mov	r3, #12
	str	r5, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_94:
	mov	r0, #140
	mov	r1, #52
	str	r0, [sp, #4]
	mov	r2, #204
.LBB59_95:
	ldr	r0, .LCPI59_4
	mov	r3, #11
	str	r5, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_96:
	mov	r1, #140
	stm	sp, {r0, r1}
	mov	r1, #52
	ldr	r0, .LCPI59_4
	mov	r2, #192
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB59_97:
	ldr	r1, [sp, #704]
	mov	r3, #30
	ldr	r4, .LCPI59_1
	ldr	r2, .LCPI59_7
	ldr	r0, [r1, #16]
	str	r1, [sp, #4]
	cmp	r0, #0
	ldr	r1, .LCPI59_6
	b	.LBB59_99
.LBB59_98:
	ldr	r1, [sp, #704]
	mov	r3, #53
	ldr	r4, .LCPI59_1
	ldr	r2, .LCPI59_3
	ldr	r0, [r1, #16]
	str	r1, [sp, #4]
	cmp	r0, #0
	ldr	r1, .LCPI59_0
.LBB59_99:
	movne	r4, r0
	ldr	r0, .LCPI59_2
	str	r1, [sp]
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI59_0:
	.long	".Lscl$[_fmt_int_12832521]"
.LCPI59_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI59_2:
	.long	".Lcsbs$POC-Example$17b"
.LCPI59_3:
	.long	".Lcsbs$POC-Example$170"
.LCPI59_4:
	.long	".Lcsbs$POC-Example$f1"
.LCPI59_5:
	.long	".Lswitch.table.fmt::_fmt_int_128"
.LCPI59_6:
	.long	".Lscl$[_fmt_int_12833411]"
.LCPI59_7:
	.long	".Lcsbs$POC-Example$172"
.Lfunc_end59:
	.size	"fmt::_fmt_int_128", .Lfunc_end59-"fmt::_fmt_int_128"
	.fnend

	.p2align	2
	.type	"runtime::_reserve_dynamic_array",%function
	.code	32
"runtime::_reserve_dynamic_array":
	.fnstart
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	.pad	#32
	sub	sp, sp, #32
	mov	r12, r2
	ldr	r2, [r0, #8]
	mov	r4, r0
	mov	r0, #0
	cmp	r1, r2
	ble	.LBB60_8
	ldr	r0, [r4, #12]
	mov	r5, r1
	cmp	r0, #0
	beq	.LBB60_3
	ldr	lr, [r4, #16]
	b	.LBB60_4
.LBB60_3:
	ldm	r3, {r0, lr}
	cmp	r0, #0
	str	r0, [r4, #12]
	str	lr, [r4, #16]
	beq	.LBB60_9
.LBB60_4:
	ldr	r1, [r4]
	mov	r6, #0
	stm	sp, {r0, lr}
	add	r0, sp, #20
	str	r3, [sp, #12]
	mov	r3, r5
	strb	r6, [sp, #28]
	str	r6, [sp, #24]
	str	r6, [sp, #20]
	str	r12, [sp, #8]
	bl	"runtime::_mem_resize"
	ldrb	r0, [sp, #28]
	cmp	r0, #0
	bne	.LBB60_8
	ldr	r1, [sp, #20]
	cmp	r5, #1
	blt	.LBB60_7
	mov	r0, #1
	cmp	r1, #0
	beq	.LBB60_8
.LBB60_7:
	mov	r0, #0
	str	r5, [r4, #8]
	str	r1, [r4]
.LBB60_8:
	add	sp, sp, #32
	pop	{r4, r5, r6, lr}
	mov	pc, lr
.LBB60_9:
	ldr	r0, [r3, #16]
	ldr	r4, .LCPI60_1
	cmp	r0, #0
	ldr	r2, .LCPI60_3
	movne	r4, r0
	ldr	r0, .LCPI60_2
	ldr	r1, .LCPI60_0
	str	r3, [sp, #4]
	mov	r3, #28
	str	r1, [sp]
	mov	r1, #17
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI60_0:
	.long	".Lscl$[_reserve_dynamic_array33450]"
.LCPI60_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI60_2:
	.long	".Lcsbs$POC-Example$1aa"
.LCPI60_3:
	.long	".Lcsbs$POC-Example$174"
.Lfunc_end60:
	.size	"runtime::_reserve_dynamic_array", .Lfunc_end60-"runtime::_reserve_dynamic_array"
	.fnend

	.globl	__truncsfhf2
	.p2align	2
	.type	__truncsfhf2,%function
	.code	32
__truncsfhf2:
	.fnstart
	mov	r1, r0
	ldr	r0, .LCPI61_0
	mov	r3, #255
	and	r2, r1, r0
	mov	r0, #32768
	and	r3, r3, r1, lsr #23
	and	r0, r0, r1, lsr #16
	subs	r12, r3, #112
	bhi	.LBB61_3
	cmp	r3, #102
	movlo	pc, lr
.LBB61_2:
	rsb	r1, r3, #113
	orr	r2, r2, #8388608
	mov	r3, #4096
	and	r3, r3, r2, lsr r1
	lsl	r3, r3, #1
	add	r1, r3, r2, lsr r1
	orr	r0, r0, r1, lsr #13
	mov	pc, lr
.LBB61_3:
	cmp	r12, #143
	bne	.LBB61_6
	cmp	r2, #0
	orreq	r0, r0, #31744
	moveq	pc, lr
.LBB61_5:
	lsr	r3, r2, #13
	cmp	r2, #8192
	mov	r1, #1
	orrlo	r3, r1, r2, lsr #13
	orr	r0, r3, r0
	orr	r0, r0, #31744
	mov	pc, lr
.LBB61_6:
	tst	r1, #4096
	bne	.LBB61_9
	mov	r1, r2
	cmp	r12, #31
	bhs	.LBB61_10
.LBB61_8:
	lsr	r1, r1, #13
	orr	r1, r1, r12, lsl #10
	orr	r0, r1, r0
	mov	pc, lr
.LBB61_9:
	mov	r1, #1040384
	orr	r1, r1, #7340032
	cmp	r2, r1
	mov	r1, #0
	subhs	r12, r3, #111
	addlo	r1, r2, #8192
	cmp	r12, #31
	blo	.LBB61_8
.LBB61_10:
	.save	{r11, lr}
	push	{r11, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r1, .LCPI61_1
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
.LCPI61_0:
	.long	8388607
.LCPI61_1:
	.long	3567587328
.Lfunc_end61:
	.size	__truncsfhf2, .Lfunc_end61-__truncsfhf2
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::_fmt_memory",%function
	.code	32
"fmt::_fmt_memory":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#316
	sub	sp, sp, #316
	mov	r7, r3
	mov	r4, r0
	ldr	r0, [sp, #352]
	mov	r5, r2
	ldr	r3, [sp, #368]
	cmp	r0, #0
	beq	.LBB62_5
	ldr	r0, [sp, #356]
	sub	r0, r0, #8
	ror	r0, r0, #3
	cmp	r0, #7
	bhi	.LBB62_34
	adr	r1, .LJTI62_0
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI62_0:
	.long	.LBB62_4
	.long	.LBB62_7
	.long	.LBB62_34
	.long	.LBB62_8
	.long	.LBB62_34
	.long	.LBB62_34
	.long	.LBB62_34
	.long	.LBB62_6
.LBB62_4:
	lsl	r0, r2, #24
	mov	r11, #267386880
	asr	r1, r0, #24
	orr	r11, r11, #805306368
	eor	r1, r1, r0, asr #31
	mov	r7, #0
	sub	r0, r1, r0, asr #31
	str	r0, [sp, #44]
	ldr	r0, [r4, #16]
	mov	r6, #1
	str	r0, [sp, #36]
	and	r0, r2, #255
	mov	r9, #0
	mov	r5, #0
	lsr	r0, r0, #7
	str	r0, [sp, #40]
	b	.LBB62_17
.LBB62_5:
	mov	r0, #0
	str	r0, [sp, #40]
	b	.LBB62_10
.LBB62_6:
	eor	r0, r2, r7, asr #31
	eor	r1, r7, r7, asr #31
	subs	r5, r0, r7, asr #31
	sbc	r0, r1, r7, asr #31
	lsr	r1, r7, #31
	str	r1, [sp, #40]
	mov	r7, r0
	b	.LBB62_10
.LBB62_7:
	lsl	r0, r2, #16
	asr	r1, r0, #16
	eor	r1, r1, r0, asr #31
	sub	r5, r1, r0, asr #31
	mov	r0, #255
	orr	r0, r0, #65280
	and	r0, r2, r0
	lsr	r0, r0, #15
	b	.LBB62_9
.LBB62_8:
	cmp	r2, #0
	lsr	r0, r2, #31
	rsbmi	r5, r2, #0
.LBB62_9:
	str	r0, [sp, #40]
	mov	r7, #0
.LBB62_10:
	ldrb	r0, [r4, #6]
	str	r5, [sp, #44]
	cmp	r0, #0
	bne	.LBB62_12
	mov	r1, #2
	orrs	r0, r7, r5, lsr #10
	bne	.LBB62_13
.LBB62_12:
	ldr	r1, [r4, #16]
	subs	r0, r5, #1024
	sbcs	r0, r7, #0
	blo	.LBB62_16
.LBB62_13:
	str	r1, [sp, #36]
	mov	r9, #0
	mov	r0, #1
	mov	r6, #1
	mov	r2, r5
	mov	r1, r7
.LBB62_14:
	lsr	r3, r2, #10
	cmp	r6, #1
	add	r9, r9, #4
	orr	r3, r3, r1, lsl #22
	moveq	r9, #2
	moveq	r6, #3
	orrs	r2, r1, r2, lsr #20
	lsl	r0, r0, #10
	lsr	r1, r1, #10
	mov	r2, r3
	bne	.LBB62_14
	bl	__aeabi_i2d
	mov	r5, r0
	mov	r11, r1
	b	.LBB62_17
.LBB62_16:
	mov	r11, #267386880
	str	r1, [sp, #36]
	orr	r11, r11, #805306368
	mov	r9, #0
	mov	r6, #1
	mov	r5, #0
.LBB62_17:
	str	r4, [sp, #32]
	mov	r1, #0
	ldrb	r8, [r4, #4]
	add	r4, sp, #60
	mov	r2, #256
	mov	r10, #0
	mov	r0, r4
	bl	memset
	ldr	r0, [sp, #44]
	mov	r1, r7
	str	r10, [sp, #52]
	str	r10, [sp, #48]
	bl	__aeabi_ul2d
	mov	r3, r11
	mov	r2, r5
	mov	r11, r4
	bl	__aeabi_ddiv
	ldr	r7, [sp, #40]
	mov	r3, #102
	mov	r2, #64
	ldr	r10, [sp, #368]
	cmp	r7, #0
	str	r2, [sp, #16]
	eorne	r1, r1, #-2147483648
	stm	sp, {r0, r1, r3}
	mov	r1, r4
	ldr	r0, [sp, #36]
	mov	r2, #256
	str	r0, [sp, #12]
	add	r0, sp, #48
	str	r10, [sp, #20]
	bl	"strconv::write_float"
	cmp	r8, #0
	ldr	r5, [sp, #52]
	addne	r6, r6, #1
	rsbs	r0, r8, #0
	adc	r1, r8, r0
	cmp	r5, #256
	bhi	.LBB62_31
	adds	r1, r9, r1
	ldr	r0, [sp, #364]
	add	r2, r1, r6
	bmi	.LBB62_21
	cmp	r1, r0
	bgt	.LBB62_21
	cmp	r1, r2
	cmple	r2, r0
	ble	.LBB62_22
.LBB62_21:
	stm	sp, {r1, r2}
	mov	r2, #250
	orr	r2, r2, #1024
	str	r0, [sp, #8]
	mov	r1, #43
	ldr	r0, .LCPI62_0
	mov	r3, #28
	bl	"runtime::slice_handle_error"
.LBB62_22:
	rsb	r2, r5, #256
	ldr	r7, [sp, #32]
	cmp	r2, r6
	add	r4, sp, #60
	movge	r2, r6
	cmp	r2, #0
	beq	.LBB62_24
	ldr	r3, [sp, #360]
	add	r0, r4, r5
	add	r1, r1, r3
	bl	memmove
.LBB62_24:
	add	r2, r5, r6
	cmp	r2, #256
	bgt	.LBB62_32
	ldrb	r0, [r7, #1]
	cmp	r0, #0
	bne	.LBB62_29
	ldrb	r0, [sp, #60]
	cmp	r0, #43
	bne	.LBB62_29
	cmp	r2, #1
	beq	.LBB62_33
	ldrb	r0, [sp, #61]
	cmp	r0, #73
	orrne	r4, r4, #1
	subne	r2, r2, #1
	b	.LBB62_30
.LBB62_29:
	mov	r4, r11
.LBB62_30:
	mov	r0, r7
	mov	r1, r4
	mov	r3, r10
	bl	"fmt::_pad"
	add	sp, sp, #316
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB62_31:
	mov	r0, #256
	mov	r2, #250
	str	r0, [sp, #4]
	orr	r2, r2, #1024
	str	r0, [sp, #8]
	mov	r1, #43
	ldr	r0, .LCPI62_0
	mov	r3, #10
	str	r5, [sp]
	bl	"runtime::slice_handle_error"
.LBB62_32:
	mov	r0, #256
	mov	r1, #0
	stm	sp, {r1, r2}
	mov	r2, #251
	orr	r2, r2, #1024
	str	r0, [sp, #8]
	mov	r1, #43
	ldr	r0, .LCPI62_0
	mov	r3, #18
	bl	"runtime::slice_handle_error"
.LBB62_33:
	mov	r0, #1
	mov	r2, #255
	str	r0, [sp]
	orr	r2, r2, #1024
	str	r0, [sp, #4]
	mov	r1, #43
	ldr	r0, .LCPI62_0
	mov	r3, #27
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB62_34:
	ldr	r0, [r3, #16]
	ldr	r4, .LCPI62_2
	cmp	r0, #0
	ldr	r2, .LCPI62_4
	movne	r4, r0
	ldr	r0, .LCPI62_3
	ldr	r1, .LCPI62_1
	str	r3, [sp, #4]
	mov	r3, #41
	str	r1, [sp]
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI62_0:
	.long	".Lcsbs$POC-Example$156"
.LCPI62_1:
	.long	".Lscl$[is_integer_negative1101]"
.LCPI62_2:
	.long	"runtime::default_assertion_failure_proc"
.LCPI62_3:
	.long	".Lcsbs$POC-Example$17b"
.LCPI62_4:
	.long	".Lcsbs$POC-Example$f0"
.Lfunc_end62:
	.size	"fmt::_fmt_memory", .Lfunc_end62-"fmt::_fmt_memory"
	.fnend

	.p2align	2
	.type	"strconv::write_float",%function
	.code	32
"strconv::write_float":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#236
	sub	sp, sp, #236
	.pad	#1024
	sub	sp, sp, #1024
	mov	r7, r1
	mov	r3, r0
	ldr	r6, [sp, #1312]
	ldr	r1, [sp, #1300]
	ldr	r0, [sp, #1296]
	cmp	r6, #64
	str	r3, [sp, #40]
	str	r7, [sp, #48]
	str	r2, [sp, #44]
	beq	.LBB63_3
	cmp	r6, #32
	bne	.LBB63_4
	bl	__aeabi_d2f
	ldr	r6, .LCPI63_1
	b	.LBB63_6
.LBB63_3:
	ldr	r6, .LCPI63_0
	b	.LBB63_7
.LBB63_4:
	cmp	r6, #16
	bne	.LBB63_68
	bl	__aeabi_d2h
	mov	r1, #255
	ldr	r6, .LCPI63_2
	orr	r1, r1, #65280
	and	r0, r0, r1
.LBB63_6:
	mov	r1, #0
.LBB63_7:
	ldr	r9, [r6]
	mov	lr, r6
	ldr	r2, [r6, #4]
	add	r3, r9, r2
	rsb	r5, r3, #32
	subs	r6, r3, #32
	lsr	r7, r1, r3
	lsr	r4, r0, r3
	orr	r5, r4, r1, lsl r5
	movpl	r7, #0
	lsrpl	r5, r1, r6
	orrs	r7, r5, r7
	movne	r7, #1
	cmp	r3, #64
	mov	r3, #0
	rsb	r5, r9, #32
	movlo	r3, #1
	and	r12, r3, r7
	mov	r7, #1
	subs	r3, r9, #32
	lsl	r11, r7, r9
	lsr	r8, r7, r5
	lsr	r4, r0, r9
	orr	r5, r4, r1, lsl r5
	mov	r6, #0
	movpl	r11, #0
	lslpl	r8, r7, r3
	lsrpl	r5, r1, r3
	cmp	r9, #64
	movhs	r5, r6
	movhs	r8, r6
	movhs	r11, r6
	subs	r3, r11, #1
	sbc	r4, r8, #0
	cmp	r2, #32
	and	r6, r4, r1
	mvn	r1, #0
	mvnlo	r1, r1, lsl r2
	and	r4, r5, r1
	and	r10, r3, r0
	cmp	r4, r1
	bne	.LBB63_10
	ldr	r1, [sp, #44]
	orrs	r0, r10, r6
	mov	r4, #3
	moveq	r4, #4
	cmp	r1, r4
	movlt	r4, r1
	cmp	r1, #1
	blt	.LBB63_15
	ldr	r1, .LCPI63_4
	cmp	r12, #0
	ldr	r5, [sp, #48]
	ldr	r2, .LCPI63_5
	movne	r2, r1
	cmp	r0, #0
	ldr	r1, .LCPI63_6
	mov	r0, r5
	moveq	r1, r2
	mov	r2, r4
	bl	memcpy
	b	.LBB63_25
.LBB63_10:
	add	r0, sp, #72
	mov	r1, #0
	mov	r2, #396
	mov	r5, r6
	str	r12, [sp, #36]
	mov	r6, lr
	bl	memset
	cmp	r4, #0
	add	r0, sp, #72
	orrne	r10, r10, r11
	orrne	r5, r5, r8
	mov	r2, r10
	mov	r3, r5
	bl	"strconv_decimal::assign"
	cmp	r4, #1
	ldr	r0, [r6, #8]
	movhi	r7, r4
	add	r7, r0, r7
	add	r0, sp, #72
	sub	r4, r7, r9
	mov	r1, r4
	bl	"strconv_decimal::shift"
	ldr	r2, [sp, #1308]
	mov	r0, #0
	str	r0, [sp, #68]
	cmp	r2, #0
	str	r0, [sp, #64]
	str	r0, [sp, #60]
	str	r0, [sp, #56]
	str	r0, [sp, #52]
	bmi	.LBB63_17
	ldr	r5, [sp, #1304]
	mov	r4, r2
	ldr	r6, [sp, #48]
	mov	r7, r2
	and	r0, r5, #255
	ldr	r8, [sp, #44]
	sub	r0, r0, #69
	cmp	r0, #34
	bhi	.LBB63_23
	adr	r1, .LJTI63_0
	mov	r4, r7
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI63_0:
	.long	.LBB63_14
	.long	.LBB63_20
	.long	.LBB63_21
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_23
	.long	.LBB63_14
	.long	.LBB63_20
	.long	.LBB63_21
.LBB63_14:
	add	r1, r7, #1
	mov	r4, r7
	b	.LBB63_22
.LBB63_15:
	ldr	r5, [sp, #48]
	cmn	r1, #1
	bgt	.LBB63_25
	mov	r0, #0
	str	r1, [sp, #8]
	stm	sp, {r0, r4}
	mov	r1, #57
	mov	r2, #78
	ldr	r0, .LCPI63_3
	mov	r3, #13
	bl	"runtime::slice_handle_error"
.LBB63_17:
	orrs	r0, r10, r5
	beq	.LBB63_26
	mov	r1, r6
	ldr	r12, [sp, #36]
	ldr	r0, [r1, #8]
	add	lr, sp, #72
	mov	r6, r7
	mov	r7, r10
	add	r1, r0, #1
	cmp	r6, r1
	ble	.LBB63_27
	mov	r0, #100
	mov	r2, #332
	mul	r10, r4, r0
	ldr	r4, [sp, #456]
	ldr	r0, [sp, #460]
	sub	r0, r0, r4
	mul	r3, r0, r2
	cmp	r3, r10
	mov	r3, r4
	blt	.LBB63_28
	b	.LBB63_60
.LBB63_20:
	ldr	r0, [sp, #460]
	mov	r4, r7
	add	r1, r0, r7
	b	.LBB63_22
.LBB63_21:
	cmp	r7, #1
	mov	r1, r7
	movls	r1, #1
	mov	r4, r1
.LBB63_22:
	add	r0, sp, #72
	bl	"strconv_decimal::round"
.LBB63_23:
	mov	r0, #0
	ldr	r12, [sp, #36]
	str	r0, [sp, #68]
	ldr	r0, [sp, #456]
	ldr	r1, [sp, #460]
	str	r0, [sp, #60]
	mov	r0, #384
	str	r0, [sp, #56]
	add	r0, sp, #72
	str	r1, [sp, #64]
	str	r0, [sp, #52]
.LBB63_24:
	mov	r0, #0
	lsr	r3, r7, #31
	str	r0, [sp, #868]
	mov	r1, r6
	str	r0, [sp, #864]
	add	r0, sp, #52
	stmib	sp, {r0, r4, r5}
	add	r0, sp, #864
	mov	r2, r8
	str	r12, [sp]
	bl	"strconv::format_digits"
	ldr	r5, [sp, #864]
	ldr	r4, [sp, #868]
.LBB63_25:
	ldr	r0, [sp, #40]
	str	r5, [r0]
	str	r4, [r0, #4]
	add	sp, sp, #236
	add	sp, sp, #1024
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB63_26:
	mov	r3, #0
	ldr	r12, [sp, #36]
	str	r3, [sp, #456]
	add	lr, sp, #72
	b	.LBB63_60
.LBB63_27:
	ldr	r3, [sp, #456]
.LBB63_28:
	add	r4, sp, #864
	str	r1, [sp, #28]
	mov	r1, #0
	mov	r2, #396
	mov	r0, r4
	str	r3, [sp, #32]
	mov	r10, #0
	bl	memset
	lsl	r0, r5, #1
	mvn	r1, #0
	adds	r2, r1, r7, lsl #1
	orr	r0, r0, r7, lsr #31
	sbc	r3, r0, #0
	mov	r0, r4
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	bl	"strconv_decimal::assign"
	mvn	r0, r9
	add	r9, r6, r0
	mov	r0, r4
	mov	r1, r9
	bl	"strconv_decimal::shift"
	add	r4, sp, #468
	mov	r1, #0
	mov	r2, #396
	mov	r0, r4
	bl	memset
	ldr	r0, [sp, #28]
	ldr	r2, [sp, #20]
	subs	r0, r6, r0
	movne	r0, #1
	subs	r1, r11, r7
	sbcs	r1, r8, r5
	mov	r11, r4
	mov	r1, #0
	movhs	r1, #1
	and	r4, r1, r0
	subs	r0, r7, #1
	sbc	r1, r5, #0
	cmp	r4, #0
	movne	r1, r2
	ldr	r2, [sp, #24]
	lsl	r1, r1, #1
	movne	r0, r2
	orr	r3, r1, r0, lsr #31
	mov	r1, #1
	orr	r2, r1, r0, lsl #1
	mov	r0, r11
	bl	"strconv_decimal::assign"
	sub	r1, r9, r4
	mov	r0, r11
	bl	"strconv_decimal::shift"
	ldr	r8, [sp, #32]
	cmp	r8, #1
	blt	.LBB63_50
	ldr	r1, [sp, #852]
	and	r0, r7, #1
	ldr	r3, [sp, #1248]
	add	lr, sp, #72
	sub	r12, r1, #1
	b	.LBB63_32
.LBB63_30:
	cmp	r7, #0
	bne	.LBB63_51
.LBB63_31:
	add	r10, r10, #1
	cmp	r8, r10
	beq	.LBB63_56
.LBB63_32:
	cmp	r10, r1
	bge	.LBB63_35
	cmp	r10, #384
	bhs	.LBB63_67
	ldrb	r5, [r11, r10]
	b	.LBB63_36
.LBB63_35:
	mov	r5, #48
	cmp	r10, #384
	bhs	.LBB63_66
.LBB63_36:
	cmp	r10, r3
	mov	r6, #48
	addlt	r2, sp, #864
	ldrb	r4, [lr, r10]
	ldrblt	r6, [r2, r10]
	cmp	r5, r4
	bne	.LBB63_38
	eor	r7, r12, r10
	orr	r7, r0, r7
	rsbs	r2, r7, #0
	adc	r7, r7, r2
	cmp	r5, r6
	beq	.LBB63_30
	b	.LBB63_39
.LBB63_38:
	mov	r7, #1
	cmp	r4, r6
	beq	.LBB63_51
.LBB63_39:
	mov	r5, #1
	cmp	r0, #0
	beq	.LBB63_42
	add	r2, r4, #1
	and	r2, r2, #255
	cmp	r2, r6
	blo	.LBB63_42
	add	r2, r10, #1
	mov	r5, #0
	cmp	r2, r3
	movlt	r5, #1
.LBB63_42:
	and	r2, r7, r5
	cmp	r2, #1
	beq	.LBB63_57
	cmp	r7, #0
	bne	.LBB63_51
	cmp	r5, #0
	beq	.LBB63_31
	ldr	r12, [sp, #36]
	add	r0, r10, #1
	cmp	r0, r8
	mov	r3, r8
	bhs	.LBB63_60
	rsb	r0, r10, #0
.LBB63_47:
	cmp	r0, #1
	beq	.LBB63_59
	ldrb	r1, [lr, -r0]
	add	r0, r0, #1
	cmp	r1, #56
	bhi	.LBB63_47
	sub	r2, lr, r0
	add	r1, r1, #1
	rsb	r3, r0, #2
	strb	r1, [r2, #1]
	str	r3, [sp, #456]
	b	.LBB63_60
.LBB63_50:
	ldr	r12, [sp, #36]
	add	lr, sp, #72
	mov	r3, r8
	b	.LBB63_60
.LBB63_51:
	ldr	r12, [sp, #36]
	add	r0, r10, #1
	cmp	r0, r8
	mov	r3, r8
	bhs	.LBB63_60
	str	r0, [sp, #456]
.LBB63_53:
	ldrb	r0, [lr, r10]
	cmp	r0, #48
	bne	.LBB63_58
	sub	r0, r10, #1
	add	r1, r10, #1
	str	r10, [sp, #456]
	cmp	r1, #1
	mov	r10, r0
	bhi	.LBB63_53
	mov	r3, #0
	str	r3, [sp, #460]
	b	.LBB63_60
.LBB63_56:
	ldr	r12, [sp, #36]
	mov	r3, r8
	b	.LBB63_60
.LBB63_57:
	add	r1, r10, #1
	add	r0, sp, #72
	bl	"strconv_decimal::round"
	add	lr, sp, #72
	ldr	r3, [sp, #456]
	ldr	r12, [sp, #36]
	b	.LBB63_60
.LBB63_58:
	add	r3, r10, #1
	b	.LBB63_60
.LBB63_59:
	mov	r0, #49
	mov	r3, #1
	strb	r0, [sp, #72]
	ldr	r0, [sp, #460]
	str	r3, [sp, #456]
	add	r0, r0, #1
	str	r0, [sp, #460]
.LBB63_60:
	ldr	r5, [sp, #1304]
	mov	r0, #0
	mov	r1, #384
	ldr	r7, [sp, #1308]
	str	r0, [sp, #68]
	ldr	r0, [sp, #460]
	str	r1, [sp, #56]
	and	r1, r5, #255
	ldr	r6, [sp, #48]
	sub	r1, r1, #69
	ldr	r8, [sp, #44]
	cmp	r1, #34
	mov	r4, r7
	str	r0, [sp, #64]
	str	r3, [sp, #60]
	str	lr, [sp, #52]
	bhi	.LBB63_24
	adr	r2, .LJTI63_1
	mov	r4, r7
	ldr	pc, [r2, r1, lsl #2]
	.p2align	2
.LJTI63_1:
	.long	.LBB63_63
	.long	.LBB63_64
	.long	.LBB63_65
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_24
	.long	.LBB63_63
	.long	.LBB63_64
	.long	.LBB63_65
.LBB63_63:
	sub	r4, r3, #1
	b	.LBB63_24
.LBB63_64:
	sub	r0, r3, r0
	bic	r4, r0, r0, asr #31
	b	.LBB63_24
.LBB63_65:
	mov	r4, r3
	b	.LBB63_24
.LBB63_66:
	mov	r0, #384
	mov	r2, #51
	str	r0, [sp, #4]
	orr	r2, r2, #256
	ldr	r0, .LCPI63_3
	mov	r1, #57
	mov	r3, #17
	str	r10, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB63_67:
	mov	r0, #384
	mov	r2, #49
	str	r0, [sp, #4]
	orr	r2, r2, #256
	ldr	r0, .LCPI63_3
	mov	r1, #57
	mov	r3, #21
	str	r10, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB63_68:
	ldr	r0, [sp, #1316]
	mov	r3, #25
	str	r0, [sp, #4]
	ldr	r2, .LCPI63_10
	ldr	r1, [r0, #16]
	ldr	r0, .LCPI63_7
	str	r0, [sp]
	cmp	r1, #0
	ldr	r0, .LCPI63_9
	ldr	r4, .LCPI63_8
	movne	r4, r1
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI63_0:
	.long	"strconv::_f64_info"
.LCPI63_1:
	.long	"strconv::_f32_info"
.LCPI63_2:
	.long	"strconv::_f16_info"
.LCPI63_3:
	.long	".Lcsbs$POC-Example$f5"
.LCPI63_4:
	.long	".Lcsbs$POC-Example$f8"
.LCPI63_5:
	.long	".Lcsbs$POC-Example$f9"
.LCPI63_6:
	.long	".Lcsbs$POC-Example$f7"
.LCPI63_7:
	.long	".Lscl$[generic_ftoa1381]"
.LCPI63_8:
	.long	"runtime::default_assertion_failure_proc"
.LCPI63_9:
	.long	".Lcsbs$POC-Example$17b"
.LCPI63_10:
	.long	".Lcsbs$POC-Example$f4"
.Lfunc_end63:
	.size	"strconv::write_float", .Lfunc_end63-"strconv::write_float"
	.fnend

	.p2align	2
	.type	"reflect::as_bool",%function
	.code	32
"reflect::as_bool":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, [r0]
	mov	r2, r0
	mov	r1, #0
	mov	r0, #0
	cmp	r8, #0
	ldrne	r10, [r2, #8]
	ldrne	r5, [r2, #12]
	orrsne	r2, r10, r5
	bne	.LBB64_2
.LBB64_1:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
.LBB64_2:
	mov	r9, #73
	mov	r0, r10
	orr	r9, r9, #256
	mov	r1, r5
	mov	r3, #0
	mov	r7, #0
	mov	r2, r9
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI64_0
	mov	r0, #0
	ldr	r12, .LCPI64_1
	b	.LBB64_4
.LBB64_3:
	adds	r1, r2, #1
	adc	r3, r3, #0
	subs	r2, r1, r9
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r1
	adds	r1, r7, #1
	adc	r4, r0, #0
	subs	r6, r7, #328
	sbcs	r0, r0, #0
	mov	r7, r1
	mov	r0, r4
	bhs	.LBB64_6
.LBB64_4:
	ldr	r6, [lr, r2, lsl #2]
	cmp	r6, #0
	beq	.LBB64_3
	ldr	r1, [r6, #16]
	ldr	r4, [r6, #20]
	eor	r1, r1, r10
	eor	r4, r4, r5
	orrs	r1, r1, r4
	bne	.LBB64_3
	b	.LBB64_9
.LBB64_6:
	mov	r6, r12
	b	.LBB64_9
.LBB64_7:
	add	r1, r6, #32
.LBB64_8:
	ldr	r6, [r1]
.LBB64_9:
	ldr	r0, [r6, #64]
	ldr	r1, [r6, #68]
	subs	r0, r0, #1
	sbc	r1, r1, #0
	rsbs	r2, r0, #26
	rscs	r1, r1, #0
	blo	.LBB64_17
	adr	r2, .LJTI64_0
	add	r1, r6, #24
	ldr	pc, [r2, r0, lsl #2]
	.p2align	2
.LJTI64_0:
	.long	.LBB64_7
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_12
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_8
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_17
	.long	.LBB64_8
.LBB64_12:
	add	r0, r6, #16
	ldr	r7, .LCPI64_3
	ldr	r3, .LCPI64_2
	mov	r1, #0
	ldr	r2, [r0]
	ldr	r0, [r0, #4]
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB64_18
	ldr	r7, .LCPI64_4
	eor	r3, r0, r3
	eor	r7, r2, r7
	orrs	r3, r7, r3
	beq	.LBB64_21
	ldr	r3, .LCPI64_5
	ldr	r7, .LCPI64_6
	eor	r3, r2, r3
	eor	r7, r0, r7
	orrs	r3, r3, r7
	beq	.LBB64_22
	ldr	r3, .LCPI64_7
	eor	r2, r2, r3
	ldr	r3, .LCPI64_8
	eor	r0, r0, r3
	orrs	r0, r2, r0
	mov	r0, #0
	bne	.LBB64_1
	ldrb	r0, [r8]
	b	.LBB64_24
.LBB64_17:
	mov	r1, #0
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
.LBB64_18:
	ldr	r3, .LCPI64_9
	ldr	r7, .LCPI64_10
	eor	r3, r2, r3
	eor	r7, r0, r7
	orrs	r3, r3, r7
	beq	.LBB64_23
	ldr	r3, .LCPI64_11
	eor	r2, r2, r3
	ldr	r3, .LCPI64_12
	eor	r0, r0, r3
	orrs	r0, r2, r0
	mov	r0, #0
	bne	.LBB64_1
	ldrb	r0, [r8]
	b	.LBB64_26
.LBB64_21:
	ldrh	r0, [r8]
	b	.LBB64_24
.LBB64_22:
	ldr	r0, [r8]
	ldr	r1, [r8, #4]
	orrs	r0, r0, r1
	b	.LBB64_25
.LBB64_23:
	ldr	r0, [r8]
.LBB64_24:
	cmp	r0, #0
.LBB64_25:
	movne	r0, #1
.LBB64_26:
	mov	r1, #1
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
	.p2align	2
.LCPI64_0:
	.long	.L__$type_info_data
.LCPI64_1:
	.long	".L__$ti-0"
.LCPI64_2:
	.long	778414328
.LCPI64_3:
	.long	326884768
.LCPI64_4:
	.long	326884769
.LCPI64_5:
	.long	70189487
.LCPI64_6:
	.long	972035155
.LCPI64_7:
	.long	3597656501
.LCPI64_8:
	.long	1273736861
.LCPI64_9:
	.long	2237362591
.LCPI64_10:
	.long	168533802
.LCPI64_11:
	.long	1593006517
.LCPI64_12:
	.long	747444013
.Lfunc_end64:
	.size	"reflect::as_bool", .Lfunc_end64-"reflect::as_bool"
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
.Lfunc_end65:
	.size	__aeabi_d2h, .Lfunc_end65-__aeabi_d2h
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
.Lfunc_end66:
	.size	__truncdfhf2, .Lfunc_end66-__truncdfhf2
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
.Lfunc_end67:
	.size	__gnu_h2f_ieee, .Lfunc_end67-__gnu_h2f_ieee
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::fmt_rune",%function
	.code	32
"fmt::fmt_rune":
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	.pad	#24
	sub	sp, sp, #24
	mov	r12, r1
	sub	r1, r2, #99
	cmp	r1, #20
	bhi	.LBB68_5
	mov	r4, #1
	mov	lr, #1
	orr	r4, r4, #557056
	tst	r4, lr, lsl r1
	beq	.LBB68_3
	ldr	r1, [r0, #40]
	ldr	r2, [r0, #44]
	add	r0, r0, #84
	stm	sp, {r0, r3}
	add	r0, sp, #16
	mov	r3, r12
	bl	"io::write_rune"
	b	.LBB68_6
.LBB68_3:
	mov	r4, #1064960
	tst	r4, lr, lsl r1
	beq	.LBB68_5
	ldr	r2, [r0, #40]
	mov	r4, r0
	ldr	r1, [r0, #44]
	mov	r0, r2
	mov	r2, r12
	bl	"io::write_quoted_rune"
	ldr	r1, [r4, #84]
	add	r0, r1, r0
	str	r0, [r4, #84]
	b	.LBB68_6
.LBB68_5:
	mov	r1, #32
	mov	r4, #0
	stmib	sp, {r1, r2, r3}
	mov	r2, r12
	mov	r3, #0
	str	r4, [sp]
	bl	"fmt::fmt_int"
.LBB68_6:
	add	sp, sp, #24
	pop	{r4, lr}
	mov	pc, lr
.Lfunc_end68:
	.size	"fmt::fmt_rune", .Lfunc_end68-"fmt::fmt_rune"
	.fnend

	.p2align	2
	.type	"reflect::as_i64",%function
	.code	32
"reflect::as_i64":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#36
	sub	sp, sp, #36
	ldr	r7, [r1]
	mov	r11, r0
	mov	r3, #0
	mov	r8, #0
	cmp	r7, #0
	beq	.LBB69_21
	ldr	r9, [r1, #8]
	ldr	r4, [r1, #12]
	mov	r1, #0
	str	r2, [sp, #28]
	orrs	r0, r9, r4
	beq	.LBB69_116
	mov	r10, #73
	add	r0, r7, #8
	orr	r10, r10, #256
	str	r0, [sp, #24]
	mov	r0, r9
	mov	r1, r4
	mov	r2, r10
	str	r7, [sp, #32]
	mov	r6, #0
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI69_0
	mov	r5, #0
	ldr	r12, .LCPI69_1
	b	.LBB69_4
.LBB69_3:
	adds	r0, r2, #1
	mov	r2, #0
	adc	r3, r3, #0
	subs	r1, r0, r10
	sbcs	r1, r3, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r6, #1
	adc	r1, r5, #0
	subs	r6, r6, #328
	sbcs	r5, r5, #0
	mov	r6, r0
	mov	r5, r1
	bhs	.LBB69_6
.LBB69_4:
	ldr	r0, [lr, r2, lsl #2]
	cmp	r0, #0
	beq	.LBB69_3
	ldr	r1, [r0, #16]
	ldr	r8, [r0, #20]
	eor	r1, r1, r9
	eor	r7, r8, r4
	orrs	r1, r1, r7
	bne	.LBB69_3
	b	.LBB69_7
.LBB69_6:
	mov	r0, r12
.LBB69_7:
	ldr	r4, [sp, #32]
	b	.LBB69_9
.LBB69_8:
	ldr	r0, [r3]
.LBB69_9:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r3, r1, #27
	orrs	r3, r3, r2
	eorne	r7, r1, #21
	add	r3, r0, #24
	orrsne	r7, r7, r2
	beq	.LBB69_8
	eor	r3, r1, #1
	orrs	r3, r3, r2
	bne	.LBB69_12
	add	r3, r0, #32
	b	.LBB69_8
.LBB69_12:
	subs	r7, r1, #2
	mov	r3, #0
	sbc	r1, r2, #0
	rsbs	r2, r7, #6
	mov	r8, #0
	rscs	r1, r1, #0
	blo	.LBB69_21
	add	r0, r0, #16
	mov	r1, #0
	ldr	r2, [r0]
	ldr	r0, [r0, #4]
	adr	r6, .LJTI69_0
	ldr	pc, [r6, r7, lsl #2]
	.p2align	2
.LJTI69_0:
	.long	.LBB69_15
	.long	.LBB69_31
	.long	.LBB69_22
	.long	.LBB69_33
	.long	.LBB69_36
	.long	.LBB69_116
	.long	.LBB69_27
.LBB69_15:
	ldr	r3, .LCPI69_38
	ldr	r1, .LCPI69_37
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB69_45
	ldr	r7, .LCPI69_40
	ldr	r3, .LCPI69_39
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB69_65
	ldr	r7, .LCPI69_42
	ldr	r1, .LCPI69_41
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	blt	.LBB69_78
	ldr	r7, .LCPI69_52
	ldr	r1, .LCPI69_51
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	blt	.LBB69_104
	ldr	r1, .LCPI69_56
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB69_109
	ldr	r1, .LCPI69_57
	eor	r1, r2, r1
	ldr	r2, .LCPI69_58
	b	.LBB69_108
.LBB69_21:
	mov	r1, #0
	b	.LBB69_116
.LBB69_22:
	ldr	r3, .LCPI69_22
	ldr	r1, .LCPI69_21
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	blt	.LBB69_41
	ldr	r1, .LCPI69_28
	ldr	r3, .LCPI69_29
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_43
	ldr	r1, .LCPI69_30
	ldr	r3, .LCPI69_31
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_76
	ldr	r1, .LCPI69_32
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_33
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldr	r0, [r4]
	mov	r1, #65280
	and	r2, r0, #65280
	and	r1, r1, r0, lsr #8
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r2, lsl #8
	orr	r0, r0, r1
	b	.LBB69_44
.LBB69_27:
	ldr	r3, .LCPI69_11
	ldr	r1, .LCPI69_10
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB69_50
	ldr	r3, .LCPI69_12
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_70
	ldr	r1, .LCPI69_13
	ldr	r3, .LCPI69_14
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_71
	ldr	r1, .LCPI69_15
	eor	r1, r2, r1
	ldr	r2, .LCPI69_16
	b	.LBB69_52
.LBB69_31:
	ldr	r1, .LCPI69_34
	ldr	r3, .LCPI69_35
	eor	r7, r2, r1
	eor	r6, r0, r3
	orrs	r7, r7, r6
	bne	.LBB69_118
.LBB69_32:
	ldr	r8, [r4]
	asr	r1, r8, #31
	b	.LBB69_115
.LBB69_33:
	ldr	r1, .LCPI69_6
	ldr	r3, .LCPI69_7
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_54
	ldr	r1, .LCPI69_8
	eor	r1, r2, r1
	ldr	r2, .LCPI69_9
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB69_60
	ldr	r0, [r4, #4]
	mvn	r1, #-2147483648
	tst	r0, r1
	bne	.LBB69_60
	b	.LBB69_43
.LBB69_36:
	ldr	r1, .LCPI69_2
	ldr	r3, .LCPI69_3
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_56
	ldr	r1, .LCPI69_4
	eor	r1, r2, r1
	ldr	r2, .LCPI69_5
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB69_60
	ldr	r1, [r4]
	mvn	r0, #-2147483648
	tst	r1, r0
	bne	.LBB69_60
	ldr	r3, [sp, #24]
	ldr	r2, [r4, #4]
	ldr	r1, [r3]
	orr	r1, r1, r2
	tst	r1, r0
	bne	.LBB69_60
	ldr	r0, [r3, #4]
	b	.LBB69_44
.LBB69_41:
	ldr	r3, .LCPI69_23
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	ldrne	r1, .LCPI69_24
	ldrne	r3, .LCPI69_25
	eorne	r1, r2, r1
	eorne	r3, r0, r3
	orrsne	r1, r1, r3
	beq	.LBB69_55
	ldr	r1, .LCPI69_26
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_27
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
.LBB69_43:
	ldr	r0, [r4]
.LBB69_44:
	bl	__aeabi_f2iz
	mov	r8, r0
	asr	r1, r0, #31
	b	.LBB69_115
.LBB69_45:
	ldr	r3, .LCPI69_75
	ldr	r1, .LCPI69_74
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	blt	.LBB69_61
	ldr	r3, .LCPI69_92
	ldr	r1, .LCPI69_91
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB69_82
	ldr	r7, .LCPI69_94
	ldr	r3, .LCPI69_93
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	blt	.LBB69_95
	ldr	r3, .LCPI69_98
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_109
	ldr	r1, .LCPI69_99
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_100
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	beq	.LBB69_112
	b	.LBB69_116
.LBB69_50:
	ldr	r1, .LCPI69_17
	ldr	r3, .LCPI69_18
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_72
	ldr	r1, .LCPI69_19
	eor	r1, r2, r1
	ldr	r2, .LCPI69_20
.LBB69_52:
	eor	r0, r0, r2
	mov	r3, #0
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldrb	r8, [r4]
	cmp	r8, #0
	movne	r8, #1
	b	.LBB69_115
.LBB69_54:
	ldr	r1, [sp, #24]
	mov	r2, #0
	mov	r3, #0
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB69_60
.LBB69_55:
	ldr	r0, [r4]
	ldr	r1, [r4, #4]
	b	.LBB69_77
.LBB69_56:
	ldr	r0, [r4]
	mov	r2, #0
	ldr	r1, [r4, #4]
	mov	r3, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB69_60
	ldr	r2, [sp, #24]
	mov	r3, #0
	ldr	r0, [r2]
	ldr	r1, [r2, #4]
	ldr	r4, [r2, #8]
	ldr	r6, [r2, #12]
	mov	r2, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB69_60
	mov	r0, r4
	mov	r1, r6
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	mov	r1, #0
	mov	r3, #0
	beq	.LBB69_116
	ldr	r1, [sp, #24]
	ldr	r0, [r1, #16]
	ldr	r1, [r1, #20]
	b	.LBB69_77
.LBB69_60:
	mov	r1, #0
	mov	r3, #0
	b	.LBB69_116
.LBB69_61:
	ldr	r7, .LCPI69_77
	ldr	r3, .LCPI69_76
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB69_86
	ldr	r7, .LCPI69_79
	ldr	r1, .LCPI69_78
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	blt	.LBB69_97
	ldr	r1, .LCPI69_83
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB69_110
	ldr	r1, .LCPI69_84
	eor	r1, r2, r1
	ldr	r2, .LCPI69_85
	b	.LBB69_89
.LBB69_65:
	ldr	r7, .LCPI69_60
	ldr	r3, .LCPI69_59
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB69_91
	ldr	r7, .LCPI69_62
	ldr	r1, .LCPI69_61
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	blt	.LBB69_100
	ldr	r1, .LCPI69_66
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB69_109
	ldr	r1, .LCPI69_67
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_68
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldr	r0, [r4]
	mov	r1, #65280
	and	r2, r0, #65280
	and	r1, r1, r0, lsr #8
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r2, lsl #8
	orr	r8, r0, r1
	b	.LBB69_75
.LBB69_70:
	ldrh	r8, [r4]
	b	.LBB69_73
.LBB69_71:
	ldr	r0, [r4]
	ldr	r1, [r4, #4]
	orrs	r8, r0, r1
	b	.LBB69_74
.LBB69_72:
	ldr	r8, [r4]
.LBB69_73:
	cmp	r8, #0
.LBB69_74:
	movne	r8, #1
.LBB69_75:
	mov	r1, #0
	b	.LBB69_115
.LBB69_76:
	ldr	r0, [r4, #4]
	mov	r2, #65280
	ldr	r1, [r4]
	and	r7, r0, #65280
	and	r3, r2, r0, lsr #8
	orr	r3, r3, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r7, lsl #8
	and	r2, r2, r1, lsr #8
	orr	r0, r0, r3
	and	r3, r1, #65280
	orr	r2, r2, r1, lsr #24
	lsl	r1, r1, #24
	orr	r1, r1, r3, lsl #8
	orr	r1, r1, r2
.LBB69_77:
	bl	__aeabi_d2lz
	mov	r8, r0
	b	.LBB69_115
.LBB69_78:
	ldr	r7, .LCPI69_44
	ldr	r3, .LCPI69_43
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	blt	.LBB69_106
	ldr	r3, .LCPI69_48
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_112
	ldr	r1, .LCPI69_49
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_50
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldrh	r8, [r4]
	b	.LBB69_115
.LBB69_82:
	ldr	r1, .LCPI69_101
	ldr	r3, .LCPI69_102
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_32
	ldr	r1, .LCPI69_103
	ldr	r3, .LCPI69_104
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_103
	ldr	r1, .LCPI69_105
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_106
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldr	r8, [r4]
	b	.LBB69_115
.LBB69_86:
	ldr	r3, .LCPI69_86
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_113
	ldr	r1, .LCPI69_87
	ldr	r3, .LCPI69_88
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_32
	ldr	r1, .LCPI69_89
	eor	r1, r2, r1
	ldr	r2, .LCPI69_90
.LBB69_89:
	eor	r0, r0, r2
	mov	r3, #0
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldr	r1, [sp, #24]
	ldr	r0, [r1]
	ldr	r2, [r1, #4]
	b	.LBB69_111
.LBB69_91:
	ldr	r3, .LCPI69_69
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_109
	ldr	r1, .LCPI69_70
	ldr	r3, .LCPI69_71
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB69_32
	ldr	r1, .LCPI69_72
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_73
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldrb	r8, [r4]
	b	.LBB69_115
.LBB69_95:
	ldr	r1, .LCPI69_95
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB69_103
	ldr	r1, .LCPI69_96
	eor	r1, r2, r1
	ldr	r2, .LCPI69_97
	b	.LBB69_108
.LBB69_97:
	ldr	r3, .LCPI69_80
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_110
	ldr	r1, .LCPI69_81
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_82
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldr	r0, [r4]
	mov	r1, #65280
	and	r2, r0, #65280
	and	r1, r1, r0, lsr #8
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r2, r0, r2, lsl #8
	orr	r8, r2, r1
	asr	r1, r0, #31
	b	.LBB69_115
.LBB69_100:
	ldr	r3, .LCPI69_63
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_103
	ldr	r1, .LCPI69_64
	mov	r3, #0
	eor	r1, r2, r1
	ldr	r2, .LCPI69_65
	eor	r0, r0, r2
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
	ldrsb	r8, [r4]
	asr	r1, r8, #31
	b	.LBB69_115
.LBB69_103:
	ldr	r8, [r4]
	b	.LBB69_75
.LBB69_104:
	ldr	r3, .LCPI69_53
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB69_114
	ldr	r1, .LCPI69_54
	eor	r1, r2, r1
	ldr	r2, .LCPI69_55
	b	.LBB69_108
.LBB69_106:
	ldr	r1, .LCPI69_45
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB69_117
	ldr	r1, .LCPI69_46
	eor	r1, r2, r1
	ldr	r2, .LCPI69_47
.LBB69_108:
	eor	r0, r0, r2
	mov	r3, #0
	orrs	r0, r1, r0
	mov	r1, #0
	bne	.LBB69_116
.LBB69_109:
	ldr	r8, [r4]
	ldr	r1, [r4, #4]
	b	.LBB69_115
.LBB69_110:
	ldr	r0, [r4]
	ldr	r2, [r4, #4]
.LBB69_111:
	mov	r3, #65280
	and	r1, r3, r0, lsr #8
	and	r7, r0, #65280
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r7, lsl #8
	orr	r1, r0, r1
	and	r0, r3, r2, lsr #8
	and	r3, r2, #65280
	orr	r0, r0, r2, lsr #24
	lsl	r2, r2, #24
	orr	r2, r2, r3, lsl #8
	orr	r8, r2, r0
	b	.LBB69_115
.LBB69_112:
	ldrsh	r8, [r4]
	asr	r1, r8, #31
	b	.LBB69_115
.LBB69_113:
	ldrh	r8, [r4]
	b	.LBB69_75
.LBB69_114:
	ldrh	r0, [r4]
	lsl	r1, r0, #8
	orr	r0, r1, r0, lsr #8
	lsl	r0, r0, #16
	asr	r1, r0, #31
	asr	r8, r0, #16
.LBB69_115:
	mov	r3, #1
.LBB69_116:
	strb	r3, [r11, #8]
	str	r8, [r11]
	str	r1, [r11, #4]
	add	sp, sp, #36
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB69_117:
	ldrh	r0, [r4]
	lsl	r1, r0, #8
	orr	r0, r1, r0, lsr #8
	mov	r1, #255
	orr	r1, r1, #65280
	and	r8, r0, r1
	b	.LBB69_75
.LBB69_118:
	stmib	sp, {r0, r1, r3, r4}
	mov	r1, #51
	mov	r3, #8
	ldr	r0, [sp, #28]
	str	r2, [sp]
	mov	r2, #69
	str	r0, [sp, #20]
	orr	r2, r2, #1280
	ldr	r0, .LCPI69_36
	bl	"runtime::type_assertion_check2_with_context.handle_error-0"
	.p2align	2
.LCPI69_0:
	.long	.L__$type_info_data
.LCPI69_1:
	.long	".L__$ti-0"
.LCPI69_2:
	.long	4061431485
.LCPI69_3:
	.long	919139866
.LCPI69_4:
	.long	1693165202
.LCPI69_5:
	.long	3971323377
.LCPI69_6:
	.long	3685864165
.LCPI69_7:
	.long	3047933354
.LCPI69_8:
	.long	3988153103
.LCPI69_9:
	.long	4066164137
.LCPI69_10:
	.long	778414328
.LCPI69_11:
	.long	326884768
.LCPI69_12:
	.long	326884769
.LCPI69_13:
	.long	70189487
.LCPI69_14:
	.long	972035155
.LCPI69_15:
	.long	3597656501
.LCPI69_16:
	.long	1273736861
.LCPI69_17:
	.long	2237362591
.LCPI69_18:
	.long	168533802
.LCPI69_19:
	.long	1593006517
.LCPI69_20:
	.long	747444013
.LCPI69_21:
	.long	1035496754
.LCPI69_22:
	.long	1004200369
.LCPI69_23:
	.long	1004200370
.LCPI69_24:
	.long	2875826662
.LCPI69_25:
	.long	1626279920
.LCPI69_26:
	.long	519926174
.LCPI69_27:
	.long	1782300454
.LCPI69_28:
	.long	3869536690
.LCPI69_29:
	.long	2584292428
.LCPI69_30:
	.long	3440116163
.LCPI69_31:
	.long	3913933989
.LCPI69_32:
	.long	400544229
.LCPI69_33:
	.long	3972699277
.LCPI69_34:
	.long	586708279
.LCPI69_35:
	.long	1164085392
.LCPI69_36:
	.long	".Lcsbs$POC-Example$158"
.LCPI69_37:
	.long	826997542
.LCPI69_38:
	.long	951270734
.LCPI69_39:
	.long	1571068702
.LCPI69_40:
	.long	3422454002
.LCPI69_41:
	.long	2014745563
.LCPI69_42:
	.long	2543566172
.LCPI69_43:
	.long	2083772720
.LCPI69_44:
	.long	2765151452
.LCPI69_45:
	.long	2765151453
.LCPI69_46:
	.long	1961540866
.LCPI69_47:
	.long	2147365262
.LCPI69_48:
	.long	2543566173
.LCPI69_49:
	.long	4093975810
.LCPI69_50:
	.long	2078322779
.LCPI69_51:
	.long	1759336533
.LCPI69_52:
	.long	3692985697
.LCPI69_53:
	.long	3692985698
.LCPI69_54:
	.long	491610505
.LCPI69_55:
	.long	1892912397
.LCPI69_56:
	.long	3422454003
.LCPI69_57:
	.long	159261012
.LCPI69_58:
	.long	1611042776
.LCPI69_59:
	.long	1194933334
.LCPI69_60:
	.long	454565266
.LCPI69_61:
	.long	1338159828
.LCPI69_62:
	.long	1680707818
.LCPI69_63:
	.long	1680707819
.LCPI69_64:
	.long	3728466315
.LCPI69_65:
	.long	1402735377
.LCPI69_66:
	.long	454565267
.LCPI69_67:
	.long	2124771595
.LCPI69_68:
	.long	1201977439
.LCPI69_69:
	.long	951270735
.LCPI69_70:
	.long	1340100945
.LCPI69_71:
	.long	936009341
.LCPI69_72:
	.long	3853066515
.LCPI69_73:
	.long	1032104133
.LCPI69_74:
	.long	502970347
.LCPI69_75:
	.long	2573139159
.LCPI69_76:
	.long	645795731
.LCPI69_77:
	.long	70271380
.LCPI69_78:
	.long	764030577
.LCPI69_79:
	.long	1237721379
.LCPI69_80:
	.long	1237721380
.LCPI69_81:
	.long	930476392
.LCPI69_82:
	.long	824957074
.LCPI69_83:
	.long	70271381
.LCPI69_84:
	.long	540712202
.LCPI69_85:
	.long	699342078
.LCPI69_86:
	.long	2573139160
.LCPI69_87:
	.long	2602103172
.LCPI69_88:
	.long	512274138
.LCPI69_89:
	.long	2219277689
.LCPI69_90:
	.long	619147782
.LCPI69_91:
	.long	2838995518
.LCPI69_92:
	.long	3175783652
.LCPI69_93:
	.long	3990515063
.LCPI69_94:
	.long	1315131623
.LCPI69_95:
	.long	1315131624
.LCPI69_96:
	.long	2267398412
.LCPI69_97:
	.long	216749986
.LCPI69_98:
	.long	3175783653
.LCPI69_99:
	.long	2513395067
.LCPI69_100:
	.long	3191702550
.LCPI69_101:
	.long	675385718
.LCPI69_102:
	.long	2524010688
.LCPI69_103:
	.long	2428448026
.LCPI69_104:
	.long	2660435127
.LCPI69_105:
	.long	426601705
.LCPI69_106:
	.long	2698242406
.Lfunc_end69:
	.size	"reflect::as_i64", .Lfunc_end69-"reflect::as_i64"
	.fnend

	.globl	__gnu_f2h_ieee
	.p2align	2
	.type	__gnu_f2h_ieee,%function
	.code	32
__gnu_f2h_ieee:
	.fnstart
	b	__truncsfhf2
.Lfunc_end70:
	.size	__gnu_f2h_ieee, .Lfunc_end70-__gnu_f2h_ieee
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
.Lfunc_end71:
	.size	__extendhfsf2, .Lfunc_end71-__extendhfsf2
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::fmt_int",%function
	.code	32
"fmt::fmt_int":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.pad	#40
	sub	sp, sp, #40
	ldr	r1, [sp, #80]
	ldr	r4, [sp, #84]
	sub	r6, r1, #77
	cmp	r6, #45
	bhi	.LBB72_14
	ldr	r10, [sp, #76]
	ldr	r5, [sp, #72]
	adr	r7, .LJTI72_0
	ldr	pc, [r7, r6, lsl #2]
	.p2align	2
.LJTI72_0:
	.long	.LBB72_9
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_12
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_11
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_10
	.long	.LBB72_4
	.long	.LBB72_3
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_3
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_18
	.long	.LBB72_14
	.long	.LBB72_20
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_4
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_14
	.long	.LBB72_3
	.long	.LBB72_3
	.long	.LBB72_15
	.long	.LBB72_14
	.long	.LBB72_8
.LBB72_3:
	mov	r1, #17
	str	r4, [sp, #20]
	str	r1, [sp, #16]
	ldr	r1, .LCPI72_4
	str	r1, [sp, #12]
	mov	r1, #10
	b	.LBB72_21
.LBB72_4:
	mov	r3, r2
	cmp	r1, #114
	beq	.LBB72_7
	cmp	r1, #113
	beq	.LBB72_27
	cmp	r1, #99
	bne	.LBB72_28
.LBB72_7:
	ldr	r1, [r0, #40]
	ldr	r2, [r0, #44]
	add	r0, r0, #84
	stm	sp, {r0, r4}
	add	r0, sp, #24
	bl	"io::write_rune"
	b	.LBB72_23
.LBB72_8:
	mov	r1, #17
	str	r4, [sp, #20]
	str	r1, [sp, #16]
	ldr	r1, .LCPI72_4
	str	r1, [sp, #12]
	mov	r1, #12
	b	.LBB72_21
.LBB72_9:
	mov	r1, #26
	str	r4, [sp, #16]
	str	r1, [sp, #12]
	ldr	r1, .LCPI72_0
	b	.LBB72_19
.LBB72_10:
	mov	r1, #17
	str	r4, [sp, #20]
	str	r1, [sp, #16]
	ldr	r1, .LCPI72_4
	str	r1, [sp, #12]
	mov	r1, #2
	b	.LBB72_21
.LBB72_11:
	mov	r1, #17
	str	r4, [sp, #20]
	str	r1, [sp, #16]
	ldr	r1, .LCPI72_3
	b	.LBB72_16
.LBB72_12:
	cmp	r2, #1114112
	blo	.LBB72_24
	mov	r1, #85
.LBB72_14:
	mov	r2, r4
	add	sp, sp, #40
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	"fmt::fmt_bad_verb"
.LBB72_15:
	mov	r1, #17
	str	r4, [sp, #20]
	str	r1, [sp, #16]
	ldr	r1, .LCPI72_4
.LBB72_16:
	str	r1, [sp, #12]
	stmib	sp, {r5, r10}
.LBB72_17:
	mov	r1, #16
	b	.LBB72_22
.LBB72_18:
	mov	r1, #26
	str	r4, [sp, #16]
	str	r1, [sp, #12]
	ldr	r1, .LCPI72_1
.LBB72_19:
	str	r1, [sp, #8]
	stm	sp, {r5, r10}
	bl	"fmt::_fmt_memory"
	b	.LBB72_23
.LBB72_20:
	mov	r1, #17
	str	r4, [sp, #20]
	str	r1, [sp, #16]
	ldr	r1, .LCPI72_4
	str	r1, [sp, #12]
	mov	r1, #8
.LBB72_21:
	stmib	sp, {r5, r10}
.LBB72_22:
	str	r1, [sp]
	bl	"fmt::_fmt_int"
.LBB72_23:
	add	sp, sp, #40
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
.LBB72_24:
	ldr	r5, [r0, #40]
	cmp	r5, #0
	beq	.LBB72_26
	ldr	lr, .LCPI72_2
	add	r12, sp, #24
	ldr	r1, [r0, #44]
	mov	r7, #0
	mov	r8, r0
	mov	r9, r2
	mov	r6, r3
	str	r7, [sp, #32]
	str	r7, [sp, #28]
	mov	r0, r12
	str	r7, [sp, #24]
	mov	r2, #4
	mov	r3, lr
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	mov	r7, #2
	str	r4, [sp, #20]
	str	r7, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [r8, #84]
	mov	r3, r6
	ldr	r7, [sp, #24]
	mov	r0, r8
	mov	r2, r9
	add	r1, r1, r7
	str	r1, [r8, #84]
.LBB72_26:
	mov	r1, #17
	str	r4, [sp, #20]
	str	r1, [sp, #16]
	ldr	r1, .LCPI72_3
	str	r1, [sp, #12]
	mov	r1, #0
	str	r10, [sp, #8]
	str	r1, [sp, #4]
	b	.LBB72_17
.LBB72_27:
	ldr	r2, [r0, #40]
	mov	r5, r0
	ldr	r1, [r0, #44]
	mov	r0, r2
	mov	r2, r3
	mov	r3, r4
	bl	"io::write_quoted_rune"
	ldr	r1, [r5, #84]
	add	r0, r1, r0
	str	r0, [r5, #84]
	b	.LBB72_23
.LBB72_28:
	mov	r2, #32
	mov	r7, #0
	str	r2, [sp, #4]
	mov	r2, r3
	mov	r3, #0
	str	r7, [sp]
	str	r1, [sp, #8]
	str	r4, [sp, #12]
	bl	"fmt::fmt_int"
	b	.LBB72_23
	.p2align	2
.LCPI72_0:
	.long	".Lcsbs$POC-Example$2"
.LCPI72_1:
	.long	".Lcsbs$POC-Example$1"
.LCPI72_2:
	.long	".Lcsbs$POC-Example$176"
.LCPI72_3:
	.long	".Lcsbs$POC-Example$4"
.LCPI72_4:
	.long	".Lcsbs$POC-Example$3"
.Lfunc_end72:
	.size	"fmt::fmt_int", .Lfunc_end72-"fmt::fmt_int"
	.fnend

	.globl	__floattidf
	.p2align	2
	.type	__floattidf,%function
	.code	32
__floattidf:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#116
	sub	sp, sp, #116
	orr	r7, r1, r3
	orr	r6, r0, r2
	orrs	r7, r6, r7
	beq	.LBB73_5
	eor	r0, r0, r3, asr #31
	eor	r1, r1, r3, asr #31
	subs	r8, r0, r3, asr #31
	eor	r2, r2, r3, asr #31
	sbcs	r7, r1, r3, asr #31
	eor	r5, r3, r3, asr #31
	sbcs	r6, r2, r3, asr #31
	mov	r10, r3
	sbc	r5, r5, r3, asr #31
	mov	r0, r5
	bl	__clzsi2
	mov	r9, r0
	mov	r0, r6
	bl	__clzsi2
	cmp	r5, #0
	addeq	r9, r0, #32
	mov	r0, r7
	bl	__clzsi2
	mov	r4, r0
	mov	r0, r8
	bl	__clzsi2
	cmp	r7, #0
	asr	r12, r10, #31
	addeq	r4, r0, #32
	orrs	r0, r6, r5
	addeq	r9, r4, #64
	subs	r0, r7, #2097152
	sbcs	r0, r6, #0
	eor	lr, r9, #127
	sbcs	r0, r5, #0
	blo	.LBB73_6
	and	r0, r9, #127
	cmp	r0, #73
	beq	.LBB73_7
	cmp	r9, #74
	bne	.LBB73_8
	lsl	r0, r7, #1
	lsl	r3, r6, #1
	orr	r0, r0, r8, lsr #31
	orr	r6, r3, r7, lsr #31
	lsl	r8, r8, #1
	b	.LBB73_9
.LBB73_5:
	mov	r0, #0
	mov	r1, #0
	b	.LBB73_13
.LBB73_6:
	mov	r0, #0
	add	r1, r9, #53
	str	r0, [sp, #92]
	and	r2, r1, #96
	str	r0, [sp, #88]
	and	r1, r1, #31
	str	r0, [sp, #84]
	str	r0, [sp, #80]
	add	r0, sp, #80
	add	r0, r0, #16
	str	r7, [sp, #100]
	str	r8, [sp, #96]
	eor	r7, r1, #31
	str	r6, [sp, #104]
	str	r5, [sp, #108]
	ldr	r2, [r0, -r2, lsr #3]!
	ldr	r0, [r0, #4]
	lsr	r3, r2, #1
	lsl	r0, r0, r1
	orr	r3, r0, r3, lsr r7
	lsl	r0, r2, r1
	b	.LBB73_12
.LBB73_7:
	mov	r0, r7
	b	.LBB73_9
.LBB73_8:
	mov	r3, #255
	mov	r1, #12
	orr	r3, r3, #256
	and	r1, r1, r9, lsr #3
	add	r2, sp, #48
	mov	r0, #0
	str	r3, [sp, #56]
	mvn	r3, #0
	add	r4, r2, r1
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	mov	r11, #0
	str	r0, [sp, #68]
	str	r0, [sp, #64]
	str	r0, [sp, #60]
	str	r3, [sp, #52]
	str	r3, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r1, [sp, #4]
	ldr	r2, [r4, #4]
	str	r2, [sp]
	ldr	r3, [r4, #8]
	ldr	r4, [r4, #12]
	str	r8, [sp, #16]
	str	r7, [sp, #20]
	str	r6, [sp, #24]
	str	r5, [sp, #28]
	str	r12, [sp, #12]
	ldr	r12, .LCPI73_0
	str	lr, [sp, #8]
	lsl	lr, r3, #1
	subs	r1, r12, r7
	and	r12, r9, #31
	rscs	r1, r6, #0
	eor	r10, r12, #31
	rscs	r1, r5, #0
	movlo	r11, #1
	cmp	r11, #0
	mov	r1, r11
	lsrne	r1, r4, r12
	and	r1, r1, r5
	lsr	r5, r2, r12
	mov	r2, r11
	orrne	r2, r5, lr, lsl r10
	and	r2, r2, r7
	mov	r7, r11
	orr	r1, r2, r1
	lsr	r2, r3, r12
	lsl	r3, r4, #1
	orrne	r7, r2, r3, lsl r10
	add	r3, sp, #48
	and	r2, r7, r6
	ldr	r7, [sp, #4]
	ldr	r3, [r3, r7]
	ldr	r7, [sp]
	lsl	r7, r7, #1
	lsr	r3, r3, r12
	orrne	r11, r3, r7, lsl r10
	and	r3, r11, r8
	orr	r2, r3, r2
	add	r3, sp, #16
	orrs	r8, r2, r1
	mov	r2, #12
	movne	r8, #1
	rsbs	r1, r9, #73
	and	r5, r1, #31
	and	r2, r2, r1, lsr #3
	ldr	r7, [r3, r2]
	add	r2, r3, r2
	ldr	r10, [r2, #4]
	ldr	r4, [r2, #8]
	ldr	r12, [r2, #12]
	eor	r2, r5, #31
	lsl	r6, r10, #1
	lsr	r7, r7, r5
	orr	lr, r7, r6, lsl r2
	sbcs	r6, r0, #0
	sbcs	r7, r0, #0
	sbc	r3, r0, #0
	subs	r1, r1, #128
	sbcs	r1, r6, #0
	sbcs	r1, r7, #0
	sbcs	r1, r3, #0
	lsl	r3, r12, #1
	movlo	r0, #1
	orrlo	r8, r8, lr
	cmp	r0, #0
	mov	r6, r0
	lsr	r1, r4, r5
	orrne	r6, r1, r3, lsl r2
	ldr	lr, [sp, #8]
	lsl	r3, r4, #1
	ldr	r12, [sp, #12]
	lsr	r1, r10, r5
	orrne	r0, r1, r3, lsl r2
.LBB73_9:
	mov	r1, #1
	and	r1, r1, r8, lsr #2
	orr	r1, r1, r8
	adds	r5, r1, #1
	adcs	r7, r0, #0
	adcs	r3, r6, #0
	tst	r7, #8388608
	bne	.LBB73_11
	lsr	r0, r5, #2
	lsr	r1, r7, #2
	orr	r0, r0, r7, lsl #30
	orr	r3, r1, r3, lsl #30
	b	.LBB73_12
.LBB73_11:
	lsr	r0, r5, #3
	lsr	r1, r7, #3
	orr	r0, r0, r7, lsl #29
	orr	r3, r1, r3, lsl #29
	rsb	lr, r9, #128
.LBB73_12:
	ldr	r1, .LCPI73_1
	and	r2, r12, #-2147483648
	orr	r2, r2, lr, lsl #20
	and	r1, r3, r1
	orr	r1, r2, r1
	add	r1, r1, #267386880
	add	r1, r1, #805306368
.LBB73_13:
	add	sp, sp, #116
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI73_0:
	.long	8388607
.LCPI73_1:
	.long	1048575
.Lfunc_end73:
	.size	__floattidf, .Lfunc_end73-__floattidf
	.cantunwind
	.fnend

	.globl	__floattidf_unsigned
	.p2align	2
	.type	__floattidf_unsigned,%function
	.code	32
__floattidf_unsigned:
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#116
	sub	sp, sp, #116
	mov	r8, r0
	mov	r7, r1
	orr	r0, r1, r3
	orr	r1, r8, r2
	orrs	r0, r1, r0
	beq	.LBB74_5
	mov	r0, r3
	mov	r5, r3
	mov	r6, r2
	bl	__clzsi2
	mov	r9, r0
	mov	r0, r6
	bl	__clzsi2
	cmp	r5, #0
	addeq	r9, r0, #32
	mov	r0, r7
	bl	__clzsi2
	mov	r4, r0
	mov	r0, r8
	bl	__clzsi2
	cmp	r7, #0
	addeq	r4, r0, #32
	orrs	r0, r6, r5
	addeq	r9, r4, #64
	subs	r0, r7, #2097152
	sbcs	r0, r6, #0
	eor	r10, r9, #127
	sbcs	r0, r5, #0
	blo	.LBB74_6
	and	r0, r9, #127
	cmp	r0, #73
	beq	.LBB74_7
	cmp	r9, #74
	bne	.LBB74_8
	lsl	r0, r7, #1
	lsl	r2, r6, #1
	orr	r0, r0, r8, lsr #31
	orr	r6, r2, r7, lsr #31
	lsl	r8, r8, #1
	b	.LBB74_9
.LBB74_5:
	mov	r0, #0
	mov	r1, #0
	b	.LBB74_13
.LBB74_6:
	mov	r0, #0
	add	r2, sp, #80
	str	r0, [sp, #92]
	mov	r1, #12
	str	r0, [sp, #88]
	add	r2, r2, #16
	str	r0, [sp, #84]
	str	r0, [sp, #80]
	sub	r0, r9, #75
	str	r8, [sp, #96]
	and	r1, r1, r0, lsr #3
	str	r7, [sp, #100]
	str	r6, [sp, #104]
	and	r0, r0, #31
	str	r5, [sp, #108]
	eor	r7, r0, #31
	ldr	r1, [r2, -r1]!
	ldr	r2, [r2, #4]
	lsr	r3, r1, #1
	lsl	r2, r2, r0
	lsl	r0, r1, r0
	orr	r2, r2, r3, lsr r7
	b	.LBB74_12
.LBB74_7:
	mov	r0, r7
	b	.LBB74_9
.LBB74_8:
	mov	r2, #255
	mov	r1, #12
	orr	r2, r2, #256
	str	r2, [sp, #56]
	mvn	r2, #0
	and	r1, r1, r9, lsr #3
	str	r2, [sp, #52]
	mov	r0, #0
	str	r2, [sp, #48]
	add	r2, sp, #48
	add	r4, r2, r1
	ldr	r2, .LCPI74_0
	str	r0, [sp, #76]
	mov	r11, #0
	str	r0, [sp, #72]
	subs	r2, r2, r7
	str	r0, [sp, #68]
	rscs	r2, r6, #0
	str	r0, [sp, #64]
	rscs	r2, r5, #0
	str	r0, [sp, #60]
	movlo	r11, #1
	str	r0, [sp, #44]
	cmp	r11, #0
	str	r0, [sp, #40]
	mov	r2, r11
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r1, [sp, #12]
	and	r1, r9, #31
	ldr	r12, [r4, #4]
	str	r12, [sp, #8]
	ldr	r3, [r4, #12]
	ldr	lr, [r4, #8]
	str	r3, [sp, #4]
	lsrne	r2, r3, r1
	and	r4, r2, r5
	mov	r3, lr
	lsl	r2, lr, #1
	eor	lr, r1, #31
	str	r5, [sp, #28]
	lsr	r5, r12, r1
	mov	r12, r11
	orrne	r12, r5, r2, lsl lr
	str	r8, [sp, #16]
	str	r7, [sp, #20]
	and	r2, r12, r7
	str	r6, [sp, #24]
	mov	r5, r11
	ldr	r7, [sp, #4]
	lsr	r3, r3, r1
	orr	r2, r2, r4
	lsl	r7, r7, #1
	orrne	r5, r3, r7, lsl lr
	add	r7, sp, #48
	and	r3, r5, r6
	ldr	r6, [sp, #12]
	ldr	r7, [r7, r6]
	lsr	r1, r7, r1
	ldr	r7, [sp, #8]
	lsl	r7, r7, #1
	orrne	r11, r1, r7, lsl lr
	and	r1, r11, r8
	orr	r1, r1, r3
	add	r3, sp, #16
	orrs	r8, r1, r2
	mov	r2, #12
	movne	r8, #1
	rsbs	r1, r9, #73
	and	r5, r1, #31
	and	r2, r2, r1, lsr #3
	ldr	r7, [r3, r2]
	add	r2, r3, r2
	ldr	r11, [r2, #4]
	ldr	r4, [r2, #8]
	ldr	r12, [r2, #12]
	eor	r2, r5, #31
	lsl	r6, r11, #1
	lsr	r7, r7, r5
	orr	lr, r7, r6, lsl r2
	sbcs	r6, r0, #0
	sbcs	r7, r0, #0
	sbc	r3, r0, #0
	subs	r1, r1, #128
	sbcs	r1, r6, #0
	sbcs	r1, r7, #0
	sbcs	r1, r3, #0
	lsl	r3, r12, #1
	movlo	r0, #1
	orrlo	r8, r8, lr
	cmp	r0, #0
	mov	r6, r0
	lsr	r1, r4, r5
	orrne	r6, r1, r3, lsl r2
	lsl	r3, r4, #1
	lsr	r1, r11, r5
	orrne	r0, r1, r3, lsl r2
.LBB74_9:
	mov	r1, #1
	and	r1, r1, r8, lsr #2
	orr	r1, r1, r8
	adds	r7, r1, #1
	adcs	r3, r0, #0
	adcs	r2, r6, #0
	tst	r3, #8388608
	bne	.LBB74_11
	lsr	r0, r7, #2
	lsr	r1, r3, #2
	orr	r0, r0, r3, lsl #30
	orr	r2, r1, r2, lsl #30
	b	.LBB74_12
.LBB74_11:
	lsr	r0, r7, #3
	lsr	r1, r3, #3
	orr	r0, r0, r3, lsl #29
	orr	r2, r1, r2, lsl #29
	rsb	r10, r9, #128
.LBB74_12:
	ldr	r1, .LCPI74_1
	and	r1, r2, r1
	orr	r1, r1, r10, lsl #20
	add	r1, r1, #267386880
	add	r1, r1, #805306368
.LBB74_13:
	add	sp, sp, #116
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI74_0:
	.long	8388607
.LCPI74_1:
	.long	1048575
.Lfunc_end74:
	.size	__floattidf_unsigned, .Lfunc_end74-__floattidf_unsigned
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::fmt_int_128",%function
	.code	32
"fmt::fmt_int_128":
	.fnstart
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	.pad	#56
	sub	sp, sp, #56
	mov	r12, r2
	ldr	r2, [r1]
	ldr	r6, [r1, #4]
	ldr	r5, [r1, #8]
	ldr	r1, [r1, #12]
	str	r1, [sp, #36]
	sub	r1, r3, #85
	str	r5, [sp, #32]
	cmp	r1, #37
	str	r6, [sp, #28]
	str	r2, [sp, #24]
	ldr	r4, [sp, #72]
	bhi	.LBB75_20
	adr	r2, .LJTI75_0
	ldr	pc, [r2, r1, lsl #2]
	.p2align	2
.LJTI75_0:
	.long	.LBB75_13
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_15
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_12
	.long	.LBB75_5
	.long	.LBB75_3
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_3
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_11
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_5
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_20
	.long	.LBB75_3
	.long	.LBB75_3
	.long	.LBB75_9
	.long	.LBB75_20
	.long	.LBB75_10
.LBB75_3:
	mov	r1, #17
	str	r4, [sp, #8]
	str	r1, [sp, #4]
	mov	r2, #10
.LBB75_4:
	ldr	r1, .LCPI75_2
	str	r1, [sp]
	add	r1, sp, #24
	b	.LBB75_17
.LBB75_5:
	ldr	r12, [sp, #24]
	cmp	r3, #114
	beq	.LBB75_8
	cmp	r3, #113
	beq	.LBB75_22
	cmp	r3, #99
	bne	.LBB75_23
.LBB75_8:
	ldr	r1, [r0, #40]
	mov	r3, r12
	ldr	r2, [r0, #44]
	add	r0, r0, #84
	stm	sp, {r0, r4}
	add	r0, sp, #40
	bl	"io::write_rune"
	b	.LBB75_19
.LBB75_9:
	mov	r1, #17
	str	r4, [sp, #8]
	str	r1, [sp, #4]
	ldr	r1, .LCPI75_2
	b	.LBB75_16
.LBB75_10:
	mov	r1, #17
	str	r4, [sp, #8]
	str	r1, [sp, #4]
	mov	r2, #12
	b	.LBB75_4
.LBB75_11:
	mov	r1, #17
	str	r4, [sp, #8]
	str	r1, [sp, #4]
	mov	r2, #8
	b	.LBB75_4
.LBB75_12:
	mov	r1, #17
	str	r4, [sp, #8]
	str	r1, [sp, #4]
	mov	r2, #2
	b	.LBB75_4
.LBB75_13:
	ldr	r1, [sp, #24]
	cmp	r1, #1114112
	blo	.LBB75_24
	mov	r1, #85
	b	.LBB75_21
.LBB75_15:
	mov	r1, #17
	str	r4, [sp, #8]
	str	r1, [sp, #4]
	ldr	r1, .LCPI75_1
.LBB75_16:
	str	r1, [sp]
	add	r1, sp, #24
	mov	r2, #16
.LBB75_17:
	mov	r3, r12
.LBB75_18:
	bl	"fmt::_fmt_int_128"
.LBB75_19:
	add	sp, sp, #56
	pop	{r4, r5, r6, lr}
	mov	pc, lr
.LBB75_20:
	mov	r1, r3
.LBB75_21:
	mov	r2, r4
	add	sp, sp, #56
	pop	{r4, r5, r6, lr}
	b	"fmt::fmt_bad_verb"
.LBB75_22:
	ldr	r2, [r0, #40]
	mov	r5, r0
	ldr	r1, [r0, #44]
	mov	r3, r4
	mov	r0, r2
	mov	r2, r12
	bl	"io::write_quoted_rune"
	ldr	r1, [r5, #84]
	add	r0, r1, r0
	str	r0, [r5, #84]
	b	.LBB75_19
.LBB75_23:
	mov	r1, #32
	mov	r2, #0
	str	r2, [sp]
	mov	r2, r12
	stmib	sp, {r1, r3, r4}
	mov	r3, #0
	bl	"fmt::fmt_int"
	b	.LBB75_19
.LBB75_24:
	ldr	r5, [r0, #40]
	cmp	r5, #0
	beq	.LBB75_26
	mov	r2, #0
	ldr	r1, [r0, #44]
	str	r2, [sp, #48]
	mov	r6, r0
	str	r2, [sp, #44]
	str	r2, [sp, #40]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	mov	r2, #2
	str	r2, [sp]
	add	r2, sp, #40
	ldr	r3, .LCPI75_0
	mov	r0, r2
	mov	r2, #4
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [r6, #84]
	mov	r0, r6
	ldr	r2, [sp, #40]
	add	r1, r1, r2
	str	r1, [r6, #84]
.LBB75_26:
	mov	r1, #17
	mov	r2, #16
	str	r1, [sp, #4]
	mov	r3, #0
	ldr	r1, .LCPI75_1
	str	r1, [sp]
	add	r1, sp, #24
	str	r4, [sp, #8]
	b	.LBB75_18
	.p2align	2
.LCPI75_0:
	.long	".Lcsbs$POC-Example$176"
.LCPI75_1:
	.long	".Lcsbs$POC-Example$4"
.LCPI75_2:
	.long	".Lcsbs$POC-Example$3"
.Lfunc_end75:
	.size	"fmt::fmt_int_128", .Lfunc_end75-"fmt::fmt_int_128"
	.fnend

	.globl	__umodti3
	.p2align	2
	.type	__umodti3,%function
	.code	32
__umodti3:
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	.pad	#64
	sub	sp, sp, #64
	mov	r4, r0
	add	r0, sp, #48
	str	r0, [sp, #24]
	ldr	r0, [sp, #92]
	str	r0, [sp, #20]
	ldr	r0, [sp, #88]
	str	r0, [sp, #16]
	ldr	r0, [sp, #84]
	str	r0, [sp, #12]
	ldr	r0, [sp, #80]
	str	r0, [sp, #8]
	ldr	r0, [sp, #76]
	str	r0, [sp, #4]
	ldr	r0, [sp, #72]
	str	r0, [sp]
	add	r0, sp, #32
	bl	"runtime::udivmod128"
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	add	sp, sp, #64
	pop	{r4, lr}
	mov	pc, lr
.Lfunc_end76:
	.size	__umodti3, .Lfunc_end76-__umodti3
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::_pad",%function
	.code	32
"fmt::_pad":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#52
	sub	sp, sp, #52
	mov	r10, r0
	ldrb	r0, [r0, #5]
	mov	r6, r2
	mov	r8, r1
	cmp	r0, #0
	str	r3, [sp, #24]
	beq	.LBB77_42
	ldr	lr, [r10, #12]
	mov	r1, #0
	cmp	r6, #1
	blt	.LBB77_19
	ldr	r9, .LCPI77_1
	mov	r2, #0
.LBB77_3:
	cmp	r2, r6
	bhs	.LBB77_49
	ldrb	r0, [r8, r2]
	lsl	r3, r0, #24
	asrs	r3, r3, #24
	bpl	.LBB77_7
	ldrb	r4, [r9, r0]
	cmp	r4, #241
	beq	.LBB77_7
	and	r11, r4, #7
	add	r5, r2, r11
	cmp	r5, r6
	ble	.LBB77_9
.LBB77_7:
	add	r2, r2, #1
.LBB77_8:
	add	r1, r1, #1
	cmp	r2, r6
	blt	.LBB77_3
	b	.LBB77_19
.LBB77_9:
	add	r3, r3, #62
	lsr	r4, r4, #4
	and	r3, r3, #255
	cmp	r3, #51
	bhs	.LBB77_50
	add	r7, r2, #1
	cmp	r7, r6
	bhs	.LBB77_51
	ldr	r5, .LCPI77_2
	ldrb	r12, [r5, r4, lsl #1]!
	ldrb	r4, [r8, r7]
	mov	r7, #1
	cmp	r4, r12
	blo	.LBB77_13
	ldrb	r5, [r5, #1]
	cmp	r5, r4
	movhs	r7, #2
	cmphs	r3, #30
	bhs	.LBB77_14
.LBB77_13:
	add	r2, r7, r2
	b	.LBB77_8
.LBB77_14:
	add	r3, r2, #2
	cmp	r3, r6
	bhs	.LBB77_52
	add	r3, r8, r3
	mov	r7, #1
	ldrsb	r3, [r3]
	cmn	r3, #65
	bgt	.LBB77_13
	and	r0, r0, #240
	mov	r7, #3
	cmp	r0, #224
	beq	.LBB77_13
	add	r0, r2, #3
	cmp	r0, r6
	bhs	.LBB77_55
	add	r0, r8, r0
	ldrsb	r0, [r0]
	cmn	r0, #65
	movgt	r11, #1
	mov	r7, r11
	b	.LBB77_13
.LBB77_19:
	ldrb	r0, [r10]
	sub	r5, lr, r1
	cmp	r0, #0
	beq	.LBB77_27
	ldr	r7, [r10, #40]
	cmp	r7, #0
	beq	.LBB77_22
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #40]
	mov	r2, #4
	str	r0, [sp, #36]
	mov	r3, r8
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #24]
	str	r0, [sp, #20]
	add	r0, sp, #32
	str	r6, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #32]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB77_22:
	cmp	r5, #1
	blt	.LBB77_45
	ldrb	r0, [r10, #2]
	mov	r6, #32
	add	r8, sp, #31
	add	r11, sp, #32
	cmp	r0, #0
	mov	r9, #1
	moveq	r6, #48
	mov	r7, #0
	b	.LBB77_25
.LBB77_24:
	subs	r5, r5, #1
	beq	.LBB77_45
.LBB77_25:
	ldr	r4, [r10, #40]
	ldr	r1, [r10, #44]
	cmp	r4, #0
	strb	r6, [sp, #31]
	beq	.LBB77_24
	ldr	r0, [sp, #24]
	mov	r2, #4
	str	r0, [sp, #20]
	mov	r0, r11
	mov	r3, r8
	str	r7, [sp, #40]
	str	r7, [sp, #36]
	str	r7, [sp, #32]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #32]
	add	r0, r0, r1
	str	r0, [r10, #84]
	b	.LBB77_24
.LBB77_27:
	ldrb	r0, [r10, #2]
	cmp	r0, #0
	bne	.LBB77_37
	cmp	r6, #0
	beq	.LBB77_37
	ldrb	r2, [r8]
	cmp	r2, #45
	cmpne	r2, #43
	bne	.LBB77_37
	ldr	r7, [r10, #40]
	ldr	r1, [r10, #44]
	cmp	r7, #0
	strb	r2, [sp, #31]
	beq	.LBB77_32
	mov	r0, #0
	add	r3, sp, #31
	str	r0, [sp, #40]
	mov	r2, #4
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #24]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #32
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #32]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB77_32:
	cmp	r5, #1
	blt	.LBB77_46
	ldrb	r0, [r10, #2]
	mov	r11, #32
	add	r9, sp, #32
	mov	r7, #0
	cmp	r0, #0
	moveq	r11, #48
	b	.LBB77_35
.LBB77_34:
	subs	r5, r5, #1
	beq	.LBB77_46
.LBB77_35:
	ldr	r4, [r10, #40]
	ldr	r1, [r10, #44]
	cmp	r4, #0
	strb	r11, [sp, #31]
	beq	.LBB77_34
	ldr	r0, [sp, #24]
	add	r3, sp, #31
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	mov	r0, r9
	mov	r2, #4
	str	r7, [sp, #40]
	str	r7, [sp, #36]
	str	r7, [sp, #32]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #32]
	add	r0, r0, r1
	str	r0, [r10, #84]
	b	.LBB77_34
.LBB77_37:
	cmp	r5, #1
	blt	.LBB77_42
	mov	r7, #32
	cmp	r0, #0
	add	r9, sp, #32
	moveq	r7, #48
	mov	r11, #0
	b	.LBB77_40
.LBB77_39:
	subs	r5, r5, #1
	beq	.LBB77_42
.LBB77_40:
	ldr	r4, [r10, #40]
	ldr	r1, [r10, #44]
	cmp	r4, #0
	strb	r7, [sp, #31]
	beq	.LBB77_39
	ldr	r0, [sp, #24]
	add	r3, sp, #31
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	mov	r0, r9
	mov	r2, #4
	str	r11, [sp, #40]
	str	r11, [sp, #36]
	str	r11, [sp, #32]
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #32]
	add	r0, r0, r1
	str	r0, [r10, #84]
	b	.LBB77_39
.LBB77_42:
	ldr	r5, [r10, #40]
	cmp	r5, #0
	beq	.LBB77_45
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #40]
	mov	r2, #4
	str	r0, [sp, #36]
	mov	r3, r8
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #24]
	str	r0, [sp, #20]
	add	r0, sp, #32
	str	r6, [sp]
.LBB77_44:
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #32]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB77_45:
	add	sp, sp, #52
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB77_46:
	cmp	r6, #0
	ble	.LBB77_54
	ldr	r5, [r10, #40]
	cmp	r5, #0
	beq	.LBB77_45
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #40]
	add	r3, r8, #1
	str	r0, [sp, #36]
	mov	r2, #4
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #24]
	str	r0, [sp, #20]
	sub	r0, r6, #1
	str	r0, [sp]
	add	r0, sp, #32
	b	.LBB77_44
.LBB77_49:
	stm	sp, {r2, r6}
	mov	r2, #93
	orr	r2, r2, #256
	ldr	r0, .LCPI77_0
	mov	r1, #53
	mov	r3, #11
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB77_50:
	mov	r0, #5
	mov	r1, #53
	str	r0, [sp, #4]
	mov	r2, #364
	ldr	r0, .LCPI77_0
	mov	r3, #23
	str	r4, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB77_51:
	mov	r2, #109
	ldr	r0, .LCPI77_0
	orr	r2, r2, #256
	mov	r1, #53
	mov	r3, #13
	str	r7, [sp]
	str	r6, [sp, #4]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB77_52:
	ldr	r0, .LCPI77_0
	mov	r2, #113
	stm	sp, {r3, r6}
.LBB77_53:
	orr	r2, r2, #256
	mov	r1, #53
	mov	r3, #20
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB77_54:
	mov	r0, #1
	mov	r2, #117
	stm	sp, {r0, r6}
	orr	r2, r2, #1280
	mov	r1, #43
	ldr	r0, .LCPI77_3
	mov	r3, #31
	str	r6, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB77_55:
	stm	sp, {r0, r6}
	mov	r2, #117
	ldr	r0, .LCPI77_0
	b	.LBB77_53
	.p2align	2
.LCPI77_0:
	.long	".Lcsbs$POC-Example$104"
.LCPI77_1:
	.long	"runtime::string_decode_rune-.accept_sizes-11694"
.LCPI77_2:
	.long	"utf8::accept_ranges"
.LCPI77_3:
	.long	".Lcsbs$POC-Example$156"
.Lfunc_end77:
	.size	"fmt::_pad", .Lfunc_end77-"fmt::_pad"
	.fnend

	.globl	__udivmodti4
	.p2align	2
	.type	__udivmodti4,%function
	.code	32
__udivmodti4:
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	.pad	#48
	sub	sp, sp, #48
	mov	r4, r0
	mov	r0, #0
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	ldr	r0, [sp, #80]
	str	r0, [sp, #24]
	ldr	r0, [sp, #76]
	str	r0, [sp, #20]
	ldr	r0, [sp, #72]
	str	r0, [sp, #16]
	ldr	r0, [sp, #68]
	str	r0, [sp, #12]
	ldr	r0, [sp, #64]
	str	r0, [sp, #8]
	ldr	r0, [sp, #60]
	str	r0, [sp, #4]
	ldr	r0, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #32
	bl	"runtime::udivmod128"
	add	r3, sp, #32
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	add	sp, sp, #48
	pop	{r4, lr}
	mov	pc, lr
.Lfunc_end78:
	.size	__udivmodti4, .Lfunc_end78-__udivmodti4
	.cantunwind
	.fnend

	.globl	__udivti3
	.p2align	2
	.type	__udivti3,%function
	.code	32
__udivti3:
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	.pad	#48
	sub	sp, sp, #48
	mov	r4, r0
	mov	r0, #0
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r0, [sp, #24]
	ldr	r0, [sp, #76]
	str	r0, [sp, #20]
	ldr	r0, [sp, #72]
	str	r0, [sp, #16]
	ldr	r0, [sp, #68]
	str	r0, [sp, #12]
	ldr	r0, [sp, #64]
	str	r0, [sp, #8]
	ldr	r0, [sp, #60]
	str	r0, [sp, #4]
	ldr	r0, [sp, #56]
	str	r0, [sp]
	add	r0, sp, #32
	bl	"runtime::udivmod128"
	add	r3, sp, #32
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	add	sp, sp, #48
	pop	{r4, lr}
	mov	pc, lr
.Lfunc_end79:
	.size	__udivti3, .Lfunc_end79-__udivti3
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::_fmt_float_as",%function
	.code	32
"fmt::_fmt_float_as":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#428
	sub	sp, sp, #428
	mov	r5, #130
	mov	r4, r0
	ldrb	r0, [r0, #6]
	add	r9, sp, #40
	orr	r5, r5, #256
	mov	r7, r2
	cmp	r0, #0
	mov	r0, r9
	ldrne	r8, [r4, #16]
	mov	r1, #0
	mov	r2, r5
	mov	r6, r3
	ldr	r11, [sp, #468]
	mov	r10, #0
	ldreq	r8, [sp, #472]
	bl	memset
	ldr	r0, [sp, #464]
	mov	r1, r9
	str	r0, [sp, #16]
	add	r0, sp, #32
	stmib	sp, {r6, r11}
	mov	r2, r5
	ldr	r6, [sp, #476]
	str	r10, [sp, #36]
	str	r10, [sp, #32]
	str	r7, [sp]
	str	r8, [sp, #12]
	str	r6, [sp, #20]
	bl	"strconv::write_float"
	ldrb	r1, [r4, #1]
	ldr	r0, [sp, #32]
	ldr	r2, [sp, #36]
	cmp	r1, #0
	bne	.LBB80_5
	cmp	r2, #0
	beq	.LBB80_9
	ldrb	r1, [r0]
	cmp	r1, #43
	bne	.LBB80_5
	cmp	r2, #1
	beq	.LBB80_10
	mov	r1, r0
	ldrb	r3, [r1, #1]!
	cmp	r3, #73
	bne	.LBB80_7
.LBB80_5:
	mov	r1, r0
.LBB80_6:
	mov	r0, r4
	mov	r3, r6
	bl	"fmt::_pad"
	add	sp, sp, #428
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB80_7:
	cmp	r2, #0
	ble	.LBB80_11
	sub	r2, r2, #1
	b	.LBB80_6
.LBB80_9:
	mov	r0, #0
	mov	r2, #147
	str	r0, [sp]
	orr	r2, r2, #1280
	str	r0, [sp, #4]
	mov	r1, #43
	ldr	r0, .LCPI80_0
	mov	r3, #10
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB80_10:
	mov	r0, #1
	mov	r2, #147
	str	r0, [sp]
	orr	r2, r2, #1280
	str	r0, [sp, #4]
	mov	r1, #43
	ldr	r0, .LCPI80_0
	mov	r3, #27
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB80_11:
	mov	r0, #1
	str	r2, [sp, #8]
	stm	sp, {r0, r2}
	mov	r2, #404
	orr	r2, r2, #1024
	ldr	r0, .LCPI80_0
	mov	r1, #43
	mov	r3, #13
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI80_0:
	.long	".Lcsbs$POC-Example$156"
.Lfunc_end80:
	.size	"fmt::_fmt_float_as", .Lfunc_end80-"fmt::_fmt_float_as"
	.fnend

	.p2align	2
	.type	"fmt::fmt_float",%function
	.code	32
"fmt::fmt_float":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.pad	#128
	sub	sp, sp, #128
	ldr	r5, [sp, #164]
	ldr	r4, [sp, #168]
	sub	r1, r5, #69
	cmp	r1, #50
	bhi	.LBB81_8
	ldr	r7, [sp, #160]
	adr	r6, .LJTI81_0
	ldr	pc, [r6, r1, lsl #2]
	.p2align	2
.LJTI81_0:
	.long	.LBB81_9
	.long	.LBB81_4
	.long	.LBB81_3
	.long	.LBB81_5
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_10
	.long	.LBB81_4
	.long	.LBB81_3
	.long	.LBB81_5
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_8
	.long	.LBB81_3
	.long	.LBB81_3
.LBB81_3:
	mvn	r1, #0
	mov	r6, #103
	b	.LBB81_11
.LBB81_4:
	mov	r1, #3
	mov	r6, #102
	b	.LBB81_11
.LBB81_5:
	add	r1, sp, #24
	mov	r8, r0
	mov	r9, r2
	mov	r2, #88
	mov	r0, r1
	mov	r1, r8
	mov	r6, r3
	bl	memcpy
	mov	r1, #0
	mov	r2, #1
	cmp	r7, #64
	str	r7, [r8, #12]
	strb	r1, [r8, #4]
	strb	r2, [r8, #3]
	strb	r1, [r8, #1]
	beq	.LBB81_13
	cmp	r7, #32
	mov	r1, r6
	mov	r0, r9
	bne	.LBB81_14
	bl	__aeabi_d2f
	mov	r2, r0
	mov	r0, r8
	mov	r3, #0
	b	.LBB81_16
.LBB81_8:
	mov	r1, r5
	mov	r2, r4
	add	sp, sp, #128
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	"fmt::fmt_bad_verb"
.LBB81_9:
	mov	r1, #6
	mov	r6, #69
	b	.LBB81_11
.LBB81_10:
	mov	r1, #6
	mov	r6, #101
.LBB81_11:
	str	r7, [sp]
	str	r6, [sp, #4]
	str	r1, [sp, #8]
	str	r4, [sp, #12]
	bl	"fmt::_fmt_float_as"
.LBB81_12:
	add	sp, sp, #128
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
.LBB81_13:
	mov	r0, r8
	mov	r3, r6
	mov	r2, r9
	b	.LBB81_16
.LBB81_14:
	cmp	r7, #16
	bne	.LBB81_19
	bl	__aeabi_d2h
	mov	r1, #255
	mov	r3, #0
	orr	r1, r1, #65280
	and	r2, r0, r1
	mov	r0, r8
.LBB81_16:
	ldr	r6, [r0, #40]
	cmp	r6, #0
	beq	.LBB81_18
	ldr	r1, [r0, #44]
	mov	r0, #0
	ldr	r12, .LCPI81_0
	mov	r9, r2
	str	r0, [sp, #120]
	mov	r10, r3
	str	r0, [sp, #116]
	mov	r2, #4
	str	r0, [sp, #112]
	mov	r3, r12
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #112
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r1, [r8, #84]
	mov	r2, r9
	ldr	r6, [sp, #112]
	mov	r3, r10
	mov	r0, r8
	add	r1, r1, r6
	str	r1, [r8, #84]
.LBB81_18:
	mov	r1, #17
	ldr	r6, .LCPI81_2
	str	r1, [sp, #16]
	cmp	r5, #104
	ldr	r1, .LCPI81_1
	str	r4, [sp, #20]
	mov	r4, r0
	str	r7, [sp, #8]
	moveq	r6, r1
	mov	r1, #0
	str	r1, [sp, #4]
	mov	r1, #16
	str	r6, [sp, #12]
	str	r1, [sp]
	bl	"fmt::_fmt_int"
	add	r1, sp, #24
	mov	r0, r4
	mov	r2, #88
	bl	memcpy
	b	.LBB81_12
.LBB81_19:
	ldr	r0, [r4, #16]
	mov	r3, #20
	str	r4, [sp, #4]
	ldr	r4, .LCPI81_4
	cmp	r0, #0
	movne	r4, r0
	ldr	r0, .LCPI81_5
	ldr	r2, .LCPI81_6
	ldr	r1, .LCPI81_3
	str	r1, [sp]
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI81_0:
	.long	".Lcsbs$POC-Example$179"
.LCPI81_1:
	.long	".Lcsbs$POC-Example$3"
.LCPI81_2:
	.long	".Lcsbs$POC-Example$4"
.LCPI81_3:
	.long	".Lscl$[fmt_float41672]"
.LCPI81_4:
	.long	"runtime::default_assertion_failure_proc"
.LCPI81_5:
	.long	".Lcsbs$POC-Example$17b"
.LCPI81_6:
	.long	".Lcsbs$POC-Example$177"
.Lfunc_end81:
	.size	"fmt::fmt_float", .Lfunc_end81-"fmt::fmt_float"
	.fnend

	.p2align	2
	.type	"fmt::fmt_string",%function
	.code	32
"fmt::fmt_string":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#68
	sub	sp, sp, #68
	mov	r4, r0
	ldr	r0, [r0, #76]
	ldr	r5, [sp, #104]
	mov	r7, r2
	mov	r8, r1
	cmp	r0, #1
	bne	.LBB82_3
	ldr	r0, [r4, #72]
	bic	r0, r0, r0, asr #31
	cmp	r0, r7
	movge	r0, r7
	cmn	r7, #1
	ble	.LBB82_51
	mov	r7, r0
.LBB82_3:
	ldrb	r0, [r4, #8]
	str	r5, [sp, #32]
	cmp	r0, #0
	beq	.LBB82_15
.LBB82_4:
	sub	r0, r3, #88
	cmp	r0, #32
	bhi	.LBB82_42
	adr	r1, .LJTI82_0
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI82_0:
	.long	.LBB82_7
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_17
	.long	.LBB82_42
	.long	.LBB82_32
	.long	.LBB82_42
	.long	.LBB82_42
	.long	.LBB82_32
	.long	.LBB82_17
	.long	.LBB82_7
.LBB82_7:
	ldrb	r9, [r4, #2]
	mov	r0, #0
	cmp	r7, #1
	strb	r0, [r4, #2]
	blt	.LBB82_31
	mov	r1, #17
	ldrb	r2, [r8]
	str	r1, [sp, #16]
	cmp	r3, #120
	ldr	r1, .LCPI82_0
	mov	r10, #16
	ldr	r6, .LCPI82_1
	mov	r3, #0
	str	r5, [sp, #20]
	moveq	r6, r1
	mov	r1, #8
	stmib	sp, {r0, r1}
	mov	r0, r4
	str	r6, [sp, #12]
	str	r10, [sp]
	bl	"fmt::_fmt_int"
	subs	r7, r7, #1
	beq	.LBB82_31
	add	r8, r8, #1
	mov	r11, #0
	b	.LBB82_12
.LBB82_10:
	ldr	r5, [sp, #32]
.LBB82_11:
	ldrb	r2, [r8], #1
	mov	r0, #8
	str	r0, [sp, #8]
	mov	r0, #17
	str	r0, [sp, #16]
	mov	r0, r4
	mov	r3, #0
	stm	sp, {r10, r11}
	str	r6, [sp, #12]
	str	r5, [sp, #20]
	bl	"fmt::_fmt_int"
	subs	r7, r7, #1
	beq	.LBB82_31
.LBB82_12:
	cmp	r9, #0
	beq	.LBB82_11
	ldr	r5, [r4, #40]
	mov	r0, #32
	ldr	r1, [r4, #44]
	cmp	r5, #0
	strb	r0, [sp, #36]
	beq	.LBB82_10
	str	r11, [sp, #56]
	add	r3, sp, #36
	str	r11, [sp, #52]
	mov	r2, #4
	str	r11, [sp, #48]
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	ldr	r0, [sp, #32]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #48
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #48]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB82_10
.LBB82_15:
	ldr	r0, [r4, #68]
	cmp	r0, #1
	blt	.LBB82_4
	cmp	r3, #118
	bne	.LBB82_4
.LBB82_17:
	ldr	r6, [r4, #40]
	mov	r0, #34
	ldr	r10, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #36]
	beq	.LBB82_41
	mov	r0, #0
	add	r3, sp, #36
	str	r0, [sp, #56]
	mov	r1, r10
	str	r0, [sp, #52]
	mov	r2, #4
	str	r0, [sp, #48]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #48
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #56]
	ldr	r9, [sp, #48]
	cmp	r0, #0
	bne	.LBB82_47
	cmp	r7, #1
	str	r6, [sp, #28]
	blt	.LBB82_46
	add	r0, sp, #48
	mov	r6, #1
	mov	r11, #0
.LBB82_21:
	ldrsb	r3, [r8]
	mov	r5, #1
	cmn	r3, #1
	ble	.LBB82_25
.LBB82_22:
	mov	r0, #34
	mov	r2, r10
	str	r0, [sp]
	ldr	r0, [sp, #32]
	str	r0, [sp, #4]
	add	r0, sp, #36
	ldr	r1, [sp, #28]
	bl	"io::write_escaped_rune"
	ldr	r0, [sp, #36]
	ldr	r1, [sp, #40]
	add	r9, r0, r9
	cmp	r1, #0
	bne	.LBB82_47
.LBB82_23:
	cmp	r7, r5
	mov	r0, #0
	mov	r1, #0
	movge	r0, #1
	movhs	r1, #1
	tst	r1, r0
	beq	.LBB82_50
	add	r8, r8, r5
	subs	r7, r7, r5
	add	r0, sp, #48
	bne	.LBB82_21
	b	.LBB82_46
.LBB82_25:
	mov	r1, r8
	mov	r2, r7
	str	r11, [sp, #52]
	str	r11, [sp, #48]
	bl	"utf8::decode_rune_in_bytes"
	ldr	r5, [sp, #52]
	ldr	r3, [sp, #48]
	cmp	r5, #1
	bne	.LBB82_22
	mov	r0, #253
	orr	r0, r0, #65280
	cmp	r3, r0
	add	r0, sp, #48
	bne	.LBB82_22
	mov	r1, #92
	str	r11, [sp, #56]
	strb	r1, [sp, #47]
	add	r3, sp, #47
	str	r11, [sp, #52]
	mov	r1, r10
	str	r11, [sp, #48]
	mov	r2, #4
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	ldr	r5, [sp, #32]
	str	r5, [sp, #20]
	str	r6, [sp]
	ldr	r6, [sp, #28]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	ldr	r1, [sp, #56]
	add	r9, r9, r0
	cmp	r1, #0
	bne	.LBB82_47
	mov	r0, #120
	str	r11, [sp, #56]
	strb	r0, [sp, #47]
	mov	r0, #1
	str	r11, [sp, #52]
	add	r3, sp, #47
	str	r11, [sp, #48]
	mov	r1, r10
	str	r0, [sp]
	add	r0, sp, #48
	mov	r2, #4
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	ldr	r1, [sp, #56]
	add	r9, r9, r0
	cmp	r1, #0
	bne	.LBB82_47
	ldrb	r0, [r8]
	add	r3, sp, #47
	ldr	r1, .LCPI82_0
	mov	r2, #4
	str	r11, [sp, #56]
	str	r11, [sp, #52]
	ldrb	r0, [r1, r0, lsr #4]
	mov	r1, r10
	str	r11, [sp, #48]
	strb	r0, [sp, #47]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #48
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	ldr	r1, [sp, #56]
	add	r9, r9, r0
	cmp	r1, #0
	bne	.LBB82_47
	ldrb	r0, [r8]
	add	r3, sp, #47
	ldr	r1, .LCPI82_0
	mov	r2, #4
	and	r0, r0, #15
	str	r11, [sp, #56]
	str	r11, [sp, #52]
	ldrb	r0, [r1, r0]
	mov	r1, r10
	str	r11, [sp, #48]
	strb	r0, [sp, #47]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #48
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	mov	r5, #1
	ldr	r1, [sp, #56]
	mov	r6, #1
	add	r9, r9, r0
	cmp	r1, #0
	beq	.LBB82_23
	b	.LBB82_47
.LBB82_31:
	strb	r9, [r4, #2]
	b	.LBB82_49
.LBB82_32:
	ldrb	r0, [r4, #5]
	cmp	r0, #0
	beq	.LBB82_44
	ldr	r0, [r4, #12]
	cmp	r0, r7
	ble	.LBB82_44
	ldrb	r1, [r4]
	cmp	r1, #0
	ldrne	r5, [r4, #40]
	cmpne	r5, #0
	beq	.LBB82_36
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #56]
	mov	r2, #4
	str	r0, [sp, #52]
	mov	r3, r8
	str	r0, [sp, #48]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #32]
	str	r0, [sp, #20]
	add	r0, sp, #48
	str	r7, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #48]
	add	r1, r1, r2
	str	r1, [r4, #84]
.LBB82_36:
	sub	r1, r0, r7
	cmp	r1, #1
	blt	.LBB82_43
	add	r9, sp, #48
	mov	r6, #0
	mov	r11, #32
	mov	r10, #0
	b	.LBB82_39
.LBB82_38:
	sub	r1, r0, r7
	add	r10, r10, #1
	cmp	r10, r1
	bge	.LBB82_43
.LBB82_39:
	ldr	r5, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r5, #0
	strb	r11, [sp, #36]
	beq	.LBB82_38
	str	r6, [sp, #56]
	add	r3, sp, #36
	str	r6, [sp, #52]
	mov	r2, #4
	str	r6, [sp, #48]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	ldr	r0, [sp, #32]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	mov	r0, r9
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #48]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB82_38
.LBB82_41:
	mov	r9, #0
	b	.LBB82_47
.LBB82_42:
	mov	r0, r4
	mov	r1, r3
	mov	r2, r5
	add	sp, sp, #68
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_bad_verb"
.LBB82_43:
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.LBB82_49
.LBB82_44:
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB82_49
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #56]
	mov	r2, #4
	str	r0, [sp, #52]
	mov	r3, r8
	str	r0, [sp, #48]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #32]
	str	r0, [sp, #20]
	add	r0, sp, #48
	str	r7, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #48]
	add	r0, r0, r1
	b	.LBB82_48
.LBB82_46:
	mov	r0, #34
	add	r3, sp, #47
	strb	r0, [sp, #47]
	mov	r0, #0
	str	r0, [sp, #56]
	mov	r1, r10
	str	r0, [sp, #52]
	mov	r2, #4
	str	r0, [sp, #48]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #32]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #48
	ldr	r5, [sp, #28]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [sp, #48]
	add	r9, r9, r0
.LBB82_47:
	ldr	r0, [r4, #84]
	add	r0, r0, r9
.LBB82_48:
	str	r0, [r4, #84]
.LBB82_49:
	add	sp, sp, #68
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB82_50:
	mov	r2, #18
	ldr	r0, .LCPI82_2
	orr	r2, r2, #256
	mov	r1, #43
	mov	r3, #43
	stm	sp, {r5, r7}
	str	r7, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB82_51:
	mov	r2, #209
	stmib	sp, {r0, r7}
	mov	r1, #0
	ldr	r0, .LCPI82_3
	orr	r2, r2, #1280
	str	r1, [sp]
	mov	r1, #43
	mov	r3, #8
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI82_0:
	.long	".Lcsbs$POC-Example$3"
.LCPI82_1:
	.long	".Lcsbs$POC-Example$4"
.LCPI82_2:
	.long	".Lcsbs$POC-Example$118"
.LCPI82_3:
	.long	".Lcsbs$POC-Example$156"
.Lfunc_end82:
	.size	"fmt::fmt_string", .Lfunc_end82-"fmt::fmt_string"
	.fnend

	.p2align	2
	.type	"fmt::fmt_cstring",%function
	.code	32
"fmt::fmt_cstring":
	.fnstart
	.save	{r11, lr}
	push	{r11, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r12, r2
	cmp	r1, #0
	beq	.LBB83_6
	mov	lr, r1
.LBB83_2:
	ldrb	r2, [lr]
	cmp	r2, #0
	beq	.LBB83_5
	adds	lr, lr, #1
	blo	.LBB83_2
	mov	lr, #0
.LBB83_5:
	sub	r2, lr, r1
	b	.LBB83_7
.LBB83_6:
	mov	r2, #0
.LBB83_7:
	str	r3, [sp]
	mov	r3, r12
	bl	"fmt::fmt_string"
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
.Lfunc_end83:
	.size	"fmt::fmt_cstring", .Lfunc_end83-"fmt::fmt_cstring"
	.fnend

	.p2align	2
	.type	"fmt::fmt_string16",%function
	.code	32
"fmt::fmt_string16":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#100
	sub	sp, sp, #100
	mov	r4, r0
	ldr	r0, [r0, #76]
	ldr	r8, [sp, #136]
	mov	r10, r2
	mov	r7, r1
	cmp	r0, #1
	bne	.LBB84_3
	ldr	r0, [r4, #72]
	bic	r0, r0, r0, asr #31
	cmp	r0, r10
	movge	r0, r10
	cmn	r10, #1
	ble	.LBB84_56
	mov	r10, r0
.LBB84_3:
	ldrb	r0, [r4, #8]
	cmp	r0, #0
	beq	.LBB84_14
.LBB84_4:
	sub	r0, r3, #88
	cmp	r0, #32
	bhi	.LBB84_48
	adr	r1, .LJTI84_0
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI84_0:
	.long	.LBB84_7
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_16
	.long	.LBB84_48
	.long	.LBB84_37
	.long	.LBB84_48
	.long	.LBB84_48
	.long	.LBB84_37
	.long	.LBB84_16
	.long	.LBB84_7
.LBB84_7:
	ldrb	r0, [r4, #2]
	cmp	r10, #1
	str	r0, [sp, #32]
	mov	r0, #0
	strb	r0, [r4, #2]
	blt	.LBB84_36
	mov	r1, #17
	ldrh	r2, [r7]
	str	r1, [sp, #16]
	cmp	r3, #120
	ldr	r1, .LCPI84_0
	mov	r11, #16
	ldr	r5, .LCPI84_1
	mov	r3, #0
	stmib	sp, {r0, r11}
	mov	r0, r4
	moveq	r5, r1
	mov	r6, r7
	str	r8, [sp, #20]
	str	r5, [sp, #12]
	str	r11, [sp]
	bl	"fmt::_fmt_int"
	subs	r7, r10, #1
	beq	.LBB84_36
	add	r10, r6, #2
	mov	r9, #0
	b	.LBB84_11
.LBB84_10:
	ldrh	r2, [r10], #2
	mov	r0, #17
	str	r0, [sp, #16]
	mov	r0, r4
	mov	r3, #0
	str	r11, [sp]
	stmib	sp, {r9, r11}
	str	r5, [sp, #12]
	str	r8, [sp, #20]
	bl	"fmt::_fmt_int"
	subs	r7, r7, #1
	beq	.LBB84_36
.LBB84_11:
	ldr	r0, [sp, #32]
	cmp	r0, #0
	beq	.LBB84_10
	ldr	r6, [r4, #40]
	mov	r0, #32
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #68]
	beq	.LBB84_10
	mov	r0, #1
	str	r9, [sp, #88]
	str	r9, [sp, #84]
	add	r3, sp, #68
	str	r9, [sp, #80]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #80
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB84_10
.LBB84_14:
	ldr	r0, [r4, #68]
	cmp	r0, #1
	blt	.LBB84_4
	cmp	r3, #118
	bne	.LBB84_4
.LBB84_16:
	ldr	r6, [r4, #40]
	mov	r0, #34
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #68]
	beq	.LBB84_46
	mov	r0, #0
	add	r3, sp, #68
	str	r0, [sp, #88]
	mov	r2, #4
	str	r0, [sp, #84]
	mov	r5, r1
	str	r0, [sp, #80]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #80
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #88]
	ldr	r11, [sp, #80]
	cmp	r0, #0
	bne	.LBB84_47
	mov	r12, r5
	cmp	r10, #1
	blt	.LBB84_35
	mov	r5, r7
	add	r7, sp, #80
	mov	r2, #1
	mov	r9, #0
	str	r6, [sp, #24]
	str	r8, [sp, #28]
.LBB84_20:
	ldrh	r3, [r5]
	str	r5, [sp, #32]
	sub	r0, r3, #57344
	cmn	r0, #2048
	bhs	.LBB84_23
	mov	r0, #253
	orr	r0, r0, #65280
	cmp	r3, r0
	beq	.LBB84_28
	mov	r6, #1
	b	.LBB84_27
.LBB84_23:
	cmp	r10, #1
	beq	.LBB84_28
	lsr	r0, r3, #10
	cmp	r0, #54
	bhi	.LBB84_28
	ldrh	r0, [r5, #2]
	and	r1, r0, #64512
	cmp	r1, #56320
	bne	.LBB84_28
	ldr	r1, .LCPI84_2
	add	r0, r0, r3, lsl #10
	mov	r6, #2
	add	r3, r0, r1
.LBB84_27:
	mov	r0, #34
	mov	r2, r12
	stm	sp, {r0, r8}
	add	r0, sp, #68
	mov	r5, r12
	ldr	r1, [sp, #24]
	bl	"io::write_escaped_rune"
	ldr	r0, [sp, #68]
	mov	r12, r5
	ldr	r1, [sp, #72]
	add	r11, r0, r11
	cmp	r1, #0
	beq	.LBB84_33
	b	.LBB84_47
.LBB84_28:
	mov	r0, #92
	add	r3, sp, #79
	strb	r0, [sp, #79]
	mov	r0, r7
	str	r9, [sp, #88]
	mov	r1, r12
	str	r9, [sp, #84]
	mov	r5, r12
	str	r9, [sp, #80]
	str	r2, [sp]
	mov	r2, #4
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #80]
	ldr	r1, [sp, #88]
	add	r11, r11, r0
	cmp	r1, #0
	bne	.LBB84_47
	mov	r0, #120
	add	r3, sp, #79
	strb	r0, [sp, #79]
	mov	r0, #1
	str	r9, [sp, #88]
	mov	r1, r5
	str	r9, [sp, #84]
	mov	r2, #4
	str	r9, [sp, #80]
	str	r0, [sp]
	mov	r0, r7
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #80]
	ldr	r1, [sp, #88]
	add	r11, r11, r0
	cmp	r1, #0
	bne	.LBB84_47
	ldr	r0, [sp, #32]
	ldrh	r1, [r0]
	cmp	r1, #272
	lsr	r0, r1, #4
	bhs	.LBB84_58
	ldr	r1, .LCPI84_0
	add	r7, sp, #80
	str	r9, [sp, #88]
	add	r3, sp, #79
	str	r9, [sp, #84]
	mov	r2, #4
	ldrb	r0, [r1, r0]
	mov	r1, r5
	str	r9, [sp, #80]
	strb	r0, [sp, #79]
	mov	r0, #1
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	ldr	r8, [sp, #28]
	str	r0, [sp]
	mov	r0, r7
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #80]
	ldr	r1, [sp, #88]
	add	r11, r11, r0
	cmp	r1, #0
	bne	.LBB84_47
	ldr	r0, [sp, #32]
	add	r3, sp, #79
	ldr	r1, .LCPI84_0
	mov	r2, #4
	ldrh	r0, [r0]
	str	r9, [sp, #88]
	and	r0, r0, #15
	str	r9, [sp, #84]
	str	r9, [sp, #80]
	ldrb	r0, [r1, r0]
	mov	r1, r5
	strb	r0, [sp, #79]
	mov	r0, #1
	str	r0, [sp]
	mov	r0, r7
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #80]
	mov	r6, #1
	ldr	r1, [sp, #88]
	mov	r12, r5
	add	r11, r11, r0
	cmp	r1, #0
	bne	.LBB84_47
.LBB84_33:
	cmp	r10, r6
	blo	.LBB84_57
	ldr	r5, [sp, #32]
	sub	r10, r10, r6
	ldr	r8, [sp, #28]
	add	r7, sp, #80
	add	r5, r5, r6, lsl #1
	ldr	r6, [sp, #24]
	cmp	r10, #0
	mov	r2, #1
	bgt	.LBB84_20
.LBB84_35:
	mov	r0, #34
	add	r3, sp, #79
	strb	r0, [sp, #79]
	mov	r0, #0
	str	r0, [sp, #88]
	mov	r1, r12
	str	r0, [sp, #84]
	mov	r2, #4
	str	r0, [sp, #80]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #80
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #80]
	add	r11, r11, r0
	b	.LBB84_47
.LBB84_36:
	ldr	r0, [sp, #32]
	strb	r0, [r4, #2]
	b	.LBB84_53
.LBB84_37:
	ldrb	r0, [r4, #5]
	cmp	r0, #0
	beq	.LBB84_49
	ldr	r0, [r4, #12]
	cmp	r0, r10
	ble	.LBB84_50
	ldrb	r1, [r4]
	cmp	r1, #0
	beq	.LBB84_41
	ldr	r1, [r4, #40]
	add	r0, r4, #84
	ldr	r2, [r4, #44]
	mov	r3, r7
	stmib	sp, {r0, r8}
	add	r0, sp, #60
	str	r10, [sp]
	bl	"io::write_string16"
	ldr	r0, [r4, #12]
.LBB84_41:
	sub	r1, r0, r10
	str	r7, [sp, #32]
	cmp	r1, #1
	blt	.LBB84_54
	add	r9, sp, #80
	mov	r6, #0
	mov	r11, #32
	mov	r5, #0
	b	.LBB84_44
.LBB84_43:
	sub	r1, r0, r10
	add	r5, r5, #1
	cmp	r5, r1
	bge	.LBB84_54
.LBB84_44:
	ldr	r7, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r7, #0
	strb	r11, [sp, #68]
	beq	.LBB84_43
	mov	r0, #1
	add	r3, sp, #68
	str	r6, [sp, #88]
	mov	r2, #4
	str	r6, [sp, #84]
	str	r6, [sp, #80]
	str	r0, [sp]
	mov	r0, r9
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #80]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB84_43
.LBB84_46:
	mov	r11, #0
.LBB84_47:
	ldr	r0, [r4, #84]
	add	r0, r0, r11
	str	r0, [r4, #84]
	b	.LBB84_53
.LBB84_48:
	mov	r0, r4
	mov	r1, r3
	mov	r2, r8
	add	sp, sp, #100
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_bad_verb"
.LBB84_49:
	add	r0, r4, #84
	ldr	r1, [r4, #40]
	ldr	r2, [r4, #44]
	stmib	sp, {r0, r8}
	add	r0, sp, #36
	b	.LBB84_51
.LBB84_50:
	ldr	r1, [r4, #40]
	add	r0, r4, #84
	ldr	r2, [r4, #44]
	stmib	sp, {r0, r8}
	add	r0, sp, #44
.LBB84_51:
	str	r10, [sp]
	mov	r3, r7
.LBB84_52:
	bl	"io::write_string16"
.LBB84_53:
	add	sp, sp, #100
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB84_54:
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.LBB84_53
	add	r0, r4, #84
	ldr	r1, [r4, #40]
	ldr	r2, [r4, #44]
	stmib	sp, {r0, r8}
	add	r0, sp, #52
	str	r10, [sp]
	ldr	r3, [sp, #32]
	b	.LBB84_52
.LBB84_56:
	mov	r2, #25
	stmib	sp, {r0, r10}
	mov	r1, #0
	ldr	r0, .LCPI84_4
	orr	r2, r2, #1536
	str	r1, [sp]
	mov	r1, #43
	mov	r3, #8
	bl	"runtime::slice_handle_error"
.LBB84_57:
	ldr	r0, .LCPI84_3
	mov	r1, #43
	mov	r2, #300
	mov	r3, #43
	stm	sp, {r6, r10}
	str	r10, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB84_58:
	mov	r2, #53
	mov	r1, #17
	stm	sp, {r0, r1}
	orr	r2, r2, #256
	mov	r1, #43
	ldr	r0, .LCPI84_3
	mov	r3, #31
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI84_0:
	.long	".Lcsbs$POC-Example$3"
.LCPI84_1:
	.long	".Lcsbs$POC-Example$4"
.LCPI84_2:
	.long	4238353408
.LCPI84_3:
	.long	".Lcsbs$POC-Example$118"
.LCPI84_4:
	.long	".Lcsbs$POC-Example$156"
.Lfunc_end84:
	.size	"fmt::fmt_string16", .Lfunc_end84-"fmt::fmt_string16"
	.fnend

	.p2align	2
	.type	"fmt::fmt_cstring16",%function
	.code	32
"fmt::fmt_cstring16":
	.fnstart
	.save	{r4, lr}
	push	{r4, lr}
	.pad	#8
	sub	sp, sp, #8
	mov	r12, r2
	mov	r2, #0
	cmp	r1, #0
	beq	.LBB85_3
	mov	lr, r1
.LBB85_2:
	ldrh	r4, [lr]
	cmp	r4, #0
	addne	r2, r2, #1
	addsne	lr, lr, #2
	bne	.LBB85_2
.LBB85_3:
	str	r3, [sp]
	mov	r3, r12
	bl	"fmt::fmt_string16"
	add	sp, sp, #8
	pop	{r4, lr}
	mov	pc, lr
.Lfunc_end85:
	.size	"fmt::fmt_cstring16", .Lfunc_end85-"fmt::fmt_cstring16"
	.fnend

	.p2align	2
	.type	"fmt::fmt_pointer",%function
	.code	32
"fmt::fmt_pointer":
	.fnstart
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.pad	#40
	sub	sp, sp, #40
	sub	r4, r2, #88
	cmp	r4, #34
	bhi	.LBB86_9
	adr	r7, .LJTI86_0
	ldr	pc, [r7, r4, lsl #2]
	.p2align	2
.LJTI86_0:
	.long	.LBB86_6
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_10
	.long	.LBB86_9
	.long	.LBB86_8
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_8
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_12
	.long	.LBB86_3
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_9
	.long	.LBB86_3
	.long	.LBB86_3
	.long	.LBB86_14
	.long	.LBB86_9
	.long	.LBB86_11
.LBB86_3:
	ldrb	r2, [r0, #4]
	cmp	r2, #0
	bne	.LBB86_6
	ldr	r4, [r0, #40]
	cmp	r4, #0
	beq	.LBB86_6
	ldr	r2, [r0, #44]
	mov	r7, #0
	ldr	lr, .LCPI86_2
	add	r12, sp, #24
	str	r7, [sp, #32]
	mov	r5, r0
	str	r7, [sp, #28]
	mov	r6, r1
	str	r7, [sp, #24]
	mov	r1, r2
	str	r7, [sp, #8]
	mov	r0, r12
	str	r7, [sp, #12]
	mov	r2, #4
	str	r7, [sp, #16]
	mov	r7, #2
	str	r7, [sp]
	mov	r7, r3
	str	r3, [sp, #20]
	mov	r3, lr
	mov	lr, pc
	mov	pc, r4
	mov	r3, r7
	ldr	r2, [r5, #84]
	ldr	r7, [sp, #24]
	mov	r0, r5
	mov	r1, r6
	add	r2, r2, r7
	str	r2, [r5, #84]
.LBB86_6:
	mov	r2, #17
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	ldr	r2, .LCPI86_0
.LBB86_7:
	str	r2, [sp, #12]
	mov	r2, #32
	str	r2, [sp, #8]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #16
	b	.LBB86_13
.LBB86_8:
	mov	r2, #17
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	ldr	r2, .LCPI86_0
	str	r2, [sp, #12]
	mov	r2, #32
	str	r2, [sp, #8]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #10
	b	.LBB86_13
.LBB86_9:
	mov	r1, r2
	mov	r2, r3
	add	sp, sp, #40
	pop	{r4, r5, r6, r7, r11, lr}
	b	"fmt::fmt_bad_verb"
.LBB86_10:
	mov	r2, #17
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	ldr	r2, .LCPI86_0
	str	r2, [sp, #12]
	mov	r2, #32
	str	r2, [sp, #8]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #2
	b	.LBB86_13
.LBB86_11:
	mov	r2, #17
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	ldr	r2, .LCPI86_0
	str	r2, [sp, #12]
	mov	r2, #32
	str	r2, [sp, #8]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #12
	b	.LBB86_13
.LBB86_12:
	mov	r2, #17
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	ldr	r2, .LCPI86_0
	str	r2, [sp, #12]
	mov	r2, #32
	str	r2, [sp, #8]
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r2, #8
.LBB86_13:
	str	r2, [sp]
	mov	r2, r1
	mov	r3, #0
	bl	"fmt::_fmt_int"
	add	sp, sp, #40
	pop	{r4, r5, r6, r7, r11, lr}
	mov	pc, lr
.LBB86_14:
	mov	r2, #17
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	ldr	r2, .LCPI86_1
	b	.LBB86_7
	.p2align	2
.LCPI86_0:
	.long	".Lcsbs$POC-Example$4"
.LCPI86_1:
	.long	".Lcsbs$POC-Example$3"
.LCPI86_2:
	.long	".Lcsbs$POC-Example$17e"
.Lfunc_end86:
	.size	"fmt::fmt_pointer", .Lfunc_end86-"fmt::fmt_pointer"
	.fnend

	.p2align	2
	.type	"fmt::fmt_soa_pointer",%function
	.code	32
"fmt::fmt_soa_pointer":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#44
	sub	sp, sp, #44
	ldr	r6, [r0, #40]
	mov	r5, r3
	mov	r11, r2
	mov	r7, r1
	mov	r4, r0
	cmp	r6, #0
	beq	.LBB87_2
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #32]
	mov	r2, #4
	str	r0, [sp, #28]
	str	r0, [sp, #24]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #12
	ldr	r3, .LCPI87_0
	str	r0, [sp]
	add	r0, sp, #24
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #24]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB87_2:
	mov	r0, #16
	mov	r8, #17
	ldr	r9, .LCPI87_1
	mov	r10, #32
	mov	r6, #0
	str	r0, [sp]
	mov	r0, r4
	mov	r2, r7
	mov	r3, #0
	str	r5, [sp, #20]
	str	r8, [sp, #16]
	str	r9, [sp, #12]
	str	r10, [sp, #8]
	str	r6, [sp, #4]
	bl	"fmt::_fmt_int"
	ldr	r7, [r4, #40]
	cmp	r7, #0
	beq	.LBB87_4
	ldr	r1, [r4, #44]
	mov	r0, #8
	ldr	r3, .LCPI87_2
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #24
	str	r6, [sp, #32]
	str	r6, [sp, #28]
	str	r6, [sp, #24]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #24]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB87_4:
	mov	r0, #10
	asr	r3, r11, #31
	stm	sp, {r0, r6, r10}
	mov	r0, r4
	mov	r2, r11
	str	r9, [sp, #12]
	str	r8, [sp, #16]
	str	r5, [sp, #20]
	bl	"fmt::_fmt_int"
	ldr	r6, [r4, #40]
	cmp	r6, #0
	beq	.LBB87_6
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #32]
	mov	r2, #4
	str	r0, [sp, #28]
	str	r0, [sp, #24]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	ldr	r3, .LCPI87_3
	str	r0, [sp]
	add	r0, sp, #24
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #24]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB87_6:
	add	sp, sp, #44
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI87_0:
	.long	".Lcsbs$POC-Example$180"
.LCPI87_1:
	.long	".Lcsbs$POC-Example$4"
.LCPI87_2:
	.long	".Lcsbs$POC-Example$181"
.LCPI87_3:
	.long	".Lcsbs$POC-Example$144"
.Lfunc_end87:
	.size	"fmt::fmt_soa_pointer", .Lfunc_end87-"fmt::fmt_soa_pointer"
	.fnend

	.p2align	2
	.type	"fmt::enum_value_to_string",%function
	.code	32
"fmt::enum_value_to_string":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#44
	sub	sp, sp, #44
	mov	r9, r0
	ldr	r7, [r1, #12]
	ldr	r0, [r1]
	mov	r8, r2
	ldr	r11, [r1, #8]
	ldr	r2, [r1, #4]
	add	r1, sp, #24
	stm	r1, {r0, r2, r11}
	orrs	r0, r11, r7
	str	r7, [sp, #36]
	beq	.LBB88_16
	mov	r10, #73
	mov	r0, r11
	orr	r10, r10, #256
	mov	r1, r7
	mov	r3, #0
	mov	r4, #0
	mov	r2, r10
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI88_0
	mov	r5, #0
	ldr	r12, .LCPI88_1
	b	.LBB88_3
.LBB88_2:
	adds	r0, r2, #1
	mov	r2, #0
	adc	r3, r3, #0
	subs	r1, r0, r10
	sbcs	r1, r3, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r4, #1
	adc	r1, r5, #0
	subs	r4, r4, #328
	sbcs	r4, r5, #0
	mov	r4, r0
	mov	r5, r1
	bhs	.LBB88_5
.LBB88_3:
	ldr	r0, [lr, r2, lsl #2]
	cmp	r0, #0
	beq	.LBB88_2
	ldr	r1, [r0, #16]
	ldr	r6, [r0, #20]
	eor	r1, r1, r11
	eor	r6, r6, r7
	orrs	r1, r1, r6
	bne	.LBB88_2
	b	.LBB88_7
.LBB88_5:
	mov	r0, r12
	b	.LBB88_7
.LBB88_6:
	ldr	r0, [r0, #32]
.LBB88_7:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r3, r1, #1
	orrs	r3, r3, r2
	beq	.LBB88_6
	eor	r1, r1, #21
	orrs	r1, r1, r2
	bne	.LBB88_16
	ldr	r7, [r0, #40]
	cmp	r7, #0
	beq	.LBB88_16
	ldr	r6, [r0, #28]
	add	r1, sp, #24
	ldr	r10, [r0, #32]
	mov	r11, #0
	ldr	r4, [r0, #36]
	add	r0, sp, #8
	mov	r2, r8
	strb	r11, [sp, #16]
	str	r11, [sp, #12]
	str	r11, [sp, #8]
	bl	"reflect::as_i64"
	ldrb	r1, [sp, #16]
	tst	r1, #1
	beq	.LBB88_19
	ldr	r1, [sp, #8]
	bic	r3, r7, r7, asr #31
	ldr	r2, [sp, #12]
	sub	r0, r6, #4
	mov	r11, #0
	mov	r7, #0
.LBB88_12:
	cmp	r3, r7
	beq	.LBB88_17
	ldr	r6, [r4]
	add	r7, r7, #1
	ldr	r5, [r4, #4]
	add	r4, r4, #8
	eor	r6, r6, r1
	add	r0, r0, #8
	eor	r5, r5, r2
	orrs	r6, r6, r5
	bne	.LBB88_12
	sub	r1, r7, #1
	cmp	r1, r10
	bhs	.LBB88_20
	ldr	r11, [r0, #-4]
	mov	r1, #1
	ldr	r0, [r0]
	b	.LBB88_18
.LBB88_16:
	mov	r11, #0
.LBB88_17:
	mov	r0, #0
	mov	r1, #0
.LBB88_18:
	strb	r1, [r9, #8]
	str	r11, [r9]
	str	r0, [r9, #4]
	add	sp, sp, #44
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB88_19:
	mov	r0, #0
	b	.LBB88_18
.LBB88_20:
	mov	r2, #71
	ldr	r0, .LCPI88_2
	orr	r2, r2, #768
	stm	sp, {r1, r10}
	mov	r1, #51
	mov	r3, #19
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI88_0:
	.long	.L__$type_info_data
.LCPI88_1:
	.long	".L__$ti-0"
.LCPI88_2:
	.long	".Lcsbs$POC-Example$158"
.Lfunc_end88:
	.size	"fmt::enum_value_to_string", .Lfunc_end88-"fmt::enum_value_to_string"
	.fnend

	.p2align	2
	.type	"mem::small_stack_resize_bytes_non_zeroed",%function
	.code	32
"mem::small_stack_resize_bytes_non_zeroed":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r5, [r1]
	ldr	lr, [sp, #52]
	ldr	r9, [sp, #48]
	cmp	r5, #0
	beq	.LBB89_25
	ldr	r6, [sp, #44]
	ldr	r12, [sp, #40]
	cmp	r6, #1
	mov	r4, r6
	movle	r4, #1
	cmp	r4, #16
	movge	r4, #16
	cmp	r2, #0
	beq	.LBB89_12
	cmp	r12, #0
	beq	.LBB89_17
	cmp	r2, r5
	blo	.LBB89_26
	ldr	r8, [r1, #4]
	add	r7, r8, r5
	cmp	r2, r7
	bhs	.LBB89_26
	ldr	r7, [r1, #8]
	add	lr, r7, r5
	mov	r5, #0
	cmp	r2, lr
	bhs	.LBB89_16
	sub	r9, r4, #1
	tst	r9, r2
	cmpeq	r3, r12
	beq	.LBB89_24
	ands	r5, lr, r9
	subsne	r5, r4, r5
	bne	.LBB89_9
	mov	r5, #0
	cmp	r6, #2
	movlt	r5, #1
	tst	r9, #1
	lslne	r5, r4, r5
.LBB89_9:
	add	r4, r5, r7
	add	r6, r4, r12
	cmp	r6, r8
	bgt	.LBB89_15
	str	r4, [r1, #8]
	add	r4, r5, lr
	bic	r3, r3, r3, asr #31
	strb	r5, [r4, #-1]
	mov	r5, #0
	ldr	r7, [r1, #8]
	ldr	r6, [r1, #12]
	add	r7, r7, r12
	str	r7, [r1, #8]
	cmp	r6, r7
	movle	r6, r7
	str	r6, [r1, #12]
	bic	r6, r12, r12, asr #31
	cmp	r6, r3
	movlt	r3, r6
	cmp	r3, #0
	beq	.LBB89_23
	mov	r7, r0
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	bl	memmove
	mov	r0, r7
	b	.LBB89_23
.LBB89_12:
	ldr	r3, [r1, #8]
	add	r2, r3, r5
	sub	r5, r4, #1
	ands	r7, r2, r5
	subsne	r7, r4, r7
	bne	.LBB89_14
	mov	r7, #0
	cmp	r6, #2
	movlt	r7, #1
	tst	r5, #1
	lslne	r7, r4, r7
.LBB89_14:
	add	r3, r7, r3
	ldr	r5, [r1, #4]
	add	r6, r3, r12
	cmp	r6, r5
	ble	.LBB89_22
.LBB89_15:
	mov	r5, #1
.LBB89_16:
	mov	r4, #0
	mov	r6, #0
	b	.LBB89_23
.LBB89_17:
	cmp	r5, r2
	bhi	.LBB89_27
	ldr	r3, [r1, #4]
	add	r3, r3, r5
	cmp	r3, r2
	bls	.LBB89_27
	ldr	r3, [r1, #8]
	add	r3, r3, r5
	cmp	r3, r2
	bls	.LBB89_21
	ldrb	r3, [r2, #-1]
	add	r3, r5, r3
	sub	r2, r2, r3
	str	r2, [r1, #8]
.LBB89_21:
	mov	r4, #0
	mov	r6, #0
	mov	r5, #0
	b	.LBB89_23
.LBB89_22:
	add	r4, r7, r2
	str	r3, [r1, #8]
	bic	r6, r12, r12, asr #31
	mov	r5, #0
	strb	r7, [r4, #-1]
	ldr	r2, [r1, #8]
	ldr	r3, [r1, #12]
	add	r2, r2, r12
	str	r2, [r1, #8]
	cmp	r3, r2
	movle	r3, r2
	str	r3, [r1, #12]
.LBB89_23:
	strb	r5, [r0, #8]
	stm	r0, {r4, r6}
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
.LBB89_24:
	bic	r6, r12, r12, asr #31
	mov	r4, r2
	b	.LBB89_23
.LBB89_25:
	ldr	r0, [lr, #16]
	mov	r1, #5
	ldr	r4, .LCPI89_0
	mov	r3, #49
	cmp	r0, #0
	ldr	r2, .LCPI89_4
	b	.LBB89_28
.LBB89_26:
	ldr	r0, [lr, #16]
	mov	r1, #5
	ldr	r4, .LCPI89_0
	mov	r3, #70
	cmp	r0, #0
	ldr	r2, .LCPI89_2
	b	.LBB89_28
.LBB89_27:
	ldr	r0, [lr, #16]
	mov	r1, #5
	ldr	r4, .LCPI89_0
	mov	r3, #68
	cmp	r0, #0
	ldr	r2, .LCPI89_3
.LBB89_28:
	movne	r4, r0
	ldr	r0, .LCPI89_1
	stm	sp, {r9, lr}
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI89_0:
	.long	"runtime::default_assertion_failure_proc"
.LCPI89_1:
	.long	".Lcsbs$POC-Example$17b"
.LCPI89_2:
	.long	".Lcsbs$POC-Example$183"
.LCPI89_3:
	.long	".Lcsbs$POC-Example$17d"
.LCPI89_4:
	.long	".Lcsbs$POC-Example$182"
.Lfunc_end89:
	.size	"mem::small_stack_resize_bytes_non_zeroed", .Lfunc_end89-"mem::small_stack_resize_bytes_non_zeroed"
	.fnend

	.p2align	2
	.type	"fmt::fmt_enum",%function
	.code	32
"fmt::fmt_enum":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#148
	sub	sp, sp, #148
	ldr	r7, [r1, #8]
	mov	r10, r0
	ldr	r5, [r1, #12]
	ldr	r11, [r1]
	ldr	r0, [r1, #4]
	str	r0, [sp, #116]
	orrs	r0, r7, r5
	cmpne	r11, #0
	str	r5, [sp, #124]
	str	r7, [sp, #120]
	str	r11, [sp, #112]
	bne	.LBB90_4
	ldr	r4, [r10, #40]
	cmp	r4, #0
	beq	.LBB90_21
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #136]
	str	r0, [sp, #132]
	str	r0, [sp, #128]
	str	r3, [sp, #20]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #5
	ldr	r3, .LCPI90_4
	str	r0, [sp]
	add	r0, sp, #128
.LBB90_3:
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #128]
	add	r0, r0, r1
	str	r0, [r10, #84]
	b	.LBB90_21
.LBB90_4:
	mov	r9, #73
	str	r2, [sp, #24]
	orr	r9, r9, #256
	str	r3, [sp, #28]
	mov	r0, r7
	mov	r1, r5
	mov	r2, r9
	mov	r3, #0
	mov	r8, #0
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI90_0
	mov	r0, #0
	ldr	r12, .LCPI90_1
	b	.LBB90_6
.LBB90_5:
	adds	r1, r2, #1
	adc	r3, r3, #0
	subs	r2, r1, r9
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r1
	adds	r1, r8, #1
	adc	r4, r0, #0
	subs	r6, r8, #328
	sbcs	r0, r0, #0
	mov	r8, r1
	mov	r0, r4
	bhs	.LBB90_8
.LBB90_6:
	ldr	r6, [lr, r2, lsl #2]
	cmp	r6, #0
	beq	.LBB90_5
	ldr	r4, [r6, #16]
	ldr	r1, [r6, #20]
	eor	r4, r4, r7
	eor	r1, r1, r5
	orrs	r1, r4, r1
	bne	.LBB90_5
	b	.LBB90_9
.LBB90_8:
	mov	r6, r12
.LBB90_9:
	ldr	r0, [r6, #64]
	ldr	r1, [r6, #68]
	eor	r0, r0, #21
	orrs	r0, r0, r1
	bne	.LBB90_15
	ldr	r4, [sp, #24]
	ldr	r7, [sp, #28]
	sub	r0, r4, #100
	cmp	r0, #19
	bhi	.LBB90_32
	mov	r1, #1
	mov	r2, #37
	tst	r2, r1, lsl r0
	bne	.LBB90_17
	mov	r2, #303104
	tst	r2, r1, lsl r0
	beq	.LBB90_22
	mov	r0, #0
	add	r1, sp, #112
	strb	r0, [sp, #92]
	mov	r2, r7
	str	r0, [sp, #88]
	str	r0, [sp, #84]
	add	r0, sp, #84
	bl	"fmt::enum_value_to_string"
	ldrb	r0, [sp, #92]
	cmp	r0, #0
	beq	.LBB90_26
	ldr	r1, [sp, #84]
	mov	r0, r10
	ldr	r2, [sp, #88]
	mov	r3, r4
	str	r7, [sp]
	bl	"fmt::fmt_string"
	b	.LBB90_21
.LBB90_15:
	mov	r0, r10
	ldr	r1, [sp, #24]
	ldr	r2, [sp, #28]
.LBB90_16:
	add	sp, sp, #148
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_bad_verb"
.LBB90_17:
	mov	r0, #0
	str	r11, [sp, #96]
	str	r0, [sp, #100]
	ldr	r0, [r6, #24]
.LBB90_18:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r1, r1, #1
	orrs	r1, r1, r2
	bne	.LBB90_20
	ldr	r0, [r0, #32]
	b	.LBB90_18
.LBB90_20:
	ldr	r1, [r0, #16]
	mov	r2, r4
	ldr	r0, [r0, #20]
	mov	r3, r7
	str	r1, [sp, #104]
	add	r1, sp, #96
	str	r0, [sp, #108]
	mov	r0, r10
	bl	"fmt::fmt_arg"
.LBB90_21:
	add	sp, sp, #148
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB90_22:
	cmp	r0, #19
	bne	.LBB90_32
	mov	r0, #0
	add	r1, sp, #112
	strb	r0, [sp, #60]
	mov	r2, r7
	str	r0, [sp, #56]
	str	r0, [sp, #52]
	add	r0, sp, #52
	bl	"fmt::enum_value_to_string"
	ldrb	r0, [sp, #60]
	cmp	r0, #0
	beq	.LBB90_33
	add	r4, r10, #84
	ldr	r0, [r10, #40]
	ldr	r1, [r10, #44]
	mov	r2, #46
	mov	r3, r4
	ldr	r8, [sp, #52]
	ldr	r9, [sp, #56]
	str	r7, [sp]
	bl	"io::write_byte"
	ldr	r6, [r10, #40]
	cmp	r6, #0
	beq	.LBB90_21
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #136]
	mov	r2, #4
	str	r0, [sp, #132]
	mov	r3, r8
	str	r0, [sp, #128]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #128
	str	r7, [sp, #20]
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4]
	ldr	r1, [sp, #128]
	add	r0, r0, r1
	str	r0, [r4]
	b	.LBB90_21
.LBB90_26:
	ldr	r4, [r10, #40]
	cmp	r4, #0
	beq	.LBB90_28
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #136]
	mov	r2, #4
	str	r0, [sp, #132]
	str	r0, [sp, #128]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #18
	ldr	r3, .LCPI90_2
	str	r0, [sp]
	add	r0, sp, #128
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #128]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB90_28:
	mov	r0, #0
	str	r11, [sp, #64]
	str	r0, [sp, #68]
	ldr	r0, [r6, #24]
.LBB90_29:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r1, r1, #1
	orrs	r1, r1, r2
	bne	.LBB90_31
	ldr	r0, [r0, #32]
	b	.LBB90_29
.LBB90_31:
	ldr	r1, [r0, #16]
	str	r1, [sp, #72]
	add	r1, sp, #64
	ldr	r0, [r0, #20]
	str	r0, [sp, #76]
	b	.LBB90_39
.LBB90_32:
	mov	r0, r10
	mov	r1, r4
	mov	r2, r7
	b	.LBB90_16
.LBB90_33:
	ldr	r4, [r10, #40]
	cmp	r4, #0
	beq	.LBB90_35
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #136]
	mov	r2, #4
	str	r0, [sp, #132]
	str	r0, [sp, #128]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #18
	ldr	r3, .LCPI90_2
	str	r0, [sp]
	add	r0, sp, #128
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #128]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB90_35:
	mov	r0, #0
	str	r11, [sp, #32]
	str	r0, [sp, #36]
	ldr	r0, [r6, #24]
.LBB90_36:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r1, r1, #1
	orrs	r1, r1, r2
	bne	.LBB90_38
	ldr	r0, [r0, #32]
	b	.LBB90_36
.LBB90_38:
	ldr	r1, [r0, #16]
	ldr	r0, [r0, #20]
	str	r1, [sp, #40]
	add	r1, sp, #32
	str	r0, [sp, #44]
.LBB90_39:
	mov	r0, r10
	mov	r2, #105
	mov	r3, r7
	bl	"fmt::fmt_arg"
	ldr	r4, [r10, #40]
	cmp	r4, #0
	beq	.LBB90_21
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #136]
	str	r0, [sp, #132]
	str	r0, [sp, #128]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #128
	str	r7, [sp, #20]
	ldr	r3, .LCPI90_3
	b	.LBB90_3
	.p2align	2
.LCPI90_0:
	.long	.L__$type_info_data
.LCPI90_1:
	.long	".L__$ti-0"
.LCPI90_2:
	.long	".Lcsbs$POC-Example$184"
.LCPI90_3:
	.long	".Lcsbs$POC-Example$131"
.LCPI90_4:
	.long	".Lcsbs$POC-Example$169"
.Lfunc_end90:
	.size	"fmt::fmt_enum", .Lfunc_end90-"fmt::fmt_enum"
	.fnend

	.p2align	2
	.type	"fmt::stored_enum_value_to_string",%function
	.code	32
"fmt::stored_enum_value_to_string":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	.pad	#8
	sub	sp, sp, #8
	ldr	r12, [sp, #32]
	cmp	r1, #0
	bne	.LBB91_3
	mov	r1, #68
	ldr	lr, [r1]
	mov	r1, #64
	ldr	r4, [r1]
	mov	r1, #0
	b	.LBB91_4
.LBB91_2:
	ldr	r1, [r1, #32]
.LBB91_3:
	ldr	r4, [r1, #64]
	ldr	lr, [r1, #68]
	eor	r5, r4, #1
	orrs	r5, r5, lr
	beq	.LBB91_2
.LBB91_4:
	adds	r8, r2, r12
	eor	r2, r4, #21
	adc	r3, r3, r12, asr #31
	orrs	r2, r2, lr
	bne	.LBB91_14
	ldr	r4, [r1, #24]
	cmp	r4, #0
	bne	.LBB91_7
	b	.LBB91_16
.LBB91_6:
	ldr	r4, [r4, #32]
.LBB91_7:
	ldr	r2, [r4, #64]
	ldr	r5, [r4, #68]
	eor	r6, r2, #1
	orrs	r6, r6, r5
	beq	.LBB91_6
	eor	r2, r2, #7
	orrs	r2, r2, r5
	bne	.LBB91_16
	ldr	r2, [r1, #40]
	mov	r12, #0
	mov	r4, #0
	bic	lr, r2, r2, asr #31
	mov	r2, #0
.LBB91_10:
	cmp	lr, r4
	beq	.LBB91_15
	ldr	r5, [r1, #36]
	add	r4, r4, #1
	ldr	r6, [r5, r2]!
	add	r2, r2, #8
	ldr	r5, [r5, #4]
	eor	r6, r6, r8
	eor	r5, r5, r3
	orrs	r5, r6, r5
	bne	.LBB91_10
	ldr	r3, [r1, #32]
	sub	r2, r4, #1
	cmp	r2, r3
	blo	.LBB91_21
	ldr	r0, .LCPI91_0
	stm	sp, {r2, r3}
	mov	r2, #732
	b	.LBB91_25
.LBB91_14:
	mov	r12, #0
.LBB91_15:
	mov	r1, #0
	mov	r2, #0
	b	.LBB91_23
.LBB91_16:
	ldr	r2, [r1, #40]
	cmp	r2, #0
	beq	.LBB91_22
	bic	r4, r2, r2, asr #31
	mov	r12, #0
	mov	r5, #0
	mov	r2, #0
.LBB91_18:
	cmp	r4, r2
	beq	.LBB91_15
	ldr	r6, [r1, #36]
	add	r2, r2, #1
	ldr	r7, [r6, r5]!
	add	r5, r5, #8
	ldr	r6, [r6, #4]
	eor	r7, r7, r8
	eor	r6, r6, r3
	orrs	r7, r7, r6
	bne	.LBB91_18
	ldr	r3, [r1, #32]
	sub	r2, r2, #1
	cmp	r2, r3
	bhs	.LBB91_24
.LBB91_21:
	ldr	r1, [r1, #28]
	ldr	r12, [r1, r2, lsl #3]!
	mov	r2, #1
	ldr	r1, [r1, #4]
	b	.LBB91_23
.LBB91_22:
	mov	r2, #1
	mov	r12, #0
	mov	r1, #0
.LBB91_23:
	strb	r2, [r0, #8]
	str	r12, [r0]
	str	r1, [r0, #4]
	add	sp, sp, #8
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.LBB91_24:
	stm	sp, {r2, r3}
	mov	r2, #740
	ldr	r0, .LCPI91_0
.LBB91_25:
	orr	r2, r2, #1024
	mov	r1, #43
	mov	r3, #21
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI91_0:
	.long	".Lcsbs$POC-Example$156"
.Lfunc_end91:
	.size	"fmt::stored_enum_value_to_string", .Lfunc_end91-"fmt::stored_enum_value_to_string"
	.cantunwind
	.fnend

	.p2align	2
	.type	"mem::small_stack_allocator_proc",%function
	.code	32
"mem::small_stack_allocator_proc":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#44
	sub	sp, sp, #44
	ldr	r6, [r1]
	cmp	r6, #0
	beq	.LBB92_9
	and	r2, r2, #255
	cmp	r2, #7
	bhi	.LBB92_22
	add	lr, sp, #80
	adr	r4, .LJTI92_0
	ldr	r12, [sp, #96]
	mov	r7, #4
	ldm	lr, {r8, r10, r11, lr}
	mov	r9, #0
	mov	r5, #0
	ldr	pc, [r4, r2, lsl #2]
	.p2align	2
.LJTI92_0:
	.long	.LBB92_4
	.long	.LBB92_16
	.long	.LBB92_21
	.long	.LBB92_11
	.long	.LBB92_24
	.long	.LBB92_34
	.long	.LBB92_25
	.long	.LBB92_23
.LBB92_4:
	ldr	r5, [r1, #8]
	cmp	r8, #1
	mov	r7, r8
	movle	r7, #1
	cmp	r7, #16
	movge	r7, #16
	sub	r4, r7, #1
	add	r2, r5, r6
	ands	r6, r2, r4
	subsne	r6, r7, r6
	bne	.LBB92_6
	mov	r6, #0
	cmp	r8, #2
	movlt	r6, #1
	tst	r4, #1
	lslne	r6, r7, r6
.LBB92_6:
	add	r7, r6, r5
	ldr	r4, [r1, #4]
	add	r5, r7, r3
	cmp	r5, r4
	bgt	.LBB92_28
	add	r9, r6, r2
	str	r7, [r1, #8]
	bic	r5, r3, r3, asr #31
	strb	r6, [r9, #-1]
	ldr	r2, [r1, #8]
	ldr	r7, [r1, #12]
	add	r2, r2, r3
	str	r2, [r1, #8]
	cmp	r7, r2
	movle	r7, r2
	cmp	r9, #0
	str	r7, [r1, #12]
	beq	.LBB92_35
	mov	r6, r0
	mov	r0, r9
	mov	r1, #0
	mov	r2, r5
	mov	r7, #0
	bl	memset
	mov	r0, r6
	b	.LBB92_34
.LBB92_9:
	mov	r7, #3
	mov	r9, #0
.LBB92_10:
	mov	r5, #0
	b	.LBB92_34
.LBB92_11:
	mov	r4, r0
	mov	r0, #0
	stm	sp, {r3, r8, lr}
	bic	r8, r11, r11, asr #31
	mov	r6, r3
	strb	r0, [sp, #40]
	mov	r2, r10
	str	r0, [sp, #36]
	mov	r3, r8
	str	r0, [sp, #32]
	add	r0, sp, #32
	str	r12, [sp, #12]
	bl	"mem::small_stack_resize_bytes_non_zeroed"
	ldr	r9, [sp, #32]
	ldrb	r7, [sp, #40]
	ldr	r5, [sp, #36]
	cmp	r9, #0
	beq	.LBB92_33
	cmp	r10, #0
	beq	.LBB92_31
	cmp	r6, r8
	ble	.LBB92_33
	cmp	r5, r8
	blt	.LBB92_36
	add	r0, r9, r8
	sub	r2, r5, r8
	mov	r1, #0
	b	.LBB92_32
.LBB92_16:
	cmp	r10, #0
	beq	.LBB92_30
	cmp	r6, r10
	bhi	.LBB92_37
	ldr	r2, [r1, #4]
	add	r2, r2, r6
	cmp	r2, r10
	bls	.LBB92_37
	ldr	r2, [r1, #8]
	add	r2, r2, r6
	cmp	r2, r10
	bls	.LBB92_30
	ldrb	r2, [r10, #-1]
	mov	r7, #0
	add	r2, r6, r2
	sub	r2, r10, r2
	str	r2, [r1, #8]
	b	.LBB92_34
.LBB92_21:
	mov	r2, #0
	str	r2, [r1, #8]
.LBB92_22:
	mov	r9, #0
	mov	r5, #0
	mov	r7, #0
	b	.LBB92_34
.LBB92_23:
	mov	r2, #0
	stm	sp, {r3, r8, lr}
	bic	r3, r11, r11, asr #31
	strb	r2, [sp, #28]
	mov	r4, r0
	str	r2, [sp, #24]
	str	r2, [sp, #20]
	add	r2, sp, #20
	str	r12, [sp, #12]
	mov	r0, r2
	mov	r2, r10
	bl	"mem::small_stack_resize_bytes_non_zeroed"
	mov	r0, r4
	ldrb	r7, [sp, #28]
	ldr	r9, [sp, #20]
	ldr	r5, [sp, #24]
	b	.LBB92_34
.LBB92_24:
	cmp	r10, #0
	mov	r7, #0
	movne	r1, #223
	strbne	r1, [r10]
	b	.LBB92_34
.LBB92_25:
	ldr	r5, [r1, #8]
	cmp	r8, #1
	mov	r7, r8
	movle	r7, #1
	cmp	r7, #16
	movge	r7, #16
	sub	r4, r7, #1
	add	r2, r5, r6
	ands	r6, r2, r4
	subsne	r6, r7, r6
	bne	.LBB92_27
	mov	r6, #0
	cmp	r8, #2
	movlt	r6, #1
	tst	r4, #1
	lslne	r6, r7, r6
.LBB92_27:
	add	r7, r6, r5
	ldr	r4, [r1, #4]
	add	r5, r7, r3
	cmp	r5, r4
	ble	.LBB92_29
.LBB92_28:
	mov	r7, #1
	b	.LBB92_10
.LBB92_29:
	add	r9, r6, r2
	str	r7, [r1, #8]
	bic	r5, r3, r3, asr #31
	strb	r6, [r9, #-1]
	ldr	r2, [r1, #8]
	ldr	r7, [r1, #12]
	add	r2, r2, r3
	str	r2, [r1, #8]
	cmp	r7, r2
	movle	r7, r2
	str	r7, [r1, #12]
.LBB92_30:
	mov	r7, #0
	b	.LBB92_34
.LBB92_31:
	mov	r0, r9
	mov	r1, #0
	mov	r2, r5
.LBB92_32:
	bl	memset
.LBB92_33:
	mov	r0, r4
.LBB92_34:
	strb	r7, [r0, #8]
	str	r9, [r0]
	str	r5, [r0, #4]
	add	sp, sp, #44
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB92_35:
	mov	r9, #0
	mov	r7, #0
	b	.LBB92_34
.LBB92_36:
	mov	r2, #209
	ldr	r0, .LCPI92_0
	orr	r2, r2, #1280
	mov	r1, #50
	mov	r3, #20
	str	r8, [sp]
	str	r5, [sp, #4]
	str	r5, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB92_37:
	ldr	r0, [r12, #16]
	mov	r1, #5
	ldr	r4, .LCPI92_1
	mov	r3, #68
	cmp	r0, #0
	ldr	r2, .LCPI92_3
	movne	r4, r0
	ldr	r0, .LCPI92_2
	str	lr, [sp]
	str	r12, [sp, #4]
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI92_0:
	.long	".Lcsbs$POC-Example$17f"
.LCPI92_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI92_2:
	.long	".Lcsbs$POC-Example$17b"
.LCPI92_3:
	.long	".Lcsbs$POC-Example$17d"
.Lfunc_end92:
	.size	"mem::small_stack_allocator_proc", .Lfunc_end92-"mem::small_stack_allocator_proc"
	.fnend

	.p2align	2
	.type	"fmt::fmt_bit_set",%function
	.code	32
"fmt::fmt_bit_set":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#364
	sub	sp, sp, #364
	mov	r11, #73
	ldr	r6, [r1, #8]
	ldr	r5, [r1, #12]
	orr	r11, r11, #256
	str	r3, [sp, #104]
	mov	r3, #0
	str	r2, [sp, #100]
	mov	r2, r11
	str	r0, [sp, #72]
	mov	r0, r6
	ldr	r10, [r1]
	mov	r7, #0
	ldr	r9, [r1, #4]
	mov	r1, r5
	bl	__aeabi_uldivmod
	ldr	lr, .LCPI93_0
	mov	r0, #0
	ldr	r12, .LCPI93_1
	b	.LBB93_2
.LBB93_1:
	adds	r1, r2, #1
	adc	r3, r3, #0
	subs	r2, r1, r11
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r1
	adds	r1, r7, #1
	adc	r4, r0, #0
	subs	r7, r7, #328
	sbcs	r0, r0, #0
	mov	r7, r1
	mov	r0, r4
	bhs	.LBB93_4
.LBB93_2:
	ldr	r8, [lr, r2, lsl #2]
	cmp	r8, #0
	beq	.LBB93_1
	ldr	r4, [r8, #16]
	ldr	r1, [r8, #20]
	eor	r4, r4, r6
	eor	r1, r1, r5
	orrs	r1, r4, r1
	bne	.LBB93_1
	b	.LBB93_5
.LBB93_4:
	mov	r8, r12
.LBB93_5:
	ldr	r0, [r8, #64]
	ldr	r1, [r8, #68]
	eor	r2, r0, #23
	orrs	r2, r2, r1
	beq	.LBB93_8
	eor	r0, r0, #1
	orrs	r0, r0, r1
	ldr	r0, [sp, #72]
	bne	.LBB93_75
	add	r7, r8, #24
	str	r9, [sp, #252]
	str	r10, [sp, #248]
	ldm	r7, {r2, r3, r7}
	ldr	r1, [r7, #16]
	str	r1, [sp, #256]
	ldr	r1, [sp, #400]
	ldr	r7, [r7, #20]
	str	r1, [sp]
	ldr	r1, [sp, #404]
	str	r1, [sp, #4]
	add	r1, sp, #248
	str	r7, [sp, #260]
	bl	"fmt::fmt_bit_set"
	b	.LBB93_75
.LBB93_8:
	ldr	r2, [r8, #28]
	mov	r0, #1
	ldr	r1, [r8]
	ldr	lr, [sp, #72]
	cmp	r2, #0
	beq	.LBB93_13
.LBB93_9:
	ldr	r3, [r2, #64]
	ldr	r7, [r2, #68]
	eor	r6, r3, #1
	orrs	r6, r6, r7
	bne	.LBB93_11
	ldr	r2, [r2, #32]
	b	.LBB93_9
.LBB93_11:
	eor	r3, r3, #2
	orrs	r3, r3, r7
	bne	.LBB93_13
	ldrb	r0, [r2, #25]
	subs	r0, r0, #2
	movne	r0, #1
.LBB93_13:
	lsl	r2, r1, #3
	ldr	r1, [sp, #400]
	mov	r4, #0
	sub	r3, r1, #88
	mov	r1, #0
	cmp	r3, #34
	bhi	.LBB93_17
	adr	r7, .LJTI93_0
	ldr	pc, [r7, r3, lsl #2]
	.p2align	2
.LJTI93_0:
	.long	.LBB93_16
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_16
	.long	.LBB93_17
	.long	.LBB93_16
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_16
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_16
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_17
	.long	.LBB93_16
	.long	.LBB93_17
	.long	.LBB93_16
.LBB93_16:
	ldrb	r3, [lr, #5]
	mov	r1, #1
	cmp	r3, #0
	streq	r2, [lr, #12]
	strbeq	r1, [lr, #5]
.LBB93_17:
	cmp	r2, #32
	bhi	.LBB93_22
	adr	r3, .LJTI93_1
	mov	r11, #0
	mov	r5, #0
	mov	r7, #0
	ldr	pc, [r3, r2, lsl #2]
	.p2align	2
.LJTI93_1:
	.long	.LBB93_36
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_20
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_30
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_77
	.long	.LBB93_28
.LBB93_20:
	ldrb	r4, [r10]
	cmp	r1, #0
	strb	r4, [sp, #247]
	beq	.LBB93_36
	mov	r0, #0
	add	r1, sp, #224
	str	r0, [sp, #228]
	add	r0, sp, #247
	str	r0, [sp, #224]
	ldr	r0, .LCPI93_10
	str	r0, [sp, #236]
	ldr	r0, .LCPI93_11
	str	r0, [sp, #232]
	b	.LBB93_32
.LBB93_22:
	cmp	r2, #64
	bne	.LBB93_25
	ldm	r10, {r2, r11}
	mov	r3, #65280
	and	r7, r3, r11, lsr #8
	cmp	r0, #0
	and	r6, r11, #65280
	and	r0, r3, r2, lsr #8
	and	r3, r2, #65280
	mov	r4, r2
	orr	r0, r0, r2, lsr #24
	lsl	r2, r2, #24
	lsl	r5, r11, #24
	orr	r7, r7, r11, lsr #24
	orr	r6, r5, r6, lsl #8
	orr	r2, r2, r3, lsl #8
	orreq	r4, r6, r7
	orreq	r11, r2, r0
	cmp	r1, #0
	str	r4, [sp, #168]
	str	r11, [sp, #172]
	beq	.LBB93_33
	mov	r0, #0
	add	r1, sp, #152
	str	r0, [sp, #156]
	add	r0, sp, #168
	str	r0, [sp, #152]
	ldr	r0, .LCPI93_4
	str	r0, [sp, #164]
	ldr	r0, .LCPI93_5
	str	r0, [sp, #160]
	b	.LBB93_32
.LBB93_25:
	cmp	r2, #128
	bne	.LBB93_77
	ldr	r2, [r10, #8]
	mov	r12, #65280
	ldm	r10, {r4, r11}
	and	r5, r11, #65280
	and	r7, r12, r11, lsr #8
	lsl	r6, r11, #24
	cmp	r0, #0
	orr	r6, r6, r5, lsl #8
	ldr	r3, [r10, #12]
	orr	r7, r7, r11, lsr #24
	mov	r5, r2
	orreq	r5, r6, r7
	and	r7, r4, #65280
	and	r0, r12, r4, lsr #8
	lsl	r6, r4, #24
	orr	r6, r6, r7, lsl #8
	orr	r0, r0, r4, lsr #24
	mov	r7, r3
	str	r5, [sp, #144]
	orreq	r7, r6, r0
	and	r0, r12, r3, lsr #8
	and	r6, r3, #65280
	orr	r0, r0, r3, lsr #24
	lsl	r3, r3, #24
	str	r7, [sp, #148]
	orr	r3, r3, r6, lsl #8
	orreq	r4, r3, r0
	and	r0, r12, r2, lsr #8
	and	r3, r2, #65280
	orr	r0, r0, r2, lsr #24
	lsl	r2, r2, #24
	str	r4, [sp, #136]
	orr	r2, r2, r3, lsl #8
	orreq	r11, r2, r0
	cmp	r1, #0
	str	r11, [sp, #140]
	beq	.LBB93_36
	mov	r0, #0
	add	r1, sp, #120
	str	r0, [sp, #124]
	add	r0, sp, #136
	str	r0, [sp, #120]
	ldr	r0, .LCPI93_2
	str	r0, [sp, #132]
	ldr	r0, .LCPI93_3
	str	r0, [sp, #128]
	b	.LBB93_32
.LBB93_28:
	ldr	r4, [r10]
	mov	r2, #65280
	cmp	r0, #0
	and	r3, r4, #65280
	and	r2, r2, r4, lsr #8
	lsl	r7, r4, #24
	orr	r2, r2, r4, lsr #24
	orr	r3, r7, r3, lsl #8
	orreq	r4, r3, r2
	cmp	r1, #0
	str	r4, [sp, #196]
	beq	.LBB93_34
	mov	r0, #0
	add	r1, sp, #176
	str	r0, [sp, #180]
	add	r0, sp, #196
	str	r0, [sp, #176]
	ldr	r0, .LCPI93_6
	str	r0, [sp, #188]
	ldr	r0, .LCPI93_7
	str	r0, [sp, #184]
	b	.LBB93_32
.LBB93_30:
	ldrh	r2, [r10]
	cmp	r0, #0
	lsl	r3, r2, #8
	orreq	r2, r3, r2, lsr #8
	cmp	r1, #0
	strh	r2, [sp, #222]
	beq	.LBB93_35
	mov	r0, #0
	add	r1, sp, #200
	str	r0, [sp, #204]
	add	r0, sp, #222
	str	r0, [sp, #200]
	ldr	r0, .LCPI93_8
	str	r0, [sp, #212]
	ldr	r0, .LCPI93_9
	str	r0, [sp, #208]
.LBB93_32:
	ldr	r2, [sp, #400]
	mov	r0, lr
	ldr	r3, [sp, #404]
	bl	"fmt::fmt_arg"
	b	.LBB93_75
.LBB93_33:
	mov	r5, #0
.LBB93_34:
	mov	r7, #0
	b	.LBB93_36
.LBB93_35:
	mov	r0, #255
	orr	r0, r0, #65280
	and	r4, r2, r0
.LBB93_36:
	ldr	r6, [r8, #24]
	mov	r10, r5
	mov	r9, r4
	str	r7, [sp, #108]
	cmp	r6, #0
	beq	.LBB93_39
	ldr	r0, [r6, #64]
	ldr	r1, [r6, #68]
	eor	r0, r0, #1
	ldr	r4, [sp, #404]
	orrs	r0, r0, r1
	bne	.LBB93_40
.LBB93_38:
	ldr	r6, [r6, #32]
	ldr	r0, [r6, #64]
	ldr	r1, [r6, #68]
	eor	r0, r0, #1
	orrs	r0, r0, r1
	beq	.LBB93_38
	b	.LBB93_40
.LBB93_39:
	mov	r6, #0
	ldr	r4, [sp, #404]
.LBB93_40:
	ldr	r0, [sp, #400]
	cmp	r0, #119
	beq	.LBB93_45
	ldr	r1, [sp, #104]
	ldr	r5, [lr, #40]
	ldr	r2, [lr, #44]
	cmp	r1, #0
	beq	.LBB93_44
	cmp	r5, #0
	beq	.LBB93_45
	mov	r0, #0
	ldr	r3, [sp, #100]
	str	r0, [sp, #280]
	str	r0, [sp, #276]
	str	r0, [sp, #272]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #272
	str	r1, [sp]
	mov	r1, r2
	mov	r2, #4
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	lr, [sp, #72]
	ldr	r1, [sp, #272]
	ldr	r0, [lr, #84]
	add	r0, r0, r1
	str	r0, [lr, #84]
	b	.LBB93_45
.LBB93_44:
	mov	r0, #0
	mov	r1, r5
	str	r0, [sp, #116]
	mov	r3, r8
	str	r0, [sp, #112]
	add	r0, lr, #84
	stm	sp, {r0, r4}
	add	r0, sp, #112
	bl	"reflect::write_type_writer"
	ldr	lr, [sp, #72]
.LBB93_45:
	ldr	r5, [lr, #40]
	mov	r0, #123
	ldr	r1, [lr, #44]
	cmp	r5, #0
	strb	r0, [sp, #344]
	beq	.LBB93_47
	mov	r0, #0
	add	r3, sp, #344
	str	r0, [sp, #280]
	mov	r2, #4
	str	r0, [sp, #276]
	str	r0, [sp, #272]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #272
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	lr, [sp, #72]
	ldr	r1, [sp, #272]
	ldr	r0, [lr, #84]
	add	r0, r0, r1
	str	r0, [lr, #84]
.LBB93_47:
	ldr	r0, [r6, #64]
	ldr	r1, [r6, #68]
	eor	r0, r0, #21
	orrs	r0, r0, r1
	mov	r1, #0
	str	r0, [sp, #64]
	mov	r0, #0
	str	r1, [sp, #52]
	str	r1, [sp, #48]
	bne	.LBB93_49
	ldr	r0, [r6, #32]
	str	r0, [sp, #48]
	ldr	r0, [r6, #36]
	str	r0, [sp, #52]
	ldr	r1, [r6, #28]
	ldr	r0, [r6, #40]
.LBB93_49:
	ldr	r6, [sp, #108]
	orr	r2, r9, r10
	orr	r3, r11, r6
	orrs	r2, r2, r3
	beq	.LBB93_73
	mov	r7, r10
	add	r2, r8, #40
	mov	r4, r9
	mov	r5, #0
	str	r2, [sp, #60]
	sub	r2, r1, #4
	sub	r1, r1, #8
	bic	r10, r0, r0, asr #31
	str	r2, [sp, #44]
	str	r1, [sp, #40]
	str	r10, [sp, #56]
	b	.LBB93_54
.LCPI93_23:
	.ascii	"\000\001\034\002\035\016\030\003\036\026\024\017\031\021\004\b\037\033\r\027\025\023\020\007\032\f\022\006\013\005\n\t"
	.p2align	2
.LBB93_52:
	mov	lr, r4
	ldr	r4, [sp, #76]
	ldr	r11, [sp, #104]
	ldr	r7, [sp, #100]
	ldr	r6, [sp, #108]
.LBB93_53:
	ldr	r0, [sp, #92]
	ldr	r5, [sp, #96]
	and	r4, r0, r4
	ldr	r0, [sp, #88]
	add	r5, r5, #1
	and	r11, r0, r11
	ldr	r0, [sp, #84]
	and	r7, r0, r7
	ldr	r0, [sp, #80]
	and	r6, r0, r6
	orr	r0, r4, r7
	orr	r1, r11, r6
	orrs	r0, r0, r1
	beq	.LBB93_73
.LBB93_54:
	rsb	r0, r11, #0
	ldr	r12, .LCPI93_12
	rsb	r2, r4, #0
	and	r0, r11, r0
	and	r2, r4, r2
	cmp	r11, #0
	mul	r1, r0, r12
	adr	r0, .LCPI93_23
	mov	r10, lr
	mul	r3, r2, r12
	mov	lr, r5
	str	r6, [sp, #108]
	str	r7, [sp, #100]
	str	lr, [sp, #96]
	ldrb	r1, [r0, r1, lsr #27]
	moveq	r1, #32
	ldrb	r2, [r0, r3, lsr #27]
	cmp	r4, #0
	moveq	r2, #32
	addeq	r2, r1, #32
	rsb	r1, r6, #0
	and	r1, r6, r1
	cmp	r6, #0
	mul	r3, r1, r12
	ldrb	r1, [r0, r3, lsr #27]
	rsb	r3, r7, #0
	and	r3, r7, r3
	moveq	r1, #32
	cmp	r7, #0
	mul	r5, r3, r12
	ldrb	r0, [r0, r5, lsr #27]
	moveq	r0, #32
	addeq	r0, r1, #32
	orrs	r1, r4, r11
	ldr	r1, [sp, #60]
	addeq	r2, r0, #64
	ldm	r1, {r0, r1}
	adds	r9, r0, r2
	mov	r0, r11
	adc	r11, r1, #0
	subs	r1, r4, #1
	str	r0, [sp, #104]
	sbcs	r0, r0, #0
	str	r0, [sp, #88]
	sbcs	r0, r7, #0
	str	r0, [sp, #84]
	sbc	r0, r6, #0
	add	r6, sp, #272
	cmp	lr, #1
	mov	lr, r10
	mov	r7, #0
	str	r1, [sp, #92]
	str	r0, [sp, #80]
	blt	.LBB93_57
	ldr	r5, [lr, #40]
	cmp	r5, #0
	beq	.LBB93_57
	ldr	r1, [lr, #44]
	mov	r2, #4
	ldr	r0, [sp, #404]
	ldr	r3, .LCPI93_14
	str	r0, [sp, #20]
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r6
	str	r7, [sp, #280]
	str	r7, [sp, #276]
	str	r7, [sp, #272]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	mov	lr, pc
	mov	pc, r5
	ldr	lr, [sp, #72]
	ldr	r1, [sp, #272]
	ldr	r0, [lr, #84]
	add	r0, r0, r1
	str	r0, [lr, #84]
.LBB93_57:
	ldr	r0, [sp, #64]
	ldr	r10, [sp, #56]
	cmp	r0, #0
	bne	.LBB93_65
	ldr	r1, [r8, #24]
	mov	r3, #0
	mov	r12, #0
	mov	r5, #0
	ldr	r0, [r1, #64]
	ldr	r2, [r1, #68]
	eor	r0, r0, #1
	orrs	r0, r0, r2
	ldreq	r3, [r1, #24]
	ldreq	r12, [r1, #28]
	ldr	r1, [sp, #52]
.LBB93_59:
	cmp	r10, r5
	beq	.LBB93_65
	ldr	r2, [r1]
	add	r5, r5, #1
	ldr	r0, [r1, #4]
	add	r1, r1, #8
	eor	r2, r2, r9
	eor	r0, r0, r11
	orrs	r0, r2, r0
	bne	.LBB93_59
	ldr	r0, [sp, #400]
	ldr	r2, [lr, #40]
	ldr	r1, [lr, #44]
	cmp	r0, #119
	bne	.LBB93_67
	ldr	r11, [sp, #104]
	cmp	r2, #0
	beq	.LBB93_69
	mov	r0, #0
	str	r4, [sp, #76]
	ldr	r9, [sp, #404]
	mov	r4, r2
	str	r0, [sp, #280]
	mov	r2, #4
	str	r0, [sp, #276]
	str	r0, [sp, #272]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, r6
	str	r9, [sp, #20]
	str	r12, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	lr, [sp, #72]
	ldr	r2, [sp, #272]
	ldr	r0, [lr, #84]
	ldr	r4, [lr, #40]
	ldr	r1, [lr, #44]
	add	r0, r0, r2
	str	r0, [lr, #84]
	mov	r0, #46
	cmp	r4, #0
	strb	r0, [sp, #344]
	beq	.LBB93_68
	mov	r0, #1
	add	r3, sp, #344
	str	r0, [sp]
	mov	r0, r6
	mov	r2, #4
	str	r7, [sp, #280]
	str	r7, [sp, #276]
	str	r7, [sp, #272]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	lr, [sp, #72]
	ldr	r4, [sp, #76]
	ldr	r2, [sp, #272]
	ldr	r3, [lr, #40]
	ldr	r1, [lr, #44]
	ldr	r0, [lr, #84]
	add	r0, r0, r2
	str	r0, [lr, #84]
	b	.LBB93_70
.LBB93_65:
	ldr	r0, [lr, #44]
	mov	r1, #0
	str	r0, [sp, #68]
	mov	r0, r6
	mov	r2, #65
	str	r4, [sp, #76]
	ldr	r5, [lr, #40]
	mov	r4, lr
	bl	memset
	ldr	r0, [sp, #404]
	mov	r1, r6
	str	r0, [sp, #32]
	mov	r2, #65
	str	r7, [sp, #268]
	mov	r6, r0
	mov	r0, #10
	str	r0, [sp, #8]
	mov	r0, #1
	str	r0, [sp, #12]
	mov	r0, #64
	str	r0, [sp, #16]
	ldr	r0, .LCPI93_16
	str	r0, [sp, #20]
	mov	r0, #36
	str	r0, [sp, #24]
	add	r0, sp, #264
	str	r7, [sp, #264]
	stm	sp, {r9, r11}
	str	r7, [sp, #28]
	bl	"strconv::write_bits"
	cmp	r5, #0
	beq	.LBB93_52
	ldr	r0, [sp, #268]
	mov	r2, #4
	ldr	r3, [sp, #264]
	ldr	r1, [sp, #68]
	str	r0, [sp]
	add	r0, sp, #344
	str	r7, [sp, #352]
	str	r7, [sp, #348]
	str	r7, [sp, #344]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #344]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB93_52
.LBB93_67:
	mov	r3, r2
	ldr	r11, [sp, #104]
	b	.LBB93_70
.LBB93_68:
	ldr	r4, [sp, #76]
.LBB93_69:
	mov	r3, #0
.LBB93_70:
	ldr	r7, [sp, #100]
	sub	r0, r5, #1
	ldr	r2, [sp, #48]
	ldr	r6, [sp, #108]
	cmp	r0, r2
	bhs	.LBB93_76
	cmp	r3, #0
	beq	.LBB93_53
	ldr	r0, [sp, #44]
	mov	r12, r3
	ldr	r2, [sp, #40]
	ldr	r0, [r0, r5, lsl #3]
	ldr	r3, [r2, r5, lsl #3]
	mov	r2, #0
	str	r0, [sp]
	add	r0, sp, #272
	str	r2, [sp, #280]
	mov	r5, r12
	str	r2, [sp, #276]
	str	r2, [sp, #272]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	ldr	r2, [sp, #404]
	str	r2, [sp, #20]
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	ldr	lr, [sp, #72]
	ldr	r1, [sp, #272]
	ldr	r0, [lr, #84]
	add	r0, r0, r1
	str	r0, [lr, #84]
	b	.LBB93_53
.LBB93_73:
	ldr	r4, [lr, #40]
	mov	r0, #125
	ldr	r1, [lr, #44]
	cmp	r4, #0
	strb	r0, [sp, #344]
	beq	.LBB93_75
	mov	r0, #0
	add	r3, sp, #344
	str	r0, [sp, #280]
	mov	r2, #4
	str	r0, [sp, #276]
	mov	r5, lr
	str	r0, [sp, #272]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #404]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #272
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r5, #84]
	ldr	r1, [sp, #272]
	add	r0, r0, r1
	str	r0, [r5, #84]
.LBB93_75:
	add	sp, sp, #364
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB93_76:
	str	r0, [sp]
	mov	r2, #103
	ldr	r0, [sp, #48]
	orr	r2, r2, #1792
	str	r0, [sp, #4]
	mov	r1, #43
	ldr	r0, .LCPI93_15
	mov	r3, #42
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB93_77:
	ldr	r1, [sp, #404]
	mov	r3, #21
	ldr	r4, .LCPI93_18
	ldr	r2, .LCPI93_20
	ldr	r0, [r1, #16]
	str	r1, [sp, #4]
	cmp	r0, #0
	ldr	r1, .LCPI93_17
	movne	r4, r0
	ldr	r0, .LCPI93_19
	str	r1, [sp]
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI93_0:
	.long	.L__$type_info_data
.LCPI93_1:
	.long	".L__$ti-0"
.LCPI93_2:
	.long	2838995518
.LCPI93_3:
	.long	3175783653
.LCPI93_4:
	.long	1571068702
.LCPI93_5:
	.long	3422454003
.LCPI93_6:
	.long	1338159828
.LCPI93_7:
	.long	1680707819
.LCPI93_8:
	.long	2078322779
.LCPI93_9:
	.long	4093975810
.LCPI93_10:
	.long	1032104133
.LCPI93_11:
	.long	3853066515
.LCPI93_12:
	.long	125613361
.LCPI93_14:
	.long	".Lcsbs$POC-Example$130"
.LCPI93_15:
	.long	".Lcsbs$POC-Example$156"
.LCPI93_16:
	.long	".Lcsbs$POC-Example$0"
.LCPI93_17:
	.long	".Lscl$[fmt_bit_set52119]"
.LCPI93_18:
	.long	"runtime::default_assertion_failure_proc"
.LCPI93_19:
	.long	".Lcsbs$POC-Example$17b"
.LCPI93_20:
	.long	".Lcsbs$POC-Example$185"
.Lfunc_end93:
	.size	"fmt::fmt_bit_set", .Lfunc_end93-"fmt::fmt_bit_set"
	.fnend

	.p2align	2
	.type	"strings::trim_space",%function
	.code	32
"strings::trim_space":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#28
	sub	sp, sp, #28
	cmp	r2, #1
	str	r0, [sp, #12]
	blt	.LBB94_18
	add	r9, sp, #16
	mov	r7, r2
	mov	r4, r1
	mov	r10, #0
	mov	r11, #1
	mov	r8, #0
	b	.LBB94_4
.LBB94_2:
	cmp	r1, #133
	cmpne	r1, #160
	bne	.LBB94_13
.LBB94_3:
	add	r8, r0, r8
	cmp	r8, r7
	bge	.LBB94_18
.LBB94_4:
	add	r6, r8, r4
	sub	r5, r7, r8
	mov	r0, r9
	str	r10, [sp, #20]
	mov	r1, r6
	mov	r2, r5
	str	r10, [sp, #16]
	bl	"runtime::string_decode_rune"
	ldr	r1, [sp, #16]
	ldr	r0, [sp, #20]
	cmp	r1, #8192
	bge	.LBB94_8
	cmp	r1, #132
	bgt	.LBB94_2
	sub	r1, r1, #9
	cmp	r1, #23
	bhi	.LBB94_14
	mov	r2, #31
	orr	r2, r2, #8388608
	tst	r2, r11, lsl r1
	bne	.LBB94_3
	b	.LBB94_14
.LBB94_8:
	mov	r2, #11
	orr	r2, r2, #8192
	cmp	r1, r2
	blo	.LBB94_3
	mvn	r2, #39
	sub	r2, r2, #8192
	add	r2, r1, r2
	cmp	r2, #7
	bhi	.LBB94_11
	mov	r3, #131
	tst	r3, r11, lsl r2
	bne	.LBB94_3
.LBB94_11:
	cmp	r1, #12288
	beq	.LBB94_3
	mov	r2, #95
	orr	r2, r2, #8192
	cmp	r1, r2
	beq	.LBB94_3
	b	.LBB94_14
.LBB94_13:
	cmp	r1, #5760
	beq	.LBB94_3
.LBB94_14:
	mov	r0, #1
	mvn	r9, #0
	cmn	r8, #1
	beq	.LBB94_19
	mov	r1, #0
	cmp	r7, r8
	mov	r2, #0
	movhs	r1, #1
	movge	r2, #1
	tst	r1, r2
	beq	.LBB94_57
	cmp	r5, #1
	blt	.LBB94_20
	sub	r8, r6, #1
	mov	r10, #1
	mov	r11, #0
	mov	r4, r5
	b	.LBB94_26
.LBB94_18:
	mov	r0, #1
	mvn	r9, #0
.LBB94_19:
	mov	r6, #0
	mov	r5, #0
.LBB94_20:
	add	r0, r0, r9
	cmp	r5, #0
	cmppl	r0, #0
	bmi	.LBB94_22
	cmp	r0, r5
	ldrle	r1, [sp, #12]
	strle	r6, [r1]
	strle	r0, [r1, #4]
	addle	sp, sp, #28
	pople	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	movle	pc, lr
.LBB94_22:
	mov	r2, #145
	mov	r1, #0
	stmib	sp, {r0, r5}
	orr	r2, r2, #2304
	str	r1, [sp]
	ldr	r0, .LCPI94_1
.LBB94_23:
	mov	r1, #51
	mov	r3, #10
	bl	"runtime::slice_handle_error"
.LBB94_24:
	cmp	r0, #133
	cmpne	r0, #160
	bne	.LBB94_47
.LBB94_25:
	mov	r0, #1
	cmp	r4, #0
	ble	.LBB94_20
.LBB94_26:
	cmp	r4, r5
	bgt	.LBB94_55
	add	r0, r8, r4
	ldrsb	r0, [r0]
	cmp	r0, #0
	bmi	.LBB94_29
	sub	r4, r4, #1
	b	.LBB94_39
.LBB94_29:
	cmp	r4, #4
	mov	r2, r4
	movls	r2, #4
	sub	r1, r2, #4
	sub	r0, r4, #2
	cmp	r0, r1
	bge	.LBB94_31
	bic	r7, r0, r0, asr #31
	b	.LBB94_37
.LBB94_31:
	sub	r2, r2, #5
.LBB94_32:
	cmp	r0, r4
	bhs	.LBB94_54
	add	r3, r6, r0
	ldrsb	r3, [r3]
	cmn	r3, #65
	bgt	.LBB94_36
	sub	r3, r0, #1
	cmp	r0, r1
	mov	r0, r3
	bgt	.LBB94_32
	mov	r0, r2
.LBB94_36:
	bic	r7, r0, r0, asr #31
	cmp	r0, r4
	bgt	.LBB94_56
.LBB94_37:
	add	r1, r6, r7
	sub	r2, r4, r7
	add	r0, sp, #16
	str	r11, [sp, #20]
	str	r11, [sp, #16]
	bl	"utf8::decode_rune_in_bytes"
	ldr	r1, [sp, #20]
	add	r0, r1, r7
	cmp	r0, r4
	bne	.LBB94_48
	ldr	r0, [sp, #16]
	sub	r4, r4, r1
	cmp	r0, #8192
	bge	.LBB94_42
.LBB94_39:
	cmp	r0, #132
	bgt	.LBB94_24
	sub	r0, r0, #9
	cmp	r0, #23
	bhi	.LBB94_49
	mov	r1, #31
	orr	r1, r1, #8388608
	tst	r1, r10, lsl r0
	bne	.LBB94_25
	b	.LBB94_49
.LBB94_42:
	mov	r1, #11
	orr	r1, r1, #8192
	cmp	r0, r1
	blo	.LBB94_25
	mvn	r1, #39
	sub	r1, r1, #8192
	add	r1, r0, r1
	cmp	r1, #7
	bhi	.LBB94_45
	mov	r2, #131
	tst	r2, r10, lsl r1
	bne	.LBB94_25
.LBB94_45:
	cmp	r0, #12288
	beq	.LBB94_25
	mov	r1, #95
	orr	r1, r1, #8192
	cmp	r0, r1
	beq	.LBB94_25
	b	.LBB94_49
.LBB94_47:
	cmp	r0, #5760
	beq	.LBB94_25
	b	.LBB94_49
.LBB94_48:
	sub	r4, r4, #1
.LBB94_49:
	mov	r0, #1
	cmp	r4, #0
	bmi	.LBB94_53
	cmp	r5, r4
	bls	.LBB94_58
	mov	r1, r6
	ldrsb	r2, [r1, r4]!
	cmn	r2, #1
	bgt	.LBB94_53
	mov	r0, #0
	sub	r2, r5, r4
	str	r0, [sp, #20]
	str	r0, [sp, #16]
	add	r0, sp, #16
	bl	"utf8::decode_rune_in_bytes"
	ldr	r0, [sp, #20]
.LBB94_53:
	mov	r9, r4
	b	.LBB94_20
.LBB94_54:
	stm	sp, {r0, r4}
	mov	r1, #53
	mov	r2, #212
	ldr	r0, .LCPI94_0
	mov	r3, #19
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB94_55:
	mov	r0, #0
	mov	r2, #34
	stm	sp, {r0, r4, r5}
	orr	r2, r2, #2304
	mov	r1, #51
	ldr	r0, .LCPI94_1
	mov	r3, #47
	bl	"runtime::slice_handle_error"
.LBB94_56:
	ldr	r0, .LCPI94_0
	mov	r1, #53
	mov	r2, #218
	mov	r3, #25
	str	r7, [sp]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB94_57:
	mov	r2, #344
	ldr	r0, .LCPI94_1
	orr	r2, r2, #2048
	str	r8, [sp]
	str	r7, [sp, #4]
	str	r7, [sp, #8]
	b	.LBB94_23
.LBB94_58:
	mov	r2, #139
	ldr	r0, .LCPI94_1
	orr	r2, r2, #2304
	mov	r1, #51
	mov	r3, #17
	stm	sp, {r4, r5}
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI94_0:
	.long	".Lcsbs$POC-Example$104"
.LCPI94_1:
	.long	".Lcsbs$POC-Example$16e"
.Lfunc_end94:
	.size	"strings::trim_space", .Lfunc_end94-"strings::trim_space"
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::fmt_struct",%function
	.code	32
"fmt::fmt_struct":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#516
	sub	sp, sp, #516
	ldr	r4, [sp, #560]
	mov	r7, r0
	bic	r0, r2, #1
	cmp	r0, #118
	bne	.LBB95_5
	str	r2, [sp, #144]
	mov	r10, r3
	ldrb	r0, [r10, #24]
	ldr	r2, [r1]
	ldr	r6, [r1, #4]
	tst	r0, #2
	ldr	r11, [r1, #8]
	ldr	r9, [r1, #12]
	ldr	r5, [sp, #556]
	ldr	r3, [sp, #552]
	str	r7, [sp, #212]
	str	r4, [sp, #208]
	str	r10, [sp, #196]
	str	r2, [sp, #188]
	bne	.LBB95_6
	str	r6, [sp, #68]
	str	r9, [sp, #72]
	ldr	r6, [r7, #40]
	ldrb	r9, [r10, #25]
	cmp	r6, #0
	beq	.LBB95_60
	ldr	r1, [r7, #44]
	add	r0, sp, #496
	mov	r8, #0
	mov	r2, #4
	str	r8, [sp, #504]
	str	r8, [sp, #500]
	str	r8, [sp, #496]
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	str	r4, [sp, #20]
	str	r5, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r7, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r0, [r7, #84]
	ldr	r5, [r7, #40]
	add	r0, r0, r2
	ldr	r2, [sp, #144]
	str	r0, [r7, #84]
	rsbs	r0, r9, #0
	adc	r0, r9, r0
	subs	r2, r2, #118
	movne	r2, #1
	orrs	r0, r2, r0
	ldr	r1, [r7, #44]
	str	r0, [sp, #64]
	mov	r0, #91
	movne	r0, #123
	cmp	r5, #0
	strb	r0, [sp, #480]
	beq	.LBB95_61
	mov	r0, #1
	str	r8, [sp, #504]
	str	r8, [sp, #500]
	add	r3, sp, #480
	str	r8, [sp, #496]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #496
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_61
.LBB95_5:
	mov	r1, r2
	mov	r0, r7
	mov	r2, r4
	add	sp, sp, #516
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_bad_verb"
.LBB95_6:
	add	r0, sp, #240
	str	r5, [sp, #136]
	add	r0, r0, #8
	str	r3, [sp, #116]
	str	r0, [sp, #108]
	add	r0, sp, #288
	mov	r4, #73
	add	r8, r0, #8
	add	r0, sp, #360
	orr	r4, r4, #256
	add	r0, r0, #8
	str	r0, [sp, #112]
	add	r0, sp, #480
	mov	r1, r9
	stm	r0, {r2, r6, r11}
	mov	r0, r11
	mov	r2, r4
	mov	r3, #0
	str	r9, [sp, #492]
	mov	r5, #0
	bl	__aeabi_uldivmod
	ldr	r1, .LCPI95_37
	mov	lr, r4
	ldr	r12, .LCPI95_38
	mov	r7, #0
	b	.LBB95_8
.LBB95_7:
	adds	r0, r2, #1
	adc	r3, r3, #0
	subs	r2, r0, lr
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r5, #1
	adc	r6, r7, #0
	subs	r5, r5, #328
	sbcs	r7, r7, #0
	mov	r5, r0
	mov	r7, r6
	bhs	.LBB95_10
.LBB95_8:
	ldr	r0, [r1, r2, lsl #2]
	cmp	r0, #0
	beq	.LBB95_7
	ldr	r6, [r0, #16]
	ldr	r4, [r0, #20]
	eor	r6, r6, r11
	eor	r4, r4, r9
	orrs	r6, r6, r4
	bne	.LBB95_7
	b	.LBB95_11
.LBB95_10:
	mov	r0, r12
.LBB95_11:
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r3, r1, #1
	str	r8, [sp, #104]
	orrs	r3, r3, r2
	bne	.LBB95_14
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
.LBB95_13:
	ldr	r0, [r0, #32]
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r3, r1, #1
	orrs	r3, r3, r2
	beq	.LBB95_13
	b	.LBB95_15
.LBB95_14:
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
.LBB95_15:
	eor	r1, r1, #19
	orrs	r1, r1, r2
	bne	.LBB95_602
	ldrb	r0, [r0, #48]
	tst	r0, #2
	beq	.LBB95_602
	ldr	r0, [r10, #20]
	str	r0, [sp, #124]
	cmp	r0, #0
	bmi	.LBB95_629
	beq	.LBB95_602
	mov	r0, #0
	ldr	r6, [r10, #16]
	str	r0, [sp, #148]
	add	r9, sp, #452
	ldr	r5, [sp, #124]
	mov	r7, #0
	ldr	r11, .LCPI95_39
	mov	r8, #13
	mov	r4, #0
	str	r6, [sp, #120]
.LBB95_20:
	str	r0, [sp, #140]
	b	.LBB95_22
.LBB95_21:
	add	r4, r4, #1
	cmp	r4, r5
	bge	.LBB95_183
.LBB95_22:
	mov	r0, r6
	mov	r3, r11
	ldr	r1, [r0, r4, lsl #3]!
	str	r7, [sp, #452]
	ldr	r2, [r0, #4]
	mov	r0, r9
	str	r7, [sp, #456]
	strb	r7, [sp, #460]
	str	r8, [sp]
	bl	"reflect::struct_tag_lookup"
	ldrb	r0, [sp, #460]
	tst	r0, #1
	beq	.LBB95_21
	ldr	r1, [sp, #456]
	ldr	r3, [sp, #452]
	cmp	r1, #15
	bgt	.LBB95_28
	cmp	r1, #1
	blt	.LBB95_21
	mov	lr, #0
.LBB95_26:
	ldrb	r0, [r3, lr]
	cmp	r0, #61
	beq	.LBB95_36
	add	lr, lr, #1
	cmp	r1, lr
	bne	.LBB95_26
	b	.LBB95_21
.LBB95_28:
	mov	r0, #1
	add	r8, r0, r1, lsr #4
	mov	lr, #0
	str	r4, [sp, #132]
	str	r1, [sp, #128]
	str	r3, [sp, #192]
.LBB95_29:
	mov	r6, r3
	ldrb	r0, [r6, lr]!
	str	r0, [sp, #204]
	ldrb	r0, [r6, #15]
	str	r0, [sp, #184]
	sub	r0, r0, #61
	ldrb	r1, [r6, #14]
	rsbs	r2, r0, #0
	str	r1, [sp, #168]
	adc	r0, r0, r2
	sub	r2, r1, #61
	rsbs	r3, r2, #0
	ldrb	r1, [r6, #13]
	adc	r2, r2, r3
	str	r1, [sp, #176]
	orr	r0, r2, r0, lsl #1
	sub	r2, r1, #61
	ldrb	r1, [r6, #12]
	rsbs	r3, r2, #0
	adc	r2, r2, r3
	str	r1, [sp, #152]
	sub	r3, r1, #61
	ldrb	r1, [r6, #11]
	rsbs	r7, r3, #0
	str	r1, [sp, #180]
	adc	r3, r3, r7
	ldrb	r12, [r6, #8]
	orr	r2, r3, r2, lsl #1
	ldrb	r11, [r6, #6]
	orr	r0, r2, r0, lsl #2
	sub	r2, r1, #61
	ldrb	r1, [r6, #10]
	rsbs	r3, r2, #0
	adc	r2, r2, r3
	str	r1, [sp, #156]
	sub	r3, r1, #61
	ldrb	r1, [r6, #9]
	rsbs	r4, r3, #0
	str	r1, [sp, #164]
	adc	r3, r3, r4
	sub	r4, r1, #61
	rsbs	r5, r4, #0
	orr	r3, r3, r2, lsl #1
	adc	r4, r4, r5
	sub	r5, r12, #61
	rsbs	r2, r5, #0
	ldrb	r1, [r6, #3]
	adc	r2, r5, r2
	ldrb	r5, [r6, #1]
	orr	r2, r2, r4, lsl #1
	orr	r2, r2, r3, lsl #2
	orr	r0, r2, r0, lsl #4
	str	r0, [sp, #200]
	ldrb	r0, [r6, #7]
	str	r0, [sp, #172]
	sub	r0, r0, #61
	rsbs	r2, r0, #0
	adc	r0, r0, r2
	sub	r2, r11, #61
	rsbs	r3, r2, #0
	adc	r2, r2, r3
	orr	r2, r2, r0, lsl #1
	ldrb	r0, [r6, #5]
	str	r0, [sp, #160]
	sub	r0, r0, #61
	ldr	r7, [sp, #204]
	rsbs	r3, r0, #0
	adc	r4, r0, r3
	ldrb	r0, [r6, #2]
	ldrb	r6, [r6, #4]
	sub	r9, r6, #61
	rsbs	r10, r9, #0
	adc	r3, r9, r10
	mov	r10, r5
	orr	r3, r3, r4, lsl #1
	mov	r9, r1
	orr	r2, r3, r2, lsl #2
	sub	r3, r1, #61
	rsbs	r4, r3, #0
	adc	r3, r3, r4
	sub	r4, r0, #61
	rsbs	r5, r4, #0
	adc	r4, r4, r5
	orr	r3, r4, r3, lsl #1
	sub	r4, r7, #61
	rsbs	r5, r4, #0
	adc	r4, r4, r5
	sub	r5, r10, #61
	rsbs	r1, r5, #0
	adc	r1, r5, r1
	orr	r1, r4, r1, lsl #1
	orr	r1, r1, r3, lsl #2
	orr	r1, r1, r2, lsl #4
	ldr	r2, [sp, #200]
	and	r1, r1, #255
	orr	r1, r1, r2, lsl #8
	mov	r2, #255
	orr	r2, r2, #65280
	tst	r1, r2
	bne	.LBB95_34
	ldr	r3, [sp, #192]
	sub	r8, r8, #1
	add	lr, lr, #16
	cmp	r8, #1
	bgt	.LBB95_29
	ldr	r1, [sp, #128]
	add	r9, sp, #452
	ldr	r10, [sp, #196]
	mov	r7, #0
	ldr	r5, [sp, #124]
	cmp	lr, r1
	ldr	r6, [sp, #120]
	mov	r8, #13
	ldr	r11, .LCPI95_39
	ldr	r4, [sp, #132]
	bge	.LBB95_21
.LBB95_32:
	ldrb	r0, [r3, lr]
	cmp	r0, #61
	beq	.LBB95_35
	add	lr, lr, #1
	cmp	r1, lr
	bne	.LBB95_32
	b	.LBB95_21
.LBB95_34:
	subs	r1, r7, #61
	mvn	r2, #0
	mvnne	r1, #0
	cmp	r12, #61
	moveq	r2, #8
	cmp	r1, r2
	ldr	r3, [sp, #152]
	movlo	r2, r1
	cmp	r6, #61
	mvn	r1, #0
	moveq	r1, #4
	cmp	r3, #61
	mvn	r7, #0
	mvn	r3, #0
	moveq	r7, #12
	cmp	r1, r7
	movlo	r7, r1
	cmp	r2, r7
	ldr	r1, [sp, #156]
	movlo	r7, r2
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #2
	cmp	r1, #61
	mvn	r1, #0
	mvn	r2, #0
	moveq	r1, #10
	cmp	r0, r1
	movlo	r1, r0
	ldr	r0, [sp, #168]
	cmp	r11, #61
	ldr	r5, [sp, #124]
	moveq	r2, #6
	cmp	r0, #61
	mvn	r0, #0
	ldr	r6, [sp, #120]
	moveq	r0, #14
	cmp	r2, r0
	movlo	r0, r2
	cmp	r1, r0
	movlo	r0, r1
	cmp	r7, r0
	ldr	r2, [sp, #164]
	movlo	r0, r7
	cmp	r10, #61
	mvn	r1, #0
	moveq	r1, #1
	cmp	r2, #61
	moveq	r3, #9
	cmp	r1, r3
	movlo	r3, r1
	ldr	r1, [sp, #160]
	ldr	r2, [sp, #176]
	mov	r8, #13
	cmp	r1, #61
	mvn	r1, #0
	moveq	r1, #5
	cmp	r2, #61
	mvn	r2, #0
	ldr	r7, [sp, #184]
	moveq	r2, #13
	cmp	r1, r2
	movlo	r2, r1
	cmp	r3, r2
	movlo	r2, r3
	ldr	r3, [sp, #180]
	cmp	r9, #61
	mvn	r1, #0
	moveq	r1, #3
	cmp	r3, #61
	mvn	r3, #0
	ldr	r10, [sp, #196]
	moveq	r3, #11
	cmp	r1, r3
	movlo	r3, r1
	ldr	r1, [sp, #172]
	ldr	r11, .LCPI95_39
	add	r9, sp, #452
	cmp	r1, #61
	mvn	r1, #0
	moveq	r1, #7
	cmp	r7, #61
	mvn	r7, #0
	ldr	r4, [sp, #132]
	moveq	r7, #15
	cmp	r1, r7
	movlo	r7, r1
	cmp	r3, r7
	movlo	r7, r3
	cmp	r2, r7
	movlo	r7, r2
	cmp	r0, r7
	movlo	r7, r0
	and	r0, r7, #255
	ldr	r3, [sp, #192]
	add	lr, r0, lr
	ldr	r1, [sp, #128]
	mov	r7, #0
.LBB95_35:
	cmn	lr, #1
	beq	.LBB95_21
.LBB95_36:
	cmp	lr, #0
	bmi	.LBB95_624
	cmp	lr, r1
	bgt	.LBB95_624
	add	r0, lr, #1
	cmn	lr, #-2147483647
	beq	.LBB95_625
	cmp	r0, r1
	bgt	.LBB95_625
	ldr	r1, .LCPI95_40
	add	r0, r3, lr
	cmp	r0, r1
	ldrbne	r0, [r0]
	cmpne	r0, #61
	bne	.LBB95_21
	str	r4, [sp, #132]
	ldr	r0, [sp, #140]
	cmp	r0, #0
	beq	.LBB95_56
	cmp	r0, lr
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
	bne	.LBB95_602
	ldr	r0, [sp, #148]
	cmp	r0, r3
	beq	.LBB95_57
	ldr	r0, [sp, #140]
	mov	r1, #0
	cmp	r0, #8
	blo	.LBB95_53
	ldr	r0, [sp, #140]
	bics	r2, r0, #-2147483633
	beq	.LBB95_50
	sub	r0, r2, #1
	str	r3, [sp, #192]
	bic	r0, r0, #15
	str	r2, [sp, #180]
	add	r1, r0, #16
	mov	r0, #0
.LBB95_47:
	mov	r5, r3
	mov	r10, r11
	ldrb	r2, [r5, r0]!
	str	r2, [sp, #204]
	ldr	r6, [sp, #148]
	ldrb	r2, [r5, #15]
	ldrb	r8, [r5, #2]
	ldrb	r3, [r6, r0]!
	str	r3, [sp, #200]
	ldrb	r4, [r6, #15]
	ldrb	r3, [r6, #14]
	subs	r2, r4, r2
	ldrb	r4, [r5, #14]
	movne	r2, #1
	ldrb	r7, [r6, #12]
	subs	r3, r3, r4
	ldrb	r4, [r6, #13]
	movne	r3, #1
	orr	r2, r3, r2, lsl #1
	ldrb	r3, [r5, #13]
	ldrb	r11, [r6, #1]
	subs	r3, r4, r3
	ldrb	r4, [r5, #12]
	movne	r3, #1
	subs	r4, r7, r4
	ldrb	r7, [r6, #10]
	movne	r4, #1
	orr	r3, r4, r3, lsl #1
	orr	r9, r3, r2, lsl #2
	ldrb	r3, [r5, #11]
	ldrb	r4, [r6, #11]
	ldrb	r2, [r6, #8]
	subs	r3, r4, r3
	ldrb	r4, [r5, #10]
	movne	r3, #1
	subs	r4, r7, r4
	ldrb	r7, [r6, #9]
	movne	r4, #1
	orr	r3, r4, r3, lsl #1
	ldrb	r4, [r5, #9]
	subs	r4, r7, r4
	ldrb	r7, [r5, #8]
	movne	r4, #1
	subs	r2, r2, r7
	ldrb	r7, [r6, #6]
	movne	r2, #1
	orr	r2, r2, r4, lsl #1
	ldrb	r4, [r6, #7]
	orr	r2, r2, r3, lsl #2
	ldrb	r3, [r5, #7]
	orr	r9, r2, r9, lsl #4
	ldrb	r2, [r5, #1]
	subs	r3, r4, r3
	ldrb	r4, [r5, #6]
	movne	r3, #1
	str	r2, [sp, #184]
	subs	r4, r7, r4
	ldrb	r7, [r6, #5]
	movne	r4, #1
	orr	lr, r4, r3, lsl #1
	ldrb	r4, [r5, #5]
	ldrb	r3, [r6, #2]
	subs	r4, r7, r4
	ldrb	r7, [r5, #3]
	ldrb	r2, [r6, #3]
	movne	r4, #1
	ldrb	r5, [r5, #4]
	ldrb	r6, [r6, #4]
	ldr	r12, [sp, #212]
	subs	r5, r6, r5
	movne	r5, #1
	subs	r2, r2, r7
	movne	r2, #1
	subs	r3, r3, r8
	orr	r4, r5, r4, lsl #1
	movne	r3, #1
	orr	r6, r4, lr, lsl #2
	orr	r2, r3, r2, lsl #1
	ldr	r3, [sp, #204]
	mov	r8, #13
	ldr	r4, [sp, #200]
	ldr	lr, [sp, #136]
	subs	r3, r4, r3
	ldr	r4, [sp, #184]
	movne	r3, #1
	subs	r7, r11, r4
	mov	r11, r10
	movne	r7, #1
	ldr	r10, [sp, #196]
	orr	r3, r3, r7, lsl #1
	mov	r7, #0
	orr	r2, r3, r2, lsl #2
	mov	r3, #255
	orr	r2, r2, r6, lsl #4
	orr	r3, r3, #65280
	and	r2, r2, #255
	orr	r2, r2, r9, lsl #8
	add	r9, sp, #452
	tst	r2, r3
	ldr	r3, [sp, #192]
	bne	.LBB95_602
	ldr	r2, [sp, #180]
	add	r0, r0, #16
	cmp	r0, r2
	blo	.LBB95_47
	ldr	r0, [sp, #140]
.LBB95_50:
	sub	r0, r0, r1
	bic	r0, r0, #3
	cmp	r1, r0
	bhs	.LBB95_53
.LBB95_51:
	ldr	r2, [r3, r1]
	mov	r4, r3
	ldr	r3, [sp, #148]
	ldr	r3, [r3, r1]
	cmp	r3, r2
	bne	.LBB95_602
	mov	r3, r4
	add	r1, r1, #4
	cmp	r1, r0
	blo	.LBB95_51
.LBB95_53:
	ldr	r0, [sp, #140]
	cmp	r1, r0
	bhs	.LBB95_58
.LBB95_54:
	ldr	r2, [sp, #148]
	ldrb	r0, [r3, r1]
	ldrb	r2, [r2, r1]
	cmp	r2, r0
	bne	.LBB95_602
	ldr	r0, [sp, #140]
	add	r1, r1, #1
	cmp	r0, r1
	bne	.LBB95_54
	b	.LBB95_58
.LBB95_56:
	str	r3, [sp, #148]
	mov	r0, lr
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
	b	.LBB95_59
.LBB95_57:
	ldr	r0, [sp, #140]
.LBB95_58:
	ldr	r5, [sp, #124]
	ldr	r6, [sp, #120]
.LBB95_59:
	ldr	r1, [sp, #132]
	add	r1, r1, #1
	cmp	r1, r5
	mov	r4, r1
	blt	.LBB95_20
	b	.LBB95_184
.LBB95_60:
	ldr	r1, [sp, #144]
	rsbs	r0, r9, #0
	adc	r0, r9, r0
	subs	r1, r1, #118
	movne	r1, #1
	orr	r0, r1, r0
	str	r0, [sp, #64]
.LBB95_61:
	ldr	r0, [r7, #68]
	ldrb	r1, [r7, #4]
	add	r0, r0, #1
	str	r0, [r7, #68]
	ldr	r0, [r7, #20]
	str	r0, [sp, #76]
	add	r0, r0, #1
	str	r0, [r7, #20]
	ldr	r8, [r10, #20]
	rsbs	r0, r9, #0
	adc	r0, r9, r0
	ands	r1, r1, #255
	str	r1, [sp, #204]
	movne	r1, #1
	cmp	r8, #0
	mov	r2, r8
	movne	r2, #1
	and	r1, r1, r2
	and	r0, r1, r0
	str	r0, [sp, #60]
	cmp	r0, #1
	bne	.LBB95_64
	ldr	r5, [r7, #40]
	mov	r0, #10
	ldr	r1, [r7, #44]
	cmp	r5, #0
	strb	r0, [sp, #480]
	beq	.LBB95_67
	mov	r0, #0
	add	r3, sp, #480
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #496
	mov	lr, pc
	mov	pc, r5
	ldr	r2, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r2, #84]
	add	r0, r0, r1
	str	r0, [r2, #84]
	ldr	r8, [r10, #20]
	b	.LBB95_67
.LBB95_64:
	cmp	r9, #0
	beq	.LBB95_67
	ldr	r0, [sp, #76]
	add	r0, r0, #2
	str	r0, [r7, #20]
	ldr	r0, [r10, #32]
	ldr	r1, [r0, #64]
	ldr	r2, [r0, #68]
	eor	r1, r1, #1
	orrs	r1, r1, r2
	mov	r1, #0
	str	r1, [sp, #172]
	str	r1, [sp, #168]
	ldreq	r1, [r0, #24]
	streq	r1, [sp, #172]
	ldreq	r0, [r0, #28]
	ldrb	r1, [r10, #25]
	streq	r0, [sp, #168]
	ldr	r0, [r10, #20]
	cmp	r1, #2
	str	r0, [sp, #200]
	mvn	r0, #0
	mvnne	r0, #2
	cmpne	r1, #3
	bne	.LBB95_193
	ldr	r1, [sp, #200]
	add	r1, r1, r0
	ldr	r0, [r10, #8]
	str	r1, [sp, #200]
	ldr	r0, [r0, r1, lsl #2]
	ldr	r1, [sp, #188]
	add	r0, r0, r1
	b	.LBB95_194
.LBB95_67:
	cmp	r8, #0
	bmi	.LBB95_626
	beq	.LBB95_275
	ldr	r0, [sp, #144]
	mov	r4, #0
	ldr	r9, [r10, #4]
	mov	r6, #3
	cmp	r0, #119
	add	r7, sp, #496
	movne	r0, #118
	mov	r1, #0
	str	r0, [sp, #48]
	add	r0, sp, #216
	add	r0, r0, #8
	str	r0, [sp, #44]
	ldr	r0, [sp, #212]
	add	r0, r0, #32
	str	r0, [sp, #40]
	mvn	r0, #0
	str	r0, [sp, #164]
	str	r8, [sp, #56]
	str	r9, [sp, #52]
	b	.LBB95_71
.LBB95_70:
	ldr	r0, [sp, #140]
	mov	r4, #0
	add	r1, r1, #1
	strb	r4, [r5, #80]
	cmp	r0, #0
	ldr	r0, [sp, #164]
	strpl	r4, [r5, #72]
	strpl	r4, [r5, #76]
	cmp	r1, r8
	add	r0, r0, #1
	str	r0, [sp, #164]
	bge	.LBB95_275
.LBB95_71:
	ldr	r0, [sp, #212]
	ldr	r5, [r10, #16]
	ldr	r2, [r0, #12]
	str	r2, [sp, #172]
	ldr	r2, [r0, #16]
	str	r2, [sp, #152]
	ldr	r2, [r0, #20]
	str	r2, [sp, #80]
	ldrb	r2, [r0, #11]
	str	r2, [sp, #84]
	ldrb	r2, [r0, #10]
	str	r2, [sp, #88]
	ldrb	r2, [r0, #9]
	str	r2, [sp, #92]
	ldrb	r2, [r0, #8]
	str	r2, [sp, #96]
	ldrb	r2, [r0, #7]
	str	r2, [sp, #100]
	ldrb	r2, [r0, #6]
	str	r2, [sp, #104]
	ldrb	r2, [r0, #5]
	str	r2, [sp, #148]
	ldrb	r2, [r0, #4]
	str	r2, [sp, #156]
	ldrb	r2, [r0]
	str	r2, [sp, #160]
	ldrb	r2, [r0, #1]
	str	r2, [sp, #200]
	ldrb	r2, [r0, #2]
	ldrb	r0, [r0, #3]
	str	r2, [sp, #168]
	str	r0, [sp, #176]
.LBB95_72:
	mov	r0, r9
	ldr	r3, .LCPI95_41
	ldr	r2, [r0, r1, lsl #3]!
	str	r2, [sp, #184]
	ldr	r0, [r0, #4]
	str	r0, [sp, #180]
	mov	r0, r5
	str	r4, [sp, #496]
	str	r4, [sp, #500]
	strb	r4, [sp, #504]
	str	r1, [sp, #192]
	ldr	r1, [r0, r1, lsl #3]!
	ldr	r2, [r0, #4]
	mov	r0, r7
	str	r6, [sp]
	bl	"reflect::struct_tag_lookup"
	ldrb	r0, [sp, #504]
	cmp	r0, #0
	beq	.LBB95_77
	ldr	r1, [sp, #496]
	add	r0, sp, #464
	ldr	r2, [sp, #500]
	str	r4, [sp, #468]
	str	r4, [sp, #464]
	bl	"strings::trim_space"
	ldr	r12, [sp, #468]
	ldr	lr, [sp, #464]
	cmp	r12, #1
	bne	.LBB95_76
	ldr	r0, .LCPI95_42
	cmp	lr, r0
	ldrbne	r1, [lr]
	cmpne	r1, #45
	bne	.LBB95_81
	ldr	r1, [sp, #192]
	add	r1, r1, #1
	cmp	r1, r8
	blt	.LBB95_72
	b	.LBB95_275
.LBB95_76:
	cmp	r12, #0
	bne	.LBB95_78
.LBB95_77:
	ldr	r4, [sp, #48]
	mvn	r0, #0
	ldr	r5, [sp, #212]
	mov	r6, #0
	mov	r9, #1
	str	r0, [sp, #236]
	b	.LBB95_157
.LBB95_78:
	mvn	r0, #0
	cmp	r12, #15
	str	r0, [sp, #236]
	bgt	.LBB95_86
	ldr	r3, [sp, #160]
	cmp	r12, #0
	ldr	r5, [sp, #156]
	mov	r9, #1
	bgt	.LBB95_82
	mov	r0, #0
	mov	r2, #0
	str	r0, [sp, #140]
	mov	r1, #0
	str	r0, [sp, #132]
	str	r0, [sp, #172]
	ldr	r4, [sp, #144]
	ldr	r8, [sp, #208]
	b	.LBB95_124
.LBB95_81:
	ldr	r3, [sp, #160]
	mvn	r0, #0
	ldr	r5, [sp, #156]
	mov	r9, #1
	str	r0, [sp, #236]
.LBB95_82:
	ldr	r8, [sp, #208]
	mov	r2, #0
.LBB95_83:
	ldrb	r1, [lr, r2]
	cmp	r1, #44
	beq	.LBB95_93
	add	r2, r2, #1
	cmp	r12, r2
	bne	.LBB95_83
	mov	r0, #0
	str	r0, [sp, #140]
	str	r0, [sp, #132]
	ldr	r4, [sp, #144]
	b	.LBB95_102
.LBB95_86:
	mov	r0, #1
	add	r9, r0, r12, lsr #4
	mov	r2, #0
	str	r11, [sp, #36]
	str	r12, [sp, #32]
.LBB95_87:
	mov	r1, lr
	ldrb	r11, [r1, r2]!
	ldrb	r0, [r1, #15]
	str	r0, [sp, #148]
	sub	r7, r0, #44
	ldrb	r0, [r1, #14]
	rsbs	r6, r7, #0
	str	r0, [sp, #128]
	adc	r7, r7, r6
	sub	r6, r0, #44
	rsbs	r5, r6, #0
	ldrb	r0, [r1, #13]
	adc	r6, r6, r5
	str	r0, [sp, #136]
	orr	r7, r6, r7, lsl #1
	sub	r6, r0, #44
	ldrb	r0, [r1, #12]
	rsbs	r5, r6, #0
	adc	r6, r6, r5
	str	r0, [sp, #108]
	sub	r4, r0, #44
	ldrb	r0, [r1, #11]
	rsbs	r5, r4, #0
	str	r0, [sp, #140]
	adc	r5, r4, r5
	ldrb	r8, [r1, #6]
	orr	r6, r5, r6, lsl #1
	ldrb	r12, [r1, #1]
	orr	r4, r6, r7, lsl #2
	sub	r7, r0, #44
	ldrb	r0, [r1, #10]
	rsbs	r6, r7, #0
	adc	r5, r7, r6
	str	r0, [sp, #112]
	sub	r6, r0, #44
	ldrb	r0, [r1, #9]
	rsbs	r7, r6, #0
	str	r0, [sp, #124]
	adc	r6, r6, r7
	ldrb	r10, [r1, #2]
	orr	r5, r6, r5, lsl #1
	sub	r6, r0, #44
	rsbs	r7, r6, #0
	adc	r7, r6, r7
	ldrb	r6, [r1, #8]
	sub	r0, r6, #44
	rsbs	r3, r0, #0
	adc	r0, r0, r3
	orr	r0, r0, r7, lsl #1
	ldrb	r7, [r1, #3]
	orr	r0, r0, r5, lsl #2
	orr	r0, r0, r4, lsl #4
	str	r0, [sp, #172]
	ldrb	r0, [r1, #7]
	str	r0, [sp, #132]
	sub	r0, r0, #44
	rsbs	r3, r0, #0
	adc	r0, r0, r3
	sub	r3, r8, #44
	rsbs	r4, r3, #0
	adc	r3, r3, r4
	orr	r0, r3, r0, lsl #1
	ldrb	r3, [r1, #5]
	str	r3, [sp, #116]
	sub	r3, r3, #44
	ldrb	r1, [r1, #4]
	rsbs	r5, r3, #0
	str	r7, [sp, #120]
	adc	r3, r3, r5
	sub	r5, r1, #44
	rsbs	r4, r5, #0
	adc	r4, r5, r4
	orr	r3, r4, r3, lsl #1
	orr	r0, r3, r0, lsl #2
	sub	r3, r7, #44
	rsbs	r4, r3, #0
	mov	r7, r11
	adc	r3, r3, r4
	sub	r4, r10, #44
	rsbs	r5, r4, #0
	adc	r4, r4, r5
	orr	r3, r4, r3, lsl #1
	sub	r4, r11, #44
	rsbs	r5, r4, #0
	adc	r4, r4, r5
	sub	r5, r12, #44
	rsbs	r11, r5, #0
	adc	r5, r5, r11
	orr	r4, r4, r5, lsl #1
	orr	r3, r4, r3, lsl #2
	orr	r0, r3, r0, lsl #4
	ldr	r3, [sp, #172]
	and	r0, r0, #255
	orr	r0, r0, r3, lsl #8
	mov	r3, #255
	orr	r3, r3, #65280
	tst	r0, r3
	bne	.LBB95_94
	sub	r9, r9, #1
	add	r2, r2, #16
	cmp	r9, #1
	bgt	.LBB95_87
	ldr	r12, [sp, #32]
	ldr	r4, [sp, #144]
	ldr	r3, [sp, #160]
	cmp	r2, r12
	ldr	r5, [sp, #156]
	bge	.LBB95_92
.LBB95_90:
	ldrb	r0, [lr, r2]
	cmp	r0, #44
	beq	.LBB95_95
	add	r2, r2, #1
	cmp	r12, r2
	bne	.LBB95_90
.LBB95_92:
	mov	r0, #0
	mov	r9, #1
	str	r0, [sp, #140]
	ldr	r8, [sp, #208]
	ldr	r10, [sp, #196]
	ldr	r11, [sp, #36]
	b	.LBB95_101
.LBB95_93:
	ldr	r4, [sp, #144]
	b	.LBB95_96
.LBB95_94:
	subs	r0, r7, #44
	mvn	r3, #0
	mvnne	r0, #0
	cmp	r6, #44
	moveq	r3, #8
	cmp	r0, r3
	movlo	r3, r0
	cmp	r1, #44
	ldr	r1, [sp, #108]
	mvn	r0, #0
	moveq	r0, #4
	mvn	r6, #0
	cmp	r1, #44
	ldr	r1, [sp, #112]
	moveq	r6, #12
	cmp	r0, r6
	movlo	r6, r0
	cmp	r3, r6
	movlo	r6, r3
	cmp	r10, #44
	mvn	r0, #0
	mvn	r3, #0
	moveq	r0, #2
	cmp	r1, #44
	moveq	r3, #10
	cmp	r0, r3
	ldr	r1, [sp, #128]
	movlo	r3, r0
	cmp	r8, #44
	mvn	r0, #0
	moveq	r0, #6
	cmp	r1, #44
	mvn	r1, #0
	ldr	r4, [sp, #136]
	moveq	r1, #14
	cmp	r0, r1
	movlo	r1, r0
	cmp	r3, r1
	movlo	r1, r3
	cmp	r6, r1
	ldr	r3, [sp, #124]
	movlo	r1, r6
	cmp	r12, #44
	mvn	r0, #0
	moveq	r0, #1
	cmp	r3, #44
	mvn	r3, #0
	mvn	r7, #0
	moveq	r3, #9
	cmp	r0, r3
	movlo	r3, r0
	ldr	r0, [sp, #116]
	ldr	r5, [sp, #156]
	cmp	r0, #44
	mvn	r0, #0
	moveq	r0, #5
	cmp	r4, #44
	moveq	r7, #13
	cmp	r0, r7
	movlo	r7, r0
	cmp	r3, r7
	ldr	r0, [sp, #120]
	movlo	r7, r3
	ldr	r3, [sp, #140]
	cmp	r0, #44
	mvn	r0, #0
	moveq	r0, #3
	cmp	r3, #44
	mvn	r3, #0
	ldr	r4, [sp, #148]
	moveq	r3, #11
	cmp	r0, r3
	movlo	r3, r0
	ldr	r0, [sp, #132]
	ldr	r12, [sp, #32]
	cmp	r0, #44
	mvn	r0, #0
	moveq	r0, #7
	cmp	r4, #44
	mvn	r4, #0
	moveq	r4, #15
	cmp	r0, r4
	movlo	r4, r0
	cmp	r3, r4
	movlo	r4, r3
	cmp	r7, r4
	movlo	r4, r7
	cmp	r1, r4
	movlo	r4, r1
	and	r0, r4, #255
	ldr	r4, [sp, #144]
	add	r2, r0, r2
	ldr	r3, [sp, #160]
.LBB95_95:
	ldr	r8, [sp, #208]
	cmn	r2, #1
	ldr	r10, [sp, #196]
	mov	r9, #1
	ldr	r11, [sp, #36]
	beq	.LBB95_121
.LBB95_96:
	cmp	r2, #0
	bmi	.LBB95_628
	cmp	r2, r12
	bgt	.LBB95_628
	add	r1, r2, #1
	cmn	r2, #-2147483647
	beq	.LBB95_627
	cmp	r12, r1
	blt	.LBB95_627
	sub	r0, r12, r1
	str	r0, [sp, #140]
	add	r0, lr, r1
	mov	r12, r2
.LBB95_101:
	cmp	r12, #1
	str	r0, [sp, #132]
	blt	.LBB95_115
.LBB95_102:
	mov	r2, #0
	b	.LBB95_106
.LBB95_103:
	mov	r0, #1
	str	r0, [sp, #168]
.LBB95_104:
	str	r6, [sp, #200]
.LBB95_105:
	add	r2, r2, #1
	cmp	r12, r2
	beq	.LBB95_114
.LBB95_106:
	ldrb	r0, [lr, r2]
	ldr	r6, [sp, #200]
	sub	r1, r0, #32
	cmp	r1, #16
	bhi	.LBB95_116
	mov	r0, #1
	str	r0, [sp, #200]
	adr	r0, .LJTI95_1
	ldr	pc, [r0, r1, lsl #2]
	.p2align	2
.LCPI95_37:
	.long	.L__$type_info_data
	.p2align	2
.LCPI95_38:
	.long	".L__$ti-0"
	.p2align	2
	.p2align	2
.LJTI95_1:
	.long	.LBB95_103
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_111
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_105
	.long	.LBB95_116
	.long	.LBB95_112
	.long	.LBB95_116
	.long	.LBB95_116
	.long	.LBB95_113
.LBB95_111:
	mov	r5, #1
	b	.LBB95_104
.LBB95_112:
	mov	r0, #0
	mov	r3, #1
	str	r0, [sp, #176]
	b	.LBB95_104
.LBB95_113:
	rsbs	r0, r3, #0
	adc	r0, r3, r0
	str	r0, [sp, #176]
	b	.LBB95_104
.LBB95_114:
	mov	r0, #0
	str	r5, [sp, #156]
	str	r3, [sp, #160]
	str	r0, [sp, #148]
	ldr	r4, [sp, #48]
	str	r0, [sp, #172]
	b	.LBB95_140
.LBB95_115:
	mov	r0, #0
	mov	r2, #0
	mov	r1, #0
	str	r0, [sp, #172]
	b	.LBB95_124
.LBB95_116:
	mov	r0, #0
	mov	r1, r2
	str	r0, [sp, #172]
.LBB95_117:
	cmp	r12, r1
	beq	.LBB95_623
	ldrb	r7, [lr, r1]
	sub	r0, r7, #48
	cmp	r0, #9
	bhi	.LBB95_123
	ldr	r0, [sp, #172]
	add	r1, r1, #1
	cmp	r12, r1
	add	r0, r0, r0, lsl #2
	add	r0, r7, r0, lsl #1
	sub	r0, r0, #48
	str	r0, [sp, #172]
	bne	.LBB95_117
	mov	r0, #1
	str	r5, [sp, #156]
	str	r3, [sp, #160]
	mov	r9, #1
	str	r0, [sp, #148]
	ldr	r4, [sp, #48]
	str	r6, [sp, #200]
	b	.LBB95_140
.LBB95_121:
	mov	r0, #0
	str	r0, [sp, #140]
	b	.LBB95_101
	.p2align	2
.LCPI95_39:
	.long	".Lcsbs$POC-Example$18b"
	.p2align	2
.LBB95_123:
	str	r6, [sp, #200]
	mov	r9, #1
.LBB95_124:
	cmp	r1, r2
	mov	r6, #0
	movgt	r6, #1
	cmp	r1, r12
	bge	.LBB95_134
	bhs	.LBB95_632
	ldrb	r0, [lr, r1]
	cmp	r0, #46
	bne	.LBB95_134
	add	r2, r1, #1
	cmp	r2, r12
	bge	.LBB95_133
	mov	r0, #0
	mov	r1, r2
	str	r0, [sp, #152]
.LBB95_129:
	ldrb	r7, [lr, r1]
	sub	r0, r7, #48
	cmp	r0, #9
	bhi	.LBB95_132
	ldr	r0, [sp, #152]
	add	r1, r1, #1
	cmp	r12, r1
	add	r0, r0, r0, lsl #2
	add	r0, r7, r0, lsl #1
	sub	r0, r0, #48
	str	r0, [sp, #152]
	bne	.LBB95_129
	mov	r1, r12
.LBB95_132:
	cmp	r1, r2
	mov	r0, #0
	mov	r9, #1
	movgt	r0, #1
	str	r0, [sp, #104]
	bne	.LBB95_134
.LBB95_133:
	mov	r0, #0
	mov	r1, r2
	str	r0, [sp, #152]
	mov	r0, #1
	str	r0, [sp, #104]
.LBB95_134:
	cmp	r12, r1
	str	r6, [sp, #148]
	str	r3, [sp, #160]
	str	r5, [sp, #156]
	ble	.LBB95_137
	bls	.LBB95_633
	ldrb	r0, [lr, r1]!
	cmp	r0, #32
	bne	.LBB95_138
.LBB95_137:
	ldr	r4, [sp, #48]
	b	.LBB95_140
.LBB95_138:
	cmn	r1, #1
	ble	.LBB95_640
	mov	r0, #0
	sub	r2, r12, r1
	str	r0, [sp, #484]
	mov	r1, lr
	str	r0, [sp, #480]
	add	r0, sp, #480
	bl	"utf8::decode_rune_in_bytes"
	ldr	r0, [sp, #480]
	mov	r1, #119
	cmp	r0, #115
	moveq	r1, #113
	cmp	r4, #119
	mov	r4, r1
	movne	r4, r0
.LBB95_140:
	mov	r2, #73
	ldr	r3, [sp, #140]
	ldr	r5, [sp, #212]
	orr	r2, r2, #256
	ldr	r1, [sp, #192]
	mov	r6, #0
	cmp	r3, #0
	beq	.LBB95_157
	cmp	r3, #1
	bne	.LBB95_145
	ldr	r0, .LCPI95_43
	ldr	r7, [sp, #132]
	cmp	r7, r0
	beq	.LBB95_144
	ldrb	r0, [r7]
	cmp	r0, #48
	bne	.LBB95_145
.LBB95_144:
	mov	r6, #1
	b	.LBB95_157
.LBB95_145:
	sub	r0, r4, #118
	cmp	r0, #2
	blo	.LBB95_148
	cmp	r4, #115
	cmpne	r4, #113
	bne	.LBB95_157
	add	r0, sp, #236
	mov	r1, r10
	stm	sp, {r0, r8}
	ldr	r0, [sp, #188]
	ldr	r2, [sp, #132]
	b	.LBB95_156
.LBB95_148:
	ldr	r0, [r10]
	mov	r3, #0
	str	r4, [sp, #136]
	mov	r4, #0
	ldr	r1, [r0, r1, lsl #2]
	ldr	r0, [r1, #16]
	ldr	r1, [r1, #20]
	mov	r8, r0
	mov	r9, r1
	bl	__aeabi_uldivmod
	mov	r12, #73
	ldr	r5, [sp, #212]
	orr	r12, r12, #256
	mov	r0, #0
	b	.LBB95_150
.LBB95_149:
	adds	r1, r2, #1
	adc	r3, r3, #0
	subs	r2, r1, r12
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r1
	adds	r1, r4, #1
	adc	r7, r0, #0
	subs	r6, r4, #328
	sbcs	r0, r0, #0
	mov	r4, r1
	mov	r0, r7
	bhs	.LBB95_152
.LBB95_150:
	ldr	r1, .LCPI95_37
	ldr	r1, [r1, r2, lsl #2]
	cmp	r1, #0
	beq	.LBB95_149
	ldr	r7, [r1, #16]
	ldr	r6, [r1, #20]
	eor	r7, r7, r8
	eor	r6, r6, r9
	orrs	r7, r7, r6
	bne	.LBB95_149
	b	.LBB95_153
.LBB95_152:
	ldr	r1, .LCPI95_38
.LBB95_153:
	ldr	r0, [r1, #64]
	mov	r6, #0
	ldr	r1, [r1, #68]
	mov	r9, #1
	rsbs	r2, r0, #17
	rscs	r1, r1, #0
	blo	.LBB95_182
	mov	r1, #4224
	ldr	r4, [sp, #136]
	orr	r1, r1, #212992
	tst	r1, r9, lsl r0
	ldr	r1, [sp, #208]
	beq	.LBB95_157
	add	r0, sp, #236
	stm	sp, {r0, r1}
	mov	r1, r10
	ldr	r0, [sp, #188]
	ldr	r2, [sp, #132]
	ldr	r3, [sp, #140]
.LBB95_156:
	bl	"fmt::[fmt.odin]::handle_tag.handle_optional_len-0"
	ldr	r5, [sp, #212]
.LBB95_157:
	ldr	r0, [sp, #236]
	mov	r7, #3
	str	r0, [sp, #140]
	mov	r8, #0
	cmp	r0, #0
	str	r4, [sp, #136]
	strpl	r0, [r5, #72]
	ldr	r0, [sp, #204]
	strpl	r9, [r5, #76]
	cmp	r0, #0
	strb	r6, [r5, #80]
	bne	.LBB95_161
	ldr	r0, [sp, #164]
	cmn	r0, #-2147483646
	bhi	.LBB95_161
	ldr	r4, [r5, #40]
	cmp	r4, #0
	beq	.LBB95_168
	mov	r0, #0
	ldr	r1, [r5, #44]
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI95_44
	str	r0, [sp]
	add	r0, sp, #496
	mov	lr, pc
	mov	pc, r4
	ldr	r5, [sp, #212]
	b	.LBB95_168
.LBB95_161:
	ldr	r0, [sp, #204]
	cmp	r0, #0
	beq	.LBB95_168
	ldr	r0, [r5, #20]
	cmp	r0, #1
	blt	.LBB95_168
	mov	r6, #0
	b	.LBB95_165
.LBB95_164:
	add	r6, r6, #1
	cmp	r6, r0
	bge	.LBB95_168
.LBB95_165:
	ldr	r4, [r5, #40]
	mov	r2, #9
	ldr	r1, [r5, #44]
	cmp	r4, #0
	strb	r2, [sp, #480]
	beq	.LBB95_164
	mov	r0, #0
	add	r3, sp, #480
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	mov	r8, #0
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	add	r0, sp, #496
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r5, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #84]
	add	r1, r1, r2
	str	r1, [r5, #84]
	b	.LBB95_164
	.p2align	2
.LCPI95_40:
	.long	".Lcsbs$POC-Example$18c"
	.p2align	2
.LBB95_168:
	ldr	r4, [r5, #40]
	cmp	r4, #0
	beq	.LBB95_171
	mov	r0, #0
	ldr	r1, [r5, #44]
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	mov	r8, #0
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	ldr	r0, [sp, #180]
	str	r0, [sp]
	add	r0, sp, #496
	ldr	r3, [sp, #184]
	mov	lr, pc
	mov	pc, r4
	ldr	r5, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r4, [r5, #40]
	ldr	r1, [r5, #44]
	ldr	r0, [r5, #84]
	cmp	r4, #0
	add	r0, r0, r2
	str	r0, [r5, #84]
	beq	.LBB95_171
	mov	r0, #0
	ldr	r3, .LCPI95_45
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	mov	r8, #0
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	add	r0, sp, #496
	str	r7, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r5, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r5, #84]
	add	r0, r0, r1
	str	r0, [r5, #84]
.LBB95_171:
	ldr	r0, [r10]
	ldr	r1, [sp, #192]
	ldr	r1, [r0, r1, lsl #2]
	add	r0, r1, #16
	cmp	r1, #0
	beq	.LBB95_179
	ldr	r2, [r0, #48]
	ldr	r3, [r0, #52]
.LBB95_173:
	eor	r7, r2, #1
	orrs	r7, r7, r3
	bne	.LBB95_175
	ldr	r1, [r1, #32]
	ldr	r2, [r1, #64]
	ldr	r3, [r1, #68]
	b	.LBB95_173
.LBB95_175:
	eor	r1, r2, #9
	orrs	r1, r1, r3
	bne	.LBB95_179
	ldr	r4, [r5, #40]
	add	r7, sp, #496
	ldr	r9, [sp, #52]
	cmp	r4, #0
	beq	.LBB95_178
	mov	r0, #0
	ldr	r1, [r5, #44]
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	ldr	r3, .LCPI95_46
	str	r0, [sp, #20]
	mov	r0, #5
	str	r0, [sp]
	mov	r0, r7
	mov	lr, pc
	mov	pc, r4
	ldr	r5, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r5, #84]
	add	r0, r0, r1
	str	r0, [r5, #84]
.LBB95_178:
	ldr	r8, [sp, #56]
	mov	r6, #3
	b	.LBB95_180
.LBB95_179:
	ldr	r7, [sp, #40]
	mov	r6, r11
	ldr	r9, [r5, #16]
	ldr	r10, [r5, #20]
	ldr	r1, [r7]
	str	r1, [sp, #184]
	ldr	r1, [r7, #4]
	str	r1, [sp, #180]
	ldr	r1, [sp, #72]
	str	r1, [r7, #4]
	ldr	r1, [r5]
	str	r1, [sp, #132]
	ldr	r1, [r5, #4]
	str	r1, [sp, #128]
	ldr	r1, [r5, #8]
	str	r1, [sp, #124]
	ldr	r1, [r5, #12]
	str	r1, [sp, #120]
	ldr	r1, [sp, #172]
	str	r1, [r5, #12]
	ldr	r1, [sp, #152]
	str	r1, [r5, #16]
	ldr	r1, [sp, #80]
	str	r1, [r5, #20]
	ldr	r1, [sp, #68]
	ldr	r4, [r5, #28]
	str	r1, [r5, #28]
	ldr	r1, [sp, #84]
	strb	r1, [r5, #11]
	ldr	r1, [sp, #88]
	strb	r1, [r5, #10]
	ldr	r1, [sp, #92]
	strb	r1, [r5, #9]
	ldr	r1, [sp, #96]
	strb	r1, [r5, #8]
	ldr	r1, [sp, #100]
	strb	r1, [r5, #7]
	ldr	r1, [sp, #104]
	strb	r1, [r5, #6]
	ldr	r1, [sp, #148]
	strb	r1, [r5, #5]
	ldr	r1, [sp, #156]
	strb	r1, [r5, #4]
	ldr	r1, [sp, #176]
	strb	r1, [r5, #3]
	ldr	r1, [sp, #168]
	strb	r1, [r5, #2]
	ldr	r1, [sp, #200]
	strb	r1, [r5, #1]
	ldr	r1, [sp, #160]
	ldr	r2, [sp, #188]
	ldr	r3, [sp, #44]
	str	r11, [r7]
	ldr	r11, [r5, #24]
	str	r2, [r5, #24]
	strb	r1, [r5]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	r0, [r3, #4]
	ldr	r0, [sp, #196]
	str	r1, [r3]
	ldr	r1, [sp, #192]
	ldr	r0, [r0, #8]
	ldr	r3, [sp, #208]
	str	r8, [sp, #220]
	ldr	r0, [r0, r1, lsl #2]
	add	r1, sp, #216
	add	r0, r0, r2
	ldr	r2, [sp, #136]
	str	r0, [sp, #216]
	mov	r0, r5
	bl	"fmt::fmt_arg"
	ldr	r5, [sp, #212]
	ldr	r0, [sp, #184]
	str	r0, [r7]
	add	r1, r5, #12
	ldr	r0, [sp, #180]
	str	r0, [r7, #4]
	add	r7, sp, #496
	ldr	r0, [sp, #132]
	str	r0, [r5]
	ldr	r0, [sp, #128]
	str	r0, [r5, #4]
	ldr	r0, [sp, #124]
	str	r0, [r5, #8]
	ldr	r0, [sp, #120]
	ldr	r8, [sp, #56]
	stm	r1, {r0, r9, r10}
	ldr	r10, [sp, #196]
	ldr	r9, [sp, #52]
	str	r11, [r5, #24]
	mov	r11, r6
	mov	r6, #3
	str	r4, [r5, #28]
.LBB95_180:
	ldr	r0, [sp, #204]
	ldr	r1, [sp, #192]
	cmp	r0, #0
	ldrne	r4, [r5, #40]
	cmpne	r4, #0
	beq	.LBB95_70
	mov	r0, #0
	ldr	r1, [r5, #44]
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	ldr	r3, .LCPI95_47
	str	r0, [sp, #20]
	mov	r0, #2
	str	r0, [sp]
	mov	r0, r7
	mov	lr, pc
	mov	pc, r4
	ldr	r5, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r5, #84]
	add	r0, r0, r1
	ldr	r1, [sp, #192]
	str	r0, [r5, #84]
	b	.LBB95_70
.LBB95_182:
	ldr	r4, [sp, #136]
	b	.LBB95_157
.LBB95_183:
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
	ldr	r0, [sp, #140]
.LBB95_184:
	cmp	r0, #0
	str	r0, [sp, #140]
	beq	.LBB95_602
	mov	r6, #0
	mov	r0, #1
	str	r6, [sp, #476]
	add	r1, r12, #24
	str	r6, [sp, #472]
	str	r6, [sp, #468]
	str	r6, [sp, #464]
	str	r0, [sp]
	add	r0, sp, #464
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #140]
	bl	"reflect::struct_field_value_by_name"
	add	r8, sp, #464
	ldr	r5, [sp, #476]
	add	r2, sp, #432
	str	r5, [sp, #444]
	ldm	r8, {r0, r1, r8}
	cmp	r0, #0
	stm	r2, {r0, r1, r8}
	orrsne	r0, r8, r5
	bne	.LBB95_187
	add	r0, sp, #432
	add	r1, sp, #480
	add	r4, r0, #8
	mov	r0, #0
	str	r0, [sp, #428]
	str	r0, [sp, #424]
	str	r0, [sp, #420]
	str	r0, [sp, #416]
	str	r0, [sp]
	add	r0, sp, #416
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #140]
	bl	"reflect::struct_field_value_by_name"
	add	r8, sp, #416
	ldr	r5, [sp, #428]
	str	r5, [r4, #4]
	ldm	r8, {r0, r1, r8}
	str	r1, [sp, #436]
	rsbs	r1, r0, #0
	adc	r6, r0, r1
	str	r8, [r4]
	str	r0, [sp, #432]
.LBB95_187:
	ldr	r12, [sp, #212]
	cmp	r6, #0
	ldr	lr, [sp, #136]
	bne	.LBB95_602
	orrs	r0, r8, r5
	beq	.LBB95_602
	mov	r4, #73
	mov	r0, r8
	orr	r4, r4, #256
	mov	r1, r5
	mov	r3, #0
	mov	r6, #0
	mov	r2, r4
	bl	__aeabi_uldivmod
	ldr	r12, .LCPI95_38
	mov	lr, r4
	mov	r7, #0
	b	.LBB95_191
.LBB95_190:
	adds	r0, r2, #1
	mov	r2, #0
	adc	r3, r3, #0
	subs	r1, r0, lr
	sbcs	r1, r3, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r6, #1
	adc	r1, r7, #0
	subs	r6, r6, #328
	sbcs	r7, r7, #0
	mov	r6, r0
	mov	r7, r1
	bhs	.LBB95_285
.LBB95_191:
	ldr	r0, .LCPI95_37
	ldr	r1, [r0, r2, lsl #2]
	cmp	r1, #0
	beq	.LBB95_190
	ldr	r4, [r1, #16]
	ldr	r0, [r1, #20]
	eor	r4, r4, r8
	eor	r0, r0, r5
	orrs	r0, r4, r0
	bne	.LBB95_190
	b	.LBB95_288
.LBB95_193:
	add	r0, r10, #28
.LBB95_194:
	ldr	r6, [r0]
	ldr	r0, [sp, #204]
	cmp	r0, #0
	cmpne	r6, #0
	bne	.LBB95_197
	cmp	r6, #0
	bne	.LBB95_199
	b	.LBB95_274
	.p2align	2
.LCPI95_41:
	.long	".Lcsbs$POC-Example$188"
	.p2align	2
.LBB95_197:
	ldr	r5, [r7, #40]
	mov	r0, #10
	ldr	r1, [r7, #44]
	cmp	r5, #0
	strb	r0, [sp, #480]
	beq	.LBB95_199
	mov	r0, #0
	add	r3, sp, #480
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #496
	mov	lr, pc
	mov	pc, r5
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
.LBB95_199:
	ldr	r0, [sp, #204]
	cmp	r8, #0
	movne	r8, #1
	mov	r11, #0
	cmp	r0, #0
	movne	r0, #1
	and	r9, r0, r8
	add	r0, sp, #480
	add	r0, r0, #8
	str	r0, [sp, #184]
	add	r0, sp, #464
	add	r0, r0, #8
	str	r0, [sp, #180]
	mov	r0, #0
	str	r0, [sp, #192]
	ldr	r8, [sp, #208]
	str	r6, [sp, #176]
	str	r9, [sp, #164]
	b	.LBB95_202
	.p2align	2
.LCPI95_42:
	.long	".Lcsbs$POC-Example$189"
	.p2align	2
.LBB95_201:
	ldr	r1, [sp, #192]
	add	r1, r1, #1
	str	r1, [sp, #192]
	cmp	r1, r6
	beq	.LBB95_268
.LBB95_202:
	ldr	r0, [sp, #204]
	cmp	r0, #0
	bne	.LBB95_206
	ldr	r0, [sp, #192]
	cmp	r0, #0
	beq	.LBB95_206
	ldr	r4, [r7, #40]
	cmp	r4, #0
	beq	.LBB95_214
	ldr	r1, [r7, #44]
	mov	r0, #2
	ldr	r3, .LCPI95_44
	mov	r2, #4
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	str	r11, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_214
.LBB95_206:
	ldr	r0, [sp, #204]
	cmp	r0, #0
	beq	.LBB95_214
	ldr	r1, [r7, #20]
	sub	r0, r1, #1
	str	r0, [r7, #20]
	cmp	r0, #1
	blt	.LBB95_213
	add	r4, sp, #432
	mov	r5, #0
	b	.LBB95_210
.LBB95_209:
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB95_212
.LBB95_210:
	ldr	r6, [r7, #40]
	mov	r2, #9
	ldr	r1, [r7, #44]
	cmp	r6, #0
	strb	r2, [sp, #432]
	beq	.LBB95_209
	mov	r0, #1
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	mov	r2, #4
	str	r11, [sp, #496]
	mov	r3, r4
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r7, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r0, [r7, #20]
	ldr	r1, [r7, #84]
	add	r1, r1, r2
	str	r1, [r7, #84]
	b	.LBB95_209
.LBB95_212:
	ldr	r6, [sp, #176]
	add	r1, r0, #1
.LBB95_213:
	str	r1, [r7, #20]
.LBB95_214:
	ldr	r4, [r7, #40]
	cmp	r4, #0
	beq	.LBB95_217
	ldr	r1, [r7, #44]
	mov	r2, #4
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	str	r11, [sp, #496]
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	ldr	r0, [sp, #168]
	str	r0, [sp]
	add	r0, sp, #496
	ldr	r3, [sp, #172]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r0, [r7, #84]
	ldr	r5, [r7, #40]
	ldr	r1, [r7, #44]
	add	r0, r0, r2
	str	r0, [r7, #84]
	mov	r0, #123
	cmp	r5, #0
	strb	r0, [sp, #432]
	beq	.LBB95_217
	mov	r0, #1
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	add	r3, sp, #432
	str	r11, [sp, #496]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
.LBB95_217:
	cmp	r9, #0
	beq	.LBB95_220
	ldr	r4, [r7, #40]
	mov	r0, #10
	ldr	r1, [r7, #44]
	cmp	r4, #0
	strb	r0, [sp, #432]
	beq	.LBB95_220
	mov	r0, #1
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	add	r3, sp, #432
	str	r11, [sp, #496]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
.LBB95_220:
	ldr	r0, [r7, #68]
	add	r1, r0, #1
	str	r1, [r7, #68]
	ldr	r1, [sp, #200]
	cmp	r1, #1
	blt	.LBB95_255
	mov	r5, #0
	mvn	r9, #0
	b	.LBB95_226
.LBB95_222:
	add	r1, r6, #16
	ldr	r3, [sp, #180]
	str	r11, [sp, #468]
	ldr	r2, [r1]
	ldr	r1, [r1, #4]
	str	r1, [r3, #4]
	ldr	r1, [r10, #8]
	str	r2, [r3]
	ldr	r2, [sp, #188]
	ldr	r1, [r1, r5, lsl #2]
	ldr	r3, [sp, #192]
	ldr	r1, [r1, r2]
	mla	r2, r0, r3, r1
	add	r1, sp, #464
	mov	r0, r7
	str	r2, [sp, #464]
.LBB95_223:
	mov	r2, #118
	mov	r3, r8
	bl	"fmt::fmt_arg"
	ldr	r7, [sp, #212]
.LBB95_224:
	ldr	r0, [sp, #204]
	cmp	r0, #0
	ldrne	r4, [r7, #40]
	cmpne	r4, #0
	bne	.LBB95_253
.LBB95_225:
	ldr	r0, [sp, #200]
	add	r5, r5, #1
	add	r9, r9, #1
	cmp	r5, r0
	beq	.LBB95_254
.LBB95_226:
	ldr	r0, [r10, #4]
	ldr	r10, [r0, r5, lsl #3]!
	ldr	r6, [r0, #4]
	ldr	r0, [sp, #204]
	cmp	r0, #0
	beq	.LBB95_232
	ldr	r0, [r7, #20]
	cmp	r0, #1
	blt	.LBB95_235
	mov	r8, #0
	b	.LBB95_230
.LBB95_229:
	add	r8, r8, #1
	cmp	r8, r0
	bge	.LBB95_235
.LBB95_230:
	ldr	r4, [r7, #40]
	mov	r2, #9
	ldr	r1, [r7, #44]
	cmp	r4, #0
	strb	r2, [sp, #432]
	beq	.LBB95_229
	str	r11, [sp, #504]
	add	r3, sp, #432
	str	r11, [sp, #500]
	mov	r2, #4
	str	r11, [sp, #496]
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #496
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r0, [r7, #20]
	ldr	r1, [r7, #84]
	add	r1, r1, r2
	str	r1, [r7, #84]
	b	.LBB95_229
.LBB95_232:
	cmn	r9, #-2147483646
	bhi	.LBB95_235
	ldr	r4, [r7, #40]
	cmp	r4, #0
	beq	.LBB95_235
	ldr	r1, [r7, #44]
	mov	r2, #4
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	str	r11, [sp, #496]
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI95_44
	str	r0, [sp]
	add	r0, sp, #496
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
.LBB95_235:
	ldr	r4, [r7, #40]
	cmp	r4, #0
	beq	.LBB95_238
	ldr	r1, [r7, #44]
	add	r0, sp, #496
	str	r11, [sp, #504]
	mov	r2, #4
	str	r11, [sp, #500]
	mov	r3, r10
	str	r11, [sp, #496]
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	ldr	r8, [sp, #208]
	str	r8, [sp, #20]
	str	r6, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r6, [r7, #40]
	ldr	r1, [r7, #44]
	ldr	r0, [r7, #84]
	cmp	r6, #0
	add	r0, r0, r2
	str	r0, [r7, #84]
	beq	.LBB95_239
	mov	r0, #3
	ldr	r3, .LCPI95_45
	str	r11, [sp, #504]
	mov	r2, #4
	str	r11, [sp, #500]
	str	r11, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_239
.LBB95_238:
	ldr	r8, [sp, #208]
.LBB95_239:
	ldr	r10, [sp, #196]
	ldr	r0, [r10]
	ldrb	r3, [r10, #25]
	ldr	r0, [r0, r5, lsl #2]
	cmp	r3, #1
	ldr	r2, [r0, #64]
	ldr	r1, [r0, #68]
	bne	.LBB95_246
	eor	r2, r2, #14
	orrs	r1, r2, r1
	bne	.LBB95_620
	ldr	r6, [r0, #24]
	ldr	r2, [r6, #64]
	ldr	r0, [r6]
	ldr	r3, [r6, #68]
	eor	r1, r2, #1
	orrs	r1, r1, r3
	bne	.LBB95_244
	mov	r1, r6
.LBB95_243:
	ldr	r1, [r1, #32]
	ldr	r2, [r1, #64]
	ldr	r3, [r1, #68]
	eor	r4, r2, #1
	orrs	r4, r4, r3
	beq	.LBB95_243
.LBB95_244:
	eor	r1, r2, #9
	orrs	r1, r1, r3
	beq	.LBB95_251
	add	r1, r6, #16
	ldr	r3, [sp, #184]
	ldr	r2, [r1]
	ldr	r1, [r1, #4]
	str	r2, [r3]
	str	r1, [r3, #4]
	ldr	r3, [sp, #192]
	ldr	r2, [sp, #188]
	str	r11, [sp, #484]
	mla	r1, r0, r3, r2
	ldr	r0, [r10, #8]
	ldr	r0, [r0, r5, lsl #2]
	add	r0, r1, r0
	str	r0, [sp, #480]
	mov	r0, r7
	add	r1, sp, #480
	b	.LBB95_223
.LBB95_246:
	eor	r2, r2, #12
	orrs	r1, r2, r1
	bne	.LBB95_621
	ldr	r6, [r0, #24]
	ldr	r2, [r6, #64]
	ldr	r0, [r6]
	ldr	r3, [r6, #68]
	eor	r1, r2, #1
	orrs	r1, r1, r3
	bne	.LBB95_250
	mov	r1, r6
.LBB95_249:
	ldr	r1, [r1, #32]
	ldr	r2, [r1, #64]
	ldr	r3, [r1, #68]
	eor	r4, r2, #1
	orrs	r4, r4, r3
	beq	.LBB95_249
.LBB95_250:
	eor	r1, r2, #9
	orrs	r1, r1, r3
	bne	.LBB95_222
.LBB95_251:
	ldr	r4, [r7, #40]
	cmp	r4, #0
	beq	.LBB95_224
	ldr	r1, [r7, #44]
	mov	r0, #5
	ldr	r3, .LCPI95_46
	mov	r2, #4
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	str	r11, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_224
.LBB95_253:
	ldr	r1, [r7, #44]
	mov	r0, #2
	ldr	r3, .LCPI95_47
	mov	r2, #4
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	str	r11, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_225
.LBB95_254:
	ldr	r0, [r7, #68]
	ldr	r6, [sp, #176]
	ldr	r9, [sp, #164]
	sub	r0, r0, #1
.LBB95_255:
	cmp	r9, #0
	str	r0, [r7, #68]
	beq	.LBB95_264
	ldr	r1, [r7, #20]
	sub	r0, r1, #1
	str	r0, [r7, #20]
	cmp	r0, #1
	blt	.LBB95_263
	mov	r5, #0
	b	.LBB95_259
.LBB95_258:
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB95_262
.LBB95_259:
	ldr	r4, [r7, #40]
	mov	r2, #9
	ldr	r1, [r7, #44]
	cmp	r4, #0
	strb	r2, [sp, #432]
	beq	.LBB95_258
	mov	r0, #1
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	add	r3, sp, #432
	str	r11, [sp, #496]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r0, [r7, #20]
	ldr	r1, [r7, #84]
	add	r1, r1, r2
	str	r1, [r7, #84]
	b	.LBB95_258
	.p2align	2
.LCPI95_43:
	.long	".Lcsbs$POC-Example$ea"
	.p2align	2
.LBB95_262:
	add	r1, r0, #1
.LBB95_263:
	str	r1, [r7, #20]
.LBB95_264:
	ldr	r4, [r7, #40]
	mov	r0, #125
	ldr	r1, [r7, #44]
	cmp	r4, #0
	strb	r0, [sp, #432]
	beq	.LBB95_266
	mov	r0, #1
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	add	r3, sp, #432
	str	r11, [sp, #496]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
.LBB95_266:
	ldr	r0, [sp, #204]
	cmp	r0, #0
	ldrne	r4, [r7, #40]
	cmpne	r4, #0
	beq	.LBB95_201
	ldr	r1, [r7, #44]
	mov	r0, #2
	ldr	r3, .LCPI95_47
	mov	r2, #4
	str	r11, [sp, #504]
	str	r11, [sp, #500]
	str	r11, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_201
.LBB95_268:
	ldr	r0, [sp, #204]
	cmp	r0, #0
	beq	.LBB95_274
	ldr	r0, [sp, #76]
	cmp	r0, #1
	blt	.LBB95_274
	ldr	r5, [sp, #76]
	add	r9, sp, #432
	add	r10, sp, #496
	mov	r8, #1
	mov	r11, #9
	mov	r6, #0
	b	.LBB95_272
.LBB95_271:
	subs	r5, r5, #1
	beq	.LBB95_274
.LBB95_272:
	ldr	r4, [r7, #40]
	ldr	r1, [r7, #44]
	cmp	r4, #0
	strb	r11, [sp, #432]
	beq	.LBB95_271
	str	r6, [sp, #504]
	mov	r2, #4
	str	r6, [sp, #500]
	mov	r3, r9
	str	r6, [sp, #496]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, r10
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r7, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r7, #84]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_271
.LBB95_274:
	ldr	r0, [r7, #20]
	sub	r0, r0, #1
	str	r0, [r7, #20]
.LBB95_275:
	ldr	r7, [sp, #76]
	mov	r0, #0
	ldr	r1, [sp, #60]
	mov	r5, #0
	cmp	r7, #0
	ldr	r2, [sp, #212]
	movgt	r0, #1
	and	r0, r1, r0
	cmp	r0, #1
	bne	.LBB95_281
	add	r9, sp, #480
	add	r10, sp, #496
	mov	r8, #1
	mov	r6, #9
	b	.LBB95_279
	.p2align	2
.LCPI95_44:
	.long	".Lcsbs$POC-Example$130"
	.p2align	2
.LBB95_278:
	subs	r7, r7, #1
	beq	.LBB95_281
.LBB95_279:
	ldr	r4, [r2, #40]
	ldr	r1, [r2, #44]
	cmp	r4, #0
	strb	r6, [sp, #480]
	beq	.LBB95_278
	str	r5, [sp, #504]
	mov	r2, #4
	str	r5, [sp, #500]
	mov	r3, r9
	str	r5, [sp, #496]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, r10
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r2, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r2, #84]
	add	r0, r0, r1
	str	r0, [r2, #84]
	b	.LBB95_278
.LBB95_281:
	ldr	r1, [sp, #64]
	mov	r0, #93
	ldr	r5, [r2, #40]
	cmp	r1, #0
	ldr	r1, [r2, #44]
	movne	r0, #125
	cmp	r5, #0
	strb	r0, [sp, #480]
	beq	.LBB95_283
	mov	r0, #0
	add	r3, sp, #480
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #208]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #496
	mov	lr, pc
	mov	pc, r5
	ldr	r2, [sp, #212]
	ldr	r1, [sp, #496]
	ldr	r0, [r2, #84]
	add	r0, r0, r1
	str	r0, [r2, #84]
.LBB95_283:
	ldr	r0, [sp, #204]
	strb	r0, [r2, #4]
	ldr	r0, [r2, #20]
	ldr	r1, [r2, #68]
	sub	r0, r0, #1
	str	r0, [r2, #20]
	sub	r0, r1, #1
	str	r0, [r2, #68]
.LBB95_284:
	add	sp, sp, #516
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB95_285:
	mov	r1, r12
	b	.LBB95_288
	.p2align	2
.LCPI95_45:
	.long	".Lcsbs$POC-Example$18f"
	.p2align	2
.LBB95_287:
	ldr	r1, [r1, #32]
.LBB95_288:
	ldr	r0, [r1, #64]
	ldr	r7, [r1, #68]
	eor	r3, r0, #1
	orrs	r3, r3, r7
	beq	.LBB95_287
	ldr	r2, [sp, #208]
	eor	r1, r0, #2
	orrs	r1, r1, r7
	beq	.LBB95_482
	eor	r1, r0, #8
	orrs	r1, r1, r7
	beq	.LBB95_383
	ldr	r12, [sp, #212]
	eor	r0, r0, #21
	ldr	lr, [sp, #136]
	orrs	r0, r0, r7
	bne	.LBB95_602
	mov	r0, #0
	ldr	r2, [sp, #208]
	str	r0, [sp, #412]
	add	r1, sp, #432
	str	r0, [sp, #408]
	add	r0, sp, #408
	bl	"reflect::enum_string"
	ldr	r0, [r10, #20]
	str	r0, [sp, #92]
	cmp	r0, #0
	bmi	.LBB95_644
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
	beq	.LBB95_602
	ldr	r0, [r10, #16]
	mov	r1, #0
	str	r0, [sp, #100]
	ldr	r0, [sp, #408]
	str	r0, [sp, #120]
	ldr	r0, [sp, #412]
	str	r0, [sp, #108]
	bic	r0, r0, #15
	str	r0, [sp, #104]
	sub	r0, r0, #1
	bic	r0, r0, #15
	add	r0, r0, #16
	str	r0, [sp, #84]
	ldr	r0, [sp, #140]
	bic	r0, r0, #15
	str	r0, [sp, #132]
	sub	r0, r0, #1
	bic	r0, r0, #15
	add	r0, r0, #16
	str	r0, [sp, #88]
	b	.LBB95_296
.LBB95_295:
	ldr	r1, [sp, #96]
	ldr	r0, [sp, #92]
	ldr	r12, [sp, #212]
	add	r1, r1, #1
	ldr	lr, [sp, #136]
	cmp	r1, r0
	beq	.LBB95_602
.LBB95_296:
	mov	r0, #0
	ldr	r3, .LCPI95_48
	str	r0, [sp, #396]
	str	r0, [sp, #400]
	strb	r0, [sp, #404]
	ldr	r0, [sp, #100]
	str	r1, [sp, #96]
	ldr	r1, [r0, r1, lsl #3]!
	ldr	r2, [r0, #4]
	mov	r0, #13
	str	r0, [sp]
	add	r0, sp, #396
	bl	"reflect::struct_tag_lookup"
	ldrb	r0, [sp, #404]
	tst	r0, #1
	beq	.LBB95_295
	ldr	r0, [sp, #396]
	ldr	r1, [sp, #400]
	str	r0, [sp, #388]
	mov	r0, #0
	str	r1, [sp, #392]
	str	r0, [sp, #376]
	str	r0, [sp, #380]
	strb	r0, [sp, #384]
	b	.LBB95_300
	.p2align	2
.LCPI95_46:
	.long	".Lcsbs$POC-Example$190"
	.p2align	2
.LBB95_299:
	mov	r0, #0
	strb	r0, [sp, #384]
	str	r0, [sp, #380]
	str	r0, [sp, #376]
.LBB95_300:
	add	r0, sp, #376
	add	r1, sp, #388
	bl	"strings::split_iterator"
	ldrb	r0, [sp, #384]
	tst	r0, #1
	beq	.LBB95_295
	ldr	r2, [sp, #380]
	ldr	r0, [sp, #376]
	cmp	r2, #15
	str	r0, [sp, #204]
	str	r2, [sp, #128]
	bgt	.LBB95_307
	cmp	r2, #1
	blt	.LBB95_322
	ldr	r4, [sp, #212]
	mov	r8, #0
	ldr	r0, [sp, #140]
.LBB95_304:
	ldr	r1, [sp, #204]
	ldrb	r1, [r1, r8]
	cmp	r1, #61
	beq	.LBB95_316
	add	r8, r8, #1
	cmp	r2, r8
	bne	.LBB95_304
	b	.LBB95_321
	.p2align	2
.LCPI95_47:
	.long	".Lcsbs$POC-Example$187"
	.p2align	2
.LBB95_307:
	mov	r0, #1
	add	r2, r0, r2, lsr #4
	mov	r8, #0
.LBB95_308:
	ldr	r9, [sp, #204]
	ldrb	r0, [r9, r8]!
	str	r0, [sp, #200]
	ldrb	r0, [r9, #15]
	str	r0, [sp, #184]
	sub	r1, r0, #61
	ldrb	r0, [r9, #14]
	rsbs	r3, r1, #0
	str	r0, [sp, #168]
	adc	r1, r1, r3
	sub	r3, r0, #61
	rsbs	r7, r3, #0
	ldrb	r0, [r9, #13]
	adc	r3, r3, r7
	ldrb	r11, [r9, #12]
	orr	r1, r3, r1, lsl #1
	sub	r3, r0, #61
	rsbs	r7, r3, #0
	str	r0, [sp, #176]
	adc	r3, r3, r7
	sub	r7, r11, #61
	rsbs	r6, r7, #0
	ldrb	r0, [r9, #11]
	adc	r7, r7, r6
	str	r0, [sp, #180]
	orr	r3, r7, r3, lsl #1
	ldrb	r10, [r9, #8]
	orr	r1, r3, r1, lsl #2
	sub	r3, r0, #61
	ldrb	r0, [r9, #10]
	rsbs	r7, r3, #0
	adc	r3, r3, r7
	str	r0, [sp, #152]
	sub	r7, r0, #61
	ldrb	r0, [r9, #9]
	rsbs	r6, r7, #0
	str	r0, [sp, #164]
	adc	r7, r7, r6
	ldrb	lr, [r9, #6]
	orr	r3, r7, r3, lsl #1
	sub	r7, r0, #61
	rsbs	r6, r7, #0
	ldrb	r12, [r9, #1]
	adc	r7, r7, r6
	sub	r6, r10, #61
	rsbs	r4, r6, #0
	adc	r6, r6, r4
	orr	r7, r6, r7, lsl #1
	ldrb	r6, [r9, #2]
	orr	r3, r7, r3, lsl #2
	orr	r0, r3, r1, lsl #4
	str	r0, [sp, #192]
	ldrb	r0, [r9, #7]
	str	r0, [sp, #172]
	sub	r1, r0, #61
	ldrb	r0, [r9, #5]
	rsbs	r3, r1, #0
	str	r0, [sp, #160]
	adc	r1, r1, r3
	sub	r3, lr, #61
	rsbs	r7, r3, #0
	adc	r3, r3, r7
	orr	r4, r3, r1, lsl #1
	sub	r1, r0, #61
	rsbs	r3, r1, #0
	ldrb	r0, [r9, #3]
	adc	r3, r1, r3
	ldrb	r1, [r9, #4]
	str	r0, [sp, #156]
	sub	r7, r1, #61
	rsbs	r5, r7, #0
	adc	r5, r7, r5
	orr	r3, r5, r3, lsl #1
	orr	r3, r3, r4, lsl #2
	sub	r4, r0, #61
	rsbs	r5, r4, #0
	ldr	r0, [sp, #200]
	adc	r4, r4, r5
	sub	r5, r6, #61
	rsbs	r7, r5, #0
	adc	r5, r5, r7
	mov	r9, r0
	orr	r4, r5, r4, lsl #1
	sub	r5, r0, #61
	rsbs	r7, r5, #0
	adc	r5, r5, r7
	sub	r7, r12, #61
	rsbs	r0, r7, #0
	adc	r0, r7, r0
	orr	r0, r5, r0, lsl #1
	orr	r0, r0, r4, lsl #2
	orr	r0, r0, r3, lsl #4
	ldr	r3, [sp, #192]
	and	r0, r0, #255
	orr	r0, r0, r3, lsl #8
	mov	r3, #255
	orr	r3, r3, #65280
	tst	r0, r3
	bne	.LBB95_314
	sub	r2, r2, #1
	add	r8, r8, #16
	cmp	r2, #1
	bgt	.LBB95_308
	ldr	r2, [sp, #128]
	ldr	r4, [sp, #212]
	cmp	r8, r2
	bge	.LBB95_313
.LBB95_311:
	ldr	r0, [sp, #204]
	ldrb	r0, [r0, r8]
	cmp	r0, #61
	beq	.LBB95_315
	add	r8, r8, #1
	cmp	r2, r8
	bne	.LBB95_311
.LBB95_313:
	mov	r0, #0
	mov	r10, #0
	str	r0, [sp, #184]
	mov	r8, r2
	str	r0, [sp, #180]
	mov	lr, #0
	str	r0, [sp, #176]
	b	.LBB95_323
.LBB95_314:
	subs	r0, r9, #61
	mvn	r2, #0
	mvnne	r0, #0
	cmp	r10, #61
	moveq	r2, #8
	cmp	r0, r2
	movlo	r2, r0
	cmp	r1, #61
	mvn	r0, #0
	mvn	r1, #0
	moveq	r0, #4
	cmp	r11, #61
	moveq	r1, #12
	cmp	r0, r1
	movlo	r1, r0
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #152]
	cmp	r6, #61
	mvn	r0, #0
	moveq	r0, #2
	cmp	r2, #61
	mvn	r3, #0
	ldr	r2, [sp, #168]
	moveq	r3, #10
	cmp	r0, r3
	movlo	r3, r0
	cmp	lr, #61
	mvn	r0, #0
	ldr	r7, [sp, #184]
	moveq	r0, #6
	cmp	r2, #61
	mvn	r2, #0
	ldr	r4, [sp, #212]
	moveq	r2, #14
	cmp	r0, r2
	movlo	r2, r0
	cmp	r3, r2
	movlo	r2, r3
	cmp	r1, r2
	movlo	r2, r1
	ldr	r1, [sp, #164]
	cmp	r12, #61
	mvn	r0, #0
	moveq	r0, #1
	cmp	r1, #61
	mvn	r3, #0
	ldr	r1, [sp, #176]
	moveq	r3, #9
	cmp	r0, r3
	movlo	r3, r0
	ldr	r0, [sp, #160]
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #5
	cmp	r1, #61
	mvn	r1, #0
	moveq	r1, #13
	cmp	r0, r1
	movlo	r1, r0
	cmp	r3, r1
	ldr	r0, [sp, #156]
	movlo	r1, r3
	ldr	r3, [sp, #180]
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #3
	cmp	r3, #61
	mvn	r3, #0
	moveq	r3, #11
	cmp	r0, r3
	movlo	r3, r0
	ldr	r0, [sp, #172]
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #7
	cmp	r7, #61
	mvn	r7, #0
	moveq	r7, #15
	cmp	r0, r7
	movlo	r7, r0
	cmp	r3, r7
	movlo	r7, r3
	cmp	r1, r7
	movlo	r7, r1
	cmp	r2, r7
	movlo	r7, r2
	and	r0, r7, #255
	ldr	r2, [sp, #128]
	add	r8, r0, r8
.LBB95_315:
	ldr	r0, [sp, #140]
	cmn	r8, #1
	beq	.LBB95_321
.LBB95_316:
	cmp	r8, #0
	bmi	.LBB95_634
	cmp	r8, r2
	bgt	.LBB95_634
	add	r1, r8, #1
	cmn	r8, #-2147483647
	beq	.LBB95_637
	cmp	r2, r1
	blt	.LBB95_637
	sub	r2, r2, r1
	str	r2, [sp, #176]
	ldr	r2, [sp, #204]
	mov	lr, #1
	add	r1, r2, r1
	add	r10, r2, r8
	str	r1, [sp, #180]
	mov	r1, #1
	str	r1, [sp, #184]
	b	.LBB95_324
.LBB95_321:
	mov	r1, #0
	mov	r10, #0
	str	r1, [sp, #184]
	mov	r8, r2
	str	r1, [sp, #180]
	mov	lr, #0
	str	r1, [sp, #176]
	b	.LBB95_324
.LBB95_322:
	mov	r0, #0
	mov	r10, #0
	str	r0, [sp, #184]
	mov	r8, r2
	str	r0, [sp, #180]
	mov	lr, #0
	str	r0, [sp, #176]
	ldr	r4, [sp, #212]
.LBB95_323:
	ldr	r0, [sp, #140]
.LBB95_324:
	ldr	r12, [sp, #208]
	cmp	r8, r0
	ldr	r6, [sp, #188]
	bne	.LBB95_299
	ldr	r0, [sp, #148]
	ldr	r1, [sp, #204]
	cmp	r1, r0
	beq	.LBB95_340
	ldr	r1, [sp, #140]
	mov	r0, #0
	cmp	r1, #8
	blo	.LBB95_336
	ldr	r0, [sp, #132]
	cmp	r0, #0
	beq	.LBB95_332
	mov	r0, #0
.LBB95_329:
	ldr	r2, [sp, #148]
	ldrb	r1, [r2, r0]!
	str	r1, [sp, #200]
	ldr	r6, [sp, #204]
	ldrb	r1, [r2, #15]
	ldrb	r8, [r2, #1]
	ldrb	r3, [r6, r0]!
	str	r3, [sp, #192]
	ldrb	r4, [r6, #15]
	ldrb	r3, [r6, #14]
	subs	r1, r4, r1
	ldrb	r4, [r2, #14]
	movne	r1, #1
	ldrb	r5, [r6, #12]
	subs	r3, r3, r4
	ldrb	r4, [r6, #13]
	movne	r3, #1
	orr	r1, r3, r1, lsl #1
	ldrb	r3, [r2, #13]
	ldrb	r7, [r6, #8]
	subs	r3, r4, r3
	ldrb	r4, [r2, #12]
	movne	r3, #1
	ldrb	r9, [r6, #2]
	subs	r4, r5, r4
	ldrb	r5, [r6, #10]
	movne	r4, #1
	orr	r3, r4, r3, lsl #1
	orr	r1, r3, r1, lsl #2
	ldrb	r3, [r2, #11]
	ldrb	r4, [r6, #11]
	subs	r3, r4, r3
	ldrb	r4, [r2, #10]
	movne	r3, #1
	subs	r4, r5, r4
	ldrb	r5, [r6, #9]
	movne	r4, #1
	orr	r3, r4, r3, lsl #1
	ldrb	r4, [r2, #9]
	subs	r4, r5, r4
	ldrb	r5, [r2, #8]
	movne	r4, #1
	subs	r5, r7, r5
	ldrb	r7, [r2, #2]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	orr	r3, r4, r3, lsl #2
	ldrb	r4, [r6, #7]
	orr	r11, r3, r1, lsl #4
	ldrb	r3, [r2, #7]
	ldrb	r5, [r6, #6]
	subs	r3, r4, r3
	ldrb	r4, [r2, #6]
	movne	r3, #1
	ldrb	r1, [r2, #3]
	subs	r4, r5, r4
	ldrb	r5, [r6, #5]
	movne	r4, #1
	orr	r12, r4, r3, lsl #1
	ldrb	r4, [r2, #5]
	mov	r3, lr
	ldrb	r2, [r2, #4]
	subs	r4, r5, r4
	ldrb	r5, [r6, #1]
	ldrb	lr, [r6, #3]
	movne	r4, #1
	ldrb	r6, [r6, #4]
	subs	r2, r6, r2
	ldr	r6, [sp, #188]
	movne	r2, #1
	subs	r1, lr, r1
	mov	lr, r3
	movne	r1, #1
	subs	r3, r9, r7
	ldr	r7, [sp, #192]
	movne	r3, #1
	orr	r1, r3, r1, lsl #1
	ldr	r3, [sp, #200]
	orr	r2, r2, r4, lsl #1
	orr	r2, r2, r12, lsl #2
	ldr	r4, [sp, #212]
	subs	r3, r7, r3
	ldr	r12, [sp, #208]
	movne	r3, #1
	subs	r7, r5, r8
	movne	r7, #1
	orr	r3, r3, r7, lsl #1
	orr	r1, r3, r1, lsl #2
	orr	r1, r1, r2, lsl #4
	mov	r2, #255
	and	r1, r1, #255
	orr	r2, r2, #65280
	orr	r1, r1, r11, lsl #8
	tst	r1, r2
	bne	.LBB95_299
	ldr	r1, [sp, #132]
	add	r0, r0, #16
	cmp	r0, r1
	blo	.LBB95_329
	ldr	r0, [sp, #88]
	b	.LBB95_333
.LBB95_332:
	mov	r0, #0
.LBB95_333:
	ldr	r1, [sp, #140]
	sub	r1, r1, r0
	bic	r1, r1, #3
	cmp	r0, r1
	bhs	.LBB95_336
.LBB95_334:
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #204]
	ldr	r2, [r2, r0]
	ldr	r3, [r3, r0]
	cmp	r3, r2
	bne	.LBB95_299
	add	r0, r0, #4
	cmp	r0, r1
	blo	.LBB95_334
.LBB95_336:
	ldr	r1, [sp, #140]
	cmp	r1, r0
	bls	.LBB95_340
	ldr	r1, [sp, #204]
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #140]
	add	r1, r1, r0
	add	r2, r2, r0
	sub	r0, r3, r0
.LBB95_338:
	ldrb	r3, [r1], #1
	ldrb	r7, [r2], #1
	cmp	r3, r7
	bne	.LBB95_299
	subs	r0, r0, #1
	bne	.LBB95_338
.LBB95_340:
	ldr	r0, [sp, #184]
	cmp	r0, #0
	beq	.LBB95_299
	ldr	r0, .LCPI95_49
	cmp	r10, r0
	beq	.LBB95_344
.LBB95_342:
	ldrb	r1, [r10], #1
	ldrb	r2, [r0], #1
	cmp	r1, r2
	bne	.LBB95_299
	subs	lr, lr, #1
	bne	.LBB95_342
.LBB95_344:
	ldr	r3, [sp, #128]
	cmp	r3, #15
	bgt	.LBB95_349
	cmp	r3, #1
	blt	.LBB95_362
	mov	r10, #0
.LBB95_347:
	ldr	r1, [sp, #204]
	ldrb	r1, [r1, r10]
	cmp	r1, #46
	beq	.LBB95_357
	add	r10, r10, #1
	cmp	r3, r10
	bne	.LBB95_347
	b	.LBB95_362
.LBB95_349:
	mov	r0, #1
	add	r9, r0, r3, lsr #4
	mov	r10, #0
.LBB95_350:
	ldr	r5, [sp, #204]
	ldrb	lr, [r5, r10]!
	ldrb	r1, [r5, #15]
	str	r1, [sp, #192]
	sub	r1, r1, #46
	ldrb	r12, [r5, #12]
	rsbs	r2, r1, #0
	ldrb	r0, [r5, #10]
	adc	r1, r1, r2
	ldrb	r2, [r5, #14]
	str	r2, [sp, #164]
	sub	r2, r2, #46
	ldrb	r11, [r5, #6]
	rsbs	r3, r2, #0
	ldrb	r8, [r5, #1]
	adc	r2, r2, r3
	orr	r1, r2, r1, lsl #1
	ldrb	r2, [r5, #13]
	str	r2, [sp, #172]
	sub	r2, r2, #46
	rsbs	r3, r2, #0
	adc	r2, r2, r3
	sub	r3, r12, #46
	rsbs	r6, r3, #0
	adc	r3, r3, r6
	orr	r2, r3, r2, lsl #1
	sub	r3, r0, #46
	orr	r6, r2, r1, lsl #2
	ldrb	r1, [r5, #11]
	str	r1, [sp, #184]
	sub	r1, r1, #46
	str	r0, [sp, #124]
	rsbs	r2, r1, #0
	adc	r1, r1, r2
	rsbs	r4, r3, #0
	adc	r3, r3, r4
	orr	r4, r3, r1, lsl #1
	ldrb	r1, [r5, #9]
	str	r1, [sp, #160]
	sub	r3, r1, #46
	rsbs	r1, r3, #0
	adc	r1, r3, r1
	ldrb	r3, [r5, #8]
	sub	r2, r3, #46
	rsbs	r7, r2, #0
	adc	r2, r2, r7
	orr	r1, r2, r1, lsl #1
	orr	r1, r1, r4, lsl #2
	orr	r0, r1, r6, lsl #4
	ldrb	r1, [r5, #7]
	str	r0, [sp, #200]
	str	r1, [sp, #168]
	sub	r1, r1, #46
	rsbs	r2, r1, #0
	ldrb	r0, [r5, #5]
	adc	r1, r1, r2
	sub	r2, r11, #46
	rsbs	r4, r2, #0
	str	r0, [sp, #152]
	adc	r2, r2, r4
	sub	r4, r0, #46
	rsbs	r6, r4, #0
	ldrb	r0, [r5, #3]
	adc	r7, r4, r6
	ldrb	r6, [r5, #2]
	ldrb	r5, [r5, #4]
	orr	r2, r2, r1, lsl #1
	str	r0, [sp, #156]
	sub	r4, r5, #46
	rsbs	r1, r4, #0
	adc	r1, r4, r1
	orr	r1, r1, r7, lsl #1
	orr	r1, r1, r2, lsl #2
	sub	r2, r0, #46
	rsbs	r4, r2, #0
	mov	r0, lr
	adc	r2, r2, r4
	sub	r4, r6, #46
	rsbs	r7, r4, #0
	adc	r4, r4, r7
	orr	r2, r4, r2, lsl #1
	sub	r4, lr, #46
	rsbs	r7, r4, #0
	adc	r4, r4, r7
	sub	r7, r8, #46
	rsbs	lr, r7, #0
	adc	r7, r7, lr
	orr	r7, r4, r7, lsl #1
	orr	r2, r7, r2, lsl #2
	orr	r1, r2, r1, lsl #4
	ldr	r2, [sp, #200]
	and	r1, r1, #255
	orr	r1, r1, r2, lsl #8
	mov	r2, #255
	orr	r2, r2, #65280
	tst	r1, r2
	bne	.LBB95_355
	sub	r9, r9, #1
	add	r10, r10, #16
	cmp	r9, #1
	bgt	.LBB95_350
	ldr	r3, [sp, #128]
	mov	lr, #0
	ldr	r4, [sp, #212]
	mov	r1, #0
	ldr	r12, [sp, #208]
	cmp	r10, r3
	ldr	r6, [sp, #188]
	bge	.LBB95_363
.LBB95_353:
	ldr	r1, [sp, #204]
	ldrb	r1, [r1, r10]
	cmp	r1, #46
	beq	.LBB95_356
	add	r10, r10, #1
	cmp	r3, r10
	bne	.LBB95_353
	b	.LBB95_362
.LBB95_355:
	subs	r1, r0, #46
	mvn	r2, #0
	mvnne	r1, #0
	cmp	r3, #46
	moveq	r2, #8
	cmp	r1, r2
	movlo	r2, r1
	cmp	r5, #46
	mvn	r1, #0
	mvn	r3, #0
	moveq	r1, #4
	cmp	r12, #46
	moveq	r3, #12
	cmp	r1, r3
	movlo	r3, r1
	cmp	r2, r3
	ldr	r0, [sp, #124]
	movlo	r3, r2
	cmp	r6, #46
	mvn	r1, #0
	moveq	r1, #2
	cmp	r0, #46
	mvn	r7, #0
	ldr	r2, [sp, #164]
	moveq	r7, #10
	cmp	r1, r7
	movlo	r7, r1
	cmp	r11, #46
	mvn	r1, #0
	ldr	r0, [sp, #152]
	moveq	r1, #6
	cmp	r2, #46
	mvn	r2, #0
	ldr	r6, [sp, #192]
	moveq	r2, #14
	cmp	r1, r2
	movlo	r2, r1
	cmp	r7, r2
	movlo	r2, r7
	cmp	r3, r2
	movlo	r2, r3
	ldr	r3, [sp, #160]
	cmp	r8, #46
	mvn	r1, #0
	moveq	r1, #1
	cmp	r3, #46
	mvn	r3, #0
	mvn	r7, #0
	moveq	r3, #9
	cmp	r1, r3
	movlo	r3, r1
	ldr	r1, [sp, #172]
	cmp	r0, #46
	ldr	r4, [sp, #212]
	moveq	r7, #5
	cmp	r1, #46
	mvn	r1, #0
	ldr	r12, [sp, #208]
	moveq	r1, #13
	cmp	r7, r1
	movlo	r1, r7
	cmp	r3, r1
	movlo	r1, r3
	ldr	r3, [sp, #156]
	ldr	r7, [sp, #184]
	cmp	r3, #46
	mvn	r3, #0
	moveq	r3, #3
	cmp	r7, #46
	mvn	r7, #0
	moveq	r7, #11
	cmp	r3, r7
	movlo	r7, r3
	ldr	r3, [sp, #168]
	cmp	r3, #46
	mvn	r3, #0
	moveq	r3, #7
	cmp	r6, #46
	mvn	r6, #0
	moveq	r6, #15
	cmp	r3, r6
	movlo	r6, r3
	cmp	r7, r6
	movlo	r6, r7
	cmp	r1, r6
	movlo	r6, r1
	cmp	r2, r6
	movlo	r6, r2
	and	r1, r6, #255
	ldr	r6, [sp, #188]
	add	r10, r1, r10
	ldr	r3, [sp, #128]
.LBB95_356:
	cmn	r10, #1
	beq	.LBB95_362
.LBB95_357:
	cmp	r10, #0
	bmi	.LBB95_645
	cmp	r10, r3
	bgt	.LBB95_645
	add	r2, r10, #1
	cmn	r10, #-2147483647
	beq	.LBB95_646
	cmp	r3, r2
	blt	.LBB95_646
	ldr	r0, [sp, #204]
	sub	r1, r3, r2
	add	lr, r0, r2
	b	.LBB95_363
.LBB95_362:
	mov	lr, #0
	mov	r1, #0
.LBB95_363:
	ldr	r0, [sp, #180]
	cmp	r1, #0
	ldr	r2, [sp, #176]
	movne	r2, r1
	moveq	lr, r0
	ldr	r0, [sp, #108]
	cmp	r2, r0
	bne	.LBB95_299
	ldr	r0, [sp, #108]
	cmp	r0, #0
	ldrne	r0, [sp, #120]
	cmpne	lr, r0
	beq	.LBB95_379
	ldr	r1, [sp, #108]
	mov	r0, #0
	cmp	r1, #8
	blo	.LBB95_375
	ldr	r0, [sp, #104]
	cmp	r0, #0
	beq	.LBB95_371
	mov	r0, #0
.LBB95_368:
	ldr	r6, [sp, #120]
	mov	r2, lr
	ldrb	r8, [r2, r0]!
	ldrb	r1, [r6, r0]!
	ldrb	r4, [r2, #15]
	ldrb	r5, [r6, #15]
	ldrb	r7, [r2, #14]
	subs	r5, r4, r5
	ldrb	r4, [r6, #14]
	movne	r5, #1
	str	r1, [sp, #204]
	subs	r7, r7, r4
	ldrb	r4, [r2, #13]
	movne	r7, #1
	ldrb	r1, [r2, #12]
	orr	r7, r7, r5, lsl #1
	ldrb	r5, [r6, #13]
	ldrb	r3, [r2, #8]
	subs	r5, r4, r5
	ldrb	r4, [r6, #12]
	movne	r5, #1
	ldrb	r10, [r6, #1]
	subs	r1, r1, r4
	ldrb	r4, [r6, #11]
	movne	r1, #1
	ldrb	r11, [r2, #1]
	orr	r1, r1, r5, lsl #1
	ldrb	r5, [r2, #11]
	orr	r1, r1, r7, lsl #2
	ldrb	r7, [r2, #10]
	subs	r4, r5, r4
	ldrb	r5, [r6, #10]
	movne	r4, #1
	ldrb	r12, [r2, #3]
	subs	r5, r7, r5
	ldrb	r7, [r2, #9]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	ldrb	r5, [r6, #9]
	subs	r5, r7, r5
	ldrb	r7, [r6, #8]
	movne	r5, #1
	subs	r3, r3, r7
	ldrb	r7, [r6, #2]
	movne	r3, #1
	orr	r3, r3, r5, lsl #1
	ldrb	r5, [r6, #3]
	orr	r3, r3, r4, lsl #2
	ldrb	r4, [r2, #6]
	orr	r9, r3, r1, lsl #4
	ldrb	r1, [r6, #7]
	ldrb	r3, [r2, #7]
	subs	r1, r3, r1
	ldrb	r3, [r6, #6]
	movne	r1, #1
	subs	r3, r4, r3
	ldrb	r4, [r2, #5]
	movne	r3, #1
	orr	r1, r3, r1, lsl #1
	ldrb	r3, [r6, #5]
	ldrb	r6, [r6, #4]
	subs	r3, r4, r3
	ldrb	r4, [r2, #2]
	ldrb	r2, [r2, #4]
	movne	r3, #1
	subs	r2, r2, r6
	ldr	r6, [sp, #188]
	movne	r2, #1
	orr	r2, r2, r3, lsl #1
	orr	r1, r2, r1, lsl #2
	subs	r2, r12, r5
	movne	r2, #1
	subs	r3, r4, r7
	movne	r3, #1
	orr	r2, r3, r2, lsl #1
	ldr	r3, [sp, #204]
	ldr	r12, [sp, #208]
	subs	r3, r8, r3
	ldr	r4, [sp, #212]
	movne	r3, #1
	subs	r7, r11, r10
	movne	r7, #1
	orr	r3, r3, r7, lsl #1
	orr	r2, r3, r2, lsl #2
	orr	r1, r2, r1, lsl #4
	mov	r2, #255
	and	r1, r1, #255
	orr	r2, r2, #65280
	orr	r1, r1, r9, lsl #8
	tst	r1, r2
	bne	.LBB95_299
	ldr	r1, [sp, #104]
	add	r0, r0, #16
	cmp	r0, r1
	blo	.LBB95_368
	ldr	r0, [sp, #84]
	b	.LBB95_372
.LBB95_371:
	mov	r0, #0
.LBB95_372:
	ldr	r1, [sp, #108]
	sub	r1, r1, r0
	bic	r1, r1, #3
	cmp	r0, r1
	bhs	.LBB95_375
.LBB95_373:
	ldr	r2, [sp, #120]
	ldr	r3, [lr, r0]
	ldr	r2, [r2, r0]
	cmp	r3, r2
	bne	.LBB95_299
	add	r0, r0, #4
	cmp	r0, r1
	blo	.LBB95_373
.LBB95_375:
	ldr	r1, [sp, #108]
	cmp	r1, r0
	bls	.LBB95_379
	ldr	r2, [sp, #120]
	add	r1, lr, r0
	ldr	r3, [sp, #108]
	add	r2, r2, r0
	sub	r0, r3, r0
.LBB95_377:
	ldrb	r3, [r1], #1
	ldrb	r7, [r2], #1
	cmp	r3, r7
	bne	.LBB95_299
	subs	r0, r0, #1
	bne	.LBB95_377
.LBB95_379:
	ldr	r7, [r4, #40]
	cmp	r7, #0
	beq	.LBB95_612
	mov	r5, #0
	ldr	r1, [r4, #44]
	mov	r0, #12
	ldr	r3, .LCPI95_50
	str	r5, [sp, #504]
	mov	r2, #4
	str	r5, [sp, #500]
	mov	r8, r12
	str	r5, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r12, [sp, #20]
	mov	lr, pc
	mov	pc, r7
	ldr	r4, [sp, #212]
	add	r7, sp, #360
	ldr	r9, [sp, #196]
	mov	r12, r8
	ldr	r10, [sp, #112]
	ldr	r3, [r4, #40]
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #84]
	cmp	r3, #0
	ldr	r2, [sp, #496]
	add	r0, r0, r2
	str	r0, [r4, #84]
	beq	.LBB95_619
	str	r5, [sp, #504]
	mov	r4, r3
	str	r5, [sp, #500]
	mov	r2, #4
	str	r5, [sp, #496]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r12, [sp, #20]
	ldr	r0, [sp, #108]
	str	r0, [sp]
	add	r0, sp, #496
	ldr	r3, [sp, #120]
	mov	lr, pc
	mov	pc, r4
	ldr	r4, [sp, #212]
	mov	r12, r8
	ldr	r2, [sp, #496]
	ldr	r5, [r4, #40]
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #84]
	cmp	r5, #0
	add	r0, r0, r2
	str	r0, [r4, #84]
	beq	.LBB95_619
	mov	r0, #0
	ldr	r3, .LCPI95_51
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #496
	str	r12, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r4, [sp, #212]
	mov	r12, r8
	ldr	r1, [sp, #496]
	ldr	r0, [r4, #84]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB95_619
.LBB95_383:
	add	r0, sp, #432
	bl	"reflect::as_bool"
	str	r0, [sp, #92]
	tst	r1, #1
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
	beq	.LBB95_602
	ldr	r0, [sp, #124]
	mov	r1, #1
	cmp	r0, #1
	movle	r0, r1
	mov	r1, #0
	str	r0, [sp, #124]
	ldr	r0, [sp, #140]
	bic	r0, r0, #15
	str	r0, [sp, #132]
	sub	r0, r0, #1
	bic	r0, r0, #15
	add	r0, r0, #16
	str	r0, [sp, #88]
	b	.LBB95_386
.LBB95_385:
	ldr	r1, [sp, #96]
	ldr	r0, [sp, #124]
	ldr	r12, [sp, #212]
	add	r1, r1, #1
	ldr	lr, [sp, #136]
	cmp	r1, r0
	beq	.LBB95_602
.LBB95_386:
	mov	r0, #0
	ldr	r3, .LCPI95_48
	str	r0, [sp, #276]
	str	r0, [sp, #280]
	strb	r0, [sp, #284]
	ldr	r0, [sp, #120]
	str	r1, [sp, #96]
	ldr	r1, [r0, r1, lsl #3]!
	ldr	r2, [r0, #4]
	mov	r0, #13
	str	r0, [sp]
	add	r0, sp, #276
	bl	"reflect::struct_tag_lookup"
	ldrb	r0, [sp, #284]
	tst	r0, #1
	beq	.LBB95_385
	ldr	r0, [sp, #276]
	ldr	r1, [sp, #280]
	str	r0, [sp, #268]
	mov	r0, #0
	str	r1, [sp, #272]
	str	r0, [sp, #256]
	str	r0, [sp, #260]
	strb	r0, [sp, #264]
	b	.LBB95_389
.LBB95_388:
	mov	r0, #0
	strb	r0, [sp, #264]
	str	r0, [sp, #260]
	str	r0, [sp, #256]
.LBB95_389:
	add	r0, sp, #256
	add	r1, sp, #268
	bl	"strings::split_iterator"
	ldrb	r0, [sp, #264]
	tst	r0, #1
	beq	.LBB95_385
	ldr	r1, [sp, #260]
	ldr	r0, [sp, #256]
	cmp	r1, #15
	str	r0, [sp, #204]
	str	r1, [sp, #128]
	bgt	.LBB95_396
	cmp	r1, #1
	blt	.LBB95_409
	mov	lr, #0
.LBB95_393:
	ldr	r0, [sp, #204]
	ldrb	r0, [r0, lr]
	cmp	r0, #61
	beq	.LBB95_404
	add	lr, lr, #1
	cmp	r1, lr
	bne	.LBB95_393
	b	.LBB95_409
	.p2align	2
.LCPI95_48:
	.long	".Lcsbs$POC-Example$18b"
	.p2align	2
.LBB95_396:
	mov	r0, #1
	add	r2, r0, r1, lsr #4
	mov	lr, #0
.LBB95_397:
	ldr	r10, [sp, #204]
	ldrb	r0, [r10, lr]!
	str	r0, [sp, #200]
	ldrb	r0, [r10, #15]
	str	r0, [sp, #184]
	sub	r0, r0, #61
	ldrb	r9, [r10, #12]
	rsbs	r1, r0, #0
	ldrb	r3, [r10, #10]
	adc	r0, r0, r1
	ldrb	r1, [r10, #14]
	str	r1, [sp, #168]
	sub	r1, r1, #61
	ldrb	r11, [r10, #8]
	rsbs	r7, r1, #0
	ldrb	r8, [r10, #6]
	adc	r1, r1, r7
	ldrb	r12, [r10, #1]
	orr	r0, r1, r0, lsl #1
	ldrb	r1, [r10, #13]
	str	r1, [sp, #176]
	sub	r1, r1, #61
	rsbs	r7, r1, #0
	adc	r1, r1, r7
	sub	r7, r9, #61
	rsbs	r6, r7, #0
	adc	r7, r7, r6
	orr	r1, r7, r1, lsl #1
	orr	r0, r1, r0, lsl #2
	ldrb	r1, [r10, #11]
	str	r1, [sp, #180]
	sub	r1, r1, #61
	str	r3, [sp, #152]
	rsbs	r7, r1, #0
	adc	r1, r1, r7
	sub	r7, r3, #61
	rsbs	r6, r7, #0
	ldrb	r3, [r10, #9]
	adc	r7, r7, r6
	str	r3, [sp, #164]
	orr	r1, r7, r1, lsl #1
	sub	r7, r3, #61
	rsbs	r6, r7, #0
	ldrb	r3, [r10, #3]
	adc	r7, r7, r6
	sub	r6, r11, #61
	rsbs	r4, r6, #0
	adc	r6, r6, r4
	orr	r7, r6, r7, lsl #1
	orr	r1, r7, r1, lsl #2
	orr	r0, r1, r0, lsl #4
	str	r0, [sp, #192]
	ldrb	r0, [r10, #7]
	str	r0, [sp, #172]
	sub	r0, r0, #61
	rsbs	r1, r0, #0
	adc	r0, r0, r1
	sub	r1, r8, #61
	rsbs	r7, r1, #0
	adc	r1, r1, r7
	orr	r4, r1, r0, lsl #1
	ldrb	r0, [r10, #5]
	str	r0, [sp, #160]
	sub	r0, r0, #61
	str	r3, [sp, #156]
	rsbs	r1, r0, #0
	adc	r7, r0, r1
	ldrb	r1, [r10, #4]
	ldrb	r0, [r10, #2]
	sub	r6, r1, #61
	rsbs	r5, r6, #0
	adc	r5, r6, r5
	orr	r5, r5, r7, lsl #1
	orr	r4, r5, r4, lsl #2
	sub	r5, r3, #61
	rsbs	r6, r5, #0
	ldr	r3, [sp, #200]
	adc	r5, r5, r6
	sub	r6, r0, #61
	rsbs	r7, r6, #0
	adc	r6, r6, r7
	mov	r10, r3
	orr	r5, r6, r5, lsl #1
	sub	r6, r3, #61
	rsbs	r7, r6, #0
	adc	r6, r6, r7
	sub	r7, r12, #61
	rsbs	r3, r7, #0
	adc	r3, r7, r3
	orr	r3, r6, r3, lsl #1
	orr	r3, r3, r5, lsl #2
	orr	r3, r3, r4, lsl #4
	ldr	r4, [sp, #192]
	and	r3, r3, #255
	orr	r3, r3, r4, lsl #8
	mov	r4, #255
	orr	r4, r4, #65280
	tst	r3, r4
	bne	.LBB95_402
	sub	r2, r2, #1
	add	lr, lr, #16
	cmp	r2, #1
	bgt	.LBB95_397
	ldr	r1, [sp, #128]
	cmp	lr, r1
	bge	.LBB95_409
.LBB95_400:
	ldr	r0, [sp, #204]
	ldrb	r0, [r0, lr]
	cmp	r0, #61
	beq	.LBB95_403
	add	lr, lr, #1
	cmp	r1, lr
	bne	.LBB95_400
	b	.LBB95_409
.LBB95_402:
	subs	r2, r10, #61
	mvn	r3, #0
	mvnne	r2, #0
	cmp	r11, #61
	moveq	r3, #8
	cmp	r2, r3
	movlo	r3, r2
	cmp	r1, #61
	mvn	r2, #0
	mvn	r1, #0
	moveq	r2, #4
	cmp	r9, #61
	moveq	r1, #12
	cmp	r2, r1
	movlo	r1, r2
	cmp	r3, r1
	ldr	r2, [sp, #152]
	movlo	r1, r3
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #2
	cmp	r2, #61
	mvn	r2, #0
	mvn	r3, #0
	moveq	r2, #10
	cmp	r0, r2
	movlo	r2, r0
	ldr	r0, [sp, #168]
	cmp	r8, #61
	ldr	r7, [sp, #184]
	moveq	r3, #6
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #14
	cmp	r3, r0
	movlo	r0, r3
	cmp	r2, r0
	movlo	r0, r2
	cmp	r1, r0
	ldr	r2, [sp, #164]
	movlo	r0, r1
	cmp	r12, #61
	mvn	r1, #0
	moveq	r1, #1
	cmp	r2, #61
	mvn	r2, #0
	mvn	r3, #0
	moveq	r2, #9
	cmp	r1, r2
	movlo	r2, r1
	ldr	r1, [sp, #160]
	cmp	r1, #61
	ldr	r1, [sp, #176]
	moveq	r3, #5
	cmp	r1, #61
	mvn	r1, #0
	moveq	r1, #13
	cmp	r3, r1
	movlo	r1, r3
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #156]
	ldr	r3, [sp, #180]
	cmp	r2, #61
	mvn	r2, #0
	moveq	r2, #3
	cmp	r3, #61
	mvn	r3, #0
	moveq	r3, #11
	cmp	r2, r3
	movlo	r3, r2
	ldr	r2, [sp, #172]
	cmp	r2, #61
	mvn	r2, #0
	moveq	r2, #7
	cmp	r7, #61
	mvn	r7, #0
	moveq	r7, #15
	cmp	r2, r7
	movlo	r7, r2
	cmp	r3, r7
	movlo	r7, r3
	cmp	r1, r7
	movlo	r7, r1
	cmp	r0, r7
	movlo	r7, r0
	and	r0, r7, #255
	ldr	r1, [sp, #128]
	add	lr, r0, lr
.LBB95_403:
	cmn	lr, #1
	beq	.LBB95_409
.LBB95_404:
	cmp	lr, #0
	bmi	.LBB95_624
	cmp	lr, r1
	bgt	.LBB95_624
	add	r0, lr, #1
	cmn	lr, #-2147483647
	beq	.LBB95_625
	cmp	r1, r0
	blt	.LBB95_625
	sub	r1, r1, r0
	str	r1, [sp, #180]
	ldr	r1, [sp, #204]
	mov	r10, #1
	add	r0, r1, r0
	add	r12, r1, lr
	str	r0, [sp, #176]
	mov	r0, #1
	str	r0, [sp, #184]
	b	.LBB95_410
.LBB95_409:
	mov	r0, #0
	mov	r12, #0
	str	r0, [sp, #184]
	mov	lr, r1
	str	r0, [sp, #176]
	mov	r10, #0
	str	r0, [sp, #180]
.LBB95_410:
	ldr	r0, [sp, #140]
	ldr	r4, [sp, #212]
	cmp	lr, r0
	bne	.LBB95_388
	ldr	r0, [sp, #148]
	ldr	r1, [sp, #204]
	cmp	r1, r0
	beq	.LBB95_426
	ldr	r1, [sp, #140]
	mov	r0, #0
	cmp	r1, #8
	blo	.LBB95_422
	ldr	r0, [sp, #132]
	cmp	r0, #0
	beq	.LBB95_418
	mov	r0, #0
.LBB95_415:
	ldr	r5, [sp, #148]
	mov	lr, r12
	ldrb	r1, [r5, r0]!
	str	r1, [sp, #200]
	ldr	r3, [sp, #204]
	ldrb	r1, [r5, #15]
	ldrb	r2, [r3, r0]!
	str	r2, [sp, #192]
	ldrb	r4, [r3, #15]
	ldrb	r2, [r3, #14]
	subs	r1, r4, r1
	ldrb	r4, [r5, #14]
	movne	r1, #1
	ldrb	r7, [r3, #12]
	subs	r2, r2, r4
	ldrb	r4, [r3, #13]
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	ldrb	r2, [r5, #13]
	ldrb	r6, [r3, #8]
	subs	r2, r4, r2
	ldrb	r4, [r5, #12]
	movne	r2, #1
	ldrb	r12, [r3, #1]
	subs	r4, r7, r4
	ldrb	r7, [r3, #10]
	movne	r4, #1
	orr	r2, r4, r2, lsl #1
	orr	r1, r2, r1, lsl #2
	ldrb	r2, [r5, #11]
	ldrb	r4, [r3, #11]
	ldrb	r9, [r3, #2]
	subs	r2, r4, r2
	ldrb	r4, [r5, #10]
	movne	r2, #1
	ldrb	r8, [r3, #3]
	subs	r4, r7, r4
	ldrb	r7, [r3, #9]
	movne	r4, #1
	orr	r2, r4, r2, lsl #1
	ldrb	r4, [r5, #9]
	subs	r4, r7, r4
	ldrb	r7, [r5, #8]
	movne	r4, #1
	subs	r6, r6, r7
	ldrb	r7, [r5, #2]
	movne	r6, #1
	orr	r4, r6, r4, lsl #1
	orr	r2, r4, r2, lsl #2
	ldrb	r4, [r3, #7]
	orr	r11, r2, r1, lsl #4
	ldrb	r2, [r5, #7]
	ldrb	r6, [r3, #6]
	subs	r2, r4, r2
	ldrb	r4, [r5, #6]
	movne	r2, #1
	ldrb	r1, [r5, #3]
	subs	r4, r6, r4
	ldrb	r6, [r3, #5]
	movne	r4, #1
	orr	r2, r4, r2, lsl #1
	ldrb	r4, [r5, #5]
	ldrb	r3, [r3, #4]
	subs	r4, r6, r4
	ldrb	r6, [r5, #1]
	ldrb	r5, [r5, #4]
	movne	r4, #1
	subs	r3, r3, r5
	movne	r3, #1
	subs	r1, r8, r1
	orr	r3, r3, r4, lsl #1
	movne	r1, #1
	orr	r2, r3, r2, lsl #2
	subs	r3, r9, r7
	movne	r3, #1
	orr	r1, r3, r1, lsl #1
	ldr	r3, [sp, #200]
	ldr	r4, [sp, #192]
	subs	r3, r4, r3
	ldr	r4, [sp, #212]
	movne	r3, #1
	subs	r7, r12, r6
	movne	r7, #1
	orr	r3, r3, r7, lsl #1
	orr	r1, r3, r1, lsl #2
	orr	r1, r1, r2, lsl #4
	mov	r2, #255
	and	r1, r1, #255
	orr	r2, r2, #65280
	orr	r1, r1, r11, lsl #8
	tst	r1, r2
	bne	.LBB95_388
	ldr	r1, [sp, #132]
	add	r0, r0, #16
	mov	r12, lr
	cmp	r0, r1
	blo	.LBB95_415
	ldr	r0, [sp, #88]
	b	.LBB95_419
.LBB95_418:
	mov	r0, #0
.LBB95_419:
	ldr	r1, [sp, #140]
	sub	r1, r1, r0
	bic	r1, r1, #3
	cmp	r0, r1
	bhs	.LBB95_422
.LBB95_420:
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #204]
	ldr	r2, [r2, r0]
	ldr	r3, [r3, r0]
	cmp	r3, r2
	bne	.LBB95_388
	add	r0, r0, #4
	cmp	r0, r1
	blo	.LBB95_420
.LBB95_422:
	ldr	r1, [sp, #140]
	cmp	r1, r0
	bls	.LBB95_426
	ldr	r1, [sp, #204]
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #140]
	add	r1, r1, r0
	add	r2, r2, r0
	sub	r0, r3, r0
.LBB95_424:
	ldrb	r3, [r1], #1
	ldrb	r7, [r2], #1
	cmp	r3, r7
	bne	.LBB95_388
	subs	r0, r0, #1
	bne	.LBB95_424
.LBB95_426:
	ldr	r0, [sp, #184]
	cmp	r0, #0
	beq	.LBB95_388
	ldr	r0, .LCPI95_49
	cmp	r12, r0
	beq	.LBB95_430
.LBB95_428:
	ldrb	r1, [r12], #1
	ldrb	r2, [r0], #1
	cmp	r1, r2
	bne	.LBB95_388
	subs	r10, r10, #1
	bne	.LBB95_428
.LBB95_430:
	ldr	r2, [sp, #128]
	cmp	r2, #15
	bgt	.LBB95_436
	ldr	r6, [sp, #180]
	cmp	r2, #1
	blt	.LBB95_449
	mov	r8, #0
.LBB95_433:
	ldr	r0, [sp, #204]
	ldrb	r0, [r0, r8]
	cmp	r0, #46
	beq	.LBB95_444
	add	r8, r8, #1
	cmp	r2, r8
	bne	.LBB95_433
	b	.LBB95_449
	.p2align	2
.LCPI95_49:
	.long	".Lcsbs$POC-Example$18c"
	.p2align	2
.LBB95_436:
	mov	r0, #1
	add	r7, r0, r2, lsr #4
	mov	r8, #0
.LBB95_437:
	ldr	r9, [sp, #204]
	ldrb	r0, [r9, r8]!
	str	r0, [sp, #200]
	ldrb	r0, [r9, #15]
	str	r0, [sp, #184]
	sub	r0, r0, #46
	ldrb	r12, [r9, #8]
	rsbs	r1, r0, #0
	ldrb	lr, [r9, #6]
	adc	r0, r0, r1
	ldrb	r1, [r9, #14]
	str	r1, [sp, #160]
	sub	r1, r1, #46
	ldrb	r10, [r9, #3]
	rsbs	r2, r1, #0
	ldrb	r11, [r9, #1]
	adc	r1, r1, r2
	orr	r0, r1, r0, lsl #1
	ldrb	r1, [r9, #13]
	str	r1, [sp, #168]
	sub	r1, r1, #46
	rsbs	r2, r1, #0
	adc	r1, r1, r2
	ldrb	r2, [r9, #12]
	str	r2, [sp, #100]
	sub	r2, r2, #46
	rsbs	r6, r2, #0
	adc	r2, r2, r6
	sub	r6, r12, #46
	orr	r1, r2, r1, lsl #1
	orr	r0, r1, r0, lsl #2
	ldrb	r1, [r9, #11]
	str	r1, [sp, #172]
	sub	r1, r1, #46
	rsbs	r2, r1, #0
	adc	r1, r1, r2
	ldrb	r2, [r9, #10]
	str	r2, [sp, #104]
	sub	r2, r2, #46
	rsbs	r4, r2, #0
	adc	r2, r2, r4
	orr	r1, r2, r1, lsl #1
	ldrb	r2, [r9, #9]
	str	r2, [sp, #156]
	sub	r2, r2, #46
	rsbs	r4, r2, #0
	adc	r4, r2, r4
	rsbs	r5, r6, #0
	adc	r6, r6, r5
	orr	r6, r6, r4, lsl #1
	orr	r1, r6, r1, lsl #2
	orr	r0, r1, r0, lsl #4
	str	r0, [sp, #192]
	ldrb	r0, [r9, #7]
	str	r0, [sp, #164]
	sub	r0, r0, #46
	rsbs	r1, r0, #0
	adc	r0, r0, r1
	sub	r1, lr, #46
	rsbs	r4, r1, #0
	adc	r1, r1, r4
	orr	r6, r1, r0, lsl #1
	ldrb	r0, [r9, #5]
	str	r0, [sp, #112]
	sub	r0, r0, #46
	str	r10, [sp, #152]
	rsbs	r1, r0, #0
	ldr	r2, [sp, #200]
	adc	r4, r0, r1
	ldrb	r1, [r9, #4]
	ldrb	r0, [r9, #2]
	sub	r5, r1, #46
	rsbs	r3, r5, #0
	adc	r3, r5, r3
	orr	r3, r3, r4, lsl #1
	sub	r4, r10, #46
	rsbs	r5, r4, #0
	orr	r9, r3, r6, lsl #2
	adc	r4, r4, r5
	sub	r5, r0, #46
	rsbs	r6, r5, #0
	adc	r5, r5, r6
	orr	r4, r5, r4, lsl #1
	sub	r5, r2, #46
	rsbs	r6, r5, #0
	adc	r5, r5, r6
	sub	r6, r11, #46
	rsbs	r3, r6, #0
	adc	r3, r6, r3
	orr	r3, r5, r3, lsl #1
	orr	r3, r3, r4, lsl #2
	ldr	r4, [sp, #192]
	orr	r3, r3, r9, lsl #4
	and	r3, r3, #255
	orr	r3, r3, r4, lsl #8
	mov	r4, #255
	orr	r4, r4, #65280
	tst	r3, r4
	bne	.LBB95_442
	sub	r7, r7, #1
	add	r8, r8, #16
	cmp	r7, #1
	bgt	.LBB95_437
	ldr	r2, [sp, #128]
	mov	r7, #0
	ldr	r4, [sp, #212]
	mov	r0, #0
	ldr	r6, [sp, #180]
	cmp	r8, r2
	bge	.LBB95_450
.LBB95_440:
	ldr	r0, [sp, #204]
	ldrb	r0, [r0, r8]
	cmp	r0, #46
	beq	.LBB95_443
	add	r8, r8, #1
	cmp	r2, r8
	bne	.LBB95_440
	b	.LBB95_449
.LBB95_442:
	subs	r3, r2, #46
	mvn	r2, #0
	mvnne	r3, #0
	cmp	r12, #46
	moveq	r2, #8
	cmp	r3, r2
	movlo	r2, r3
	cmp	r1, #46
	ldr	r1, [sp, #100]
	mvn	r3, #0
	moveq	r3, #4
	ldr	r7, [sp, #184]
	cmp	r1, #46
	mvn	r1, #0
	moveq	r1, #12
	cmp	r3, r1
	movlo	r1, r3
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #104]
	cmp	r0, #46
	mvn	r0, #0
	moveq	r0, #2
	cmp	r2, #46
	mvn	r2, #0
	mvn	r3, #0
	moveq	r2, #10
	cmp	r0, r2
	movlo	r2, r0
	ldr	r0, [sp, #160]
	cmp	lr, #46
	ldr	r4, [sp, #212]
	moveq	r3, #6
	cmp	r0, #46
	mvn	r0, #0
	ldr	r6, [sp, #180]
	moveq	r0, #14
	cmp	r3, r0
	movlo	r0, r3
	cmp	r2, r0
	movlo	r0, r2
	cmp	r1, r0
	ldr	r2, [sp, #156]
	movlo	r0, r1
	cmp	r11, #46
	mvn	r1, #0
	moveq	r1, #1
	cmp	r2, #46
	mvn	r2, #0
	mvn	r3, #0
	moveq	r2, #9
	cmp	r1, r2
	movlo	r2, r1
	ldr	r1, [sp, #112]
	cmp	r1, #46
	ldr	r1, [sp, #168]
	moveq	r3, #5
	cmp	r1, #46
	mvn	r1, #0
	moveq	r1, #13
	cmp	r3, r1
	movlo	r1, r3
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #152]
	ldr	r3, [sp, #172]
	cmp	r2, #46
	mvn	r2, #0
	moveq	r2, #3
	cmp	r3, #46
	mvn	r3, #0
	moveq	r3, #11
	cmp	r2, r3
	movlo	r3, r2
	ldr	r2, [sp, #164]
	cmp	r2, #46
	mvn	r2, #0
	moveq	r2, #7
	cmp	r7, #46
	mvn	r7, #0
	moveq	r7, #15
	cmp	r2, r7
	movlo	r7, r2
	cmp	r3, r7
	movlo	r7, r3
	cmp	r1, r7
	movlo	r7, r1
	cmp	r0, r7
	movlo	r7, r0
	and	r0, r7, #255
	ldr	r2, [sp, #128]
	add	r8, r0, r8
.LBB95_443:
	cmn	r8, #1
	beq	.LBB95_449
.LBB95_444:
	cmp	r8, #0
	bmi	.LBB95_634
	cmp	r8, r2
	bgt	.LBB95_634
	add	r1, r8, #1
	cmn	r8, #-2147483647
	beq	.LBB95_637
	cmp	r2, r1
	blt	.LBB95_637
	sub	r0, r2, r1
	ldr	r2, [sp, #204]
	add	r7, r2, r1
	b	.LBB95_450
.LBB95_449:
	mov	r7, #0
	mov	r0, #0
.LBB95_450:
	ldr	r1, [sp, #176]
	cmp	r0, #0
	movne	r6, r0
	moveq	r7, r1
	cmp	r6, #4
	beq	.LBB95_459
	ldr	r12, [sp, #208]
	cmp	r6, #1
	bne	.LBB95_469
	ldr	r0, .LCPI95_52
	cmp	r7, r0
	beq	.LBB95_474
	ldr	r0, .LCPI95_53
	mov	r9, #1
	cmp	r7, r0
	beq	.LBB95_475
	ldr	r0, .LCPI95_54
	cmp	r7, r0
	beq	.LBB95_475
	ldrb	r0, [r7]
	mov	r5, #1
	cmp	r0, #49
	orrne	r0, r0, #32
	cmpne	r0, #116
	beq	.LBB95_476
	ldr	r0, .LCPI95_55
	mov	r9, #0
	cmp	r7, r0
	beq	.LBB95_476
	ldrb	r0, [r7]
	cmp	r0, #48
	ldrne	r0, .LCPI95_56
	cmpne	r7, r0
	beq	.LBB95_476
	ldrb	r0, [r7]
	cmp	r0, #102
	bne	.LBB95_469
	b	.LBB95_476
.LBB95_459:
	ldr	r0, .LCPI95_57
	ldr	r12, [sp, #208]
	cmp	r7, r0
	beq	.LBB95_474
	ldrb	r0, [r7]
	cmp	r0, #116
	bne	.LBB95_462
	ldrb	r1, [r7, #1]
	cmp	r1, #114
	ldrbeq	r1, [r7, #2]
	cmpeq	r1, #117
	beq	.LBB95_478
.LBB95_462:
	ldr	r1, .LCPI95_58
	cmp	r7, r1
	beq	.LBB95_474
.LBB95_463:
	cmp	r0, #84
	bne	.LBB95_468
	ldrb	r0, [r7, #1]
	cmp	r0, #82
	ldrbeq	r0, [r7, #2]
	cmpeq	r0, #85
	beq	.LBB95_480
	ldr	r0, .LCPI95_59
	cmp	r7, r0
	beq	.LBB95_474
.LBB95_466:
	ldrb	r0, [r7, #1]
	cmp	r0, #114
	ldrbeq	r0, [r7, #2]
	cmpeq	r0, #117
	bne	.LBB95_469
	ldrb	r0, [r7, #3]
	mov	r9, #1
	mov	r5, #1
	cmp	r0, #101
	bne	.LBB95_469
	b	.LBB95_476
.LBB95_468:
	ldr	r0, .LCPI95_59
	cmp	r7, r0
	beq	.LBB95_474
.LBB95_469:
	ldr	r2, .LCPI95_60
	mov	r0, r7
	mov	r1, r6
	mov	r3, #1
	mov	r8, r12
	mov	r5, #1
	bl	"runtime::string_eq"
	mov	r9, #0
	tst	r0, #1
	bne	.LBB95_473
	ldr	r2, .LCPI95_61
	mov	r0, r7
	mov	r1, r6
	mov	r3, #5
	bl	"runtime::string_eq"
	tst	r0, #1
	bne	.LBB95_473
	ldr	r2, .LCPI95_62
	mov	r0, r7
	mov	r1, r6
	mov	r3, #5
	bl	"runtime::string_eq"
	tst	r0, #1
	bne	.LBB95_473
	ldr	r2, .LCPI95_63
	mov	r0, r7
	mov	r1, r6
	mov	r3, #5
	bl	"runtime::string_eq"
	and	r5, r0, #1
.LBB95_473:
	ldr	r4, [sp, #212]
	mov	r12, r8
	b	.LBB95_476
.LBB95_474:
	mov	r9, #1
.LBB95_475:
	mov	r5, #1
.LBB95_476:
	tst	r5, #1
	beq	.LBB95_388
	ldr	r0, [sp, #92]
	and	r1, r9, #255
	and	r0, r0, #255
	cmp	r1, r0
	bne	.LBB95_388
	b	.LBB95_608
.LBB95_478:
	ldrb	r1, [r7, #3]
	mov	r9, #1
	cmp	r1, #101
	beq	.LBB95_475
	ldr	r1, .LCPI95_58
	mov	r5, #1
	cmp	r7, r1
	bne	.LBB95_463
	b	.LBB95_476
.LBB95_480:
	ldrb	r0, [r7, #3]
	mov	r9, #1
	cmp	r0, #69
	beq	.LBB95_475
	ldr	r0, .LCPI95_59
	mov	r5, #1
	cmp	r7, r0
	bne	.LBB95_466
	b	.LBB95_476
.LBB95_482:
	mov	r0, #0
	add	r1, sp, #432
	strb	r0, [sp, #352]
	str	r0, [sp, #348]
	str	r0, [sp, #344]
	add	r0, sp, #344
	bl	"reflect::as_i64"
	ldrb	r0, [sp, #352]
	ldr	r12, [sp, #212]
	ldr	lr, [sp, #136]
	tst	r0, #1
	beq	.LBB95_602
	ldr	r0, [r10, #20]
	str	r0, [sp, #112]
	cmp	r0, #0
	bmi	.LBB95_648
	beq	.LBB95_602
	ldr	r0, [sp, #344]
	mov	r1, #0
	str	r0, [sp, #92]
	ldr	r0, [sp, #348]
	str	r0, [sp, #88]
	ldr	r0, [r10, #16]
	str	r0, [sp, #108]
	ldr	r0, [sp, #140]
	bic	r0, r0, #15
	str	r0, [sp, #132]
	sub	r0, r0, #1
	bic	r0, r0, #15
	add	r0, r0, #16
	str	r0, [sp, #100]
	b	.LBB95_487
.LBB95_486:
	ldr	r1, [sp, #96]
	ldr	r0, [sp, #112]
	ldr	r12, [sp, #212]
	add	r1, r1, #1
	ldr	lr, [sp, #136]
	cmp	r1, r0
	beq	.LBB95_602
.LBB95_487:
	mov	r0, #0
	ldr	r3, .LCPI95_48
	str	r0, [sp, #332]
	str	r0, [sp, #336]
	strb	r0, [sp, #340]
	ldr	r0, [sp, #108]
	str	r1, [sp, #96]
	ldr	r1, [r0, r1, lsl #3]!
	ldr	r2, [r0, #4]
	mov	r0, #13
	str	r0, [sp]
	add	r0, sp, #332
	bl	"reflect::struct_tag_lookup"
	ldrb	r0, [sp, #340]
	tst	r0, #1
	beq	.LBB95_486
	ldr	r0, [sp, #332]
	ldr	r1, [sp, #336]
	str	r0, [sp, #324]
	mov	r0, #0
	str	r1, [sp, #328]
	str	r0, [sp, #312]
	str	r0, [sp, #316]
	strb	r0, [sp, #320]
	b	.LBB95_490
.LBB95_489:
	mov	r0, #0
	strb	r0, [sp, #320]
	str	r0, [sp, #316]
	str	r0, [sp, #312]
.LBB95_490:
	add	r0, sp, #312
	add	r1, sp, #324
	bl	"strings::split_iterator"
	ldrb	r0, [sp, #320]
	tst	r0, #1
	beq	.LBB95_486
	ldr	r2, [sp, #316]
	ldr	r0, [sp, #312]
	cmp	r2, #15
	str	r0, [sp, #204]
	str	r2, [sp, #128]
	bgt	.LBB95_498
	cmp	r2, #1
	blt	.LBB95_504
	ldr	r0, [sp, #140]
	mov	r9, #0
.LBB95_494:
	ldr	r1, [sp, #204]
	ldrb	r1, [r1, r9]
	cmp	r1, #61
	beq	.LBB95_507
	add	r9, r9, #1
	cmp	r2, r9
	bne	.LBB95_494
	b	.LBB95_512
	.p2align	2
.LCPI95_50:
	.long	".Lcsbs$POC-Example$18e"
	.p2align	2
.LCPI95_51:
	.long	".Lcsbs$POC-Example$141"
	.p2align	2
.LBB95_498:
	mov	r0, #1
	add	r2, r0, r2, lsr #4
	mov	r9, #0
.LBB95_499:
	ldr	r8, [sp, #204]
	ldrb	r5, [r8, r9]!
	ldrb	r0, [r8, #15]
	str	r0, [sp, #192]
	sub	r1, r0, #61
	ldrb	r0, [r8, #14]
	rsbs	r3, r1, #0
	str	r0, [sp, #172]
	adc	r1, r1, r3
	sub	r3, r0, #61
	rsbs	r7, r3, #0
	ldrb	r0, [r8, #13]
	adc	r3, r3, r7
	str	r0, [sp, #180]
	orr	r1, r3, r1, lsl #1
	sub	r3, r0, #61
	ldrb	r0, [r8, #12]
	rsbs	r7, r3, #0
	adc	r3, r3, r7
	str	r0, [sp, #152]
	sub	r7, r0, #61
	ldrb	r0, [r8, #11]
	rsbs	r6, r7, #0
	str	r0, [sp, #184]
	adc	r7, r7, r6
	ldrb	r11, [r8, #8]
	orr	r3, r7, r3, lsl #1
	ldrb	lr, [r8, #6]
	orr	r1, r3, r1, lsl #2
	sub	r3, r0, #61
	ldrb	r0, [r8, #10]
	rsbs	r7, r3, #0
	adc	r3, r3, r7
	str	r0, [sp, #156]
	sub	r7, r0, #61
	ldrb	r0, [r8, #9]
	rsbs	r6, r7, #0
	str	r0, [sp, #168]
	adc	r7, r7, r6
	ldrb	r10, [r8, #3]
	orr	r3, r7, r3, lsl #1
	sub	r7, r0, #61
	rsbs	r6, r7, #0
	ldrb	r12, [r8, #1]
	adc	r7, r7, r6
	sub	r6, r11, #61
	rsbs	r4, r6, #0
	adc	r6, r6, r4
	orr	r7, r6, r7, lsl #1
	ldrb	r6, [r8, #2]
	orr	r3, r7, r3, lsl #2
	orr	r0, r3, r1, lsl #4
	str	r0, [sp, #200]
	ldrb	r0, [r8, #7]
	str	r0, [sp, #176]
	sub	r1, r0, #61
	ldrb	r0, [r8, #5]
	rsbs	r3, r1, #0
	str	r0, [sp, #160]
	adc	r1, r1, r3
	sub	r3, lr, #61
	rsbs	r7, r3, #0
	str	r10, [sp, #164]
	adc	r3, r3, r7
	orr	r4, r3, r1, lsl #1
	sub	r1, r0, #61
	rsbs	r3, r1, #0
	adc	r3, r1, r3
	ldrb	r1, [r8, #4]
	sub	r7, r1, #61
	rsbs	r0, r7, #0
	adc	r0, r7, r0
	orr	r0, r0, r3, lsl #1
	sub	r3, r10, #61
	orr	r8, r0, r4, lsl #2
	rsbs	r4, r3, #0
	adc	r3, r3, r4
	sub	r4, r6, #61
	rsbs	r7, r4, #0
	adc	r4, r4, r7
	orr	r3, r4, r3, lsl #1
	sub	r4, r5, #61
	rsbs	r7, r4, #0
	adc	r4, r4, r7
	sub	r7, r12, #61
	rsbs	r0, r7, #0
	adc	r0, r7, r0
	orr	r0, r4, r0, lsl #1
	orr	r0, r0, r3, lsl #2
	ldr	r3, [sp, #200]
	orr	r0, r0, r8, lsl #4
	and	r0, r0, #255
	orr	r0, r0, r3, lsl #8
	mov	r3, #255
	orr	r3, r3, #65280
	tst	r0, r3
	bne	.LBB95_505
	sub	r2, r2, #1
	add	r9, r9, #16
	cmp	r2, #1
	bgt	.LBB95_499
	ldr	r2, [sp, #128]
	cmp	r9, r2
	bge	.LBB95_504
.LBB95_502:
	ldr	r0, [sp, #204]
	ldrb	r0, [r0, r9]
	cmp	r0, #61
	beq	.LBB95_506
	add	r9, r9, #1
	cmp	r2, r9
	bne	.LBB95_502
.LBB95_504:
	mov	r0, #0
	mov	r8, #0
	str	r0, [sp, #184]
	mov	r9, r2
	str	r0, [sp, #176]
	mov	r11, #0
	str	r0, [sp, #180]
	ldr	r0, [sp, #140]
	cmp	r9, r0
	bne	.LBB95_489
	b	.LBB95_513
.LBB95_505:
	subs	r0, r5, #61
	mvn	r2, #0
	mvnne	r0, #0
	cmp	r11, #61
	moveq	r2, #8
	cmp	r0, r2
	movlo	r2, r0
	cmp	r1, #61
	ldr	r1, [sp, #152]
	mvn	r0, #0
	moveq	r0, #4
	mvn	r3, #0
	cmp	r1, #61
	mvn	r1, #0
	moveq	r1, #12
	cmp	r0, r1
	movlo	r1, r0
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #156]
	cmp	r6, #61
	mvn	r0, #0
	moveq	r0, #2
	cmp	r2, #61
	moveq	r3, #10
	cmp	r0, r3
	ldr	r2, [sp, #172]
	movlo	r3, r0
	cmp	lr, #61
	mvn	r0, #0
	moveq	r0, #6
	cmp	r2, #61
	mvn	r2, #0
	ldr	r7, [sp, #192]
	moveq	r2, #14
	cmp	r0, r2
	movlo	r2, r0
	cmp	r3, r2
	movlo	r2, r3
	cmp	r1, r2
	movlo	r2, r1
	ldr	r1, [sp, #168]
	cmp	r12, #61
	mvn	r0, #0
	moveq	r0, #1
	cmp	r1, #61
	mvn	r3, #0
	ldr	r1, [sp, #180]
	moveq	r3, #9
	cmp	r0, r3
	movlo	r3, r0
	ldr	r0, [sp, #160]
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #5
	cmp	r1, #61
	mvn	r1, #0
	moveq	r1, #13
	cmp	r0, r1
	movlo	r1, r0
	cmp	r3, r1
	ldr	r0, [sp, #164]
	movlo	r1, r3
	ldr	r3, [sp, #184]
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #3
	cmp	r3, #61
	mvn	r3, #0
	moveq	r3, #11
	cmp	r0, r3
	movlo	r3, r0
	ldr	r0, [sp, #176]
	cmp	r0, #61
	mvn	r0, #0
	moveq	r0, #7
	cmp	r7, #61
	mvn	r7, #0
	moveq	r7, #15
	cmp	r0, r7
	movlo	r7, r0
	cmp	r3, r7
	movlo	r7, r3
	cmp	r1, r7
	movlo	r7, r1
	cmp	r2, r7
	movlo	r7, r2
	and	r0, r7, #255
	ldr	r2, [sp, #128]
	add	r9, r0, r9
.LBB95_506:
	ldr	r0, [sp, #140]
	cmn	r9, #1
	beq	.LBB95_512
.LBB95_507:
	cmp	r9, #0
	bmi	.LBB95_630
	cmp	r9, r2
	bgt	.LBB95_630
	add	r1, r9, #1
	cmn	r9, #-2147483647
	beq	.LBB95_631
	cmp	r2, r1
	blt	.LBB95_631
	sub	r2, r2, r1
	str	r2, [sp, #180]
	ldr	r2, [sp, #204]
	mov	r11, #1
	add	r1, r2, r1
	add	r8, r2, r9
	str	r1, [sp, #176]
	mov	r1, #1
	str	r1, [sp, #184]
	cmp	r9, r0
	bne	.LBB95_489
	b	.LBB95_513
.LBB95_512:
	mov	r1, #0
	mov	r8, #0
	str	r1, [sp, #184]
	mov	r9, r2
	str	r1, [sp, #176]
	mov	r11, #0
	str	r1, [sp, #180]
	cmp	r9, r0
	bne	.LBB95_489
.LBB95_513:
	ldr	r0, [sp, #148]
	ldr	r1, [sp, #204]
	cmp	r1, r0
	beq	.LBB95_528
	ldr	r1, [sp, #140]
	mov	r0, #0
	cmp	r1, #8
	blo	.LBB95_524
	ldr	r0, [sp, #132]
	cmp	r0, #0
	beq	.LBB95_520
	mov	r0, #0
.LBB95_517:
	ldr	r3, [sp, #148]
	ldrb	r1, [r3, r0]!
	str	r1, [sp, #200]
	ldr	r6, [sp, #204]
	ldrb	r1, [r3, #15]
	ldrb	r2, [r6, r0]!
	str	r2, [sp, #192]
	ldrb	r4, [r6, #15]
	ldrb	r2, [r6, #14]
	subs	r1, r4, r1
	ldrb	r4, [r3, #14]
	movne	r1, #1
	ldrb	r5, [r6, #12]
	subs	r2, r2, r4
	ldrb	r4, [r6, #13]
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	ldrb	r2, [r3, #13]
	ldrb	r7, [r6, #8]
	subs	r2, r4, r2
	ldrb	r4, [r3, #12]
	movne	r2, #1
	ldrb	r12, [r6, #1]
	subs	r4, r5, r4
	ldrb	r5, [r6, #10]
	movne	r4, #1
	orr	r2, r4, r2, lsl #1
	orr	r1, r2, r1, lsl #2
	ldrb	r2, [r3, #11]
	ldrb	r4, [r6, #11]
	ldrb	r10, [r6, #2]
	subs	r2, r4, r2
	ldrb	r4, [r3, #10]
	movne	r2, #1
	ldrb	lr, [r6, #3]
	subs	r4, r5, r4
	ldrb	r5, [r6, #9]
	movne	r4, #1
	orr	r2, r4, r2, lsl #1
	ldrb	r4, [r3, #9]
	subs	r4, r5, r4
	ldrb	r5, [r3, #8]
	movne	r4, #1
	subs	r5, r7, r5
	ldrb	r7, [r3, #2]
	movne	r5, #1
	orr	r4, r5, r4, lsl #1
	orr	r2, r4, r2, lsl #2
	ldrb	r4, [r6, #7]
	orr	r9, r2, r1, lsl #4
	ldrb	r2, [r3, #7]
	ldrb	r5, [r6, #6]
	subs	r2, r4, r2
	ldrb	r4, [r3, #6]
	movne	r2, #1
	ldrb	r1, [r3, #3]
	subs	r4, r5, r4
	ldrb	r5, [r6, #5]
	movne	r4, #1
	orr	r2, r4, r2, lsl #1
	ldrb	r4, [r3, #5]
	ldrb	r6, [r6, #4]
	subs	r4, r5, r4
	ldrb	r5, [r3, #1]
	ldrb	r3, [r3, #4]
	movne	r4, #1
	subs	r3, r6, r3
	movne	r3, #1
	subs	r1, lr, r1
	orr	r3, r3, r4, lsl #1
	movne	r1, #1
	orr	r2, r3, r2, lsl #2
	subs	r3, r10, r7
	movne	r3, #1
	orr	r1, r3, r1, lsl #1
	ldr	r3, [sp, #200]
	ldr	r7, [sp, #192]
	subs	r3, r7, r3
	movne	r3, #1
	subs	r7, r12, r5
	movne	r7, #1
	orr	r3, r3, r7, lsl #1
	orr	r1, r3, r1, lsl #2
	orr	r1, r1, r2, lsl #4
	mov	r2, #255
	and	r1, r1, #255
	orr	r2, r2, #65280
	orr	r1, r1, r9, lsl #8
	tst	r1, r2
	bne	.LBB95_489
	ldr	r1, [sp, #132]
	add	r0, r0, #16
	cmp	r0, r1
	blo	.LBB95_517
	ldr	r0, [sp, #100]
	b	.LBB95_521
.LBB95_520:
	mov	r0, #0
.LBB95_521:
	ldr	r1, [sp, #140]
	sub	r1, r1, r0
	bic	r1, r1, #3
	cmp	r0, r1
	bhs	.LBB95_524
.LBB95_522:
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #204]
	ldr	r2, [r2, r0]
	ldr	r3, [r3, r0]
	cmp	r3, r2
	bne	.LBB95_489
	add	r0, r0, #4
	cmp	r0, r1
	blo	.LBB95_522
.LBB95_524:
	ldr	r1, [sp, #140]
	cmp	r1, r0
	bls	.LBB95_528
	ldr	r1, [sp, #204]
	ldr	r2, [sp, #148]
	ldr	r3, [sp, #140]
	add	r1, r1, r0
	add	r2, r2, r0
	sub	r0, r3, r0
.LBB95_526:
	ldrb	r3, [r1], #1
	ldrb	r7, [r2], #1
	cmp	r3, r7
	bne	.LBB95_489
	subs	r0, r0, #1
	bne	.LBB95_526
.LBB95_528:
	ldr	r0, [sp, #184]
	cmp	r0, #0
	beq	.LBB95_489
	ldr	r0, .LCPI95_4
	cmp	r8, r0
	beq	.LBB95_532
.LBB95_530:
	ldrb	r1, [r8], #1
	ldrb	r2, [r0], #1
	cmp	r1, r2
	bne	.LBB95_489
	subs	r11, r11, #1
	bne	.LBB95_530
.LBB95_532:
	ldr	r3, [sp, #128]
	cmp	r3, #15
	bgt	.LBB95_537
	ldr	r2, [sp, #180]
	cmp	r3, #1
	blt	.LBB95_550
	mov	lr, #0
.LBB95_535:
	ldr	r0, [sp, #204]
	ldrb	r1, [r0, lr]
	cmp	r1, #46
	beq	.LBB95_545
	add	lr, lr, #1
	cmp	r3, lr
	bne	.LBB95_535
	b	.LBB95_550
.LBB95_537:
	mov	r0, #1
	add	r8, r0, r3, lsr #4
	mov	lr, #0
.LBB95_538:
	ldr	r11, [sp, #204]
	ldrb	r0, [r11, lr]!
	str	r0, [sp, #200]
	ldrb	r0, [r11, #15]
	str	r0, [sp, #184]
	sub	r1, r0, #46
	ldrb	r0, [r11, #14]
	rsbs	r2, r1, #0
	str	r0, [sp, #160]
	adc	r1, r1, r2
	sub	r2, r0, #46
	rsbs	r7, r2, #0
	ldrb	r0, [r11, #13]
	adc	r2, r2, r7
	ldrb	r12, [r11, #12]
	orr	r1, r2, r1, lsl #1
	sub	r2, r0, #46
	rsbs	r7, r2, #0
	str	r0, [sp, #168]
	adc	r2, r2, r7
	sub	r7, r12, #46
	rsbs	r6, r7, #0
	ldrb	r0, [r11, #11]
	adc	r7, r7, r6
	str	r0, [sp, #172]
	orr	r2, r7, r2, lsl #1
	ldrb	r10, [r11, #6]
	orr	r1, r2, r1, lsl #2
	sub	r2, r0, #46
	ldrb	r0, [r11, #10]
	rsbs	r7, r2, #0
	adc	r2, r2, r7
	str	r0, [sp, #120]
	sub	r6, r0, #46
	ldrb	r0, [r11, #9]
	rsbs	r4, r6, #0
	str	r0, [sp, #156]
	adc	r6, r6, r4
	ldrb	r9, [r11, #1]
	orr	r6, r6, r2, lsl #1
	sub	r2, r0, #46
	rsbs	r4, r2, #0
	adc	r4, r2, r4
	ldrb	r2, [r11, #8]
	sub	r3, r2, #46
	rsbs	r7, r3, #0
	adc	r3, r3, r7
	orr	r3, r3, r4, lsl #1
	orr	r3, r3, r6, lsl #2
	ldrb	r6, [r11, #2]
	orr	r0, r3, r1, lsl #4
	str	r0, [sp, #192]
	ldrb	r0, [r11, #7]
	str	r0, [sp, #164]
	sub	r1, r0, #46
	ldrb	r0, [r11, #5]
	rsbs	r3, r1, #0
	str	r0, [sp, #152]
	adc	r1, r1, r3
	sub	r3, r10, #46
	rsbs	r4, r3, #0
	adc	r3, r3, r4
	orr	r3, r3, r1, lsl #1
	sub	r1, r0, #46
	rsbs	r4, r1, #0
	ldrb	r0, [r11, #3]
	adc	r4, r1, r4
	ldrb	r1, [r11, #4]
	str	r0, [sp, #124]
	sub	r7, r1, #46
	rsbs	r5, r7, #0
	adc	r5, r7, r5
	orr	r4, r5, r4, lsl #1
	orr	r3, r4, r3, lsl #2
	sub	r4, r0, #46
	rsbs	r5, r4, #0
	ldr	r0, [sp, #200]
	adc	r4, r4, r5
	sub	r5, r6, #46
	rsbs	r7, r5, #0
	adc	r5, r5, r7
	mov	r11, r0
	orr	r4, r5, r4, lsl #1
	sub	r5, r0, #46
	rsbs	r7, r5, #0
	adc	r5, r5, r7
	sub	r7, r9, #46
	rsbs	r0, r7, #0
	adc	r0, r7, r0
	orr	r0, r5, r0, lsl #1
	orr	r0, r0, r4, lsl #2
	orr	r0, r0, r3, lsl #4
	ldr	r3, [sp, #192]
	and	r0, r0, #255
	orr	r0, r0, r3, lsl #8
	mov	r3, #255
	orr	r3, r3, #65280
	tst	r0, r3
	bne	.LBB95_543
	sub	r8, r8, #1
	add	lr, lr, #16
	cmp	r8, #1
	bgt	.LBB95_538
	ldr	r3, [sp, #128]
	mov	r5, #0
	ldr	r2, [sp, #180]
	mov	r1, #0
	cmp	lr, r3
	bge	.LBB95_551
.LBB95_541:
	ldr	r0, [sp, #204]
	ldrb	r0, [r0, lr]
	cmp	r0, #46
	beq	.LBB95_544
	add	lr, lr, #1
	cmp	r3, lr
	bne	.LBB95_541
	b	.LBB95_550
.LBB95_543:
	subs	r0, r11, #46
	ldr	r3, [sp, #160]
	mvnne	r0, #0
	cmp	r2, #46
	mvn	r2, #0
	ldr	r7, [sp, #184]
	moveq	r2, #8
	cmp	r0, r2
	movlo	r2, r0
	cmp	r1, #46
	mvn	r0, #0
	mvn	r1, #0
	moveq	r0, #4
	cmp	r12, #46
	moveq	r1, #12
	cmp	r0, r1
	movlo	r1, r0
	cmp	r2, r1
	movlo	r1, r2
	ldr	r2, [sp, #120]
	cmp	r6, #46
	mvn	r0, #0
	moveq	r0, #2
	cmp	r2, #46
	mvn	r2, #0
	moveq	r2, #10
	cmp	r0, r2
	movlo	r2, r0
	cmp	r10, #46
	mvn	r0, #0
	moveq	r0, #6
	cmp	r3, #46
	mvn	r3, #0
	moveq	r3, #14
	cmp	r0, r3
	movlo	r3, r0
	cmp	r2, r3
	movlo	r3, r2
	cmp	r1, r3
	movlo	r3, r1
	ldr	r1, [sp, #156]
	cmp	r9, #46
	mvn	r0, #0
	moveq	r0, #1
	cmp	r1, #46
	mvn	r2, #0
	ldr	r1, [sp, #168]
	moveq	r2, #9
	cmp	r0, r2
	movlo	r2, r0
	ldr	r0, [sp, #152]
	cmp	r0, #46
	mvn	r0, #0
	moveq	r0, #5
	cmp	r1, #46
	mvn	r1, #0
	moveq	r1, #13
	cmp	r0, r1
	movlo	r1, r0
	cmp	r2, r1
	ldr	r0, [sp, #124]
	movlo	r1, r2
	ldr	r2, [sp, #172]
	cmp	r0, #46
	mvn	r0, #0
	moveq	r0, #3
	cmp	r2, #46
	mvn	r2, #0
	moveq	r2, #11
	cmp	r0, r2
	movlo	r2, r0
	ldr	r0, [sp, #164]
	cmp	r0, #46
	mvn	r0, #0
	moveq	r0, #7
	cmp	r7, #46
	mvn	r7, #0
	moveq	r7, #15
	cmp	r0, r7
	movlo	r7, r0
	cmp	r2, r7
	movlo	r7, r2
	cmp	r1, r7
	movlo	r7, r1
	cmp	r3, r7
	movlo	r7, r3
	and	r0, r7, #255
	ldr	r3, [sp, #128]
	add	lr, r0, lr
	ldr	r2, [sp, #180]
.LBB95_544:
	cmn	lr, #1
	beq	.LBB95_550
.LBB95_545:
	cmp	lr, #0
	bmi	.LBB95_643
	cmp	lr, r3
	bgt	.LBB95_643
	add	r2, lr, #1
	cmn	lr, #-2147483647
	beq	.LBB95_642
	cmp	r3, r2
	blt	.LBB95_642
	ldr	r0, [sp, #204]
	sub	r1, r3, r2
	add	r5, r0, r2
	ldr	r2, [sp, #180]
	b	.LBB95_551
.LBB95_550:
	mov	r5, #0
	mov	r1, #0
.LBB95_551:
	ldr	r0, [sp, #176]
	cmp	r1, #0
	movne	r2, r1
	moveq	r5, r0
	cmp	r2, #0
	beq	.LBB95_489
	ldr	r12, [sp, #212]
	cmp	r2, #2
	blt	.LBB95_556
	ldrb	r0, [r5]
	cmp	r0, #43
	beq	.LBB95_559
	cmp	r0, #45
	bne	.LBB95_560
	mov	r0, #0
	sub	r6, r2, #1
	add	r5, r5, #1
	b	.LBB95_561
.LBB95_556:
	mov	r4, #0
	mov	r6, #1
	cmp	r2, #1
	bne	.LBB95_558
	mov	r8, #10
	mov	r0, #1
	str	r0, [sp, #204]
	b	.LBB95_571
.LBB95_558:
	mov	r11, #0
	mov	r10, #0
	b	.LBB95_591
.LBB95_559:
	sub	r6, r2, #1
	add	r5, r5, #1
	mov	r0, #1
	b	.LBB95_561
.LBB95_560:
	mov	r0, #1
	mov	r6, r2
.LBB95_561:
	str	r0, [sp, #204]
	mov	r4, #0
	mov	r8, #10
	cmp	r6, #3
	blo	.LBB95_571
	ldrb	r0, [r5]
	cmp	r0, #48
	bne	.LBB95_571
	ldrb	r0, [r5, #1]
	sub	r0, r0, #98
	cmp	r0, #24
	bhi	.LBB95_571
	adr	r1, .LJTI95_0
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI95_0:
	.long	.LBB95_566
	.long	.LBB95_571
	.long	.LBB95_568
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_567
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_571
	.long	.LBB95_569
	.long	.LBB95_571
	.long	.LBB95_570
.LBB95_566:
	sub	r6, r6, #2
	add	r5, r5, #2
	mov	r8, #2
	b	.LBB95_571
.LBB95_567:
	sub	r6, r6, #2
	add	r5, r5, #2
	mov	r8, #8
	b	.LBB95_571
.LBB95_568:
	sub	r6, r6, #2
	add	r5, r5, #2
	b	.LBB95_571
.LBB95_569:
	sub	r6, r6, #2
	add	r5, r5, #2
	mov	r8, #16
	b	.LBB95_571
.LBB95_570:
	sub	r6, r6, #2
	add	r5, r5, #2
	mov	r8, #12
.LBB95_571:
	mov	r9, #0
	mov	r11, #0
	mov	r0, #0
	mov	r7, #0
	str	r4, [sp, #200]
.LBB95_572:
	add	r4, sp, #496
	mov	r10, r0
.LBB95_573:
	mov	r0, #0
	add	r1, r5, r7
	sub	r2, r6, r7
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	mov	r0, r4
	bl	"runtime::string_decode_rune"
	ldr	r1, [sp, #500]
	ldr	r0, [sp, #496]
	add	r7, r1, r7
	cmp	r0, #95
	bne	.LBB95_575
	add	r10, r10, #1
	cmp	r7, r6
	blt	.LBB95_573
	b	.LBB95_590
.LBB95_575:
	ldr	r12, [sp, #212]
	sub	r1, r0, #48
	ldr	r4, [sp, #200]
	cmp	r1, #10
	blo	.LBB95_579
	sub	r1, r0, #97
	cmp	r1, #26
	bhs	.LBB95_578
	sub	r1, r0, #87
	b	.LBB95_579
.LBB95_578:
	sub	r1, r0, #65
	cmp	r1, #26
	mov	r1, #16
	sublo	r1, r0, #55
.LBB95_579:
	subs	r0, r1, r8
	rscs	r0, r4, r1, asr #31
	bge	.LBB95_582
	umull	r0, r2, r9, r8
	mla	r3, r9, r4, r2
	adds	r9, r0, r1
	add	r0, r10, #1
	mla	r2, r11, r8, r3
	adc	r11, r2, r1, asr #31
	cmp	r7, r6
	blt	.LBB95_572
	add	r10, r10, #1
.LBB95_582:
	mov	r2, r6
	ldr	r6, [sp, #204]
	mov	r4, r9
	b	.LBB95_591
	.p2align	2
.LCPI95_52:
	.long	".Lcsbs$POC-Example$e5"
	.p2align	2
.LCPI95_53:
	.long	".Lcsbs$POC-Example$8f"
	.p2align	2
.LCPI95_54:
	.long	".Lcsbs$POC-Example$e6"
	.p2align	2
.LCPI95_55:
	.long	".Lcsbs$POC-Example$ea"
	.p2align	2
.LCPI95_56:
	.long	".Lcsbs$POC-Example$eb"
	.p2align	2
.LCPI95_57:
	.long	".Lcsbs$POC-Example$e7"
	.p2align	2
.LCPI95_58:
	.long	".Lcsbs$POC-Example$e8"
	.p2align	2
.LBB95_590:
	mov	r2, r6
	ldr	r6, [sp, #204]
	mov	r4, r9
	ldr	r12, [sp, #212]
.LBB95_591:
	cmp	r10, #0
	bmi	.LBB95_641
	cmp	r10, r2
	bgt	.LBB95_641
	rsbs	r0, r4, #0
	ldr	r9, [sp, #196]
	rsc	r1, r11, #0
	cmp	r6, #0
	movne	r0, r4
	movne	r1, r11
	cmp	r2, r10
	bne	.LBB95_489
	ldr	r2, [sp, #92]
	eor	r0, r0, r2
	ldr	r2, [sp, #88]
	eor	r1, r1, r2
	orrs	r0, r0, r1
	bne	.LBB95_489
	ldr	r5, [r12, #40]
	add	r6, r12, #84
	ldr	r2, [r12, #44]
	cmp	r5, #0
	beq	.LBB95_615
	mov	r0, #0
	ldr	r3, .LCPI95_17
	str	r0, [sp, #504]
	mov	r1, r2
	str	r0, [sp, #500]
	mov	r2, #4
	str	r0, [sp, #496]
	mov	r4, r12
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #12
	ldr	r7, [sp, #208]
	str	r0, [sp]
	add	r0, sp, #496
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [r4, #40]
	ldr	r2, [r4, #44]
	ldr	r0, [r4, #84]
	ldr	r3, [sp, #496]
	add	r0, r0, r3
	str	r0, [r4, #84]
	b	.LBB95_616
	.p2align	2
.LCPI95_59:
	.long	".Lcsbs$POC-Example$e9"
	.p2align	2
.LCPI95_60:
	.long	".Lcsbs$POC-Example$ec"
	.p2align	2
.LCPI95_61:
	.long	".Lcsbs$POC-Example$ed"
	.p2align	2
.LCPI95_62:
	.long	".Lcsbs$POC-Example$ee"
	.p2align	2
.LCPI95_63:
	.long	".Lcsbs$POC-Example$ef"
	.p2align	2
.LBB95_602:
	ldr	r5, [r12, #40]
	cmp	lr, #0
	ldr	r1, [r12, #44]
	beq	.LBB95_606
	ldr	r4, [sp, #208]
	cmp	r5, #0
	beq	.LBB95_284
	mov	r6, #0
	add	r0, sp, #496
	str	r6, [sp, #504]
	mov	r2, #4
	str	r6, [sp, #500]
	str	r6, [sp, #496]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r4, [sp, #20]
	str	lr, [sp]
	ldr	r3, [sp, #116]
	mov	lr, pc
	mov	pc, r5
	ldr	r7, [sp, #212]
	ldr	r2, [sp, #496]
	ldr	r5, [r7, #40]
	ldr	r1, [r7, #44]
	ldr	r0, [r7, #84]
	cmp	r5, #0
	add	r0, r0, r2
	str	r0, [r7, #84]
	beq	.LBB95_284
	mov	r0, #2
	ldr	r3, .LCPI95_21
	str	r6, [sp, #504]
	mov	r2, #4
	str	r6, [sp, #500]
	str	r6, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r4, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r7, #84]
	ldr	r1, [sp, #496]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB95_284
.LBB95_606:
	ldr	r2, [sp, #208]
	cmp	r5, #0
	beq	.LBB95_284
	mov	r0, #0
	ldr	r3, .LCPI95_22
	str	r0, [sp, #504]
	mov	r4, r12
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #12
	str	r0, [sp]
	add	r0, sp, #496
	str	r2, [sp, #20]
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #496]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB95_284
.LBB95_608:
	ldr	r7, [r4, #40]
	cmp	r7, #0
	beq	.LBB95_613
	mov	r5, #0
	ldr	r1, [r4, #44]
	mov	r0, #12
	ldr	r3, .LCPI95_17
	str	r5, [sp, #504]
	mov	r2, #4
	str	r5, [sp, #500]
	mov	r8, r12
	str	r5, [sp, #496]
	str	r0, [sp]
	add	r0, sp, #496
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r12, [sp, #20]
	mov	lr, pc
	mov	pc, r7
	ldr	r4, [sp, #212]
	mov	r12, r8
	ldr	r9, [sp, #196]
	ldr	r6, [sp, #188]
	ldr	r7, [r4, #40]
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #84]
	cmp	r7, #0
	ldr	r2, [sp, #496]
	add	r0, r0, r2
	str	r0, [r4, #84]
	beq	.LBB95_614
	str	r5, [sp, #504]
	mov	r2, #4
	str	r5, [sp, #500]
	str	r5, [sp, #496]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r12, [sp, #20]
	ldr	r0, [sp, #92]
	ldr	r3, .LCPI95_5
	tst	r0, #255
	mov	r0, #4
	moveq	r0, #5
	str	r0, [sp]
	ldr	r0, .LCPI95_14
	moveq	r3, r0
	add	r0, sp, #496
	mov	lr, pc
	mov	pc, r7
	ldr	r4, [sp, #212]
	mov	r12, r8
	ldr	r2, [sp, #496]
	ldr	r5, [r4, #40]
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #84]
	cmp	r5, #0
	add	r0, r0, r2
	str	r0, [r4, #84]
	beq	.LBB95_614
	mov	r0, #0
	ldr	r3, .LCPI95_18
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	str	r0, [sp]
	add	r0, sp, #496
	str	r12, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r4, [sp, #212]
	mov	r12, r8
	ldr	r1, [sp, #496]
	ldr	r0, [r4, #84]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB95_614
.LBB95_612:
	ldr	r9, [sp, #196]
	add	r7, sp, #360
	ldr	r10, [sp, #112]
	b	.LBB95_619
.LBB95_613:
	ldr	r9, [sp, #196]
	ldr	r6, [sp, #188]
.LBB95_614:
	ldr	r10, [sp, #108]
	add	r7, sp, #240
	b	.LBB95_619
.LBB95_615:
	mov	r1, #0
	mov	r4, r12
	ldr	r7, [sp, #208]
.LBB95_616:
	ldr	r0, [sp, #92]
	mov	r8, r7
	str	r0, [sp]
	ldr	r0, [sp, #88]
	str	r7, [sp, #12]
	stmib	sp, {r0, r6}
	add	r0, sp, #304
	bl	"io::write_i64"
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB95_618
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #504]
	mov	r2, #4
	str	r0, [sp, #500]
	str	r0, [sp, #496]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	ldr	r3, .LCPI95_18
	str	r0, [sp]
	add	r0, sp, #496
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r4, [sp, #212]
	ldr	r0, [r6]
	ldr	r1, [sp, #496]
	add	r0, r0, r1
	str	r0, [r6]
.LBB95_618:
	ldr	r10, [sp, #104]
	add	r7, sp, #288
	ldr	r6, [sp, #188]
	mov	r12, r8
.LBB95_619:
	ldr	r1, [sp, #96]
	mov	r0, #0
	ldr	r2, [sp, #144]
	str	r0, [r7, #4]
	mov	r3, r12
	ldr	r0, [r9]
	str	r6, [r7]
	ldr	r0, [r0, r1, lsl #2]
	ldr	r1, [r0, #16]
	ldr	r0, [r0, #20]
	str	r1, [r10]
	mov	r1, r7
	str	r0, [r10, #4]
	mov	r0, r4
	bl	"fmt::fmt_arg"
	b	.LBB95_284
.LBB95_620:
	add	r0, r0, #24
	str	r0, [sp, #16]
	ldr	r0, .LCPI95_30
	mov	r2, #220
	str	r0, [sp, #12]
	ldr	r0, .LCPI95_31
	str	r0, [sp, #8]
	ldr	r0, .LCPI95_27
	str	r0, [sp, #4]
	ldr	r0, .LCPI95_28
	str	r0, [sp]
	ldr	r0, .LCPI95_2
	str	r8, [sp, #20]
	b	.LBB95_622
.LBB95_621:
	add	r0, r0, #24
	str	r0, [sp, #16]
	ldr	r0, .LCPI95_25
	mov	r2, #229
	str	r0, [sp, #12]
	ldr	r0, .LCPI95_26
	str	r0, [sp, #8]
	ldr	r0, .LCPI95_27
	str	r0, [sp, #4]
	ldr	r0, .LCPI95_28
	str	r0, [sp]
	str	r8, [sp, #20]
	ldr	r0, .LCPI95_2
.LBB95_622:
	orr	r2, r2, #2048
	mov	r1, #43
	mov	r3, #10
	bl	"runtime::type_assertion_check2_with_context.handle_error-0"
.LBB95_623:
	mov	r2, #143
	ldr	r0, .LCPI95_2
	orr	r2, r2, #768
	mov	r1, #43
	mov	r3, #10
	str	r12, [sp]
	str	r12, [sp, #4]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB95_624:
	mov	r0, #0
	str	r1, [sp, #8]
	stm	sp, {r0, lr}
	b	.LBB95_636
.LBB95_625:
	str	lr, [sp]
	stmib	sp, {r0, r1}
	b	.LBB95_639
.LBB95_626:
	mov	r2, #308
	ldr	r0, .LCPI95_2
	orr	r2, r2, #2048
	mov	r1, #43
	mov	r3, #28
	str	r8, [sp]
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB95_627:
	str	r2, [sp]
	stmib	sp, {r1, r12}
	b	.LBB95_639
.LBB95_628:
	mov	r0, #0
	stm	sp, {r0, r2, r12}
	b	.LBB95_636
.LBB95_629:
	ldr	r0, [sp, #124]
	mov	r1, #43
	str	r0, [sp]
	mov	r2, #2080
	ldr	r0, .LCPI95_2
	mov	r3, #22
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB95_630:
	mov	r0, #0
	stm	sp, {r0, r9}
	b	.LBB95_635
.LBB95_631:
	str	r9, [sp]
	b	.LBB95_638
.LBB95_632:
	mov	r2, #233
	ldr	r0, .LCPI95_2
	orr	r2, r2, #1792
	stm	sp, {r1, r12}
	mov	r1, #43
	mov	r3, #28
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB95_633:
	mov	r2, #1012
	ldr	r0, .LCPI95_2
	orr	r2, r2, #1024
	stm	sp, {r1, r12}
	mov	r1, #43
	mov	r3, #29
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB95_634:
	mov	r0, #0
	stm	sp, {r0, r8}
.LBB95_635:
	str	r2, [sp, #8]
.LBB95_636:
	mov	r2, #222
	ldr	r0, .LCPI95_19
	orr	r2, r2, #2816
	mov	r1, #51
	mov	r3, #12
	bl	"runtime::slice_handle_error"
.LBB95_637:
	str	r8, [sp]
.LBB95_638:
	stmib	sp, {r1, r2}
.LBB95_639:
	mov	r2, #223
	ldr	r0, .LCPI95_19
	orr	r2, r2, #2816
	mov	r1, #51
	mov	r3, #13
	bl	"runtime::slice_handle_error"
.LBB95_640:
	mov	r2, #247
	ldr	r0, .LCPI95_2
	orr	r2, r2, #1792
	stm	sp, {r1, r12}
	mov	r1, #43
	mov	r3, #42
	str	r12, [sp, #8]
	bl	"runtime::slice_handle_error"
.LBB95_641:
	ldr	r0, .LCPI95_20
	mov	r1, #51
	str	r2, [sp, #4]
	mov	r3, #7
	str	r2, [sp, #8]
	mov	r2, #191
	str	r10, [sp]
	bl	"runtime::slice_handle_error"
.LBB95_642:
	str	lr, [sp]
	b	.LBB95_647
.LBB95_643:
	mov	r0, #0
	str	r3, [sp, #8]
	stm	sp, {r0, lr}
	b	.LBB95_636
.LBB95_644:
	ldr	r0, [sp, #92]
	mov	r2, #63
	b	.LBB95_649
.LBB95_645:
	mov	r1, #0
	str	r3, [sp, #8]
	stm	sp, {r1, r10}
	b	.LBB95_636
.LBB95_646:
	str	r10, [sp]
.LBB95_647:
	stmib	sp, {r2, r3}
	b	.LBB95_639
.LBB95_648:
	ldr	r0, [sp, #112]
	mov	r2, #89
.LBB95_649:
	str	r0, [sp]
	ldr	r0, .LCPI95_2
	orr	r2, r2, #2048
	mov	r1, #43
	mov	r3, #30
	bl	"runtime::multi_pointer_slice_handle_error"
	.p2align	2
.LCPI95_2:
	.long	".Lcsbs$POC-Example$156"
.LCPI95_4:
	.long	".Lcsbs$POC-Example$18c"
.LCPI95_5:
	.long	".Lcsbs$POC-Example$e7"
.LCPI95_14:
	.long	".Lcsbs$POC-Example$ed"
.LCPI95_17:
	.long	".Lcsbs$POC-Example$18e"
.LCPI95_18:
	.long	".Lcsbs$POC-Example$141"
.LCPI95_19:
	.long	".Lcsbs$POC-Example$16e"
.LCPI95_20:
	.long	".Lcsbs$POC-Example$107"
.LCPI95_21:
	.long	".Lcsbs$POC-Example$192"
.LCPI95_22:
	.long	".Lcsbs$POC-Example$191"
.LCPI95_25:
	.long	863217229
.LCPI95_26:
	.long	4290932178
.LCPI95_27:
	.long	761227683
.LCPI95_28:
	.long	396265691
.LCPI95_30:
	.long	3200005506
.LCPI95_31:
	.long	432374780
.Lfunc_end95:
	.size	"fmt::fmt_struct", .Lfunc_end95-"fmt::fmt_struct"
	.fnend

	.p2align	2
	.type	"fmt::[fmt.odin]::search_nul_termination",%function
	.code	32
"fmt::[fmt.odin]::search_nul_termination":
	.fnstart
	cmp	r2, #0
	moveq	r0, #0
	moveq	pc, lr
.LBB96_1:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	add	r12, r0, #3
	mov	r3, r0
	mov	r0, #0
.LBB96_2:
	cmp	r1, #1
	blt	.LBB96_26
	cmp	r3, #0
	beq	.LBB96_26
	sub	r5, r1, #1
	cmp	r5, #7
	bhi	.LBB96_15
	adr	r4, .LJTI96_0
	ldr	pc, [r4, r5, lsl #2]
	.p2align	2
.LJTI96_0:
	.long	.LBB96_7
	.long	.LBB96_9
	.long	.LBB96_15
	.long	.LBB96_8
	.long	.LBB96_15
	.long	.LBB96_15
	.long	.LBB96_15
	.long	.LBB96_11
.LBB96_7:
	ldrb	r5, [r3]
	b	.LBB96_10
.LBB96_8:
	ldr	r5, [r3]
	b	.LBB96_10
.LBB96_9:
	ldrh	r5, [r3]
.LBB96_10:
	cmp	r5, #0
	bne	.LBB96_12
	b	.LBB96_26
.LBB96_11:
	ldr	r6, [r3]
	ldr	r5, [r3, #4]
	orrs	r6, r6, r5
	beq	.LBB96_26
.LBB96_12:
	add	r3, r3, r1
.LBB96_13:
	add	r12, r12, r1
	add	r0, r0, #1
	cmp	r2, #0
	bmi	.LBB96_2
	cmp	r0, r2
	blt	.LBB96_2
	b	.LBB96_26
.LBB96_15:
	add	r4, r3, #3
	add	lr, r3, r1
	bic	r4, r4, #3
	cmp	r4, r3
	bls	.LBB96_19
	bic	r5, r12, #3
.LBB96_17:
	ldrb	r6, [r3]
	cmp	r6, #0
	bne	.LBB96_25
	add	r3, r3, #1
	cmp	r5, r3
	bne	.LBB96_17
.LBB96_19:
	bic	r3, lr, #3
	cmp	r4, r3
	bhs	.LBB96_22
.LBB96_20:
	ldr	r5, [r4]
	cmp	r5, #0
	bne	.LBB96_25
	add	r4, r4, #4
	cmp	r4, r3
	blo	.LBB96_20
.LBB96_22:
	cmp	r3, lr
	beq	.LBB96_26
.LBB96_23:
	ldrb	r4, [r3]
	cmp	r4, #0
	bne	.LBB96_25
	add	r3, r3, #1
	cmp	r3, lr
	blo	.LBB96_23
	b	.LBB96_26
.LBB96_25:
	mov	r3, lr
	b	.LBB96_13
.LBB96_26:
	pop	{r4, r5, r6, lr}
	mov	pc, lr
.Lfunc_end96:
	.size	"fmt::[fmt.odin]::search_nul_termination", .Lfunc_end96-"fmt::[fmt.odin]::search_nul_termination"
	.cantunwind
	.fnend

	.p2align	2
	.type	"fmt::fmt_array_nul_terminated",%function
	.code	32
"fmt::fmt_array_nul_terminated":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#40
	sub	sp, sp, #40
	ldr	r8, [sp, #80]
	mov	r4, r0
	cmp	r1, #0
	beq	.LBB97_2
	mov	r0, r1
	mov	r5, r1
	mov	r1, r3
	ldr	r9, [sp, #76]
	ldr	r7, [sp, #72]
	mov	r6, r3
	bl	"fmt::[fmt.odin]::search_nul_termination"
	mov	r2, r0
	str	r7, [sp, #72]
	str	r9, [sp, #76]
	mov	r0, r4
	str	r8, [sp, #80]
	mov	r1, r5
	mov	r3, r6
	add	sp, sp, #40
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	b	"fmt::fmt_array"
.LBB97_2:
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB97_4
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #32]
	mov	r2, #4
	str	r0, [sp, #28]
	str	r0, [sp, #24]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #5
	ldr	r3, .LCPI97_0
	str	r0, [sp]
	add	r0, sp, #24
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #24]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB97_4:
	add	sp, sp, #40
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI97_0:
	.long	".Lcsbs$POC-Example$169"
.Lfunc_end97:
	.size	"fmt::fmt_array_nul_terminated", .Lfunc_end97-"fmt::fmt_array_nul_terminated"
	.fnend

	.p2align	2
	.type	"fmt::fmt_array",%function
	.code	32
"fmt::fmt_array":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#124
	sub	sp, sp, #124
	add	r10, sp, #160
	str	r3, [sp, #52]
	mov	r11, r1
	mov	r5, r2
	ldm	r10, {r1, r8, r10}
	mov	r4, r0
	cmp	r11, #0
	bne	.LBB98_4
	cmp	r5, #0
	ble	.LBB98_4
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB98_100
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #112]
	mov	r2, #4
	str	r0, [sp, #108]
	str	r0, [sp, #104]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	ldr	r3, .LCPI98_25
	str	r0, [sp]
	add	r0, sp, #104
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	b	.LBB98_100
.LBB98_4:
	cmp	r8, #112
	beq	.LBB98_66
	cmp	r8, #115
	add	r0, r1, #16
	cmpne	r8, #113
	str	r10, [sp, #60]
	str	r5, [sp, #56]
	bne	.LBB98_70
	ldr	r2, [r0, #48]
	ldr	r3, [r0, #52]
.LBB98_7:
	eor	r2, r2, #1
	orrs	r2, r2, r3
	bne	.LBB98_9
	ldr	r1, [r1, #32]
	ldr	r2, [r1, #64]
	ldr	r3, [r1, #68]
	b	.LBB98_7
.LBB98_9:
	ldr	r2, [r1, #16]
	ldr	r7, .LCPI98_1
	ldr	r1, [r1, #20]
	ldr	r3, .LCPI98_0
	subs	r7, r7, r2
	sbcs	r7, r3, r1
	blt	.LBB98_24
	ldr	r7, .LCPI98_11
	ldr	r3, .LCPI98_10
	subs	r7, r7, r2
	sbcs	r7, r3, r1
	blt	.LBB98_31
	ldr	r3, .LCPI98_15
	ldr	r7, .LCPI98_16
	eor	r3, r2, r3
	eor	r7, r1, r7
	orrs	r3, r3, r7
	beq	.LBB98_53
	ldr	r3, .LCPI98_17
	eor	r2, r2, r3
	ldr	r3, .LCPI98_18
	eor	r1, r1, r3
	orrs	r1, r2, r1
	bne	.LBB98_65
	cmn	r5, #1
	ble	.LBB98_107
	cmp	r5, #1
	blt	.LBB98_100
	ldr	r9, .LCPI98_20
	add	r7, r4, #84
	add	r8, sp, #104
	mov	r6, #0
	b	.LBB98_18
.LBB98_16:
	mov	r3, r0
.LBB98_17:
	ldr	r1, [r4, #40]
	mov	r0, r8
	ldr	r2, [r4, #44]
	stm	sp, {r7, r10}
	bl	"io::write_rune"
	ldr	r5, [sp, #56]
	add	r6, r6, #1
	cmp	r6, r5
	bge	.LBB98_100
.LBB98_18:
	cmp	r6, r5
	bhs	.LBB98_101
	add	r0, r11, r6, lsl #1
	ldrh	r0, [r0]
	sub	r1, r0, #57344
	cmn	r1, #2048
	blo	.LBB98_16
	mov	r3, #253
	lsr	r1, r0, #10
	orr	r3, r3, #65280
	cmp	r1, #54
	bhi	.LBB98_17
	ldr	r2, [sp, #56]
	add	r1, r6, #1
	cmp	r1, r2
	bge	.LBB98_17
	bhs	.LBB98_104
	add	r2, r11, r1, lsl #1
	ldrh	r2, [r2]
	and	r5, r2, #64512
	cmp	r5, #56320
	addeq	r0, r2, r0, lsl #10
	moveq	r6, r1
	addeq	r3, r0, r9
	b	.LBB98_17
.LBB98_24:
	ldr	r6, .LCPI98_3
	ldr	r7, .LCPI98_2
	subs	r6, r6, r2
	sbcs	r6, r7, r1
	blt	.LBB98_37
	ldr	r7, .LCPI98_7
	eor	r3, r1, r3
	eor	r7, r2, r7
	orrs	r3, r7, r3
	beq	.LBB98_57
	ldr	r3, .LCPI98_8
	eor	r2, r2, r3
	ldr	r3, .LCPI98_9
	eor	r1, r1, r3
	orrs	r1, r2, r1
	bne	.LBB98_65
	cmn	r5, #1
	ble	.LBB98_108
	cmp	r5, #1
	blt	.LBB98_100
	add	r7, r4, #84
	add	r6, sp, #104
.LBB98_30:
	ldr	r1, [r4, #40]
	mov	r0, r6
	ldr	r2, [r4, #44]
	ldr	r3, [r11], #4
	stm	sp, {r7, r10}
	bl	"io::write_rune"
	subs	r5, r5, #1
	bne	.LBB98_30
	b	.LBB98_100
.LBB98_31:
	ldr	r7, .LCPI98_12
	eor	r3, r1, r3
	eor	r7, r2, r7
	orrs	r3, r7, r3
	beq	.LBB98_61
	ldr	r3, .LCPI98_13
	eor	r2, r2, r3
	ldr	r3, .LCPI98_14
	eor	r1, r1, r3
	orrs	r1, r2, r1
	bne	.LBB98_65
	cmn	r5, #1
	ble	.LBB98_109
	cmp	r5, #1
	blt	.LBB98_100
	add	r7, r4, #84
	add	r6, sp, #104
.LBB98_36:
	ldr	r1, [r4, #40]
	mov	r0, r6
	ldr	r2, [r4, #44]
	ldr	r3, [r11], #4
	stm	sp, {r7, r10}
	bl	"io::write_rune"
	subs	r5, r5, #1
	bne	.LBB98_36
	b	.LBB98_100
.LBB98_37:
	ldr	r3, .LCPI98_4
	eor	r7, r1, r7
	eor	r3, r2, r3
	orrs	r3, r3, r7
	beq	.LBB98_63
	ldr	r3, .LCPI98_5
	eor	r2, r2, r3
	ldr	r3, .LCPI98_6
	eor	r1, r1, r3
	orrs	r1, r2, r1
	bne	.LBB98_65
	cmn	r5, #1
	ble	.LBB98_110
	cmp	r5, #1
	blt	.LBB98_100
	mov	r6, #255
	mov	r9, #211812352
	mov	r10, #253
	mov	r0, r5
	add	r5, r4, #84
	orr	r6, r6, #65280
	add	r8, sp, #104
	orr	r9, r9, #-268435456
	orr	r10, r10, #65280
	mov	r7, #0
	b	.LBB98_44
.LBB98_42:
	mov	r3, r1
.LBB98_43:
	ldr	r1, [r4, #40]
	ldr	r2, [r4, #44]
	str	r5, [sp]
	ldr	r0, [sp, #60]
	str	r0, [sp, #4]
	mov	r0, r8
	bl	"io::write_rune"
	ldr	r0, [sp, #56]
	add	r7, r7, #1
	cmp	r7, r0
	bge	.LBB98_100
.LBB98_44:
	cmp	r7, r0
	bhs	.LBB98_102
	add	r0, r11, r7, lsl #1
	ldrh	r0, [r0]
	lsl	r1, r0, #8
	orr	r0, r1, r0, lsr #8
	add	r1, r0, #8192
	and	r1, r1, r6
	lsr	r1, r1, #11
	cmp	r1, #30
	and	r1, r0, r6
	bls	.LBB98_42
	lsr	r0, r1, #10
	cmp	r0, #54
	bhi	.LBB98_52
	ldr	r2, [sp, #56]
	add	r0, r7, #1
	cmp	r0, r2
	bge	.LBB98_52
	bhs	.LBB98_105
	add	r2, r11, r0, lsl #1
	ldrh	r2, [r2]
	and	r3, r2, #255
	cmp	r3, #220
	blo	.LBB98_52
	and	r3, r2, #224
	cmp	r3, #224
	mov	r3, r10
	beq	.LBB98_43
	lsl	r3, r2, #8
	orr	r2, r3, r2, lsr #8
	and	r3, r2, r6
	and	r2, r2, #64512
	add	r1, r9, r1, lsl #10
	sub	r3, r3, #56320
	orr	r1, r3, r1
	cmp	r2, #56320
	mov	r3, r10
	mov	r7, r0
	addeq	r3, r1, #65536
	b	.LBB98_43
.LBB98_52:
	mov	r3, r10
	b	.LBB98_43
.LBB98_53:
	cmn	r5, #1
	ble	.LBB98_111
	cmp	r5, #1
	blt	.LBB98_100
	add	r7, r4, #84
	add	r6, sp, #104
.LBB98_56:
	ldr	r1, [r4, #40]
	mov	r0, r6
	ldr	r2, [r4, #44]
	ldr	r3, [r11], #4
	stm	sp, {r7, r10}
	bl	"io::write_rune"
	subs	r5, r5, #1
	bne	.LBB98_56
	b	.LBB98_100
.LBB98_57:
	cmn	r5, #1
	ble	.LBB98_112
	cmp	r5, #1
	blt	.LBB98_100
	add	r6, r4, #84
	add	r9, sp, #104
	mov	r8, #65280
.LBB98_60:
	ldr	r0, [r11], #4
	ldr	r1, [r4, #40]
	and	r7, r0, #65280
	ldr	r2, [r4, #44]
	and	r3, r8, r0, lsr #8
	stm	sp, {r6, r10}
	orr	r3, r3, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r7, lsl #8
	orr	r3, r0, r3
	mov	r0, r9
	bl	"io::write_rune"
	subs	r5, r5, #1
	bne	.LBB98_60
	b	.LBB98_100
.LBB98_61:
	cmn	r5, #1
	ble	.LBB98_116
	str	r10, [sp, #160]
	mov	r0, r4
	mov	r1, r11
	mov	r2, r5
	mov	r3, r8
	add	sp, sp, #124
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_string"
.LBB98_63:
	cmn	r5, #1
	ble	.LBB98_117
	str	r10, [sp, #160]
	mov	r0, r4
	mov	r1, r11
	mov	r2, r5
	mov	r3, r8
	add	sp, sp, #124
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_string16"
.LBB98_65:
	cmp	r8, #112
	bne	.LBB98_70
.LBB98_66:
	ldrb	r0, [r4, #4]
	cmp	r0, #0
	bne	.LBB98_69
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB98_69
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #112]
	mov	r2, #4
	str	r0, [sp, #108]
	str	r0, [sp, #104]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	ldr	r3, .LCPI98_21
	str	r0, [sp]
	add	r0, sp, #104
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #104]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB98_69:
	mov	r0, #17
	mov	r2, r11
	str	r0, [sp, #16]
	mov	r3, #0
	ldr	r0, .LCPI98_22
	str	r0, [sp, #12]
	mov	r0, #32
	str	r0, [sp, #8]
	mov	r0, #0
	str	r0, [sp, #4]
	mov	r0, #16
	str	r0, [sp]
	mov	r0, r4
	str	r10, [sp, #20]
	bl	"fmt::_fmt_int"
	b	.LBB98_100
.LBB98_70:
	ldr	r1, [r0]
	mov	r2, #91
	str	r1, [sp, #44]
	cmp	r8, #119
	ldr	r6, [r4, #40]
	moveq	r2, #123
	ldr	r1, [r4, #44]
	ldr	r0, [r0, #4]
	cmp	r6, #0
	str	r0, [sp, #40]
	strb	r2, [sp, #103]
	beq	.LBB98_72
	mov	r0, #0
	add	r3, sp, #103
	str	r0, [sp, #112]
	mov	r2, #4
	str	r0, [sp, #108]
	str	r0, [sp, #104]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #104
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #104]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB98_72:
	cmp	r5, #0
	ble	.LBB98_90
	ldr	r0, [r4, #68]
	str	r8, [sp, #48]
	add	r0, r0, #1
	str	r0, [r4, #68]
	ldrb	r0, [r4, #4]
	cmp	r0, #0
	beq	.LBB98_92
	ldr	r5, [r4, #40]
	mov	r0, #10
	ldr	r1, [r4, #44]
	cmp	r5, #0
	str	r11, [sp, #36]
	strb	r0, [sp, #103]
	beq	.LBB98_76
	mov	r0, #0
	add	r3, sp, #103
	str	r0, [sp, #112]
	mov	r2, #4
	str	r0, [sp, #108]
	str	r0, [sp, #104]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #104
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #104]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB98_76:
	ldr	r0, [r4, #20]
	add	r9, sp, #103
	str	r0, [sp, #28]
	add	r10, sp, #104
	add	r0, r0, #1
	str	r0, [r4, #20]
	add	r0, sp, #80
	mov	r11, #0
	mov	r7, #9
	mov	r8, #0
	add	r0, r0, #8
	str	r0, [sp, #32]
	b	.LBB98_78
.LBB98_77:
	ldr	r0, [sp, #56]
	add	r8, r8, #1
	cmp	r8, r0
	beq	.LBB98_85
.LBB98_78:
	ldr	r0, [r4, #20]
	cmp	r0, #1
	blt	.LBB98_83
	mov	r5, #0
	b	.LBB98_81
.LBB98_80:
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB98_83
.LBB98_81:
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r7, [sp, #103]
	beq	.LBB98_80
	str	r11, [sp, #112]
	mov	r2, #4
	str	r11, [sp, #108]
	mov	r3, r9
	str	r11, [sp, #104]
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	ldr	r0, [sp, #60]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	mov	r0, r10
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #104]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB98_80
.LBB98_83:
	ldr	r1, [sp, #32]
	ldr	r2, [sp, #52]
	ldr	r0, [sp, #44]
	str	r0, [r1]
	ldr	r0, [sp, #40]
	str	r0, [r1, #4]
	ldr	r1, [sp, #36]
	mla	r0, r8, r2, r1
	ldr	r6, [sp, #60]
	ldr	r2, [sp, #48]
	add	r1, sp, #80
	str	r11, [sp, #84]
	str	r0, [sp, #80]
	mov	r0, r4
	mov	r3, r6
	bl	"fmt::fmt_arg"
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB98_77
	ldr	r1, [r4, #44]
	mov	r0, #2
	ldr	r3, .LCPI98_23
	mov	r2, #4
	str	r11, [sp, #112]
	str	r11, [sp, #108]
	str	r11, [sp, #104]
	str	r0, [sp]
	mov	r0, r10
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #104]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB98_77
.LBB98_85:
	ldr	r0, [sp, #28]
	str	r0, [r4, #20]
	cmp	r0, #1
	blt	.LBB98_97
	add	r9, sp, #103
	add	r10, sp, #104
	mov	r8, #1
	mov	r6, #0
	mov	r11, #9
	mov	r5, #0
	b	.LBB98_88
.LBB98_87:
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB98_97
.LBB98_88:
	ldr	r7, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r7, #0
	strb	r11, [sp, #103]
	beq	.LBB98_87
	str	r6, [sp, #112]
	mov	r2, #4
	str	r6, [sp, #108]
	mov	r3, r9
	str	r6, [sp, #104]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	ldr	r0, [sp, #60]
	str	r0, [sp, #20]
	mov	r0, r10
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #104]
	add	r0, r0, r1
	str	r0, [r4, #84]
	mov	r0, r2
	b	.LBB98_87
.LBB98_90:
	ldr	r5, [r4, #40]
	mov	r0, #93
	ldr	r1, [r4, #44]
	cmp	r8, #119
	moveq	r0, #125
	cmp	r5, #0
	strb	r0, [sp, #103]
	beq	.LBB98_100
	mov	r0, #0
	str	r0, [sp, #112]
	str	r0, [sp, #108]
	str	r0, [sp, #104]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	str	r10, [sp, #20]
	b	.LBB98_99
.LBB98_92:
	ldr	r0, [sp, #44]
	mov	r2, r8
	add	r8, sp, #64
	str	r0, [sp, #72]
	ldr	r0, [sp, #40]
	mov	r9, r11
	mov	r11, #0
	str	r0, [sp, #76]
	mov	r0, r4
	mov	r1, r8
	mov	r3, r10
	str	r11, [sp, #68]
	str	r9, [sp, #64]
	bl	"fmt::fmt_arg"
	subs	r6, r5, #1
	beq	.LBB98_97
	ldr	r0, [sp, #52]
	add	r7, r8, #8
	ldr	r8, [sp, #60]
	add	r10, r0, r9
	add	r9, sp, #64
	b	.LBB98_95
.LBB98_94:
	ldr	r0, [sp, #44]
	mov	r1, r9
	ldr	r2, [sp, #48]
	mov	r3, r8
	str	r0, [r7]
	ldr	r0, [sp, #40]
	str	r0, [r7, #4]
	mov	r0, r4
	str	r11, [sp, #68]
	str	r10, [sp, #64]
	bl	"fmt::fmt_arg"
	ldr	r0, [sp, #52]
	subs	r6, r6, #1
	add	r10, r10, r0
	beq	.LBB98_97
.LBB98_95:
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB98_94
	ldr	r1, [r4, #44]
	mov	r0, #2
	ldr	r3, .LCPI98_24
	mov	r2, #4
	str	r11, [sp, #112]
	str	r11, [sp, #108]
	str	r11, [sp, #104]
	str	r0, [sp]
	add	r0, sp, #104
	str	r11, [sp, #8]
	str	r11, [sp, #12]
	str	r11, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #104]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB98_94
.LBB98_97:
	ldr	r0, [r4, #68]
	ldr	r2, [sp, #48]
	sub	r0, r0, #1
	ldr	r5, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r2, #119
	str	r0, [r4, #68]
	mov	r0, #93
	moveq	r0, #125
	cmp	r5, #0
	strb	r0, [sp, #103]
	beq	.LBB98_100
	mov	r0, #0
	str	r0, [sp, #112]
	str	r0, [sp, #108]
	str	r0, [sp, #104]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #60]
	str	r0, [sp, #20]
.LBB98_99:
	mov	r0, #1
	add	r3, sp, #103
	str	r0, [sp]
	add	r0, sp, #104
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #104]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB98_100:
	add	sp, sp, #124
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB98_101:
	str	r6, [sp]
	b	.LBB98_103
.LBB98_102:
	str	r7, [sp]
.LBB98_103:
	ldr	r0, [sp, #56]
	mov	r2, #159
	str	r0, [sp, #4]
	orr	r2, r2, #2304
	ldr	r0, .LCPI98_19
	mov	r1, #43
	mov	r3, #19
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB98_104:
	str	r1, [sp]
	b	.LBB98_106
.LBB98_105:
	str	r0, [sp]
.LBB98_106:
	ldr	r0, [sp, #56]
	mov	r2, #163
	str	r0, [sp, #4]
	orr	r2, r2, #2304
	ldr	r0, .LCPI98_19
	mov	r1, #43
	mov	r3, #18
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB98_107:
	ldr	r0, .LCPI98_19
	mov	r2, #183
	str	r5, [sp]
	b	.LBB98_114
.LBB98_108:
	mov	r2, #185
	ldr	r0, .LCPI98_19
	orr	r2, r2, #2304
	mov	r1, #43
	mov	r3, #45
	str	r5, [sp]
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB98_109:
	mov	r2, #444
	ldr	r0, .LCPI98_19
	orr	r2, r2, #2048
	mov	r1, #43
	mov	r3, #46
	str	r5, [sp]
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB98_110:
	mov	r2, #440
	str	r5, [sp]
	ldr	r0, .LCPI98_19
	orr	r2, r2, #2048
	b	.LBB98_115
.LBB98_111:
	str	r5, [sp]
	mov	r2, #186
	b	.LBB98_113
.LBB98_112:
	str	r5, [sp]
	mov	r2, #187
.LBB98_113:
	ldr	r0, .LCPI98_19
.LBB98_114:
	orr	r2, r2, #2304
.LBB98_115:
	mov	r1, #43
	mov	r3, #47
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB98_116:
	ldr	r0, .LCPI98_19
	mov	r2, #181
	str	r5, [sp]
	b	.LBB98_118
.LBB98_117:
	str	r5, [sp]
	mov	r2, #182
	ldr	r0, .LCPI98_19
.LBB98_118:
	orr	r2, r2, #2304
	mov	r1, #43
	mov	r3, #56
	bl	"runtime::multi_pointer_slice_handle_error"
	.p2align	2
.LCPI98_0:
	.long	1201977439
.LCPI98_1:
	.long	2124771594
.LCPI98_2:
	.long	2078322779
.LCPI98_3:
	.long	4093975809
.LCPI98_4:
	.long	4093975810
.LCPI98_5:
	.long	2765151453
.LCPI98_6:
	.long	2083772720
.LCPI98_7:
	.long	2124771595
.LCPI98_8:
	.long	1680707819
.LCPI98_9:
	.long	1338159828
.LCPI98_10:
	.long	1032104133
.LCPI98_11:
	.long	3853066514
.LCPI98_12:
	.long	3853066515
.LCPI98_13:
	.long	586708279
.LCPI98_14:
	.long	1164085392
.LCPI98_15:
	.long	1315131624
.LCPI98_16:
	.long	3990515063
.LCPI98_17:
	.long	2573139160
.LCPI98_18:
	.long	502970347
.LCPI98_19:
	.long	".Lcsbs$POC-Example$156"
.LCPI98_20:
	.long	4238353408
.LCPI98_21:
	.long	".Lcsbs$POC-Example$17e"
.LCPI98_22:
	.long	".Lcsbs$POC-Example$4"
.LCPI98_23:
	.long	".Lcsbs$POC-Example$187"
.LCPI98_24:
	.long	".Lcsbs$POC-Example$130"
.LCPI98_25:
	.long	".Lcsbs$POC-Example$11c"
.Lfunc_end98:
	.size	"fmt::fmt_array", .Lfunc_end98-"fmt::fmt_array"
	.fnend

	.p2align	2
	.type	"fmt::fmt_named",%function
	.code	32
"fmt::fmt_named":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#244
	sub	sp, sp, #244
	ldr	r8, [sp, #280]
	mov	r10, r0
	ldr	r0, [r1]
	cmp	r2, #119
	ldr	r7, [r1, #4]
	ldr	r6, [r1, #8]
	ldr	r1, [r1, #12]
	str	r1, [sp, #108]
	str	r6, [sp, #104]
	str	r7, [sp, #100]
	str	r0, [sp, #96]
	bne	.LBB99_5
.LBB99_1:
	ldr	r0, [r3, #8]
	ldr	r1, [r0, #64]
	ldr	r6, [r0, #68]
	eor	r7, r1, #27
	orrs	r7, r7, r6
	add	r7, r0, #24
	beq	.LBB99_12
	eor	r5, r1, #23
	orrs	r5, r5, r6
	beq	.LBB99_11
	eor	r5, r1, #19
	orrs	r5, r5, r6
	bne	.LBB99_13
	ldm	r3, {r0, r1}
	mov	r3, r7
	stm	sp, {r0, r1, r8}
	add	r1, sp, #96
	mov	r0, r10
	bl	"fmt::fmt_struct"
	b	.LBB99_138
.LBB99_5:
	ldr	r6, .LCPI99_31
	ldr	r1, [sp, #108]
	ldr	r7, [sp, #104]
	ldr	r5, .LCPI99_32
	eor	r6, r1, r6
	ldr	r4, [sp, #96]
	eor	r5, r7, r5
	orrs	r6, r5, r6
	beq	.LBB99_20
	ldr	r6, .LCPI99_33
	ldr	r5, .LCPI99_34
	eor	r6, r7, r6
	eor	r5, r1, r5
	orrs	r6, r6, r5
	beq	.LBB99_18
	ldr	r6, .LCPI99_35
	eor	r7, r7, r6
	ldr	r6, .LCPI99_36
	eor	r1, r1, r6
	orrs	r1, r7, r1
	bne	.LBB99_1
	mov	r7, r10
	ldr	r10, [r4, #8]
	ldr	r6, [r7, #40]
	ldr	r9, [r4, #12]
	ldr	r11, [r7, #44]
	cmp	r6, #0
	beq	.LBB99_61
	ldr	r3, [r4]
	mov	r1, r11
	ldr	r0, [r4, #4]
	mov	r4, #0
	str	r0, [sp]
	add	r0, sp, #152
	mov	r2, #4
	str	r4, [sp, #160]
	str	r4, [sp, #156]
	str	r4, [sp, #152]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r7, #84]
	ldr	r1, [sp, #152]
	ldr	r6, [r7, #40]
	ldr	r11, [r7, #44]
	add	r0, r0, r1
	str	r0, [r7, #84]
	mov	r0, #40
	cmp	r6, #0
	strb	r0, [sp, #224]
	beq	.LBB99_62
	mov	r0, #0
	add	r3, sp, #224
	str	r0, [sp, #160]
	mov	r1, r11
	str	r0, [sp, #156]
	mov	r2, #4
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #152
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r4, [r7, #40]
	mov	r5, r7
	ldr	r11, [r7, #44]
	ldr	r0, [r7, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB99_63
.LBB99_11:
	add	r1, sp, #96
	stm	sp, {r2, r8}
	mov	r0, r10
	mov	r2, #0
	mov	r3, #0
	bl	"fmt::fmt_bit_set"
	b	.LBB99_138
.LBB99_12:
	ldm	r3, {r0, r1}
	mov	r3, r7
	stm	sp, {r0, r1, r8}
	add	r1, sp, #96
	mov	r0, r10
	bl	"fmt::fmt_bit_field"
	b	.LBB99_138
.LBB99_13:
	cmp	r2, #119
	bne	.LBB99_17
	rsbs	r7, r1, #27
	rscs	r7, r6, #0
	blo	.LBB99_17
	mov	r6, #2867200
	mov	r7, #1
	orr	r6, r6, #188743680
	tst	r6, r7, lsl r1
	ldrne	r4, [r10, #40]
	cmpne	r4, #0
	beq	.LBB99_17
	ldr	r7, [r3]
	mov	r6, #0
	ldr	r0, [r3, #4]
	mov	r5, r2
	ldr	r1, [r10, #44]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #152
	str	r6, [sp, #160]
	str	r6, [sp, #156]
	str	r6, [sp, #152]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	r6, r3
	mov	r3, r7
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	mov	r2, r5
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r10, #84]
	ldr	r0, [r6, #8]
.LBB99_17:
	mov	r1, #0
	mov	r3, r8
	str	r1, [sp, #84]
	ldr	r1, [sp, #96]
	str	r1, [sp, #80]
	ldr	r1, [r0, #16]
	ldr	r0, [r0, #20]
	str	r1, [sp, #88]
	add	r1, sp, #80
	str	r0, [sp, #92]
	mov	r0, r10
	bl	"fmt::fmt_value"
	b	.LBB99_138
.LBB99_18:
	add	r0, sp, #112
	mov	r1, #0
	mov	r2, #31
	ldr	r7, [r4]
	ldr	r6, [r4, #4]
	mov	r5, #0
	bl	memset
	cmn	r6, #1
	ble	.LBB99_44
	mov	r1, r6
	b	.LBB99_45
.LBB99_20:
	ldr	r11, .LCPI99_37
	mov	r3, #0
	ldr	r0, [r4]
	mov	r9, r8
	ldr	r1, [r4, #4]
	mov	r2, r11
	str	r0, [sp, #76]
	str	r1, [sp, #72]
	bl	__aeabi_ldivmod
	ldr	r2, .LCPI99_38
	mov	r3, #0
	str	r0, [sp, #68]
	adds	r7, r0, r2
	mov	r2, #4480
	sbc	r4, r1, #-2147483647
	orr	r2, r2, #81920
	str	r1, [sp, #64]
	mov	r0, r7
	mov	r1, r4
	bl	__aeabi_uldivmod
	ldr	r2, .LCPI99_39
	mov	r5, r0
	mov	r6, r1
	mov	r0, r7
	mov	r1, r4
	mov	r3, #2
	bl	__aeabi_uldivmod
	mov	r8, r0
	ldr	r0, .LCPI99_40
	mov	r2, #684
	mov	r3, #0
	orr	r2, r2, #35840
	smlal	r5, r6, r8, r0
	mov	r0, r5
	mov	r1, r6
	bl	__aeabi_uldivmod
	lsr	r2, r0, #2
	ldr	r4, .LCPI99_41
	orr	r2, r2, r1, lsl #30
	subs	r7, r0, r2
	sbc	r1, r1, r1, lsr #2
	umull	r0, r2, r7, r4
	sub	r2, r2, r7
	mla	r3, r1, r4, r2
	adds	r4, r0, r5
	mov	r2, #181
	orr	r2, r2, #1280
	mov	r0, r4
	adc	r5, r3, r6
	mov	r3, #0
	mov	r1, r5
	bl	__aeabi_uldivmod
	mvn	r12, #180
	mov	r6, r0
	sub	r12, r12, #1280
	umull	r2, r3, r0, r12
	sub	r3, r3, r0
	adds	r4, r2, r4
	mla	r0, r1, r12, r3
	mov	r2, #109
	orr	r2, r2, #256
	mov	r3, #0
	adc	r1, r0, r5
	mov	r0, r4
	bl	__aeabi_uldivmod
	lsr	r2, r0, #2
	orr	r1, r2, r1, lsl #30
	sub	r2, r0, r1
	mvn	r1, #364
	mov	r5, #100
	mla	r0, r2, r1, r4
	mov	r1, #400
	mul	r3, r8, r1
	mla	r4, r7, r5, r3
	add	r3, r4, r6, lsl #2
	add	r2, r3, r2
	ldr	r3, .LCPI99_42
	add	r2, r2, r3
	tst	r2, #3
	bne	.LBB99_23
	ldr	r7, .LCPI99_43
	smull	r6, r3, r2, r7
	ldr	r7, .LCPI99_44
	ldr	r6, .LCPI99_45
	mla	r5, r2, r6, r7
	ldr	r6, .LCPI99_46
	ror	r7, r5, #2
	cmp	r7, r6
	bhi	.LBB99_76
	asr	r7, r3, #7
	add	r3, r7, r3, lsr #31
	mul	r7, r3, r1
	subs	r1, r2, r7
	beq	.LBB99_76
.LBB99_23:
	mov	r4, r9
.LBB99_24:
	ldr	r1, .LCPI99_47
	smull	r3, r7, r0, r1
	add	r1, r7, r0
	asr	r3, r1, #4
	add	r1, r3, r1, lsr #31
	add	r9, r1, #1
	cmp	r9, #13
	bhs	.LBB99_156
	ldr	r7, .LCPI99_48
	ldr	r3, [r7, r9, lsl #2]
	cmp	r0, r3
	bge	.LBB99_28
	cmp	r1, #13
	bhs	.LBB99_158
	ldr	r3, [r7, r1, lsl #2]
	b	.LBB99_29
.LBB99_28:
	add	r9, r1, #2
.LBB99_29:
	sub	r0, r0, r3
	mov	r7, r11
	add	r0, r0, #1
	str	r0, [sp, #52]
.LBB99_30:
	mov	r0, #4
	asr	r3, r2, #31
	stm	sp, {r0, r4}
	mov	r0, r10
	bl	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	ldr	r0, [r10, #44]
	mov	r2, #4480
	str	r0, [sp, #44]
	mov	r0, #45
	strb	r0, [sp, #224]
	orr	r2, r2, #81920
	ldr	r0, .LCPI99_49
	mov	r3, #0
	ldr	r11, [sp, #68]
	mov	r5, #0
	ldr	r8, [sp, #64]
	adds	r0, r11, r0
	ldr	r6, [r10, #40]
	sbc	r1, r8, #-2147483632
	bl	__aeabi_uldivmod
	ldr	r0, .LCPI99_50
	umull	r1, r3, r2, r0
	mvn	r0, #224
	sub	r0, r0, #-268435456
	str	r3, [sp, #56]
	mul	r1, r3, r0
	ldr	r0, .LCPI99_51
	add	r3, r2, r1, lsl #4
	str	r3, [sp, #60]
	smull	r1, r2, r3, r0
	add	r0, r2, r3
	str	r0, [sp, #48]
	umull	r0, r1, r11, r7
	mov	r2, r7
	mla	r3, r8, r7, r1
	ldr	r1, [sp, #76]
	ldr	r7, .LCPI99_52
	subs	r0, r1, r0
	ldr	r1, [sp, #72]
	mov	r8, r4
	sbc	r1, r1, r3
	mov	r3, #6684672
	orr	r3, r3, #1023410176
	adds	r0, r0, r3
	mov	r3, #0
	adc	r1, r1, r7
	bl	__aeabi_uldivmod
	cmp	r6, #0
	str	r2, [sp, #76]
	str	r3, [sp, #72]
	beq	.LBB99_32
	mov	r0, #1
	ldr	r1, [sp, #44]
	str	r0, [sp]
	add	r0, sp, #152
	add	r3, sp, #224
	mov	r2, #4
	str	r5, [sp, #160]
	str	r5, [sp, #156]
	str	r5, [sp, #152]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB99_32:
	ldr	r5, [sp, #48]
	mov	r11, #2
	mov	r0, r10
	mov	r2, r9
	mov	r3, #0
	str	r11, [sp]
	asr	r4, r5, #5
	str	r8, [sp, #4]
	mov	r6, #0
	bl	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	ldr	r7, [r10, #40]
	mov	r0, #45
	ldr	r1, [r10, #44]
	cmp	r7, #0
	strb	r0, [sp, #224]
	beq	.LBB99_34
	mov	r0, #1
	add	r3, sp, #224
	str	r0, [sp]
	add	r0, sp, #152
	mov	r2, #4
	str	r6, [sp, #160]
	str	r6, [sp, #156]
	str	r6, [sp, #152]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r10, #84]
.LBB99_34:
	ldr	r2, [sp, #52]
	mov	r0, r10
	add	r9, r4, r5, lsr #31
	str	r11, [sp]
	str	r8, [sp, #4]
	asr	r3, r2, #31
	bl	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	ldr	r4, [r10, #40]
	mov	r0, #32
	ldr	r1, [r10, #44]
	mov	r6, r10
	cmp	r4, #0
	mov	r7, r8
	strb	r0, [sp, #224]
	beq	.LBB99_36
	mov	r0, #0
	add	r3, sp, #224
	str	r0, [sp, #160]
	mov	r2, #4
	str	r0, [sp, #156]
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #152
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r6, #84]
.LBB99_36:
	ldr	r2, [sp, #56]
	mov	r8, #2
	mov	r0, r6
	mov	r3, #0
	sub	r10, r9, r9, lsl #4
	str	r8, [sp]
	str	r7, [sp, #4]
	mov	r4, #0
	bl	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	ldr	r5, [r6, #40]
	mov	r11, #58
	ldr	r1, [r6, #44]
	cmp	r5, #0
	strb	r11, [sp, #224]
	beq	.LBB99_38
	mov	r0, #1
	add	r3, sp, #224
	str	r0, [sp]
	add	r0, sp, #152
	mov	r2, #4
	str	r4, [sp, #160]
	str	r4, [sp, #156]
	str	r4, [sp, #152]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r6, #84]
.LBB99_38:
	ldr	r0, [sp, #60]
	asr	r3, r9, #31
	mov	r2, r9
	str	r8, [sp]
	add	r4, r0, r10, lsl #2
	mov	r0, r6
	str	r7, [sp, #4]
	bl	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	ldr	r5, [r6, #40]
	ldr	r1, [r6, #44]
	cmp	r5, #0
	strb	r11, [sp, #224]
	beq	.LBB99_40
	mov	r0, #0
	add	r3, sp, #224
	str	r0, [sp, #160]
	mov	r2, #4
	str	r0, [sp, #156]
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #152
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r6, #84]
.LBB99_40:
	mov	r0, #2
	asr	r3, r4, #31
	stm	sp, {r0, r7}
	mov	r0, r6
	mov	r2, r4
	bl	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	ldr	r4, [r6, #40]
	mov	r0, #46
	ldr	r1, [r6, #44]
	cmp	r4, #0
	strb	r0, [sp, #224]
	beq	.LBB99_42
	mov	r0, #0
	add	r3, sp, #224
	str	r0, [sp, #160]
	mov	r2, #4
	str	r0, [sp, #156]
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #152
	str	r7, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r6, #84]
.LBB99_42:
	ldr	r2, [sp, #76]
	mov	r0, #9
	ldr	r3, [sp, #72]
	stm	sp, {r0, r7}
	mov	r0, r6
	bl	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	ldr	r4, [r6, #40]
	cmp	r4, #0
	beq	.LBB99_138
	mov	r0, #0
	ldr	r1, [r6, #44]
	str	r0, [sp, #160]
	str	r0, [sp, #156]
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #10
	ldr	r3, .LCPI99_23
	str	r0, [sp]
	add	r0, sp, #152
	str	r7, [sp, #20]
	b	.LBB99_73
.LBB99_44:
	rsbs	r7, r7, #0
	rsc	r1, r6, #0
.LBB99_45:
	mov	r0, #115
	ldr	r2, .LCPI99_6
	strb	r0, [sp, #143]
	orr	r0, r5, r7
	subs	r2, r0, r2
	sbcs	r2, r1, #0
	bhs	.LBB99_49
	orrs	r2, r0, r1
	beq	.LBB99_74
	subs	r2, r0, #1000
	str	r10, [sp, #40]
	sbcs	r2, r1, #0
	str	r6, [sp, #72]
	bhs	.LBB99_78
	mov	r2, #110
	mov	r8, #30
	strb	r2, [sp, #142]
	b	.LBB99_93
.LBB99_49:
	str	r10, [sp, #40]
	mov	r8, #0
	ldr	r10, .LCPI99_24
	mov	r2, #31
	ldr	lr, .LCPI99_25
	mov	r12, #10
	str	r6, [sp, #72]
	mov	r9, #0
	mov	r6, #0
.LBB99_50:
	mov	r11, r2
	lsr	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	adds	r3, r2, r1, lsr #1
	adc	r3, r3, #0
	umull	r4, r5, r3, r10
	bic	r4, r5, #3
	add	r4, r4, r5, lsr #2
	sub	r3, r3, r4
	subs	r2, r2, r3
	umull	r4, r3, r2, r10
	mla	r5, r2, lr, r3
	rsc	r2, r8, r1, lsr #1
	mla	r7, r2, r10, r5
	umull	r3, r5, r4, r12
	add	r2, r7, r7, lsl #2
	subs	r3, r0, r3
	add	r2, r5, r2, lsl #1
	sbc	r2, r1, r2
	tst	r9, #1
	bne	.LBB99_56
	orrs	r2, r3, r2
	mov	r9, r11
	bne	.LBB99_55
	add	r6, r6, #1
	cmp	r6, #9
	beq	.LBB99_104
.LBB99_53:
	lsr	r0, r4, #1
	orr	r0, r0, r7, lsl #31
	adds	r1, r0, r7, lsr #1
	adc	r1, r1, #0
	umull	r2, r3, r1, r10
	bic	r2, r3, #3
	add	r2, r2, r3, lsr #2
	sub	r1, r1, r2
	subs	r1, r0, r1
	umull	r0, r2, r1, r10
	mla	r3, r1, lr, r2
	rsc	r2, r8, r7, lsr #1
	mla	r1, r2, r10, r3
	umull	r3, r5, r0, r12
	add	r2, r1, r1, lsl #2
	subs	r3, r4, r3
	add	r2, r5, r2, lsl #1
	sbc	r2, r7, r2
	orrs	r2, r3, r2
	bne	.LBB99_57
	add	r6, r6, #1
	mov	r4, r0
	cmp	r6, #9
	mov	r7, r1
	bne	.LBB99_53
	b	.LBB99_105
.LBB99_55:
	mov	r4, r0
	mov	r7, r1
	b	.LBB99_57
.LBB99_56:
	mov	r4, r0
	mov	r7, r1
	mov	r9, r11
.LBB99_57:
	sub	r2, r9, #1
	cmp	r2, #31
	bhs	.LBB99_154
	add	r1, sp, #112
	orr	r0, r3, #48
	add	r6, r6, #1
	mov	r9, #1
	strb	r0, [r1, r2]
	lsr	r0, r4, #1
	orr	r0, r0, r7, lsl #31
	adds	r1, r0, r7, lsr #1
	adc	r1, r1, #0
	umull	r3, r4, r1, r10
	bic	r3, r4, #3
	add	r3, r3, r4, lsr #2
	sub	r1, r1, r3
	subs	r1, r0, r1
	umull	r0, r3, r1, r10
	mla	r4, r1, lr, r3
	rsc	r3, r8, r7, lsr #1
	cmp	r6, #9
	mla	r1, r3, r10, r4
	bne	.LBB99_50
	sub	r9, r11, #2
	cmp	r9, #31
	bhs	.LBB99_172
	add	r3, sp, #112
	mov	r2, #46
	strb	r2, [r3, r9]
	b	.LBB99_105
.LBB99_61:
	mov	r5, r7
	mov	r4, #0
	b	.LBB99_63
.LBB99_62:
	mov	r5, r7
.LBB99_63:
	add	r6, sp, #152
	mov	r1, #0
	mov	r2, #65
	mov	r7, #0
	mov	r0, r6
	bl	memset
	mov	r0, #36
	mov	r1, r6
	str	r0, [sp, #24]
	mov	r2, #65
	ldr	r0, .LCPI99_30
	str	r0, [sp, #20]
	mov	r0, #64
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp, #12]
	mov	r0, #10
	str	r0, [sp, #8]
	asr	r0, r10, #31
	str	r0, [sp, #4]
	add	r0, sp, #144
	str	r7, [sp, #148]
	str	r7, [sp, #144]
	str	r8, [sp, #32]
	str	r7, [sp, #28]
	str	r10, [sp]
	bl	"strconv::write_bits"
	cmp	r4, #0
	mov	r6, r5
	beq	.LBB99_65
	ldr	r0, [sp, #148]
	mov	r1, r11
	ldr	r3, [sp, #144]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #224
	str	r7, [sp, #232]
	str	r7, [sp, #228]
	str	r7, [sp, #224]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #224]
	add	r0, r0, r1
	str	r0, [r6, #84]
.LBB99_65:
	cmp	r9, #0
	beq	.LBB99_71
	ldr	r4, [r6, #40]
	mov	r0, #58
	ldr	r11, [r6, #44]
	mov	r5, r6
	mov	r10, #0
	cmp	r4, #0
	strb	r0, [sp, #224]
	beq	.LBB99_68
	mov	r0, #0
	add	r3, sp, #224
	str	r0, [sp, #160]
	mov	r1, r11
	str	r0, [sp, #156]
	mov	r2, #4
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #152
	ldr	r8, [sp, #280]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r4, [r5, #40]
	mov	r6, r5
	ldr	r11, [r5, #44]
	ldr	r0, [r5, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r5, #84]
	b	.LBB99_69
.LBB99_68:
	mov	r6, r5
	mov	r4, #0
	ldr	r8, [sp, #280]
.LBB99_69:
	add	r5, sp, #152
	mov	r1, #0
	mov	r2, #65
	mov	r0, r5
	bl	memset
	mov	r0, #36
	mov	r1, #64
	mov	r2, #1
	str	r1, [sp, #16]
	ldr	r1, .LCPI99_30
	mov	r3, #10
	str	r0, [sp, #24]
	add	r0, sp, #144
	asr	r7, r9, #31
	str	r2, [sp, #12]
	str	r1, [sp, #20]
	mov	r1, r5
	mov	r2, #65
	str	r10, [sp, #148]
	str	r10, [sp, #144]
	str	r8, [sp, #32]
	str	r9, [sp]
	str	r7, [sp, #4]
	str	r3, [sp, #8]
	str	r10, [sp, #28]
	bl	"strconv::write_bits"
	cmp	r4, #0
	beq	.LBB99_71
	ldr	r0, [sp, #148]
	mov	r1, #0
	ldr	r3, [sp, #144]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #224
	str	r1, [sp, #232]
	str	r1, [sp, #228]
	str	r1, [sp, #224]
	str	r1, [sp, #8]
	str	r1, [sp, #12]
	str	r1, [sp, #16]
	mov	r1, r11
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #224]
	add	r0, r0, r1
	str	r0, [r6, #84]
.LBB99_71:
	ldr	r4, [r6, #40]
	mov	r0, #41
	ldr	r1, [r6, #44]
	cmp	r4, #0
	strb	r0, [sp, #224]
	beq	.LBB99_138
	mov	r0, #0
	add	r3, sp, #224
	str	r0, [sp, #160]
	str	r0, [sp, #156]
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #280]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #152
.LBB99_73:
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r6, #84]
	b	.LBB99_138
.LBB99_74:
	ldr	r4, [r10, #40]
	cmp	r4, #0
	beq	.LBB99_138
	mov	r0, #0
	ldr	r1, [r10, #44]
	str	r0, [sp, #160]
	mov	r2, #4
	str	r0, [sp, #156]
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	ldr	r3, .LCPI99_29
	str	r0, [sp]
	add	r0, sp, #152
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r10, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r10, #84]
	b	.LBB99_138
.LBB99_76:
	cmp	r0, #59
	mov	r4, r9
	ble	.LBB99_80
	sub	r0, r0, #1
	b	.LBB99_24
.LBB99_78:
	mov	r2, #576
	orr	r2, r2, #999424
	subs	r2, r0, r2
	sbcs	r2, r1, #0
	bhs	.LBB99_82
	mov	r2, #194
	mov	r3, #3
	orr	r2, r2, #46336
	strh	r2, [sp, #141]
	mov	r2, #29
	b	.LBB99_83
.LBB99_80:
	bne	.LBB99_24
	mov	r0, #29
	mov	r7, r11
	str	r0, [sp, #52]
	mov	r9, #2
	b	.LBB99_30
.LBB99_82:
	mov	r2, #109
	mov	r3, #6
	strb	r2, [sp, #142]
	mov	r2, #30
.LBB99_83:
	ldr	r11, .LCPI99_24
	mov	r9, #0
	ldr	r10, .LCPI99_25
	mov	lr, #0
	mov	r6, #0
	str	r3, [sp, #76]
	str	r2, [sp, #68]
.LBB99_84:
	mov	r8, r2
	lsr	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	mov	r4, #10
	adds	r5, r2, r1, lsr #1
	adc	r5, r5, #0
	umull	r3, r7, r5, r11
	bic	r3, r7, #3
	add	r3, r3, r7, lsr #2
	sub	r3, r5, r3
	subs	r2, r2, r3
	umull	r12, r3, r2, r11
	mla	r7, r2, r10, r3
	rsc	r2, r9, r1, lsr #1
	mla	r5, r2, r11, r7
	umull	r3, r7, r12, r4
	add	r2, r5, r5, lsl #2
	subs	r9, r0, r3
	add	r2, r7, r2, lsl #1
	sbc	r2, r1, r2
	tst	lr, #1
	orrseq	r2, r9, r2
	beq	.LBB99_88
	mov	r12, r0
	mov	r5, r1
	mov	lr, #0
	ldr	r10, .LCPI99_25
.LBB99_86:
	ldr	r0, [sp, #68]
	sub	r2, r8, #1
	cmp	r2, r0
	bhs	.LBB99_159
	add	r1, sp, #112
	orr	r0, r9, #48
	add	r6, r6, #1
	mov	r9, #0
	strb	r0, [r1, r2]
	lsr	r0, r12, #1
	orr	r0, r0, r5, lsl #31
	adds	r1, r0, r5, lsr #1
	adc	r1, r1, #0
	umull	r3, r7, r1, r11
	bic	r3, r7, #3
	add	r3, r3, r7, lsr #2
	sub	r1, r1, r3
	subs	r1, r0, r1
	umull	r0, r3, r1, r11
	mla	r7, r1, r10, r3
	rsc	r3, lr, r5, lsr #1
	mov	lr, #1
	mla	r1, r3, r11, r7
	ldr	r3, [sp, #76]
	cmp	r6, r3
	bne	.LBB99_84
	b	.LBB99_139
.LBB99_88:
	ldr	r0, [sp, #76]
	add	r6, r6, #1
	ldr	r10, .LCPI99_25
	mov	lr, #0
	cmp	r6, r0
	beq	.LBB99_141
.LBB99_89:
	lsr	r0, r12, #1
	mov	r4, #10
	orr	r0, r0, r5, lsl #31
	adds	r1, r0, r5, lsr #1
	adc	r1, r1, #0
	umull	r2, r3, r1, r11
	bic	r2, r3, #3
	add	r2, r2, r3, lsr #2
	sub	r1, r1, r2
	subs	r1, r0, r1
	umull	r0, r2, r1, r11
	mla	r3, r1, r10, r2
	rsc	r2, lr, r5, lsr #1
	mla	r1, r2, r11, r3
	umull	r3, r7, r0, r4
	add	r2, r1, r1, lsl #2
	subs	r9, r12, r3
	add	r2, r7, r2, lsl #1
	sbc	r2, r5, r2
	orrs	r2, r9, r2
	bne	.LBB99_86
	ldr	r2, [sp, #76]
	add	r6, r6, #1
	mov	r12, r0
	mov	r5, r1
	cmp	r2, r6
	bne	.LBB99_89
.LBB99_91:
	cmp	r8, #33
	bhs	.LBB99_170
	orrs	r2, r0, r1
	beq	.LBB99_96
.LBB99_93:
	add	r2, sp, #112
	ldr	r10, .LCPI99_24
	sub	r9, r2, #1
	ldr	r12, .LCPI99_25
	mov	lr, #0
	mov	r4, r8
.LBB99_94:
	sub	r11, r4, #1
	cmp	r11, r8
	bhs	.LBB99_143
	lsr	r6, r0, #1
	orr	r6, r6, r1, lsl #31
	adds	r2, r6, r1, lsr #1
	adc	r2, r2, #0
	umull	r3, r7, r2, r10
	bic	r3, r7, #3
	add	r3, r3, r7, lsr #2
	sub	r2, r2, r3
	subs	r2, r6, r2
	umull	r3, r6, r2, r10
	add	r7, r3, r3, lsl #2
	sub	r7, r0, r7, lsl #1
	orr	r7, r7, #48
	strb	r7, [r9, r4]
	mla	r4, r2, r12, r6
	rsc	r2, lr, r1, lsr #1
	subs	r0, r0, #10
	mla	r6, r2, r10, r4
	sbcs	r0, r1, #0
	mov	r0, r3
	mov	r4, r11
	mov	r1, r6
	bhs	.LBB99_94
	b	.LBB99_128
.LBB99_96:
	sub	r11, r8, #1
	cmp	r8, #0
	beq	.LBB99_161
	add	r1, sp, #112
	mov	r0, #48
	strb	r0, [r1, r11]
	b	.LBB99_128
	.p2align	2
.LCPI99_31:
	.long	3657863519
	.p2align	2
.LCPI99_32:
	.long	1634394834
	.p2align	2
.LCPI99_33:
	.long	4029590773
	.p2align	2
.LCPI99_34:
	.long	380748506
	.p2align	2
.LCPI99_35:
	.long	1442759782
	.p2align	2
.LCPI99_36:
	.long	4030966782
	.p2align	2
.LBB99_104:
	mov	r0, r4
	mov	r1, r7
.LBB99_105:
	lsr	r2, r0, #2
	ldr	r5, .LCPI99_21
	orr	r2, r2, r1, lsl #30
	adds	r3, r2, r1, lsr #2
	adc	r3, r3, #0
	umull	r7, r6, r3, r5
	ldr	r5, .LCPI99_27
	lsr	r7, r6, #3
	sub	r7, r7, r7, lsl #4
	add	r3, r3, r7
	ldr	r7, .LCPI99_28
	subs	r2, r2, r3
	umull	r3, r6, r2, r5
	mla	r4, r2, r7, r6
	mov	r2, #0
	rsc	r2, r2, r1, lsr #2
	str	r3, [sp, #76]
	mla	r7, r2, r5, r4
	mov	r5, #60
	umull	r4, r6, r3, r5
	str	r7, [sp, #68]
	rsb	r2, r7, r7, lsl #4
	add	r6, r6, r2, lsl #2
	subs	r2, r0, r4
	sbc	r8, r1, r6
	orrs	r6, r2, r8
	beq	.LBB99_109
	add	r3, sp, #112
	mov	r4, r9
	sub	r12, r3, #1
.LBB99_107:
	sub	r11, r4, #1
	mov	lr, r9
	cmp	r11, r9
	bhs	.LBB99_142
	lsr	r6, r2, #1
	orr	r6, r6, r8, lsl #31
	adds	r9, r6, r8, lsr #1
	adc	r7, r9, #0
	mov	r9, lr
	umull	r3, r5, r7, r10
	bic	r3, r5, #3
	add	r3, r3, r5, lsr #2
	sub	r3, r7, r3
	subs	r3, r6, r3
	umull	r5, r6, r3, r10
	add	r7, r5, r5, lsl #2
	sub	r7, r2, r7, lsl #1
	orr	r7, r7, #48
	strb	r7, [r12, r4]
	ldr	r7, .LCPI99_25
	mla	r4, r3, r7, r6
	mov	r3, #0
	rsc	r3, r3, r8, lsr #1
	rsbs	r2, r2, #9
	mla	r6, r3, r10, r4
	rscs	r2, r8, #0
	mov	r2, r5
	mov	r4, r11
	mov	r8, r6
	blo	.LBB99_107
	b	.LBB99_111
.LBB99_109:
	sub	r11, r9, #1
	cmp	r9, #0
	beq	.LBB99_161
	add	r3, sp, #112
	mov	r2, #48
	strb	r2, [r3, r11]
.LBB99_111:
	subs	r2, r0, #60
	sbcs	r2, r1, #0
	blo	.LBB99_128
	sub	lr, r11, #1
	cmp	lr, #32
	bhs	.LBB99_167
	add	r2, sp, #112
	mov	r3, #109
	ldr	r5, [sp, #76]
	strb	r3, [r2, lr]
	ldr	r2, [sp, #68]
	lsr	r3, r5, #2
	orr	r3, r3, r2, lsl #30
	adds	r3, r3, r2, lsr #2
	ldr	r2, .LCPI99_21
	adc	r3, r3, #0
	umull	r7, r6, r3, r2
	lsr	r7, r6, #3
	sub	r7, r7, r7, lsl #4
	add	r3, r3, r7
	and	r7, r5, #3
	orrs	r8, r7, r3, lsl #2
	beq	.LBB99_120
	sub	r3, r11, #2
	add	r9, sp, #112
	mov	r6, #0
	mov	r12, #0
.LBB99_115:
	cmp	r3, lr
	bhs	.LBB99_144
	lsr	r5, r8, #1
	orr	r5, r5, r6, lsl #31
	adds	r4, r5, r6, lsr #1
	adc	r4, r4, #0
	umull	r2, r7, r4, r10
	bic	r2, r7, #3
	add	r2, r2, r7, lsr #2
	sub	r2, r4, r2
	subs	r2, r5, r2
	ldr	r5, .LCPI99_25
	umull	r4, r11, r2, r10
	add	r7, r4, r4, lsl #2
	sub	r7, r8, r7, lsl #1
	orr	r7, r7, #48
	strb	r7, [r9, r3]
	mla	r7, r2, r5, r11
	rsc	r2, r12, r6, lsr #1
	sub	r3, r3, #1
	mla	r5, r2, r10, r7
	rsbs	r2, r8, #9
	rscs	r2, r6, #0
	mov	r8, r4
	mov	r6, r5
	blo	.LBB99_115
	add	r11, r3, #1
	b	.LBB99_122
	.p2align	2
.LCPI99_37:
	.long	1000000000
	.p2align	2
.LCPI99_38:
	.long	450480384
	.p2align	2
.LBB99_120:
	sub	r11, r11, #2
	cmp	lr, #0
	beq	.LBB99_161
	add	r3, sp, #112
	mov	r2, #48
	strb	r2, [r3, r11]
.LBB99_122:
	subs	r2, r0, #3600
	sbcs	r2, r1, #0
	blo	.LBB99_128
	sub	r9, r11, #1
	cmp	r9, #32
	bhs	.LBB99_171
	add	r6, sp, #112
	mov	r2, #104
	mov	r3, #0
	mov	r8, #0
	strb	r2, [r6, r9]
	mov	r2, #3600
	bl	__aeabi_uldivmod
	ldr	r12, .LCPI99_25
	sub	r2, r11, #2
.LBB99_125:
	cmp	r2, r9
	bhs	.LBB99_148
	lsr	r3, r0, #1
	orr	r3, r3, r1, lsl #31
	adds	r5, r3, r1, lsr #1
	adc	r5, r5, #0
	umull	r4, r7, r5, r10
	bic	r4, r7, #3
	add	r7, r4, r7, lsr #2
	sub	r7, r5, r7
	subs	r3, r3, r7
	umull	r7, r5, r3, r10
	add	r4, r7, r7, lsl #2
	sub	r4, r0, r4, lsl #1
	orr	r4, r4, #48
	strb	r4, [r6, r2]
	mla	r4, r3, r12, r5
	rsc	r3, r8, r1, lsr #1
	rsbs	r0, r0, #9
	sub	r2, r2, #1
	mla	r5, r3, r10, r4
	rscs	r0, r1, #0
	mov	r0, r7
	mov	r1, r5
	blo	.LBB99_125
	add	r11, r2, #1
.LBB99_128:
	ldr	r0, [sp, #72]
	ldr	r5, [sp, #40]
	cmn	r0, #1
	ble	.LBB99_134
	ldr	r2, [sp, #280]
	cmp	r11, #33
	blo	.LBB99_136
	mov	r0, #32
	mov	r2, #572
	str	r0, [sp, #4]
	orr	r2, r2, #2048
	str	r0, [sp, #8]
	mov	r1, #43
	ldr	r0, .LCPI99_26
	mov	r3, #40
	str	r11, [sp]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI99_39:
	.long	4032846208
	.p2align	2
.LCPI99_40:
	.long	4294821199
	.p2align	2
.LCPI99_41:
	.long	4294930772
	.p2align	2
.LBB99_134:
	ldr	r2, [sp, #280]
	sub	r11, r11, #1
	cmp	r11, #32
	bhs	.LBB99_164
	add	r1, sp, #112
	mov	r0, #45
	strb	r0, [r1, r11]
.LBB99_136:
	ldr	r4, [r5, #40]
	cmp	r4, #0
	beq	.LBB99_138
	mov	r0, #0
	ldr	r1, [r5, #44]
	str	r0, [sp, #160]
	str	r0, [sp, #156]
	str	r0, [sp, #152]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	rsb	r0, r11, #32
	str	r0, [sp]
	add	r0, sp, #112
	add	r3, r0, r11
	add	r0, sp, #152
	str	r2, [sp, #20]
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r5, #84]
	ldr	r1, [sp, #152]
	add	r0, r0, r1
	str	r0, [r5, #84]
.LBB99_138:
	add	sp, sp, #244
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB99_139:
	ldr	r2, [sp, #68]
	sub	r8, r8, #2
	cmp	r8, r2
	bhs	.LBB99_173
	add	r11, sp, #112
	mov	r2, #46
	strb	r2, [r11, r8]
	b	.LBB99_91
.LBB99_141:
	mov	r0, r12
	mov	r1, r5
	b	.LBB99_91
.LBB99_142:
	sub	r0, r4, #1
	str	r0, [sp]
	b	.LBB99_145
.LBB99_143:
	sub	r0, r4, #1
	stm	sp, {r0, r8}
	b	.LBB99_149
.LBB99_144:
	str	r3, [sp]
.LBB99_145:
	str	lr, [sp, #4]
	b	.LBB99_149
	.p2align	2
.LCPI99_42:
	.long	4075721025
	.p2align	2
.LCPI99_43:
	.long	1374389535
	.p2align	2
.LBB99_148:
	stm	sp, {r2, r9}
.LBB99_149:
	mov	r2, #255
	ldr	r0, .LCPI99_26
	orr	r2, r2, #2304
.LBB99_150:
	mov	r1, #43
	mov	r3, #10
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI99_44:
	.long	85899344
	.p2align	2
.LCPI99_45:
	.long	3264175145
	.p2align	2
.LCPI99_46:
	.long	42949672
	.p2align	2
.LBB99_154:
	mvn	r1, #0
	mov	r0, #31
	str	r1, [sp]
	b	.LBB99_160
	.p2align	2
.LCPI99_47:
	.long	2216757315
	.p2align	2
.LBB99_156:
	mov	r0, #13
	mov	r2, #173
	str	r0, [sp, #4]
	orr	r2, r2, #768
	ldr	r0, .LCPI99_17
	mov	r1, #45
	mov	r3, #25
	str	r9, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI99_48:
	.long	"time::days_before"
	.p2align	2
.LBB99_158:
	mov	r0, #13
	mov	r2, #179
	str	r0, [sp, #4]
	orr	r2, r2, #768
	ldr	r0, .LCPI99_17
	mov	r3, #27
	str	r1, [sp]
	mov	r1, #45
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB99_159:
	ldr	r0, [sp, #68]
	str	r2, [sp]
.LBB99_160:
	mov	r2, #492
	str	r0, [sp, #4]
	ldr	r0, .LCPI99_26
	orr	r2, r2, #2048
	b	.LBB99_150
.LBB99_161:
	mov	r0, #0
	str	r11, [sp]
	str	r0, [sp, #4]
	mov	r2, #251
	ldr	r0, .LCPI99_26
.LBB99_162:
	orr	r2, r2, #2304
	b	.LBB99_168
	.p2align	2
.LCPI99_49:
	.long	2739393024
	.p2align	2
.LBB99_164:
	mov	r0, #32
	mov	r2, #58
	str	r0, [sp, #4]
	orr	r2, r2, #2560
	ldr	r0, .LCPI99_26
	mov	r1, #43
	mov	r3, #8
	str	r11, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI99_50:
	.long	1193047
	.p2align	2
.LCPI99_51:
	.long	2290649225
	.p2align	2
.LBB99_167:
	mov	r2, #45
	mov	r0, #32
	str	r0, [sp, #4]
	orr	r2, r2, #2560
	str	lr, [sp]
	ldr	r0, .LCPI99_26
.LBB99_168:
	mov	r1, #43
	mov	r3, #9
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI99_52:
	.long	1895114362
	.p2align	2
.LBB99_170:
	mov	r0, #32
	mov	r2, #548
	str	r0, [sp, #8]
	mov	r1, #0
	ldr	r0, .LCPI99_26
	orr	r2, r2, #2048
	stm	sp, {r1, r8}
	mov	r1, #43
	mov	r3, #16
	bl	"runtime::slice_handle_error"
.LBB99_171:
	mov	r2, #50
	mov	r0, #32
	str	r0, [sp, #4]
	orr	r2, r2, #2560
	str	r9, [sp]
	ldr	r0, .LCPI99_26
	b	.LBB99_150
.LBB99_172:
	mov	r0, #31
	str	r9, [sp]
	str	r0, [sp, #4]
	b	.LBB99_174
.LBB99_173:
	str	r8, [sp]
	str	r2, [sp, #4]
.LBB99_174:
	ldr	r0, .LCPI99_26
	mov	r2, #242
	b	.LBB99_162
	.p2align	2
.LCPI99_6:
	.long	1000000000
.LCPI99_17:
	.long	".Lcsbs$POC-Example$56"
.LCPI99_21:
	.long	2290649225
.LCPI99_23:
	.long	".Lcsbs$POC-Example$195"
.LCPI99_24:
	.long	3435973837
.LCPI99_25:
	.long	3435973836
.LCPI99_26:
	.long	".Lcsbs$POC-Example$156"
.LCPI99_27:
	.long	4008636143
.LCPI99_28:
	.long	4008636142
.LCPI99_29:
	.long	".Lcsbs$POC-Example$193"
.LCPI99_30:
	.long	".Lcsbs$POC-Example$0"
.Lfunc_end99:
	.size	"fmt::fmt_named", .Lfunc_end99-"fmt::fmt_named"
	.fnend

	.p2align	2
	.type	"fmt::fmt_union",%function
	.code	32
"fmt::fmt_union":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#88
	sub	sp, sp, #88
	mov	r12, r3
	ldr	r7, [sp, #120]
	ldr	r3, [sp, #124]
	cmp	r7, #0
	beq	.LBB100_40
	ldr	lr, [r12, #4]
	ldr	r8, [r1]
	cmp	lr, #1
	bne	.LBB100_11
	ldr	r1, [r12]
	ldr	r5, [r1]
	cmp	r5, #0
	beq	.LBB100_11
	add	r9, r5, #16
	ldr	r6, [r9, #48]
	ldr	r7, [r9, #52]
	b	.LBB100_5
.LBB100_4:
	ldr	r5, [r5, #32]
	ldr	r6, [r5, #64]
	ldr	r7, [r5, #68]
.LBB100_5:
	eor	r1, r6, #1
	orrs	r1, r1, r7
	beq	.LBB100_4
	subs	r1, r6, #11
	sbc	r4, r7, #0
	subs	r1, r1, #3
	sbcs	r1, r4, #0
	bhs	.LBB100_9
.LBB100_7:
	cmp	r8, #0
	beq	.LBB100_40
	mov	r1, #0
	str	r8, [sp, #56]
	str	r1, [sp, #60]
	ldm	r9, {r1, r7}
	str	r1, [sp, #64]
	add	r1, sp, #56
	str	r7, [sp, #68]
	b	.LBB100_39
.LBB100_9:
	eor	r1, r6, #7
	orrs	r1, r1, r7
	bne	.LBB100_11
	ldrb	r1, [r5, #24]
	cmp	r1, #0
	bne	.LBB100_7
.LBB100_11:
	ldr	r5, [r12, #12]
	ldr	r1, [r12, #8]
	ldr	r7, .LCPI100_1
	add	r4, r1, r8
	ldr	r6, [r5, #16]
	ldr	r1, .LCPI100_2
	ldr	r5, [r5, #20]
	subs	r1, r1, r6
	sbcs	r1, r7, r5
	blt	.LBB100_15
	ldr	r7, .LCPI100_12
	ldr	r1, .LCPI100_11
	subs	r7, r7, r6
	sbcs	r7, r1, r5
	blt	.LBB100_18
	ldr	r1, .LCPI100_16
	ldr	r7, .LCPI100_17
	eor	r1, r6, r1
	eor	r7, r5, r7
	orrs	r1, r1, r7
	bne	.LBB100_23
	ldrsh	r5, [r4]
	b	.LBB100_25
.LBB100_15:
	ldr	r1, .LCPI100_4
	ldr	r9, .LCPI100_3
	subs	r1, r1, r6
	sbcs	r1, r9, r5
	blt	.LBB100_20
	ldr	r1, .LCPI100_8
	eor	r7, r5, r7
	eor	r1, r6, r1
	orrs	r1, r1, r7
	bne	.LBB100_27
	ldrsb	r5, [r4]
	b	.LBB100_25
.LBB100_18:
	ldr	r7, .LCPI100_13
	eor	r1, r5, r1
	eor	r7, r6, r7
	orrs	r1, r7, r1
	bne	.LBB100_30
	ldrb	r5, [r4]
	b	.LBB100_32
.LBB100_20:
	ldr	r1, .LCPI100_5
	eor	r7, r5, r9
	eor	r1, r6, r1
	orrs	r1, r1, r7
	beq	.LBB100_28
	ldr	r1, .LCPI100_6
	eor	r1, r6, r1
	ldr	r6, .LCPI100_7
	eor	r5, r5, r6
	orrs	r1, r1, r5
	bne	.LBB100_46
	ldrh	r5, [r4]
	b	.LBB100_32
.LBB100_23:
	ldr	r1, .LCPI100_18
	eor	r1, r6, r1
	ldr	r6, .LCPI100_19
	eor	r5, r5, r6
	orrs	r1, r1, r5
	bne	.LBB100_46
	ldr	r5, [r4]
.LBB100_25:
	asr	r4, r5, #31
	cmn	r4, #1
	ble	.LBB100_29
.LBB100_26:
	cmp	r8, #0
	bne	.LBB100_33
	b	.LBB100_40
.LBB100_27:
	ldr	r1, .LCPI100_9
	eor	r1, r6, r1
	ldr	r6, .LCPI100_10
	eor	r5, r5, r6
	orrs	r1, r1, r5
	bne	.LBB100_46
.LBB100_28:
	ldr	r5, [r4]
	ldr	r4, [r4, #4]
	cmn	r4, #1
	bgt	.LBB100_26
.LBB100_29:
	ldr	r0, [r3, #16]
	ldr	r4, .LCPI100_21
	cmp	r0, #0
	ldr	r2, .LCPI100_23
	movne	r4, r0
	ldr	r0, .LCPI100_22
	ldr	r1, .LCPI100_20
	str	r3, [sp, #4]
	mov	r3, #8
	str	r1, [sp]
	mov	r1, #17
	mov	lr, pc
	mov	pc, r4
.LBB100_30:
	ldr	r1, .LCPI100_14
	eor	r1, r6, r1
	ldr	r6, .LCPI100_15
	eor	r5, r5, r6
	orrs	r1, r1, r5
	bne	.LBB100_46
	ldr	r5, [r4]
.LBB100_32:
	mov	r4, #0
	cmp	r8, #0
	beq	.LBB100_40
.LBB100_33:
	ldrb	r1, [r12, #21]
	cmp	r1, #0
	beq	.LBB100_36
	cmp	lr, r5
	bls	.LBB100_43
	mov	r1, #0
	str	r8, [sp, #40]
	str	r1, [sp, #44]
	ldr	r1, [r12]
	ldr	r1, [r1, r5, lsl #2]
	ldr	r7, [r1, #16]
	ldr	r1, [r1, #20]
	str	r1, [sp, #52]
	add	r1, sp, #40
	str	r7, [sp, #48]
	b	.LBB100_39
.LBB100_36:
	orrs	r1, r5, r4
	beq	.LBB100_40
	sub	r4, r5, #1
	cmp	r4, lr
	bhs	.LBB100_44
	mov	r1, #0
	str	r8, [sp, #24]
	str	r1, [sp, #28]
	ldr	r1, [r12]
	ldr	r1, [r1, r4, lsl #2]
	ldr	r7, [r1, #16]
	ldr	r1, [r1, #20]
	str	r1, [sp, #36]
	add	r1, sp, #24
	str	r7, [sp, #32]
.LBB100_39:
	bl	"fmt::fmt_arg"
	b	.LBB100_42
.LBB100_40:
	ldr	r4, [r0, #40]
	cmp	r4, #0
	beq	.LBB100_42
	mov	r2, #0
	ldr	r1, [r0, #44]
	str	r2, [sp, #80]
	mov	r5, r0
	str	r2, [sp, #76]
	str	r2, [sp, #72]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	mov	r2, #3
	str	r3, [sp, #20]
	str	r2, [sp]
	add	r2, sp, #72
	ldr	r3, .LCPI100_0
	mov	r0, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r5, #84]
	ldr	r1, [sp, #72]
	add	r0, r0, r1
	str	r0, [r5, #84]
.LBB100_42:
	add	sp, sp, #88
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
.LBB100_43:
	ldr	r0, .LCPI100_24
	mov	r2, #189
	stm	sp, {r5, lr}
	b	.LBB100_45
.LBB100_44:
	stm	sp, {r4, lr}
	mov	r2, #194
	ldr	r0, .LCPI100_24
.LBB100_45:
	orr	r2, r2, #2560
	mov	r1, #43
	mov	r3, #23
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB100_46:
	ldr	r0, [r3, #16]
	ldr	r4, .LCPI100_21
	cmp	r0, #0
	ldr	r2, .LCPI100_27
	movne	r4, r0
	ldr	r0, .LCPI100_26
	ldr	r1, .LCPI100_25
	str	r3, [sp, #4]
	mov	r3, #22
	str	r1, [sp]
	mov	r1, #5
	mov	lr, pc
	mov	pc, r4
	.p2align	2
.LCPI100_0:
	.long	".Lcsbs$POC-Example$11c"
.LCPI100_1:
	.long	1402735377
.LCPI100_2:
	.long	3728466314
.LCPI100_3:
	.long	1611042776
.LCPI100_4:
	.long	159261011
.LCPI100_5:
	.long	159261012
.LCPI100_6:
	.long	4093975810
.LCPI100_7:
	.long	2078322779
.LCPI100_8:
	.long	3728466315
.LCPI100_9:
	.long	3422454003
.LCPI100_10:
	.long	1571068702
.LCPI100_11:
	.long	1032104133
.LCPI100_12:
	.long	3853066514
.LCPI100_13:
	.long	3853066515
.LCPI100_14:
	.long	1680707819
.LCPI100_15:
	.long	1338159828
.LCPI100_16:
	.long	2513395067
.LCPI100_17:
	.long	3191702550
.LCPI100_18:
	.long	2602103172
.LCPI100_19:
	.long	512274138
.LCPI100_20:
	.long	".Lscl$[fmt_union76085]"
.LCPI100_21:
	.long	"runtime::default_assertion_failure_proc"
.LCPI100_22:
	.long	".Lcsbs$POC-Example$1aa"
.LCPI100_23:
	.long	".Lcsbs$POC-Example$198"
.LCPI100_24:
	.long	".Lcsbs$POC-Example$156"
.LCPI100_25:
	.long	".Lscl$[fmt_union76049]"
.LCPI100_26:
	.long	".Lcsbs$POC-Example$17b"
.LCPI100_27:
	.long	".Lcsbs$POC-Example$196"
.Lfunc_end100:
	.size	"fmt::fmt_union", .Lfunc_end100-"fmt::fmt_union"
	.fnend

	.p2align	2
	.type	"fmt::fmt_matrix",%function
	.code	32
"fmt::fmt_matrix":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#100
	sub	sp, sp, #100
	mov	r7, r3
	mov	r3, r1
	ldr	r5, [r0, #40]
	mov	r4, r0
	ldr	r1, [r0, #44]
	cmp	r2, #119
	ldr	r0, [r3]
	str	r0, [sp, #32]
	str	r2, [sp, #36]
	bne	.LBB101_3
	mov	r0, #123
	cmp	r5, #0
	strb	r0, [sp, #79]
	beq	.LBB101_7
	mov	r0, #0
	str	r0, [sp, #88]
	str	r0, [sp, #84]
	str	r0, [sp, #80]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	b	.LBB101_6
.LBB101_3:
	cmp	r5, #0
	beq	.LBB101_7
	ldr	r0, [sp, #136]
	mov	r6, #0
	str	r0, [sp, #20]
	mov	r0, #6
	ldr	r3, .LCPI101_0
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #80
	str	r6, [sp, #88]
	str	r6, [sp, #84]
	str	r6, [sp, #80]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r2, [sp, #80]
	ldr	r5, [r4, #40]
	ldr	r1, [r4, #44]
	add	r0, r0, r2
	str	r0, [r4, #84]
	mov	r0, #91
	cmp	r5, #0
	strb	r0, [sp, #79]
	beq	.LBB101_7
	str	r6, [sp, #88]
	str	r6, [sp, #84]
	str	r6, [sp, #80]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
.LBB101_6:
	ldr	r0, [sp, #136]
	add	r3, sp, #79
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #80
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB101_7:
	ldr	r0, [r4, #20]
	add	r0, r0, #1
	str	r0, [r4, #20]
	ldrb	r0, [r4, #4]
	cmp	r0, #0
	beq	.LBB101_34
	ldr	r5, [r4, #40]
	mov	r0, #10
	ldr	r1, [r4, #44]
	cmp	r5, #0
	strb	r0, [sp, #79]
	beq	.LBB101_10
	mov	r0, #0
	add	r3, sp, #79
	str	r0, [sp, #88]
	mov	r2, #4
	str	r0, [sp, #84]
	str	r0, [sp, #80]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #136]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #80
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB101_10:
	ldr	r0, [r7, #12]
	cmp	r0, #1
	blt	.LBB101_53
	add	r0, sp, #56
	mov	r9, #0
	add	r8, r0, #8
	mov	r10, #9
	mov	r11, #0
	b	.LBB101_13
.LBB101_12:
	ldr	r0, [r7, #12]
	add	r11, r11, #1
	cmp	r11, r0
	bge	.LBB101_53
.LBB101_13:
	ldr	r0, [r4, #20]
	cmp	r0, #1
	blt	.LBB101_18
	mov	r5, #0
	b	.LBB101_16
.LBB101_15:
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB101_18
.LBB101_16:
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r10, [sp, #79]
	beq	.LBB101_15
	ldr	r0, [sp, #136]
	add	r3, sp, #79
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #80
	mov	r2, #4
	str	r9, [sp, #88]
	str	r9, [sp, #84]
	str	r9, [sp, #80]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #80]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB101_15
.LBB101_18:
	ldr	r0, [r7, #16]
	cmp	r0, #1
	blt	.LBB101_32
	ldrb	r2, [r7, #20]
	mov	r1, r11
	cmp	r2, #0
	beq	.LBB101_22
	mov	r0, #0
	cmp	r2, #1
	bne	.LBB101_23
	ldr	r0, [r7, #8]
	mul	r1, r0, r11
.LBB101_22:
	ldr	r2, [r7, #4]
	mul	r0, r1, r2
.LBB101_23:
	ldr	r1, [r7]
	ldr	r3, [sp, #136]
	str	r9, [sp, #60]
	ldr	r2, [r1, #16]
	ldr	r1, [r1, #20]
	str	r1, [r8, #4]
	ldr	r1, [sp, #32]
	str	r2, [r8]
	ldr	r2, [sp, #36]
	add	r0, r0, r1
	add	r1, sp, #56
	str	r0, [sp, #56]
	mov	r0, r4
	bl	"fmt::fmt_arg"
	ldr	r0, [r7, #16]
	cmp	r0, #2
	blt	.LBB101_32
	mov	r5, #1
	b	.LBB101_28
.LBB101_25:
	mov	r1, r11
	mov	r2, r5
.LBB101_26:
	ldr	r0, [r7, #8]
	ldr	r3, [r7, #4]
	mla	r6, r0, r1, r2
	mul	r0, r6, r3
.LBB101_27:
	ldr	r1, [r7]
	ldr	r3, [sp, #136]
	str	r9, [sp, #60]
	ldr	r2, [r1, #16]
	ldr	r1, [r1, #20]
	str	r1, [r8, #4]
	ldr	r1, [sp, #32]
	str	r2, [r8]
	ldr	r2, [sp, #36]
	add	r0, r0, r1
	add	r1, sp, #56
	str	r0, [sp, #56]
	mov	r0, r4
	bl	"fmt::fmt_arg"
	ldr	r0, [r7, #16]
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB101_32
.LBB101_28:
	ldr	r6, [r4, #40]
	cmp	r6, #0
	beq	.LBB101_30
	ldr	r0, [sp, #136]
	mov	r2, #4
	ldr	r1, [r4, #44]
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI101_1
	str	r0, [sp]
	add	r0, sp, #80
	str	r9, [sp, #88]
	str	r9, [sp, #84]
	str	r9, [sp, #80]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB101_30:
	ldrb	r1, [r7, #20]
	cmp	r1, #1
	beq	.LBB101_25
	cmp	r1, #0
	mov	r0, #0
	mov	r1, r5
	mov	r2, r11
	beq	.LBB101_26
	b	.LBB101_27
.LBB101_32:
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB101_12
	ldr	r0, [sp, #136]
	mov	r2, #4
	ldr	r1, [r4, #44]
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI101_2
	str	r0, [sp]
	add	r0, sp, #80
	str	r9, [sp, #88]
	str	r9, [sp, #84]
	str	r9, [sp, #80]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB101_12
.LBB101_34:
	ldr	r0, [r7, #12]
	cmp	r0, #1
	blt	.LBB101_53
	ldr	r0, [sp, #36]
	add	r10, sp, #40
	ldr	r1, .LCPI101_1
	add	r8, r10, #8
	ldr	r2, .LCPI101_3
	cmp	r0, #119
	mov	r9, #0
	mov	r11, #0
	moveq	r2, r1
	str	r2, [sp, #28]
	b	.LBB101_37
.LBB101_36:
	ldr	r0, [r7, #12]
	add	r11, r11, #1
	cmp	r11, r0
	bge	.LBB101_53
.LBB101_37:
	cmp	r11, #0
	ldrne	r5, [r4, #40]
	cmpne	r5, #0
	beq	.LBB101_39
	ldr	r0, [sp, #136]
	mov	r2, #4
	ldr	r1, [r4, #44]
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, [sp, #28]
	str	r0, [sp]
	add	r0, sp, #80
	str	r9, [sp, #88]
	str	r9, [sp, #84]
	str	r9, [sp, #80]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB101_39:
	ldr	r0, [r7, #16]
	cmp	r0, #1
	blt	.LBB101_36
	ldrb	r2, [r7, #20]
	mov	r1, r11
	cmp	r2, #0
	beq	.LBB101_43
	mov	r0, #0
	cmp	r2, #1
	bne	.LBB101_44
	ldr	r0, [r7, #8]
	mul	r1, r0, r11
.LBB101_43:
	ldr	r2, [r7, #4]
	mul	r0, r1, r2
.LBB101_44:
	ldr	r1, [r7]
	ldr	r3, [sp, #136]
	str	r9, [sp, #44]
	ldr	r2, [r1, #16]
	ldr	r1, [r1, #20]
	str	r1, [r8, #4]
	ldr	r1, [sp, #32]
	str	r2, [r8]
	ldr	r2, [sp, #36]
	add	r0, r0, r1
	str	r0, [sp, #40]
	mov	r0, r4
	mov	r1, r10
	bl	"fmt::fmt_arg"
	ldr	r0, [r7, #16]
	cmp	r0, #2
	blt	.LBB101_36
	mov	r5, #1
	b	.LBB101_49
.LBB101_46:
	mov	r1, r11
	mov	r2, r5
.LBB101_47:
	ldr	r0, [r7, #8]
	ldr	r3, [r7, #4]
	mla	r6, r0, r1, r2
	mul	r0, r6, r3
.LBB101_48:
	ldr	r1, [r7]
	ldr	r3, [sp, #136]
	str	r9, [sp, #44]
	ldr	r2, [r1, #16]
	ldr	r1, [r1, #20]
	str	r1, [r8, #4]
	ldr	r1, [sp, #32]
	str	r2, [r8]
	ldr	r2, [sp, #36]
	add	r0, r0, r1
	str	r0, [sp, #40]
	mov	r0, r4
	mov	r1, r10
	bl	"fmt::fmt_arg"
	ldr	r0, [r7, #16]
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB101_36
.LBB101_49:
	ldr	r6, [r4, #40]
	cmp	r6, #0
	beq	.LBB101_51
	ldr	r0, [sp, #136]
	mov	r2, #4
	ldr	r1, [r4, #44]
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI101_1
	str	r0, [sp]
	add	r0, sp, #80
	str	r9, [sp, #88]
	str	r9, [sp, #84]
	str	r9, [sp, #80]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB101_51:
	ldrb	r1, [r7, #20]
	cmp	r1, #1
	beq	.LBB101_46
	cmp	r1, #0
	mov	r0, #0
	mov	r1, r5
	mov	r2, r11
	beq	.LBB101_47
	b	.LBB101_48
.LBB101_53:
	ldr	r0, [r4, #20]
	ldrb	r1, [r4, #4]
	sub	r0, r0, #1
	str	r0, [r4, #20]
	cmp	r1, #0
	beq	.LBB101_59
	cmp	r0, #1
	blt	.LBB101_59
	add	r9, sp, #79
	add	r10, sp, #80
	mov	r8, #1
	mov	r5, #0
	mov	r11, #9
	mov	r7, #0
	b	.LBB101_57
.LBB101_56:
	add	r7, r7, #1
	cmp	r7, r0
	bge	.LBB101_59
.LBB101_57:
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r11, [sp, #79]
	beq	.LBB101_56
	ldr	r0, [sp, #136]
	mov	r2, #4
	str	r0, [sp, #20]
	mov	r0, r10
	mov	r3, r9
	str	r5, [sp, #88]
	str	r5, [sp, #84]
	str	r5, [sp, #80]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #80]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB101_56
.LBB101_59:
	ldr	r1, [sp, #36]
	mov	r0, #93
	ldr	r5, [r4, #40]
	cmp	r1, #119
	ldr	r1, [r4, #44]
	moveq	r0, #125
	cmp	r5, #0
	strb	r0, [sp, #79]
	beq	.LBB101_61
	mov	r0, #0
	add	r3, sp, #79
	str	r0, [sp, #88]
	mov	r2, #4
	str	r0, [sp, #84]
	str	r0, [sp, #80]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #136]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #80
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #80]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB101_61:
	add	sp, sp, #100
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI101_0:
	.long	".Lcsbs$POC-Example$199"
.LCPI101_1:
	.long	".Lcsbs$POC-Example$130"
.LCPI101_2:
	.long	".Lcsbs$POC-Example$187"
.LCPI101_3:
	.long	".Lcsbs$POC-Example$149"
.Lfunc_end101:
	.size	"fmt::fmt_matrix", .Lfunc_end101-"fmt::fmt_matrix"
	.fnend

	.p2align	2
	.type	"fmt::fmt_bit_field",%function
	.code	32
"fmt::fmt_bit_field":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#132
	sub	sp, sp, #132
	ldr	r6, [r0, #40]
	mov	r4, r0
	ldr	r9, [r1]
	ldr	r8, [sp, #176]
	cmp	r6, #0
	str	r3, [sp, #52]
	str	r2, [sp, #40]
	beq	.LBB102_3
	ldr	r12, [sp, #168]
	cmp	r2, #119
	ldr	r3, .LCPI102_0
	mov	r5, #0
	ldr	r0, [sp, #172]
	moveq	r3, r12
	subs	r7, r2, #119
	ldr	r1, [r4, #44]
	movne	r7, #9
	cmp	r0, #0
	mov	r2, #4
	movne	r7, r0
	add	r0, sp, #112
	movne	r3, r12
	str	r5, [sp, #120]
	str	r5, [sp, #116]
	str	r5, [sp, #112]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r8, [sp, #20]
	str	r7, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r2, [sp, #112]
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	add	r0, r0, r2
	str	r0, [r4, #84]
	mov	r0, #123
	cmp	r6, #0
	strb	r0, [sp, #104]
	beq	.LBB102_3
	mov	r0, #1
	add	r3, sp, #104
	str	r0, [sp]
	add	r0, sp, #112
	mov	r2, #4
	str	r5, [sp, #120]
	str	r5, [sp, #116]
	str	r5, [sp, #112]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #112]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB102_3:
	ldrb	r6, [r4, #4]
	ldr	r0, [r4, #20]
	cmp	r6, #0
	str	r0, [sp, #28]
	add	r0, r0, #1
	str	r0, [r4, #20]
	beq	.LBB102_6
	ldr	r5, [r4, #40]
	mov	r0, #10
	ldr	r1, [r4, #44]
	cmp	r5, #0
	strb	r0, [sp, #104]
	beq	.LBB102_6
	mov	r0, #0
	add	r3, sp, #104
	str	r0, [sp, #120]
	mov	r2, #4
	str	r0, [sp, #116]
	str	r0, [sp, #112]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #112
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #112]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB102_6:
	ldr	r0, [sp, #52]
	str	r9, [sp, #36]
	str	r4, [sp, #44]
	ldr	r1, [r0, #24]
	str	r1, [sp, #68]
	cmp	r1, #0
	bmi	.LBB102_72
	str	r6, [sp, #60]
	beq	.LBB102_63
	ldr	r1, [r0, #4]
	mov	r5, #1
	str	r1, [sp, #64]
	add	r1, sp, #72
	add	r1, r1, #8
	str	r1, [sp, #32]
	mvn	r1, #0
	mov	r6, #0
	mov	r8, #0
	str	r1, [sp, #56]
	b	.LBB102_10
.LBB102_9:
	ldr	r0, [sp, #56]
	add	r8, r8, #1
	mov	r5, #1
	mov	r6, #0
	add	r0, r0, #1
	str	r0, [sp, #56]
	ldr	r0, [sp, #68]
	cmp	r8, r0
	ldr	r0, [sp, #52]
	bge	.LBB102_63
.LBB102_10:
	ldr	r4, [r0, #20]
.LBB102_11:
	ldr	r0, [sp, #64]
	ldr	r3, .LCPI102_2
	ldr	r10, [r0, r8, lsl #3]!
	ldr	r7, [r0, #4]
	mov	r0, r4
	str	r6, [sp, #112]
	str	r6, [sp, #116]
	strb	r6, [sp, #120]
	ldr	r1, [r0, r8, lsl #3]!
	ldr	r2, [r0, #4]
	mov	r0, #3
	str	r0, [sp]
	add	r0, sp, #112
	bl	"reflect::struct_tag_lookup"
	ldrb	r0, [sp, #120]
	cmp	r0, #0
	beq	.LBB102_20
	ldr	r1, [sp, #112]
	add	r0, sp, #96
	ldr	r2, [sp, #116]
	str	r6, [sp, #100]
	str	r6, [sp, #96]
	bl	"strings::trim_space"
	ldr	r9, [sp, #100]
	ldr	r11, [sp, #96]
	cmp	r9, #1
	bne	.LBB102_15
	ldr	r0, .LCPI102_3
	cmp	r11, r0
	ldrbne	r0, [r11]
	cmpne	r0, #45
	bne	.LBB102_16
	ldr	r0, [sp, #68]
	add	r8, r8, #1
	mov	r6, #0
	cmp	r8, r0
	blt	.LBB102_11
	b	.LBB102_63
.LBB102_15:
	ldr	r0, [sp, #40]
	cmp	r9, #0
	beq	.LBB102_22
.LBB102_16:
	mov	r0, #0
	mov	r1, r11
	str	r0, [sp, #108]
	mov	r2, r9
	str	r0, [sp, #104]
	add	r0, sp, #104
	bl	"utf8::decode_rune_in_bytes"
	ldr	r0, [sp, #108]
	cmp	r0, #0
	bmi	.LBB102_73
	cmp	r0, r9
	bgt	.LBB102_73
	ldr	r1, [sp, #104]
	cmp	r9, r0
	bne	.LBB102_21
	mov	r0, r1
	b	.LBB102_22
.LBB102_20:
	ldr	r0, [sp, #40]
	b	.LBB102_22
.LBB102_21:
	ldrb	r0, [r11, r0]
	cmp	r0, #44
	ldr	r0, [sp, #40]
	moveq	r0, r1
.LBB102_22:
	str	r0, [sp, #48]
	ldr	r0, [sp, #60]
	cmp	r0, #0
	bne	.LBB102_26
	ldr	r0, [sp, #56]
	cmn	r0, #-2147483646
	bhi	.LBB102_26
	ldr	r11, [sp, #44]
	ldr	r9, [sp, #176]
	ldr	r4, [r11, #40]
	cmp	r4, #0
	beq	.LBB102_32
	mov	r0, #0
	ldr	r1, [r11, #44]
	str	r0, [sp, #120]
	mov	r2, #4
	str	r0, [sp, #116]
	str	r0, [sp, #112]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	ldr	r3, .LCPI102_4
	str	r0, [sp]
	add	r0, sp, #112
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	b	.LBB102_32
.LBB102_26:
	ldr	r0, [sp, #60]
	ldr	r11, [sp, #44]
	ldr	r9, [sp, #176]
	cmp	r0, #0
	beq	.LBB102_32
	ldr	r0, [r11, #20]
	cmp	r0, #1
	blt	.LBB102_32
	mov	r6, #0
	b	.LBB102_30
.LBB102_29:
	add	r6, r6, #1
	cmp	r6, r0
	bge	.LBB102_32
.LBB102_30:
	ldr	r4, [r11, #40]
	mov	r2, #9
	ldr	r1, [r11, #44]
	cmp	r4, #0
	strb	r2, [sp, #104]
	beq	.LBB102_29
	mov	r0, #0
	add	r3, sp, #104
	str	r0, [sp, #120]
	mov	r2, #4
	str	r0, [sp, #116]
	str	r0, [sp, #112]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #112
	str	r9, [sp, #20]
	str	r5, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r11, #20]
	ldr	r1, [r11, #84]
	ldr	r2, [sp, #112]
	add	r1, r1, r2
	str	r1, [r11, #84]
	b	.LBB102_29
.LBB102_32:
	ldr	r4, [r11, #40]
	cmp	r4, #0
	beq	.LBB102_35
	mov	r0, #0
	ldr	r1, [r11, #44]
	str	r0, [sp, #120]
	mov	r2, #4
	str	r0, [sp, #116]
	mov	r3, r10
	str	r0, [sp, #112]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	add	r0, sp, #112
	str	r9, [sp, #20]
	str	r7, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r6, [r11, #40]
	mov	r5, #1
	ldr	r1, [r11, #44]
	ldr	r10, [sp, #36]
	cmp	r6, #0
	ldr	r0, [r11, #84]
	ldr	r2, [sp, #112]
	add	r0, r0, r2
	str	r0, [r11, #84]
	beq	.LBB102_36
	mov	r0, #0
	ldr	r3, .LCPI102_5
	str	r0, [sp, #120]
	mov	r2, #4
	str	r0, [sp, #116]
	str	r0, [sp, #112]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	str	r0, [sp]
	add	r0, sp, #112
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r11, #84]
	ldr	r1, [sp, #112]
	add	r0, r0, r1
	str	r0, [r11, #84]
	b	.LBB102_36
.LBB102_35:
	ldr	r10, [sp, #36]
	mov	r5, #1
.LBB102_36:
	ldr	r2, [sp, #52]
	ldr	r0, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r12, [r0, r8, lsl #2]
	ldr	lr, [r1, r8, lsl #2]
	cmp	lr, #0
	beq	.LBB102_41
	ldr	r0, [r2, #16]
	mov	r2, #0
	mov	r3, #0
	mov	r6, #0
	ldr	r7, [r0, r8, lsl #2]
	b	.LBB102_39
.LBB102_38:
	add	r6, r6, #1
	cmp	lr, r6
	beq	.LBB102_42
.LBB102_39:
	add	r0, r7, r6
	ldrb	r4, [r10, r0, lsr #3]
	and	r0, r0, #7
	tst	r5, r4, lsr r0
	beq	.LBB102_38
	rsb	r1, r6, #32
	subs	r4, r6, #32
	lsl	r0, r5, r6
	lsr	r1, r5, r1
	movpl	r0, #0
	lslpl	r1, r5, r4
	cmp	r6, #64
	orrlo	r3, r3, r1
	orrlo	r2, r2, r0
	b	.LBB102_38
.LBB102_41:
	mov	r2, #0
	mov	r3, #0
.LBB102_42:
	cmp	r12, #0
	str	r2, [sp, #88]
	str	r3, [sp, #92]
	beq	.LBB102_59
	mov	r0, r12
	b	.LBB102_46
.LBB102_44:
	add	r6, r0, #32
.LBB102_45:
	ldr	r0, [r6]
.LBB102_46:
	ldr	r1, [r0, #64]
	ldr	r4, [r0, #68]
	subs	r7, r1, #1
	sbc	r1, r4, #0
	rsbs	r4, r7, #26
	rscs	r1, r1, #0
	blo	.LBB102_52
	adr	r1, .LJTI102_0
	add	r6, r0, #24
	ldr	pc, [r1, r7, lsl #2]
	.p2align	2
.LJTI102_0:
	.long	.LBB102_44
	.long	.LBB102_50
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_45
	.long	.LBB102_52
	.long	.LBB102_49
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_52
	.long	.LBB102_45
.LBB102_49:
	ldr	r0, [r0, #28]
	cmp	r0, #0
	bne	.LBB102_46
	b	.LBB102_52
.LBB102_50:
	ldrb	r0, [r0, #25]
	cmp	r0, #2
	bne	.LBB102_52
	ldr	r0, [r12]
	mov	r4, #0
	lsl	r1, r0, #3
	rsbs	r0, lr, r0, lsl #3
	rsb	r7, r0, #32
	rsc	r1, r4, r1, asr #31
	subs	r6, r0, #32
	lsl	r4, r2, r0
	lsr	r7, r2, r7
	orr	r3, r7, r3, lsl r0
	lslpl	r3, r2, r6
	movpl	r4, #0
	subs	r0, r0, #64
	mov	r2, #0
	sbcs	r0, r1, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r4
	str	r3, [sp, #92]
	str	r2, [sp, #88]
.LBB102_52:
	mov	r0, r12
	b	.LBB102_55
.LBB102_53:
	add	r6, r0, #32
.LBB102_54:
	ldr	r0, [r6]
.LBB102_55:
	ldr	r1, [r0, #64]
	ldr	r4, [r0, #68]
	subs	r7, r1, #1
	sbc	r1, r4, #0
	rsbs	r4, r7, #26
	rscs	r1, r1, #0
	blo	.LBB102_59
	adr	r1, .LJTI102_1
	add	r6, r0, #24
	ldr	pc, [r1, r7, lsl #2]
	.p2align	2
.LJTI102_1:
	.long	.LBB102_53
	.long	.LBB102_58
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_54
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_59
	.long	.LBB102_54
.LBB102_58:
	ldrb	r0, [r0, #24]
	mov	r6, #0
	ldr	r10, [sp, #60]
	cmp	r0, #0
	bne	.LBB102_60
	b	.LBB102_61
.LBB102_59:
	ldr	r10, [sp, #60]
	mov	r6, #0
.LBB102_60:
	rsb	r7, lr, #33
	sub	r0, lr, #1
	subs	r4, lr, #33
	lsl	r1, r5, r0
	lsr	r7, r5, r7
	movpl	r1, #0
	lslpl	r7, r5, r4
	cmp	r0, #64
	movhs	r1, r6
	eor	r0, r2, r1
	movhs	r7, r6
	subs	r0, r0, r1
	str	r0, [sp, #88]
	eor	r0, r3, r7
	sbc	r0, r0, r7
	str	r0, [sp, #92]
.LBB102_61:
	ldr	r0, [r12, #16]
	mov	r3, r9
	ldr	r2, [sp, #32]
	ldr	r1, [r12, #20]
	stm	r2, {r0, r1}
	add	r0, sp, #88
	add	r1, sp, #72
	ldr	r2, [sp, #48]
	str	r0, [sp, #72]
	mov	r0, r11
	str	r6, [sp, #76]
	bl	"fmt::fmt_value"
	cmp	r10, #0
	ldrne	r4, [r11, #40]
	cmpne	r4, #0
	beq	.LBB102_9
	mov	r0, #0
	ldr	r1, [r11, #44]
	str	r0, [sp, #120]
	mov	r2, #4
	str	r0, [sp, #116]
	str	r0, [sp, #112]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #2
	ldr	r3, .LCPI102_6
	str	r0, [sp]
	add	r0, sp, #112
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r11, #84]
	ldr	r1, [sp, #112]
	add	r0, r0, r1
	str	r0, [r11, #84]
	b	.LBB102_9
.LBB102_63:
	ldr	r0, [sp, #60]
	ldr	r7, [sp, #44]
	ldr	r11, [sp, #28]
	cmp	r0, #0
	beq	.LBB102_69
	cmp	r11, #1
	blt	.LBB102_69
	add	r9, sp, #104
	add	r10, sp, #112
	mov	r8, #1
	mov	r5, #9
	mov	r6, #0
	b	.LBB102_67
.LBB102_66:
	subs	r11, r11, #1
	beq	.LBB102_69
.LBB102_67:
	ldr	r4, [r7, #40]
	ldr	r1, [r7, #44]
	cmp	r4, #0
	strb	r5, [sp, #104]
	beq	.LBB102_66
	ldr	r2, [sp, #176]
	mov	r0, r10
	str	r2, [sp, #20]
	mov	r2, #4
	mov	r3, r9
	str	r6, [sp, #120]
	str	r6, [sp, #116]
	str	r6, [sp, #112]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r7, #84]
	ldr	r1, [sp, #112]
	add	r0, r0, r1
	str	r0, [r7, #84]
	b	.LBB102_66
.LBB102_69:
	ldr	r5, [r7, #40]
	mov	r0, #125
	ldr	r1, [r7, #44]
	cmp	r5, #0
	strb	r0, [sp, #104]
	beq	.LBB102_71
	mov	r0, #0
	add	r3, sp, #104
	str	r0, [sp, #120]
	mov	r2, #4
	str	r0, [sp, #116]
	str	r0, [sp, #112]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #176]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #112
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r7, #84]
	ldr	r1, [sp, #112]
	add	r0, r0, r1
	str	r0, [r7, #84]
.LBB102_71:
	ldr	r0, [sp, #60]
	strb	r0, [r7, #4]
	ldr	r0, [r7, #20]
	sub	r0, r0, #1
	str	r0, [r7, #20]
	add	sp, sp, #132
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB102_72:
	ldr	r0, [sp, #68]
	mov	r2, #58
	str	r0, [sp]
	orr	r2, r2, #2816
	ldr	r0, .LCPI102_1
	mov	r1, #43
	mov	r3, #27
	bl	"runtime::multi_pointer_slice_handle_error"
.LBB102_73:
	mov	r2, #29
	stm	sp, {r0, r9}
	orr	r2, r2, #2816
	ldr	r0, .LCPI102_1
	mov	r1, #43
	mov	r3, #17
	str	r9, [sp, #8]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI102_0:
	.long	".Lcsbs$POC-Example$19a"
.LCPI102_1:
	.long	".Lcsbs$POC-Example$156"
.LCPI102_2:
	.long	".Lcsbs$POC-Example$188"
.LCPI102_3:
	.long	".Lcsbs$POC-Example$189"
.LCPI102_4:
	.long	".Lcsbs$POC-Example$130"
.LCPI102_5:
	.long	".Lcsbs$POC-Example$18f"
.LCPI102_6:
	.long	".Lcsbs$POC-Example$187"
.Lfunc_end102:
	.size	"fmt::fmt_bit_field", .Lfunc_end102-"fmt::fmt_bit_field"
	.fnend

	.p2align	2
	.type	"fmt::[fmt.odin]::fmt_pointer_from_value",%function
	.code	32
"fmt::[fmt.odin]::fmt_pointer_from_value":
	.fnstart
	.save	{r4, r5, r6, r7, r8, lr}
	push	{r4, r5, r6, r7, r8, lr}
	.pad	#72
	sub	sp, sp, #72
	mov	r8, r3
	ldr	r6, [r1]
	ldr	r3, [r1, #8]
	ldr	r1, [r1, #12]
	ldr	r7, .LCPI103_0
	eor	r1, r1, r7
	ldr	r7, .LCPI103_1
	eor	r3, r3, r7
	orrs	r1, r3, r1
	ldr	r3, [sp, #96]
	bne	.LBB103_3
	ldr	r4, [r6]
	ldr	r1, [r0, #40]
	ldr	r2, [r0, #44]
	add	r0, r0, #84
	stm	sp, {r0, r3}
	add	r0, sp, #44
	mov	r3, r4
	bl	"reflect::write_type_writer"
.LBB103_2:
	add	sp, sp, #72
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
.LBB103_3:
	ldr	r1, [r6]
	cmp	r8, #112
	cmpne	r2, #0
	bne	.LBB103_5
.LBB103_4:
	mov	r2, r8
	add	sp, sp, #72
	pop	{r4, r5, r6, r7, r8, lr}
	b	"fmt::fmt_pointer"
.LBB103_5:
	mov	r7, #0
	ldr	r4, [r2, #20]
	str	r7, [sp, #28]
	ldr	r7, [r2, #16]
	str	r1, [sp, #24]
	ldr	r5, [r2, #64]
	ldr	r6, [r2, #68]
	str	r4, [sp, #36]
	str	r7, [sp, #32]
.LBB103_6:
	eor	r7, r5, #1
	orrs	r7, r7, r6
	bne	.LBB103_8
	ldr	r2, [r2, #32]
	ldr	r5, [r2, #64]
	ldr	r6, [r2, #68]
	b	.LBB103_6
.LBB103_8:
	rsbs	r2, r5, #27
	rscs	r2, r6, #0
	blo	.LBB103_4
	mov	r7, #212992
	mov	r2, #1
	orr	r7, r7, #4194304
	tst	r7, r2, lsl r5
	beq	.LBB103_14
	cmp	r1, #0
	beq	.LBB103_20
	ldr	r2, [r0, #64]
	cmp	r2, #0
	bgt	.LBB103_4
	add	r1, r2, #1
	str	r1, [r0, #64]
	ldr	r5, [r0, #40]
	mov	r2, #38
	ldr	r1, [r0, #44]
	cmp	r5, #0
	strb	r2, [sp, #55]
	beq	.LBB103_19
	mov	r2, #0
	add	r12, sp, #55
	str	r2, [sp, #64]
	mov	r6, r0
	str	r2, [sp, #60]
	mov	r7, r3
	str	r2, [sp, #56]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	mov	r2, #1
	str	r2, [sp]
	add	r2, sp, #56
	str	r3, [sp, #20]
	mov	r3, r12
	mov	r0, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	mov	r3, r7
	mov	r0, r6
	b	.LBB103_19
.LBB103_14:
	mov	r7, #1572864
	orr	r7, r7, #134217728
	tst	r7, r2, lsl r5
	beq	.LBB103_4
	cmp	r1, #0
	beq	.LBB103_20
	ldr	r2, [r0, #64]
	cmp	r2, #0
	bgt	.LBB103_4
	add	r1, r2, #1
	str	r1, [r0, #64]
	ldr	r6, [r0, #40]
	mov	r2, #38
	ldr	r1, [r0, #44]
	cmp	r6, #0
	strb	r2, [sp, #55]
	beq	.LBB103_19
	mov	r2, #0
	add	r12, sp, #55
	str	r2, [sp, #64]
	mov	r7, r0
	str	r2, [sp, #60]
	mov	r5, r3
	str	r2, [sp, #56]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	mov	r2, #1
	str	r2, [sp]
	add	r2, sp, #56
	str	r3, [sp, #20]
	mov	r3, r12
	mov	r0, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r6
	ldr	r1, [r7, #84]
	mov	r3, r5
	ldr	r2, [sp, #56]
	mov	r0, r7
	add	r1, r1, r2
	str	r1, [r7, #84]
.LBB103_19:
	add	r1, sp, #24
	mov	r2, r8
	mov	r5, r0
	bl	"fmt::fmt_value"
	ldr	r0, [r5, #64]
	sub	r0, r0, #1
	str	r0, [r5, #64]
	b	.LBB103_2
.LBB103_20:
	ldr	r4, [r0, #40]
	cmp	r4, #0
	beq	.LBB103_2
	mov	r2, #0
	ldr	r1, [r0, #44]
	str	r2, [sp, #64]
	mov	r5, r0
	str	r2, [sp, #60]
	str	r2, [sp, #56]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	mov	r2, #5
	str	r3, [sp, #20]
	str	r2, [sp]
	add	r2, sp, #56
	ldr	r3, .LCPI103_2
	mov	r0, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r5, #84]
	ldr	r1, [sp, #56]
	add	r0, r0, r1
	str	r0, [r5, #84]
	b	.LBB103_2
	.p2align	2
.LCPI103_0:
	.long	27237293
.LCPI103_1:
	.long	1385839624
.LCPI103_2:
	.long	".Lcsbs$POC-Example$169"
.Lfunc_end103:
	.size	"fmt::[fmt.odin]::fmt_pointer_from_value", .Lfunc_end103-"fmt::[fmt.odin]::fmt_pointer_from_value"
	.fnend

	.p2align	2
	.type	"fmt::[fmt.odin]::fmt_multi_pointer",%function
	.code	32
"fmt::[fmt.odin]::fmt_multi_pointer":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r11, lr}
	.pad	#56
	sub	sp, sp, #56
	ldr	r1, [r1]
	mov	r12, r3
	ldr	r3, [sp, #88]
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.LBB104_3
	cmp	r12, #112
	cmpne	r2, #0
	bne	.LBB104_5
.LBB104_2:
	mov	r2, r12
	add	sp, sp, #56
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	b	"fmt::fmt_pointer"
.LBB104_3:
	ldr	r4, [r0, #40]
	cmp	r4, #0
	beq	.LBB104_14
	mov	r2, #0
	ldr	r1, [r0, #44]
	str	r2, [sp, #48]
	mov	r5, r0
	str	r2, [sp, #44]
	str	r2, [sp, #40]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	mov	r2, #5
	str	r3, [sp, #20]
	str	r2, [sp]
	add	r2, sp, #40
	ldr	r3, .LCPI104_9
	mov	r0, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r5, #84]
	ldr	r1, [sp, #40]
	add	r0, r0, r1
	str	r0, [r5, #84]
	b	.LBB104_14
.LBB104_5:
	mov	r7, #0
	ldr	r5, [r2, #16]
	ldr	r4, [r2, #20]
	str	r7, [sp, #28]
	str	r1, [sp, #24]
	ldr	r7, [r2, #64]
	ldr	r6, [r2, #68]
	str	r4, [sp, #36]
	str	r5, [sp, #32]
.LBB104_6:
	eor	r5, r7, #1
	orrs	r5, r5, r6
	bne	.LBB104_8
	ldr	r2, [r2, #32]
	ldr	r7, [r2, #64]
	ldr	r6, [r2, #68]
	b	.LBB104_6
.LBB104_8:
	ldr	r5, [r0, #76]
	cmp	r5, #1
	bne	.LBB104_10
	mov	r4, #0
	ldr	lr, [r0, #72]
	str	r4, [r0, #76]
	str	r4, [r0, #72]
	ldr	r4, [r2]
	stm	sp, {r2, r12}
	mov	r2, lr
	str	r3, [sp, #8]
	b	.LBB104_13
.LBB104_10:
	ldrb	r5, [r0, #80]
	cmp	r5, #0
	beq	.LBB104_15
	mov	r7, #0
	strb	r7, [r0, #80]
.LBB104_12:
	ldr	r4, [r2]
	mov	r8, r0
	mov	r7, r2
	mov	r0, r1
	mov	r9, r1
	mvn	r2, #0
	mov	r1, r4
	mov	r5, r3
	mov	r6, r12
	bl	"fmt::[fmt.odin]::search_nul_termination"
	mov	r2, r0
	str	r7, [sp]
	str	r6, [sp, #4]
	mov	r0, r8
	str	r5, [sp, #8]
	mov	r1, r9
.LBB104_13:
	mov	r3, r4
	bl	"fmt::fmt_array"
.LBB104_14:
	add	sp, sp, #56
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	mov	pc, lr
.LBB104_15:
	rsbs	r5, r7, #22
	rscs	r6, r6, #0
	blo	.LBB104_2
	mov	r5, #212992
	mov	r6, #1
	orr	r5, r5, #4194304
	tst	r5, r6, lsl r7
	beq	.LBB104_19
	ldr	r2, [r0, #64]
	cmp	r2, #0
	bgt	.LBB104_2
	add	r1, r2, #1
	ldr	r2, [r0, #40]
	str	r1, [r0, #64]
	add	r6, r0, #84
	ldr	r1, [r0, #44]
	mov	r4, r0
	mov	r0, r2
	str	r3, [sp]
	mov	r5, r3
	mov	r2, #38
	mov	r3, r6
	mov	r7, r12
	bl	"io::write_byte"
	add	r1, sp, #24
	mov	r0, r4
	mov	r2, r7
	b	.LBB104_22
.LBB104_19:
	mov	r5, #1572864
	tst	r5, r6, lsl r7
	beq	.LBB104_23
	ldr	r2, [r0, #64]
	cmp	r2, #0
	bgt	.LBB104_2
	add	r1, r2, #1
	ldr	r2, [r0, #40]
	str	r1, [r0, #64]
	add	r7, r0, #84
	ldr	r1, [r0, #44]
	mov	r4, r0
	mov	r0, r2
	str	r3, [sp]
	mov	r5, r3
	mov	r2, #38
	mov	r3, r7
	mov	r6, r12
	bl	"io::write_byte"
	add	r1, sp, #24
	mov	r0, r4
	mov	r2, r6
.LBB104_22:
	mov	r3, r5
	bl	"fmt::fmt_value"
	ldr	r0, [r4, #64]
	sub	r0, r0, #1
	str	r0, [r4, #64]
	b	.LBB104_14
.LBB104_23:
	cmp	r7, #2
	orreq	r7, r12, #2
	cmpeq	r7, #115
	bne	.LBB104_2
	ldr	r6, [r2, #16]
	ldr	r4, .LCPI104_1
	ldr	r7, [r2, #20]
	ldr	r5, .LCPI104_0
	subs	r4, r4, r6
	sbcs	r4, r5, r7
	blt	.LBB104_27
	ldr	r5, .LCPI104_5
	ldr	r4, .LCPI104_6
	eor	r5, r6, r5
	eor	r4, r7, r4
	orrs	r5, r5, r4
	beq	.LBB104_30
	ldr	r5, .LCPI104_7
	eor	r6, r6, r5
	ldr	r5, .LCPI104_8
	b	.LBB104_29
.LBB104_27:
	ldr	r4, .LCPI104_2
	eor	r5, r7, r5
	eor	r4, r6, r4
	orrs	r5, r4, r5
	beq	.LBB104_12
	ldr	r5, .LCPI104_3
	eor	r6, r6, r5
	ldr	r5, .LCPI104_4
.LBB104_29:
	eor	r7, r7, r5
	orrs	r7, r6, r7
	beq	.LBB104_12
	b	.LBB104_2
.LBB104_30:
	mov	r2, r12
	add	sp, sp, #56
	pop	{r4, r5, r6, r7, r8, r9, r11, lr}
	b	"fmt::fmt_cstring"
	.p2align	2
.LCPI104_0:
	.long	1338159828
.LCPI104_1:
	.long	1680707818
.LCPI104_2:
	.long	1680707819
.LCPI104_3:
	.long	4093975810
.LCPI104_4:
	.long	2078322779
.LCPI104_5:
	.long	3853066515
.LCPI104_6:
	.long	1032104133
.LCPI104_7:
	.long	586708279
.LCPI104_8:
	.long	1164085392
.LCPI104_9:
	.long	".Lcsbs$POC-Example$169"
.Lfunc_end104:
	.size	"fmt::[fmt.odin]::fmt_multi_pointer", .Lfunc_end104-"fmt::[fmt.odin]::fmt_multi_pointer"
	.fnend

	.p2align	2
	.type	"fmt::fmt_enumerated_array",%function
	.code	32
"fmt::fmt_enumerated_array":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#236
	sub	sp, sp, #236
	mov	r4, r0
	ldr	r0, [r1]
	str	r0, [sp, #56]
	cmp	r3, #119
	ldr	r0, [r4, #68]
	str	r2, [sp, #68]
	add	r0, r0, #1
	ldr	r7, [r4, #40]
	ldr	r1, [r4, #44]
	ldrb	r2, [r4, #4]
	ldr	r9, [sp, #272]
	str	r0, [r4, #68]
	mov	r0, #91
	moveq	r0, #123
	cmp	r2, #0
	str	r3, [sp, #60]
	beq	.LBB105_28
	cmp	r7, #0
	strb	r0, [sp, #216]
	beq	.LBB105_4
	add	r0, sp, #144
	add	r3, sp, #216
	mov	r6, #0
	mov	r8, #1
	mov	r2, #4
	str	r6, [sp, #152]
	str	r6, [sp, #148]
	str	r6, [sp, #144]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp, #20]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r4, #84]
	ldr	r2, [sp, #144]
	ldr	r7, [r4, #40]
	ldr	r1, [r4, #44]
	add	r0, r0, r2
	str	r0, [r4, #84]
	mov	r0, #10
	cmp	r7, #0
	strb	r0, [sp, #216]
	beq	.LBB105_4
	add	r0, sp, #144
	add	r3, sp, #216
	mov	r2, #4
	str	r6, [sp, #152]
	str	r6, [sp, #148]
	str	r6, [sp, #144]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r9, [sp, #20]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_4:
	ldr	r0, [r4, #20]
	str	r0, [sp, #40]
	add	r0, r0, #1
	str	r0, [r4, #20]
	ldr	r0, [sp, #68]
	ldr	r0, [r0, #12]
	cmp	r0, #1
	blt	.LBB105_23
	add	r0, sp, #104
	add	r5, sp, #144
	add	r0, r0, #8
	str	r0, [sp, #52]
	ldr	r0, [sp, #68]
	mov	r10, #1
	mov	r8, #0
	mov	r11, #9
	mov	r7, #0
	add	r0, r0, #16
	str	r0, [sp, #48]
	b	.LBB105_7
.LBB105_6:
	ldr	r0, [sp, #68]
	add	r7, r7, #1
	ldr	r0, [r0, #12]
	cmp	r7, r0
	bge	.LBB105_23
.LBB105_7:
	ldr	r0, [r4, #20]
	str	r7, [sp, #64]
	cmp	r0, #1
	blt	.LBB105_12
	mov	r6, #0
	b	.LBB105_10
.LBB105_9:
	add	r6, r6, #1
	cmp	r6, r0
	bge	.LBB105_12
.LBB105_10:
	ldr	r7, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r7, #0
	strb	r11, [sp, #216]
	beq	.LBB105_9
	add	r3, sp, #216
	mov	r0, r5
	mov	r2, #4
	str	r8, [sp, #152]
	str	r8, [sp, #148]
	str	r8, [sp, #144]
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	str	r9, [sp, #20]
	str	r10, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #144]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB105_9
.LBB105_12:
	ldr	r0, [sp, #48]
	mov	r7, r5
	ldr	r5, [sp, #64]
	str	r8, [sp, #124]
	ldr	r10, [r0]
	ldr	r9, [r0, #4]
	ldr	r0, [sp, #68]
	mov	r2, r10
	str	r8, [sp, #128]
	mov	r3, r9
	strb	r8, [sp, #132]
	ldr	r1, [r0, #4]
	add	r0, sp, #124
	str	r5, [sp]
	bl	"fmt::stored_enum_value_to_string"
	ldrb	r0, [sp, #132]
	cmp	r0, #0
	beq	.LBB105_17
	ldr	r6, [r4, #40]
	mov	r0, #46
	ldr	r1, [r4, #44]
	ldr	r9, [sp, #124]
	cmp	r6, #0
	ldr	r10, [sp, #128]
	strb	r0, [sp, #216]
	beq	.LBB105_16
	ldr	r0, [sp, #272]
	add	r3, sp, #216
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	mov	r0, r7
	mov	r2, #4
	str	r8, [sp, #152]
	str	r8, [sp, #148]
	str	r8, [sp, #144]
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	mov	lr, pc
	mov	pc, r6
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #84]
	cmp	r6, #0
	ldr	r2, [sp, #144]
	add	r0, r0, r2
	str	r0, [r4, #84]
	beq	.LBB105_16
	ldr	r0, [sp, #272]
	mov	r2, #4
	str	r0, [sp, #20]
	mov	r0, r7
	mov	r3, r9
	str	r8, [sp, #152]
	str	r8, [sp, #148]
	str	r8, [sp, #144]
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	str	r10, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_16:
	ldr	r9, [sp, #272]
	mov	r5, r7
	mov	r10, #1
	b	.LBB105_19
.LBB105_17:
	ldr	r0, [r4, #44]
	mov	r1, #0
	str	r0, [sp, #44]
	mov	r0, r7
	mov	r2, #65
	ldr	r6, [r4, #40]
	bl	memset
	adds	r0, r10, r5
	ldr	r2, [sp, #272]
	adc	r1, r9, #0
	stm	sp, {r0, r1}
	mov	r0, #10
	str	r0, [sp, #8]
	mov	r0, #64
	str	r0, [sp, #16]
	mov	r10, #1
	ldr	r0, .LCPI105_0
	mov	r9, r2
	str	r0, [sp, #20]
	mov	r0, #36
	str	r0, [sp, #24]
	add	r0, sp, #136
	str	r2, [sp, #32]
	mov	r1, r7
	mov	r2, #65
	str	r8, [sp, #140]
	str	r8, [sp, #136]
	mov	r5, r7
	str	r10, [sp, #12]
	str	r8, [sp, #28]
	bl	"strconv::write_bits"
	cmp	r6, #0
	beq	.LBB105_19
	ldr	r0, [sp, #140]
	mov	r2, #4
	ldr	r3, [sp, #136]
	ldr	r1, [sp, #44]
	str	r0, [sp]
	add	r0, sp, #216
	str	r8, [sp, #224]
	str	r8, [sp, #220]
	str	r8, [sp, #216]
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_19:
	ldr	r6, [r4, #40]
	ldr	r7, [sp, #64]
	cmp	r6, #0
	beq	.LBB105_21
	ldr	r1, [r4, #44]
	mov	r0, #3
	ldr	r3, .LCPI105_1
	mov	r2, #4
	str	r0, [sp]
	mov	r0, r5
	str	r8, [sp, #152]
	str	r8, [sp, #148]
	str	r8, [sp, #144]
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_21:
	ldr	r1, [sp, #68]
	ldr	r3, [sp, #52]
	str	r8, [sp, #108]
	ldr	r0, [r1]
	ldr	r1, [r1, #8]
	ldr	r2, [r0, #16]
	ldr	r0, [r0, #20]
	str	r2, [r3]
	str	r0, [r3, #4]
	mov	r3, r9
	ldr	r2, [sp, #56]
	mla	r0, r1, r7, r2
	ldr	r2, [sp, #60]
	add	r1, sp, #104
	str	r0, [sp, #104]
	mov	r0, r4
	bl	"fmt::fmt_arg"
	ldr	r6, [r4, #40]
	cmp	r6, #0
	beq	.LBB105_6
	ldr	r1, [r4, #44]
	mov	r0, #2
	ldr	r3, .LCPI105_2
	mov	r2, #4
	str	r0, [sp]
	mov	r0, r5
	str	r8, [sp, #152]
	str	r8, [sp, #148]
	str	r8, [sp, #144]
	str	r8, [sp, #8]
	str	r8, [sp, #12]
	str	r8, [sp, #16]
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB105_6
.LBB105_23:
	ldr	r0, [sp, #40]
	str	r0, [r4, #20]
	cmp	r0, #1
	blt	.LBB105_44
	add	r9, sp, #216
	add	r10, sp, #144
	mov	r8, #1
	mov	r5, #0
	mov	r11, #9
	mov	r7, #0
	b	.LBB105_26
.LBB105_25:
	add	r7, r7, #1
	cmp	r7, r0
	bge	.LBB105_44
.LBB105_26:
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r11, [sp, #216]
	beq	.LBB105_25
	ldr	r0, [sp, #272]
	mov	r2, #4
	str	r0, [sp, #20]
	mov	r0, r10
	mov	r3, r9
	str	r5, [sp, #152]
	str	r5, [sp, #148]
	str	r5, [sp, #144]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
	mov	r0, r2
	b	.LBB105_25
.LBB105_28:
	cmp	r7, #0
	strb	r0, [sp, #216]
	beq	.LBB105_30
	mov	r0, #0
	add	r3, sp, #216
	str	r0, [sp, #152]
	mov	r2, #4
	str	r0, [sp, #148]
	str	r0, [sp, #144]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #144
	str	r9, [sp, #20]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_30:
	ldr	r0, [sp, #68]
	ldr	r0, [r0, #12]
	cmp	r0, #1
	blt	.LBB105_44
	add	r11, sp, #72
	mov	r10, #0
	add	r0, r11, #8
	str	r0, [sp, #64]
	ldr	r0, [sp, #68]
	mov	r9, #0
	add	r0, r0, #16
	str	r0, [sp, #52]
	b	.LBB105_33
.LBB105_32:
	ldr	r5, [sp, #68]
	ldr	r3, [sp, #64]
	str	r10, [sp, #76]
	ldr	r0, [r5]
	ldr	r1, [r5, #8]
	ldr	r2, [r0, #16]
	ldr	r0, [r0, #20]
	str	r2, [r3]
	str	r0, [r3, #4]
	mov	r3, r6
	ldr	r2, [sp, #56]
	mla	r0, r1, r9, r2
	ldr	r2, [sp, #60]
	mov	r1, r11
	str	r0, [sp, #72]
	mov	r0, r4
	bl	"fmt::fmt_arg"
	ldr	r0, [r5, #12]
	add	r9, r9, #1
	cmp	r9, r0
	bge	.LBB105_44
.LBB105_33:
	cmp	r9, #0
	ldrne	r5, [r4, #40]
	cmpne	r5, #0
	beq	.LBB105_35
	ldr	r0, [sp, #272]
	mov	r2, #4
	ldr	r1, [r4, #44]
	str	r0, [sp, #20]
	mov	r0, #2
	ldr	r3, .LCPI105_3
	str	r0, [sp]
	add	r0, sp, #144
	str	r10, [sp, #152]
	str	r10, [sp, #148]
	str	r10, [sp, #144]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_35:
	ldr	r0, [sp, #52]
	str	r10, [sp, #92]
	str	r10, [sp, #96]
	ldr	r7, [r0]
	ldr	r6, [r0, #4]
	ldr	r0, [sp, #68]
	mov	r2, r7
	strb	r10, [sp, #100]
	mov	r3, r6
	ldr	r1, [r0, #4]
	add	r0, sp, #92
	str	r9, [sp]
	bl	"fmt::stored_enum_value_to_string"
	ldrb	r0, [sp, #100]
	cmp	r0, #0
	beq	.LBB105_39
	ldr	r6, [r4, #40]
	mov	r0, #46
	ldr	r1, [r4, #44]
	ldr	r8, [sp, #92]
	cmp	r6, #0
	ldr	r5, [sp, #96]
	strb	r0, [sp, #216]
	beq	.LBB105_42
	ldr	r0, [sp, #272]
	add	r3, sp, #216
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #144
	mov	r2, #4
	str	r10, [sp, #152]
	str	r10, [sp, #148]
	str	r10, [sp, #144]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	mov	lr, pc
	mov	pc, r6
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	ldr	r0, [r4, #84]
	cmp	r6, #0
	ldr	r2, [sp, #144]
	add	r0, r0, r2
	str	r0, [r4, #84]
	beq	.LBB105_42
	ldr	r0, [sp, #272]
	mov	r2, #4
	str	r0, [sp, #20]
	add	r0, sp, #144
	mov	r3, r8
	str	r10, [sp, #152]
	str	r10, [sp, #148]
	str	r10, [sp, #144]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	str	r5, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB105_42
.LBB105_39:
	add	r8, sp, #144
	ldr	r0, [r4, #44]
	str	r0, [sp, #48]
	mov	r1, #0
	mov	r0, r8
	mov	r2, #65
	ldr	r5, [r4, #40]
	bl	memset
	adds	r0, r7, r9
	ldr	r11, [sp, #272]
	adc	r1, r6, #0
	stm	sp, {r0, r1}
	mov	r0, #10
	str	r0, [sp, #8]
	mov	r0, #1
	str	r0, [sp, #12]
	mov	r0, #64
	str	r0, [sp, #16]
	mov	r1, r8
	ldr	r0, .LCPI105_0
	mov	r2, #65
	str	r0, [sp, #20]
	mov	r0, #36
	str	r0, [sp, #24]
	add	r0, sp, #136
	str	r10, [sp, #140]
	str	r10, [sp, #136]
	str	r11, [sp, #32]
	str	r10, [sp, #28]
	bl	"strconv::write_bits"
	cmp	r5, #0
	beq	.LBB105_41
	ldr	r0, [sp, #140]
	mov	r2, #4
	ldr	r3, [sp, #136]
	ldr	r1, [sp, #48]
	str	r0, [sp]
	add	r0, sp, #216
	str	r10, [sp, #224]
	str	r10, [sp, #220]
	str	r10, [sp, #216]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	str	r11, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_41:
	add	r11, sp, #72
.LBB105_42:
	ldr	r5, [r4, #40]
	ldr	r6, [sp, #272]
	cmp	r5, #0
	beq	.LBB105_32
	ldr	r1, [r4, #44]
	mov	r0, #3
	ldr	r3, .LCPI105_1
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #144
	str	r10, [sp, #152]
	str	r10, [sp, #148]
	str	r10, [sp, #144]
	str	r10, [sp, #8]
	str	r10, [sp, #12]
	str	r10, [sp, #16]
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB105_32
.LBB105_44:
	ldr	r1, [sp, #60]
	mov	r0, #93
	ldr	r5, [r4, #40]
	cmp	r1, #119
	ldr	r1, [r4, #44]
	moveq	r0, #125
	cmp	r5, #0
	strb	r0, [sp, #216]
	beq	.LBB105_46
	mov	r0, #0
	add	r3, sp, #216
	str	r0, [sp, #152]
	mov	r2, #4
	str	r0, [sp, #148]
	str	r0, [sp, #144]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #272]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #144
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #144]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB105_46:
	ldr	r0, [r4, #68]
	sub	r0, r0, #1
	str	r0, [r4, #68]
	add	sp, sp, #236
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI105_0:
	.long	".Lcsbs$POC-Example$0"
.LCPI105_1:
	.long	".Lcsbs$POC-Example$18f"
.LCPI105_2:
	.long	".Lcsbs$POC-Example$187"
.LCPI105_3:
	.long	".Lcsbs$POC-Example$130"
.Lfunc_end105:
	.size	"fmt::fmt_enumerated_array", .Lfunc_end105-"fmt::fmt_enumerated_array"
	.fnend

	.p2align	2
	.type	"fmt::fmt_map",%function
	.code	32
"fmt::fmt_map":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#236
	sub	sp, sp, #236
	ldr	r10, [sp, #272]
	mov	r4, r0
	bic	r0, r3, #1
	mov	r7, r3
	cmp	r0, #118
	bne	.LBB106_15
	ldr	r9, [r2]
	cmp	r7, #118
	ldr	r6, [r1]
	ldr	r0, [r2, #4]
	str	r0, [sp, #80]
	ldr	r0, [r2, #8]
	str	r0, [sp, #76]
	bne	.LBB106_4
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB106_4
	mov	r0, #0
	ldr	r1, [r4, #44]
	str	r0, [sp, #224]
	mov	r2, #4
	str	r0, [sp, #220]
	str	r0, [sp, #216]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	ldr	r3, .LCPI106_0
	str	r0, [sp]
	add	r0, sp, #216
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB106_4:
	ldr	r5, [r4, #40]
	mov	r0, #91
	ldr	r1, [r4, #44]
	cmp	r7, #119
	moveq	r0, #123
	cmp	r5, #0
	strb	r0, [sp, #215]
	beq	.LBB106_6
	mov	r0, #0
	add	r3, sp, #215
	str	r0, [sp, #224]
	mov	r2, #4
	str	r0, [sp, #220]
	str	r0, [sp, #216]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #216
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB106_6:
	ldr	r11, [r4, #20]
	ldrb	r8, [r4, #4]
	add	r0, r11, #1
	str	r0, [r4, #20]
	cmp	r8, #0
	beq	.LBB106_9
	ldr	r5, [r4, #40]
	mov	r0, #10
	ldr	r1, [r4, #44]
	cmp	r5, #0
	strb	r0, [sp, #215]
	beq	.LBB106_9
	mov	r0, #0
	add	r3, sp, #215
	str	r0, [sp, #224]
	mov	r2, #4
	str	r0, [sp, #220]
	str	r0, [sp, #216]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #216
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB106_9:
	cmp	r6, #0
	str	r7, [sp, #56]
	str	r10, [sp, #84]
	str	r8, [sp, #60]
	beq	.LBB106_67
	ldr	r0, [sp, #76]
	cmp	r0, #0
	beq	.LBB106_16
	str	r9, [sp, #72]
	mov	r0, #1
	ldr	r9, [r6]
	mov	r7, #0
	and	r1, r9, #63
	str	r1, [sp, #68]
	cmp	r1, #32
	lsllo	r7, r0, r1
	ldr	r0, [sp, #76]
	bic	r1, r9, #63
	str	r1, [sp, #52]
	ldr	r8, [r0]
	ldr	r6, [r8, #12]
	ldr	r5, [r8, #8]
	cmp	r6, #1
	beq	.LBB106_24
	cmp	r6, #2
	beq	.LBB106_22
	cmp	r6, #0
	beq	.LBB106_76
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_uidiv
	ldr	r2, [sp, #52]
	mla	r1, r0, r5, r2
	mul	r2, r0, r6
	sub	r0, r7, r2
	ldr	r2, [r8]
	mla	r3, r2, r0, r1
	str	r3, [sp, #48]
	b	.LBB106_23
.LBB106_15:
	mov	r0, r4
	mov	r1, r7
	mov	r2, r10
	add	sp, sp, #236
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_bad_verb"
.LBB106_16:
	cmp	r8, #0
	beq	.LBB106_73
	cmp	r11, #1
	blt	.LBB106_73
	add	r8, sp, #215
	add	r10, sp, #216
	mov	r9, #1
	mov	r6, #9
	mov	r5, #0
	b	.LBB106_20
.LBB106_19:
	subs	r11, r11, #1
	beq	.LBB106_73
.LBB106_20:
	ldr	r7, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r7, #0
	strb	r6, [sp, #215]
	beq	.LBB106_19
	str	r5, [sp, #224]
	mov	r2, #4
	str	r5, [sp, #220]
	mov	r3, r8
	str	r5, [sp, #216]
	str	r5, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	ldr	r0, [sp, #84]
	str	r0, [sp, #20]
	mov	r0, r10
	str	r9, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB106_19
.LBB106_22:
	lsr	r0, r7, #1
	ldr	r1, [sp, #52]
	mla	r2, r0, r5, r1
	ldr	r0, [r8]
	tst	r7, #1
	addne	r2, r2, r0
	str	r2, [sp, #48]
.LBB106_23:
	ldr	r0, [sp, #76]
	b	.LBB106_25
.LBB106_24:
	ldr	r1, [sp, #52]
	mla	r2, r7, r5, r1
	str	r2, [sp, #48]
.LBB106_25:
	ldr	r5, [r0, #4]
	ldr	r6, [r5, #12]
	ldr	r8, [r5, #8]
	cmp	r6, #1
	beq	.LBB106_30
	cmp	r6, #2
	beq	.LBB106_29
	cmp	r6, #0
	beq	.LBB106_76
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_uidiv
	ldr	r2, [sp, #48]
	mla	r1, r0, r8, r2
	mul	r2, r0, r6
	sub	r0, r7, r2
	ldr	r2, [r5]
	mla	r3, r2, r0, r1
	str	r3, [sp, #64]
	b	.LBB106_31
.LBB106_29:
	lsr	r0, r7, #1
	ldr	r1, [sp, #48]
	mla	r2, r8, r0, r1
	ldr	r0, [r5]
	tst	r7, #1
	addne	r2, r2, r0
	str	r2, [sp, #64]
	b	.LBB106_31
.LBB106_30:
	ldr	r0, [sp, #48]
	mla	r1, r8, r7, r0
	str	r1, [sp, #64]
.LBB106_31:
	ldr	r8, [sp, #60]
	cmp	r9, #0
	ldr	r1, [sp, #72]
	beq	.LBB106_67
	ldr	r0, [sp, #68]
	cmp	r0, #31
	bhi	.LBB106_67
	add	r0, sp, #88
	mov	r7, #0
	add	r0, r0, #8
	str	r0, [sp, #44]
	ldr	r0, [sp, #80]
	mov	r9, #0
	add	r0, r0, #16
	str	r0, [sp, #40]
	add	r0, sp, #104
	add	r0, r0, #8
	str	r0, [sp, #36]
	add	r0, r1, #16
	str	r0, [sp, #32]
	add	r0, sp, #120
	add	r0, r0, #48
	str	r0, [sp, #28]
	mov	r0, #0
	str	r0, [sp, #80]
	b	.LBB106_35
.LBB106_34:
	ldr	r0, [sp, #68]
	add	r9, r9, #1
	lsrs	r0, r9, r0
	bne	.LBB106_67
.LBB106_35:
	ldr	r0, [sp, #64]
	ldr	r0, [r0, r9, lsl #2]
	cmp	r0, #1
	blt	.LBB106_34
	cmp	r8, #0
	bne	.LBB106_40
	ldr	r0, [sp, #80]
	cmp	r0, #1
	blt	.LBB106_40
	ldr	r5, [r4, #40]
	cmp	r5, #0
	beq	.LBB106_46
	ldr	r1, [r4, #44]
	mov	r0, #2
	ldr	r3, .LCPI106_1
	mov	r2, #4
	str	r7, [sp, #224]
	str	r7, [sp, #220]
	str	r7, [sp, #216]
	str	r0, [sp]
	add	r0, sp, #216
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	b	.LBB106_46
.LBB106_40:
	cmp	r8, #0
	mov	r8, #1
	beq	.LBB106_46
	ldr	r0, [r4, #20]
	cmp	r0, #1
	blt	.LBB106_46
	mov	r6, #0
	b	.LBB106_44
.LBB106_43:
	add	r6, r6, #1
	cmp	r6, r0
	bge	.LBB106_46
.LBB106_44:
	ldr	r5, [r4, #40]
	mov	r2, #9
	ldr	r1, [r4, #44]
	cmp	r5, #0
	strb	r2, [sp, #215]
	beq	.LBB106_43
	add	r0, sp, #216
	add	r3, sp, #215
	mov	r2, #4
	str	r7, [sp, #224]
	str	r7, [sp, #220]
	str	r7, [sp, #216]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r10, [sp, #20]
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #84]
	ldr	r2, [sp, #216]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB106_43
.LBB106_46:
	ldr	r0, [sp, #76]
	ldr	r5, [r0]
	ldr	r6, [r5, #12]
	ldr	r10, [r5, #8]
	cmp	r6, #1
	beq	.LBB106_52
	cmp	r6, #2
	beq	.LBB106_50
	cmp	r6, #0
	beq	.LBB106_76
	mov	r0, r9
	mov	r1, r6
	bl	__aeabi_uidiv
	ldr	r2, [sp, #52]
	mla	r1, r0, r10, r2
	mul	r2, r0, r6
	sub	r0, r9, r2
	ldr	r2, [r5]
	mla	r8, r2, r0, r1
	b	.LBB106_51
.LBB106_50:
	lsr	r0, r9, #1
	ldr	r1, [sp, #52]
	mla	r8, r10, r0, r1
	ldr	r0, [r5]
	tst	r9, #1
	addne	r8, r8, r0
.LBB106_51:
	ldr	r0, [sp, #76]
	b	.LBB106_53
.LBB106_52:
	ldr	r1, [sp, #52]
	mla	r8, r10, r9, r1
.LBB106_53:
	ldr	r5, [r0, #4]
	ldr	r6, [r5, #12]
	ldr	r10, [r5, #8]
	cmp	r6, #1
	beq	.LBB106_58
	cmp	r6, #2
	beq	.LBB106_57
	cmp	r6, #0
	beq	.LBB106_76
	mov	r0, r9
	mov	r1, r6
	bl	__aeabi_uidiv
	ldr	r2, [sp, #48]
	mla	r1, r0, r10, r2
	mul	r2, r0, r6
	sub	r0, r9, r2
	ldr	r2, [r5]
	mla	r3, r2, r0, r1
	str	r3, [sp, #72]
	b	.LBB106_59
.LBB106_57:
	lsr	r0, r9, #1
	ldr	r1, [sp, #48]
	mla	r2, r10, r0, r1
	ldr	r0, [r5]
	tst	r9, #1
	addne	r2, r2, r0
	str	r2, [sp, #72]
	b	.LBB106_59
.LBB106_58:
	ldr	r0, [sp, #48]
	mla	r1, r10, r9, r0
	str	r1, [sp, #72]
.LBB106_59:
	add	r10, sp, #120
	mov	r1, #0
	mov	r2, #40
	ldr	r5, [r4, #40]
	mov	r0, r10
	ldr	r6, [r4, #44]
	bl	memset
	ldr	r0, [sp, #28]
	mov	r1, #0
	mov	r2, #40
	str	r6, [sp, #164]
	str	r5, [sp, #160]
	bl	memset
	ldr	r1, [sp, #32]
	ldr	r2, [sp, #36]
	ldr	r6, [sp, #56]
	ldm	r1, {r0, r1}
	str	r7, [sp, #108]
	stm	r2, {r0, r1}
	mov	r0, r10
	add	r1, sp, #104
	ldr	r10, [sp, #84]
	mov	r2, r6
	str	r8, [sp, #104]
	mov	r3, r10
	bl	"fmt::fmt_arg"
	ldr	r8, [sp, #60]
	ldr	r5, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r8, #0
	beq	.LBB106_62
	cmp	r5, #0
	beq	.LBB106_65
	mov	r0, #3
	str	r7, [sp, #224]
	str	r7, [sp, #220]
	mov	r2, #4
	str	r7, [sp, #216]
	str	r0, [sp]
	add	r0, sp, #216
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r10, [sp, #20]
	ldr	r3, .LCPI106_2
	b	.LBB106_64
.LBB106_62:
	cmp	r5, #0
	beq	.LBB106_65
	mov	r0, #1
	ldr	r3, .LCPI106_3
	str	r7, [sp, #224]
	mov	r2, #4
	str	r7, [sp, #220]
	str	r7, [sp, #216]
	str	r0, [sp]
	add	r0, sp, #216
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r10, [sp, #20]
.LBB106_64:
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB106_65:
	ldr	r0, [sp, #80]
	mov	r3, r10
	str	r7, [sp, #92]
	add	r0, r0, #1
	str	r0, [sp, #80]
	ldr	r1, [sp, #40]
	ldr	r2, [sp, #44]
	ldm	r1, {r0, r1}
	stm	r2, {r0, r1}
	add	r1, sp, #88
	mov	r2, r6
	ldr	r0, [sp, #72]
	str	r0, [sp, #88]
	mov	r0, r4
	bl	"fmt::fmt_arg"
	cmp	r8, #0
	ldrne	r5, [r4, #40]
	cmpne	r5, #0
	beq	.LBB106_34
	ldr	r1, [r4, #44]
	mov	r0, #2
	ldr	r3, .LCPI106_4
	mov	r2, #4
	str	r7, [sp, #224]
	str	r7, [sp, #220]
	str	r7, [sp, #216]
	str	r0, [sp]
	add	r0, sp, #216
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB106_34
.LBB106_67:
	cmp	r8, #0
	beq	.LBB106_73
	cmp	r11, #1
	blt	.LBB106_73
	add	r9, sp, #215
	add	r10, sp, #216
	mov	r8, #1
	mov	r5, #9
	mov	r7, #0
	b	.LBB106_71
.LBB106_70:
	subs	r11, r11, #1
	beq	.LBB106_73
.LBB106_71:
	ldr	r6, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r5, [sp, #215]
	beq	.LBB106_70
	str	r7, [sp, #224]
	mov	r2, #4
	str	r7, [sp, #220]
	mov	r3, r9
	str	r7, [sp, #216]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	ldr	r0, [sp, #84]
	str	r0, [sp, #20]
	mov	r0, r10
	str	r8, [sp]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
	b	.LBB106_70
.LBB106_73:
	ldr	r0, [sp, #60]
	strb	r0, [r4, #4]
	ldr	r0, [r4, #20]
	ldr	r2, [sp, #56]
	sub	r0, r0, #1
	ldr	r5, [r4, #40]
	ldr	r1, [r4, #44]
	cmp	r2, #119
	str	r0, [r4, #20]
	mov	r0, #93
	moveq	r0, #125
	cmp	r5, #0
	strb	r0, [sp, #215]
	beq	.LBB106_75
	mov	r0, #0
	add	r3, sp, #215
	str	r0, [sp, #224]
	mov	r2, #4
	str	r0, [sp, #220]
	str	r0, [sp, #216]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #84]
	str	r0, [sp, #20]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #216
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r4, #84]
	ldr	r1, [sp, #216]
	add	r0, r0, r1
	str	r0, [r4, #84]
.LBB106_75:
	add	sp, sp, #236
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB106_76:
	.inst	0xe7ffdefe
	.p2align	2
.LCPI106_0:
	.long	".Lcsbs$POC-Example$19b"
.LCPI106_1:
	.long	".Lcsbs$POC-Example$130"
.LCPI106_2:
	.long	".Lcsbs$POC-Example$18f"
.LCPI106_3:
	.long	".Lcsbs$POC-Example$18c"
.LCPI106_4:
	.long	".Lcsbs$POC-Example$187"
.Lfunc_end106:
	.size	"fmt::fmt_map", .Lfunc_end106-"fmt::fmt_map"
	.fnend

	.p2align	2
	.type	"fmt::fmt_value",%function
	.code	32
"fmt::fmt_value":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#116
	sub	sp, sp, #116
	ldr	r4, [r1]
	mov	r5, r0
	ldr	r0, [r1, #4]
	ldr	r7, [r1, #8]
	cmp	r4, #0
	ldr	r1, [r1, #12]
	str	r1, [sp, #92]
	str	r7, [sp, #88]
	ldrne	r6, [sp, #88]
	ldrne	r10, [sp, #92]
	str	r0, [sp, #84]
	orrsne	r0, r6, r10
	str	r4, [sp, #80]
	bne	.LBB107_4
	ldr	r4, [r5, #40]
	cmp	r4, #0
	beq	.LBB107_13
	mov	r0, #0
	ldr	r1, [r5, #44]
	str	r0, [sp, #104]
	str	r0, [sp, #100]
	str	r0, [sp, #96]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #5
	str	r3, [sp, #20]
	str	r0, [sp]
	add	r0, sp, #96
	ldr	r3, .LCPI107_5
.LBB107_3:
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r5, #84]
	ldr	r1, [sp, #96]
	add	r0, r0, r1
	str	r0, [r5, #84]
	b	.LBB107_13
.LBB107_4:
	mov	r11, #73
	str	r4, [sp, #32]
	orr	r11, r11, #256
	str	r2, [sp, #36]
	str	r3, [sp, #40]
	mov	r9, #0
	mov	r0, r6
	mov	r1, r10
	mov	r2, r11
	mov	r3, #0
	str	r5, [sp, #44]
	strb	r9, [r5, #7]
	bl	__aeabi_uldivmod
	ldr	r1, .LCPI107_0
	mov	r0, #0
	ldr	r12, .LCPI107_1
	b	.LBB107_6
.LBB107_5:
	adds	r7, r2, #1
	adc	r3, r3, #0
	subs	r2, r7, r11
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r7
	adds	r7, r9, #1
	adc	r4, r0, #0
	subs	r5, r9, #328
	sbcs	r0, r0, #0
	mov	r9, r7
	mov	r0, r4
	bhs	.LBB107_8
.LBB107_6:
	ldr	r8, [r1, r2, lsl #2]
	cmp	r8, #0
	beq	.LBB107_5
	ldr	r7, [r8, #16]
	ldr	r4, [r8, #20]
	eor	r7, r7, r6
	eor	r4, r4, r10
	orrs	r7, r7, r4
	bne	.LBB107_5
	b	.LBB107_9
.LBB107_8:
	mov	r8, r12
.LBB107_9:
	ldr	r0, [r8, #64]
	ldr	r1, [r8, #68]
	subs	r0, r0, #1
	sbc	r1, r1, #0
	rsbs	r2, r0, #26
	rscs	r1, r1, #0
	blo	.LBB107_13
	adr	r1, .LJTI107_0
	add	r3, r8, #24
	ldr	pc, [r1, r0, lsl #2]
	.p2align	2
.LJTI107_0:
	.long	.LBB107_36
	.long	.LBB107_12
	.long	.LBB107_12
	.long	.LBB107_12
	.long	.LBB107_12
	.long	.LBB107_12
	.long	.LBB107_12
	.long	.LBB107_12
	.long	.LBB107_13
	.long	.LBB107_41
	.long	.LBB107_40
	.long	.LBB107_26
	.long	.LBB107_31
	.long	.LBB107_28
	.long	.LBB107_24
	.long	.LBB107_14
	.long	.LBB107_14
	.long	.LBB107_13
	.long	.LBB107_43
	.long	.LBB107_42
	.long	.LBB107_16
	.long	.LBB107_30
	.long	.LBB107_44
	.long	.LBB107_17
	.long	.LBB107_27
	.long	.LBB107_25
	.long	.LBB107_35
.LBB107_12:
	ldr	r0, [sp, #44]
	add	r1, sp, #80
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #40]
	bl	"fmt::fmt_arg"
.LBB107_13:
	add	sp, sp, #116
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB107_14:
	ldr	r0, [sp, #32]
	ldr	r1, [r0]
	ldr	r2, [r0, #4]
	ldr	r0, [sp, #44]
	ldr	r3, [r0, #76]
	cmp	r3, #1
	bne	.LBB107_37
	ldr	r3, [r0, #72]
	mov	r7, #0
	ldr	r6, [sp, #40]
	cmp	r2, r3
	ldr	r5, [sp, #36]
	movlt	r3, r2
	str	r7, [r0, #76]
	mov	r2, r3
	str	r7, [r0, #72]
	b	.LBB107_39
.LBB107_16:
	ldr	r0, [sp, #44]
	add	r1, sp, #80
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #40]
	bl	"fmt::fmt_enum"
	b	.LBB107_13
.LBB107_17:
	ldr	r7, [sp, #44]
	mov	r2, #60
	ldr	r10, [sp, #40]
	add	r3, r7, #84
	ldr	r0, [r7, #40]
	ldr	r1, [r7, #44]
	str	r10, [sp]
	str	r3, [sp, #28]
	bl	"io::write_byte"
	ldr	r0, [r8, #32]
	ldr	r11, [sp, #36]
	cmp	r0, #1
	blt	.LBB107_23
	ldr	r0, [sp, #32]
	add	r4, sp, #64
	str	r0, [sp, #64]
	mov	r9, #0
	ldr	r0, [r8, #24]
	mov	r2, r11
	mov	r3, r10
	str	r9, [sp, #68]
	ldr	r1, [r0, #16]
	ldr	r0, [r0, #20]
	str	r0, [sp, #76]
	mov	r0, r7
	str	r1, [sp, #72]
	mov	r1, r4
	bl	"fmt::fmt_arg"
	ldr	r0, [r8, #32]
	cmp	r0, #2
	blt	.LBB107_23
	add	r4, r4, #8
	mov	r5, #1
	b	.LBB107_21
.LBB107_20:
	ldr	r0, [r8, #24]
	mov	r3, r10
	ldr	r1, [r8, #28]
	str	r9, [sp, #68]
	ldr	r2, [r0, #16]
	ldr	r0, [r0, #20]
	str	r2, [r4]
	str	r0, [r4, #4]
	ldr	r2, [sp, #32]
	mla	r0, r1, r5, r2
	add	r1, sp, #64
	mov	r2, r11
	str	r0, [sp, #64]
	mov	r0, r7
	bl	"fmt::fmt_arg"
	ldr	r0, [r8, #32]
	add	r5, r5, #1
	cmp	r5, r0
	bge	.LBB107_23
.LBB107_21:
	ldr	r6, [r7, #40]
	cmp	r6, #0
	beq	.LBB107_20
	ldr	r1, [r7, #44]
	mov	r0, #2
	ldr	r3, .LCPI107_4
	mov	r2, #4
	str	r9, [sp, #104]
	str	r9, [sp, #100]
	str	r9, [sp, #96]
	str	r0, [sp]
	add	r0, sp, #96
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r10, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r2, [sp, #28]
	ldr	r1, [sp, #96]
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r2]
	b	.LBB107_20
.LBB107_23:
	ldr	r0, [r7, #40]
	mov	r2, #62
	ldr	r1, [r7, #44]
	str	r10, [sp]
	ldr	r3, [sp, #28]
	bl	"io::write_byte"
	b	.LBB107_13
.LBB107_24:
	ldr	r0, [sp, #40]
	mov	r2, r3
	str	r0, [sp]
	add	r1, sp, #80
	ldr	r0, [sp, #44]
	ldr	r3, [sp, #36]
	bl	"fmt::fmt_enumerated_array"
	b	.LBB107_13
.LBB107_25:
	ldr	r0, [sp, #32]
	ldr	r3, [sp, #40]
	ldm	r0, {r1, r2}
	ldr	r0, [sp, #44]
	add	sp, sp, #116
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_soa_pointer"
.LBB107_26:
	ldr	r0, [sp, #40]
	add	r1, sp, #80
	ldr	r2, [r3]
	str	r0, [sp]
	ldr	r0, [sp, #44]
	ldr	r3, [sp, #36]
	bl	"fmt::[fmt.odin]::fmt_multi_pointer"
	b	.LBB107_13
.LBB107_27:
	ldr	r0, [sp, #40]
	add	r1, sp, #80
	str	r0, [sp]
	ldr	r0, [sp, #44]
	ldr	r2, [sp, #36]
	bl	"fmt::fmt_matrix"
	b	.LBB107_13
.LBB107_28:
	ldr	r0, [sp, #44]
	ldr	r2, [r8, #32]
	ldr	r1, [r0, #76]
	cmp	r1, #1
	bne	.LBB107_45
	ldr	r1, [r0, #72]
	add	r7, sp, #32
	mov	r3, #0
	cmp	r2, r1
	str	r3, [r0, #76]
	movlt	r1, r2
	str	r3, [r0, #72]
	mov	r2, r1
	ldm	r7, {r1, r6, r7}
	b	.LBB107_47
.LBB107_30:
	ldr	r0, [sp, #40]
	mov	r2, r3
	str	r0, [sp]
	add	r1, sp, #80
	ldr	r0, [sp, #44]
	ldr	r3, [sp, #36]
	bl	"fmt::fmt_map"
	b	.LBB107_13
.LBB107_31:
	ldr	r5, [sp, #44]
	ldr	r0, [sp, #32]
	ldr	r4, [r5, #40]
	ldr	r7, [r0]
	ldr	r2, [r5, #44]
	cmp	r7, #0
	beq	.LBB107_48
	add	r8, r5, #84
	stm	sp, {r6, r10}
	add	r0, sp, #56
	str	r8, [sp, #8]
	mov	r1, r4
	ldr	r6, [sp, #40]
	str	r6, [sp, #12]
	bl	"reflect::write_typeid_writer"
	ldr	r4, [r5, #40]
	cmp	r4, #0
	beq	.LBB107_34
	mov	r0, #0
	ldr	r1, [r5, #44]
	str	r0, [sp, #104]
	mov	r2, #4
	str	r0, [sp, #100]
	str	r0, [sp, #96]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	ldr	r3, .LCPI107_2
	str	r0, [sp]
	add	r0, sp, #96
	str	r6, [sp, #20]
	mov	lr, pc
	mov	pc, r4
	ldr	r0, [r8]
	ldr	r1, [sp, #96]
	add	r0, r0, r1
	str	r0, [r8]
.LBB107_34:
	mov	r0, r5
	mov	r1, r7
	mov	r2, #112
	mov	r3, r6
	bl	"fmt::fmt_pointer"
	b	.LBB107_13
.LBB107_35:
	mov	r0, #0
	add	r1, sp, #80
	str	r0, [sp]
	str	r0, [sp, #4]
	ldr	r0, [sp, #40]
	str	r0, [sp, #8]
	ldr	r0, [sp, #44]
	ldr	r2, [sp, #36]
	bl	"fmt::fmt_bit_field"
	b	.LBB107_13
.LBB107_36:
	ldr	r0, [sp, #40]
	add	r1, sp, #80
	str	r0, [sp]
	ldr	r0, [sp, #44]
	ldr	r2, [sp, #36]
	bl	"fmt::fmt_named"
	b	.LBB107_13
.LBB107_37:
	ldrb	r3, [r0, #80]
	ldr	r6, [sp, #40]
	ldr	r5, [sp, #36]
	cmp	r3, #0
	beq	.LBB107_39
	mov	r3, #0
	strb	r3, [r0, #80]
	ldr	r3, [r8, #28]
	ldr	r7, [r8, #24]
	str	r7, [sp]
	stmib	sp, {r5, r6}
	bl	"fmt::fmt_array_nul_terminated"
	b	.LBB107_13
.LBB107_39:
	ldr	r3, [r8, #28]
	ldr	r7, [r8, #24]
	str	r7, [sp]
	stmib	sp, {r5, r6}
	bl	"fmt::fmt_array"
	b	.LBB107_13
.LBB107_40:
	ldr	r0, [sp, #40]
	add	r1, sp, #80
	ldr	r2, [r3]
	str	r0, [sp]
	ldr	r0, [sp, #44]
	ldr	r3, [sp, #36]
	bl	"fmt::[fmt.odin]::fmt_pointer_from_value"
	b	.LBB107_13
.LBB107_41:
	ldr	r3, [sp, #32]
	ldr	r7, [sp, #44]
	ldm	r3, {r0, r3}
	ldr	r1, [r7, #40]
	ldr	r2, [r7, #44]
	add	r7, r7, #84
	stm	sp, {r0, r3, r7}
	ldr	r0, [sp, #40]
	str	r0, [sp, #12]
	add	r0, sp, #48
	bl	"reflect::write_typeid_writer"
	b	.LBB107_13
.LBB107_42:
	ldr	r0, [r8]
	add	r1, sp, #80
	str	r0, [sp]
	ldr	r0, [sp, #40]
	str	r0, [sp, #4]
	ldr	r0, [sp, #44]
	ldr	r2, [sp, #36]
	bl	"fmt::fmt_union"
	b	.LBB107_13
.LBB107_43:
	mov	r0, #0
	add	r1, sp, #80
	str	r0, [sp]
	str	r0, [sp, #4]
	ldr	r0, [sp, #40]
	str	r0, [sp, #8]
	ldr	r0, [sp, #44]
	ldr	r2, [sp, #36]
	bl	"fmt::fmt_struct"
	b	.LBB107_13
.LBB107_44:
	ldr	r0, [sp, #36]
	add	r1, sp, #80
	str	r0, [sp]
	mov	r2, #0
	ldr	r0, [sp, #40]
	mov	r3, #0
	str	r0, [sp, #4]
	ldr	r0, [sp, #44]
	bl	"fmt::fmt_bit_set"
	b	.LBB107_13
.LBB107_45:
	ldrb	r1, [r0, #80]
	add	r7, sp, #32
	cmp	r1, #0
	ldm	r7, {r1, r6, r7}
	beq	.LBB107_47
	mov	r3, #0
	strb	r3, [r0, #80]
	ldr	r3, [r8, #28]
	ldr	r5, [r8, #24]
	stm	sp, {r5, r6, r7}
	bl	"fmt::fmt_array_nul_terminated"
	b	.LBB107_13
.LBB107_47:
	ldr	r3, [r8, #28]
	ldr	r5, [r8, #24]
	stm	sp, {r5, r6, r7}
	bl	"fmt::fmt_array"
	b	.LBB107_13
.LBB107_48:
	ldr	r1, [sp, #40]
	cmp	r4, #0
	beq	.LBB107_13
	mov	r0, #0
	ldr	r3, .LCPI107_3
	str	r0, [sp, #104]
	str	r0, [sp, #100]
	str	r0, [sp, #96]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #3
	str	r0, [sp]
	add	r0, sp, #96
	str	r1, [sp, #20]
	mov	r1, r2
	b	.LBB107_3
	.p2align	2
.LCPI107_0:
	.long	.L__$type_info_data
.LCPI107_1:
	.long	".L__$ti-0"
.LCPI107_2:
	.long	".Lcsbs$POC-Example$19c"
.LCPI107_3:
	.long	".Lcsbs$POC-Example$11c"
.LCPI107_4:
	.long	".Lcsbs$POC-Example$130"
.LCPI107_5:
	.long	".Lcsbs$POC-Example$169"
.Lfunc_end107:
	.size	"fmt::fmt_value", .Lfunc_end107-"fmt::fmt_value"
	.fnend

	.p2align	2
	.type	"fmt::fmt_complex",%function
	.code	32
"fmt::fmt_complex":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.pad	#48
	sub	sp, sp, #48
	ldr	r8, [sp, #80]
	mov	r4, r0
	sub	r0, r3, #70
	mov	r6, r3
	cmp	r0, #49
	bhi	.LBB108_14
	adr	r3, .LJTI108_0
	ldr	pc, [r3, r0, lsl #2]
	.p2align	2
.LJTI108_0:
	.long	.LBB108_3
	.long	.LBB108_14
	.long	.LBB108_3
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_3
	.long	.LBB108_14
	.long	.LBB108_3
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_14
	.long	.LBB108_3
	.long	.LBB108_3
.LBB108_3:
	ldr	r7, [r1]
	lsr	r10, r2, #1
	ldr	r3, [r1, #4]
	mov	r0, r4
	ldr	r9, [r1, #8]
	mov	r2, r7
	ldr	r5, [r1, #12]
	str	r10, [sp]
	stmib	sp, {r6, r8}
	bl	"fmt::fmt_float"
	ldrb	r0, [r4, #1]
	cmp	r0, #0
	bne	.LBB108_11
	mov	r0, r9
	mov	r1, r5
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpge
	cmp	r0, #0
	beq	.LBB108_11
	mov	r0, r9
	mov	r1, r5
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB108_10
	mov	r7, #2
	cmp	r5, #0
	movmi	r7, #3
.LBB108_7:
	sub	r0, r7, #3
	mvn	r1, #2
	tst	r0, r1
	beq	.LBB108_11
	ldr	r7, [r4, #40]
	mov	r0, #43
	ldr	r1, [r4, #44]
	cmp	r7, #0
	strb	r0, [sp, #31]
	beq	.LBB108_11
	mov	r0, #0
	add	r3, sp, #31
	str	r0, [sp, #40]
	mov	r2, #4
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #32
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [sp, #40]
	cmp	r0, #0
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
	b	.LBB108_11
.LBB108_10:
	mov	r3, #266338304
	mov	r0, r9
	orr	r3, r3, #805306368
	mov	r1, r5
	mov	r2, #0
	mov	r7, #0
	bl	__aeabi_dmul
	mov	r2, r9
	mov	r3, r5
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB108_15
.LBB108_11:
	mov	r0, r4
	mov	r2, r9
	mov	r3, r5
	str	r10, [sp]
	stmib	sp, {r6, r8}
	bl	"fmt::fmt_float"
	ldr	r5, [r4, #40]
	mov	r0, #105
	ldr	r1, [r4, #44]
	cmp	r5, #0
	strb	r0, [sp, #31]
	beq	.LBB108_13
	mov	r0, #0
	add	r3, sp, #31
	str	r0, [sp, #40]
	mov	r2, #4
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #32
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [sp, #40]
	cmp	r0, #0
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
.LBB108_13:
	add	sp, sp, #48
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	pc, lr
.LBB108_14:
	mov	r0, r4
	mov	r1, r6
	mov	r2, r8
	add	sp, sp, #48
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	"fmt::fmt_bad_verb"
.LBB108_15:
	cmp	r5, #1048576
	movlo	r7, #1
	b	.LBB108_7
.Lfunc_end108:
	.size	"fmt::fmt_complex", .Lfunc_end108-"fmt::fmt_complex"
	.fnend

	.p2align	2
	.type	"fmt::fmt_quaternion",%function
	.code	32
"fmt::fmt_quaternion":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#60
	sub	sp, sp, #60
	ldr	r5, [sp, #96]
	mov	r4, r0
	sub	r0, r3, #70
	mov	r9, r3
	cmp	r0, #49
	bhi	.LBB109_35
	adr	r3, .LJTI109_0
	ldr	pc, [r3, r0, lsl #2]
	.p2align	2
.LJTI109_0:
	.long	.LBB109_3
	.long	.LBB109_35
	.long	.LBB109_3
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_3
	.long	.LBB109_35
	.long	.LBB109_3
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_35
	.long	.LBB109_3
	.long	.LBB109_3
.LBB109_3:
	add	r0, r1, #8
	ldm	r1, {r7, r8}
	ldr	r3, [r0, #8]
	str	r3, [sp, #28]
	ldr	r3, [r0, #12]
	ldr	r6, [r0, #16]
	str	r3, [sp, #24]
	ldr	r3, [r0, #20]
	ldm	r0, {r10, r11}
	lsr	r0, r2, #2
	mov	r2, r6
	str	r0, [sp, #32]
	stm	sp, {r0, r9}
	mov	r0, r4
	str	r5, [sp, #8]
	bl	"fmt::fmt_float"
	ldrb	r0, [r4, #1]
	cmp	r0, #0
	bne	.LBB109_11
	mov	r0, r7
	mov	r1, r8
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpge
	cmp	r0, #0
	beq	.LBB109_11
	mov	r0, r7
	mov	r1, r8
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB109_10
	mov	r6, #2
	cmp	r8, #0
	movmi	r6, #3
.LBB109_7:
	sub	r0, r6, #3
	mvn	r1, #2
	tst	r0, r1
	beq	.LBB109_11
	ldr	r6, [r4, #40]
	mov	r0, #43
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #39]
	beq	.LBB109_11
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r2, #4
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	cmp	r0, #0
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
	b	.LBB109_11
.LBB109_10:
	mov	r3, #266338304
	mov	r0, r7
	orr	r3, r3, #805306368
	mov	r1, r8
	mov	r2, #0
	mov	r6, #0
	bl	__aeabi_dmul
	mov	r2, r7
	mov	r3, r8
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB109_36
.LBB109_11:
	ldr	r0, [sp, #32]
	mov	r2, r7
	mov	r3, r8
	str	r5, [sp, #8]
	stm	sp, {r0, r9}
	mov	r0, r4
	bl	"fmt::fmt_float"
	ldr	r6, [r4, #40]
	mov	r0, #105
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #39]
	beq	.LBB109_13
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r2, #4
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	ldr	r8, [sp, #28]
	cmp	r0, #0
	ldr	r7, [sp, #24]
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
	b	.LBB109_14
.LBB109_13:
	ldr	r8, [sp, #28]
	ldr	r7, [sp, #24]
.LBB109_14:
	ldrb	r0, [r4, #1]
	cmp	r0, #0
	bne	.LBB109_22
	mov	r0, r10
	mov	r1, r11
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpge
	cmp	r0, #0
	beq	.LBB109_22
	mov	r0, r10
	mov	r1, r11
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB109_21
	mov	r6, #2
	cmp	r11, #0
	movmi	r6, #3
.LBB109_18:
	sub	r0, r6, #3
	mvn	r1, #2
	tst	r0, r1
	beq	.LBB109_22
	ldr	r6, [r4, #40]
	mov	r0, #43
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #39]
	beq	.LBB109_22
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r2, #4
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	cmp	r0, #0
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
	b	.LBB109_22
.LBB109_21:
	mov	r3, #266338304
	mov	r0, r10
	orr	r3, r3, #805306368
	mov	r1, r11
	mov	r2, #0
	mov	r6, #0
	bl	__aeabi_dmul
	mov	r2, r10
	mov	r3, r11
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB109_37
.LBB109_22:
	ldr	r0, [sp, #32]
	mov	r2, r10
	mov	r3, r11
	str	r5, [sp, #8]
	stm	sp, {r0, r9}
	mov	r0, r4
	bl	"fmt::fmt_float"
	ldr	r6, [r4, #40]
	mov	r0, #106
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #39]
	beq	.LBB109_24
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r2, #4
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	cmp	r0, #0
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
.LBB109_24:
	ldrb	r0, [r4, #1]
	cmp	r0, #0
	bne	.LBB109_32
	mov	r0, r8
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpge
	cmp	r0, #0
	beq	.LBB109_32
	mov	r0, r8
	mov	r1, r7
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB109_31
	mov	r6, #2
	cmp	r7, #0
	movmi	r6, #3
.LBB109_28:
	sub	r0, r6, #3
	mvn	r1, #2
	tst	r0, r1
	beq	.LBB109_32
	ldr	r6, [r4, #40]
	mov	r0, #43
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #39]
	beq	.LBB109_32
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r2, #4
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	cmp	r0, #0
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
	b	.LBB109_32
.LBB109_31:
	mov	r3, #266338304
	mov	r0, r8
	orr	r3, r3, #805306368
	mov	r1, r7
	mov	r2, #0
	mov	r6, #0
	bl	__aeabi_dmul
	mov	r2, r8
	mov	r3, r7
	bl	__aeabi_dcmpeq
	cmp	r0, #0
	beq	.LBB109_38
.LBB109_32:
	ldr	r0, [sp, #32]
	mov	r2, r8
	mov	r3, r7
	str	r5, [sp, #8]
	stm	sp, {r0, r9}
	mov	r0, r4
	bl	"fmt::fmt_float"
	ldr	r6, [r4, #40]
	mov	r0, #107
	ldr	r1, [r4, #44]
	cmp	r6, #0
	strb	r0, [sp, #39]
	beq	.LBB109_34
	mov	r0, #0
	add	r3, sp, #39
	str	r0, [sp, #48]
	mov	r2, #4
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp]
	add	r0, sp, #40
	str	r5, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [sp, #48]
	cmp	r0, #0
	ldreq	r0, [r4, #84]
	addeq	r0, r0, #1
	streq	r0, [r4, #84]
.LBB109_34:
	add	sp, sp, #60
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB109_35:
	mov	r0, r4
	mov	r1, r9
	mov	r2, r5
	add	sp, sp, #60
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_bad_verb"
.LBB109_36:
	cmp	r8, #1048576
	movlo	r6, #1
	b	.LBB109_7
.LBB109_37:
	cmp	r11, #1048576
	movlo	r6, #1
	b	.LBB109_18
.LBB109_38:
	cmp	r7, #1048576
	movlo	r6, #1
	b	.LBB109_28
.Lfunc_end109:
	.size	"fmt::fmt_quaternion", .Lfunc_end109-"fmt::fmt_quaternion"
	.fnend

	.p2align	2
	.type	"fmt::fmt_arg",%function
	.code	32
"fmt::fmt_arg":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#276
	sub	sp, sp, #276
	mov	r4, r0
	add	r0, sp, #208
	add	r0, r0, #8
	str	r3, [sp, #48]
	str	r0, [sp, #52]
	add	r0, sp, #240
	add	r0, r0, #8
	mov	r8, #73
	str	r0, [sp, #64]
	add	r0, sp, #112
	ldr	r10, .LCPI110_137
	add	r0, r0, #8
	add	r3, r4, #56
	orr	r8, r8, #256
	mov	r5, r2
	str	r0, [sp, #36]
	add	r0, sp, #144
	add	r0, r0, #8
	str	r0, [sp, #32]
	str	r4, [sp, #60]
	str	r2, [sp, #56]
	str	r3, [sp, #44]
.LBB110_1:
	ldr	r6, [r1]
	ldr	r0, [r1, #4]
	cmp	r6, #0
	str	r0, [sp, #244]
	ldrne	r0, [sp, #64]
	ldr	r2, [r1, #8]
	ldr	r1, [r1, #12]
	str	r1, [sp, #252]
	str	r2, [sp, #248]
	ldmne	r0, {r9, r11}
	orrsne	r0, r9, r11
	str	r6, [sp, #240]
	beq	.LBB110_92
	ldr	r0, [sp, #244]
	mov	r1, r11
	str	r0, [r4, #52]
	mov	r0, r9
	stm	r3, {r9, r11}
	mov	r2, r8
	mov	r3, #0
	str	r6, [r4, #48]
	bl	__aeabi_uldivmod
	cmp	r5, #84
	beq	.LBB110_94
	add	r0, r6, #2
	str	r6, [sp, #68]
	str	r0, [sp, #40]
	mov	r1, #0
	mov	r7, r2
	mov	r0, r3
	mov	r5, #0
	b	.LBB110_5
.LBB110_4:
	adds	r6, r7, #1
	adc	r0, r0, #0
	subs	r7, r6, r8
	sbcs	r7, r0, #0
	mov	r7, #0
	movlo	r7, #1
	cmp	r7, #0
	moveq	r0, r7
	movne	r7, r6
	adds	r6, r1, #1
	adc	r4, r5, #0
	subs	r1, r1, #328
	sbcs	r1, r5, #0
	mov	r1, r6
	mov	r5, r4
	bhs	.LBB110_7
.LBB110_5:
	ldr	r6, [r10, r7, lsl #2]
	cmp	r6, #0
	beq	.LBB110_4
	ldr	r4, [r6, #20]
	ldr	r12, [r6, #16]
	eor	lr, r4, r11
	eor	r4, r12, r9
	orrs	r4, r4, lr
	bne	.LBB110_4
	b	.LBB110_8
.LBB110_7:
	ldr	r6, .LCPI110_138
.LBB110_8:
	ldr	r0, [r6, #64]
	ldr	r1, [r6, #68]
	eor	r0, r0, #1
	orrs	r0, r0, r1
	beq	.LBB110_98
	ldr	r1, [sp, #52]
	mov	r0, #0
	ldr	r4, [sp, #60]
	mov	r7, #0
	str	r0, [r1]
	str	r0, [r1, #4]
	str	r0, [r1, #8]
	str	r0, [r1, #12]
	b	.LBB110_11
.LBB110_10:
	adds	r1, r2, #1
	adc	r3, r3, #0
	subs	r2, r1, r8
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r1
	adds	r1, r0, #1
	adc	r6, r7, #0
	subs	r0, r0, #328
	sbcs	r0, r7, #0
	mov	r0, r1
	mov	r7, r6
	bhs	.LBB110_13
.LBB110_11:
	ldr	r1, [r10, r2, lsl #2]
	cmp	r1, #0
	beq	.LBB110_10
	ldr	r6, [r1, #16]
	ldr	r5, [r1, #20]
	eor	r6, r6, r9
	eor	r5, r5, r11
	orrs	r6, r6, r5
	bne	.LBB110_10
	b	.LBB110_14
.LBB110_13:
	ldr	r1, .LCPI110_138
.LBB110_14:
	ldr	r0, [r1, #64]
	ldr	r2, [r1, #68]
	eor	r0, r0, #1
	orrs	r0, r0, r2
	bne	.LBB110_17
	ldr	r5, [sp, #56]
	ldr	r6, [sp, #68]
.LBB110_16:
	ldr	r1, [r1, #32]
	ldr	r0, [r1, #64]
	ldr	r2, [r1, #68]
	eor	r0, r0, #1
	orrs	r0, r0, r2
	beq	.LBB110_16
	b	.LBB110_18
.LBB110_17:
	ldr	r5, [sp, #56]
	ldr	r6, [sp, #68]
.LBB110_18:
	ldr	r2, [r1, #16]
	ldr	r0, [r1, #20]
	ldr	r1, .LCPI110_139
	subs	r1, r1, r2
	ldr	r1, .LCPI110_140
	sbcs	r1, r1, r0
	blt	.LBB110_23
	ldr	r1, .LCPI110_141
	subs	r1, r1, r2
	ldr	r1, .LCPI110_142
	sbcs	r1, r1, r0
	blt	.LBB110_37
	ldr	r1, .LCPI110_143
	ldr	r3, .LCPI110_144
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	ldr	r3, [sp, #44]
	mov	r1, r6
	beq	.LBB110_1
	ldr	r1, .LCPI110_145
	eor	r1, r2, r1
	ldr	r2, .LCPI110_146
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	ldr	r8, [sp, #40]
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrh	r0, [r8, #4]
	bl	__gnu_h2f_ieee
	bl	__aeabi_f2d
	ldr	r7, [sp, #32]
	str	r0, [r7, #16]
	ldrh	r0, [r8, #2]
	str	r1, [r7, #20]
	bl	__gnu_h2f_ieee
	bl	__aeabi_f2d
	str	r0, [r7, #8]
	ldrh	r0, [r8]
	str	r1, [r7, #12]
	bl	__gnu_h2f_ieee
	bl	__aeabi_f2d
	stm	r7, {r0, r1}
	ldrh	r0, [r6]
	bl	__gnu_h2f_ieee
	bl	__aeabi_f2d
	str	r0, [sp, #144]
	mov	r2, #64
	ldr	r0, [sp, #48]
	str	r1, [sp, #148]
	add	r1, sp, #144
	str	r0, [sp]
	mov	r0, r4
	b	.LBB110_153
.LBB110_23:
	ldr	r3, .LCPI110_147
	ldr	r1, .LCPI110_148
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB110_30
	ldr	r7, .LCPI110_149
	ldr	r3, .LCPI110_150
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	blt	.LBB110_42
	ldr	r7, .LCPI110_151
	ldr	r3, .LCPI110_152
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB110_67
	ldr	r7, .LCPI110_153
	ldr	r1, .LCPI110_154
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	blt	.LBB110_83
	ldr	r1, .LCPI110_155
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_163
	ldr	r1, .LCPI110_156
	ldr	r3, .LCPI110_157
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_66
	ldr	r1, .LCPI110_158
	eor	r1, r2, r1
	ldr	r2, .LCPI110_159
	eor	r0, r0, r2
	orrs	r0, r1, r0
	beq	.LBB110_57
	b	.LBB110_176
.LBB110_30:
	ldr	r3, .LCPI110_160
	ldr	r1, .LCPI110_161
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB110_49
	ldr	r7, .LCPI110_162
	ldr	r3, .LCPI110_163
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB110_62
	ldr	r7, .LCPI110_164
	ldr	r1, .LCPI110_165
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	blt	.LBB110_79
	ldr	r1, .LCPI110_166
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_154
	ldr	r1, .LCPI110_167
	ldr	r3, .LCPI110_168
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_148
	ldr	r1, .LCPI110_169
	eor	r1, r2, r1
	ldr	r2, .LCPI110_170
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	mov	r1, #32
	str	r0, [sp, #208]
	mov	r2, #1
	str	r0, [sp, #212]
	ldr	r0, [r6]
	str	r2, [sp]
	stmib	sp, {r1, r5}
	and	r2, r0, #65280
	ldr	r1, [sp, #48]
	str	r1, [sp, #12]
	mov	r1, #65280
	and	r1, r1, r0, lsr #8
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r2, r0, r2, lsl #8
	orr	r2, r2, r1
	b	.LBB110_147
.LBB110_37:
	ldr	r3, .LCPI110_171
	ldr	r1, .LCPI110_172
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB110_55
	ldr	r7, .LCPI110_173
	ldr	r3, .LCPI110_174
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	blt	.LBB110_75
	ldr	r3, .LCPI110_175
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_91
	ldr	r1, .LCPI110_176
	ldr	r3, .LCPI110_177
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_129
	ldr	r1, .LCPI110_178
	eor	r1, r2, r1
	ldr	r2, .LCPI110_179
	b	.LBB110_47
.LBB110_42:
	ldr	r7, .LCPI110_9
	ldr	r1, .LCPI110_8
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	bge	.LBB110_71
	ldr	r7, .LCPI110_11
	ldr	r3, .LCPI110_10
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	blt	.LBB110_88
	ldr	r3, .LCPI110_17
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_119
	ldr	r1, .LCPI110_18
	ldr	r3, .LCPI110_19
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_155
	ldr	r1, .LCPI110_20
	eor	r1, r2, r1
	ldr	r2, .LCPI110_21
.LBB110_47:
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrh	r0, [r6]
	b	.LBB110_87
.LBB110_49:
	ldr	r3, .LCPI110_83
	ldr	r1, .LCPI110_82
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	blt	.LBB110_58
	ldr	r3, .LCPI110_95
	ldr	r1, .LCPI110_94
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB110_103
	ldr	r3, .LCPI110_96
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_137
	ldr	r1, .LCPI110_97
	ldr	r3, .LCPI110_98
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_57
	ldr	r1, .LCPI110_99
	eor	r1, r2, r1
	ldr	r2, .LCPI110_100
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldr	r0, [sp, #40]
	ldr	r0, [r0, #2]
	bl	__aeabi_f2d
	str	r0, [sp, #184]
	ldr	r0, [r6]
	str	r1, [sp, #188]
	bl	__aeabi_f2d
	str	r0, [sp, #176]
	mov	r2, #64
	ldr	r0, [sp, #48]
	str	r1, [sp, #180]
	add	r1, sp, #176
	b	.LBB110_109
.LBB110_55:
	ldr	r3, .LCPI110_121
	ldr	r1, .LCPI110_120
	subs	r3, r3, r2
	sbcs	r3, r1, r0
	bge	.LBB110_99
	ldr	r3, .LCPI110_122
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	ldrne	r1, .LCPI110_123
	ldrne	r3, .LCPI110_124
	eorne	r1, r2, r1
	eorne	r3, r0, r3
	orrsne	r1, r1, r3
	bne	.LBB110_172
.LBB110_57:
	mov	r0, #0
	mov	r1, #32
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldr	r2, [r6]
	b	.LBB110_125
.LBB110_58:
	ldr	r7, .LCPI110_85
	ldr	r3, .LCPI110_84
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB110_106
	ldr	r1, .LCPI110_86
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_122
	ldr	r1, .LCPI110_87
	ldr	r3, .LCPI110_88
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_124
	ldr	r1, .LCPI110_89
	eor	r1, r2, r1
	ldr	r2, .LCPI110_90
	b	.LBB110_82
.LBB110_62:
	ldr	r7, .LCPI110_73
	ldr	r3, .LCPI110_72
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB110_110
	ldr	r1, .LCPI110_74
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_143
	ldr	r1, .LCPI110_75
	ldr	r3, .LCPI110_76
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_136
	ldr	r1, .LCPI110_77
	eor	r1, r2, r1
	ldr	r2, .LCPI110_78
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
.LBB110_66:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrb	r1, [r6]
	b	.LBB110_149
.LBB110_67:
	ldr	r7, .LCPI110_47
	ldr	r3, .LCPI110_46
	subs	r7, r7, r2
	sbcs	r7, r3, r0
	bge	.LBB110_113
	ldr	r1, .LCPI110_48
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_118
	ldr	r1, .LCPI110_49
	ldr	r3, .LCPI110_50
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_145
	ldr	r1, .LCPI110_51
	eor	r1, r2, r1
	ldr	r2, .LCPI110_52
	eor	r0, r0, r2
	orrs	r0, r1, r0
	beq	.LBB110_121
	b	.LBB110_176
.LBB110_71:
	ldr	r7, .LCPI110_23
	ldr	r1, .LCPI110_22
	subs	r7, r7, r2
	sbcs	r7, r1, r0
	bge	.LBB110_116
	ldr	r3, .LCPI110_24
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_146
	ldr	r1, .LCPI110_25
	ldr	r3, .LCPI110_26
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_101
	ldr	r1, .LCPI110_27
	eor	r1, r2, r1
	ldr	r2, .LCPI110_28
	eor	r0, r0, r2
	orrs	r0, r1, r0
	beq	.LBB110_120
	b	.LBB110_176
.LBB110_75:
	ldr	r1, .LCPI110_110
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_119
	ldr	r1, .LCPI110_111
	ldr	r3, .LCPI110_112
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_131
	ldr	r1, .LCPI110_113
	eor	r1, r2, r1
	ldr	r2, .LCPI110_114
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	mov	r2, r5
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, r4
	ldr	r1, [r6]
	ldr	r3, [sp, #48]
	add	sp, sp, #276
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_cstring"
.LBB110_79:
	ldr	r3, .LCPI110_62
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_121
	ldr	r1, .LCPI110_63
	ldr	r3, .LCPI110_64
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_152
	ldr	r1, .LCPI110_65
	eor	r1, r2, r1
	ldr	r2, .LCPI110_66
.LBB110_82:
	eor	r0, r0, r2
	orrs	r0, r1, r0
	beq	.LBB110_102
	b	.LBB110_176
.LBB110_83:
	ldr	r3, .LCPI110_36
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_166
	ldr	r1, .LCPI110_37
	ldr	r3, .LCPI110_38
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_122
	ldr	r1, .LCPI110_39
	eor	r1, r2, r1
	ldr	r2, .LCPI110_40
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrh	r0, [r6]
	lsl	r1, r0, #8
	orr	r0, r1, r0, lsr #8
	mov	r1, #255
	orr	r1, r1, #65280
	and	r0, r0, r1
.LBB110_87:
	bl	__gnu_h2f_ieee
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r0, #16
	b	.LBB110_139
.LBB110_88:
	ldr	r1, .LCPI110_12
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_124
	ldr	r1, .LCPI110_13
	ldr	r3, .LCPI110_14
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_156
	ldr	r1, .LCPI110_15
	eor	r1, r2, r1
	ldr	r2, .LCPI110_16
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
.LBB110_91:
	ldr	r0, [sp, #48]
	mov	r1, r6
	str	r0, [sp]
	mov	r0, r4
	mov	r2, #0
	mov	r3, r5
	b	.LBB110_144
.LBB110_92:
	mov	r1, r4
	ldr	r4, [r4, #40]
	mov	r0, #0
	cmp	r4, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	beq	.LBB110_171
	ldr	r1, [r1, #44]
	mov	r2, #4
	str	r0, [sp, #264]
	str	r0, [sp, #260]
	str	r0, [sp, #256]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #48]
	str	r0, [sp, #20]
	mov	r0, #5
	ldr	r3, .LCPI110_136
	str	r0, [sp]
	add	r0, sp, #256
	mov	lr, pc
	mov	pc, r4
	b	.LBB110_171
.LBB110_94:
	ldr	r12, .LCPI110_1
	mov	r1, #0
	mov	r5, #0
	b	.LBB110_96
.LBB110_95:
	adds	r0, r2, #1
	adc	r3, r3, #0
	subs	r2, r0, r8
	sbcs	r2, r3, #0
	mov	r2, #0
	movlo	r2, #1
	cmp	r2, #0
	moveq	r3, r2
	movne	r2, r0
	adds	r0, r1, #1
	adc	r7, r5, #0
	subs	r1, r1, #328
	sbcs	r1, r5, #0
	mov	r1, r0
	mov	r5, r7
	bhs	.LBB110_127
.LBB110_96:
	ldr	r7, [r10, r2, lsl #2]
	cmp	r7, #0
	beq	.LBB110_95
	ldr	r0, [r7, #20]
	mov	lr, r4
	mov	r4, r6
	ldr	r6, [r7, #16]
	eor	r0, r0, r11
	eor	r6, r6, r9
	orrs	r0, r6, r0
	mov	r6, r4
	mov	r4, lr
	bne	.LBB110_95
	b	.LBB110_128
.LBB110_98:
	add	r7, r6, #24
	add	r12, sp, #208
	ldr	r6, [r6, #44]
	ldm	r7, {r0, r1, r2, r3, r7}
	str	r6, [sp, #228]
	stm	r12, {r0, r1, r2, r3, r7}
	add	r1, sp, #240
	add	r3, sp, #208
	ldr	r0, [sp, #48]
	str	r0, [sp]
	ldr	r0, [sp, #60]
	ldr	r2, [sp, #56]
	bl	"fmt::fmt_named"
	b	.LBB110_171
.LBB110_99:
	ldr	r1, .LCPI110_127
	ldr	r3, .LCPI110_104
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_102
	ldr	r1, .LCPI110_128
	eor	r1, r2, r1
	ldr	r2, .LCPI110_129
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
.LBB110_101:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldr	r0, [r6]
	b	.LBB110_138
.LBB110_102:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, #32
	ldr	r2, [r6]
	b	.LBB110_167
.LBB110_103:
	ldr	r1, .LCPI110_101
	ldr	r3, .LCPI110_2
	eor	r1, r2, r1
	eor	r3, r0, r3
	orrs	r1, r1, r3
	beq	.LBB110_132
	ldr	r1, .LCPI110_102
	eor	r1, r2, r1
	ldr	r2, .LCPI110_103
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	mov	r8, r5
	str	r0, [sp, #208]
	mov	r9, r4
	str	r0, [sp, #212]
	ldr	r0, [sp, #40]
	ldr	r4, [r0, #2]
	ldr	r5, [r0, #6]
	ldr	r0, [r0, #10]
	bl	__aeabi_f2d
	ldr	r7, [sp, #36]
	str	r0, [r7, #16]
	mov	r0, r5
	str	r1, [r7, #20]
	bl	__aeabi_f2d
	str	r0, [r7, #8]
	mov	r0, r4
	str	r1, [r7, #12]
	bl	__aeabi_f2d
	stm	r7, {r0, r1}
	ldr	r0, [r6]
	bl	__aeabi_f2d
	str	r1, [sp, #116]
	add	r1, sp, #112
	str	r0, [sp, #112]
	mov	r2, #128
	ldr	r0, [sp, #48]
	mov	r3, r8
	str	r0, [sp]
	mov	r0, r9
	bl	"fmt::fmt_quaternion"
	b	.LBB110_171
.LBB110_106:
	ldr	r3, .LCPI110_91
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_133
	ldr	r1, .LCPI110_92
	eor	r1, r2, r1
	ldr	r2, .LCPI110_93
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldr	r0, [sp, #40]
	ldrh	r0, [r0]
	bl	__gnu_h2f_ieee
	bl	__aeabi_f2d
	str	r0, [sp, #200]
	ldrh	r0, [r6]
	str	r1, [sp, #204]
	bl	__gnu_h2f_ieee
	bl	__aeabi_f2d
	str	r0, [sp, #192]
	mov	r2, #32
	ldr	r0, [sp, #48]
	str	r1, [sp, #196]
	add	r1, sp, #192
.LBB110_109:
	str	r0, [sp]
	mov	r0, r4
	b	.LBB110_130
.LBB110_110:
	ldr	r3, .LCPI110_79
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_134
	ldr	r1, .LCPI110_80
	eor	r1, r2, r1
	ldr	r2, .LCPI110_81
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	mov	r2, #64
	str	r0, [sp, #208]
	mov	r3, #1
	str	r0, [sp, #212]
	ldm	r6, {r0, r1}
	and	r7, r1, #65280
	str	r3, [sp]
	mov	r3, #65280
	stmib	sp, {r2, r5}
	ldr	r2, [sp, #48]
	str	r2, [sp, #12]
	and	r2, r3, r1, lsr #8
	orr	r2, r2, r1, lsr #24
	lsl	r1, r1, #24
	orr	r1, r1, r7, lsl #8
	orr	r2, r1, r2
	and	r1, r3, r0, lsr #8
	and	r3, r0, #65280
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r3, lsl #8
	orr	r3, r0, r1
	b	.LBB110_169
.LBB110_113:
	ldr	r3, .LCPI110_53
	eor	r1, r0, r1
	eor	r3, r2, r3
	orrs	r1, r3, r1
	beq	.LBB110_135
	ldr	r1, .LCPI110_54
	eor	r1, r2, r1
	ldr	r2, .LCPI110_55
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	mov	r1, #8
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrb	r2, [r6]
	b	.LBB110_125
.LBB110_116:
	ldr	r1, .LCPI110_29
	eor	r3, r0, r3
	eor	r1, r2, r1
	orrs	r1, r1, r3
	beq	.LBB110_120
	ldr	r1, .LCPI110_30
	eor	r1, r2, r1
	ldr	r2, .LCPI110_31
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
.LBB110_118:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, #64
	ldm	r6, {r2, r3}
	stm	sp, {r0, r5}
	b	.LBB110_140
.LBB110_119:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, #16
	ldrsh	r2, [r6]
	b	.LBB110_167
.LBB110_120:
	mov	r0, #0
	mov	r1, #1
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, #64
	ldm	r6, {r2, r3}
	str	r1, [sp]
	str	r0, [sp, #4]
	b	.LBB110_123
.LBB110_121:
	ldr	r0, [sp, #48]
	mov	r1, r6
	str	r0, [sp]
	mov	r0, r4
	mov	r2, #1
	mov	r3, r5
	b	.LBB110_144
.LBB110_122:
	mov	r0, #0
	mov	r1, #64
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldm	r6, {r2, r3}
	stm	sp, {r0, r1}
.LBB110_123:
	str	r5, [sp, #8]
	b	.LBB110_168
.LBB110_124:
	mov	r0, #0
	mov	r1, #16
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrh	r2, [r6]
.LBB110_125:
	stm	sp, {r0, r1, r5}
	ldr	r0, [sp, #48]
	str	r0, [sp, #12]
.LBB110_126:
	mov	r0, r4
	mov	r3, #0
	b	.LBB110_170
.LBB110_127:
	mov	r7, r12
.LBB110_128:
	ldr	r0, .LCPI110_134
	ldr	r1, .LCPI110_135
	eor	r0, r9, r0
	ldr	r2, [r4, #44]
	eor	r1, r11, r1
	orrs	r0, r0, r1
	ldr	r1, [r4, #40]
	mov	r0, #0
	ldreq	r7, [r6]
	str	r0, [sp, #236]
	str	r0, [sp, #232]
	add	r0, r4, #84
	str	r0, [sp]
	mov	r3, r7
	ldr	r0, [sp, #48]
	str	r0, [sp, #4]
	add	r0, sp, #232
	bl	"reflect::write_type_writer"
	b	.LBB110_171
.LBB110_129:
	ldr	r0, [sp, #48]
	mov	r1, r6
	str	r0, [sp]
	mov	r0, r4
	mov	r2, #128
.LBB110_130:
	mov	r3, r5
	bl	"fmt::fmt_complex"
	b	.LBB110_171
.LBB110_131:
	mov	r0, #0
	ldr	r1, [r4, #40]
	str	r0, [sp, #208]
	add	r7, r4, #84
	str	r0, [sp, #212]
	ldm	r6, {r0, r3}
	ldr	r2, [r4, #44]
	stm	sp, {r0, r3, r7}
	ldr	r0, [sp, #48]
	str	r0, [sp, #12]
	add	r0, sp, #104
	bl	"reflect::write_typeid_writer"
	b	.LBB110_171
.LBB110_132:
	mov	r0, #0
	mov	r2, #64
	str	r0, [sp, #208]
	mov	r3, #65280
	str	r0, [sp, #212]
	ldm	r6, {r0, r1}
	and	r7, r1, #65280
	stm	sp, {r2, r5}
	ldr	r2, [sp, #48]
	str	r2, [sp, #8]
	and	r2, r3, r1, lsr #8
	orr	r2, r2, r1, lsr #24
	lsl	r1, r1, #24
	orr	r1, r1, r7, lsl #8
	orr	r2, r1, r2
	and	r1, r3, r0, lsr #8
	and	r3, r0, #65280
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r3, lsl #8
	orr	r3, r0, r1
	b	.LBB110_141
.LBB110_133:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldr	r1, [r6]
	b	.LBB110_149
.LBB110_134:
	mov	r0, #0
	mov	r12, #65280
	str	r0, [sp, #208]
	mov	r3, r5
	str	r0, [sp, #212]
	ldm	r6, {r0, r1, r2, r7}
	and	r5, r0, #65280
	and	r6, r12, r0, lsr #8
	orr	r6, r6, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r5, lsl #8
	orr	r0, r0, r6
	str	r0, [sp, #100]
	and	r0, r12, r1, lsr #8
	and	r6, r1, #65280
	orr	r0, r0, r1, lsr #24
	lsl	r1, r1, #24
	orr	r1, r1, r6, lsl #8
	orr	r0, r1, r0
	and	r1, r2, #65280
	str	r0, [sp, #96]
	and	r0, r12, r2, lsr #8
	orr	r0, r0, r2, lsr #24
	lsl	r2, r2, #24
	orr	r1, r2, r1, lsl #8
	lsl	r2, r7, #24
	orr	r0, r1, r0
	and	r1, r7, #65280
	str	r0, [sp, #92]
	and	r0, r12, r7, lsr #8
	orr	r1, r2, r1, lsl #8
	orr	r0, r0, r7, lsr #24
	orr	r0, r1, r0
	str	r0, [sp, #88]
	ldr	r0, [sp, #48]
	add	r1, sp, #88
	str	r0, [sp]
	mov	r0, r4
	mov	r2, #1
	b	.LBB110_144
.LBB110_135:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldm	r6, {r0, r1}
	orrs	r1, r0, r1
	b	.LBB110_150
.LBB110_136:
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp, #212]
	str	r0, [sp, #208]
	ldr	r0, [sp, #48]
	ldm	r6, {r1, r2}
	str	r0, [sp]
	mov	r0, r4
	bl	"fmt::fmt_string"
	b	.LBB110_171
.LBB110_137:
	mov	r0, #0
	mov	r1, #65280
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldr	r0, [r6]
	and	r2, r0, #65280
	and	r1, r1, r0, lsr #8
	orr	r1, r1, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r2, lsl #8
	orr	r0, r0, r1
.LBB110_138:
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r0, #32
.LBB110_139:
	stm	sp, {r0, r5}
	mov	r3, r1
.LBB110_140:
	ldr	r0, [sp, #48]
	str	r0, [sp, #8]
.LBB110_141:
	mov	r0, r4
	bl	"fmt::fmt_float"
	b	.LBB110_171
	.p2align	2
.LCPI110_137:
	.long	.L__$type_info_data
	.p2align	2
.LBB110_143:
	mov	r0, #0
	mov	r12, #65280
	str	r0, [sp, #208]
	mov	r3, r5
	str	r0, [sp, #212]
	ldm	r6, {r0, r1, r2, r7}
	and	r5, r0, #65280
	and	r6, r12, r0, lsr #8
	orr	r6, r6, r0, lsr #24
	lsl	r0, r0, #24
	orr	r0, r0, r5, lsl #8
	orr	r0, r0, r6
	str	r0, [sp, #84]
	and	r0, r12, r1, lsr #8
	and	r6, r1, #65280
	orr	r0, r0, r1, lsr #24
	lsl	r1, r1, #24
	orr	r1, r1, r6, lsl #8
	orr	r0, r1, r0
	and	r1, r2, #65280
	str	r0, [sp, #80]
	and	r0, r12, r2, lsr #8
	orr	r0, r0, r2, lsr #24
	lsl	r2, r2, #24
	orr	r1, r2, r1, lsl #8
	lsl	r2, r7, #24
	orr	r0, r1, r0
	and	r1, r7, #65280
	str	r0, [sp, #76]
	and	r0, r12, r7, lsr #8
	orr	r1, r2, r1, lsl #8
	orr	r0, r0, r7, lsr #24
	orr	r0, r1, r0
	str	r0, [sp, #72]
	ldr	r0, [sp, #48]
	add	r1, sp, #72
	str	r0, [sp]
	mov	r0, r4
	mov	r2, #0
.LBB110_144:
	bl	"fmt::fmt_int_128"
	b	.LBB110_171
.LBB110_145:
	mov	r0, #0
	mov	r2, r5
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, r4
	ldr	r1, [r6]
	ldr	r3, [sp, #48]
	add	sp, sp, #276
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_rune"
.LBB110_146:
	mov	r0, #0
	mov	r1, #16
	str	r0, [sp, #208]
	mov	r2, #1
	str	r0, [sp, #212]
	ldrh	r0, [r6]
	str	r2, [sp]
	stmib	sp, {r1, r5}
	ldr	r1, [sp, #48]
	str	r1, [sp, #12]
	lsl	r1, r0, #8
	orr	r0, r1, r0, lsr #8
	lsl	r0, r0, #16
	asr	r2, r0, #16
.LBB110_147:
	asr	r3, r0, #31
	b	.LBB110_169
.LBB110_148:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrh	r1, [r6]
.LBB110_149:
	cmp	r1, #0
.LBB110_150:
	movne	r1, #1
	mov	r0, r4
	mov	r2, r5
	ldr	r3, [sp, #48]
	add	sp, sp, #276
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_bool"
	.p2align	2
.LCPI110_138:
	.long	".L__$ti-0"
	.p2align	2
.LBB110_152:
	ldr	r0, [sp, #48]
	mov	r1, r6
	str	r0, [sp]
	mov	r0, r4
	mov	r2, #256
.LBB110_153:
	mov	r3, r5
	bl	"fmt::fmt_quaternion"
	b	.LBB110_171
.LBB110_154:
	mov	r0, #0
	mov	r3, #64
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldm	r6, {r1, r2}
	and	r7, r2, #65280
	stm	sp, {r0, r3, r5}
	ldr	r0, [sp, #48]
	str	r0, [sp, #12]
	mov	r0, #65280
	and	r3, r0, r2, lsr #8
	and	r0, r0, r1, lsr #8
	orr	r3, r3, r2, lsr #24
	lsl	r2, r2, #24
	orr	r2, r2, r7, lsl #8
	orr	r0, r0, r1, lsr #24
	orr	r2, r2, r3
	and	r3, r1, #65280
	lsl	r1, r1, #24
	orr	r1, r1, r3, lsl #8
	orr	r3, r1, r0
	b	.LBB110_169
.LBB110_155:
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp, #212]
	str	r0, [sp, #208]
	ldr	r0, [sp, #48]
	ldm	r6, {r1, r2}
	str	r0, [sp]
	mov	r0, r4
	bl	"fmt::fmt_string16"
	b	.LBB110_171
.LBB110_156:
	mov	r0, #0
	mov	r2, #16
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldrh	r1, [r6]
	stm	sp, {r0, r2, r5}
	ldr	r0, [sp, #48]
	str	r0, [sp, #12]
	lsl	r0, r1, #8
	orr	r0, r0, r1, lsr #8
	mov	r1, #255
	orr	r1, r1, #65280
	and	r2, r0, r1
	b	.LBB110_126
	.p2align	2
.LCPI110_139:
	.long	3440116162
	.p2align	2
.LCPI110_140:
	.long	3913933989
	.p2align	2
.LCPI110_141:
	.long	675385717
	.p2align	2
.LCPI110_142:
	.long	2524010688
	.p2align	2
.LCPI110_143:
	.long	2309362072
	.p2align	2
.LCPI110_144:
	.long	2506894805
	.p2align	2
.LBB110_163:
	mov	r0, #0
	mov	r2, #32
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	ldr	r1, [r6]
	stm	sp, {r0, r2, r5}
	and	r2, r1, #65280
	ldr	r0, [sp, #48]
	str	r0, [sp, #12]
	mov	r0, #65280
	and	r0, r0, r1, lsr #8
	orr	r0, r0, r1, lsr #24
	lsl	r1, r1, #24
	orr	r1, r1, r2, lsl #8
	orr	r2, r1, r0
	b	.LBB110_126
	.p2align	2
.LCPI110_145:
	.long	3193153172
	.p2align	2
.LCPI110_146:
	.long	2363733149
	.p2align	2
.LBB110_166:
	mov	r0, #0
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, #8
	ldrsb	r2, [r6]
.LBB110_167:
	mov	r1, #1
	stmib	sp, {r0, r5}
	asr	r3, r2, #31
	str	r1, [sp]
.LBB110_168:
	ldr	r0, [sp, #48]
	str	r0, [sp, #12]
.LBB110_169:
	mov	r0, r4
.LBB110_170:
	bl	"fmt::fmt_int"
.LBB110_171:
	add	sp, sp, #276
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB110_172:
	ldr	r1, .LCPI110_125
	eor	r1, r2, r1
	ldr	r2, .LCPI110_126
	eor	r0, r0, r2
	orrs	r0, r1, r0
	bne	.LBB110_176
	mov	r0, #0
	mov	r2, r5
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, r4
	ldr	r1, [r6]
	ldr	r3, [sp, #48]
	add	sp, sp, #276
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"fmt::fmt_cstring16"
	.p2align	2
.LCPI110_147:
	.long	70189486
	.p2align	2
.LCPI110_148:
	.long	972035155
	.p2align	2
.LBB110_176:
	ldr	r3, [sp, #48]
	mov	r0, #0
	add	r1, sp, #240
	str	r0, [sp, #208]
	str	r0, [sp, #212]
	mov	r0, r4
	mov	r2, r5
	bl	"fmt::fmt_value"
	b	.LBB110_171
	.p2align	2
.LCPI110_149:
	.long	159261011
	.p2align	2
.LCPI110_150:
	.long	1611042776
	.p2align	2
.LCPI110_151:
	.long	2124771594
	.p2align	2
.LCPI110_152:
	.long	1201977439
	.p2align	2
.LCPI110_153:
	.long	3728466314
	.p2align	2
.LCPI110_154:
	.long	1402735377
	.p2align	2
.LCPI110_155:
	.long	2124771595
	.p2align	2
.LCPI110_156:
	.long	3597656501
	.p2align	2
.LCPI110_157:
	.long	1273736861
	.p2align	2
.LCPI110_158:
	.long	1680707819
	.p2align	2
.LCPI110_159:
	.long	1338159828
	.p2align	2
.LCPI110_160:
	.long	2219277688
	.p2align	2
.LCPI110_161:
	.long	619147782
	.p2align	2
.LCPI110_162:
	.long	1237721379
	.p2align	2
.LCPI110_163:
	.long	764030577
	.p2align	2
.LCPI110_164:
	.long	951270734
	.p2align	2
.LCPI110_165:
	.long	826997542
	.p2align	2
.LCPI110_166:
	.long	1237721380
	.p2align	2
.LCPI110_167:
	.long	326884769
	.p2align	2
.LCPI110_168:
	.long	778414328
	.p2align	2
.LCPI110_169:
	.long	930476392
	.p2align	2
.LCPI110_170:
	.long	824957074
	.p2align	2
.LCPI110_171:
	.long	3175783652
	.p2align	2
.LCPI110_172:
	.long	2838995518
	.p2align	2
.LCPI110_173:
	.long	2513395066
	.p2align	2
.LCPI110_174:
	.long	3191702550
	.p2align	2
.LCPI110_175:
	.long	3175783653
	.p2align	2
.LCPI110_176:
	.long	3685864165
	.p2align	2
.LCPI110_177:
	.long	3047933354
	.p2align	2
.LCPI110_178:
	.long	1103076772
	.p2align	2
.LCPI110_179:
	.long	3108861875
	.p2align	2
.LCPI110_1:
	.long	".L__$ti-0"
.LCPI110_2:
	.long	3913933989
.LCPI110_8:
	.long	2014745563
.LCPI110_9:
	.long	2543566172
.LCPI110_10:
	.long	2078322779
.LCPI110_11:
	.long	4093975809
.LCPI110_12:
	.long	4093975810
.LCPI110_13:
	.long	2765151453
.LCPI110_14:
	.long	2083772720
.LCPI110_15:
	.long	1961540866
.LCPI110_16:
	.long	2147365262
.LCPI110_17:
	.long	2543566173
.LCPI110_18:
	.long	3959872871
.LCPI110_19:
	.long	2015947697
.LCPI110_20:
	.long	1612987855
.LCPI110_21:
	.long	2077448817
.LCPI110_22:
	.long	1759336533
.LCPI110_23:
	.long	3692985697
.LCPI110_24:
	.long	3692985698
.LCPI110_25:
	.long	519926174
.LCPI110_26:
	.long	1782300454
.LCPI110_27:
	.long	491610505
.LCPI110_28:
	.long	1892912397
.LCPI110_29:
	.long	159261012
.LCPI110_30:
	.long	2875826662
.LCPI110_31:
	.long	1626279920
.LCPI110_36:
	.long	3728466315
.LCPI110_37:
	.long	3422454003
.LCPI110_38:
	.long	1571068702
.LCPI110_39:
	.long	834436547
.LCPI110_40:
	.long	1575128057
.LCPI110_46:
	.long	1035496754
.LCPI110_47:
	.long	1004200369
.LCPI110_48:
	.long	1004200370
.LCPI110_49:
	.long	586708279
.LCPI110_50:
	.long	1164085392
.LCPI110_51:
	.long	454565267
.LCPI110_52:
	.long	1194933334
.LCPI110_53:
	.long	70189487
.LCPI110_54:
	.long	3853066515
.LCPI110_55:
	.long	1032104133
.LCPI110_62:
	.long	951270735
.LCPI110_63:
	.long	4061431485
.LCPI110_64:
	.long	919139866
.LCPI110_65:
	.long	1340100945
.LCPI110_66:
	.long	936009341
.LCPI110_72:
	.long	699342078
.LCPI110_73:
	.long	540712201
.LCPI110_74:
	.long	540712202
.LCPI110_75:
	.long	3594887409
.LCPI110_76:
	.long	706738861
.LCPI110_77:
	.long	1593006517
.LCPI110_78:
	.long	747444013
.LCPI110_79:
	.long	2219277689
.LCPI110_80:
	.long	70271381
.LCPI110_81:
	.long	645795731
.LCPI110_82:
	.long	168533802
.LCPI110_83:
	.long	2237362590
.LCPI110_84:
	.long	216749986
.LCPI110_85:
	.long	2267398411
.LCPI110_86:
	.long	2267398412
.LCPI110_87:
	.long	2573139160
.LCPI110_88:
	.long	502970347
.LCPI110_89:
	.long	2602103172
.LCPI110_90:
	.long	512274138
.LCPI110_91:
	.long	2237362591
.LCPI110_92:
	.long	3763667686
.LCPI110_93:
	.long	187437599
.LCPI110_94:
	.long	3972699277
.LCPI110_95:
	.long	400544228
.LCPI110_96:
	.long	400544229
.LCPI110_97:
	.long	1315131624
.LCPI110_98:
	.long	3990515063
.LCPI110_99:
	.long	3988153103
.LCPI110_100:
	.long	4066164137
.LCPI110_101:
	.long	3440116163
.LCPI110_102:
	.long	1693165202
.LCPI110_103:
	.long	3971323377
.LCPI110_104:
	.long	2524010688
.LCPI110_110:
	.long	2513395067
.LCPI110_111:
	.long	1181551897
.LCPI110_112:
	.long	3302160237
.LCPI110_113:
	.long	3772748214
.LCPI110_114:
	.long	3617066870
.LCPI110_120:
	.long	2660435127
.LCPI110_121:
	.long	2428448025
.LCPI110_122:
	.long	2428448026
.LCPI110_123:
	.long	426601705
.LCPI110_124:
	.long	2698242406
.LCPI110_125:
	.long	1082444513
.LCPI110_126:
	.long	2829565147
.LCPI110_127:
	.long	675385718
.LCPI110_128:
	.long	3869536690
.LCPI110_129:
	.long	2584292428
.LCPI110_134:
	.long	1385839624
.LCPI110_135:
	.long	27237293
.LCPI110_136:
	.long	".Lcsbs$POC-Example$169"
.Lfunc_end110:
	.size	"fmt::fmt_arg", .Lfunc_end110-"fmt::fmt_arg"
	.fnend

	.section	.text.unlikely.,"ax",%progbits
	.p2align	2
	.type	"runtime::bounds_check_error.handle_error-0",%function
	.code	32
"runtime::bounds_check_error.handle_error-0":
	.fnstart
	.pad	#24
	sub	sp, sp, #24
	mov	r12, #0
	stm	sp, {r0, r1, r2, r3, r12}
	mov	r0, sp
	str	r12, [sp, #20]
	bl	"runtime::print_caller_location"
	ldr	r0, [sp, #24]
	asr	r1, r0, #31
	bl	"runtime::print_i64"
	ldr	r0, [sp, #28]
	asr	r1, r0, #31
	bl	"runtime::print_i64"
	.inst	0xe7ffdefe
.Lfunc_end111:
	.size	"runtime::bounds_check_error.handle_error-0", .Lfunc_end111-"runtime::bounds_check_error.handle_error-0"
	.cantunwind
	.fnend

	.p2align	2
	.type	"runtime::type_assertion_check2_with_context.handle_error-0",%function
	.code	32
"runtime::type_assertion_check2_with_context.handle_error-0":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#68
	sub	sp, sp, #68
	.pad	#1024
	sub	sp, sp, #1024
	ldr	r4, [sp, #1128]
	mov	r10, r0
	ldr	r5, [sp, #1132]
	mov	r11, r1
	str	r2, [sp, #36]
	ldr	r2, [sp, #1144]
	mov	r0, r4
	mov	r1, r5
	str	r3, [sp, #32]
	bl	"runtime::[error_checks.odin]::type_assertion_variant_type"
	add	r9, sp, #68
	mov	r6, r0
	mov	r8, r1
	mov	r1, #0
	mov	r0, r9
	mov	r2, #1024
	mov	r7, #0
	bl	memset
	ldr	r0, [sp, #1140]
	mov	r1, r9
	str	r0, [sp, #12]
	mov	r2, #1024
	ldr	r0, [sp, #1136]
	str	r0, [sp, #8]
	add	r0, sp, #64
	str	r7, [sp, #64]
	str	r8, [sp, #20]
	str	r6, [sp, #16]
	stm	sp, {r4, r5}
	bl	"runtime::type_assertion_check2_with_context.handle_error-0.do_msg-0"
	mov	r0, #1024
	mov	r2, #53
	ldr	r6, [sp, #1148]
	orr	r2, r2, #256
	str	r0, [sp, #4]
	mov	r1, #56
	ldr	r0, .LCPI112_0
	mov	r3, #34
	ldr	r4, [sp, #64]
	ldr	r5, [r6, #16]
	str	r4, [sp]
	bl	"runtime::slice_expr_error_hi"
	ldr	r0, [sp, #32]
	cmp	r5, #0
	str	r0, [sp, #52]
	mov	r1, #14
	ldr	r0, [sp, #36]
	mov	r2, r9
	str	r0, [sp, #48]
	add	r0, sp, #40
	stm	sp, {r0, r6}
	mov	r3, r4
	ldr	r0, .LCPI112_2
	ldr	r6, .LCPI112_1
	movne	r6, r5
	str	r7, [sp, #60]
	str	r7, [sp, #56]
	str	r11, [sp, #44]
	str	r10, [sp, #40]
	mov	lr, pc
	mov	pc, r6
	.p2align	2
.LCPI112_0:
	.long	".Lcsbs$POC-Example$151"
.LCPI112_1:
	.long	"runtime::default_assertion_failure_proc"
.LCPI112_2:
	.long	".Lcsbs$POC-Example$1a1"
.Lfunc_end112:
	.size	"runtime::type_assertion_check2_with_context.handle_error-0", .Lfunc_end112-"runtime::type_assertion_check2_with_context.handle_error-0"
	.fnend

	.p2align	2
	.type	"runtime::type_assertion_check2_contextless.handle_error-0",%function
	.code	32
"runtime::type_assertion_check2_contextless.handle_error-0":
	.fnstart
	.pad	#24
	sub	sp, sp, #24
	ldr	r8, .LCPI113_0
	mov	r6, r0
	ldr	r5, .LCPI113_1
	mov	r2, r1
	mov	r0, r8
	mov	r1, r5
	bl	"runtime::[error_checks.odin]::type_assertion_variant_type"
	mov	r7, r0
	mov	r0, #0
	str	r0, [sp, #20]
	mov	r4, r1
	str	r0, [sp, #16]
	mov	r0, #9
	str	r0, [sp, #12]
	mov	r0, #49
	str	r0, [sp, #4]
	ldr	r0, .LCPI113_2
	str	r0, [sp]
	mov	r0, sp
	str	r6, [sp, #8]
	bl	"runtime::print_caller_location"
	mov	r0, r8
	mov	r1, r5
	bl	"runtime::print_typeid"
	ldr	r0, .LCPI113_3
	ldr	r1, .LCPI113_4
	bl	"runtime::print_typeid"
	eor	r2, r4, r5
	eor	r3, r7, r8
	orrs	r2, r3, r2
	beq	.LBB113_2
	mov	r0, r7
	mov	r1, r4
	bl	"runtime::print_typeid"
.LBB113_2:
	.inst	0xe7ffdefe
	.p2align	2
.LCPI113_0:
	.long	396265691
.LCPI113_1:
	.long	761227683
.LCPI113_2:
	.long	".Lcsbs$POC-Example$113"
.LCPI113_3:
	.long	3661965974
.LCPI113_4:
	.long	4135237592
.Lfunc_end113:
	.size	"runtime::type_assertion_check2_contextless.handle_error-0", .Lfunc_end113-"runtime::type_assertion_check2_contextless.handle_error-0"
	.cantunwind
	.fnend

	.text
	.p2align	2
	.type	"fmt::wprintf.parse_options-0",%function
	.code	32
"fmt::wprintf.parse_options-0":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#60
	sub	sp, sp, #60
	ldr	r9, [sp, #100]
	cmp	r1, r2
	ldr	r11, [sp, #96]
	bge	.LBB114_13
	ldr	r10, .LCPI114_0
	cmp	r1, #16
	mov	r7, r1
	mov	lr, #1
	add	r6, r1, r10
	movls	r7, #16
	add	r6, r6, #2
	mov	r12, #0
	b	.LBB114_4
.LBB114_2:
	ldrb	r4, [r0]
	rsbs	r5, r4, #0
	adc	r4, r4, r5
	strb	r4, [r0, #3]
.LBB114_3:
	add	r1, r1, #1
	add	r6, r6, #1
	cmp	r2, r1
	beq	.LBB114_12
.LBB114_4:
	cmp	r7, r1
	beq	.LBB114_95
	ldrb	r4, [r10, r1]
	sub	r4, r4, #32
	cmp	r4, #16
	bhi	.LBB114_51
	adr	r5, .LJTI114_0
	ldr	pc, [r5, r4, lsl #2]
	.p2align	2
.LJTI114_0:
	.long	.LBB114_8
	.long	.LBB114_51
	.long	.LBB114_51
	.long	.LBB114_10
	.long	.LBB114_51
	.long	.LBB114_51
	.long	.LBB114_51
	.long	.LBB114_51
	.long	.LBB114_51
	.long	.LBB114_51
	.long	.LBB114_44
	.long	.LBB114_9
	.long	.LBB114_51
	.long	.LBB114_11
	.long	.LBB114_51
	.long	.LBB114_51
	.long	.LBB114_2
.LBB114_8:
	strb	lr, [r0, #2]
	b	.LBB114_3
.LBB114_9:
	strb	lr, [r0, #1]
	b	.LBB114_3
.LBB114_10:
	strb	lr, [r0, #4]
	b	.LBB114_3
.LBB114_11:
	strb	r12, [r0, #3]
	strb	lr, [r0]
	b	.LBB114_3
.LBB114_12:
	mov	r1, r2
.LBB114_13:
	add	r12, r0, #5
	add	lr, r0, #12
	mov	r5, #0
	cmp	r1, #15
	mov	r7, r1
	bgt	.LBB114_19
.LBB114_14:
	ldr	r10, .LCPI114_0
	cmp	r1, #16
	mov	r6, r1
	mov	r5, #0
	movls	r6, #16
	mov	r7, r1
.LBB114_15:
	cmp	r6, r7
	beq	.LBB114_96
	ldrb	r4, [r10, r7]
	sub	r8, r4, #48
	cmp	r8, #9
	bhi	.LBB114_19
	add	r5, r5, r5, lsl #2
	add	r7, r7, #1
	cmp	r7, #16
	add	r4, r4, r5, lsl #1
	sub	r5, r4, #48
	bne	.LBB114_15
	mov	r7, #16
.LBB114_19:
	mov	r6, #0
	cmp	r7, r1
	movgt	r6, #1
	str	r5, [lr]
	strb	r6, [r12]
.LBB114_20:
	cmp	r7, r2
	bge	.LBB114_39
	cmp	r7, #16
	bhs	.LBB114_97
	ldr	r6, .LCPI114_0
	ldrb	r1, [r6, r7]
	cmp	r1, #46
	bne	.LBB114_39
	add	r1, r7, #1
	cmp	r1, r2
	bge	.LBB114_41
	cmp	r7, #15
	beq	.LBB114_98
	ldrb	r2, [r6, r1]
	cmp	r2, #42
	bne	.LBB114_52
	add	r8, r7, #2
	cmp	r7, #13
	bhi	.LBB114_33
	ldrb	r1, [r6, r8]
	cmp	r1, #91
	bne	.LBB114_33
	cmp	r7, #11
	bhi	.LBB114_32
	add	r1, r6, r7
	rsb	r12, r7, #14
	add	r8, r1, #3
	sub	r1, r7, #13
	mov	r2, #0
.LBB114_30:
	ldrb	r5, [r8, -r2]
	cmp	r5, #93
	beq	.LBB114_83
	sub	r2, r2, #1
	cmp	r1, r2
	bne	.LBB114_30
.LBB114_32:
	add	r8, r7, #3
.LBB114_33:
	ldm	r3, {r2, r7}
.LBB114_34:
	orrs	r1, r2, r7
	beq	.LBB114_59
	rsb	r1, r7, #0
	ldr	r12, .LCPI114_1
	rsb	r4, r2, #0
	and	r1, r7, r1
	and	r4, r2, r4
	cmp	r7, #0
	mul	r5, r1, r12
	adr	r1, .LCPI114_8
	mul	r6, r4, r12
	ldrb	r5, [r1, r5, lsr #27]
	moveq	r5, #32
	ldrb	r1, [r1, r6, lsr #27]
	cmp	r2, #0
	moveq	r1, #32
	addeq	r1, r5, #32
.LBB114_36:
	rsb	r6, r1, #32
	mov	r12, #1
	subs	r4, r1, #32
	lsl	r5, r12, r1
	lsr	r6, r12, r6
	movpl	r5, #0
	lslpl	r6, r12, r4
	cmp	r1, #64
	biclo	r7, r7, r6
	biclo	r2, r2, r5
	cmp	r1, r9
	stm	r3, {r2, r7}
	bge	.LBB114_62
	ldr	r1, [r11, r1, lsl #4]!
	add	r12, sp, #44
	str	r1, [sp, #40]
	mov	r6, r0
	ldr	r1, [r11, #4]
	mov	r5, #0
	ldr	r2, [r11, #8]
	ldr	r3, [r11, #12]
	stm	r12, {r1, r2, r3}
	add	r2, sp, #24
	add	r1, sp, #40
	mov	r0, r2
	ldr	r2, [sp, #104]
	str	r5, [sp, #24]
	str	r5, [sp, #28]
	strb	r5, [sp, #32]
	bl	"reflect::as_i64"
	ldr	r1, [sp, #24]
	mov	r2, r6
	ldrb	r0, [sp, #32]
	cmn	r1, #1
	strb	r0, [r6, #6]
	str	r1, [r6, #16]
	ble	.LBB114_77
	tst	r0, #255
	mov	r0, r8
	bne	.LBB114_40
	b	.LBB114_78
.LBB114_39:
	mov	r0, r7
.LBB114_40:
	add	sp, sp, #60
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB114_41:
	add	r3, r0, #6
	add	r2, r0, #16
	cmp	r7, #15
	bne	.LBB114_53
	mov	r0, #0
	strb	r0, [r3]
	str	r0, [r2]
	b	.LBB114_58
.LCPI114_8:
	.ascii	"\000\001\034\002\035\016\030\003\036\026\024\017\031\021\004\b\037\033\r\027\025\023\020\007\032\f\022\006\013\005\n\t"
	.p2align	2
.LBB114_44:
	mov	r7, #16
	cmp	r1, #15
	beq	.LBB114_65
	add	r7, r10, r1
	ldrb	r7, [r7, #1]
	cmp	r7, #91
	bne	.LBB114_64
	cmp	r1, #12
	bhi	.LBB114_50
	rsb	r12, r1, #15
	sub	r5, r1, #14
	mov	r7, #0
.LBB114_48:
	ldrb	r4, [r6, -r7]
	cmp	r4, #93
	beq	.LBB114_80
	sub	r7, r7, #1
	cmp	r5, r7
	bne	.LBB114_48
.LBB114_50:
	add	r7, r1, #2
	b	.LBB114_65
.LBB114_51:
	add	r12, r0, #5
	add	lr, r0, #12
	b	.LBB114_14
.LBB114_52:
	add	r3, r0, #6
	add	r2, r0, #16
.LBB114_53:
	mov	r7, #0
	mov	r0, r1
.LBB114_54:
	ldrb	r5, [r6, r0]
	sub	r4, r5, #48
	cmp	r4, #9
	bhi	.LBB114_57
	add	r7, r7, r7, lsl #2
	add	r0, r0, #1
	cmp	r0, #16
	add	r7, r5, r7, lsl #1
	sub	r7, r7, #48
	bne	.LBB114_54
	mov	r0, #16
.LBB114_57:
	str	r7, [r2]
	cmp	r0, r1
	mov	r7, #0
	movgt	r7, #1
	strb	r7, [r3]
	bne	.LBB114_40
.LBB114_58:
	mov	r0, #1
	strb	r0, [r3]
	mov	r0, #0
	str	r0, [r2]
	mov	r0, r1
	b	.LBB114_40
.LBB114_59:
	ldr	r5, [r0, #40]
	cmp	r5, #0
	beq	.LBB114_61
	mov	r2, #0
	ldr	r1, [r0, #44]
	str	r2, [sp, #48]
	mov	r6, r0
	str	r2, [sp, #44]
	str	r2, [sp, #40]
	str	r2, [sp, #8]
	str	r2, [sp, #12]
	str	r2, [sp, #16]
	ldr	r2, [sp, #104]
	str	r2, [sp, #20]
	mov	r2, #20
	str	r2, [sp]
	add	r2, sp, #40
	ldr	r3, .LCPI114_4
	mov	r0, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r5
	ldr	r0, [r6, #84]
	ldr	r1, [sp, #40]
	add	r0, r0, r1
	str	r0, [r6, #84]
.LBB114_61:
	mov	r0, r8
	b	.LBB114_40
.LBB114_62:
	mov	r1, #0
	strb	r12, [r0, #6]
	str	r1, [r0, #16]
	mov	r0, r8
	b	.LBB114_40
.LCPI114_9:
	.ascii	"\000\001\034\002\035\016\030\003\036\026\024\017\031\021\004\b\037\033\r\027\025\023\020\007\032\f\022\006\013\005\n\t"
	.p2align	2
.LBB114_64:
	add	r7, r1, #1
.LBB114_65:
	ldm	r3, {r1, r5}
	orrs	r6, r1, r5
	beq	.LBB114_73
	rsb	r6, r5, #0
	ldr	r12, .LCPI114_1
	and	r6, r5, r6
	adr	lr, .LCPI114_9
	cmp	r5, #0
	mul	r4, r6, r12
	rsb	r6, r1, #0
	and	r6, r1, r6
	ldrb	r10, [lr, r4, lsr #27]
	mul	r4, r6, r12
	moveq	r10, #32
	cmp	r1, #0
	ldrb	lr, [lr, r4, lsr #27]
	moveq	lr, #32
	addeq	lr, r10, #32
.LBB114_67:
	rsb	r4, lr, #32
	mov	r12, #1
	subs	r10, lr, #32
	lsl	r6, r12, lr
	lsr	r4, r12, r4
	movpl	r6, #0
	lslpl	r4, r12, r10
	cmp	lr, #64
	biclo	r5, r5, r4
	biclo	r1, r1, r6
	cmp	lr, r9
	stm	r3, {r1, r5}
	bge	.LBB114_75
	mov	r1, #0
	mov	r10, r2
	str	r1, [sp, #24]
	mov	r4, r3
	str	r1, [sp, #28]
	mov	r5, r0
	strb	r1, [sp, #32]
	mov	r1, r11
	ldr	r2, [r1, lr, lsl #4]!
	str	r2, [sp, #40]
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #8]
	ldr	r1, [r1, #12]
	str	r2, [sp, #44]
	add	r2, sp, #24
	str	r1, [sp, #52]
	add	r1, sp, #40
	mov	r0, r2
	ldr	r2, [sp, #104]
	str	r3, [sp, #48]
	bl	"reflect::as_i64"
	ldrb	r2, [sp, #32]
	mov	r0, r5
	ldr	r1, [sp, #24]
	tst	r2, #255
	strb	r2, [r5, #5]
	str	r1, [r5, #12]
	bne	.LBB114_71
	ldr	r6, [r0, #40]
	cmp	r6, #0
	beq	.LBB114_71
	ldr	r1, [r0, #44]
	mov	r0, #0
	str	r0, [sp, #48]
	mov	r2, #4
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #104]
	str	r0, [sp, #20]
	mov	r0, #13
	ldr	r3, .LCPI114_3
	str	r0, [sp]
	add	r0, sp, #40
	mov	lr, pc
	mov	pc, r6
	ldr	r1, [r5, #12]
	mov	r0, r5
	ldr	r2, [r5, #84]
	ldr	r3, [sp, #40]
	add	r2, r2, r3
	str	r2, [r5, #84]
.LBB114_71:
	cmn	r1, #1
	mov	r3, r4
	mov	r2, r10
	bgt	.LBB114_20
	mov	r6, #0
	rsb	r1, r1, #0
	strb	r6, [r0, #3]
	mov	r6, #1
	strb	r6, [r0]
	b	.LBB114_76
.LBB114_73:
	ldr	r4, [r0, #40]
	cmp	r4, #0
	beq	.LBB114_20
	mov	r6, #0
	ldr	lr, .LCPI114_4
	ldr	r1, [r0, #44]
	add	r12, sp, #40
	str	r6, [sp, #48]
	mov	r10, r0
	str	r6, [sp, #44]
	mov	r5, r3
	str	r6, [sp, #40]
	mov	r0, r12
	str	r6, [sp, #8]
	mov	r3, lr
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	ldr	r6, [sp, #104]
	str	r6, [sp, #20]
	mov	r6, #20
	str	r6, [sp]
	mov	r6, r2
	mov	r2, #4
	mov	lr, pc
	mov	pc, r4
	mov	r2, r6
	ldr	r1, [r10, #84]
	ldr	r6, [sp, #40]
	mov	r3, r5
	mov	r0, r10
	add	r1, r1, r6
	str	r1, [r10, #84]
	b	.LBB114_20
.LBB114_75:
	strb	r12, [r0, #5]
	mov	r1, #0
.LBB114_76:
	str	r1, [r0, #12]
	b	.LBB114_20
.LBB114_77:
	strb	r5, [r2, #6]
	mov	r0, r8
	str	r5, [r2, #16]
.LBB114_78:
	ldr	r5, [r2, #40]
	cmp	r5, #0
	beq	.LBB114_40
	mov	r0, #0
	ldr	r1, [r2, #44]
	str	r0, [sp, #48]
	mov	r4, r2
	str	r0, [sp, #44]
	mov	r2, #4
	str	r0, [sp, #40]
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	str	r0, [sp, #16]
	ldr	r0, [sp, #104]
	str	r0, [sp, #20]
	mov	r0, #17
	ldr	r3, .LCPI114_6
	str	r0, [sp]
	add	r0, sp, #40
	mov	lr, pc
	mov	pc, r5
	ldr	r1, [r4, #84]
	mov	r0, r8
	ldr	r2, [sp, #40]
	add	r1, r1, r2
	str	r1, [r4, #84]
	b	.LBB114_40
.LBB114_80:
	mov	r5, #0
	mov	lr, #0
.LBB114_81:
	add	r4, r10, r5
	add	r4, r4, r1
	ldrb	r6, [r4, #2]
	sub	r4, r6, #48
	cmp	r4, #9
	bhi	.LBB114_86
	add	r4, lr, lr, lsl #2
	add	r6, r6, r4, lsl #1
	add	r4, r1, r5
	sub	lr, r6, #48
	add	r5, r5, #1
	cmp	r4, #13
	bne	.LBB114_81
	b	.LBB114_87
.LBB114_83:
	rsb	lr, r7, #13
	mov	r5, #0
	mov	r1, #0
.LBB114_84:
	ldrb	r4, [r8, r5]
	sub	r6, r4, #48
	cmp	r6, #9
	bhi	.LBB114_91
	add	r1, r1, r1, lsl #2
	add	r5, r5, #1
	cmp	lr, r5
	add	r1, r4, r1, lsl #1
	sub	r1, r1, #48
	bne	.LBB114_84
	b	.LBB114_92
.LBB114_86:
	add	r12, r5, #1
.LBB114_87:
	add	r4, r12, r7
	sub	r1, r1, r7
	subs	r4, r4, #1
	mov	r5, #0
	movne	r4, #1
	cmp	r12, #2
	movlo	r5, #1
	orrs	r6, r5, r4
	add	r7, r1, #3
	movne	lr, #0
	bne	.LBB114_65
	cmp	lr, #0
	bmi	.LBB114_65
	cmp	lr, r9
	bge	.LBB114_65
	ldm	r3, {r1, r5}
	b	.LBB114_67
.LBB114_91:
	add	r12, r5, #1
.LBB114_92:
	add	r6, r12, r2
	sub	r2, r7, r2
	subs	r6, r6, #1
	mov	r5, #0
	movne	r6, #1
	cmp	r12, #2
	movlo	r5, #1
	orrs	r6, r5, r6
	add	r8, r2, #4
	movne	r1, #0
	ldm	r3, {r2, r7}
	bne	.LBB114_34
	cmp	r1, #0
	bmi	.LBB114_34
	cmp	r1, r9
	blt	.LBB114_36
	b	.LBB114_34
.LBB114_95:
	mov	r0, #16
	mov	r2, #91
	str	r0, [sp, #4]
	orr	r2, r2, #512
	ldr	r0, .LCPI114_5
	mov	r1, #43
	mov	r3, #15
	str	r7, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB114_96:
	mov	r0, #16
	mov	r2, #143
	str	r0, [sp, #4]
	orr	r2, r2, #768
	ldr	r0, .LCPI114_5
	mov	r1, #43
	mov	r3, #10
	str	r6, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB114_97:
	mov	r0, #16
	mov	r1, #43
	str	r0, [sp, #4]
	mov	r2, #648
	ldr	r0, .LCPI114_5
	mov	r3, #21
	str	r7, [sp]
	bl	"runtime::bounds_check_error.handle_error-0"
.LBB114_98:
	mov	r0, #16
	mov	r2, #138
	str	r0, [sp, #4]
	orr	r2, r2, #512
	ldr	r0, .LCPI114_5
	mov	r3, #22
	str	r1, [sp]
	mov	r1, #43
	bl	"runtime::bounds_check_error.handle_error-0"
	.p2align	2
.LCPI114_0:
	.long	".Lcsbs$POC-Example$e4"
.LCPI114_1:
	.long	125613361
.LCPI114_3:
	.long	".Lcsbs$POC-Example$1a6"
.LCPI114_4:
	.long	".Lcsbs$POC-Example$1a8"
.LCPI114_5:
	.long	".Lcsbs$POC-Example$156"
.LCPI114_6:
	.long	".Lcsbs$POC-Example$1a7"
.Lfunc_end114:
	.size	"fmt::wprintf.parse_options-0", .Lfunc_end114-"fmt::wprintf.parse_options-0"
	.fnend

	.p2align	2
	.type	"fmt::[fmt.odin]::handle_tag.handle_optional_len-0",%function
	.code	32
"fmt::[fmt.odin]::handle_tag.handle_optional_len-0":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#84
	sub	sp, sp, #84
	str	r0, [sp, #12]
	ldr	r0, [r1, #20]
	str	r3, [sp, #36]
	cmp	r0, #0
	str	r1, [sp, #16]
	str	r0, [sp, #20]
	bmi	.LBB115_22
	beq	.LBB115_21
	ldr	r0, [sp, #16]
	mov	r8, r2
	mov	r1, #0
	ldr	r0, [r0, #4]
	str	r0, [sp, #24]
	ldr	r0, [sp, #36]
	bic	r0, r0, #15
	str	r0, [sp, #32]
	sub	r0, r0, #1
	bic	r0, r0, #15
	add	r0, r0, #16
	str	r0, [sp, #8]
	b	.LBB115_4
.LBB115_3:
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #20]
	add	r1, r1, #1
	cmp	r1, r0
	beq	.LBB115_21
.LBB115_4:
	ldr	r0, [sp, #24]
	str	r1, [sp, #28]
	ldr	lr, [r0, r1, lsl #3]!
	ldr	r1, [sp, #36]
	ldr	r0, [r0, #4]
	cmp	r0, r1
	bne	.LBB115_3
	ldr	r0, [sp, #36]
	cmp	r0, #0
	cmpne	r8, lr
	beq	.LBB115_20
	ldr	r1, [sp, #36]
	mov	r0, #0
	cmp	r1, #8
	blo	.LBB115_16
	ldr	r0, [sp, #32]
	cmp	r0, #0
	beq	.LBB115_12
	mov	r4, #0
.LBB115_9:
	mov	r12, r8
	mov	r5, lr
	ldrb	r1, [r5, r4]!
	ldrb	r0, [r12, r4]!
	str	r0, [sp, #44]
	ldrb	r0, [r12, #15]
	ldrb	r10, [r5, #15]
	str	r1, [sp, #40]
	ldrb	r1, [r12, #14]
	subs	r0, r10, r0
	ldrb	r7, [r5, #14]
	movne	r0, #1
	ldrb	r2, [r5, #12]
	subs	r1, r7, r1
	ldrb	r7, [r5, #13]
	movne	r1, #1
	orr	r0, r1, r0, lsl #1
	ldrb	r1, [r12, #13]
	ldrb	r6, [r5, #8]
	subs	r1, r7, r1
	ldrb	r7, [r12, #12]
	movne	r1, #1
	ldrb	r3, [r12, #3]
	subs	r2, r2, r7
	ldrb	r7, [r5, #10]
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	orr	r0, r1, r0, lsl #2
	ldrb	r1, [r12, #11]
	ldrb	r2, [r5, #11]
	ldrb	r11, [r5, #2]
	subs	r1, r2, r1
	ldrb	r2, [r12, #10]
	movne	r1, #1
	ldrb	r9, [r5, #3]
	subs	r2, r7, r2
	ldrb	r7, [r5, #9]
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	ldrb	r2, [r12, #9]
	subs	r2, r7, r2
	ldrb	r7, [r12, #8]
	movne	r2, #1
	subs	r6, r6, r7
	ldrb	r7, [r12, #2]
	movne	r6, #1
	orr	r2, r6, r2, lsl #1
	orr	r1, r2, r1, lsl #2
	ldrb	r2, [r5, #7]
	orr	r10, r1, r0, lsl #4
	ldrb	r1, [r12, #7]
	ldrb	r6, [r5, #6]
	subs	r1, r2, r1
	ldrb	r2, [r12, #6]
	movne	r1, #1
	ldrb	r0, [r12, #4]
	subs	r2, r6, r2
	ldrb	r6, [r5, #5]
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	ldrb	r2, [r12, #5]
	subs	r2, r6, r2
	ldrb	r6, [r12, #1]
	ldrb	r12, [r5, #1]
	movne	r2, #1
	ldrb	r5, [r5, #4]
	subs	r0, r5, r0
	movne	r0, #1
	orr	r0, r0, r2, lsl #1
	orr	r0, r0, r1, lsl #2
	subs	r1, r9, r3
	movne	r1, #1
	subs	r2, r11, r7
	movne	r2, #1
	orr	r1, r2, r1, lsl #1
	ldr	r2, [sp, #44]
	ldr	r3, [sp, #40]
	subs	r5, r3, r2
	movne	r5, #1
	subs	r3, r12, r6
	movne	r3, #1
	orr	r3, r5, r3, lsl #1
	orr	r1, r3, r1, lsl #2
	orr	r0, r1, r0, lsl #4
	mov	r1, #255
	and	r0, r0, #255
	orr	r1, r1, #65280
	orr	r0, r0, r10, lsl #8
	tst	r0, r1
	bne	.LBB115_3
	ldr	r0, [sp, #32]
	add	r4, r4, #16
	cmp	r4, r0
	blo	.LBB115_9
	ldr	r0, [sp, #8]
	b	.LBB115_13
.LBB115_12:
	mov	r0, #0
.LBB115_13:
	ldr	r1, [sp, #36]
	sub	r1, r1, r0
	bic	r5, r1, #3
	cmp	r0, r5
	bhs	.LBB115_16
.LBB115_14:
	ldr	r1, [r8, r0]
	ldr	r3, [lr, r0]
	cmp	r3, r1
	bne	.LBB115_3
	add	r0, r0, #4
	cmp	r0, r5
	blo	.LBB115_14
.LBB115_16:
	ldr	r1, [sp, #36]
	cmp	r1, r0
	bls	.LBB115_20
	ldr	r1, [sp, #36]
	add	r7, lr, r0
	add	r5, r8, r0
	sub	r0, r1, r0
.LBB115_18:
	ldrb	r1, [r7], #1
	ldrb	r3, [r5], #1
	cmp	r1, r3
	bne	.LBB115_3
	subs	r0, r0, #1
	bne	.LBB115_18
.LBB115_20:
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #28]
	ldr	r0, [r1]
	ldr	r1, [r1, #8]
	ldr	r0, [r0, r2, lsl #2]
	ldr	r1, [r1, r2, lsl #2]
	ldr	r2, [r0, #16]
	str	r2, [sp, #72]
	ldr	r2, [sp, #12]
	ldr	r0, [r0, #20]
	add	r1, r1, r2
	str	r0, [sp, #76]
	mov	r0, #0
	ldr	r2, [sp, #124]
	str	r1, [sp, #64]
	add	r1, sp, #64
	str	r0, [sp, #68]
	str	r0, [sp, #48]
	str	r0, [sp, #52]
	strb	r0, [sp, #56]
	add	r0, sp, #48
	bl	"reflect::as_i64"
	ldrb	r0, [sp, #56]
	cmp	r0, #0
	ldrne	r0, [sp, #48]
	ldrne	r1, [sp, #120]
	bicne	r0, r0, r0, asr #31
	strne	r0, [r1]
.LBB115_21:
	add	sp, sp, #84
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB115_22:
	ldr	r0, [sp, #20]
	mov	r2, #956
	str	r0, [sp]
	orr	r2, r2, #1024
	ldr	r0, .LCPI115_0
	mov	r1, #43
	mov	r3, #25
	bl	"runtime::multi_pointer_slice_handle_error"
	.p2align	2
.LCPI115_0:
	.long	".Lcsbs$POC-Example$156"
.Lfunc_end115:
	.size	"fmt::[fmt.odin]::handle_tag.handle_optional_len-0", .Lfunc_end115-"fmt::[fmt.odin]::handle_tag.handle_optional_len-0"
	.fnend

	.p2align	2
	.type	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2",%function
	.code	32
"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#148
	sub	sp, sp, #148
	mov	r11, r0
	ldr	r0, [sp, #184]
	str	r2, [sp, #44]
	sub	r6, r0, #1
	subs	r0, r2, #10
	sbcs	r0, r3, #0
	str	r3, [sp, #40]
	blt	.LBB116_4
	ldr	r8, .LCPI116_0
	mov	lr, #0
	ldr	r12, .LCPI116_1
	mov	r4, r2
	mov	r7, r3
.LBB116_2:
	lsr	r5, r4, #1
	sub	r6, r6, #1
	orr	r5, r5, r7, lsl #31
	adds	r1, r5, r7, lsr #1
	adc	r1, r1, #0
	umull	r2, r0, r1, r8
	bic	r2, r0, #3
	add	r0, r2, r0, lsr #2
	sub	r0, r1, r0
	subs	r0, r5, r0
	umull	r1, r2, r0, r8
	mla	r5, r0, r12, r2
	rsc	r0, lr, r7, lsr #1
	mla	r2, r0, r8, r5
	rsbs	r0, r4, #99
	rscs	r0, r7, #0
	mov	r4, r1
	mov	r7, r2
	blo	.LBB116_2
	cmp	r6, #1
	blt	.LBB116_8
.LBB116_4:
	add	r10, sp, #128
	add	r5, sp, #56
	mov	r4, #1
	mov	r8, #48
	mov	r9, #0
	b	.LBB116_6
.LBB116_5:
	subs	r6, r6, #1
	beq	.LBB116_8
.LBB116_6:
	ldr	r7, [r11, #40]
	ldr	r1, [r11, #44]
	cmp	r7, #0
	strb	r8, [sp, #128]
	beq	.LBB116_5
	ldr	r0, [sp, #188]
	mov	r2, #4
	str	r0, [sp, #20]
	mov	r0, r5
	mov	r3, r10
	str	r9, [sp, #64]
	str	r9, [sp, #60]
	str	r9, [sp, #56]
	str	r9, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #16]
	str	r4, [sp]
	mov	lr, pc
	mov	pc, r7
	ldr	r0, [r11, #84]
	ldr	r1, [sp, #56]
	add	r0, r0, r1
	str	r0, [r11, #84]
	b	.LBB116_5
.LBB116_8:
	add	r5, sp, #56
	mov	r1, #0
	mov	r2, #65
	ldr	r6, [r11, #40]
	mov	r0, r5
	ldr	r4, [r11, #44]
	mov	r7, #0
	bl	memset
	mov	r0, #36
	ldr	r8, [sp, #188]
	str	r0, [sp, #24]
	mov	r1, r5
	ldr	r0, .LCPI116_2
	mov	r2, #65
	str	r0, [sp, #20]
	mov	r0, #64
	str	r0, [sp, #16]
	mov	r0, #1
	str	r0, [sp, #12]
	mov	r0, #10
	str	r0, [sp, #8]
	ldr	r0, [sp, #40]
	str	r0, [sp, #4]
	ldr	r0, [sp, #44]
	str	r0, [sp]
	add	r0, sp, #48
	str	r7, [sp, #52]
	str	r7, [sp, #48]
	str	r8, [sp, #32]
	str	r7, [sp, #28]
	bl	"strconv::write_bits"
	cmp	r6, #0
	beq	.LBB116_10
	ldr	r0, [sp, #52]
	mov	r1, r4
	ldr	r3, [sp, #48]
	mov	r2, #4
	str	r0, [sp]
	add	r0, sp, #128
	str	r7, [sp, #136]
	str	r7, [sp, #132]
	str	r7, [sp, #128]
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	str	r8, [sp, #20]
	mov	lr, pc
	mov	pc, r6
	ldr	r0, [r11, #84]
	ldr	r1, [sp, #128]
	add	r0, r0, r1
	str	r0, [r11, #84]
.LBB116_10:
	add	sp, sp, #148
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
	.p2align	2
.LCPI116_0:
	.long	3435973837
.LCPI116_1:
	.long	3435973836
.LCPI116_2:
	.long	".Lcsbs$POC-Example$0"
.Lfunc_end116:
	.size	"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2", .Lfunc_end116-"fmt::[fmt.odin]::fmt_named_buitlin_custom_formatters.write_padded_number-2"
	.fnend

	.p2align	2
	.type	"runtime::type_assertion_check2_with_context.handle_error-0.do_msg-0",%function
	.code	32
"runtime::type_assertion_check2_with_context.handle_error-0.do_msg-0":
	.fnstart
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#20
	sub	sp, sp, #20
	mov	r6, r0
	ldr	r0, [r0]
	cmp	r2, r0
	ble	.LBB117_10
	mov	r4, r2
	cmn	r0, #1
	ble	.LBB117_16
	mov	r5, r1
	ldr	r1, [sp, #76]
	str	r1, [sp, #12]
	ldr	r1, [sp, #72]
	str	r1, [sp, #16]
	sub	r1, r4, r0
	ldr	r8, [sp, #68]
	cmp	r1, #28
	ldr	r9, [sp, #64]
	mov	r7, r1
	ldr	r10, [sp, #60]
	movge	r7, #28
	ldr	r11, [sp, #56]
	cmp	r1, #1
	blt	.LBB117_4
	ldr	r1, .LCPI117_0
	add	r0, r0, r5
	mov	r2, r7
	bl	memcpy
	ldr	r0, [r6]
.LBB117_4:
	add	r0, r0, r7
	str	r0, [r6]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r4
	str	r11, [sp]
	str	r10, [sp, #4]
	bl	"runtime::write_typeid"
	tst	r0, #1
	beq	.LBB117_10
	ldr	r0, [r6]
	cmp	r4, r0
	ble	.LBB117_10
	cmn	r0, #1
	ble	.LBB117_16
	sub	r1, r4, r0
	cmp	r1, #4
	mov	r7, r1
	movge	r7, #4
	cmp	r1, #1
	blt	.LBB117_9
	ldr	r1, .LCPI117_1
	add	r0, r0, r5
	mov	r2, r7
	bl	memcpy
	ldr	r0, [r6]
.LBB117_9:
	add	r0, r0, r7
	str	r0, [r6]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r4
	str	r9, [sp]
	str	r8, [sp, #4]
	bl	"runtime::write_typeid"
	tst	r0, #1
	ldrne	r0, [sp, #16]
	ldrne	r1, [sp, #12]
	eorne	r0, r0, r11
	eorne	r1, r1, r10
	orrsne	r0, r0, r1
	bne	.LBB117_11
.LBB117_10:
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	mov	pc, lr
.LBB117_11:
	ldr	r0, [r6]
	cmp	r4, r0
	ble	.LBB117_10
	cmn	r0, #1
	ble	.LBB117_16
	sub	r1, r4, r0
	cmp	r1, #15
	mov	r7, r1
	movge	r7, #15
	cmp	r1, #1
	blt	.LBB117_15
	ldr	r1, .LCPI117_2
	add	r0, r0, r5
	mov	r2, r7
	bl	memcpy
	ldr	r0, [r6]
.LBB117_15:
	add	r0, r0, r7
	str	r0, [r6]
	ldr	r0, [sp, #12]
	mov	r1, r5
	str	r0, [sp, #60]
	mov	r2, r4
	ldr	r0, [sp, #16]
	str	r0, [sp, #56]
	mov	r0, r6
	add	sp, sp, #20
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	"runtime::write_typeid"
.LBB117_16:
	mov	r2, #13
	stm	sp, {r0, r4}
	orr	r2, r2, #512
	ldr	r0, .LCPI117_3
	mov	r1, #49
	mov	r3, #17
	str	r4, [sp, #8]
	bl	"runtime::slice_handle_error"
	.p2align	2
.LCPI117_0:
	.long	".Lcsbs$POC-Example$1ab"
.LCPI117_1:
	.long	".Lcsbs$POC-Example$1a3"
.LCPI117_2:
	.long	".Lcsbs$POC-Example$1a4"
.LCPI117_3:
	.long	".Lcsbs$POC-Example$113"
.Lfunc_end117:
	.size	"runtime::type_assertion_check2_with_context.handle_error-0.do_msg-0", .Lfunc_end117-"runtime::type_assertion_check2_with_context.handle_error-0.do_msg-0"
	.cantunwind
	.fnend

	.type	.L__$type_info_data,%object
	.section	.odinti,"a",%progbits
	.p2align	4, 0x0
.L__$type_info_data:
	.long	".L__$ti-0"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-4"
	.long	".L__$ti-5"
	.long	".L__$ti-6"
	.long	0
	.long	".L__$ti-8"
	.long	".L__$ti-9"
	.long	".L__$ti-10"
	.long	0
	.long	".L__$ti-12"
	.long	".L__$ti-13"
	.long	".L__$ti-14"
	.long	0
	.long	".L__$ti-16"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-20"
	.long	".L__$ti-21"
	.long	".L__$ti-22"
	.long	".L__$ti-23"
	.long	".L__$ti-24"
	.long	".L__$ti-25"
	.long	".L__$ti-26"
	.long	0
	.long	0
	.long	".L__$ti-29"
	.long	0
	.long	0
	.long	".L__$ti-32"
	.long	".L__$ti-33"
	.long	".L__$ti-34"
	.long	".L__$ti-35"
	.long	".L__$ti-36"
	.long	".L__$ti-37"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-42"
	.long	0
	.long	0
	.long	".L__$ti-45"
	.long	".L__$ti-46"
	.long	".L__$ti-47"
	.long	".L__$ti-48"
	.long	".L__$ti-49"
	.long	".L__$ti-50"
	.long	".L__$ti-51"
	.long	0
	.long	".L__$ti-53"
	.long	".L__$ti-54"
	.long	0
	.long	0
	.long	".L__$ti-57"
	.long	".L__$ti-58"
	.long	".L__$ti-59"
	.long	0
	.long	0
	.long	".L__$ti-62"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-66"
	.long	".L__$ti-67"
	.long	0
	.long	0
	.long	".L__$ti-70"
	.long	0
	.long	0
	.long	".L__$ti-73"
	.long	0
	.long	0
	.long	".L__$ti-76"
	.long	".L__$ti-77"
	.long	0
	.long	0
	.long	".L__$ti-80"
	.long	".L__$ti-81"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-85"
	.long	".L__$ti-86"
	.long	".L__$ti-87"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-92"
	.long	".L__$ti-93"
	.long	".L__$ti-94"
	.long	".L__$ti-95"
	.long	".L__$ti-96"
	.long	0
	.long	".L__$ti-98"
	.long	".L__$ti-99"
	.long	".L__$ti-100"
	.long	0
	.long	".L__$ti-102"
	.long	".L__$ti-103"
	.long	0
	.long	".L__$ti-105"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-110"
	.long	0
	.long	".L__$ti-112"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-116"
	.long	0
	.long	".L__$ti-118"
	.long	".L__$ti-119"
	.long	".L__$ti-120"
	.long	".L__$ti-121"
	.long	0
	.long	".L__$ti-123"
	.long	".L__$ti-124"
	.long	".L__$ti-125"
	.long	".L__$ti-126"
	.long	".L__$ti-127"
	.long	".L__$ti-128"
	.long	".L__$ti-129"
	.long	".L__$ti-130"
	.long	0
	.long	0
	.long	".L__$ti-133"
	.long	".L__$ti-134"
	.long	0
	.long	".L__$ti-136"
	.long	".L__$ti-137"
	.long	".L__$ti-138"
	.long	".L__$ti-139"
	.long	".L__$ti-140"
	.long	".L__$ti-141"
	.long	".L__$ti-142"
	.long	".L__$ti-143"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-148"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-154"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-172"
	.long	0
	.long	0
	.long	".L__$ti-175"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-180"
	.long	0
	.long	".L__$ti-182"
	.long	".L__$ti-183"
	.long	0
	.long	".L__$ti-185"
	.long	".L__$ti-186"
	.long	".L__$ti-187"
	.long	".L__$ti-188"
	.long	".L__$ti-189"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-193"
	.long	0
	.long	0
	.long	".L__$ti-196"
	.long	".L__$ti-197"
	.long	0
	.long	0
	.long	".L__$ti-200"
	.long	".L__$ti-201"
	.long	0
	.long	".L__$ti-203"
	.long	".L__$ti-204"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-211"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-215"
	.long	".L__$ti-216"
	.long	".L__$ti-217"
	.long	".L__$ti-218"
	.long	".L__$ti-219"
	.long	".L__$ti-220"
	.long	".L__$ti-221"
	.long	".L__$ti-222"
	.long	".L__$ti-223"
	.long	".L__$ti-224"
	.long	".L__$ti-225"
	.long	".L__$ti-226"
	.long	0
	.long	".L__$ti-228"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-232"
	.long	".L__$ti-233"
	.long	".L__$ti-234"
	.long	".L__$ti-235"
	.long	".L__$ti-236"
	.long	".L__$ti-237"
	.long	".L__$ti-238"
	.long	".L__$ti-239"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-246"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-250"
	.long	".L__$ti-251"
	.long	".L__$ti-252"
	.long	".L__$ti-253"
	.long	".L__$ti-254"
	.long	0
	.long	".L__$ti-256"
	.long	".L__$ti-257"
	.long	".L__$ti-258"
	.long	".L__$ti-259"
	.long	".L__$ti-260"
	.long	0
	.long	".L__$ti-262"
	.long	".L__$ti-263"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-267"
	.long	0
	.long	0
	.long	".L__$ti-270"
	.long	".L__$ti-271"
	.long	0
	.long	".L__$ti-273"
	.long	".L__$ti-274"
	.long	".L__$ti-275"
	.long	".L__$ti-276"
	.long	0
	.long	".L__$ti-278"
	.long	".L__$ti-279"
	.long	".L__$ti-280"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-285"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-290"
	.long	".L__$ti-291"
	.long	0
	.long	0
	.long	".L__$ti-294"
	.long	0
	.long	0
	.long	".L__$ti-297"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-302"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-307"
	.long	".L__$ti-308"
	.long	0
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-313"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-317"
	.long	".L__$ti-318"
	.long	0
	.long	0
	.long	0
	.long	".L__$ti-322"
	.long	".L__$ti-323"
	.long	".L__$ti-324"
	.long	".L__$ti-325"
	.long	0
	.long	0
	.long	0
	.size	.L__$type_info_data, 1316

	.type	.L__$type_info_types_data,%object
	.p2align	4, 0x0
.L__$type_info_types_data:
	.long	".L__$ti-4"
	.long	".L__$ti-290"
	.long	".L__$ti-290"
	.long	".L__$ti-279"
	.long	".L__$ti-73"
	.long	".L__$ti-73"
	.long	".L__$ti-279"
	.long	".L__$ti-148"
	.long	".L__$ti-308"
	.long	".L__$ti-4"
	.long	".L__$ti-4"
	.long	".L__$ti-217"
	.long	".L__$ti-217"
	.long	".L__$ti-318"
	.long	".L__$ti-318"
	.long	".L__$ti-148"
	.long	".L__$ti-4"
	.long	".L__$ti-217"
	.long	".L__$ti-217"
	.long	".L__$ti-217"
	.long	".L__$ti-217"
	.long	".L__$ti-50"
	.long	".L__$ti-4"
	.long	".L__$ti-297"
	.long	".L__$ti-188"
	.long	".L__$ti-36"
	.long	".L__$ti-36"
	.long	".L__$ti-297"
	.long	".L__$ti-217"
	.long	".L__$ti-217"
	.long	".L__$ti-217"
	.long	".L__$ti-222"
	.long	".L__$ti-133"
	.long	".L__$ti-118"
	.long	".L__$ti-148"
	.long	".L__$ti-308"
	.long	".L__$ti-228"
	.long	".L__$ti-47"
	.long	".L__$ti-140"
	.long	".L__$ti-16"
	.long	".L__$ti-123"
	.long	".L__$ti-26"
	.long	".L__$ti-94"
	.long	".L__$ti-129"
	.long	".L__$ti-276"
	.long	".L__$ti-77"
	.long	".L__$ti-22"
	.long	".L__$ti-57"
	.long	".L__$ti-239"
	.long	".L__$ti-270"
	.long	".L__$ti-110"
	.long	".L__$ti-260"
	.long	".L__$ti-262"
	.long	".L__$ti-42"
	.long	".L__$ti-21"
	.long	".L__$ti-119"
	.long	".L__$ti-46"
	.long	".L__$ti-313"
	.long	".L__$ti-273"
	.long	".L__$ti-232"
	.long	".L__$ti-172"
	.long	".L__$ti-76"
	.long	".L__$ti-54"
	.long	".L__$ti-67"
	.long	".L__$ti-67"
	.long	".L__$ti-67"
	.long	".L__$ti-67"
	.long	".L__$ti-148"
	.long	".L__$ti-196"
	.long	".L__$ti-217"
	.long	".L__$ti-4"
	.long	".L__$ti-217"
	.long	".L__$ti-237"
	.long	".L__$ti-237"
	.long	".L__$ti-250"
	.long	".L__$ti-193"
	.long	".L__$ti-290"
	.long	".L__$ti-290"
	.long	".L__$ti-279"
	.long	".L__$ti-4"
	.long	".L__$ti-279"
	.long	".L__$ti-33"
	.long	".L__$ti-4"
	.long	".L__$ti-217"
	.long	".L__$ti-217"
	.long	".L__$ti-67"
	.long	".L__$ti-87"
	.long	".L__$ti-188"
	.long	".L__$ti-297"
	.long	".L__$ti-36"
	.long	".L__$ti-186"
	.long	".L__$ti-297"
	.long	".L__$ti-73"
	.long	".L__$ti-256"
	.long	".L__$ti-263"
	.long	".L__$ti-73"
	.long	".L__$ti-4"
	.long	".L__$ti-257"
	.long	".L__$ti-217"
	.long	".L__$ti-4"
	.long	".L__$ti-4"
	.long	".L__$ti-148"
	.long	".L__$ti-87"
	.long	".L__$ti-87"
	.long	".L__$ti-4"
	.long	".L__$ti-4"
	.long	".L__$ti-136"
	.long	".L__$ti-290"
	.long	".L__$ti-67"
	.long	".L__$ti-4"
	.long	".L__$ti-317"
	.long	".L__$ti-128"
	.long	".L__$ti-4"
	.long	".L__$ti-4"
	.long	".L__$ti-148"
	.long	".L__$ti-86"
	.long	".L__$ti-66"
	.long	".L__$ti-67"
	.long	".L__$ti-4"
	.long	".L__$ti-257"
	.long	".L__$ti-148"
	.long	".L__$ti-148"
	.long	".L__$ti-148"
	.long	".L__$ti-66"
	.long	".L__$ti-317"
	.size	.L__$type_info_types_data, 500

	.type	.L__$type_info_names_data,%object
	.p2align	4, 0x0
.L__$type_info_names_data:
	.long	".Lcsbs$POC-Example$45"
	.long	4
	.long	".Lcsbs$POC-Example$4b"
	.long	3
	.long	".Lcsbs$POC-Example$4c"
	.long	3
	.long	".Lcsbs$POC-Example$51"
	.long	9
	.long	".Lcsbs$POC-Example$52"
	.long	4
	.long	".Lcsbs$POC-Example$53"
	.long	6
	.long	".Lcsbs$POC-Example$54"
	.long	9
	.long	".Lcsbs$POC-Example$59"
	.long	6
	.long	".Lcsbs$POC-Example$5a"
	.long	10
	.long	".Lcsbs$POC-Example$45"
	.long	4
	.long	".Lcsbs$POC-Example$5d"
	.long	5
	.long	".Lcsbs$POC-Example$5e"
	.long	9
	.long	".Lcsbs$POC-Example$5f"
	.long	5
	.long	".Lcsbs$POC-Example$60"
	.long	9
	.long	".Lcsbs$POC-Example$61"
	.long	9
	.long	".Lcsbs$POC-Example$62"
	.long	9
	.long	".Lcsbs$POC-Example$45"
	.long	4
	.long	".Lcsbs$POC-Example$5e"
	.long	9
	.long	".Lcsbs$POC-Example$63"
	.long	11
	.long	".Lcsbs$POC-Example$64"
	.long	9
	.long	".Lcsbs$POC-Example$65"
	.long	12
	.long	".Lcsbs$POC-Example$66"
	.long	6
	.long	".Lcsbs$POC-Example$69"
	.long	12
	.long	".Lcsbs$POC-Example$6a"
	.long	5
	.long	".Lcsbs$POC-Example$6c"
	.long	5
	.long	".Lcsbs$POC-Example$6d"
	.long	9
	.long	".Lcsbs$POC-Example$6e"
	.long	11
	.long	".Lcsbs$POC-Example$6f"
	.long	4
	.long	".Lcsbs$POC-Example$70"
	.long	11
	.long	".Lcsbs$POC-Example$7a"
	.long	4
	.long	".Lcsbs$POC-Example$49"
	.long	5
	.long	".Lcsbs$POC-Example$7b"
	.long	5
	.long	".Lcsbs$POC-Example$7c"
	.long	2
	.long	".Lcsbs$POC-Example$7d"
	.long	7
	.zero	8
	.long	".Lcsbs$POC-Example$5a"
	.long	10
	.long	".Lcsbs$POC-Example$87"
	.long	12
	.long	".Lcsbs$POC-Example$88"
	.long	13
	.long	".Lcsbs$POC-Example$89"
	.long	12
	.long	".Lcsbs$POC-Example$8a"
	.long	17
	.long	".Lcsbs$POC-Example$8c"
	.long	10
	.long	".Lcsbs$POC-Example$8d"
	.long	8
	.long	".Lcsbs$POC-Example$8f"
	.long	1
	.long	".Lcsbs$POC-Example$45"
	.long	4
	.long	".Lcsbs$POC-Example$5e"
	.long	9
	.long	".Lcsbs$POC-Example$93"
	.long	2
	.long	".Lcsbs$POC-Example$94"
	.long	2
	.long	".Lcsbs$POC-Example$95"
	.long	10
	.long	".Lcsbs$POC-Example$96"
	.long	9
	.long	".Lcsbs$POC-Example$97"
	.long	1
	.long	".Lcsbs$POC-Example$97"
	.long	1
	.long	".Lcsbs$POC-Example$9b"
	.long	4
	.long	".Lcsbs$POC-Example$9c"
	.long	4
	.long	".Lcsbs$POC-Example$9d"
	.long	3
	.long	".Lcsbs$POC-Example$9e"
	.long	3
	.long	".Lcsbs$POC-Example$45"
	.long	4
	.long	".Lcsbs$POC-Example$5e"
	.long	9
	.long	".Lcsbs$POC-Example$5f"
	.long	5
	.zero	8
	.long	".Lcsbs$POC-Example$a1"
	.long	5
	.long	".Lcsbs$POC-Example$6c"
	.long	5
	.long	".Lcsbs$POC-Example$6a"
	.long	5
	.long	".Lcsbs$POC-Example$a6"
	.long	7
	.long	".Lcsbs$POC-Example$a7"
	.long	6
	.long	".Lcsbs$POC-Example$6f"
	.long	4
	.long	".Lcsbs$POC-Example$70"
	.long	11
	.long	".Lcsbs$POC-Example$7b"
	.long	5
	.long	".Lcsbs$POC-Example$a8"
	.long	8
	.long	".Lcsbs$POC-Example$a9"
	.long	7
	.long	".Lcsbs$POC-Example$aa"
	.long	13
	.long	".Lcsbs$POC-Example$ab"
	.long	5
	.long	".Lcsbs$POC-Example$45"
	.long	4
	.long	".Lcsbs$POC-Example$ac"
	.long	10
	.long	".Lcsbs$POC-Example$ad"
	.long	19
	.long	".Lcsbs$POC-Example$ae"
	.long	5
	.long	".Lcsbs$POC-Example$af"
	.long	5
	.long	".Lcsbs$POC-Example$b0"
	.long	3
	.long	".Lcsbs$POC-Example$b1"
	.long	5
	.long	".Lcsbs$POC-Example$b2"
	.long	8
	.long	".Lcsbs$POC-Example$b0"
	.long	3
	.long	".Lcsbs$POC-Example$b4"
	.long	4
	.long	".Lcsbs$POC-Example$9c"
	.long	4
	.long	".Lcsbs$POC-Example$6a"
	.long	5
	.long	".Lcsbs$POC-Example$b6"
	.long	6
	.long	".Lcsbs$POC-Example$bd"
	.long	6
	.long	".Lcsbs$POC-Example$be"
	.long	7
	.long	".Lcsbs$POC-Example$bf"
	.long	8
	.long	".Lcsbs$POC-Example$c0"
	.long	10
	.long	".Lcsbs$POC-Example$c6"
	.long	8
	.long	".Lcsbs$POC-Example$c7"
	.long	10
	.long	".Lcsbs$POC-Example$c8"
	.long	8
	.long	".Lcsbs$POC-Example$ab"
	.long	5
	.long	".Lcsbs$POC-Example$c9"
	.long	12
	.long	".Lcsbs$POC-Example$ca"
	.long	6
	.long	".Lcsbs$POC-Example$cb"
	.long	10
	.long	".Lcsbs$POC-Example$6c"
	.long	5
	.long	".Lcsbs$POC-Example$6a"
	.long	5
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.size	.L__$type_info_names_data, 1000

	.type	.L__$type_info_offsets_data,%object
	.p2align	4, 0x0
.L__$type_info_offsets_data:
	.long	0
	.long	0
	.long	8
	.long	12
	.long	16
	.long	0
	.long	1
	.long	0
	.long	4
	.long	8
	.long	12
	.long	16
	.long	24
	.long	32
	.long	0
	.long	4
	.long	8
	.long	12
	.long	16
	.long	20
	.long	0
	.long	4
	.long	8
	.long	12
	.long	16
	.long	20
	.long	24
	.long	0
	.long	4
	.long	8
	.long	16
	.long	24
	.long	0
	.long	0
	.long	4
	.long	8
	.long	12
	.long	0
	.long	1
	.long	0
	.long	4
	.long	0
	.long	4
	.long	8
	.long	12
	.long	0
	.long	8
	.long	12
	.long	20
	.long	0
	.long	4
	.long	8
	.long	0
	.long	0
	.long	4
	.long	8
	.long	12
	.long	16
	.long	20
	.long	24
	.long	25
	.long	28
	.long	32
	.long	36
	.long	0
	.long	4
	.long	8
	.long	16
	.long	24
	.long	0
	.long	4
	.long	8
	.long	0
	.long	4
	.long	12
	.long	0
	.long	4
	.long	8
	.long	9
	.long	0
	.long	8
	.long	12
	.long	16
	.long	20
	.long	21
	.long	22
	.long	0
	.long	8
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.size	.L__$type_info_offsets_data, 500

	.type	.L__$type_info_usings_data,%object
	.p2align	4, 0x0
.L__$type_info_usings_data:
	.zero	125
	.size	.L__$type_info_usings_data, 125

	.type	.L__$type_info_tags_data,%object
	.p2align	4, 0x0
.L__$type_info_tags_data:
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.long	".Lcsbs$POC-Example$6b"
	.long	19
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.size	.L__$type_info_tags_data, 1000

	.type	".Lcsbs$POC-Example$0",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$0":
	.asciz	"0123456789abcdefghijklmnopqrstuvwxyz"
	.size	".Lcsbs$POC-Example$0", 37

	.type	".Lcsbs$POC-Example$1",%object
".Lcsbs$POC-Example$1":
	.asciz	" b kib mib gib tib pib eib"
	.size	".Lcsbs$POC-Example$1", 27

	.type	".Lcsbs$POC-Example$2",%object
".Lcsbs$POC-Example$2":
	.asciz	" B KiB MiB GiB TiB PiB EiB"
	.size	".Lcsbs$POC-Example$2", 27

	.type	".Lcsbs$POC-Example$3",%object
".Lcsbs$POC-Example$3":
	.asciz	"0123456789abcdefx"
	.size	".Lcsbs$POC-Example$3", 18

	.type	".Lcsbs$POC-Example$4",%object
".Lcsbs$POC-Example$4":
	.asciz	"0123456789ABCDEFX"
	.size	".Lcsbs$POC-Example$4", 18

	.type	"utf8::accept_ranges",%object
"utf8::accept_ranges":
	.byte	128
	.byte	191
	.byte	160
	.byte	191
	.byte	128
	.byte	159
	.byte	144
	.byte	191
	.byte	128
	.byte	143
	.size	"utf8::accept_ranges", 10

	.type	"strconv::_f16_info",%object
	.p2align	2, 0x0
"strconv::_f16_info":
	.long	10
	.long	5
	.long	4294967281
	.size	"strconv::_f16_info", 12

	.type	"strconv::_f32_info",%object
	.p2align	2, 0x0
"strconv::_f32_info":
	.long	23
	.long	8
	.long	4294967169
	.size	"strconv::_f32_info", 12

	.type	"strconv::_f64_info",%object
	.p2align	2, 0x0
"strconv::_f64_info":
	.long	52
	.long	11
	.long	4294966273
	.size	"strconv::_f64_info", 12

	.type	".Lcsbs$POC-Example$6",%object
".Lcsbs$POC-Example$6":
	.asciz	"5"
	.size	".Lcsbs$POC-Example$6", 2

	.type	".Lcsbs$POC-Example$7",%object
".Lcsbs$POC-Example$7":
	.asciz	"25"
	.size	".Lcsbs$POC-Example$7", 3

	.type	".Lcsbs$POC-Example$8",%object
".Lcsbs$POC-Example$8":
	.asciz	"125"
	.size	".Lcsbs$POC-Example$8", 4

	.type	".Lcsbs$POC-Example$9",%object
".Lcsbs$POC-Example$9":
	.asciz	"625"
	.size	".Lcsbs$POC-Example$9", 4

	.type	".Lcsbs$POC-Example$a",%object
".Lcsbs$POC-Example$a":
	.asciz	"3125"
	.size	".Lcsbs$POC-Example$a", 5

	.type	".Lcsbs$POC-Example$b",%object
".Lcsbs$POC-Example$b":
	.asciz	"15625"
	.size	".Lcsbs$POC-Example$b", 6

	.type	".Lcsbs$POC-Example$c",%object
".Lcsbs$POC-Example$c":
	.asciz	"78125"
	.size	".Lcsbs$POC-Example$c", 6

	.type	".Lcsbs$POC-Example$d",%object
".Lcsbs$POC-Example$d":
	.asciz	"390625"
	.size	".Lcsbs$POC-Example$d", 7

	.type	".Lcsbs$POC-Example$e",%object
".Lcsbs$POC-Example$e":
	.asciz	"1953125"
	.size	".Lcsbs$POC-Example$e", 8

	.type	".Lcsbs$POC-Example$f",%object
".Lcsbs$POC-Example$f":
	.asciz	"9765625"
	.size	".Lcsbs$POC-Example$f", 8

	.type	".Lcsbs$POC-Example$10",%object
".Lcsbs$POC-Example$10":
	.asciz	"48828125"
	.size	".Lcsbs$POC-Example$10", 9

	.type	".Lcsbs$POC-Example$11",%object
".Lcsbs$POC-Example$11":
	.asciz	"244140625"
	.size	".Lcsbs$POC-Example$11", 10

	.type	".Lcsbs$POC-Example$12",%object
".Lcsbs$POC-Example$12":
	.asciz	"1220703125"
	.size	".Lcsbs$POC-Example$12", 11

	.type	".Lcsbs$POC-Example$13",%object
".Lcsbs$POC-Example$13":
	.asciz	"6103515625"
	.size	".Lcsbs$POC-Example$13", 11

	.type	".Lcsbs$POC-Example$14",%object
".Lcsbs$POC-Example$14":
	.asciz	"30517578125"
	.size	".Lcsbs$POC-Example$14", 12

	.type	".Lcsbs$POC-Example$15",%object
".Lcsbs$POC-Example$15":
	.asciz	"152587890625"
	.size	".Lcsbs$POC-Example$15", 13

	.type	".Lcsbs$POC-Example$16",%object
".Lcsbs$POC-Example$16":
	.asciz	"762939453125"
	.size	".Lcsbs$POC-Example$16", 13

	.type	".Lcsbs$POC-Example$17",%object
".Lcsbs$POC-Example$17":
	.asciz	"3814697265625"
	.size	".Lcsbs$POC-Example$17", 14

	.type	".Lcsbs$POC-Example$18",%object
".Lcsbs$POC-Example$18":
	.asciz	"19073486328125"
	.size	".Lcsbs$POC-Example$18", 15

	.type	".Lcsbs$POC-Example$19",%object
".Lcsbs$POC-Example$19":
	.asciz	"95367431640625"
	.size	".Lcsbs$POC-Example$19", 15

	.type	".Lcsbs$POC-Example$1a",%object
".Lcsbs$POC-Example$1a":
	.asciz	"476837158203125"
	.size	".Lcsbs$POC-Example$1a", 16

	.type	".Lcsbs$POC-Example$1b",%object
".Lcsbs$POC-Example$1b":
	.asciz	"2384185791015625"
	.size	".Lcsbs$POC-Example$1b", 17

	.type	".Lcsbs$POC-Example$1c",%object
".Lcsbs$POC-Example$1c":
	.asciz	"11920928955078125"
	.size	".Lcsbs$POC-Example$1c", 18

	.type	".Lcsbs$POC-Example$1d",%object
".Lcsbs$POC-Example$1d":
	.asciz	"59604644775390625"
	.size	".Lcsbs$POC-Example$1d", 18

	.type	".Lcsbs$POC-Example$1e",%object
".Lcsbs$POC-Example$1e":
	.asciz	"298023223876953125"
	.size	".Lcsbs$POC-Example$1e", 19

	.type	".Lcsbs$POC-Example$1f",%object
".Lcsbs$POC-Example$1f":
	.asciz	"1490116119384765625"
	.size	".Lcsbs$POC-Example$1f", 20

	.type	".Lcsbs$POC-Example$20",%object
".Lcsbs$POC-Example$20":
	.asciz	"7450580596923828125"
	.size	".Lcsbs$POC-Example$20", 20

	.type	".Lcsbs$POC-Example$21",%object
".Lcsbs$POC-Example$21":
	.asciz	"37252902984619140625"
	.size	".Lcsbs$POC-Example$21", 21

	.type	".Lcsbs$POC-Example$22",%object
".Lcsbs$POC-Example$22":
	.asciz	"186264514923095703125"
	.size	".Lcsbs$POC-Example$22", 22

	.type	".Lcsbs$POC-Example$23",%object
".Lcsbs$POC-Example$23":
	.asciz	"931322574615478515625"
	.size	".Lcsbs$POC-Example$23", 22

	.type	".Lcsbs$POC-Example$24",%object
".Lcsbs$POC-Example$24":
	.asciz	"4656612873077392578125"
	.size	".Lcsbs$POC-Example$24", 23

	.type	".Lcsbs$POC-Example$25",%object
".Lcsbs$POC-Example$25":
	.asciz	"23283064365386962890625"
	.size	".Lcsbs$POC-Example$25", 24

	.type	".Lcsbs$POC-Example$26",%object
".Lcsbs$POC-Example$26":
	.asciz	"116415321826934814453125"
	.size	".Lcsbs$POC-Example$26", 25

	.type	".Lcsbs$POC-Example$27",%object
".Lcsbs$POC-Example$27":
	.asciz	"582076609134674072265625"
	.size	".Lcsbs$POC-Example$27", 25

	.type	".Lcsbs$POC-Example$28",%object
".Lcsbs$POC-Example$28":
	.asciz	"2910383045673370361328125"
	.size	".Lcsbs$POC-Example$28", 26

	.type	".Lcsbs$POC-Example$29",%object
".Lcsbs$POC-Example$29":
	.asciz	"14551915228366851806640625"
	.size	".Lcsbs$POC-Example$29", 27

	.type	".Lcsbs$POC-Example$2a",%object
".Lcsbs$POC-Example$2a":
	.asciz	"72759576141834259033203125"
	.size	".Lcsbs$POC-Example$2a", 27

	.type	".Lcsbs$POC-Example$2b",%object
".Lcsbs$POC-Example$2b":
	.asciz	"363797880709171295166015625"
	.size	".Lcsbs$POC-Example$2b", 28

	.type	".Lcsbs$POC-Example$2c",%object
".Lcsbs$POC-Example$2c":
	.asciz	"1818989403545856475830078125"
	.size	".Lcsbs$POC-Example$2c", 29

	.type	".Lcsbs$POC-Example$2d",%object
".Lcsbs$POC-Example$2d":
	.asciz	"9094947017729282379150390625"
	.size	".Lcsbs$POC-Example$2d", 29

	.type	".Lcsbs$POC-Example$2e",%object
".Lcsbs$POC-Example$2e":
	.asciz	"45474735088646411895751953125"
	.size	".Lcsbs$POC-Example$2e", 30

	.type	".Lcsbs$POC-Example$2f",%object
".Lcsbs$POC-Example$2f":
	.asciz	"227373675443232059478759765625"
	.size	".Lcsbs$POC-Example$2f", 31

	.type	".Lcsbs$POC-Example$30",%object
".Lcsbs$POC-Example$30":
	.asciz	"1136868377216160297393798828125"
	.size	".Lcsbs$POC-Example$30", 32

	.type	".Lcsbs$POC-Example$31",%object
".Lcsbs$POC-Example$31":
	.asciz	"5684341886080801486968994140625"
	.size	".Lcsbs$POC-Example$31", 32

	.type	".Lcsbs$POC-Example$32",%object
".Lcsbs$POC-Example$32":
	.asciz	"28421709430404007434844970703125"
	.size	".Lcsbs$POC-Example$32", 33

	.type	".Lcsbs$POC-Example$33",%object
".Lcsbs$POC-Example$33":
	.asciz	"142108547152020037174224853515625"
	.size	".Lcsbs$POC-Example$33", 34

	.type	".Lcsbs$POC-Example$34",%object
".Lcsbs$POC-Example$34":
	.asciz	"710542735760100185871124267578125"
	.size	".Lcsbs$POC-Example$34", 34

	.type	".Lcsbs$POC-Example$35",%object
".Lcsbs$POC-Example$35":
	.asciz	"3552713678800500929355621337890625"
	.size	".Lcsbs$POC-Example$35", 35

	.type	".Lcsbs$POC-Example$36",%object
".Lcsbs$POC-Example$36":
	.asciz	"17763568394002504646778106689453125"
	.size	".Lcsbs$POC-Example$36", 36

	.type	".Lcsbs$POC-Example$37",%object
".Lcsbs$POC-Example$37":
	.asciz	"88817841970012523233890533447265625"
	.size	".Lcsbs$POC-Example$37", 36

	.type	".Lcsbs$POC-Example$38",%object
".Lcsbs$POC-Example$38":
	.asciz	"444089209850062616169452667236328125"
	.size	".Lcsbs$POC-Example$38", 37

	.type	".Lcsbs$POC-Example$39",%object
".Lcsbs$POC-Example$39":
	.asciz	"2220446049250313080847263336181640625"
	.size	".Lcsbs$POC-Example$39", 38

	.type	".Lcsbs$POC-Example$3a",%object
".Lcsbs$POC-Example$3a":
	.asciz	"11102230246251565404236316680908203125"
	.size	".Lcsbs$POC-Example$3a", 39

	.type	".Lcsbs$POC-Example$3b",%object
".Lcsbs$POC-Example$3b":
	.asciz	"55511151231257827021181583404541015625"
	.size	".Lcsbs$POC-Example$3b", 39

	.type	".Lcsbs$POC-Example$3c",%object
".Lcsbs$POC-Example$3c":
	.asciz	"277555756156289135105907917022705078125"
	.size	".Lcsbs$POC-Example$3c", 40

	.type	".Lcsbs$POC-Example$3d",%object
".Lcsbs$POC-Example$3d":
	.asciz	"1387778780781445675529539585113525390625"
	.size	".Lcsbs$POC-Example$3d", 41

	.type	".Lcsbs$POC-Example$3e",%object
".Lcsbs$POC-Example$3e":
	.asciz	"6938893903907228377647697925567626953125"
	.size	".Lcsbs$POC-Example$3e", 41

	.type	".Lcsbs$POC-Example$3f",%object
".Lcsbs$POC-Example$3f":
	.asciz	"34694469519536141888238489627838134765625"
	.size	".Lcsbs$POC-Example$3f", 42

	.type	".Lcsbs$POC-Example$40",%object
".Lcsbs$POC-Example$40":
	.asciz	"173472347597680709441192448139190673828125"
	.size	".Lcsbs$POC-Example$40", 43

	.type	".Lcsbs$POC-Example$41",%object
".Lcsbs$POC-Example$41":
	.asciz	"867361737988403547205962240695953369140625"
	.size	".Lcsbs$POC-Example$41", 43

	.type	"strconv_decimal::[decimal.odin]::_shift_left_offsets",%object
	.p2align	2, 0x0
"strconv_decimal::[decimal.odin]::_shift_left_offsets":
	.zero	12
	.long	1
	.long	".Lcsbs$POC-Example$6"
	.long	1
	.long	1
	.long	".Lcsbs$POC-Example$7"
	.long	2
	.long	1
	.long	".Lcsbs$POC-Example$8"
	.long	3
	.long	2
	.long	".Lcsbs$POC-Example$9"
	.long	3
	.long	2
	.long	".Lcsbs$POC-Example$a"
	.long	4
	.long	2
	.long	".Lcsbs$POC-Example$b"
	.long	5
	.long	3
	.long	".Lcsbs$POC-Example$c"
	.long	5
	.long	3
	.long	".Lcsbs$POC-Example$d"
	.long	6
	.long	3
	.long	".Lcsbs$POC-Example$e"
	.long	7
	.long	4
	.long	".Lcsbs$POC-Example$f"
	.long	7
	.long	4
	.long	".Lcsbs$POC-Example$10"
	.long	8
	.long	4
	.long	".Lcsbs$POC-Example$11"
	.long	9
	.long	4
	.long	".Lcsbs$POC-Example$12"
	.long	10
	.long	5
	.long	".Lcsbs$POC-Example$13"
	.long	10
	.long	5
	.long	".Lcsbs$POC-Example$14"
	.long	11
	.long	5
	.long	".Lcsbs$POC-Example$15"
	.long	12
	.long	6
	.long	".Lcsbs$POC-Example$16"
	.long	12
	.long	6
	.long	".Lcsbs$POC-Example$17"
	.long	13
	.long	6
	.long	".Lcsbs$POC-Example$18"
	.long	14
	.long	7
	.long	".Lcsbs$POC-Example$19"
	.long	14
	.long	7
	.long	".Lcsbs$POC-Example$1a"
	.long	15
	.long	7
	.long	".Lcsbs$POC-Example$1b"
	.long	16
	.long	7
	.long	".Lcsbs$POC-Example$1c"
	.long	17
	.long	8
	.long	".Lcsbs$POC-Example$1d"
	.long	17
	.long	8
	.long	".Lcsbs$POC-Example$1e"
	.long	18
	.long	8
	.long	".Lcsbs$POC-Example$1f"
	.long	19
	.long	9
	.long	".Lcsbs$POC-Example$20"
	.long	19
	.long	9
	.long	".Lcsbs$POC-Example$21"
	.long	20
	.long	9
	.long	".Lcsbs$POC-Example$22"
	.long	21
	.long	10
	.long	".Lcsbs$POC-Example$23"
	.long	21
	.long	10
	.long	".Lcsbs$POC-Example$24"
	.long	22
	.long	10
	.long	".Lcsbs$POC-Example$25"
	.long	23
	.long	10
	.long	".Lcsbs$POC-Example$26"
	.long	24
	.long	11
	.long	".Lcsbs$POC-Example$27"
	.long	24
	.long	11
	.long	".Lcsbs$POC-Example$28"
	.long	25
	.long	11
	.long	".Lcsbs$POC-Example$29"
	.long	26
	.long	12
	.long	".Lcsbs$POC-Example$2a"
	.long	26
	.long	12
	.long	".Lcsbs$POC-Example$2b"
	.long	27
	.long	12
	.long	".Lcsbs$POC-Example$2c"
	.long	28
	.long	13
	.long	".Lcsbs$POC-Example$2d"
	.long	28
	.long	13
	.long	".Lcsbs$POC-Example$2e"
	.long	29
	.long	13
	.long	".Lcsbs$POC-Example$2f"
	.long	30
	.long	13
	.long	".Lcsbs$POC-Example$30"
	.long	31
	.long	14
	.long	".Lcsbs$POC-Example$31"
	.long	31
	.long	14
	.long	".Lcsbs$POC-Example$32"
	.long	32
	.long	14
	.long	".Lcsbs$POC-Example$33"
	.long	33
	.long	15
	.long	".Lcsbs$POC-Example$34"
	.long	33
	.long	15
	.long	".Lcsbs$POC-Example$35"
	.long	34
	.long	15
	.long	".Lcsbs$POC-Example$36"
	.long	35
	.long	16
	.long	".Lcsbs$POC-Example$37"
	.long	35
	.long	16
	.long	".Lcsbs$POC-Example$38"
	.long	36
	.long	16
	.long	".Lcsbs$POC-Example$39"
	.long	37
	.long	16
	.long	".Lcsbs$POC-Example$3a"
	.long	38
	.long	17
	.long	".Lcsbs$POC-Example$3b"
	.long	38
	.long	17
	.long	".Lcsbs$POC-Example$3c"
	.long	39
	.long	17
	.long	".Lcsbs$POC-Example$3d"
	.long	40
	.long	18
	.long	".Lcsbs$POC-Example$3e"
	.long	40
	.long	18
	.long	".Lcsbs$POC-Example$3f"
	.long	41
	.long	18
	.long	".Lcsbs$POC-Example$40"
	.long	42
	.long	19
	.long	".Lcsbs$POC-Example$41"
	.long	42
	.size	"strconv_decimal::[decimal.odin]::_shift_left_offsets", 732

	.type	"time::days_before",%object
	.p2align	2, 0x0
"time::days_before":
	.long	0
	.long	31
	.long	59
	.long	90
	.long	120
	.long	151
	.long	181
	.long	212
	.long	243
	.long	273
	.long	304
	.long	334
	.long	365
	.size	"time::days_before", 52

	.type	".L__$ti-0",%object
	.section	.odinti,"a",%progbits
	.p2align	4, 0x0
".L__$ti-0":
	.zero	72
	.size	".L__$ti-0", 72

	.type	".L__$ti-4",%object
	.p2align	4, 0x0
".L__$ti-4":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1385839624
	.long	27237293
	.long	".L__$ti-204"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-4", 72

	.type	".L__$ti-5",%object
	.p2align	4, 0x0
".L__$ti-5":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	997211409
	.long	1380584457
	.long	".Lcsbs$POC-Example$44"
	.long	21
	.long	".L__$ti-9"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[3402]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-5", 72

	.type	".L__$ti-6",%object
	.p2align	4, 0x0
".L__$ti-6":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3402307176
	.long	3103492046
	.long	.L__$type_info_types_data
	.long	.L__$type_info_names_data
	.long	.L__$type_info_offsets_data
	.long	.L__$type_info_usings_data
	.long	.L__$type_info_tags_data
	.long	1
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-6", 72

	.type	".L__$ti-8",%object
	.p2align	4, 0x0
".L__$ti-8":
	.long	16
	.long	8
	.long	3
	.long	0
	.long	3175783653
	.long	2838995518
	.zero	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-8", 72

	.type	".L__$ti-9",%object
	.p2align	4, 0x0
".L__$ti-9":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	2761644047
	.long	3999723329
	.long	".L__$ti-216"
	.long	".L$enum_names-9"
	.long	5
	.long	".L$enum_values-9"
	.long	5
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-9", 72

	.type	".L__$ti-10",%object
	.p2align	4, 0x0
".L__$ti-10":
	.long	8
	.long	4
	.long	0
	.long	0
	.long	553132111
	.long	489804720
	.long	.L__$type_info_types_data+4
	.long	2
	.long	.L__$type_info_names_data+8
	.long	2
	.zero	24
	.long	18
	.long	0
	.size	".L__$ti-10", 72

	.type	".L__$ti-12",%object
	.p2align	4, 0x0
".L__$ti-12":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	2267398412
	.long	216749986
	.byte	0
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-12", 72

	.type	".L__$ti-13",%object
	.p2align	4, 0x0
".L__$ti-13":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	70271381
	.long	645795731
	.byte	1
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-13", 72

	.type	".L__$ti-14",%object
	.p2align	4, 0x0
".L__$ti-14":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1340100945
	.long	936009341
	.byte	1
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-14", 72

	.type	".L__$ti-16",%object
	.p2align	4, 0x0
".L__$ti-16":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	2772796360
	.long	550557435
	.long	".Lcsbs$POC-Example$4d"
	.long	15
	.long	".L__$ti-99"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2077]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-16", 72

	.type	".L__$ti-20",%object
	.p2align	4, 0x0
".L__$ti-20":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	629491871
	.long	2870446281
	.long	".L__$ti-216"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-20", 72

	.type	".L__$ti-21",%object
	.p2align	4, 0x0
".L__$ti-21":
	.long	40
	.long	4
	.long	3
	.long	0
	.long	3832283905
	.long	1335136078
	.long	".Lcsbs$POC-Example$4e"
	.long	16
	.long	".L__$ti-215"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[3538]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-21", 72

	.type	".L__$ti-22",%object
	.p2align	4, 0x0
".L__$ti-22":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2590011077
	.long	872350
	.long	".Lcsbs$POC-Example$4f"
	.long	17
	.long	".L__$ti-6"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2411]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-22", 72

	.type	".L__$ti-23",%object
	.p2align	4, 0x0
".L__$ti-23":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	3742316547
	.long	2054014763
	.long	".L__$ti-217"
	.long	".L__$ti-236"
	.byte	0
	.zero	7
	.long	0
	.long	0
	.long	63
	.long	0
	.zero	8
	.long	23
	.long	0
	.size	".L__$ti-23", 72

	.type	".L__$ti-24",%object
	.p2align	4, 0x0
".L__$ti-24":
	.long	2
	.long	2
	.long	1
	.long	0
	.long	834436547
	.long	1575128057
	.byte	2
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-24", 72

	.type	".L__$ti-25",%object
	.p2align	4, 0x0
".L__$ti-25":
	.long	16
	.long	8
	.long	0
	.long	0
	.long	2309362072
	.long	2506894805
	.zero	24
	.zero	16
	.long	9
	.long	0
	.size	".L__$ti-25", 72

	.type	".L__$ti-26",%object
	.p2align	4, 0x0
".L__$ti-26":
	.long	0
	.long	1
	.long	3
	.long	0
	.long	2102265618
	.long	3794247690
	.long	".Lcsbs$POC-Example$50"
	.long	20
	.long	".L__$ti-85"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2178]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-26", 72

	.type	".L__$ti-29",%object
	.p2align	4, 0x0
".L__$ti-29":
	.long	24
	.long	4
	.long	1
	.long	0
	.long	868551000
	.long	3681636523
	.long	.L__$type_info_types_data+12
	.long	.L__$type_info_names_data+24
	.long	.L__$type_info_offsets_data+4
	.long	.L__$type_info_usings_data+1
	.long	.L__$type_info_tags_data+8
	.long	4
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	"__$equal$$struct{file_path:string,line:i32,column:i32,procedure:string}"
	.long	19
	.long	0
	.size	".L__$ti-29", 72

	.type	".L__$ti-32",%object
	.p2align	4, 0x0
".L__$ti-32":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	4029590773
	.long	380748506
	.long	".Lcsbs$POC-Example$57"
	.long	8
	.long	".L__$ti-87"
	.long	".Lcsbs$POC-Example$55"
	.long	4
	.long	".Lscl$[313]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-32", 72

	.type	".L__$ti-33",%object
	.p2align	4, 0x0
".L__$ti-33":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	511655086
	.long	892354302
	.long	".L__$ti-105"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-33", 72

	.type	".L__$ti-34",%object
	.p2align	4, 0x0
".L__$ti-34":
	.long	2
	.long	2
	.long	3
	.long	0
	.long	2765151453
	.long	2083772720
	.byte	0
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-34", 72

	.type	".L__$ti-35",%object
	.p2align	4, 0x0
".L__$ti-35":
	.long	4
	.long	4
	.long	1
	.long	0
	.long	519926174
	.long	1782300454
	.byte	1
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-35", 72

	.type	".L__$ti-36",%object
	.p2align	4, 0x0
".L__$ti-36":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1081254746
	.long	2108601875
	.long	".L__$ti-67"
	.zero	36
	.long	12
	.long	0
	.size	".L__$ti-36", 72

	.type	".L__$ti-37",%object
	.p2align	4, 0x0
".L__$ti-37":
	.long	4
	.long	4
	.long	1
	.long	0
	.long	3772748214
	.long	3617066870
	.byte	1
	.byte	0
	.zero	38
	.long	7
	.long	0
	.size	".L__$ti-37", 72

	.type	".L__$ti-42",%object
	.p2align	4, 0x0
".L__$ti-42":
	.long	16
	.long	4
	.long	0
	.long	0
	.long	3661965974
	.long	4135237592
	.long	".Lcsbs$POC-Example$58"
	.long	20
	.long	".L__$ti-294"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[3185]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-42", 72

	.type	".L__$ti-45",%object
	.p2align	4, 0x0
".L__$ti-45":
	.long	2
	.long	1
	.long	3
	.long	0
	.long	4151415752
	.long	1464985561
	.long	.L__$type_info_types_data+28
	.long	.L__$type_info_names_data+56
	.long	.L__$type_info_offsets_data+20
	.long	.L__$type_info_usings_data+5
	.long	.L__$type_info_tags_data+40
	.long	2
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-45", 72

	.type	".L__$ti-46",%object
	.p2align	4, 0x0
".L__$ti-46":
	.long	20
	.long	4
	.long	0
	.long	0
	.long	2580371074
	.long	1331703379
	.long	".Lcsbs$POC-Example$5b"
	.long	14
	.long	".L__$ti-225"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[4465]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-46", 72

	.type	".L__$ti-47",%object
	.p2align	4, 0x0
".L__$ti-47":
	.long	2
	.long	1
	.long	3
	.long	0
	.long	339259087
	.long	1220162746
	.long	".Lcsbs$POC-Example$5c"
	.long	17
	.long	".L__$ti-45"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[1962]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-47", 72

	.type	".L__$ti-48",%object
	.p2align	4, 0x0
".L__$ti-48":
	.long	40
	.long	8
	.long	3
	.long	0
	.long	172684923
	.long	1832444106
	.long	.L__$type_info_types_data+36
	.long	.L__$type_info_names_data+72
	.long	.L__$type_info_offsets_data+28
	.long	.L__$type_info_usings_data+7
	.long	.L__$type_info_tags_data+56
	.long	7
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-48", 72

	.type	".L__$ti-49",%object
	.p2align	4, 0x0
".L__$ti-49":
	.long	24
	.long	4
	.long	3
	.long	0
	.long	96871075
	.long	2608538800
	.long	.L__$type_info_types_data+64
	.long	.L__$type_info_names_data+128
	.long	.L__$type_info_offsets_data+56
	.long	.L__$type_info_usings_data+14
	.long	.L__$type_info_tags_data+112
	.long	6
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-49", 72

	.type	".L__$ti-50",%object
	.p2align	4, 0x0
".L__$ti-50":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	3508239817
	.long	2812556641
	.long	".L__$ti-216"
	.long	".L$enum_names-50"
	.long	2
	.long	".L$enum_values-50"
	.long	2
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-50", 72

	.type	".L__$ti-51",%object
	.p2align	4, 0x0
".L__$ti-51":
	.long	28
	.long	4
	.long	3
	.long	0
	.long	3162732296
	.long	3575438685
	.long	.L__$type_info_types_data+88
	.long	.L__$type_info_names_data+176
	.long	.L__$type_info_offsets_data+80
	.long	.L__$type_info_usings_data+20
	.long	.L__$type_info_tags_data+160
	.long	7
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-51", 72

	.type	".L__$ti-53",%object
	.p2align	4, 0x0
".L__$ti-53":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	70189487
	.long	972035155
	.zero	40
	.long	8
	.long	0
	.size	".L__$ti-53", 72

	.type	".L__$ti-54",%object
	.p2align	4, 0x0
".L__$ti-54":
	.long	28
	.long	4
	.long	3
	.long	0
	.long	737779888
	.long	3442547771
	.long	".Lcsbs$POC-Example$71"
	.long	19
	.long	".L__$ti-51"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[5403]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-54", 72

	.type	".L__$ti-57",%object
	.p2align	4, 0x0
".L__$ti-57":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	4290932178
	.long	863217229
	.long	".Lcsbs$POC-Example$72"
	.long	23
	.long	".L__$ti-6"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2482]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-57", 72

	.type	".L__$ti-58",%object
	.p2align	4, 0x0
".L__$ti-58":
	.long	16
	.long	4
	.long	1
	.long	0
	.long	1693165202
	.long	3971323377
	.zero	24
	.zero	16
	.long	6
	.long	0
	.size	".L__$ti-58", 72

	.type	".L__$ti-59",%object
	.p2align	4, 0x0
".L__$ti-59":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	1634394834
	.long	3657863519
	.long	".Lcsbs$POC-Example$73"
	.long	4
	.long	".L__$ti-200"
	.long	".Lcsbs$POC-Example$55"
	.long	4
	.long	".Lscl$[1409]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-59", 72

	.type	".L__$ti-62",%object
	.p2align	4, 0x0
".L__$ti-62":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1680707819
	.long	1338159828
	.zero	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-62", 72

	.type	".L__$ti-66",%object
	.p2align	4, 0x0
".L__$ti-66":
	.long	8
	.long	4
	.long	0
	.long	0
	.long	912882142
	.long	1894918457
	.long	".L__$ti-4"
	.long	4
	.zero	32
	.long	17
	.long	0
	.size	".L__$ti-66", 72

	.type	".L__$ti-67",%object
	.p2align	4, 0x0
".L__$ti-67":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2428448026
	.long	2660435127
	.zero	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-67", 72

	.type	".L__$ti-70",%object
	.p2align	4, 0x0
".L__$ti-70":
	.long	4
	.long	4
	.long	1
	.long	0
	.long	3869536690
	.long	2584292428
	.zero	1
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-70", 72

	.type	".L__$ti-73",%object
	.p2align	4, 0x0
".L__$ti-73":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2602103172
	.long	512274138
	.byte	1
	.byte	0
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-73", 72

	.type	".L__$ti-76",%object
	.p2align	4, 0x0
".L__$ti-76":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1226565604
	.long	257910760
	.long	".Lcsbs$POC-Example$74"
	.long	21
	.long	".L__$ti-6"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[5345]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-76", 72

	.type	".L__$ti-77",%object
	.p2align	4, 0x0
".L__$ti-77":
	.long	0
	.long	1
	.long	3
	.long	0
	.long	690981467
	.long	2492655140
	.long	".Lcsbs$POC-Example$75"
	.long	17
	.long	".L__$ti-85"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2376]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-77", 72

	.type	".L__$ti-80",%object
	.p2align	4, 0x0
".L__$ti-80":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	899220740
	.long	2431258154
	.long	".L__$ti-216"
	.long	".L$enum_names-80"
	.long	4
	.long	".L$enum_values-80"
	.long	4
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-80", 72

	.type	".L__$ti-81",%object
	.p2align	4, 0x0
".L__$ti-81":
	.long	72
	.long	8
	.long	0
	.long	0
	.long	3660129191
	.long	489645224
	.long	.L__$type_info_types_data+116
	.long	.L__$type_info_names_data+232
	.long	.L__$type_info_offsets_data+108
	.long	.L__$type_info_usings_data+27
	.long	.L__$type_info_tags_data+216
	.long	5
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-81", 72

	.type	".L__$ti-85",%object
	.p2align	4, 0x0
".L__$ti-85":
	.long	0
	.long	1
	.long	3
	.long	0
	.long	3935624606
	.long	246012936
	.zero	40
	.long	19
	.long	0
	.size	".L__$ti-85", 72

	.type	".L__$ti-86",%object
	.p2align	4, 0x0
".L__$ti-86":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	1349974428
	.long	1240883090
	.long	".Lcsbs$POC-Example$7e"
	.long	18
	.long	".L__$ti-302"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[961]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-86", 72

	.type	".L__$ti-87",%object
	.p2align	4, 0x0
".L__$ti-87":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	159261012
	.long	1611042776
	.byte	1
	.byte	0
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-87", 72

	.type	".L__$ti-92",%object
	.p2align	4, 0x0
".L__$ti-92":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2124771595
	.long	1201977439
	.byte	0
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-92", 72

	.type	".L__$ti-93",%object
	.p2align	4, 0x0
".L__$ti-93":
	.long	16
	.long	8
	.long	3
	.long	0
	.long	454565267
	.long	1194933334
	.byte	1
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-93", 72

	.type	".L__$ti-94",%object
	.p2align	4, 0x0
".L__$ti-94":
	.long	2
	.long	1
	.long	3
	.long	0
	.long	2557674121
	.long	1531962700
	.long	".Lcsbs$POC-Example$7f"
	.long	16
	.long	".L__$ti-126"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2213]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-94", 72

	.type	".L__$ti-95",%object
	.p2align	4, 0x0
".L__$ti-95":
	.long	16
	.long	16
	.long	3
	.long	0
	.long	2664033895
	.long	495423759
	.long	".L__$ti-217"
	.long	".L__$ti-8"
	.byte	0
	.zero	7
	.long	0
	.long	0
	.long	127
	.long	0
	.zero	8
	.long	23
	.long	0
	.size	".L__$ti-95", 72

	.type	".L__$ti-96",%object
	.p2align	4, 0x0
".L__$ti-96":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	1479707331
	.long	4131181755
	.long	".L__$ti-216"
	.long	".L$enum_names-96"
	.long	2
	.long	".L$enum_values-96"
	.long	2
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-96", 72

	.type	".L__$ti-98",%object
	.p2align	4, 0x0
".L__$ti-98":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	482064253
	.long	755294598
	.long	.L__$type_info_types_data+136
	.long	1
	.long	.L__$type_info_names_data+272
	.long	1
	.zero	24
	.long	18
	.long	0
	.size	".L__$ti-98", 72

	.type	".L__$ti-99",%object
	.p2align	4, 0x0
".L__$ti-99":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	3531822167
	.long	2707671066
	.long	.L__$type_info_types_data+140
	.long	.L__$type_info_names_data+280
	.long	.L__$type_info_offsets_data+128
	.long	.L__$type_info_usings_data+32
	.long	.L__$type_info_tags_data+256
	.long	1
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-99", 72

	.type	".L__$ti-100",%object
	.p2align	4, 0x0
".L__$ti-100":
	.long	8
	.long	4
	.long	3
	.long	0
	.long	2939700406
	.long	2347025624
	.long	".Lcsbs$POC-Example$83"
	.long	13
	.long	".L__$ti-218"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[66]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-100", 72

	.type	".L__$ti-102",%object
	.p2align	4, 0x0
".L__$ti-102":
	.long	8
	.long	8
	.long	1
	.long	0
	.long	1004200370
	.long	1035496754
	.byte	1
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-102", 72

	.type	".L__$ti-103",%object
	.p2align	4, 0x0
".L__$ti-103":
	.long	8
	.long	8
	.long	1
	.long	0
	.long	2875826662
	.long	1626279920
	.zero	1
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-103", 72

	.type	".L__$ti-105",%object
	.p2align	4, 0x0
".L__$ti-105":
	.long	24
	.long	4
	.long	1
	.long	0
	.long	1442759782
	.long	4030966782
	.long	".Lcsbs$POC-Example$84"
	.long	20
	.long	".L__$ti-29"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[7295]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-105", 72

	.type	".L__$ti-110",%object
	.p2align	4, 0x0
".L__$ti-110":
	.long	40
	.long	8
	.long	3
	.long	0
	.long	861203468
	.long	1312344591
	.long	".Lcsbs$POC-Example$85"
	.long	26
	.long	".L__$ti-48"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2825]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-110", 72

	.type	".L__$ti-112",%object
	.p2align	4, 0x0
".L__$ti-112":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	586708279
	.long	1164085392
	.zero	40
	.long	3
	.long	0
	.size	".L__$ti-112", 72

	.type	".L__$ti-116",%object
	.p2align	4, 0x0
".L__$ti-116":
	.long	8
	.long	4
	.long	1
	.long	0
	.long	3988153103
	.long	4066164137
	.zero	40
	.long	5
	.long	0
	.size	".L__$ti-116", 72

	.type	".L__$ti-118",%object
	.p2align	4, 0x0
".L__$ti-118":
	.long	48
	.long	8
	.long	0
	.long	0
	.long	396265691
	.long	761227683
	.long	.L__$type_info_types_data+144
	.long	27
	.long	40
	.long	".L__$ti-236"
	.long	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	16
	.long	20
	.long	0
	.size	".L__$ti-118", 72

	.type	".L__$ti-119",%object
	.p2align	4, 0x0
".L__$ti-119":
	.long	24
	.long	4
	.long	0
	.long	0
	.long	264602585
	.long	610493873
	.long	".Lcsbs$POC-Example$86"
	.long	15
	.long	".L__$ti-267"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[4173]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-119", 72

	.type	".L__$ti-120",%object
	.p2align	4, 0x0
".L__$ti-120":
	.long	16
	.long	4
	.long	3
	.long	0
	.long	2484432765
	.long	1901123615
	.long	.L__$type_info_types_data+252
	.long	.L__$type_info_names_data+288
	.long	.L__$type_info_offsets_data+132
	.long	.L__$type_info_usings_data+33
	.long	.L__$type_info_tags_data+264
	.long	4
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-120", 72

	.type	".L__$ti-121",%object
	.p2align	4, 0x0
".L__$ti-121":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	426601705
	.long	2698242406
	.zero	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-121", 72

	.type	".L__$ti-123",%object
	.p2align	4, 0x0
".L__$ti-123":
	.long	0
	.long	1
	.long	3
	.long	0
	.long	353489712
	.long	1270456653
	.long	".Lcsbs$POC-Example$8b"
	.long	17
	.long	".L__$ti-85"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2143]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-123", 72

	.type	".L__$ti-124",%object
	.p2align	4, 0x0
".L__$ti-124":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3036576223
	.long	495442135
	.long	".L__$ti-318"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-124", 72

	.type	".L__$ti-125",%object
	.p2align	4, 0x0
".L__$ti-125":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	3597656501
	.long	1273736861
	.zero	40
	.long	8
	.long	0
	.size	".L__$ti-125", 72

	.type	".L__$ti-126",%object
	.p2align	4, 0x0
".L__$ti-126":
	.long	2
	.long	1
	.long	3
	.long	0
	.long	2712525471
	.long	2330816962
	.long	.L__$type_info_types_data+268
	.long	.L__$type_info_names_data+320
	.long	.L__$type_info_offsets_data+148
	.long	.L__$type_info_usings_data+37
	.long	.L__$type_info_tags_data+296
	.long	2
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-126", 72

	.type	".L__$ti-127",%object
	.p2align	4, 0x0
".L__$ti-127":
	.long	16
	.long	8
	.long	1
	.long	0
	.long	3685864165
	.long	3047933354
	.zero	40
	.long	5
	.long	0
	.size	".L__$ti-127", 72

	.type	".L__$ti-128",%object
	.p2align	4, 0x0
".L__$ti-128":
	.long	8
	.long	4
	.long	0
	.long	0
	.long	3518332081
	.long	992433037
	.long	".L__$ti-318"
	.long	8
	.zero	32
	.long	17
	.long	0
	.size	".L__$ti-128", 72

	.type	".L__$ti-129",%object
	.p2align	4, 0x0
".L__$ti-129":
	.long	0
	.long	1
	.long	3
	.long	0
	.long	2066728647
	.long	2114472286
	.long	".Lcsbs$POC-Example$8e"
	.long	17
	.long	".L__$ti-85"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2306]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-129", 72

	.type	".L__$ti-130",%object
	.p2align	4, 0x0
".L__$ti-130":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	3728466315
	.long	1402735377
	.byte	1
	.byte	0
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-130", 72

	.type	".L__$ti-133",%object
	.p2align	4, 0x0
".L__$ti-133":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	1181551897
	.long	3302160237
	.zero	40
	.long	10
	.long	0
	.size	".L__$ti-133", 72

	.type	".L__$ti-134",%object
	.p2align	4, 0x0
".L__$ti-134":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1582212877
	.long	1179722343
	.long	.L__$type_info_types_data+276
	.long	1
	.long	.L__$type_info_names_data+336
	.long	1
	.zero	24
	.long	18
	.long	0
	.size	".L__$ti-134", 72

	.type	".L__$ti-136",%object
	.p2align	4, 0x0
".L__$ti-136":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1754674665
	.long	103428516
	.long	".L__$ti-154"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-136", 72

	.type	".L__$ti-137",%object
	.p2align	4, 0x0
".L__$ti-137":
	.long	8
	.long	2
	.long	1
	.long	0
	.long	3193153172
	.long	2363733149
	.zero	24
	.zero	16
	.long	6
	.long	0
	.size	".L__$ti-137", 72

	.type	".L__$ti-138",%object
	.p2align	4, 0x0
".L__$ti-138":
	.long	8
	.long	4
	.long	3
	.long	0
	.long	2107974171
	.long	3400077585
	.long	.L__$type_info_types_data+280
	.long	.L__$type_info_names_data+344
	.long	.L__$type_info_offsets_data+156
	.long	.L__$type_info_usings_data+39
	.long	.L__$type_info_tags_data+312
	.long	2
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-138", 72

	.type	".L__$ti-139",%object
	.p2align	4, 0x0
".L__$ti-139":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	49889092
	.long	3587587100
	.long	".L__$ti-216"
	.long	".L$enum_names-139"
	.long	2
	.long	".L$enum_values-139"
	.long	2
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-139", 72

	.type	".L__$ti-140",%object
	.p2align	4, 0x0
".L__$ti-140":
	.long	0
	.long	1
	.long	3
	.long	0
	.long	1034098296
	.long	3294393235
	.long	".Lcsbs$POC-Example$92"
	.long	14
	.long	".L__$ti-85"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2042]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-140", 72

	.type	".L__$ti-141",%object
	.p2align	4, 0x0
".L__$ti-141":
	.long	16
	.long	4
	.long	3
	.long	0
	.long	340761392
	.long	2966520022
	.long	.L__$type_info_types_data+288
	.long	.L__$type_info_names_data+360
	.long	.L__$type_info_offsets_data+164
	.long	.L__$type_info_usings_data+41
	.long	.L__$type_info_tags_data+328
	.long	4
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-141", 72

	.type	".L__$ti-142",%object
	.p2align	4, 0x0
".L__$ti-142":
	.long	8
	.long	4
	.long	0
	.long	0
	.long	999901777
	.long	223522016
	.long	.L__$type_info_types_data+304
	.long	2
	.long	.L__$type_info_names_data+392
	.long	2
	.zero	24
	.long	18
	.long	0
	.size	".L__$ti-142", 72

	.type	".L__$ti-143",%object
	.p2align	4, 0x0
".L__$ti-143":
	.long	32
	.long	8
	.long	1
	.long	0
	.long	4061431485
	.long	919139866
	.zero	24
	.zero	16
	.long	6
	.long	0
	.size	".L__$ti-143", 72

	.type	".L__$ti-148",%object
	.p2align	4, 0x0
".L__$ti-148":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	1593006517
	.long	747444013
	.zero	40
	.long	8
	.long	0
	.size	".L__$ti-148", 72

	.type	".L__$ti-154",%object
	.p2align	4, 0x0
".L__$ti-154":
	.long	16
	.long	4
	.long	3
	.long	0
	.long	3254963974
	.long	1086233961
	.long	".Lcsbs$POC-Example$99"
	.long	8
	.long	".L__$ti-141"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[12605]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-154", 72

	.type	".L__$ti-172",%object
	.p2align	4, 0x0
".L__$ti-172":
	.long	24
	.long	4
	.long	3
	.long	0
	.long	3224486635
	.long	3192046651
	.long	".Lcsbs$POC-Example$9a"
	.long	16
	.long	".L__$ti-49"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[5008]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-172", 72

	.type	".L__$ti-175",%object
	.p2align	4, 0x0
".L__$ti-175":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	491610505
	.long	1892912397
	.byte	1
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-175", 72

	.type	".L__$ti-180",%object
	.p2align	4, 0x0
".L__$ti-180":
	.long	24
	.long	4
	.long	1
	.long	0
	.long	687620558
	.long	2385080347
	.long	.L__$type_info_types_data+312
	.long	.L__$type_info_names_data+408
	.long	.L__$type_info_offsets_data+180
	.long	.L__$type_info_usings_data+45
	.long	.L__$type_info_tags_data+360
	.long	4
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	"__$equal$$struct{name:string,base:^runtime::Type_Info,pkg:string,loc:^runtime::Source_Code_Location}"
	.long	19
	.long	0
	.size	".L__$ti-180", 72

	.type	".L__$ti-182",%object
	.p2align	4, 0x0
".L__$ti-182":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1315131624
	.long	3990515063
	.byte	0
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-182", 72

	.type	".L__$ti-183",%object
	.p2align	4, 0x0
".L__$ti-183":
	.long	12
	.long	4
	.long	3
	.long	0
	.long	4171482787
	.long	3773116826
	.long	.L__$type_info_types_data+328
	.long	.L__$type_info_names_data+440
	.long	.L__$type_info_offsets_data+196
	.long	.L__$type_info_usings_data+49
	.long	.L__$type_info_tags_data+392
	.long	3
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-183", 72

	.type	".L__$ti-185",%object
	.p2align	4, 0x0
".L__$ti-185":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1574461602
	.long	2531309297
	.long	.L__$type_info_types_data+340
	.long	1
	.long	.L__$type_info_names_data+464
	.long	1
	.zero	24
	.long	18
	.long	0
	.size	".L__$ti-185", 72

	.type	".L__$ti-186",%object
	.p2align	4, 0x0
".L__$ti-186":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	265146048
	.long	574355372
	.long	".L__$ti-148"
	.zero	36
	.long	12
	.long	0
	.size	".L__$ti-186", 72

	.type	".L__$ti-187",%object
	.p2align	4, 0x0
".L__$ti-187":
	.long	16
	.long	4
	.long	3
	.long	0
	.long	2428313898
	.long	2174562030
	.long	".Lcsbs$POC-Example$9f"
	.long	13
	.long	".L__$ti-120"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[4703]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-187", 72

	.type	".L__$ti-188",%object
	.p2align	4, 0x0
".L__$ti-188":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	162102443
	.long	3173358485
	.long	".L__$ti-4"
	.zero	36
	.long	12
	.long	0
	.size	".L__$ti-188", 72

	.type	".L__$ti-189",%object
	.p2align	4, 0x0
".L__$ti-189":
	.long	4
	.long	4
	.long	1
	.long	0
	.long	400544229
	.long	3972699277
	.byte	2
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-189", 72

	.type	".L__$ti-193",%object
	.p2align	4, 0x0
".L__$ti-193":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3276760081
	.long	416695105
	.long	".L__$ti-10"
	.long	".L__$ti-98"
	.byte	0
	.byte	2
	.zero	2
	.zero	28
	.long	13
	.long	0
	.size	".L__$ti-193", 72

	.type	".L__$ti-196",%object
	.p2align	4, 0x0
".L__$ti-196":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	2001700174
	.long	1715271695
	.long	".Lcsbs$POC-Example$a0"
	.long	30
	.long	".L__$ti-139"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[1751]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-196", 72

	.type	".L__$ti-197",%object
	.p2align	4, 0x0
".L__$ti-197":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	930476392
	.long	824957074
	.byte	1
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-197", 72

	.type	".L__$ti-200",%object
	.p2align	4, 0x0
".L__$ti-200":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	339972463
	.long	3880872000
	.long	.L__$type_info_types_data+344
	.long	.L__$type_info_names_data+472
	.long	.L__$type_info_offsets_data+208
	.long	.L__$type_info_usings_data+52
	.long	.L__$type_info_tags_data+416
	.long	1
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-200", 72

	.type	".L__$ti-201",%object
	.p2align	4, 0x0
".L__$ti-201":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	2940450790
	.long	3034717681
	.long	".L__$ti-216"
	.long	".L$enum_names-201"
	.long	3
	.long	".L$enum_values-201"
	.long	3
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-201", 72

	.type	".L__$ti-203",%object
	.p2align	4, 0x0
".L__$ti-203":
	.long	8
	.long	4
	.long	1
	.long	0
	.long	3959872871
	.long	2015947697
	.byte	0
	.byte	1
	.zero	38
	.long	7
	.long	0
	.size	".L__$ti-203", 72

	.type	".L__$ti-204",%object
	.p2align	4, 0x0
".L__$ti-204":
	.long	72
	.long	8
	.long	0
	.long	0
	.long	1105065573
	.long	2759453229
	.long	".Lcsbs$POC-Example$a5"
	.long	9
	.long	".L__$ti-81"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[5891]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-204", 72

	.type	".L__$ti-211",%object
	.p2align	4, 0x0
".L__$ti-211":
	.long	4
	.long	4
	.long	1
	.long	0
	.long	1082444513
	.long	2829565147
	.byte	1
	.byte	1
	.zero	38
	.long	7
	.long	0
	.size	".L__$ti-211", 72

	.type	".L__$ti-215",%object
	.p2align	4, 0x0
".L__$ti-215":
	.long	40
	.long	4
	.long	3
	.long	0
	.long	3602834178
	.long	1946792055
	.long	.L__$type_info_types_data+348
	.long	.L__$type_info_names_data+480
	.long	.L__$type_info_offsets_data+212
	.long	.L__$type_info_usings_data+53
	.long	.L__$type_info_tags_data+424
	.long	11
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-215", 72

	.type	".L__$ti-216",%object
	.p2align	4, 0x0
".L__$ti-216":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	3853066515
	.long	1032104133
	.zero	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-216", 72

	.type	".L__$ti-217",%object
	.p2align	4, 0x0
".L__$ti-217":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	675385718
	.long	2524010688
	.byte	1
	.byte	0
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-217", 72

	.type	".L__$ti-218",%object
	.p2align	4, 0x0
".L__$ti-218":
	.long	8
	.long	4
	.long	3
	.long	0
	.long	547972995
	.long	393014933
	.long	.L__$type_info_types_data+392
	.long	1
	.long	4
	.long	".L__$ti-62"
	.long	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	16
	.long	20
	.long	0
	.size	".L__$ti-218", 72

	.type	".L__$ti-219",%object
	.p2align	4, 0x0
".L__$ti-219":
	.long	8
	.long	4
	.long	0
	.long	0
	.long	668764353
	.long	3727887515
	.long	".L__$ti-216"
	.long	1
	.zero	32
	.long	17
	.long	0
	.size	".L__$ti-219", 72

	.type	".L__$ti-220",%object
	.p2align	4, 0x0
".L__$ti-220":
	.long	32
	.long	8
	.long	3
	.long	0
	.long	1079884860
	.long	873352063
	.long	.L__$type_info_types_data+396
	.long	.L__$type_info_names_data+568
	.long	.L__$type_info_offsets_data+256
	.long	.L__$type_info_usings_data+64
	.long	.L__$type_info_tags_data+512
	.long	5
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-220", 72

	.type	".L__$ti-221",%object
	.p2align	4, 0x0
".L__$ti-221":
	.long	12
	.long	4
	.long	3
	.long	0
	.long	3563163292
	.long	525673542
	.long	.L__$type_info_types_data+416
	.long	.L__$type_info_names_data+608
	.long	.L__$type_info_offsets_data+276
	.long	.L__$type_info_usings_data+69
	.long	.L__$type_info_tags_data+552
	.long	3
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-221", 72

	.type	".L__$ti-222",%object
	.p2align	4, 0x0
".L__$ti-222":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1046750112
	.long	839012710
	.long	".Lcsbs$POC-Example$b3"
	.long	15
	.long	".L__$ti-238"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[5831]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-222", 72

	.type	".L__$ti-223",%object
	.p2align	4, 0x0
".L__$ti-223":
	.long	8
	.long	4
	.long	0
	.long	0
	.long	1940970120
	.long	2910105165
	.long	.L__$type_info_types_data+428
	.long	2
	.long	.L__$type_info_names_data+632
	.long	2
	.zero	24
	.long	18
	.long	0
	.size	".L__$ti-223", 72

	.type	".L__$ti-224",%object
	.p2align	4, 0x0
".L__$ti-224":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	3537491558
	.long	3847382900
	.long	".Lcsbs$POC-Example$b5"
	.long	14
	.long	".L__$ti-96"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[5755]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-224", 72

	.type	".L__$ti-225",%object
	.p2align	4, 0x0
".L__$ti-225":
	.long	20
	.long	4
	.long	0
	.long	0
	.long	2505951048
	.long	866744330
	.long	.L__$type_info_types_data+436
	.long	.L__$type_info_names_data+648
	.long	.L__$type_info_offsets_data+288
	.long	.L__$type_info_usings_data+72
	.long	.L__$type_info_tags_data+576
	.long	3
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-225", 72

	.type	".L__$ti-226",%object
	.p2align	4, 0x0
".L__$ti-226":
	.long	8
	.long	8
	.long	1
	.long	0
	.long	3440116163
	.long	3913933989
	.byte	2
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-226", 72

	.type	".L__$ti-228",%object
	.p2align	4, 0x0
".L__$ti-228":
	.long	24
	.long	4
	.long	1
	.long	0
	.long	2437292995
	.long	644947366
	.long	".Lcsbs$POC-Example$b7"
	.long	15
	.long	".L__$ti-180"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[1847]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-228", 72

	.type	".L__$ti-232",%object
	.p2align	4, 0x0
".L__$ti-232":
	.long	12
	.long	4
	.long	3
	.long	0
	.long	2287714058
	.long	568778436
	.long	".Lcsbs$POC-Example$b8"
	.long	21
	.long	".L__$ti-183"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[4906]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-232", 72

	.type	".L__$ti-233",%object
	.p2align	4, 0x0
".L__$ti-233":
	.long	16
	.long	8
	.long	3
	.long	0
	.long	951270735
	.long	826997542
	.byte	1
	.byte	0
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-233", 72

	.type	".L__$ti-234",%object
	.p2align	4, 0x0
".L__$ti-234":
	.long	2
	.long	2
	.long	3
	.long	0
	.long	2573139160
	.long	502970347
	.byte	0
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-234", 72

	.type	".L__$ti-235",%object
	.p2align	4, 0x0
".L__$ti-235":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	4252869916
	.long	541389484
	.long	".Lcsbs$POC-Example$bb"
	.long	10
	.long	".L__$ti-280"
	.long	".Lcsbs$POC-Example$b9"
	.long	11
	.long	".Lscl$[333]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-235", 72

	.type	".L__$ti-236",%object
	.p2align	4, 0x0
".L__$ti-236":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	3422454003
	.long	1571068702
	.zero	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-236", 72

	.type	".L__$ti-237",%object
	.p2align	4, 0x0
".L__$ti-237":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3702439990
	.long	2732943883
	.long	".L__$ti-187"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-237", 72

	.type	".L__$ti-238",%object
	.p2align	4, 0x0
".L__$ti-238":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3748263492
	.long	3449428221
	.long	".L__$ti-224"
	.long	".L__$ti-62"
	.byte	1
	.zero	7
	.long	0
	.long	0
	.long	1
	.long	0
	.zero	8
	.long	23
	.long	0
	.size	".L__$ti-238", 72

	.type	".L__$ti-239",%object
	.p2align	4, 0x0
".L__$ti-239":
	.long	12
	.long	4
	.long	3
	.long	0
	.long	2903957576
	.long	3620940803
	.long	".Lcsbs$POC-Example$bc"
	.long	19
	.long	".L__$ti-254"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2542]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-239", 72

	.type	".L__$ti-246",%object
	.p2align	4, 0x0
".L__$ti-246":
	.long	2
	.long	2
	.long	1
	.long	0
	.long	1612987855
	.long	2077448817
	.byte	1
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-246", 72

	.type	".L__$ti-250",%object
	.p2align	4, 0x0
".L__$ti-250":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2211015182
	.long	1943944674
	.long	".L__$ti-223"
	.long	".L__$ti-185"
	.byte	0
	.byte	2
	.zero	2
	.zero	28
	.long	13
	.long	0
	.size	".L__$ti-250", 72

	.type	".L__$ti-251",%object
	.p2align	4, 0x0
".L__$ti-251":
	.long	2
	.long	2
	.long	3
	.long	0
	.long	4093975810
	.long	2078322779
	.zero	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-251", 72

	.type	".L__$ti-252",%object
	.p2align	4, 0x0
".L__$ti-252":
	.long	2
	.long	2
	.long	3
	.long	0
	.long	2513395067
	.long	3191702550
	.byte	1
	.byte	0
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-252", 72

	.type	".L__$ti-253",%object
	.p2align	4, 0x0
".L__$ti-253":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	665650268
	.long	1516840741
	.long	".L__$ti-4"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-253", 72

	.type	".L__$ti-254",%object
	.p2align	4, 0x0
".L__$ti-254":
	.long	12
	.long	4
	.long	3
	.long	0
	.long	545923466
	.long	1188349753
	.long	.L__$type_info_types_data+448
	.long	.L__$type_info_names_data+672
	.long	.L__$type_info_offsets_data+300
	.long	.L__$type_info_usings_data+75
	.long	.L__$type_info_tags_data+600
	.long	4
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-254", 72

	.type	".L__$ti-256",%object
	.p2align	4, 0x0
".L__$ti-256":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	4213341411
	.long	954268556
	.long	".Lcsbs$POC-Example$c1"
	.long	22
	.long	".L__$ti-322"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[3331]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-256", 72

	.type	".L__$ti-257",%object
	.p2align	4, 0x0
".L__$ti-257":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3630100811
	.long	969270660
	.long	".Lcsbs$POC-Example$c2"
	.long	10
	.long	".L__$ti-258"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[1427]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-257", 72

	.type	".L__$ti-258",%object
	.p2align	4, 0x0
".L__$ti-258":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	1791174665
	.long	4087830657
	.long	".L__$ti-142"
	.long	".L__$ti-98"
	.byte	0
	.byte	2
	.zero	2
	.zero	28
	.long	13
	.long	0
	.size	".L__$ti-258", 72

	.type	".L__$ti-259",%object
	.p2align	4, 0x0
".L__$ti-259":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2237362591
	.long	168533802
	.zero	40
	.long	8
	.long	0
	.size	".L__$ti-259", 72

	.type	".L__$ti-260",%object
	.p2align	4, 0x0
".L__$ti-260":
	.long	8
	.long	4
	.long	3
	.long	0
	.long	2073847089
	.long	4223717272
	.long	".Lcsbs$POC-Example$c3"
	.long	23
	.long	".L__$ti-138"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[3043]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-260", 72

	.type	".L__$ti-262",%object
	.p2align	4, 0x0
".L__$ti-262":
	.long	8
	.long	4
	.long	3
	.long	0
	.long	3345261518
	.long	2308774452
	.long	".Lcsbs$POC-Example$c4"
	.long	15
	.long	".L__$ti-138"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[3113]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-262", 72

	.type	".L__$ti-263",%object
	.p2align	4, 0x0
".L__$ti-263":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	91342212
	.long	2815023365
	.long	".Lcsbs$POC-Example$c5"
	.long	25
	.long	".L__$ti-80"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[1646]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-263", 72

	.type	".L__$ti-267",%object
	.p2align	4, 0x0
".L__$ti-267":
	.long	24
	.long	4
	.long	0
	.long	0
	.long	1108028443
	.long	1800978285
	.long	.L__$type_info_types_data+464
	.long	.L__$type_info_names_data+704
	.long	.L__$type_info_offsets_data+316
	.long	.L__$type_info_usings_data+79
	.long	.L__$type_info_tags_data+632
	.long	7
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-267", 72

	.type	".L__$ti-270",%object
	.p2align	4, 0x0
".L__$ti-270":
	.long	12
	.long	4
	.long	3
	.long	0
	.long	432374780
	.long	3200005506
	.long	".Lcsbs$POC-Example$cc"
	.long	15
	.long	".L__$ti-183"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2732]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-270", 72

	.type	".L__$ti-271",%object
	.p2align	4, 0x0
".L__$ti-271":
	.long	4
	.long	2
	.long	1
	.long	0
	.long	3763667686
	.long	187437599
	.zero	40
	.long	5
	.long	0
	.size	".L__$ti-271", 72

	.type	".L__$ti-273",%object
	.p2align	4, 0x0
".L__$ti-273":
	.long	32
	.long	8
	.long	3
	.long	0
	.long	3328404154
	.long	1080752600
	.long	".Lcsbs$POC-Example$cd"
	.long	17
	.long	".L__$ti-220"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[4673]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-273", 72

	.type	".L__$ti-274",%object
	.p2align	4, 0x0
".L__$ti-274":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	1237721380
	.long	764030577
	.byte	0
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-274", 72

	.type	".L__$ti-275",%object
	.p2align	4, 0x0
".L__$ti-275":
	.long	2
	.long	2
	.long	3
	.long	0
	.long	3692985698
	.long	1759336533
	.byte	1
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-275", 72

	.type	".L__$ti-276",%object
	.p2align	4, 0x0
".L__$ti-276":
	.long	0
	.long	1
	.long	3
	.long	0
	.long	2193208992
	.long	3466938534
	.long	".Lcsbs$POC-Example$ce"
	.long	13
	.long	".L__$ti-85"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[2341]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-276", 72

	.type	".L__$ti-278",%object
	.p2align	4, 0x0
".L__$ti-278":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3290386678
	.long	4022163474
	.long	".L__$ti-279"
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-278", 72

	.type	".L__$ti-279",%object
	.p2align	4, 0x0
".L__$ti-279":
	.long	8
	.long	4
	.long	1
	.long	0
	.long	3594887409
	.long	706738861
	.zero	2
	.zero	38
	.long	7
	.long	0
	.size	".L__$ti-279", 72

	.type	".L__$ti-280",%object
	.p2align	4, 0x0
".L__$ti-280":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2824870893
	.long	748032317
	.long	".L__$ti-217"
	.long	".L$enum_names-280"
	.long	1
	.long	".L$enum_values-280"
	.long	1
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-280", 72

	.type	".L__$ti-285",%object
	.p2align	4, 0x0
".L__$ti-285":
	.long	16
	.long	8
	.long	3
	.long	0
	.long	1961540866
	.long	2147365262
	.byte	0
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-285", 72

	.type	".L__$ti-290",%object
	.p2align	4, 0x0
".L__$ti-290":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	3168607524
	.long	2718595603
	.zero	4
	.zero	36
	.long	11
	.long	0
	.size	".L__$ti-290", 72

	.type	".L__$ti-291",%object
	.p2align	4, 0x0
".L__$ti-291":
	.long	2
	.long	2
	.long	3
	.long	0
	.long	326884769
	.long	778414328
	.zero	40
	.long	8
	.long	0
	.size	".L__$ti-291", 72

	.type	".L__$ti-294",%object
	.p2align	4, 0x0
".L__$ti-294":
	.long	16
	.long	4
	.long	0
	.long	0
	.long	1971346349
	.long	282822106
	.long	.L__$type_info_types_data+492
	.long	.L__$type_info_names_data+760
	.long	.L__$type_info_offsets_data+344
	.long	.L__$type_info_usings_data+86
	.long	.L__$type_info_tags_data+688
	.long	2
	.byte	0
	.byte	0
	.zero	2
	.long	0
	.long	0
	.long	0
	.long	19
	.long	0
	.size	".L__$ti-294", 72

	.type	".L__$ti-297",%object
	.p2align	4, 0x0
".L__$ti-297":
	.long	4
	.long	4
	.long	3
	.long	0
	.long	2102013638
	.long	3055086669
	.long	".L__$ti-279"
	.zero	36
	.long	12
	.long	0
	.size	".L__$ti-297", 72

	.type	".L__$ti-302",%object
	.p2align	4, 0x0
".L__$ti-302":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	1580346553
	.long	3483902357
	.long	".L__$ti-216"
	.long	".L$enum_names-302"
	.long	10
	.long	".L$enum_values-302"
	.long	10
	.zero	20
	.long	21
	.long	0
	.size	".L__$ti-302", 72

	.type	".L__$ti-307",%object
	.p2align	4, 0x0
".L__$ti-307":
	.long	16
	.long	8
	.long	3
	.long	0
	.long	540712202
	.long	699342078
	.byte	0
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-307", 72

	.type	".L__$ti-308",%object
	.p2align	4, 0x0
".L__$ti-308":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	4036302708
	.long	3768739993
	.long	".Lcsbs$POC-Example$d9"
	.long	19
	.long	".L__$ti-201"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[1267]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-308", 72

	.type	".L__$ti-313",%object
	.p2align	4, 0x0
".L__$ti-313":
	.long	12
	.long	4
	.long	3
	.long	0
	.long	170931877
	.long	531103288
	.long	".Lcsbs$POC-Example$da"
	.long	13
	.long	".L__$ti-221"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[4572]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-313", 72

	.type	".L__$ti-317",%object
	.p2align	4, 0x0
".L__$ti-317":
	.long	8
	.long	4
	.long	0
	.long	0
	.long	3403196484
	.long	1612568384
	.long	".L__$ti-279"
	.long	8
	.zero	32
	.long	17
	.long	0
	.size	".L__$ti-317", 72

	.type	".L__$ti-318",%object
	.p2align	4, 0x0
".L__$ti-318":
	.long	8
	.long	8
	.long	3
	.long	0
	.long	4163606441
	.long	2182006794
	.long	".Lcsbs$POC-Example$db"
	.long	20
	.long	".L__$ti-87"
	.long	".Lcsbs$POC-Example$42"
	.long	7
	.long	".Lscl$[1227]"
	.zero	16
	.long	1
	.long	0
	.size	".L__$ti-318", 72

	.type	".L__$ti-322",%object
	.p2align	4, 0x0
".L__$ti-322":
	.long	1
	.long	1
	.long	3
	.long	0
	.long	2123605581
	.long	343690965
	.long	".L__$ti-5"
	.long	".L__$ti-216"
	.byte	1
	.zero	7
	.long	0
	.long	0
	.long	4
	.long	0
	.zero	8
	.long	23
	.long	0
	.size	".L__$ti-322", 72

	.type	".L__$ti-323",%object
	.p2align	4, 0x0
".L__$ti-323":
	.long	2
	.long	2
	.long	3
	.long	0
	.long	2543566173
	.long	2014745563
	.byte	1
	.byte	1
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-323", 72

	.type	".L__$ti-324",%object
	.p2align	4, 0x0
".L__$ti-324":
	.long	2
	.long	2
	.long	1
	.long	0
	.long	1103076772
	.long	3108861875
	.zero	1
	.zero	39
	.long	4
	.long	0
	.size	".L__$ti-324", 72

	.type	".L__$ti-325",%object
	.p2align	4, 0x0
".L__$ti-325":
	.long	16
	.long	8
	.long	3
	.long	0
	.long	2219277689
	.long	619147782
	.byte	1
	.byte	2
	.zero	38
	.long	2
	.long	0
	.size	".L__$ti-325", 72

	.type	".Lcsbs$POC-Example$42",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$42":
	.asciz	"runtime"
	.size	".Lcsbs$POC-Example$42", 8

	.type	".Lcsbs$POC-Example$43",%object
".Lcsbs$POC-Example$43":
	.asciz	"C:/Users/King-/langs/Odin/base/runtime/core.odin"
	.size	".Lcsbs$POC-Example$43", 49

	.type	".Lscl$[3402]",%object
	.p2align	4, 0x0
".Lscl$[3402]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	120
	.long	1
	.zero	8
	.size	".Lscl$[3402]", 24

	.type	".Lcsbs$POC-Example$44",%object
".Lcsbs$POC-Example$44":
	.asciz	"Type_Info_Struct_Flag"
	.size	".Lcsbs$POC-Example$44", 22

	.type	".Lcsbs$POC-Example$45",%object
".Lcsbs$POC-Example$45":
	.asciz	"elem"
	.size	".Lcsbs$POC-Example$45", 5

	.type	".L$enum_names-9",%object
	.section	.odinti,"a",%progbits
	.p2align	4, 0x0
".L$enum_names-9":
	.long	".Lcsbs$POC-Example$46"
	.long	6
	.long	".Lcsbs$POC-Example$47"
	.long	9
	.long	".Lcsbs$POC-Example$48"
	.long	11
	.long	".Lcsbs$POC-Example$49"
	.long	5
	.long	".Lcsbs$POC-Example$4a"
	.long	6
	.size	".L$enum_names-9", 40

	.type	".L$enum_values-9",%object
	.p2align	4, 0x0
".L$enum_values-9":
	.long	0
	.long	0
	.long	1
	.long	0
	.long	2
	.long	0
	.long	3
	.long	0
	.long	4
	.long	0
	.size	".L$enum_values-9", 40

	.type	".Lcsbs$POC-Example$46",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$46":
	.asciz	"packed"
	.size	".Lcsbs$POC-Example$46", 7

	.type	".Lcsbs$POC-Example$47",%object
".Lcsbs$POC-Example$47":
	.asciz	"raw_union"
	.size	".Lcsbs$POC-Example$47", 10

	.type	".Lcsbs$POC-Example$48",%object
".Lcsbs$POC-Example$48":
	.asciz	"all_or_none"
	.size	".Lcsbs$POC-Example$48", 12

	.type	".Lcsbs$POC-Example$49",%object
".Lcsbs$POC-Example$49":
	.asciz	"align"
	.size	".Lcsbs$POC-Example$49", 6

	.type	".Lcsbs$POC-Example$4a",%object
".Lcsbs$POC-Example$4a":
	.asciz	"simple"
	.size	".Lcsbs$POC-Example$4a", 7

	.type	".Lcsbs$POC-Example$4b",%object
".Lcsbs$POC-Example$4b":
	.asciz	"lhs"
	.size	".Lcsbs$POC-Example$4b", 4

	.type	".Lcsbs$POC-Example$4c",%object
".Lcsbs$POC-Example$4c":
	.asciz	"rhs"
	.size	".Lcsbs$POC-Example$4c", 4

	.type	".Lscl$[2077]",%object
	.p2align	4, 0x0
".Lscl$[2077]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	78
	.long	1
	.zero	8
	.size	".Lscl$[2077]", 24

	.type	".Lcsbs$POC-Example$4d",%object
".Lcsbs$POC-Example$4d":
	.asciz	"Type_Info_Float"
	.size	".Lcsbs$POC-Example$4d", 16

	.type	".Lscl$[3538]",%object
	.p2align	4, 0x0
".Lscl$[3538]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	128
	.long	1
	.zero	8
	.size	".Lscl$[3538]", 24

	.type	".Lcsbs$POC-Example$4e",%object
".Lcsbs$POC-Example$4e":
	.asciz	"Type_Info_Struct"
	.size	".Lcsbs$POC-Example$4e", 17

	.type	".Lscl$[2411]",%object
	.p2align	4, 0x0
".Lscl$[2411]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	85
	.long	1
	.zero	8
	.size	".Lscl$[2411]", 24

	.type	".Lcsbs$POC-Example$4f",%object
".Lcsbs$POC-Example$4f":
	.asciz	"Type_Info_Pointer"
	.size	".Lcsbs$POC-Example$4f", 18

	.type	".Lscl$[2178]",%object
	.p2align	4, 0x0
".Lscl$[2178]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	80
	.long	1
	.zero	8
	.size	".Lscl$[2178]", 24

	.type	".Lcsbs$POC-Example$50",%object
".Lcsbs$POC-Example$50":
	.asciz	"Type_Info_Quaternion"
	.size	".Lcsbs$POC-Example$50", 21

	.type	".Lcsbs$POC-Example$51",%object
".Lcsbs$POC-Example$51":
	.asciz	"file_path"
	.size	".Lcsbs$POC-Example$51", 10

	.type	".Lcsbs$POC-Example$52",%object
".Lcsbs$POC-Example$52":
	.asciz	"line"
	.size	".Lcsbs$POC-Example$52", 5

	.type	".Lcsbs$POC-Example$53",%object
".Lcsbs$POC-Example$53":
	.asciz	"column"
	.size	".Lcsbs$POC-Example$53", 7

	.type	".Lcsbs$POC-Example$54",%object
".Lcsbs$POC-Example$54":
	.asciz	"procedure"
	.size	".Lcsbs$POC-Example$54", 10

	.type	".Lcsbs$POC-Example$55",%object
".Lcsbs$POC-Example$55":
	.asciz	"time"
	.size	".Lcsbs$POC-Example$55", 5

	.type	".Lcsbs$POC-Example$56",%object
".Lcsbs$POC-Example$56":
	.asciz	"C:/Users/King-/langs/Odin/core/time/time.odin"
	.size	".Lcsbs$POC-Example$56", 46

	.type	".Lscl$[313]",%object
	.p2align	4, 0x0
".Lscl$[313]":
	.long	".Lcsbs$POC-Example$56"
	.long	45
	.long	11
	.long	1
	.zero	8
	.size	".Lscl$[313]", 24

	.type	".Lcsbs$POC-Example$57",%object
".Lcsbs$POC-Example$57":
	.asciz	"Duration"
	.size	".Lcsbs$POC-Example$57", 9

	.type	".Lscl$[3185]",%object
	.p2align	4, 0x0
".Lscl$[3185]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	114
	.long	1
	.zero	8
	.size	".Lscl$[3185]", 24

	.type	".Lcsbs$POC-Example$58",%object
".Lcsbs$POC-Example$58":
	.asciz	"Type_Info_Parameters"
	.size	".Lcsbs$POC-Example$58", 21

	.type	".Lcsbs$POC-Example$59",%object
".Lcsbs$POC-Example$59":
	.asciz	"signed"
	.size	".Lcsbs$POC-Example$59", 7

	.type	".Lcsbs$POC-Example$5a",%object
".Lcsbs$POC-Example$5a":
	.asciz	"endianness"
	.size	".Lcsbs$POC-Example$5a", 11

	.type	".Lscl$[4465]",%object
	.p2align	4, 0x0
".Lscl$[4465]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	158
	.long	1
	.zero	8
	.size	".Lscl$[4465]", 24

	.type	".Lcsbs$POC-Example$5b",%object
".Lcsbs$POC-Example$5b":
	.asciz	"Type_Info_Enum"
	.size	".Lcsbs$POC-Example$5b", 15

	.type	".Lscl$[1962]",%object
	.p2align	4, 0x0
".Lscl$[1962]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	76
	.long	1
	.zero	8
	.size	".Lscl$[1962]", 24

	.type	".Lcsbs$POC-Example$5c",%object
".Lcsbs$POC-Example$5c":
	.asciz	"Type_Info_Integer"
	.size	".Lcsbs$POC-Example$5c", 18

	.type	".Lcsbs$POC-Example$5d",%object
".Lcsbs$POC-Example$5d":
	.asciz	"index"
	.size	".Lcsbs$POC-Example$5d", 6

	.type	".Lcsbs$POC-Example$5e",%object
".Lcsbs$POC-Example$5e":
	.asciz	"elem_size"
	.size	".Lcsbs$POC-Example$5e", 10

	.type	".Lcsbs$POC-Example$5f",%object
".Lcsbs$POC-Example$5f":
	.asciz	"count"
	.size	".Lcsbs$POC-Example$5f", 6

	.type	".Lcsbs$POC-Example$60",%object
".Lcsbs$POC-Example$60":
	.asciz	"min_value"
	.size	".Lcsbs$POC-Example$60", 10

	.type	".Lcsbs$POC-Example$61",%object
".Lcsbs$POC-Example$61":
	.asciz	"max_value"
	.size	".Lcsbs$POC-Example$61", 10

	.type	".Lcsbs$POC-Example$62",%object
".Lcsbs$POC-Example$62":
	.asciz	"is_sparse"
	.size	".Lcsbs$POC-Example$62", 10

	.type	".Lcsbs$POC-Example$63",%object
".Lcsbs$POC-Example$63":
	.asciz	"elem_stride"
	.size	".Lcsbs$POC-Example$63", 12

	.type	".Lcsbs$POC-Example$64",%object
".Lcsbs$POC-Example$64":
	.asciz	"row_count"
	.size	".Lcsbs$POC-Example$64", 10

	.type	".Lcsbs$POC-Example$65",%object
".Lcsbs$POC-Example$65":
	.asciz	"column_count"
	.size	".Lcsbs$POC-Example$65", 13

	.type	".Lcsbs$POC-Example$66",%object
".Lcsbs$POC-Example$66":
	.asciz	"layout"
	.size	".Lcsbs$POC-Example$66", 7

	.type	".L$enum_names-50",%object
	.section	.odinti,"a",%progbits
	.p2align	2, 0x0
".L$enum_names-50":
	.long	".Lcsbs$POC-Example$67"
	.long	12
	.long	".Lcsbs$POC-Example$68"
	.long	9
	.size	".L$enum_names-50", 16

	.type	".L$enum_values-50",%object
	.p2align	3, 0x0
".L$enum_values-50":
	.long	0
	.long	0
	.long	1
	.long	0
	.size	".L$enum_values-50", 16

	.type	".Lcsbs$POC-Example$67",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$67":
	.asciz	"Column_Major"
	.size	".Lcsbs$POC-Example$67", 13

	.type	".Lcsbs$POC-Example$68",%object
".Lcsbs$POC-Example$68":
	.asciz	"Row_Major"
	.size	".Lcsbs$POC-Example$68", 10

	.type	".Lcsbs$POC-Example$69",%object
".Lcsbs$POC-Example$69":
	.asciz	"backing_type"
	.size	".Lcsbs$POC-Example$69", 13

	.type	".Lcsbs$POC-Example$6a",%object
".Lcsbs$POC-Example$6a":
	.asciz	"names"
	.size	".Lcsbs$POC-Example$6a", 6

	.type	".Lcsbs$POC-Example$6b",%object
".Lcsbs$POC-Example$6b":
	.asciz	"fmt:\"v,field_count\""
	.size	".Lcsbs$POC-Example$6b", 20

	.type	".Lcsbs$POC-Example$6c",%object
".Lcsbs$POC-Example$6c":
	.asciz	"types"
	.size	".Lcsbs$POC-Example$6c", 6

	.type	".Lcsbs$POC-Example$6d",%object
".Lcsbs$POC-Example$6d":
	.asciz	"bit_sizes"
	.size	".Lcsbs$POC-Example$6d", 10

	.type	".Lcsbs$POC-Example$6e",%object
".Lcsbs$POC-Example$6e":
	.asciz	"bit_offsets"
	.size	".Lcsbs$POC-Example$6e", 12

	.type	".Lcsbs$POC-Example$6f",%object
".Lcsbs$POC-Example$6f":
	.asciz	"tags"
	.size	".Lcsbs$POC-Example$6f", 5

	.type	".Lcsbs$POC-Example$70",%object
".Lcsbs$POC-Example$70":
	.asciz	"field_count"
	.size	".Lcsbs$POC-Example$70", 12

	.type	".Lscl$[5403]",%object
	.p2align	4, 0x0
".Lscl$[5403]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	195
	.long	1
	.zero	8
	.size	".Lscl$[5403]", 24

	.type	".Lcsbs$POC-Example$71",%object
".Lcsbs$POC-Example$71":
	.asciz	"Type_Info_Bit_Field"
	.size	".Lcsbs$POC-Example$71", 20

	.type	".Lscl$[2482]",%object
	.p2align	4, 0x0
".Lscl$[2482]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	88
	.long	1
	.zero	8
	.size	".Lscl$[2482]", 24

	.type	".Lcsbs$POC-Example$72",%object
".Lcsbs$POC-Example$72":
	.asciz	"Type_Info_Multi_Pointer"
	.size	".Lcsbs$POC-Example$72", 24

	.type	".Lscl$[1409]",%object
	.p2align	4, 0x0
".Lscl$[1409]":
	.long	".Lcsbs$POC-Example$56"
	.long	45
	.long	67
	.long	1
	.zero	8
	.size	".Lscl$[1409]", 24

	.type	".Lcsbs$POC-Example$73",%object
".Lcsbs$POC-Example$73":
	.asciz	"Time"
	.size	".Lcsbs$POC-Example$73", 5

	.type	".Lscl$[5345]",%object
	.p2align	4, 0x0
".Lscl$[5345]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	192
	.long	1
	.zero	8
	.size	".Lscl$[5345]", 24

	.type	".Lcsbs$POC-Example$74",%object
".Lcsbs$POC-Example$74":
	.asciz	"Type_Info_Soa_Pointer"
	.size	".Lcsbs$POC-Example$74", 22

	.type	".Lscl$[2376]",%object
	.p2align	4, 0x0
".Lscl$[2376]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	84
	.long	1
	.zero	8
	.size	".Lscl$[2376]", 24

	.type	".Lcsbs$POC-Example$75",%object
".Lcsbs$POC-Example$75":
	.asciz	"Type_Info_Type_Id"
	.size	".Lcsbs$POC-Example$75", 18

	.type	".L$enum_names-80",%object
	.section	.odinti,"a",%progbits
	.p2align	4, 0x0
".L$enum_names-80":
	.long	".Lcsbs$POC-Example$76"
	.long	4
	.long	".Lcsbs$POC-Example$77"
	.long	5
	.long	".Lcsbs$POC-Example$78"
	.long	5
	.long	".Lcsbs$POC-Example$79"
	.long	7
	.size	".L$enum_names-80", 32

	.type	".L$enum_values-80",%object
	.p2align	4, 0x0
".L$enum_values-80":
	.long	0
	.long	0
	.long	1
	.long	0
	.long	2
	.long	0
	.long	3
	.long	0
	.size	".L$enum_values-80", 32

	.type	".Lcsbs$POC-Example$76",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$76":
	.asciz	"None"
	.size	".Lcsbs$POC-Example$76", 5

	.type	".Lcsbs$POC-Example$77",%object
".Lcsbs$POC-Example$77":
	.asciz	"Fixed"
	.size	".Lcsbs$POC-Example$77", 6

	.type	".Lcsbs$POC-Example$78",%object
".Lcsbs$POC-Example$78":
	.asciz	"Slice"
	.size	".Lcsbs$POC-Example$78", 6

	.type	".Lcsbs$POC-Example$79",%object
".Lcsbs$POC-Example$79":
	.asciz	"Dynamic"
	.size	".Lcsbs$POC-Example$79", 8

	.type	".Lcsbs$POC-Example$7a",%object
".Lcsbs$POC-Example$7a":
	.asciz	"size"
	.size	".Lcsbs$POC-Example$7a", 5

	.type	".Lcsbs$POC-Example$7b",%object
".Lcsbs$POC-Example$7b":
	.asciz	"flags"
	.size	".Lcsbs$POC-Example$7b", 6

	.type	".Lcsbs$POC-Example$7c",%object
".Lcsbs$POC-Example$7c":
	.asciz	"id"
	.size	".Lcsbs$POC-Example$7c", 3

	.type	".Lcsbs$POC-Example$7d",%object
".Lcsbs$POC-Example$7d":
	.asciz	"variant"
	.size	".Lcsbs$POC-Example$7d", 8

	.type	".Lscl$[961]",%object
	.p2align	4, 0x0
".Lscl$[961]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	27
	.long	1
	.zero	8
	.size	".Lscl$[961]", 24

	.type	".Lcsbs$POC-Example$7e",%object
".Lcsbs$POC-Example$7e":
	.asciz	"Calling_Convention"
	.size	".Lcsbs$POC-Example$7e", 19

	.type	".Lscl$[2213]",%object
	.p2align	4, 0x0
".Lscl$[2213]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	81
	.long	1
	.zero	8
	.size	".Lscl$[2213]", 24

	.type	".Lcsbs$POC-Example$7f",%object
".Lcsbs$POC-Example$7f":
	.asciz	"Type_Info_String"
	.size	".Lcsbs$POC-Example$7f", 17

	.type	".L$enum_names-96",%object
	.section	.odinti,"a",%progbits
	.p2align	2, 0x0
".L$enum_names-96":
	.long	".Lcsbs$POC-Example$80"
	.long	10
	.long	".Lcsbs$POC-Example$81"
	.long	14
	.size	".L$enum_names-96", 16

	.type	".L$enum_values-96",%object
	.p2align	3, 0x0
".L$enum_values-96":
	.long	0
	.long	0
	.long	1
	.long	0
	.size	".L$enum_values-96", 16

	.type	".Lcsbs$POC-Example$80",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$80":
	.asciz	"Comparable"
	.size	".Lcsbs$POC-Example$80", 11

	.type	".Lcsbs$POC-Example$81",%object
".Lcsbs$POC-Example$81":
	.asciz	"Simple_Compare"
	.size	".Lcsbs$POC-Example$81", 15

	.type	".Lcsbs$POC-Example$82",%object
".Lcsbs$POC-Example$82":
	.asciz	"C:/Users/King-/langs/Odin/base/runtime/core_builtin.odin"
	.size	".Lcsbs$POC-Example$82", 57

	.type	".Lscl$[66]",%object
	.p2align	4, 0x0
".Lscl$[66]":
	.long	".Lcsbs$POC-Example$82"
	.long	56
	.long	6
	.long	10
	.zero	8
	.size	".Lscl$[66]", 24

	.type	".Lcsbs$POC-Example$83",%object
".Lcsbs$POC-Example$83":
	.asciz	"Maybe($T=int)"
	.size	".Lcsbs$POC-Example$83", 14

	.type	".Lscl$[7295]",%object
	.p2align	4, 0x0
".Lscl$[7295]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	272
	.long	1
	.zero	8
	.size	".Lscl$[7295]", 24

	.type	".Lcsbs$POC-Example$84",%object
".Lcsbs$POC-Example$84":
	.asciz	"Source_Code_Location"
	.size	".Lcsbs$POC-Example$84", 21

	.type	".Lscl$[2825]",%object
	.p2align	4, 0x0
".Lscl$[2825]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	102
	.long	1
	.zero	8
	.size	".Lscl$[2825]", 24

	.type	".Lcsbs$POC-Example$85",%object
".Lcsbs$POC-Example$85":
	.asciz	"Type_Info_Enumerated_Array"
	.size	".Lcsbs$POC-Example$85", 27

	.type	".Lscl$[4173]",%object
	.p2align	4, 0x0
".Lscl$[4173]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	147
	.long	1
	.zero	8
	.size	".Lscl$[4173]", 24

	.type	".Lcsbs$POC-Example$86",%object
".Lcsbs$POC-Example$86":
	.asciz	"Type_Info_Union"
	.size	".Lcsbs$POC-Example$86", 16

	.type	".Lcsbs$POC-Example$87",%object
".Lcsbs$POC-Example$87":
	.asciz	"size_of_type"
	.size	".Lcsbs$POC-Example$87", 13

	.type	".Lcsbs$POC-Example$88",%object
".Lcsbs$POC-Example$88":
	.asciz	"align_of_type"
	.size	".Lcsbs$POC-Example$88", 14

	.type	".Lcsbs$POC-Example$89",%object
".Lcsbs$POC-Example$89":
	.asciz	"size_of_cell"
	.size	".Lcsbs$POC-Example$89", 13

	.type	".Lcsbs$POC-Example$8a",%object
".Lcsbs$POC-Example$8a":
	.asciz	"elements_per_cell"
	.size	".Lcsbs$POC-Example$8a", 18

	.type	".Lscl$[2143]",%object
	.p2align	4, 0x0
".Lscl$[2143]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	79
	.long	1
	.zero	8
	.size	".Lscl$[2143]", 24

	.type	".Lcsbs$POC-Example$8b",%object
".Lcsbs$POC-Example$8b":
	.asciz	"Type_Info_Complex"
	.size	".Lcsbs$POC-Example$8b", 18

	.type	".Lcsbs$POC-Example$8c",%object
".Lcsbs$POC-Example$8c":
	.asciz	"is_cstring"
	.size	".Lcsbs$POC-Example$8c", 11

	.type	".Lcsbs$POC-Example$8d",%object
".Lcsbs$POC-Example$8d":
	.asciz	"encoding"
	.size	".Lcsbs$POC-Example$8d", 9

	.type	".Lscl$[2306]",%object
	.p2align	4, 0x0
".Lscl$[2306]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	82
	.long	1
	.zero	8
	.size	".Lscl$[2306]", 24

	.type	".Lcsbs$POC-Example$8e",%object
".Lcsbs$POC-Example$8e":
	.asciz	"Type_Info_Boolean"
	.size	".Lcsbs$POC-Example$8e", 18

	.type	".Lcsbs$POC-Example$8f",%object
".Lcsbs$POC-Example$8f":
	.asciz	"T"
	.size	".Lcsbs$POC-Example$8f", 2

	.type	".L$enum_names-139",%object
	.section	.odinti,"a",%progbits
	.p2align	2, 0x0
".L$enum_names-139":
	.long	".Lcsbs$POC-Example$90"
	.long	5
	.long	".Lcsbs$POC-Example$91"
	.long	6
	.size	".L$enum_names-139", 16

	.type	".L$enum_values-139",%object
	.p2align	3, 0x0
".L$enum_values-139":
	.long	0
	.long	0
	.long	1
	.long	0
	.size	".L$enum_values-139", 16

	.type	".Lcsbs$POC-Example$90",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$90":
	.asciz	"UTF_8"
	.size	".Lcsbs$POC-Example$90", 6

	.type	".Lcsbs$POC-Example$91",%object
".Lcsbs$POC-Example$91":
	.asciz	"UTF_16"
	.size	".Lcsbs$POC-Example$91", 7

	.type	".Lscl$[2042]",%object
	.p2align	4, 0x0
".Lscl$[2042]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	77
	.long	1
	.zero	8
	.size	".Lscl$[2042]", 24

	.type	".Lcsbs$POC-Example$92",%object
".Lcsbs$POC-Example$92":
	.asciz	"Type_Info_Rune"
	.size	".Lcsbs$POC-Example$92", 15

	.type	".Lcsbs$POC-Example$93",%object
".Lcsbs$POC-Example$93":
	.asciz	"ks"
	.size	".Lcsbs$POC-Example$93", 3

	.type	".Lcsbs$POC-Example$94",%object
".Lcsbs$POC-Example$94":
	.asciz	"vs"
	.size	".Lcsbs$POC-Example$94", 3

	.type	".Lcsbs$POC-Example$95",%object
".Lcsbs$POC-Example$95":
	.asciz	"key_hasher"
	.size	".Lcsbs$POC-Example$95", 11

	.type	".Lcsbs$POC-Example$96",%object
".Lcsbs$POC-Example$96":
	.asciz	"key_equal"
	.size	".Lcsbs$POC-Example$96", 10

	.type	".Lcsbs$POC-Example$97",%object
".Lcsbs$POC-Example$97":
	.asciz	"_"
	.size	".Lcsbs$POC-Example$97", 2

	.type	".Lcsbs$POC-Example$98",%object
".Lcsbs$POC-Example$98":
	.asciz	"C:/Users/King-/langs/Odin/base/runtime/dynamic_map_internal.odin"
	.size	".Lcsbs$POC-Example$98", 65

	.type	".Lscl$[12605]",%object
	.p2align	4, 0x0
".Lscl$[12605]":
	.long	".Lcsbs$POC-Example$98"
	.long	64
	.long	300
	.long	1
	.zero	8
	.size	".Lscl$[12605]", 24

	.type	".Lcsbs$POC-Example$99",%object
".Lcsbs$POC-Example$99":
	.asciz	"Map_Info"
	.size	".Lcsbs$POC-Example$99", 9

	.type	".Lscl$[5008]",%object
	.p2align	4, 0x0
".Lscl$[5008]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	180
	.long	1
	.zero	8
	.size	".Lscl$[5008]", 24

	.type	".Lcsbs$POC-Example$9a",%object
".Lcsbs$POC-Example$9a":
	.asciz	"Type_Info_Matrix"
	.size	".Lcsbs$POC-Example$9a", 17

	.type	".Lcsbs$POC-Example$9b",%object
".Lcsbs$POC-Example$9b":
	.asciz	"name"
	.size	".Lcsbs$POC-Example$9b", 5

	.type	".Lcsbs$POC-Example$9c",%object
".Lcsbs$POC-Example$9c":
	.asciz	"base"
	.size	".Lcsbs$POC-Example$9c", 5

	.type	".Lcsbs$POC-Example$9d",%object
".Lcsbs$POC-Example$9d":
	.asciz	"pkg"
	.size	".Lcsbs$POC-Example$9d", 4

	.type	".Lcsbs$POC-Example$9e",%object
".Lcsbs$POC-Example$9e":
	.asciz	"loc"
	.size	".Lcsbs$POC-Example$9e", 4

	.type	".Lscl$[4703]",%object
	.p2align	4, 0x0
".Lscl$[4703]":
	.long	".Lcsbs$POC-Example$98"
	.long	64
	.long	97
	.long	1
	.zero	8
	.size	".Lscl$[4703]", 24

	.type	".Lcsbs$POC-Example$9f",%object
".Lcsbs$POC-Example$9f":
	.asciz	"Map_Cell_Info"
	.size	".Lcsbs$POC-Example$9f", 14

	.type	".Lscl$[1751]",%object
	.p2align	4, 0x0
".Lscl$[1751]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	64
	.long	1
	.zero	8
	.size	".Lscl$[1751]", 24

	.type	".Lcsbs$POC-Example$a0",%object
".Lcsbs$POC-Example$a0":
	.asciz	"Type_Info_String_Encoding_Kind"
	.size	".Lcsbs$POC-Example$a0", 31

	.type	".Lcsbs$POC-Example$a1",%object
".Lcsbs$POC-Example$a1":
	.asciz	"_nsec"
	.size	".Lcsbs$POC-Example$a1", 6

	.type	".L$enum_names-201",%object
	.section	.odinti,"a",%progbits
	.p2align	4, 0x0
".L$enum_names-201":
	.long	".Lcsbs$POC-Example$a2"
	.long	8
	.long	".Lcsbs$POC-Example$a3"
	.long	6
	.long	".Lcsbs$POC-Example$a4"
	.long	3
	.size	".L$enum_names-201", 24

	.type	".L$enum_values-201",%object
	.p2align	4, 0x0
".L$enum_values-201":
	.long	0
	.long	0
	.long	1
	.long	0
	.long	2
	.long	0
	.size	".L$enum_values-201", 24

	.type	".Lcsbs$POC-Example$a2",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$a2":
	.asciz	"Platform"
	.size	".Lcsbs$POC-Example$a2", 9

	.type	".Lcsbs$POC-Example$a3",%object
".Lcsbs$POC-Example$a3":
	.asciz	"Little"
	.size	".Lcsbs$POC-Example$a3", 7

	.type	".Lcsbs$POC-Example$a4",%object
".Lcsbs$POC-Example$a4":
	.asciz	"Big"
	.size	".Lcsbs$POC-Example$a4", 4

	.type	".Lscl$[5891]",%object
	.p2align	4, 0x0
".Lscl$[5891]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	211
	.long	1
	.zero	8
	.size	".Lscl$[5891]", 24

	.type	".Lcsbs$POC-Example$a5",%object
".Lcsbs$POC-Example$a5":
	.asciz	"Type_Info"
	.size	".Lcsbs$POC-Example$a5", 10

	.type	".Lcsbs$POC-Example$a6",%object
".Lcsbs$POC-Example$a6":
	.asciz	"offsets"
	.size	".Lcsbs$POC-Example$a6", 8

	.type	".Lcsbs$POC-Example$a7",%object
".Lcsbs$POC-Example$a7":
	.asciz	"usings"
	.size	".Lcsbs$POC-Example$a7", 7

	.type	".Lcsbs$POC-Example$a8",%object
".Lcsbs$POC-Example$a8":
	.asciz	"soa_kind"
	.size	".Lcsbs$POC-Example$a8", 9

	.type	".Lcsbs$POC-Example$a9",%object
".Lcsbs$POC-Example$a9":
	.asciz	"soa_len"
	.size	".Lcsbs$POC-Example$a9", 8

	.type	".Lcsbs$POC-Example$aa",%object
".Lcsbs$POC-Example$aa":
	.asciz	"soa_base_type"
	.size	".Lcsbs$POC-Example$aa", 14

	.type	".Lcsbs$POC-Example$ab",%object
".Lcsbs$POC-Example$ab":
	.asciz	"equal"
	.size	".Lcsbs$POC-Example$ab", 6

	.type	".Lcsbs$POC-Example$ac",%object
".Lcsbs$POC-Example$ac":
	.asciz	"underlying"
	.size	".Lcsbs$POC-Example$ac", 11

	.type	".Lcsbs$POC-Example$ad",%object
".Lcsbs$POC-Example$ad":
	.asciz	"explicit_underlying"
	.size	".Lcsbs$POC-Example$ad", 20

	.type	".Lcsbs$POC-Example$ae",%object
".Lcsbs$POC-Example$ae":
	.asciz	"lower"
	.size	".Lcsbs$POC-Example$ae", 6

	.type	".Lcsbs$POC-Example$af",%object
".Lcsbs$POC-Example$af":
	.asciz	"upper"
	.size	".Lcsbs$POC-Example$af", 6

	.type	".Lcsbs$POC-Example$b0",%object
".Lcsbs$POC-Example$b0":
	.asciz	"key"
	.size	".Lcsbs$POC-Example$b0", 4

	.type	".Lcsbs$POC-Example$b1",%object
".Lcsbs$POC-Example$b1":
	.asciz	"value"
	.size	".Lcsbs$POC-Example$b1", 6

	.type	".Lcsbs$POC-Example$b2",%object
".Lcsbs$POC-Example$b2":
	.asciz	"map_info"
	.size	".Lcsbs$POC-Example$b2", 9

	.type	".Lscl$[5831]",%object
	.p2align	4, 0x0
".Lscl$[5831]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	209
	.long	1
	.zero	8
	.size	".Lscl$[5831]", 24

	.type	".Lcsbs$POC-Example$b3",%object
".Lcsbs$POC-Example$b3":
	.asciz	"Type_Info_Flags"
	.size	".Lcsbs$POC-Example$b3", 16

	.type	".Lcsbs$POC-Example$b4",%object
".Lcsbs$POC-Example$b4":
	.asciz	"seed"
	.size	".Lcsbs$POC-Example$b4", 5

	.type	".Lscl$[5755]",%object
	.p2align	4, 0x0
".Lscl$[5755]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	205
	.long	1
	.zero	8
	.size	".Lscl$[5755]", 24

	.type	".Lcsbs$POC-Example$b5",%object
".Lcsbs$POC-Example$b5":
	.asciz	"Type_Info_Flag"
	.size	".Lcsbs$POC-Example$b5", 15

	.type	".Lcsbs$POC-Example$b6",%object
".Lcsbs$POC-Example$b6":
	.asciz	"values"
	.size	".Lcsbs$POC-Example$b6", 7

	.type	".Lscl$[1847]",%object
	.p2align	4, 0x0
".Lscl$[1847]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	70
	.long	1
	.zero	8
	.size	".Lscl$[1847]", 24

	.type	".Lcsbs$POC-Example$b7",%object
".Lcsbs$POC-Example$b7":
	.asciz	"Type_Info_Named"
	.size	".Lcsbs$POC-Example$b7", 16

	.type	".Lscl$[4906]",%object
	.p2align	4, 0x0
".Lscl$[4906]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	175
	.long	1
	.zero	8
	.size	".Lscl$[4906]", 24

	.type	".Lcsbs$POC-Example$b8",%object
".Lcsbs$POC-Example$b8":
	.asciz	"Type_Info_Simd_Vector"
	.size	".Lcsbs$POC-Example$b8", 22

	.type	".Lcsbs$POC-Example$b9",%object
".Lcsbs$POC-Example$b9":
	.asciz	"poc_example"
	.size	".Lcsbs$POC-Example$b9", 12

	.type	".Lcsbs$POC-Example$ba",%object
".Lcsbs$POC-Example$ba":
	.asciz	"C:/Users/King-/odin-projects/3dsLib/Examples/POC-Example/example.odin"
	.size	".Lcsbs$POC-Example$ba", 70

	.type	".Lscl$[333]",%object
	.p2align	4, 0x0
".Lscl$[333]":
	.long	".Lcsbs$POC-Example$ba"
	.long	69
	.long	17
	.long	1
	.zero	8
	.size	".Lscl$[333]", 24

	.type	".Lcsbs$POC-Example$bb",%object
".Lcsbs$POC-Example$bb":
	.asciz	"SampleType"
	.size	".Lcsbs$POC-Example$bb", 11

	.type	".Lscl$[2542]",%object
	.p2align	4, 0x0
".Lscl$[2542]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	91
	.long	1
	.zero	8
	.size	".Lscl$[2542]", 24

	.type	".Lcsbs$POC-Example$bc",%object
".Lcsbs$POC-Example$bc":
	.asciz	"Type_Info_Procedure"
	.size	".Lcsbs$POC-Example$bc", 20

	.type	".Lcsbs$POC-Example$bd",%object
".Lcsbs$POC-Example$bd":
	.asciz	"params"
	.size	".Lcsbs$POC-Example$bd", 7

	.type	".Lcsbs$POC-Example$be",%object
".Lcsbs$POC-Example$be":
	.asciz	"results"
	.size	".Lcsbs$POC-Example$be", 8

	.type	".Lcsbs$POC-Example$bf",%object
".Lcsbs$POC-Example$bf":
	.asciz	"variadic"
	.size	".Lcsbs$POC-Example$bf", 9

	.type	".Lcsbs$POC-Example$c0",%object
".Lcsbs$POC-Example$c0":
	.asciz	"convention"
	.size	".Lcsbs$POC-Example$c0", 11

	.type	".Lscl$[3331]",%object
	.p2align	4, 0x0
".Lscl$[3331]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	119
	.long	1
	.zero	8
	.size	".Lscl$[3331]", 24

	.type	".Lcsbs$POC-Example$c1",%object
".Lcsbs$POC-Example$c1":
	.asciz	"Type_Info_Struct_Flags"
	.size	".Lcsbs$POC-Example$c1", 23

	.type	".Lscl$[1427]",%object
	.p2align	4, 0x0
".Lscl$[1427]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	53
	.long	1
	.zero	8
	.size	".Lscl$[1427]", 24

	.type	".Lcsbs$POC-Example$c2",%object
".Lcsbs$POC-Example$c2":
	.asciz	"Equal_Proc"
	.size	".Lcsbs$POC-Example$c2", 11

	.type	".Lscl$[3043]",%object
	.p2align	4, 0x0
".Lscl$[3043]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	111
	.long	1
	.zero	8
	.size	".Lscl$[3043]", 24

	.type	".Lcsbs$POC-Example$c3",%object
".Lcsbs$POC-Example$c3":
	.asciz	"Type_Info_Dynamic_Array"
	.size	".Lcsbs$POC-Example$c3", 24

	.type	".Lscl$[3113]",%object
	.p2align	4, 0x0
".Lscl$[3113]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	112
	.long	1
	.zero	8
	.size	".Lscl$[3113]", 24

	.type	".Lcsbs$POC-Example$c4",%object
".Lcsbs$POC-Example$c4":
	.asciz	"Type_Info_Slice"
	.size	".Lcsbs$POC-Example$c4", 16

	.type	".Lscl$[1646]",%object
	.p2align	4, 0x0
".Lscl$[1646]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	57
	.long	1
	.zero	8
	.size	".Lscl$[1646]", 24

	.type	".Lcsbs$POC-Example$c5",%object
".Lcsbs$POC-Example$c5":
	.asciz	"Type_Info_Struct_Soa_Kind"
	.size	".Lcsbs$POC-Example$c5", 26

	.type	".Lcsbs$POC-Example$c6",%object
".Lcsbs$POC-Example$c6":
	.asciz	"variants"
	.size	".Lcsbs$POC-Example$c6", 9

	.type	".Lcsbs$POC-Example$c7",%object
".Lcsbs$POC-Example$c7":
	.asciz	"tag_offset"
	.size	".Lcsbs$POC-Example$c7", 11

	.type	".Lcsbs$POC-Example$c8",%object
".Lcsbs$POC-Example$c8":
	.asciz	"tag_type"
	.size	".Lcsbs$POC-Example$c8", 9

	.type	".Lcsbs$POC-Example$c9",%object
".Lcsbs$POC-Example$c9":
	.asciz	"custom_align"
	.size	".Lcsbs$POC-Example$c9", 13

	.type	".Lcsbs$POC-Example$ca",%object
".Lcsbs$POC-Example$ca":
	.asciz	"no_nil"
	.size	".Lcsbs$POC-Example$ca", 7

	.type	".Lcsbs$POC-Example$cb",%object
".Lcsbs$POC-Example$cb":
	.asciz	"shared_nil"
	.size	".Lcsbs$POC-Example$cb", 11

	.type	".Lscl$[2732]",%object
	.p2align	4, 0x0
".Lscl$[2732]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	97
	.long	1
	.zero	8
	.size	".Lscl$[2732]", 24

	.type	".Lcsbs$POC-Example$cc",%object
".Lcsbs$POC-Example$cc":
	.asciz	"Type_Info_Array"
	.size	".Lcsbs$POC-Example$cc", 16

	.type	".Lscl$[4673]",%object
	.p2align	4, 0x0
".Lscl$[4673]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	168
	.long	1
	.zero	8
	.size	".Lscl$[4673]", 24

	.type	".Lcsbs$POC-Example$cd",%object
".Lcsbs$POC-Example$cd":
	.asciz	"Type_Info_Bit_Set"
	.size	".Lcsbs$POC-Example$cd", 18

	.type	".Lscl$[2341]",%object
	.p2align	4, 0x0
".Lscl$[2341]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	83
	.long	1
	.zero	8
	.size	".Lscl$[2341]", 24

	.type	".Lcsbs$POC-Example$ce",%object
".Lcsbs$POC-Example$ce":
	.asciz	"Type_Info_Any"
	.size	".Lcsbs$POC-Example$ce", 14

	.type	".L$enum_names-280",%object
	.section	.odinti,"a",%progbits
	.p2align	2, 0x0
".L$enum_names-280":
	.long	".Lcsbs$POC-Example$cf"
	.long	7
	.size	".L$enum_names-280", 8

	.type	".L$enum_values-280",%object
	.p2align	3, 0x0
".L$enum_values-280":
	.zero	8
	.size	".L$enum_values-280", 8

	.type	".Lcsbs$POC-Example$cf",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$cf":
	.asciz	"Hellope"
	.size	".Lcsbs$POC-Example$cf", 8

	.type	".L$enum_names-302",%object
	.section	.odinti,"a",%progbits
	.p2align	4, 0x0
".L$enum_names-302":
	.long	".Lcsbs$POC-Example$d0"
	.long	7
	.long	".Lcsbs$POC-Example$d1"
	.long	4
	.long	".Lcsbs$POC-Example$d2"
	.long	11
	.long	".Lcsbs$POC-Example$d3"
	.long	5
	.long	".Lcsbs$POC-Example$d4"
	.long	8
	.long	".Lcsbs$POC-Example$d5"
	.long	9
	.long	".Lcsbs$POC-Example$76"
	.long	4
	.long	".Lcsbs$POC-Example$d6"
	.long	5
	.long	".Lcsbs$POC-Example$d7"
	.long	5
	.long	".Lcsbs$POC-Example$d8"
	.long	4
	.size	".L$enum_names-302", 80

	.type	".L$enum_values-302",%object
	.p2align	4, 0x0
".L$enum_values-302":
	.long	0
	.long	0
	.long	1
	.long	0
	.long	2
	.long	0
	.long	3
	.long	0
	.long	4
	.long	0
	.long	5
	.long	0
	.long	6
	.long	0
	.long	7
	.long	0
	.long	9
	.long	0
	.long	10
	.long	0
	.size	".L$enum_values-302", 80

	.type	".Lcsbs$POC-Example$d0",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$d0":
	.asciz	"Invalid"
	.size	".Lcsbs$POC-Example$d0", 8

	.type	".Lcsbs$POC-Example$d1",%object
".Lcsbs$POC-Example$d1":
	.asciz	"Odin"
	.size	".Lcsbs$POC-Example$d1", 5

	.type	".Lcsbs$POC-Example$d2",%object
".Lcsbs$POC-Example$d2":
	.asciz	"Contextless"
	.size	".Lcsbs$POC-Example$d2", 12

	.type	".Lcsbs$POC-Example$d3",%object
".Lcsbs$POC-Example$d3":
	.asciz	"CDecl"
	.size	".Lcsbs$POC-Example$d3", 6

	.type	".Lcsbs$POC-Example$d4",%object
".Lcsbs$POC-Example$d4":
	.asciz	"Std_Call"
	.size	".Lcsbs$POC-Example$d4", 9

	.type	".Lcsbs$POC-Example$d5",%object
".Lcsbs$POC-Example$d5":
	.asciz	"Fast_Call"
	.size	".Lcsbs$POC-Example$d5", 10

	.type	".Lcsbs$POC-Example$d6",%object
".Lcsbs$POC-Example$d6":
	.asciz	"Naked"
	.size	".Lcsbs$POC-Example$d6", 6

	.type	".Lcsbs$POC-Example$d7",%object
".Lcsbs$POC-Example$d7":
	.asciz	"Win64"
	.size	".Lcsbs$POC-Example$d7", 6

	.type	".Lcsbs$POC-Example$d8",%object
".Lcsbs$POC-Example$d8":
	.asciz	"SysV"
	.size	".Lcsbs$POC-Example$d8", 5

	.type	".Lscl$[1267]",%object
	.p2align	4, 0x0
".Lscl$[1267]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	46
	.long	1
	.zero	8
	.size	".Lscl$[1267]", 24

	.type	".Lcsbs$POC-Example$d9",%object
".Lcsbs$POC-Example$d9":
	.asciz	"Platform_Endianness"
	.size	".Lcsbs$POC-Example$d9", 20

	.type	".Lscl$[4572]",%object
	.p2align	4, 0x0
".Lscl$[4572]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	163
	.long	1
	.zero	8
	.size	".Lscl$[4572]", 24

	.type	".Lcsbs$POC-Example$da",%object
".Lcsbs$POC-Example$da":
	.asciz	"Type_Info_Map"
	.size	".Lcsbs$POC-Example$da", 14

	.type	".Lscl$[1227]",%object
	.p2align	4, 0x0
".Lscl$[1227]":
	.long	".Lcsbs$POC-Example$43"
	.long	48
	.long	44
	.long	1
	.zero	8
	.size	".Lscl$[1227]", 24

	.type	".Lcsbs$POC-Example$db",%object
".Lcsbs$POC-Example$db":
	.asciz	"Type_Info_Enum_Value"
	.size	".Lcsbs$POC-Example$db", 21

	.type	".Lcsbs$POC-Example$e0",%object
".Lcsbs$POC-Example$e0":
	.asciz	"%s"
	.size	".Lcsbs$POC-Example$e0", 3

	.type	".Lcsbs$POC-Example$e1",%object
".Lcsbs$POC-Example$e1":
	.asciz	"+ + * \360\237\230\203 - /"
	.size	".Lcsbs$POC-Example$e1", 15

	.type	".Lcsbs$POC-Example$e2",%object
".Lcsbs$POC-Example$e2":
	.asciz	"odin_main"
	.size	".Lcsbs$POC-Example$e2", 10

	.type	".Lscl$[odin_main993]",%object
	.p2align	4, 0x0
".Lscl$[odin_main993]":
	.long	".Lcsbs$POC-Example$ba"
	.long	69
	.long	45
	.long	3
	.long	".Lcsbs$POC-Example$e2"
	.long	9
	.size	".Lscl$[odin_main993]", 24

	.type	".Lcsbs$POC-Example$e4",%object
".Lcsbs$POC-Example$e4":
	.asciz	"'%v' = %v\n%v\n%v\n"
	.size	".Lcsbs$POC-Example$e4", 17

	.type	".Lcsbs$POC-Example$e5",%object
".Lcsbs$POC-Example$e5":
	.asciz	"1"
	.size	".Lcsbs$POC-Example$e5", 2

	.type	".Lcsbs$POC-Example$e6",%object
".Lcsbs$POC-Example$e6":
	.asciz	"t"
	.size	".Lcsbs$POC-Example$e6", 2

	.type	".Lcsbs$POC-Example$e7",%object
".Lcsbs$POC-Example$e7":
	.asciz	"true"
	.size	".Lcsbs$POC-Example$e7", 5

	.type	".Lcsbs$POC-Example$e8",%object
".Lcsbs$POC-Example$e8":
	.asciz	"TRUE"
	.size	".Lcsbs$POC-Example$e8", 5

	.type	".Lcsbs$POC-Example$e9",%object
".Lcsbs$POC-Example$e9":
	.asciz	"True"
	.size	".Lcsbs$POC-Example$e9", 5

	.type	".Lcsbs$POC-Example$ea",%object
".Lcsbs$POC-Example$ea":
	.asciz	"0"
	.size	".Lcsbs$POC-Example$ea", 2

	.type	".Lcsbs$POC-Example$eb",%object
".Lcsbs$POC-Example$eb":
	.asciz	"f"
	.size	".Lcsbs$POC-Example$eb", 2

	.type	".Lcsbs$POC-Example$ec",%object
".Lcsbs$POC-Example$ec":
	.asciz	"F"
	.size	".Lcsbs$POC-Example$ec", 2

	.type	".Lcsbs$POC-Example$ed",%object
".Lcsbs$POC-Example$ed":
	.asciz	"false"
	.size	".Lcsbs$POC-Example$ed", 6

	.type	".Lcsbs$POC-Example$ee",%object
".Lcsbs$POC-Example$ee":
	.asciz	"FALSE"
	.size	".Lcsbs$POC-Example$ee", 6

	.type	".Lcsbs$POC-Example$ef",%object
".Lcsbs$POC-Example$ef":
	.asciz	"False"
	.size	".Lcsbs$POC-Example$ef", 6

	.type	".Lcsbs$POC-Example$f0",%object
".Lcsbs$POC-Example$f0":
	.asciz	"is_integer_negative: Unknown integer size"
	.size	".Lcsbs$POC-Example$f0", 42

	.type	".Lcsbs$POC-Example$f1",%object
".Lcsbs$POC-Example$f1":
	.asciz	"C:/Users/King-/langs/Odin/core/strconv/integers.odin"
	.size	".Lcsbs$POC-Example$f1", 53

	.type	".Lcsbs$POC-Example$f2",%object
".Lcsbs$POC-Example$f2":
	.asciz	"is_integer_negative"
	.size	".Lcsbs$POC-Example$f2", 20

	.type	".Lscl$[is_integer_negative1101]",%object
	.p2align	4, 0x0
".Lscl$[is_integer_negative1101]":
	.long	".Lcsbs$POC-Example$f1"
	.long	52
	.long	45
	.long	4
	.long	".Lcsbs$POC-Example$f2"
	.long	19
	.size	".Lscl$[is_integer_negative1101]", 24

	.type	".Lcsbs$POC-Example$f4",%object
".Lcsbs$POC-Example$f4":
	.asciz	"strconv: invalid bit_size"
	.size	".Lcsbs$POC-Example$f4", 26

	.type	".Lcsbs$POC-Example$f5",%object
".Lcsbs$POC-Example$f5":
	.asciz	"C:/Users/King-/langs/Odin/core/strconv/generic_float.odin"
	.size	".Lcsbs$POC-Example$f5", 58

	.type	".Lcsbs$POC-Example$f6",%object
".Lcsbs$POC-Example$f6":
	.asciz	"generic_ftoa"
	.size	".Lcsbs$POC-Example$f6", 13

	.type	".Lscl$[generic_ftoa1381]",%object
	.p2align	4, 0x0
".Lscl$[generic_ftoa1381]":
	.long	".Lcsbs$POC-Example$f5"
	.long	57
	.long	60
	.long	3
	.long	".Lcsbs$POC-Example$f6"
	.long	12
	.size	".Lscl$[generic_ftoa1381]", 24

	.type	".Lcsbs$POC-Example$f7",%object
	.section	.rodata.str1.1,"aMS",%progbits,1
".Lcsbs$POC-Example$f7":
	.asciz	"NaN"
	.size	".Lcsbs$POC-Example$f7", 4

	.type	".Lcsbs$POC-Example$f8",%object
".Lcsbs$POC-Example$f8":
	.asciz	"-Inf"
	.size	".Lcsbs$POC-Example$f8", 5

	.type	".Lcsbs$POC-Example$f9",%object
".Lcsbs$POC-Example$f9":
	.asciz	"+Inf"
	.size	".Lcsbs$POC-Example$f9", 5

	.type	"runtime::default_random_generator_proc-.state-11174",%object
	.section	.tbss,"awT",%nobits
	.globl	"runtime::default_random_generator_proc-.state-11174"
	.p2align	2, 0x0
"runtime::default_random_generator_proc-.state-11174":
	.zero	1032
	.size	"runtime::default_random_generator_proc-.state-11174", 1032

	.type	".Lcsbs$POC-Example$fd",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$fd":
	.asciz	"C:/Users/King-/langs/Odin/base/runtime/random_generator_chacha8.odin"
	.size	".Lcsbs$POC-Example$fd", 69

	.type	".Lcsbs$POC-Example$fe",%object
".Lcsbs$POC-Example$fe":
	.asciz	"chacha8rand/BUG: outputed key material"
	.size	".Lcsbs$POC-Example$fe", 39

	.type	".Lcsbs$POC-Example$ff",%object
".Lcsbs$POC-Example$ff":
	.asciz	"default_random_generator_proc"
	.size	".Lcsbs$POC-Example$ff", 30

	.type	".Lscl$[default_random_generator_proc2154]",%object
	.p2align	4, 0x0
".Lscl$[default_random_generator_proc2154]":
	.long	".Lcsbs$POC-Example$fd"
	.long	68
	.long	77
	.long	3
	.long	".Lcsbs$POC-Example$ff"
	.long	29
	.size	".Lscl$[default_random_generator_proc2154]", 24

	.type	".Lcsbs$POC-Example$100",%object
".Lcsbs$POC-Example$100":
	.asciz	"chacha8rand/BUG: less than 8-bytes of output available"
	.size	".Lcsbs$POC-Example$100", 55

	.type	".Lscl$[default_random_generator_proc2479]",%object
	.p2align	4, 0x0
".Lscl$[default_random_generator_proc2479]":
	.long	".Lcsbs$POC-Example$fd"
	.long	68
	.long	86
	.long	3
	.long	".Lcsbs$POC-Example$ff"
	.long	29
	.size	".Lscl$[default_random_generator_proc2479]", 24

	.type	".Lcsbs$POC-Example$101",%object
".Lcsbs$POC-Example$101":
	.asciz	"chacha8rand/BUG: buffered output is not a multiple of 8-bytes"
	.size	".Lcsbs$POC-Example$101", 62

	.type	".Lscl$[default_random_generator_proc2581]",%object
	.p2align	4, 0x0
".Lscl$[default_random_generator_proc2581]":
	.long	".Lcsbs$POC-Example$fd"
	.long	68
	.long	87
	.long	3
	.long	".Lcsbs$POC-Example$ff"
	.long	29
	.size	".Lscl$[default_random_generator_proc2581]", 24

	.type	".Lcsbs$POC-Example$104",%object
".Lcsbs$POC-Example$104":
	.asciz	"C:/Users/King-/langs/Odin/core/unicode/utf8/utf8.odin"
	.size	".Lcsbs$POC-Example$104", 54

	.type	".Lcsbs$POC-Example$107",%object
".Lcsbs$POC-Example$107":
	.asciz	"C:/Users/King-/langs/Odin/core/strconv/strconv.odin"
	.size	".Lcsbs$POC-Example$107", 52

	.type	".Lcsbs$POC-Example$108",%object
".Lcsbs$POC-Example$108":
	.asciz	"C:/Users/King-/langs/Odin/core/strconv/decimal/decimal.odin"
	.size	".Lcsbs$POC-Example$108", 60

	.type	".Lcsbs$POC-Example$109",%object
".Lcsbs$POC-Example$109":
	.asciz	"\\a"
	.size	".Lcsbs$POC-Example$109", 3

	.type	".Lcsbs$POC-Example$10a",%object
".Lcsbs$POC-Example$10a":
	.asciz	"\\b"
	.size	".Lcsbs$POC-Example$10a", 3

	.type	".Lcsbs$POC-Example$10b",%object
".Lcsbs$POC-Example$10b":
	.asciz	"\\e"
	.size	".Lcsbs$POC-Example$10b", 3

	.type	".Lcsbs$POC-Example$10c",%object
".Lcsbs$POC-Example$10c":
	.asciz	"\\f"
	.size	".Lcsbs$POC-Example$10c", 3

	.type	".Lcsbs$POC-Example$10d",%object
".Lcsbs$POC-Example$10d":
	.asciz	"\\n"
	.size	".Lcsbs$POC-Example$10d", 3

	.type	".Lcsbs$POC-Example$10e",%object
".Lcsbs$POC-Example$10e":
	.asciz	"\\r"
	.size	".Lcsbs$POC-Example$10e", 3

	.type	".Lcsbs$POC-Example$10f",%object
".Lcsbs$POC-Example$10f":
	.asciz	"\\t"
	.size	".Lcsbs$POC-Example$10f", 3

	.type	".Lcsbs$POC-Example$110",%object
".Lcsbs$POC-Example$110":
	.asciz	"\\v"
	.size	".Lcsbs$POC-Example$110", 3

	.type	".Lcsbs$POC-Example$111",%object
	.section	.rodata.str1.1,"aMS",%progbits,1
".Lcsbs$POC-Example$111":
	.asciz	"\\x00"
	.size	".Lcsbs$POC-Example$111", 5

	.type	".Lcsbs$POC-Example$112",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$112":
	.asciz	"\\x"
	.size	".Lcsbs$POC-Example$112", 3

	.type	".Lcsbs$POC-Example$113",%object
".Lcsbs$POC-Example$113":
	.asciz	"C:/Users/King-/langs/Odin/base/runtime/print.odin"
	.size	".Lcsbs$POC-Example$113", 50

	.type	".Lcsbs$POC-Example$114",%object
".Lcsbs$POC-Example$114":
	.asciz	"00"
	.size	".Lcsbs$POC-Example$114", 3

	.type	".Lcsbs$POC-Example$115",%object
".Lcsbs$POC-Example$115":
	.asciz	"chacha8rand/BUG: unseeded refill"
	.size	".Lcsbs$POC-Example$115", 33

	.type	".Lcsbs$POC-Example$116",%object
".Lcsbs$POC-Example$116":
	.asciz	"chacha8rand_refill"
	.size	".Lcsbs$POC-Example$116", 19

	.type	".Lscl$[chacha8rand_refill4437]",%object
	.p2align	4, 0x0
".Lscl$[chacha8rand_refill4437]":
	.long	".Lcsbs$POC-Example$fd"
	.long	68
	.long	151
	.long	2
	.long	".Lcsbs$POC-Example$116"
	.long	18
	.size	".Lscl$[chacha8rand_refill4437]", 24

	.type	".Lcsbs$POC-Example$118",%object
".Lcsbs$POC-Example$118":
	.asciz	"C:/Users/King-/langs/Odin/core/io/util.odin"
	.size	".Lcsbs$POC-Example$118", 44

	.type	".Lcsbs$POC-Example$119",%object
".Lcsbs$POC-Example$119":
	.asciz	"C:/Users/King-/langs/Odin/core/strings/builder.odin"
	.size	".Lcsbs$POC-Example$119", 52

	.type	".Lcsbs$POC-Example$11a",%object
".Lcsbs$POC-Example$11a":
	.asciz	"_builder_stream_proc"
	.size	".Lcsbs$POC-Example$11a", 21

	.type	".Lscl$[_builder_stream_proc5347]",%object
	.p2align	4, 0x0
".Lscl$[_builder_stream_proc5347]":
	.long	".Lcsbs$POC-Example$119"
	.long	51
	.long	170
	.long	11
	.long	".Lcsbs$POC-Example$11a"
	.long	20
	.size	".Lscl$[_builder_stream_proc5347]", 24

	.type	".Lcsbs$POC-Example$11b",%object
".Lcsbs$POC-Example$11b":
	.asciz	"C:/Users/King-/langs/Odin/base/runtime/internal.odin"
	.size	".Lcsbs$POC-Example$11b", 53

	.type	".Lcsbs$POC-Example$11c",%object
".Lcsbs$POC-Example$11c":
	.asciz	"nil"
	.size	".Lcsbs$POC-Example$11c", 4

	.type	".Lcsbs$POC-Example$11d",%object
".Lcsbs$POC-Example$11d":
	.asciz	"int"
	.size	".Lcsbs$POC-Example$11d", 4

	.type	".Lcsbs$POC-Example$11e",%object
".Lcsbs$POC-Example$11e":
	.asciz	"uint"
	.size	".Lcsbs$POC-Example$11e", 5

	.type	".Lcsbs$POC-Example$11f",%object
".Lcsbs$POC-Example$11f":
	.asciz	"uintptr"
	.size	".Lcsbs$POC-Example$11f", 8

	.type	".Lcsbs$POC-Example$120",%object
".Lcsbs$POC-Example$120":
	.asciz	"le"
	.size	".Lcsbs$POC-Example$120", 3

	.type	".Lcsbs$POC-Example$121",%object
".Lcsbs$POC-Example$121":
	.asciz	"be"
	.size	".Lcsbs$POC-Example$121", 3

	.type	".Lcsbs$POC-Example$122",%object
".Lcsbs$POC-Example$122":
	.asciz	"rune"
	.size	".Lcsbs$POC-Example$122", 5

	.type	".Lcsbs$POC-Example$123",%object
".Lcsbs$POC-Example$123":
	.asciz	"complex"
	.size	".Lcsbs$POC-Example$123", 8

	.type	".Lcsbs$POC-Example$124",%object
".Lcsbs$POC-Example$124":
	.asciz	"quaternion"
	.size	".Lcsbs$POC-Example$124", 11

	.type	".Lcsbs$POC-Example$125",%object
".Lcsbs$POC-Example$125":
	.asciz	"string"
	.size	".Lcsbs$POC-Example$125", 7

	.type	".Lcsbs$POC-Example$126",%object
".Lcsbs$POC-Example$126":
	.asciz	"16"
	.size	".Lcsbs$POC-Example$126", 3

	.type	".Lcsbs$POC-Example$127",%object
".Lcsbs$POC-Example$127":
	.asciz	"bool"
	.size	".Lcsbs$POC-Example$127", 5

	.type	".Lcsbs$POC-Example$128",%object
".Lcsbs$POC-Example$128":
	.asciz	"any"
	.size	".Lcsbs$POC-Example$128", 4

	.type	".Lcsbs$POC-Example$129",%object
".Lcsbs$POC-Example$129":
	.asciz	"typeid"
	.size	".Lcsbs$POC-Example$129", 7

	.type	".Lcsbs$POC-Example$12a",%object
".Lcsbs$POC-Example$12a":
	.asciz	"rawptr"
	.size	".Lcsbs$POC-Example$12a", 7

	.type	".Lcsbs$POC-Example$12b",%object
".Lcsbs$POC-Example$12b":
	.asciz	"^"
	.size	".Lcsbs$POC-Example$12b", 2

	.type	".Lcsbs$POC-Example$12c",%object
".Lcsbs$POC-Example$12c":
	.asciz	"[^]"
	.size	".Lcsbs$POC-Example$12c", 4

	.type	".Lcsbs$POC-Example$12d",%object
".Lcsbs$POC-Example$12d":
	.asciz	"#soa ^"
	.size	".Lcsbs$POC-Example$12d", 7

	.type	".Lcsbs$POC-Example$12e",%object
".Lcsbs$POC-Example$12e":
	.asciz	"proc"
	.size	".Lcsbs$POC-Example$12e", 5

	.type	".Lcsbs$POC-Example$12f",%object
".Lcsbs$POC-Example$12f":
	.asciz	"()"
	.size	".Lcsbs$POC-Example$12f", 3

	.type	".Lcsbs$POC-Example$130",%object
".Lcsbs$POC-Example$130":
	.asciz	", "
	.size	".Lcsbs$POC-Example$130", 3

	.type	".Lcsbs$POC-Example$131",%object
".Lcsbs$POC-Example$131":
	.asciz	")"
	.size	".Lcsbs$POC-Example$131", 2

	.type	".Lcsbs$POC-Example$132",%object
".Lcsbs$POC-Example$132":
	.asciz	" -> "
	.size	".Lcsbs$POC-Example$132", 5

	.type	".Lcsbs$POC-Example$133",%object
".Lcsbs$POC-Example$133":
	.asciz	": "
	.size	".Lcsbs$POC-Example$133", 3

	.type	".Lcsbs$POC-Example$134",%object
".Lcsbs$POC-Example$134":
	.asciz	"#sparse"
	.size	".Lcsbs$POC-Example$134", 8

	.type	".Lcsbs$POC-Example$135",%object
".Lcsbs$POC-Example$135":
	.asciz	"[dynamic]"
	.size	".Lcsbs$POC-Example$135", 10

	.type	".Lcsbs$POC-Example$136",%object
".Lcsbs$POC-Example$136":
	.asciz	"[]"
	.size	".Lcsbs$POC-Example$136", 3

	.type	".Lcsbs$POC-Example$137",%object
".Lcsbs$POC-Example$137":
	.asciz	"map["
	.size	".Lcsbs$POC-Example$137", 5

	.type	".Lcsbs$POC-Example$138",%object
".Lcsbs$POC-Example$138":
	.asciz	"#soa["
	.size	".Lcsbs$POC-Example$138", 6

	.type	".Lcsbs$POC-Example$139",%object
".Lcsbs$POC-Example$139":
	.asciz	"#soa[]"
	.size	".Lcsbs$POC-Example$139", 7

	.type	".Lcsbs$POC-Example$13a",%object
".Lcsbs$POC-Example$13a":
	.asciz	"#soa[dynamic]"
	.size	".Lcsbs$POC-Example$13a", 14

	.type	".Lcsbs$POC-Example$13b",%object
".Lcsbs$POC-Example$13b":
	.asciz	"struct "
	.size	".Lcsbs$POC-Example$13b", 8

	.type	".Lcsbs$POC-Example$13c",%object
".Lcsbs$POC-Example$13c":
	.asciz	"#packed "
	.size	".Lcsbs$POC-Example$13c", 9

	.type	".Lcsbs$POC-Example$13d",%object
".Lcsbs$POC-Example$13d":
	.asciz	"#raw_union "
	.size	".Lcsbs$POC-Example$13d", 12

	.type	".Lcsbs$POC-Example$13e",%object
".Lcsbs$POC-Example$13e":
	.asciz	"#all_or_none "
	.size	".Lcsbs$POC-Example$13e", 14

	.type	".Lcsbs$POC-Example$13f",%object
".Lcsbs$POC-Example$13f":
	.asciz	"#simple "
	.size	".Lcsbs$POC-Example$13f", 9

	.type	".Lcsbs$POC-Example$140",%object
".Lcsbs$POC-Example$140":
	.asciz	"#align("
	.size	".Lcsbs$POC-Example$140", 8

	.type	".Lcsbs$POC-Example$141",%object
".Lcsbs$POC-Example$141":
	.asciz	") "
	.size	".Lcsbs$POC-Example$141", 3

	.type	".Lcsbs$POC-Example$142",%object
".Lcsbs$POC-Example$142":
	.asciz	"union "
	.size	".Lcsbs$POC-Example$142", 7

	.type	".Lcsbs$POC-Example$143",%object
".Lcsbs$POC-Example$143":
	.asciz	"#no_nil "
	.size	".Lcsbs$POC-Example$143", 9

	.type	".Lcsbs$POC-Example$144",%object
".Lcsbs$POC-Example$144":
	.asciz	"}"
	.size	".Lcsbs$POC-Example$144", 2

	.type	".Lcsbs$POC-Example$145",%object
".Lcsbs$POC-Example$145":
	.asciz	"enum "
	.size	".Lcsbs$POC-Example$145", 6

	.type	".Lcsbs$POC-Example$146",%object
".Lcsbs$POC-Example$146":
	.asciz	" {"
	.size	".Lcsbs$POC-Example$146", 3

	.type	".Lcsbs$POC-Example$147",%object
".Lcsbs$POC-Example$147":
	.asciz	"bit_set["
	.size	".Lcsbs$POC-Example$147", 9

	.type	".Lcsbs$POC-Example$148",%object
".Lcsbs$POC-Example$148":
	.asciz	".."
	.size	".Lcsbs$POC-Example$148", 3

	.type	".Lcsbs$POC-Example$149",%object
".Lcsbs$POC-Example$149":
	.asciz	"; "
	.size	".Lcsbs$POC-Example$149", 3

	.type	".Lcsbs$POC-Example$14a",%object
".Lcsbs$POC-Example$14a":
	.asciz	"bit_field "
	.size	".Lcsbs$POC-Example$14a", 11

	.type	".Lcsbs$POC-Example$14b",%object
".Lcsbs$POC-Example$14b":
	.asciz	" | "
	.size	".Lcsbs$POC-Example$14b", 4

	.type	".Lcsbs$POC-Example$14c",%object
".Lcsbs$POC-Example$14c":
	.asciz	"#simd["
	.size	".Lcsbs$POC-Example$14c", 7

	.type	".Lcsbs$POC-Example$14d",%object
".Lcsbs$POC-Example$14d":
	.asciz	"#row_major "
	.size	".Lcsbs$POC-Example$14d", 12

	.type	".Lcsbs$POC-Example$14e",%object
".Lcsbs$POC-Example$14e":
	.asciz	"matrix["
	.size	".Lcsbs$POC-Example$14e", 8

	.type	".Lcsbs$POC-Example$14f",%object
".Lcsbs$POC-Example$14f":
	.asciz	"]"
	.size	".Lcsbs$POC-Example$14f", 2

	.type	".Lcsbs$POC-Example$150",%object
".Lcsbs$POC-Example$150":
	.asciz	"builder_destroy"
	.size	".Lcsbs$POC-Example$150", 16

	.type	".Lscl$[builder_destroy6211]",%object
	.p2align	4, 0x0
".Lscl$[builder_destroy6211]":
	.long	".Lcsbs$POC-Example$119"
	.long	51
	.long	218
	.long	2
	.long	".Lcsbs$POC-Example$150"
	.long	15
	.size	".Lscl$[builder_destroy6211]", 24

	.type	".Lcsbs$POC-Example$151",%object
".Lcsbs$POC-Example$151":
	.asciz	"C:/Users/King-/langs/Odin/base/runtime/error_checks.odin"
	.size	".Lcsbs$POC-Example$151", 57

	.type	".Lcsbs$POC-Example$154",%object
".Lcsbs$POC-Example$154":
	.asciz	"C:/Users/King-/langs/Odin/core/io/io.odin"
	.size	".Lcsbs$POC-Example$154", 42

	.type	".Lcsbs$POC-Example$156",%object
".Lcsbs$POC-Example$156":
	.asciz	"C:/Users/King-/langs/Odin/core/fmt/fmt.odin"
	.size	".Lcsbs$POC-Example$156", 44

	.type	".Lcsbs$POC-Example$157",%object
".Lcsbs$POC-Example$157":
	.asciz	"caprintf"
	.size	".Lcsbs$POC-Example$157", 9

	.type	".Lscl$[caprintf12739]",%object
	.p2align	4, 0x0
".Lscl$[caprintf12739]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	402
	.long	2
	.long	".Lcsbs$POC-Example$157"
	.long	8
	.size	".Lscl$[caprintf12739]", 24

	.type	".Lscl$[caprintf12827]",%object
	.p2align	4, 0x0
".Lscl$[caprintf12827]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	404
	.long	2
	.long	".Lcsbs$POC-Example$157"
	.long	8
	.size	".Lscl$[caprintf12827]", 24

	.type	".Lcsbs$POC-Example$158",%object
".Lcsbs$POC-Example$158":
	.asciz	"C:/Users/King-/langs/Odin/core/reflect/reflect.odin"
	.size	".Lcsbs$POC-Example$158", 52

	.type	".Lcsbs$POC-Example$15f",%object
".Lcsbs$POC-Example$15f":
	.asciz	"C:/Users/King-/langs/Odin/core/reflect/types.odin"
	.size	".Lcsbs$POC-Example$15f", 50

	.type	".Lcsbs$POC-Example$160",%object
".Lcsbs$POC-Example$160":
	.asciz	"("
	.size	".Lcsbs$POC-Example$160", 2

	.type	".Lcsbs$POC-Example$161",%object
".Lcsbs$POC-Example$161":
	.asciz	"["
	.size	".Lcsbs$POC-Example$161", 2

	.type	".Lcsbs$POC-Example$162",%object
".Lcsbs$POC-Example$162":
	.asciz	"#shared_nil "
	.size	".Lcsbs$POC-Example$162", 13

	.type	".Lcsbs$POC-Example$163",%object
".Lcsbs$POC-Example$163":
	.asciz	"..="
	.size	".Lcsbs$POC-Example$163", 4

	.type	".Lcsbs$POC-Example$166",%object
".Lcsbs$POC-Example$166":
	.asciz	"%!(NO VERB)"
	.size	".Lcsbs$POC-Example$166", 12

	.type	".Lcsbs$POC-Example$167",%object
".Lcsbs$POC-Example$167":
	.asciz	"%!(MISSING CLOSE BRACE)"
	.size	".Lcsbs$POC-Example$167", 24

	.type	".Lcsbs$POC-Example$168",%object
".Lcsbs$POC-Example$168":
	.asciz	"%!(EXTRA "
	.size	".Lcsbs$POC-Example$168", 10

	.type	".Lcsbs$POC-Example$169",%object
".Lcsbs$POC-Example$169":
	.asciz	"<nil>"
	.size	".Lcsbs$POC-Example$169", 6

	.type	".Lcsbs$POC-Example$16b",%object
".Lcsbs$POC-Example$16b":
	.asciz	"expected an enum to reflect.enum_string"
	.size	".Lcsbs$POC-Example$16b", 40

	.type	".Lcsbs$POC-Example$16c",%object
".Lcsbs$POC-Example$16c":
	.asciz	"enum_string"
	.size	".Lcsbs$POC-Example$16c", 12

	.type	".Lscl$[enum_string21545]",%object
	.p2align	4, 0x0
".Lscl$[enum_string21545]":
	.long	".Lcsbs$POC-Example$158"
	.long	51
	.long	767
	.long	3
	.long	".Lcsbs$POC-Example$16c"
	.long	11
	.size	".Lscl$[enum_string21545]", 24

	.type	".Lcsbs$POC-Example$16d",%object
".Lcsbs$POC-Example$16d":
	.asciz	"data != nil"
	.size	".Lcsbs$POC-Example$16d", 12

	.type	"runtime::string_decode_rune-.accept_sizes-11694",%object
"runtime::string_decode_rune-.accept_sizes-11694":
	.ascii	"\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\360\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\361\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\023\003\003\003\003\003\003\003\003\003\003\003\003#\003\0034\004\004\004D\361\361\361\361\361\361\361\361\361\361\361"
	.size	"runtime::string_decode_rune-.accept_sizes-11694", 256

	.type	"runtime::string_decode_rune-.accept_ranges-12021",%object
"runtime::string_decode_rune-.accept_ranges-12021":
	.byte	128
	.byte	191
	.byte	160
	.byte	191
	.byte	128
	.byte	159
	.byte	144
	.byte	191
	.byte	128
	.byte	143
	.size	"runtime::string_decode_rune-.accept_ranges-12021", 10

	.type	".Lcsbs$POC-Example$16e",%object
".Lcsbs$POC-Example$16e":
	.asciz	"C:/Users/King-/langs/Odin/core/strings/strings.odin"
	.size	".Lcsbs$POC-Example$16e", 52

	.type	".Lcsbs$POC-Example$16f",%object
".Lcsbs$POC-Example$16f":
	.asciz	"%!"
	.size	".Lcsbs$POC-Example$16f", 3

	.type	".Lcsbs$POC-Example$170",%object
".Lcsbs$POC-Example$170":
	.asciz	"_fmt_int: buffer overrun. Width and precision too big"
	.size	".Lcsbs$POC-Example$170", 54

	.type	".Lcsbs$POC-Example$171",%object
".Lcsbs$POC-Example$171":
	.asciz	"_fmt_int"
	.size	".Lcsbs$POC-Example$171", 9

	.type	".Lscl$[_fmt_int30347]",%object
	.p2align	4, 0x0
".Lscl$[_fmt_int30347]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	1068
	.long	4
	.long	".Lcsbs$POC-Example$171"
	.long	8
	.size	".Lscl$[_fmt_int30347]", 24

	.type	".Lcsbs$POC-Example$172",%object
".Lcsbs$POC-Example$172":
	.asciz	"_fmt_int: unknown base, whoops"
	.size	".Lcsbs$POC-Example$172", 31

	.type	".Lscl$[_fmt_int31242]",%object
	.p2align	4, 0x0
".Lscl$[_fmt_int31242]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	1118
	.long	3
	.long	".Lcsbs$POC-Example$171"
	.long	8
	.size	".Lscl$[_fmt_int31242]", 24

	.type	".Lcsbs$POC-Example$173",%object
".Lcsbs$POC-Example$173":
	.asciz	"_fmt_int_128"
	.size	".Lcsbs$POC-Example$173", 13

	.type	".Lscl$[_fmt_int_12832521]",%object
	.p2align	4, 0x0
".Lscl$[_fmt_int_12832521]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	1150
	.long	4
	.long	".Lcsbs$POC-Example$173"
	.long	12
	.size	".Lscl$[_fmt_int_12832521]", 24

	.type	".Lscl$[_fmt_int_12833411]",%object
	.p2align	4, 0x0
".Lscl$[_fmt_int_12833411]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	1200
	.long	3
	.long	".Lcsbs$POC-Example$173"
	.long	12
	.size	".Lscl$[_fmt_int_12833411]", 24

	.type	".Lcsbs$POC-Example$174",%object
".Lcsbs$POC-Example$174":
	.asciz	"a.allocator.procedure != nil"
	.size	".Lcsbs$POC-Example$174", 29

	.type	".Lcsbs$POC-Example$175",%object
".Lcsbs$POC-Example$175":
	.asciz	"_reserve_dynamic_array"
	.size	".Lcsbs$POC-Example$175", 23

	.type	".Lscl$[_reserve_dynamic_array33450]",%object
	.p2align	4, 0x0
".Lscl$[_reserve_dynamic_array33450]":
	.long	".Lcsbs$POC-Example$82"
	.long	56
	.long	896
	.long	3
	.long	".Lcsbs$POC-Example$175"
	.long	22
	.size	".Lscl$[_reserve_dynamic_array33450]", 24

	.type	".Lcsbs$POC-Example$176",%object
".Lcsbs$POC-Example$176":
	.asciz	"U+"
	.size	".Lcsbs$POC-Example$176", 3

	.type	".Lcsbs$POC-Example$177",%object
".Lcsbs$POC-Example$177":
	.asciz	"Unhandled float size"
	.size	".Lcsbs$POC-Example$177", 21

	.type	".Lcsbs$POC-Example$178",%object
".Lcsbs$POC-Example$178":
	.asciz	"fmt_float"
	.size	".Lcsbs$POC-Example$178", 10

	.type	".Lscl$[fmt_float41672]",%object
	.p2align	4, 0x0
".Lscl$[fmt_float41672]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	1468
	.long	9
	.long	".Lcsbs$POC-Example$178"
	.long	9
	.size	".Lscl$[fmt_float41672]", 24

	.type	".Lcsbs$POC-Example$179",%object
".Lcsbs$POC-Example$179":
	.asciz	"0h"
	.size	".Lcsbs$POC-Example$179", 3

	.type	".Lcsbs$POC-Example$17b",%object
".Lcsbs$POC-Example$17b":
	.asciz	"panic"
	.size	".Lcsbs$POC-Example$17b", 6

	.type	".Lcsbs$POC-Example$17d",%object
".Lcsbs$POC-Example$17d":
	.asciz	"Out of bounds memory address passed to Small Stack allocator. (free)"
	.size	".Lcsbs$POC-Example$17d", 69

	.type	".Lcsbs$POC-Example$17e",%object
".Lcsbs$POC-Example$17e":
	.asciz	"0x"
	.size	".Lcsbs$POC-Example$17e", 3

	.type	".Lcsbs$POC-Example$17f",%object
".Lcsbs$POC-Example$17f":
	.asciz	"C:/Users/King-/langs/Odin/core/mem/allocators.odin"
	.size	".Lcsbs$POC-Example$17f", 51

	.type	".Lcsbs$POC-Example$180",%object
".Lcsbs$POC-Example$180":
	.asciz	"#soa{data=0x"
	.size	".Lcsbs$POC-Example$180", 13

	.type	".Lcsbs$POC-Example$181",%object
".Lcsbs$POC-Example$181":
	.asciz	", index="
	.size	".Lcsbs$POC-Example$181", 9

	.type	".Lcsbs$POC-Example$182",%object
".Lcsbs$POC-Example$182":
	.asciz	"Resize on an uninitialized Small Stack allocator."
	.size	".Lcsbs$POC-Example$182", 50

	.type	".Lcsbs$POC-Example$183",%object
".Lcsbs$POC-Example$183":
	.asciz	"Out of bounds memory address passed to Small Stack allocator. (resize)"
	.size	".Lcsbs$POC-Example$183", 71

	.type	".Lcsbs$POC-Example$184",%object
".Lcsbs$POC-Example$184":
	.asciz	"%!(BAD ENUM VALUE="
	.size	".Lcsbs$POC-Example$184", 19

	.type	".Lcsbs$POC-Example$185",%object
".Lcsbs$POC-Example$185":
	.asciz	"unknown bit_size size"
	.size	".Lcsbs$POC-Example$185", 22

	.type	".Lcsbs$POC-Example$186",%object
".Lcsbs$POC-Example$186":
	.asciz	"fmt_bit_set"
	.size	".Lcsbs$POC-Example$186", 12

	.type	".Lscl$[fmt_bit_set52119]",%object
	.p2align	4, 0x0
".Lscl$[fmt_bit_set52119]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	1860
	.long	9
	.long	".Lcsbs$POC-Example$186"
	.long	11
	.size	".Lscl$[fmt_bit_set52119]", 24

	.type	".Lcsbs$POC-Example$187",%object
".Lcsbs$POC-Example$187":
	.asciz	",\n"
	.size	".Lcsbs$POC-Example$187", 3

	.type	".Lcsbs$POC-Example$188",%object
".Lcsbs$POC-Example$188":
	.asciz	"fmt"
	.size	".Lcsbs$POC-Example$188", 4

	.type	".Lcsbs$POC-Example$189",%object
".Lcsbs$POC-Example$189":
	.asciz	"-"
	.size	".Lcsbs$POC-Example$189", 2

	.type	".Lcsbs$POC-Example$18b",%object
".Lcsbs$POC-Example$18b":
	.asciz	"raw_union_tag"
	.size	".Lcsbs$POC-Example$18b", 14

	.type	".Lcsbs$POC-Example$18c",%object
".Lcsbs$POC-Example$18c":
	.asciz	"="
	.size	".Lcsbs$POC-Example$18c", 2

	.type	".Lcsbs$POC-Example$18e",%object
".Lcsbs$POC-Example$18e":
	.asciz	"#raw_union(."
	.size	".Lcsbs$POC-Example$18e", 13

	.type	".Lcsbs$POC-Example$18f",%object
".Lcsbs$POC-Example$18f":
	.asciz	" = "
	.size	".Lcsbs$POC-Example$18f", 4

	.type	".Lcsbs$POC-Example$190",%object
".Lcsbs$POC-Example$190":
	.asciz	"any{}"
	.size	".Lcsbs$POC-Example$190", 6

	.type	".Lcsbs$POC-Example$191",%object
".Lcsbs$POC-Example$191":
	.asciz	"(#raw_union)"
	.size	".Lcsbs$POC-Example$191", 13

	.type	".Lcsbs$POC-Example$192",%object
".Lcsbs$POC-Example$192":
	.asciz	"{}"
	.size	".Lcsbs$POC-Example$192", 3

	.type	".Lcsbs$POC-Example$193",%object
".Lcsbs$POC-Example$193":
	.asciz	"0s"
	.size	".Lcsbs$POC-Example$193", 3

	.type	".Lcsbs$POC-Example$195",%object
".Lcsbs$POC-Example$195":
	.asciz	" +0000 UTC"
	.size	".Lcsbs$POC-Example$195", 11

	.type	".Lcsbs$POC-Example$196",%object
".Lcsbs$POC-Example$196":
	.asciz	"Invalid union tag type"
	.size	".Lcsbs$POC-Example$196", 23

	.type	".Lcsbs$POC-Example$197",%object
".Lcsbs$POC-Example$197":
	.asciz	"fmt_union"
	.size	".Lcsbs$POC-Example$197", 10

	.type	".Lscl$[fmt_union76049]",%object
	.p2align	4, 0x0
".Lscl$[fmt_union76049]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	2742
	.long	8
	.long	".Lcsbs$POC-Example$197"
	.long	9
	.size	".Lscl$[fmt_union76049]", 24

	.type	".Lcsbs$POC-Example$198",%object
".Lcsbs$POC-Example$198":
	.asciz	"tag >= 0"
	.size	".Lcsbs$POC-Example$198", 9

	.type	".Lscl$[fmt_union76085]",%object
	.p2align	4, 0x0
".Lscl$[fmt_union76085]":
	.long	".Lcsbs$POC-Example$156"
	.long	43
	.long	2744
	.long	2
	.long	".Lcsbs$POC-Example$197"
	.long	9
	.size	".Lscl$[fmt_union76085]", 24

	.type	".Lcsbs$POC-Example$199",%object
".Lcsbs$POC-Example$199":
	.asciz	"matrix"
	.size	".Lcsbs$POC-Example$199", 7

	.type	".Lcsbs$POC-Example$19a",%object
".Lcsbs$POC-Example$19a":
	.asciz	"bit_field"
	.size	".Lcsbs$POC-Example$19a", 10

	.type	".Lcsbs$POC-Example$19b",%object
".Lcsbs$POC-Example$19b":
	.asciz	"map"
	.size	".Lcsbs$POC-Example$19b", 4

	.type	".Lcsbs$POC-Example$19c",%object
".Lcsbs$POC-Example$19c":
	.asciz	" @ "
	.size	".Lcsbs$POC-Example$19c", 4

	.type	".Lcsbs$POC-Example$1a1",%object
".Lcsbs$POC-Example$1a1":
	.asciz	"type assertion"
	.size	".Lcsbs$POC-Example$1a1", 15

	.type	".Lcsbs$POC-Example$1a3",%object
	.section	.rodata.str1.1,"aMS",%progbits,1
".Lcsbs$POC-Example$1a3":
	.asciz	" to "
	.size	".Lcsbs$POC-Example$1a3", 5

	.type	".Lcsbs$POC-Example$1a4",%object
	.section	.rodata.str1.4,"aMS",%progbits,1
	.p2align	2, 0x0
".Lcsbs$POC-Example$1a4":
	.asciz	", actual type: "
	.size	".Lcsbs$POC-Example$1a4", 16

	.type	".Lcsbs$POC-Example$1a6",%object
	.section	.rodata,"a",%progbits
".Lcsbs$POC-Example$1a6":
	.asciz	"%!(BAD WIDTH)"
	.size	".Lcsbs$POC-Example$1a6", 14

	.type	".Lcsbs$POC-Example$1a7",%object
".Lcsbs$POC-Example$1a7":
	.asciz	"%!(BAD PRECISION)"
	.size	".Lcsbs$POC-Example$1a7", 18

	.type	".Lcsbs$POC-Example$1a8",%object
".Lcsbs$POC-Example$1a8":
	.asciz	"%!(MISSING ARGUMENT)"
	.size	".Lcsbs$POC-Example$1a8", 21

	.type	".Lcsbs$POC-Example$1a9",%object
".Lcsbs$POC-Example$1a9":
	.asciz	"%!(BAD ARGUMENT NUMBER)"
	.size	".Lcsbs$POC-Example$1a9", 24

	.type	".Lcsbs$POC-Example$1aa",%object
".Lcsbs$POC-Example$1aa":
	.asciz	"runtime assertion"
	.size	".Lcsbs$POC-Example$1aa", 18

	.type	".Lcsbs$POC-Example$1ab",%object
	.section	.rodata.str1.4,"aMS",%progbits,1
	.p2align	2, 0x0
".Lcsbs$POC-Example$1ab":
	.asciz	"Invalid type assertion from "
	.size	".Lcsbs$POC-Example$1ab", 29

	.type	".Lswitch.table.fmt::_fmt_int_128",%object
	.section	.rodata.cst8,"aM",%progbits,8
".Lswitch.table.fmt::_fmt_int_128":
	.byte	98
	.zero	1
	.zero	1
	.byte	111
	.zero	1
	.byte	122
	.zero	1
	.byte	120
	.size	".Lswitch.table.fmt::_fmt_int_128", 8

	.section	".note.GNU-stack","",%progbits
