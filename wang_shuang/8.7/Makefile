all:
	as --32 -o test.o test.S
	ld -o test test.o --print-map
	objcopy --output-target=binary --only-section=.text test test.com
	
clean:
	rm -rf test.o test.com test
