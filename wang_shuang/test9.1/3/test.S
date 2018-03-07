/*
 * 王爽《汇编语言》第三版，检测点9.1 - 3
 */
	.file	"test.S"
	.code16

#include "common.S"

.section	.data
.align	16
.type	buffer, STT_OBJECT
buffer:
	.byte	0xbe, 0x00, 0x06, 0x00, 0x00, 0x00
.equ	buffer_len, . - buffer

.section	.text
.align	16
.type	_start, STT_FUNC
.globl 	_start
_start:
	nop
	
	movw $0x2000, %ax
	movw %ax, %es
	movw $buffer_len, %cx
	xorw %bx, %bx

.move:
	movb %ds:buffer(%bx), %al
	movb %al, %es:0x1000(%bx)
	incw %bx
	loop .move

/* 带括号和不带括号都可以 */
// 00000117  26FF2E0010        jmp word far [es:0x1000]
//	ljmp *%es:(0x1000) 
	ljmp *%es:0x1000 	// CS == 0006 	IP == 0x00be
/*
	00000117  26FF2E0010        jmp word far [es:0x1000] 16位实模式间接绝对远转移
 */

	movw %es, %ax
	mov %ax, %ds
	ljmp *%ds:0x1000

/*
	00000120  FF2E0010          jmp word far [0x1000] 注意26前缀的不同
 */


	/* return to DOS */	
	RETURN_TO_DOS

/*
 * 段内短转移 			jmp label
 * 00000103  EB03              jmp short 0x108		-------- 16位实模式相对短转移
 *
 * 段内近转移			jmp label
 * 00000109  E90010            jmp word 0x110c		-------- 16位实模式相对近转移
 *
 * 目的地址在寄存器中
 * 00000101  B81601            mov ax,0x116
 * 00000104  FFE0              jmp ax				---------
 * ljmp *%ax												\
 *															 \
 * // 00000107  FF265003          jmp word [0x350]			 /16位实模式间接绝对转移
 * jmp *offset 										--------/
 * 
 * 段间转移				目的地址在内存中
 * ljmp *offset										-------- 16位实模式间接绝对远转移
 * 0000012F  FF2E6001          jmp word far [0x160]
 *
 * 段间转移				目的地址在指令中
 * ljmp $0, $0x200	 								-------- 16位实模式直接绝对远转移
 * 0000012F  EA 0002 0000        jmp word 0x0:0x200 
 */


/*
 * (1) 16位实模式相对短转移
 		操作码opcode 0xEB
		操作数一字节 -128 ~ +127
		nasm/masm : 	jmp short lable

 * (2) 16位实模式相对近转移
		操作码opcode 0xE9
		操作数两字节 -32768 ~ + 32767
		nasm/masm :		jmp near  lable

 * (3) 16位间接绝对近转移 
		(1) 绝对地址在寄存器中 	jmp [near] 寄存器寻址
			操作码opcode 0xFF
			操作数因寄存器的不同而不同
		(2) 绝对地址在内存中	jmo [near] 内存寻址
			操作码opcode 0xFFXX (XX因段寄存器的不同而不同)	
			操作数 内存地址

 * (4) 16位实模式直接绝对远转移
		操作码opcode 0xEA
		操作数分别是段基址和段内偏移的数值

 * (5) 16位实模式间接绝对远转移
		操作码opcode 0xFFxx(XX因段寄存器的不同而不同)
		操作数 内存地址
 */
