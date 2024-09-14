all:
	nasm -f elf a.asm
	ld -m elf_i386 a.o -o e
