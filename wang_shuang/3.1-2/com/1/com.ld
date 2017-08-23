/*OUTPUT_FORMAT(binary)*/
SECTIONS
{
	. = 0x0100;
	.text :
	{
		*(.text);
	}
	.data :
	{
		*(.data);
/*		*(.bss);	*/
		*(.rodata);
	}
	.bss :
	{
		*(.bss);
	}
}
