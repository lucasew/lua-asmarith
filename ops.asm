%include "asm_io.inc"

segment .text
global func_sum, func_sub, func_mul, func_div

func_sum:
    push rbp
    mov rbp, rsp
    mov rax, [rbp + 4]
    add rax, [rbp + 8]
    pop rbp
    ret

func_sub:
    push rbp
    mov rbp, rsp
    mov rax, [rbp + 8]
    sub rax, [rbp + 12]
    pop rbp
    ret

func_mul:
    push rbp
    mov rbp, rsp
    mov rax, [rbp + 8]
    mul DWORD [rbp + 12]
    pop rbp
    ret

func_div:
    push rbp
    mov rbp, rsp
    xor rdx, rdx ; Ainda bem que o eduardo me passou essa manha
    mov rax, [rbp + 8]
    div DWORD [rbp + 12]
    pop rbp
    ret

