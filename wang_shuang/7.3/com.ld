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
		*(.data);
		*(.rodata);
		__edata = .;
	}
}
