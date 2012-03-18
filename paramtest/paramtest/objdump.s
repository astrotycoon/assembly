
paramtest1:     file format elf32-i386


Disassembly of section .interp:

080480d4 <.interp>:
 80480d4:	2f                   	das    
 80480d5:	6c                   	insb   (%dx),%es:(%edi)
 80480d6:	69 62 2f 6c 64 2d 6c 	imul   $0x6c2d646c,0x2f(%edx),%esp
 80480dd:	69 6e 75 78 2e 73 6f 	imul   $0x6f732e78,0x75(%esi),%ebp
 80480e4:	2e 32 00             	xor    %cs:(%eax),%al

Disassembly of section .hash:

080480e8 <.hash>:
 80480e8:	01 00                	add    %eax,(%eax)
 80480ea:	00 00                	add    %al,(%eax)
 80480ec:	03 00                	add    (%eax),%eax
 80480ee:	00 00                	add    %al,(%eax)
 80480f0:	02 00                	add    (%eax),%al
	...
 80480fa:	00 00                	add    %al,(%eax)
 80480fc:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .dynsym:

08048100 <.dynsym>:
	...
 8048110:	10 00                	adc    %al,(%eax)
	...
 804811a:	00 00                	add    %al,(%eax)
 804811c:	12 00                	adc    (%eax),%al
 804811e:	00 00                	add    %al,(%eax)
 8048120:	0b 00                	or     (%eax),%eax
	...
 804812a:	00 00                	add    %al,(%eax)
 804812c:	12 00                	adc    (%eax),%al
	...

Disassembly of section .dynstr:

08048130 <.dynstr>:
 8048130:	00 6c 69 62          	add    %ch,0x62(%ecx,%ebp,2)
 8048134:	63 2e                	arpl   %bp,(%esi)
 8048136:	73 6f                	jae    80481a7 <printf@plt+0x7>
 8048138:	2e 36 00 65 78       	cs add %ah,%cs:%ss:0x78(%ebp)
 804813d:	69 74 00 70 72 69 6e 	imul   $0x746e6972,0x70(%eax,%eax,1),%esi
 8048144:	74 
 8048145:	66                   	data16
 8048146:	00 47 4c             	add    %al,0x4c(%edi)
 8048149:	49                   	dec    %ecx
 804814a:	42                   	inc    %edx
 804814b:	43                   	inc    %ebx
 804814c:	5f                   	pop    %edi
 804814d:	32 2e                	xor    (%esi),%ch
 804814f:	30 00                	xor    %al,(%eax)

Disassembly of section .gnu.version:

08048152 <.gnu.version>:
 8048152:	00 00                	add    %al,(%eax)
 8048154:	02 00                	add    (%eax),%al
 8048156:	02 00                	add    (%eax),%al

Disassembly of section .gnu.version_r:

08048158 <.gnu.version_r>:
 8048158:	01 00                	add    %eax,(%eax)
 804815a:	01 00                	add    %eax,(%eax)
 804815c:	01 00                	add    %eax,(%eax)
 804815e:	00 00                	add    %al,(%eax)
 8048160:	10 00                	adc    %al,(%eax)
 8048162:	00 00                	add    %al,(%eax)
 8048164:	00 00                	add    %al,(%eax)
 8048166:	00 00                	add    %al,(%eax)
 8048168:	10 69 69             	adc    %ch,0x69(%ecx)
 804816b:	0d 00 00 02 00       	or     $0x20000,%eax
 8048170:	17                   	pop    %ss
 8048171:	00 00                	add    %al,(%eax)
 8048173:	00 00                	add    %al,(%eax)
 8048175:	00 00                	add    %al,(%eax)
	...

Disassembly of section .rel.plt:

08048178 <.rel.plt>:
 8048178:	e0 92                	loopne 804810c <printf@plt-0x94>
 804817a:	04 08                	add    $0x8,%al
 804817c:	07                   	pop    %es
 804817d:	01 00                	add    %eax,(%eax)
 804817f:	00 e4                	add    %ah,%ah
 8048181:	92                   	xchg   %eax,%edx
 8048182:	04 08                	add    $0x8,%al
 8048184:	07                   	pop    %es
 8048185:	02 00                	add    (%eax),%al
	...

