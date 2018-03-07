00007C00  90                nop
00007C01  FB                sti
00007C02  BCFE7D            mov sp,0x7dfe
00007C05  FA                cli
00007C06  E83600            call word 0x7c3f
00007C09  688200            push word 0x82
00007C0C  6A15              push byte +0x15
00007C0E  68AB7C            push word 0x7cab
00007C11  6A1E              push byte +0x1e
00007C13  6A0A              push byte +0xa
00007C15  E85100            call word 0x7c69
00007C18  83C40A            add sp,byte +0xa
00007C1B  68A400            push word 0xa4
00007C1E  6A15              push byte +0x15
00007C20  68AB7C            push word 0x7cab
00007C23  6A1E              push byte +0x1e
00007C25  6A0B              push byte +0xb
00007C27  E83F00            call word 0x7c69
00007C2A  83C40A            add sp,byte +0xa
00007C2D  68F100            push word 0xf1
00007C30  6A15              push byte +0x15
00007C32  68AB7C            push word 0x7cab
00007C35  6A1E              push byte +0x1e
00007C37  6A0C              push byte +0xc
00007C39  E82D00            call word 0x7c69
00007C3C  83C40A            add sp,byte +0xa
00007C3F  55                push bp
00007C40  89E5              mov bp,sp
00007C42  50                push ax
00007C43  53                push bx
00007C44  51                push cx
00007C45  06                push es
00007C46  B800B8            mov ax,0xb800
00007C49  8EC0              mov es,ax
00007C4B  B019              mov al,0x19
00007C4D  B350              mov bl,0x50
00007C4F  F6E3              mul bl
00007C51  89C1              mov cx,ax
00007C53  31DB              xor bx,bx
00007C55  26C60720          mov byte [es:bx],0x20
00007C59  43                inc bx
00007C5A  26C60707          mov byte [es:bx],0x7
00007C5E  43                inc bx
00007C5F  E2F4              loop 0x7c55
00007C61  07                pop es
00007C62  59                pop cx
00007C63  5B                pop bx
00007C64  58                pop ax
00007C65  89EC              mov sp,bp
00007C67  5D                pop bp
00007C68  C3                ret
00007C69  55                push bp
00007C6A  89E5              mov bp,sp
00007C6C  50                push ax
00007C6D  06                push es
00007C6E  51                push cx
00007C6F  53                push bx
00007C70  56                push si
00007C71  57                push di
00007C72  B800B8            mov ax,0xb800
00007C75  8EC0              mov es,ax
00007C77  B0A0              mov al,0xa0
00007C79  F66604            mul byte [bp+0x4]
00007C7C  89C3              mov bx,ax
00007C7E  B002              mov al,0x2
00007C80  F66606            mul byte [bp+0x6]
00007C83  01C3              add bx,ax
00007C85  31F6              xor si,si
00007C87  31FF              xor di,di
00007C89  8B4E0A            mov cx,[bp+0xa]
00007C8C  53                push bx
00007C8D  8B5E08            mov bx,[bp+0x8]
00007C90  8A00              mov al,[bx+si]
00007C92  46                inc si
00007C93  5B                pop bx
00007C94  268801            mov [es:bx+di],al
00007C97  47                inc di
00007C98  8A460C            mov al,[bp+0xc]
00007C9B  268801            mov [es:bx+di],al
00007C9E  47                inc di
00007C9F  E2EB              loop 0x7c8c
00007CA1  5F                pop di
00007CA2  5E                pop si
00007CA3  5B                pop bx
00007CA4  59                pop cx
00007CA5  07                pop es
00007CA6  58                pop ax
00007CA7  89EC              mov sp,bp
00007CA9  5D                pop bp
00007CAA  C3                ret
00007CAB  57                push di
00007CAC  656C              gs insb
00007CAE  636F6D            arpl [bx+0x6d],bp
00007CB1  6520746F          and [gs:si+0x6f],dh
00007CB5  204C69            and [si+0x69],cl
00007CB8  6E                outsb
00007CB9  7578              jnz 0x7d33
00007CBB  206761            and [bx+0x61],ah
00007CBE  7321              jnc 0x7ce1
00007CC0  0000              add [bx+si],al
00007CC2  0000              add [bx+si],al
00007CC4  0000              add [bx+si],al
00007CC6  0000              add [bx+si],al
00007CC8  0000              add [bx+si],al
00007CCA  0000              add [bx+si],al
00007CCC  0000              add [bx+si],al
00007CCE  0000              add [bx+si],al
00007CD0  0000              add [bx+si],al
00007CD2  0000              add [bx+si],al
00007CD4  0000              add [bx+si],al
00007CD6  0000              add [bx+si],al
00007CD8  0000              add [bx+si],al
00007CDA  0000              add [bx+si],al
00007CDC  0000              add [bx+si],al
00007CDE  0000              add [bx+si],al
00007CE0  0000              add [bx+si],al
00007CE2  0000              add [bx+si],al
00007CE4  0000              add [bx+si],al
00007CE6  0000              add [bx+si],al
00007CE8  0000              add [bx+si],al
00007CEA  0000              add [bx+si],al
00007CEC  0000              add [bx+si],al
00007CEE  0000              add [bx+si],al
00007CF0  0000              add [bx+si],al
00007CF2  0000              add [bx+si],al
00007CF4  0000              add [bx+si],al
00007CF6  0000              add [bx+si],al
00007CF8  0000              add [bx+si],al
00007CFA  0000              add [bx+si],al
00007CFC  0000              add [bx+si],al
00007CFE  0000              add [bx+si],al
00007D00  0000              add [bx+si],al
00007D02  0000              add [bx+si],al
00007D04  0000              add [bx+si],al
00007D06  0000              add [bx+si],al
00007D08  0000              add [bx+si],al
00007D0A  0000              add [bx+si],al
00007D0C  0000              add [bx+si],al
00007D0E  0000              add [bx+si],al
00007D10  0000              add [bx+si],al
00007D12  0000              add [bx+si],al
00007D14  0000              add [bx+si],al
00007D16  0000              add [bx+si],al
00007D18  0000              add [bx+si],al
00007D1A  0000              add [bx+si],al
00007D1C  0000              add [bx+si],al
00007D1E  0000              add [bx+si],al
00007D20  0000              add [bx+si],al
00007D22  0000              add [bx+si],al
00007D24  0000              add [bx+si],al
00007D26  0000              add [bx+si],al
00007D28  0000              add [bx+si],al
00007D2A  0000              add [bx+si],al
00007D2C  0000              add [bx+si],al
00007D2E  0000              add [bx+si],al
00007D30  0000              add [bx+si],al
00007D32  0000              add [bx+si],al
00007D34  0000              add [bx+si],al
00007D36  0000              add [bx+si],al
00007D38  0000              add [bx+si],al
00007D3A  0000              add [bx+si],al
00007D3C  0000              add [bx+si],al
00007D3E  0000              add [bx+si],al
00007D40  0000              add [bx+si],al
00007D42  0000              add [bx+si],al
00007D44  0000              add [bx+si],al
00007D46  0000              add [bx+si],al
00007D48  0000              add [bx+si],al
00007D4A  0000              add [bx+si],al
00007D4C  0000              add [bx+si],al
00007D4E  0000              add [bx+si],al
00007D50  0000              add [bx+si],al
00007D52  0000              add [bx+si],al
00007D54  0000              add [bx+si],al
00007D56  0000              add [bx+si],al
00007D58  0000              add [bx+si],al
00007D5A  0000              add [bx+si],al
00007D5C  0000              add [bx+si],al
00007D5E  0000              add [bx+si],al
00007D60  0000              add [bx+si],al
00007D62  0000              add [bx+si],al
00007D64  0000              add [bx+si],al
00007D66  0000              add [bx+si],al
00007D68  0000              add [bx+si],al
00007D6A  0000              add [bx+si],al
00007D6C  0000              add [bx+si],al
00007D6E  0000              add [bx+si],al
00007D70  0000              add [bx+si],al
00007D72  0000              add [bx+si],al
00007D74  0000              add [bx+si],al
00007D76  0000              add [bx+si],al
00007D78  0000              add [bx+si],al
00007D7A  0000              add [bx+si],al
00007D7C  0000              add [bx+si],al
00007D7E  0000              add [bx+si],al
00007D80  0000              add [bx+si],al
00007D82  0000              add [bx+si],al
00007D84  0000              add [bx+si],al
00007D86  0000              add [bx+si],al
00007D88  0000              add [bx+si],al
00007D8A  0000              add [bx+si],al
00007D8C  0000              add [bx+si],al
00007D8E  0000              add [bx+si],al
00007D90  0000              add [bx+si],al
00007D92  0000              add [bx+si],al
00007D94  0000              add [bx+si],al
00007D96  0000              add [bx+si],al
00007D98  0000              add [bx+si],al
00007D9A  0000              add [bx+si],al
00007D9C  0000              add [bx+si],al
00007D9E  0000              add [bx+si],al
00007DA0  0000              add [bx+si],al
00007DA2  0000              add [bx+si],al
00007DA4  0000              add [bx+si],al
00007DA6  0000              add [bx+si],al
00007DA8  0000              add [bx+si],al
00007DAA  0000              add [bx+si],al
00007DAC  0000              add [bx+si],al
00007DAE  0000              add [bx+si],al
00007DB0  0000              add [bx+si],al
00007DB2  0000              add [bx+si],al
00007DB4  0000              add [bx+si],al
00007DB6  0000              add [bx+si],al
00007DB8  0000              add [bx+si],al
00007DBA  0000              add [bx+si],al
00007DBC  0000              add [bx+si],al
00007DBE  0000              add [bx+si],al
00007DC0  0000              add [bx+si],al
00007DC2  0000              add [bx+si],al
00007DC4  0000              add [bx+si],al
00007DC6  0000              add [bx+si],al
00007DC8  0000              add [bx+si],al
00007DCA  0000              add [bx+si],al
00007DCC  0000              add [bx+si],al
00007DCE  0000              add [bx+si],al
00007DD0  0000              add [bx+si],al
00007DD2  0000              add [bx+si],al
00007DD4  0000              add [bx+si],al
00007DD6  0000              add [bx+si],al
00007DD8  0000              add [bx+si],al
00007DDA  0000              add [bx+si],al
00007DDC  0000              add [bx+si],al
00007DDE  0000              add [bx+si],al
00007DE0  0000              add [bx+si],al
00007DE2  0000              add [bx+si],al
00007DE4  0000              add [bx+si],al
00007DE6  0000              add [bx+si],al
00007DE8  0000              add [bx+si],al
00007DEA  0000              add [bx+si],al
00007DEC  0000              add [bx+si],al
00007DEE  0000              add [bx+si],al
00007DF0  0000              add [bx+si],al
00007DF2  0000              add [bx+si],al
00007DF4  0000              add [bx+si],al
00007DF6  0000              add [bx+si],al
00007DF8  0000              add [bx+si],al
00007DFA  0000              add [bx+si],al
00007DFC  0000              add [bx+si],al
00007DFE  55                push bp
00007DFF  AA                stosb
