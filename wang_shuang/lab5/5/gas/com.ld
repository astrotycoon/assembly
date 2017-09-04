OUTPUT_FORMAT(binary)

SECTIONS
{
	. = 0x0100;
	. = ALIGN(16);
	.text :
	{
		__btext = .;
		*(.text);
		__etext = .;
	}

	. = 0x0200;
	. = ALIGN(16);
	.data :
	{
		__bdata = .;
		*(.data); 	/* 我程序中并没有定义.data段,但是这里如果不包含这句，那么其他三个段的内容最后并没有包含在可执行文件中 */
		__ba = .;
		*(.a);
		__ea = .;
		*(.b);
		*(.c);
		__edata = .;
	}
	__num = (__ea - __ba);
}
