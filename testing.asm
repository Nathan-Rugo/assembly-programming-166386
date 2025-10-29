section .data
    output db "Result: ", 10, 0
    len_output equ $ - output


section .text
    global _start

_start:
    mov eax, 1
    mov esi, 5
    mov edx, 1
    jnz _factorial
    call _result

_factorial:
    mov ebx, esi
    .loop:
        mul ebx
        dec ebx
        jnz .loop
    mov esi, eax

_result:
    xor eax, eax
    xor edx, edx
    
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, 100
    int 0x80

    xor eax, eax
    mov eax, 1
    xor ebx, ebx
    int 0x80



    



