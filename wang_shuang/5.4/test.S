/*
 * 任务：将内存2000:0、2000:1、2000:2、2000:3单元中的数据送入al、bl、cl、dl中。
 */
	.file	"test.S"
	.code16

	.text
.globl _start
_start:
	nop

	movw $0x2000, %ax
	movw %ax, %ds

	movb (0), %al
	movb (1), %bl
	movb (2), %cl
	movb (3), %dl
	
	/* return to DOS */
	movw $0x4c00, %ax
	int $0x21

// C:\>debug test.com
// -u
// 07D2:0100 90            NOP
// 07D2:0101 B80020        MOV     AX,2000
// 07D2:0104 8ED8          MOV     DS,AX
// 07D2:0106 A00000        MOV     AL,[0000]
// 07D2:0109 8A1E0100      MOV     BL,[0001]
// 07D2:010D 8A0E0200      MOV     CL,[0002]
// 07D2:0111 8A160300      MOV     DL,[0003]
// 07D2:0115 B8004C        MOV     AX,4C00
// 07D2:0118 CD21          INT     21
// 07D2:011A 028904E8      ADD     CL,[BX+DI+E804]
// 07D2:011E B2FF          MOV     DL,FF
// 结论：gas不存在masm的情况，我更觉得那是masm的bug


