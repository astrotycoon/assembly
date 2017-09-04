ENTRY(_start)
OUTPUT_FORMAT(binary)

SECTIONS
{
	. = 0x0100;
	.text ALIGN(16) :
	{
		__btext = .;
		*(.text)
		__etext = .;	
	}
	
	. = 0x0200;
	.data ALIGN(16) :
	{
		__bdata = .;
		*(.data)
		__edata = .;
	}

	. = 0x0300;
	.bss ALIGN(16) :
	{
		__bstack = .;
		*(.bss)
		__estack = .;
	}
}
