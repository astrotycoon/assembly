/* 
 * 这里使用gas生成COM文件
 * gas中的标号在编译链接阶段后被翻译成最终的地址
 * 在目标文件.o文件中都会为标号生成重定位项
 *	Relocation section '.rel.text' at offset 0xc4 contains 2 entries:
 *	 Offset     Info    Type            Sym.Value  Sym. Name
 *	00000001  00000614 R_386_16          00000000   _start
 *	00000004  00000214 R_386_16          00000000   .text
 *
 *  反汇编如下
 *	ndisasm -o 0x100 test.com
 *	00000100  B80001            mov ax,0x100
 *	00000103  B80301            mov ax,0x103
 *	00000106  B8004C            mov ax,0x4c00
 *	00000109  CD21              int 0x21
 */
	.file	"test.S"
	.code16

	.text
.globl	_start
_start:
	movw $_start, %ax	/* movw $100, %ax */
s:	movw $s, %ax		/* movw $103, %ax */

	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21
