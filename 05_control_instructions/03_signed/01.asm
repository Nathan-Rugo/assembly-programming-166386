; JG / JNLE → Jump if Greater
section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    msg_greater db "AX > BX (Signed Greater)",10,0
    len_g equ $ - msg_greater
    msg_not_greater db "AX <= BX (Not Greater)",10,0
    len_ng equ $ - msg_not_greater

section .text
    global _start
_start:
    call print_name
    mov ax,7
    mov bx,3
    cmp ax,bx
    jg greater

    mov ecx, msg_not_greater
    mov ecx, len_ng
    jmp print

greater:
    mov ecx, msg_greater
    mov edx, len_g

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
