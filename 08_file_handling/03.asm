section .data:
    file db "output.txt", 0
    msg db "Nathan Githinji", 10 ;(10 - new line, 0 - null terminator)
    msg_len equ $ - msg

section .text:
    global _start

_start:
    ;opening the file
    mov eax, 5          ; sys_open
    mov ebx, file       ; filename
    mov ecx, 0x401      ; O_CREAT | O_APPEND | O_WRONLY
    mov edx, 0o644      ; rw-r--r--
    int 0x80

    ; returns file descriptor (eax) which is 3 for a file
    mov esi, eax

    ; display output to file by writing into the file
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