; JO → Jump if Overflow
section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    msg_ov db "Overflow occurred (OF=1)",10,0
    len_ov equ $ - msg_ov
    msg_noov db "No overflow (OF=0)",10,0
    len_noov equ $ - msg_noov

section .text
    global _start
_start:
    call print_name
    mov ax,7FFFh
    add ax,1       ; causes signed overflow
    jo overflow

    mov ecx, msg_noov
    mov edx, len_noov
    jmp print

overflow:
    mov ecx, msg_ov
    mov edx, len_ov

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
