assume cs:codesg

codesg segment
start:
	mov ax, bx
	; masm 中不能直接使用标号，提示如下错误
	; test.ASM(6): warning A4057: Illegal size for operand
	; test.ASM(7): warning A4057: Illegal size for operand
	mov si, offset start
	mov di, offset s0 
	mov ax, cs:[si]
	mov cs:[di], ax

s0:
	nop
	nop

	mov ax, 4c00h
	int 21h
codesg ends
end start
