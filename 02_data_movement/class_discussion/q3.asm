section .data
    num dd 55

    ; contains ADDRESS of num
    pnt dd num

section .text
    global _start

_start:
    mov eax, [pnt]

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
