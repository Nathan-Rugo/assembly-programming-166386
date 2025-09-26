; JS → Jump if Sign
section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    msg_neg db "Number is Negative (SF=1)",10,0
    len_neg equ $ - msg_neg
    msg_pos db "Number is Positive (SF=0)",10,0
    len_pos equ $ - msg_pos

section .text
    global _start
_start:
    call print_name
    mov ax,-5
    test ax,ax
    js negative

    mov ecx, msg_pos
    mov edx, len_pos
    jmp print

negative:
    mov ecx, msg_neg
    mov edx, len_neg

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
