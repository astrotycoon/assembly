	.file	"test.S"
	.code16

.extern __byte_array_len

.section 	.data
.type 	byte_array, @object
byte_array:
	.byte	0xbe, 0x00, 0x06, 0x00, 0x6a, 0x22

.section	.text
.type	_start, @function
.globl	_start
_start:
	nop

	movw $0x2000, %ax
	movw %ax, %es
	movw $0x1000, %bx
	movw $0, %si
	movw $__byte_array_len, %cx

.copy:
	movb %ds:byte_array(%si), %al
	movb %al, %es:(%bx, %si, 1)
	incw %si
	loop .copy

	movw $0x2000, %ax
	movw %ax, %ds
	movw $0x1000, %bx
////////////////////////////////////////////////////
	movw $0, %si
	movw 2(%bx, %si, 1), %ax	/* %ax = 0x0006 */
	incw %si
	movw 2(%bx, %si, 1), %cx	/* %cx = 0x6a00 */
	incw %si
	movw %si, %di
	movw 2(%bx, %di, 1), %bx	/* %bx = 0x226a */
////////////////////////////////////////////////////
	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