Disassembly of section .plt:

08048190 <printf@plt-0x10>:
 8048190:	ff 35 d8 92 04 08    	pushl  0x80492d8
 8048196:	ff 25 dc 92 04 08    	jmp    *0x80492dc
 804819c:	00 00                	add    %al,(%eax)
	...

080481a0 <printf@plt>:
 80481a0:	ff 25 e0 92 04 08    	jmp    *0x80492e0
 80481a6:	68 00 00 00 00       	push   $0x0
 80481ab:	e9 e0 ff ff ff       	jmp    8048190 <printf@plt-0x10>

080481b0 <exit@plt>:
 80481b0:	ff 25 e4 92 04 08    	jmp    *0x80492e4
 80481b6:	68 08 00 00 00       	push   $0x8
 80481bb:	e9 d0 ff ff ff       	jmp    8048190 <printf@plt-0x10>

Disassembly of section .text:

080481c0 <_start>:
 80481c0:	8b 0c 24             	mov    (%esp),%ecx
 80481c3:	51                   	push   %ecx
 80481c4:	68 e8 92 04 08       	push   $0x80492e8
 80481c9:	e8 d2 ff ff ff       	call   80481a0 <printf@plt>
 80481ce:	83 c4 04             	add    $0x4,%esp
 80481d1:	59                   	pop    %ecx
 80481d2:	89 e5                	mov    %esp,%ebp
 80481d4:	83 c5 04             	add    $0x4,%ebp

080481d7 <loop1>:
 80481d7:	ff 75 00             	pushl  0x0(%ebp)
 80481da:	68 02 93 04 08       	push   $0x8049302
 80481df:	e8 bc ff ff ff       	call   80481a0 <printf@plt>
 80481e4:	83 c4 08             	add    $0x8,%esp
 80481e7:	83 c5 04             	add    $0x4,%ebp
 80481ea:	67 e3 02             	jcxz   80481ef <end>
 80481ed:	e2 e8                	loop   80481d7 <loop1>

080481ef <end>:
 80481ef:	6a 00                	push   $0x0
 80481f1:	e8 ba ff ff ff       	call   80481b0 <exit@plt>

Disassembly of section .eh_frame:

080481f8 <.eh_frame>:
 80481f8:	14 00                	adc    $0x0,%al
 80481fa:	00 00                	add    %al,(%eax)
 80481fc:	00 00                	add    %al,(%eax)
 80481fe:	00 00                	add    %al,(%eax)
 8048200:	01 7a 52             	add    %edi,0x52(%edx)
 8048203:	00 01                	add    %al,(%ecx)
 8048205:	7c 08                	jl     804820f <end+0x20>
 8048207:	01 1b                	add    %ebx,(%ebx)
 8048209:	0c 04                	or     $0x4,%al
 804820b:	04 88                	add    $0x88,%al
 804820d:	01 00                	add    %eax,(%eax)
 804820f:	00 20                	add    %ah,(%eax)
 8048211:	00 00                	add    %al,(%eax)
 8048213:	00 1c 00             	add    %bl,(%eax,%eax,1)
 8048216:	00 00                	add    %al,(%eax)
 8048218:	78 ff                	js     8048219 <end+0x2a>
 804821a:	ff                   	(bad)  
 804821b:	ff 30                	pushl  (%eax)
 804821d:	00 00                	add    %al,(%eax)
 804821f:	00 00                	add    %al,(%eax)
 8048221:	0e                   	push   %cs
 8048222:	08 46 0e             	or     %al,0xe(%esi)
 8048225:	0c 4a                	or     $0x4a,%al
 8048227:	0f 0b                	ud2    
 8048229:	74 04                	je     804822f <end+0x40>
 804822b:	78 00                	js     804822d <end+0x3e>
 804822d:	3f                   	aas    
 804822e:	1a 3b                	sbb    (%ebx),%bh
 8048230:	2a 32                	sub    (%edx),%dh
 8048232:	24 22                	and    $0x22,%al

Disassembly of section .dynamic:

