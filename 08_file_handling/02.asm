section .data:
    msg db "Hello World, My name is", 32;(10 - new line, 0 - null terminator, 32 - space)
    msg_len equ $ - msg
    file db "output.txt", 0
section .text:
    global _start

_start:
    ;opening the file
    mov eax, 5; sys_open
    mov ebx, file ;filename
    mov ecx, 0x241; creation
    mov edx, 0o644; rw-r--r--
    int 0x80
    ;returns file descriptor (eax) which is 3 for a file

    ; display output to file by writing into the file
    mov esi, eax
    mov eax, 4
    mov ebx, esi
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; close file you had opened
    mov eax, 6
    mov ebx, esi
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80


