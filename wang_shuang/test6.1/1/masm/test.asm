assume cs:code, ds:data, ss:stack

data segment
	dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h
data ends

stack segment
	dw 8 dup(0h)
stack ends

test segment
	dw 16	dup(1111h)
test ends

ASTROL segment
	dw 16 	dup(2222h)
ASTROL ends

LINUX segment
	dw 32	dup(3333h)
LINUX ends

code segment
start:
	mov ax, data
	mov ds, ax

	cli
	mov ax, stack
	mov ss, ax
	mov sp, 10h
	sti


	mov ax, test
	mov ds, ax

	mov ax, ASTROL
	mov ds, ax

	mov ax, LINUX
	mov ds, ax


	mov ax, 0
	mov es, ax

	mov bx, 0
	mov cx, 8
s:
	mov ax, es:[bx]
	mov ds:[bx], ax
	add bx, 2
	loop s

	mov ax, 4c00h
	int 21h
code ends
end start

;
; DOS利用int 21加载exe
;
; 前256字节是PSP
;
; 紧接着是exe除了exe header的整体内容
;
; DOS根据exe中的重定位信息改变相应的指令内容
; 重定位分两步：
;	(1) 确定要重定位的内存位置 
;	(2) 将新值填写回重定位内存处
;
; 最后使ds/es指向PSP
;
; SS指向加载内容的首地址 + exe header中的初始值
;
; CS指向加载内容首地址 + exe header中的初始值

;------------------------------------ <- DS/ES
;|									|
;|									|
;|									|
;|									| PSP
;|									|
;|									|
;|									|
;------------------------------------ <- SS
;|									| DATA
;------------------------------------
;|									| STACK
;------------------------------------ <- CS
;|									|
;|									|
;|									| CODE
;|									|
;|									|
;|									|
;------------------------------------

