#cpuid2.s View the CPUID Vender ID string using C library calls
.section	.data
output:
	.asciz "The processor Vender ID is '%s'\n"
.section	.bss
	.lcomm	buffer, 12
.section	.text
.globl main
main:
	  movl $0, %eax
	  cpuid
	movl $buffer, %edi
	movl %ebx, (%edi)
	movl %edx, 4(%edi)
	movl %ecx, 8(%edi)
	pushl $buffer
	pushl $output
	call printf
	addl $8, %esp
	pushl $0
	call exit
		 
