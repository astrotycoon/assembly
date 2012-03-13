	.file	"for.c"
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$48, %esp
	movl	$1, 24(%esp)
	movl	$2, 28(%esp)
	movl	$3, 32(%esp)
	movl	$4, 36(%esp)
	movl	$5, 40(%esp)
	movl	$0, 44(%esp)
	jmp	.L2
.L3:
	movl	44(%esp), %eax
	movl	24(%esp,%eax,4), %edx
	movl	$.LC0, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	addl	$1, 44(%esp)
.L2:
	cmpl	$4, 44(%esp)
	jle	.L3
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
