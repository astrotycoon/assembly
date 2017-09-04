/*
 * 直接使用sys_write打印命令行参数和环境变量
 * %eax - 系统调用号 %ebx -- 参数一 %ecx -- 参数二 %edx -- 参数三
 *			4			1             字符串首地址         字符创长度
 */
	.file 	"test.S"
	.code32
.section 	.data
lf:
	.byte 	'\n'

	.text
.globl	_start
.type 	_start, @function
_start:
	nop
	
	popl %ecx	/* argc */

argv:
	popl %eax
	test %eax, %eax
	jz env 

	movl %eax, %ecx	/* args3 -- the pointer to string */

	pushl %eax
	call strlen
	addl $4, %esp 

	movl %eax, %edx	/* args4 -- the length of string */
	movl $1, %ebx	/* args2 -- stdout */
	movl $4, %eax	/* args1 -- write */
	int $0x80	

	call print_lf

	jmp argv

env:
	popl %eax
	test %eax, %eax
	jz exit

	movl %eax, %ecx

	pushl %eax
	call strlen
	addl $4, %esp
	movl %eax, %edx	/* args4 -- the length of string */
	movl $1, %ebx	/* args2 -- stdout */
	movl $4, %eax	/* args1 -- write */
	int $0x80	

	call print_lf

	jmp env
	
exit:
	/* return to SHELL */
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

strlen:
	pushl %ebp
	movl %esp, %ebp

	pushl %ebx
	pushl %ecx

	movl $0, %eax
	movl 8(%ebp), %ebx

s:
	movb (%ebx), %cl
	test %cl, %cl
	jz out  
	incl %ebx
	incl %eax
	jmp s
	
out:	
	popl %ecx
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
		
print_lf:
	pushl %ebp
	movl %esp, %ebp

	pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx

	movl $1, %edx
	movl $lf, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80

	popl %edx
	popl %ecx
	popl %ebx
	popl %eax

	movl %ebp, %esp
	popl %ebp
	ret



