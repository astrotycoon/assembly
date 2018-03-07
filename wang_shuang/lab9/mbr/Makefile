all:
	as --32 -o test.o test.S 
	ld -o test.img test.o --nmagic --script=com.ld --print-map 
#	objcopy --output-target=binary 3.1-2 3.1-2.com 

clean:
	rm -rf test.o test.com 

