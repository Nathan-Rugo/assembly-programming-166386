section .text
    global factorial

factorial:
    push    ebp
    mov     ebp, esp

    mov     ecx, [ebp + 8]
    mov     eax, 1

    cmp     ecx, 1
    jle     end_factorial

factorial_loop:
    mul     ecx
    dec     ecx
    cmp     ecx, 1
    jg      factorial_loop

end_factorial:
    pop     ebp
    ret