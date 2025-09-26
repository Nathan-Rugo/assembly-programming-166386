; JP / JPE → Jump if Parity Even
section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    msg_even db "Parity Even (PF=1)",10,0
    len_even equ $ - msg_even
    msg_odd db "Parity Odd (PF=0)",10,0
    len_odd equ $ - msg_odd

section .text
    global _start
_start:
    call print_name
    mov al,3       ; 00000011b → two 1s → even parity
    test al,al
    jp even

    mov ecx, msg_odd
    mov edx, len_odd
    jmp print

even:
    mov ecx, msg_even
    mov edx, len_even

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

