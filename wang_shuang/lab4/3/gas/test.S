/*
 * 将"movw $0x4c00, %ax"之前的指令复制到内存0:200处
 */
	.file 	"test.S"
	.code16
	.text
.globl _start
_start:
// 生成COM文件时，cs == ds，因此这里不需要
//	movw %cs, %ax
//	movw %ax, %ds

	movw $0x0020, %ax
	movw %ax, %es

/* 因为COM时首地址位0x100, 即ip == 0x100 */
	movw $0x0100, %bx
	movw $0x0000, %bp

	movw $_return_to_os - _start, %cx

.mov:
	movb %ds:(%bx), %al
	movb %al, %es:(%bp)
	incw %bx
	incw %bp
	loop .mov

_return_to_os:
	movw $0x4c00, %ax
	int $0x21

