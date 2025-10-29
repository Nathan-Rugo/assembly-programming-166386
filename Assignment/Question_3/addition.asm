section .bss
    sum_str resb 4

section .text
    global _start

section .data
    newline db 10, 0

_start:
    mov eax, 0
    mov ecx, 25

sum_loop:
    add eax, ecx
    dec ecx
    cmp ecx, 15
    jge sum_loop

    
    mov edi, sum_str + 2
    mov ebx, 10
    
    call convert_to_string

    
    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 is stdout
    mov ecx, sum_str    ; Address of the string to print
    mov edx, 3          ; Length of the string
    int 0x80            ; Call the kernel

    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 is stdout
    mov ecx, newline    ; Address of the string to print
    mov edx, 2          ; Length of the string
    int 0x80            ; Call the kernel

    
    mov eax, 1          ; System call number for sys_exit
    xor ebx, ebx        ; Exit with code 0
    int 0x80            ; Call the kernel



convert_to_string:
.loop:
    xor edx, edx          ; Clear EDX
    div ebx               ; Divide EAX by 10
    add dl, '0'           ; Convert the remainder digit (0-9) to its ASCII character.
    mov [edi], dl         ; Store the character in our string buffer.
    dec edi               ; Move the buffer pointer to the left (for the next digit).
    test eax, eax         ; Is the quotient in EAX zero?
    jnz .loop             ; If not zero, loop again to get the next digit.
    ret                   ; Return from the procedure.