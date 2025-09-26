; JAE / JNB → Jump if Above or Equal

section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    str_ae db "AX >= BX (Above or Equal)",10,0
    len_ae equ $ - str_ae
    str_below db "AX < BX (Below)",10,0
    len_below equ $ - str_below

section .text
    global _start
_start:
    call print_name
    mov ax,5
    mov bx,5
    cmp ax,bx
    jae above_equal

    mov ecx, str_below
    mov edx, len_below
    jmp print

above_equal:
    mov ecx, str_ae
    mov edx, len_ae

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
