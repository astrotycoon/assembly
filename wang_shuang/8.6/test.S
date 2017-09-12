/*
 * 修改内存中DEC公司的资料: 从1982的改到1988年
 */
	.file	"test.S"
	.code16

.extern	__sizeof__dec	/* DEC_1982结构体的大小 */

.section	.data
.type	DEC_1982, @object
DEC_1982:
	cn:	.ascii	"DEC"			/* 公司名称 0 */	
	hn:	.ascii	"Ken Oslen"		/* 总裁姓名 3 */
.equ	__pm_offset, . - DEC_1982
	pm:	.word	137				/* 排	 名 12 c*/
.equ	__sr_offset, . - DEC_1982
	sr:	.word	40				/* 收	 入 14 e*/
.equ	__cp_offset, . - DEC_1982
	cp:	.ascii	"PDP"			/* 著名产品 16 10 */

.section	.text
.type	_start, @function
.globl	_start
_start:
	nop

	/* 书上将DEC_1982搬到seg:60H处，这里直接假设seg为0,偏移为200，因为0:200 ~ 0:2ff是安全空间 */
	movw $0, %ax
	movw %ax, %es
	movw $200, %di	/* %es:%di -> seg:200*/

	movw $0, %si
	movw $__sizeof__dec, %cx

.move:
	movb %ds:DEC_1982(%si), %al
	movb %al, %es:(%di)
	incw %si
	incw %di
	loop .move

	movw $0, %ax
	movw %ax, %ds
	movw $200, %bx	/* %ds:%bx指向数据 */

	movw $38, __pm_offset(%bx)	/* 排名上升到38 */
	addw $70, __sr_offset(%bx)	/* 收入增加70   */	

	movw $0, %di
	movb $'V', __cp_offset(%bx, %di, 1)
	incw %di
	movb $'A', __cp_offset(%bx, %di, 1)
	incw %di
	movb $'X', __cp_offset(%bx, %di, 1)

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

