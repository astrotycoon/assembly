/*
 * 王爽《汇编语言》第三版，实验7
 */
	.file	"test.S"
	.code16

.equ	YEARS, 21
.equ	YEAR_OFFSET, 0
.equ	INCOMING_OFFSET, 5
.equ	EMPLOYEE_OFFSET, 10
.equ	SALARY_OFFSET, 13

.section	.data
.align		16
year_string:
	.ascii	"1975", "1976", "1977", "1978", "1979", "1980", "1981", "1982", "1983"
	.ascii	"1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992"
	.ascii	"1993", "1994", "1995"
incoming:
	.long	16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
	.long	345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000 
employee:
	.short	3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226
	.short	11542, 14430, 15257, 17800


.section	.table, "aw"
.align		16
.type	table, @object
table:
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "
	.ascii	"year summ ne ?? "

.section	.text
.align		16
.globl	_start
.type	_start, @function
_start:
	nop

	movw $YEARS, %cx
	movw $0, %bx
	movw $0, %si

year_to_table:
	pushw %cx

	movw $2, %cx
	movw $0, %di
char_to_table:
	movw year_string(%si), %ax
	movw %ax, (table+YEAR_OFFSET)(%bx, %di, 1)
	addw $2, %si
	addw $2, %di
	loop char_to_table

	popw %cx
	addw $16, %bx
	loop year_to_table



	movw $YEARS, %cx
	movw $0, %bx
	movw $0, %si

incoming_to_talbe:
	pushw %cx

	movw $2, %cx
	movw $0, %di	
s:
	movw incoming(%si), %ax
	movw %ax, (table + INCOMING_OFFSET)(%bx, %di, 1) 
	addw $2, %si
	addw $2, %di
	loop s
	
	popw %cx
	addw $16, %bx
	loop incoming_to_talbe


	
	movw $YEARS, %cx
	movw $0, %bx
	movw $0, %si

employee_to_table:
	movw employee(%si), %ax
	movw %ax, (table + EMPLOYEE_OFFSET)(%bx)
	addw $2, %si
	addw $16, %bx
	loop employee_to_table

	

	movw $YEARS, %cx
	movw $0, %bx
	movw $0, %si
	movw $0, %di
salary_to_table:
	movw incoming(%si), %ax
	addw $2, %si
	movw incoming(%si), %dx	
	addw $2, %si
	divw employee(%di)
	movw %ax, (table + SALARY_OFFSET)(%bx) 
	addw $2, %di
	addw $16, %bx	
	loop salary_to_table

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