08049234 <_DYNAMIC>:
 8049234:	01 00                	add    %eax,(%eax)
 8049236:	00 00                	add    %al,(%eax)
 8049238:	01 00                	add    %eax,(%eax)
 804923a:	00 00                	add    %al,(%eax)
 804923c:	04 00                	add    $0x0,%al
 804923e:	00 00                	add    %al,(%eax)
 8049240:	e8 80 04 08 05       	call   d0c96c5 <_end+0x50803bd>
 8049245:	00 00                	add    %al,(%eax)
 8049247:	00 30                	add    %dh,(%eax)
 8049249:	81 04 08 06 00 00 00 	addl   $0x6,(%eax,%ecx,1)
 8049250:	00 81 04 08 0a 00    	add    %al,0xa0804(%ecx)
 8049256:	00 00                	add    %al,(%eax)
 8049258:	21 00                	and    %eax,(%eax)
 804925a:	00 00                	add    %al,(%eax)
 804925c:	0b 00                	or     (%eax),%eax
 804925e:	00 00                	add    %al,(%eax)
 8049260:	10 00                	adc    %al,(%eax)
 8049262:	00 00                	add    %al,(%eax)
 8049264:	15 00 00 00 00       	adc    $0x0,%eax
 8049269:	00 00                	add    %al,(%eax)
 804926b:	00 03                	add    %al,(%ebx)
 804926d:	00 00                	add    %al,(%eax)
 804926f:	00 d4                	add    %dl,%ah
 8049271:	92                   	xchg   %eax,%edx
 8049272:	04 08                	add    $0x8,%al
 8049274:	02 00                	add    (%eax),%al
 8049276:	00 00                	add    %al,(%eax)
 8049278:	10 00                	adc    %al,(%eax)
 804927a:	00 00                	add    %al,(%eax)
 804927c:	14 00                	adc    $0x0,%al
 804927e:	00 00                	add    %al,(%eax)
 8049280:	11 00                	adc    %eax,(%eax)
 8049282:	00 00                	add    %al,(%eax)
 8049284:	17                   	pop    %ss
 8049285:	00 00                	add    %al,(%eax)
 8049287:	00 78 81             	add    %bh,-0x7f(%eax)
 804928a:	04 08                	add    $0x8,%al
 804928c:	fe                   	(bad)  
 804928d:	ff                   	(bad)  
 804928e:	ff 6f 58             	ljmp   *0x58(%edi)
 8049291:	81 04 08 ff ff ff 6f 	addl   $0x6fffffff,(%eax,%ecx,1)
 8049298:	01 00                	add    %eax,(%eax)
 804929a:	00 00                	add    %al,(%eax)
 804929c:	f0 ff                	lock (bad) 
 804929e:	ff 6f 52             	ljmp   *0x52(%edi)
 80492a1:	81 04 08 00 00 00 00 	addl   $0x0,(%eax,%ecx,1)
	...

Disassembly of section .got.plt:

080492d4 <_GLOBAL_OFFSET_TABLE_>:
 80492d4:	34 92                	xor    $0x92,%al
 80492d6:	04 08                	add    $0x8,%al
	...
 80492e0:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 80492e1:	81 04 08 b6 81 04 08 	addl   $0x80481b6,(%eax,%ecx,1)

Disassembly of section .data:

080492e8 <output1>:
 80492e8:	54                   	push   %esp
 80492e9:	68 65 72 65 20       	push   $0x20657265
 80492ee:	61                   	popa   
 80492ef:	72 65                	jb     8049356 <_end+0x4e>
 80492f1:	20 25 64 20 70 61    	and    %ah,0x61702064
 80492f7:	72 61                	jb     804935a <_end+0x52>
 80492f9:	6d                   	insl   (%dx),%es:(%edi)
 80492fa:	65                   	gs
 80492fb:	74 65                	je     8049362 <_end+0x5a>
 80492fd:	72 73                	jb     8049372 <_end+0x6a>
 80492ff:	3a 0a                	cmp    (%edx),%cl
	...

