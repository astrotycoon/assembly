all:
	as --32 -o test.o test.S 
	ld -o test test.o --nmagic --script=com.ld --print-map 
	objcopy --output-target=binary test test.com 

clean:
	rm -rf test.o test test.com 

