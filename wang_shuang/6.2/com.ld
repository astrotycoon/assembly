/*OUTPUT_FORMAT(binary)*/
EXTERN(array_num);
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
		*(.data);
		*(.rodata);
		__edata = .;
	}
	array_num = SIZEOF(.data) / 2; 

	. = 0x0300;
	. = ALIGN(16);
	.stack :
	{
		__bstack = .;
		*(.bss);
		__estack = .;
	}
}