08049302 <output2>:
 8049302:	25                   	.byte 0x25
 8049303:	73 0a                	jae    804930f <_end+0x7>
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	c0 81 04 08 36 00 00 	rolb   $0x0,0x360804(%ecx)
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	57                   	push   %edi
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 00                	add    %al,(%eax)
   7:	00 00                	add    %al,(%eax)
   9:	00 04 01             	add    %al,(%ecx,%eax,1)
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	c0 81 04 08 f6 81 04 	rolb   $0x4,-0x7e09f7fc(%ecx)
  17:	08 70 61             	or     %dh,0x61(%eax)
  1a:	72 61                	jb     7d <printf@plt-0x8048123>
  1c:	6d                   	insl   (%dx),%es:(%edi)
  1d:	74 65                	je     84 <printf@plt-0x804811c>
  1f:	73 74                	jae    95 <printf@plt-0x804810b>
  21:	31 2e                	xor    %ebp,(%esi)
  23:	73 00                	jae    25 <printf@plt-0x804817b>
  25:	2f                   	das    
  26:	68 6f 6d 65 2f       	push   $0x2f656d6f
  2b:	61                   	popa   
  2c:	73 74                	jae    a2 <printf@plt-0x80480fe>
  2e:	72 6f                	jb     9f <printf@plt-0x8048101>
  30:	6c                   	insb   (%dx),%es:(%edi)
  31:	2f                   	das    
  32:	61                   	popa   
  33:	73 6d                	jae    a2 <printf@plt-0x80480fe>
  35:	2f                   	das    
  36:	70 61                	jo     99 <printf@plt-0x8048107>
  38:	72 61                	jb     9b <printf@plt-0x8048105>
  3a:	6d                   	insl   (%dx),%es:(%edi)
  3b:	74 65                	je     a2 <printf@plt-0x80480fe>
  3d:	73 74                	jae    b3 <printf@plt-0x80480ed>
  3f:	2f                   	das    
  40:	70 61                	jo     a3 <printf@plt-0x80480fd>
  42:	72 61                	jb     a5 <printf@plt-0x80480fb>
  44:	6d                   	insl   (%dx),%es:(%edi)
  45:	74 65                	je     ac <printf@plt-0x80480f4>
  47:	73 74                	jae    bd <printf@plt-0x80480e3>
  49:	00 47 4e             	add    %al,0x4e(%edi)
  4c:	55                   	push   %ebp
  4d:	20 41 53             	and    %al,0x53(%ecx)
  50:	20 32                	and    %dh,(%edx)
  52:	2e 32 31             	xor    %cs:(%ecx),%dh
  55:	2e                   	cs
  56:	35 33 00 01 80       	xor    $0x80010033,%eax

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	00 10                	add    %dl,(%eax)
   4:	06                   	push   %es
   5:	11 01                	adc    %eax,(%ecx)
   7:	12 01                	adc    (%ecx),%al
   9:	03 08                	add    (%eax),%ecx
   b:	1b 08                	sbb    (%eax),%ecx
   d:	25 08 13 05 00       	and    $0x51308,%eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	48                   	dec    %eax
   1:	00 00                	add    %al,(%eax)
   3:	00 02                	add    %al,(%edx)
   5:	00 23                	add    %ah,(%ebx)
   7:	00 00                	add    %al,(%eax)
   9:	00 01                	add    %al,(%ecx)
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	00 70 61             	add    %dh,0x61(%eax)
  1e:	72 61                	jb     81 <printf@plt-0x804811f>
  20:	6d                   	insl   (%dx),%es:(%edi)
  21:	74 65                	je     88 <printf@plt-0x8048118>
  23:	73 74                	jae    99 <printf@plt-0x8048107>
  25:	31 2e                	xor    %ebp,(%esi)
  27:	73 00                	jae    29 <printf@plt-0x8048177>
  29:	00 00                	add    %al,(%eax)
  2b:	00 00                	add    %al,(%eax)
  2d:	00 05 02 c0 81 04    	add    %al,0x481c002
  33:	08 03                	or     %al,(%ebx)
  35:	0a 01                	or     (%ecx),%al
  37:	3d 21 59 59 3d       	cmp    $0x3d595921,%eax
  3c:	21 2f                	and    %ebp,(%edi)
  3e:	3f                   	aas    
  3f:	3d 59 59 3e 3f       	cmp    $0x3f3e5959,%eax
  44:	3d 30 2f 02 05       	cmp    $0x5022f30,%eax
  49:	00 01                	add    %al,(%ecx)
  4b:	01                   	.byte 0x1
