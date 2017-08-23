/*OUTPUT_FORMAT(binary)*/
/* EXTERN(array_num); */
/* 链接脚本中的地址都是偏移地址，IP */
SECTIONS
{
	. = 0x0100;
	. = ALIGN(16);
/*	__cs = (. >> 4); */
	.text :
	{
		__btext = .;
		*(.text);
		__etext = .;
	}

/*	. = 0x0200; */
	. = ALIGN(16);
/*	__ds = (. >> 4); */
	.data :
	{
		__bdata = .;
		*(.data);
		*(.rodata);
		__edata = .;
	}
	/*
	array_num = SIZEOF(.data) >> 1; 

	. = 0x0300;
	. = ALIGN(16);
	.stack :
	{
		__bstack = .;
		*(.bss);
		__estack = .;
	}
		*/
}
