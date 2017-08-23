/*OUTPUT_FORMAT(binary)*/
SECTIONS
{
	. = 0x07c00;
	.text : AT(0x07c00)
	{
		*(.text);
	}
	. = ADDR(.text) + SIZEOF(.text);
	.data : /* AT(ADDR(.text) + SIZEOF(.text)) */
	{
		*(.data);
		*(.bss);	
		*(.rodata);
	}
	.sig : AT(0x07dfe)
	{
		SHORT(0xaa55);
	}
}
