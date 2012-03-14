#mmxtest.s - An example of using the MMX data types and MOVQ instruction
.section	.data
value1:
	.int 1, -1
value2:
	.byte 0x10, 0x05, 0xff, 0x32, 0x47, 0xe4, 0x00, 0x01

.section	.text
.globl	_start
_start:
	movq value1, %mm0
	movq value2, %mm1

	movl $1, %eax	#call exit()
	movl $0, %ebx	#return 0
	int $0x80
