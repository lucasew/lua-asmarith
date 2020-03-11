%include "asm_io.inc"

segment .text
global func_sum, func_sub, func_mul, func_div

func_sum:
    push rbp
    mov rbp, esp
    mov rax, [ebp + 8]
    add rax, [ebp + 12]
    pop rbp
    ret

func_sub:
    push rbp
    mov rbp, esp
    mov rax, [ebp + 8]
    sub rax, [ebp + 12]
    pop rbp
    ret

func_mul:
    push rbp
    mov rbp, esp
    mov rax, [ebp + 8]
    mul DWORD [ebp + 12]
    pop rbp
    ret

func_div:
    push rbp
    mov rbp, rsp
    xor rdx, rdx ; Ainda bem que o eduardo me passou essa manha
    mov rax, [ebp + 8]
    div DWORD [ebp + 12]
    pop rbp
    ret

