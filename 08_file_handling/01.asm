section .bss
    buffer resb 128

section .text
    global _start

_start:
    mov eax, 3          ; get input
    mov ebx, 0          ; how to get the inputs/file descriptor (stdin)
    mov ecx, buffer     ; where to store the input
    mov edx, 128        ; size of data to be received
    int 0x80            ; call kernel

    ;after the above block of code is executed, the length of the input is stored in eax

    ;mov esi, eax       ; Temporarily store length of actual input to esi to then pass to edx
    push eax            ; pushes value of eax to stack
    mov eax, 4          ; display output
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, buffer     ; location  of output
    ;mov edx, esi       ; length of output
    pop edx             ; get value from stack
    int 0x80            ; call kernel

    mov eax, 1          ; syscall number (sys_exit)
    xor ebx, ebx        ; status 0
    int 0x80    