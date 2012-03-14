#endiantest.s - A sample example of testing the little-endian and big-endian#that the different way to store in the memory and register
.section	.data
data:
	.int 	549
.section	.text
.globl	_start
_start:
	mov data, %eax

	mov $1, %eax	#call exit()
	mov $0, %ebx	#return 0
	int $0x80
