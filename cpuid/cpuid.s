#cpuid.s Sample program to extract the processor Vender ID
.section	.data
output:
	.ascii "The processor Vender ID is 'xxxxxxxxxxxx'\n"
.section	.text
.globl	_start
_start:
	  movl $0, %eax
	  cpuid
	movl $output, %edi
	movl %ebx, 28(%edi)
	movl %edx, 32(%edi)
	movl %ecx, 36(%edi)
	movl $4, %eax		#call write 
	movl $1, %ebx		#STDOUT
	movl $output, %ecx	#address of string
	movl $42, %edx		#sizeof string
	int $0x80
	movl $1, %eax
	movl $2, %ebx
	int $0x80
