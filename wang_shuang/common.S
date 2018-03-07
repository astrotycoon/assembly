/*
 * 将经常使用的代码段提取到该文件中
 */
#ifndef __COMMON__S__
#define __COMMON__S__ 1 

.macro RETURN_TO_DOS
	movw $0x4c00, %ax
	int $0x21
.endm

.macro	MOVE, src_section, src_offset, dst_ection, dst_offset, base, count 
	movw \src_section, %ax
	movw %ax, %ds
	movw \dst_ection, %ax
	movw %ax, %es
	movw \count, %cx
	movw \base, %bx
.move
	movb %ds:\src_offset(%bx), %al
	movb %al, %es:\dst_offset(%bx)  
	incw %bx
	loop .move
.endm

#endif
