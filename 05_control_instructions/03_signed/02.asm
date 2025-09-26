; JGE / JNL → Jump if Greater or Equal
section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    msg_ge db "AX >= BX (Signed Greater or Equal)",10,0
    len_ge equ $ - msg_ge
    msg_less db "AX < BX (Signed Less)",10,0
    len_less equ $ - msg_less

section .text
    global _start
_start:
    call print_name
    mov ax,5
    mov bx,5
    cmp ax,bx
    jge ge_label

    mov ecx, msg_less
    mov edx, len_less
    jmp print

ge_label:
    mov ecx, msg_ge
    mov edx, len_ge

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
