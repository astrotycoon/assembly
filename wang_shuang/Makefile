all:
	as --32 -o 3.1-2.o 3.1-2.S 
	ld -o 3.1-2 3.1-2.o --nmagic --script=com.ld
	objcopy --output-target=binary 3.1-2 3.1-2.com 

clean:
	rm -rf 3.1-2.o 3.1-2 3.1-2.com 

