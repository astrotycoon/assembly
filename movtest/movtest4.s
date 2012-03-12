#movtest4.s - An example of indirect addressing
.section	.data
values:
	.int	10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section	.text
.globl	_start
_start:
	movl values, %eax	#move first data of values to regitster eax
	movl $values, %edi	#move address of values to register edi
	movl $100, 4(%edi)
	movl $1, %edi
	movl values(, %edi, 4), %ebx
	movl $1, %eax		#call exit()
	int $0x80
