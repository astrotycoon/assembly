#bcdtest.s - An example of using BCD integer values and FBLD instruction
#fbld source

.section	.data
data1:
	.byte	0x34, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data2:	
	.int 	2

.section	.text
.globl	_start
_start:
	fbld data1
	fimul data2	#data1 * data2
	fbstp	data1

	movl $1, %eax	#call exit()
	movl $0, %ebx	#retuan 0
	int $0x80
