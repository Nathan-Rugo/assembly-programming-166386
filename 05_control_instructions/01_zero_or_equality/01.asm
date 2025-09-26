; jump if equal 

section .data
    name db "Nathan Githinji Rugo, 166386",10,0
    len_name equ $ - name
    msg_equal db "AX == BX (Equal, ZF=1)",10,0
    len_equal equ $ - msg_equal 
    ;10 decimal / 0x0A hex - newline character to move cursor to the next line after printing
    ;0 - null terminator
    msg_not_equal db "AX != BX (Not Equal, ZF=0)",10,0
    len_not_equal equ $ - msg_not_equal

section .text
    global _start
_start:
    call print_name
    
    mov ax, 5
    mov bx, 5

    ; cmp ax, bx performs (ax - bx), 
    ; updates flags but does not store result
    cmp ax, bx
    jz equal

    mov ecx, msg_not_equal ; ecx = pointer to message
    mov edx, len_not_equal
    jmp print

equal:
    mov ecx, msg_equal ; ecx = pointer to message
    mov edx, len_equal

print:
    mov eax,4   ; syscall number for sys_write
    mov ebx,1   ; file descriptor (1 = stdout)
    int 0x80    ;interrupt to invoke the call

    mov eax,1
    xor ebx, ebx
    int 0x80    ; interrupt to exit the program

print_name:
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, len_name
    int 0x80    ;interrupt to invoke the call

    ret
