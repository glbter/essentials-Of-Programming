all:
	nasm -g -f elf64 -F dwarf -o main.o -l main.list main.asm
	ld main.o -o main
	ddd main

build: main.asm
	nasm -g -f elf64 -F dwarf -o main.o -l main.list main.asm
	ld main.o -o main
	
clean:
	rm main.list
	rm main.o
	rm main
	
console: main
	./main
