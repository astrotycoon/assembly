
5.1:     file format elf32-i386


Disassembly of section .text:

00000100 <_start>:
 100:	90                   	nop
 101:	66 31 c0             	xor    %eax,%eax
 104:	66 31 db             	xor    %ebx,%ebx
 107:	66 31 c9             	xor    %ecx,%ecx
 10a:	8c c8                	mov    %cs,%ax
 10c:	fa                   	cli    
 10d:	8e d0                	mov    %ax,%ss
 10f:	bc 00 02             	mov    $0x200,%sp
 112:	fb                   	sti    
 113:	b8 00 21             	mov    $0x2100,%ax
 116:	8e c0                	mov    %ax,%es
 118:	b9 08 00             	mov    $0x8,%cx
 11b:	bb 00 00             	mov    $0x0,%bx
 11e:	e8 25 00             	call   146 <data_end>
 121:	b8 00 20             	mov    $0x2000,%ax
 124:	8e d8                	mov    %ax,%ds
 126:	bb 00 10             	mov    $0x1000,%bx
 129:	8b 07                	mov    (%bx),%ax
 12b:	43                   	inc    %bx
 12c:	43                   	inc    %bx
 12d:	89 07                	mov    %ax,(%bx)
 12f:	43                   	inc    %bx
 130:	43                   	inc    %bx
 131:	89 07                	mov    %ax,(%bx)
 133:	43                   	inc    %bx
 134:	88 07                	mov    %al,(%bx)
 136:	43                   	inc    %bx
 137:	88 07                	mov    %al,(%bx)
 139:	b8 00 4c             	mov    $0x4c00,%ax
 13c:	cd 21                	int    $0x21

0000013e <data_start>:
 13e:	be 00 00             	mov    $0x0,%si
 141:	00 00                	add    %al,(%bx,%si)
 143:	00 00                	add    %al,(%bx,%si)
	...

00000146 <data_end>:
 146:	50                   	push   %ax

00000147 <agian>:
 147:	67 8a 04 1d 3e 01 00 	mov    0x13e(,%ebx,1),%al
 14e:	00 
 14f:	26 67 88 04 1d 00 00 	mov    %al,%es:0x0(,%ebx,1)
 156:	00 00 
 158:	43                   	inc    %bx
 159:	e2 ec                	loop   147 <agian>
 15b:	58                   	pop    %ax
 15c:	c3                   	ret    
 15d:	90                   	nop
 15e:	90                   	nop
 15f:	90                   	nop
 160:	90                   	nop
 161:	90                   	nop
 162:	90                   	nop
 163:	90                   	nop
 164:	90                   	nop
 165:	90                   	nop
 166:	90                   	nop
 167:	90                   	nop
 168:	90                   	nop
 169:	90                   	nop
 16a:	90                   	nop
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop
 170:	90                   	nop
 171:	90                   	nop
 172:	90                   	nop
 173:	90                   	nop
 174:	90                   	nop
 175:	90                   	nop
 176:	90                   	nop
 177:	90                   	nop
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop
 180:	90                   	nop
 181:	90                   	nop
 182:	90                   	nop
 183:	90                   	nop
 184:	90                   	nop
 185:	90                   	nop
 186:	90                   	nop
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop
 190:	90                   	nop
 191:	90                   	nop
 192:	90                   	nop
 193:	90                   	nop
 194:	90                   	nop
 195:	90                   	nop
 196:	90                   	nop
 197:	90                   	nop
 198:	90                   	nop
 199:	90                   	nop
 19a:	90                   	nop
 19b:	90                   	nop
 19c:	90                   	nop
 19d:	90                   	nop
 19e:	90                   	nop
 19f:	90                   	nop
 1a0:	90                   	nop
 1a1:	90                   	nop
 1a2:	90                   	nop
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop
 1b0:	90                   	nop
 1b1:	90                   	nop
 1b2:	90                   	nop
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop
 1c0:	90                   	nop
 1c1:	90                   	nop
 1c2:	90                   	nop
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop
 1d0:	90                   	nop
 1d1:	90                   	nop
 1d2:	90                   	nop
 1d3:	90                   	nop
 1d4:	90                   	nop
 1d5:	90                   	nop
 1d6:	90                   	nop
 1d7:	90                   	nop
 1d8:	90                   	nop
 1d9:	90                   	nop
 1da:	90                   	nop
 1db:	90                   	nop
 1dc:	90                   	nop
 1dd:	90                   	nop
 1de:	90                   	nop
 1df:	90                   	nop
 1e0:	90                   	nop
 1e1:	90                   	nop
 1e2:	90                   	nop
 1e3:	90                   	nop
 1e4:	90                   	nop
 1e5:	90                   	nop
 1e6:	90                   	nop
 1e7:	90                   	nop
 1e8:	90                   	nop
 1e9:	90                   	nop
 1ea:	90                   	nop
 1eb:	90                   	nop
 1ec:	90                   	nop
 1ed:	90                   	nop
 1ee:	90                   	nop
 1ef:	90                   	nop
 1f0:	90                   	nop
 1f1:	90                   	nop
 1f2:	90                   	nop
 1f3:	90                   	nop
 1f4:	90                   	nop
 1f5:	90                   	nop
 1f6:	90                   	nop
 1f7:	90                   	nop
 1f8:	90                   	nop
 1f9:	90                   	nop
 1fa:	90                   	nop
 1fb:	90                   	nop
 1fc:	90                   	nop
 1fd:	90                   	nop
 1fe:	90                   	nop
 1ff:	90                   	nop
