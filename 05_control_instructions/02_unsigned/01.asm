; JA / JNBE → Jump if Above
section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    str_above db "AX > BX (Above)",10,0
    len_above equ $ - str_above
    str_not_above db "AX <= BX (Not Above)",10,0
    len_not_above equ $ - str_not_above

section .text
    global _start
_start:
    call print_name
    mov ax, 7
    mov bx, 3
    cmp ax, bx
    ja above

    mov ecx, str_not_above
    mov edx, len_not_above
    jmp print

above:
    mov ecx, str_above
    mov edx, len_above

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80

print_name:
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, len_name
    int 0x80    ;interrupt to invoke the call

    ret
