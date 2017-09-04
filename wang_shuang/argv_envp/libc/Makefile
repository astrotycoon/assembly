all:
	as -g -o test.o test.S
	ld -o test test.o --dynamic-linker=/lib/ld-linux.so.2 -lc

clean:
	rm -rf test  test.o
