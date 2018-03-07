/*
 *	jmp far ptr cs:ip <--> ljmp cs,ip
 */
	.file	"test.S"
	.code16

.extern __text_begin
.extern __text_end
.extern __text_size

.section	.data
offset:
	.word	0x0000	/* 存储段内偏移地址 */
section:
	.word	0x0000	/* 存储段地址 */		

.section 	.text
.type	_start, @function
.globl	_start
_start:
	nop

	movw $0, %ax
	movw $0, %bx
	movw $__text_size, %ax
	
/* ljmp的两个操作数只能是立即数？ */
/* 是的 */
//	ljmp %cs, $s	/* wrong */
//	ljmp $ax, $s 	/* wrong */

	/* 这里无法完成程序9.3的功能？ */
//	ljmp *s	/* 这也不行，这里是把标号s出的内容当然目的地址了 */

	/* 
     * 参考: 
	 *		https://stackoverflow.com/questions/26943143/how-to-far-jump-to-0x9000ax-using-att-syntax
     *			(How to far jump to $0x9000:%ax using AT&T syntax?)
	 *		ljmp %cs, $s	/ wrong /
	 *		ljmp $ax, $s 	/ wrong /
     *
     *		x86不支持ljmp %cx, $s
     *      所以我把%cs和$s保存到内存中，然后ljmp
     *		
     *		这里我把从标号s处到结尾拷贝到0:200处，然后跳转到此处执行		
     */

	movw $0, %ax
	movw %ax, %es

	movw %ax, section
	movw $0x200, offset	

	movw $__text_end, %cx
	subw $s, %cx 

	xorw %bx, %bx

.move:
	movb %cs:s(%bx), %al	
	movb %al, %es:512(%bx)	/* 0x200 -> 512 */
	incw %bx
	loop .move

/*
	0000012F  FF2E6001          jmp word far [0x160]
	00000133  EB0B              jmp short 0x140
	怎么被反汇编成了两句?
 */
.if 0
	ljmp *offset	/* 16位实模式间接绝对远转移 */ 
.else
	/* 16位实模式直接绝对远转移 */
	ljmp $0, $0x200	/* 0000012F  EA 0002 0000        jmp word 0x0:0x200 */
.endif


	.align	16
	.space 0x10, 0x90

s:
	xorw %ax, %ax
	addw $1, %ax
	incw %ax

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

