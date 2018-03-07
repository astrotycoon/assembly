	.file	"test.S"
	.code16

.extern __stack_end

.section	.data
str:
	.ascii	"Welcome to Linux gas!"
.equ	str_len, . - str

.section	.text
.type	_start, STT_FUNC
.globl	_start
_start:
	nop

	/* set stack */
	sti
	movw $__stack_end, %sp
	cli


	/* 先清屏 */
	callw clear_screen

	pushw $0x82	/* 绿色 */
	pushw $str_len
	pushw $str
	pushw $30
	pushw $10
	callw print_string
	addw $10, %sp	/* 栈平衡 */

	pushw $0xa4	/* 绿底红字 */
	pushw $str_len
	pushw $str
	pushw $30
	pushw $11
	callw print_string
	addw $10, %sp	/* 栈平衡 */

	pushw $0xf1	/* 白底蓝字 */
	pushw $str_len
	pushw $str
	pushw $30
	pushw $12
	callw print_string
	addw $10, %sp	/* 栈平衡 */


	jmp .	/* 必须加这一句，不然不显示，原因不知 */

/* 
 *	void clear_screen(void) 
 */
.type	clear_screen, STT_FUNC
clear_screen:
	pushw %bp
	movw %sp, %bp

	/* save registers */
	pushw %ax
	pushw %bx
	pushw %cx
	pushw %es

	movw $0xb800, %ax
	movw %ax, %es

	movb $25, %al
	movb $80, %bl
	mulb %bl
	movw %ax, %cx
	xorw %bx, %bx

.clear:
	/*
     * 平时所见的黑屏其实是空格
     */
	movb $' ', %es:(%bx)
	incw %bx
	movb $0x07, %es:(%bx)
	incw %bx
	loop .clear

	/* recover registers */
	popw %es
	popw %cx
	popw %bx
	popw %ax

	movw %bp, %sp
	popw %bp
	ret

/*
 *	void print_string(int lines, int columns, char *addr, size_t len, int attr)
 *
 *	+-------------------------------+
 *	|           attr                |
 *	+-------------------------------+ 12(%bp)
 *	|           len                 |
 *	+-------------------------------+ 10(%bp)
 *	|           addr                |
 *	+-------------------------------+ 8(%bp)
 *	|          columns              |
 *	+-------------------------------+ 6(%bp)
 *	|           lines               |
 *	+-------------------------------+ 4(%bp)
 *	|            ip                 |
 *	+-------------------------------+ 2(%bp)
 *	|           old bp              |
 *	+-------------------------------+ <----- bp
 */
.type	print_string, STT_FUNC 
print_string:
	pushw %bp
	movw %sp, %bp

	/* save registers */
	pushw %ax
	pushw %es
	pushw %cx
	pushw %bx
	pushw %si
	pushw %di

	movw $0xb800, %ax
	movw %ax, %es

	/* 先根据lines和columns定位屏幕位置, 160 x lines + columns x 2, 存储在%bx中 */
	movb $160, %al
	mulb 4(%bp)
	movw %ax, %bx

	movb $2, %al
	mulb 6(%bp)
	addw %ax, %bx

	xorw %si, %si
	xorw %di, %di
	movw 10(%bp), %cx 

.print:
	pushw %bx						/* 这块搞得有点复杂，没想到好办法 */
	movw 8(%bp), %bx
	movb %ds:(%bx, %si, 1), %al
	incw %si
	popw %bx
	movb %al, %es:(%bx, %di, 1)
	incw %di
	movb 12(%bp), %al 
	movb %al, %es:(%bx, %di, 1)
	incw %di
	loop .print

	/* recover registers */
	popw %di
	popw %si
	popw %bx
	popw %cx
	popw %es
	popw %ax

	movw %bp, %sp
	popw %bp
	ret
