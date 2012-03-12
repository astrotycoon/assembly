	.file	"demo1.c"
	.text
	.globl	function1
	.type	function1, @function
function1:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -8(%ebp)
	jmp	.L2
.L3:
	movl	-8(%ebp), %eax
	addl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
.L2:
	cmpl	$99999, -4(%ebp)
	jle	.L3
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	function1, .-function1
	.globl	function2
	.type	function2, @function
function2:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	function1
	movl	$0, -8(%ebp)
	jmp	.L5
.L6:
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
.L5:
	cmpl	$199999, -8(%ebp)
	jle	.L6
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	function2, .-function2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L8
.L9:
	call	function1
	addl	$1, -4(%ebp)
.L8:
	cmpl	$99, -4(%ebp)
	jle	.L9
	movl	$0, -4(%ebp)
	jmp	.L10
.L11:
	call	function2
	addl	$1, -4(%ebp)
.L10:
	cmpl	$49999, -4(%ebp)
	jle	.L11
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
