/*
 * 使用glibc输出命令行参数和环境变量
 */
	.file	"test.S"
	.code32

.section 	.data
buffer:
	.ascii	"%s\n"

	.text
.globl	_start
.type	_start, @function
_start:
	nop

	popl %ecx	/* argc */

argv:
	popl %ecx	/* arg3 */
	test %ecx, %ecx
	jz env 

	pushl %ecx
	pushl $buffer
	call printf
	addl $8, %esp

	jmp argv

env:
	popl %ecx
	test %ecx, %ecx
	jz exit
	
	pushl %ecx
	pushl $buffer
	call printf
	addl $8, %esp

	jmp env

exit:
	/* return to SHELL */
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

