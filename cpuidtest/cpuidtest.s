#cpuidtest.s - An ecample of using the TEST instruction
.section	.data
output_cpuid:
	.asciz	"This processor supports the CPUID instruction\n"
output_nocpuid:
	.asciz	"This processor does not support the CPUID instruction\n"

.section	.text
.globl	_start
_start:
	xor %eax, %eax
	xor %edx, %edx
	xor %ebx, %ebx
	xor %ecx, %ecx
	pushfl		#push EFLAGS to the top of stack
	popl %eax	#pop EFLAGS to the register %eax
	movl %eax, %edx
	xor $0x00200000, %eax
	pushl %eax
	popfl
	pushfl
	popl %eax
	xor %edx, %eax
	test $0x00200000, %eax
	jnz cpuid
	pushl $output_nocpuid
	call printf
	addl $4, %esp
	pushl $0
	call exit
cpuid:
	pushl $output_cpuid
	call printf
	addl $4, %esp
	pushl $0
	call exit
	
