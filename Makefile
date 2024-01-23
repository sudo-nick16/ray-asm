main: main.o
	ld -o ./build/main ./build/main.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -L./build/raylib/ -lc -lraylib -lm

main.o: main.asm
	nasm -f elf64 -o ./build/main.o main.asm

test: test.c
	gcc -o test test.c -L./build/raylib/ -lraylib -lm && ./test

dump: test.c
	gcc -O0 -S test.c
