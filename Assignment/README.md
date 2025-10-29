## 166386 - Githinji Nathan Rugo
## Class Assignment - 29 October 2025

### Prerequisites
Run the following on WSL
```bash
sudo apt update
sudo apt install gcc-multilib build-essential
```

### Folder Structure
1. Write a C program to calculate and display the factorial of a number entered by the user
Folder - Question One
Run commands
```bash
gcc factorial.c -o factorial
./factorial
```
2. Write a Assembly assembly program that adds numbers from 15 to 25 using a loop.
Folder - Question Two
Run commands
```bash
nasm -f elf32 addition.asm -o addition.o
ld -m elf_i386 -o addition addition.o
./addition
```

3. Write another Assembly program that adds numbers from 25 down to 15 using a
decrementing loop (dec).
Folder - Question Three
Run commands
```bash
nasm -f elf32 addition.asm -o addition.o
ld -m elf_i386 -o addition addition.o
./addition
```
4. Write a factorial program in assembly and call it from C to display the result.
Folder - Question Four
Run commands
```bash
nasm -f elf32 function.asm -o function.o
gcc -m32 -c factorial.c -o factorial.o
gcc -m32 -o final_program factorial.o function.o
./final_program
```