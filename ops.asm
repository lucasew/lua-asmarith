%include "asm_io.inc"

segment .text
global func_sum, func_sub, func_mul, func_div

func_sum:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    add rax, rsi
    pop rbp
    ret

func_sub:
    push rbp
    mov rbp, rsp
    mov rax, rsp
    sub rax, rdi
    pop rbp
    ret

func_mul:
    push rbp
    mov rbp, rsp
    mov rax, rsp
    mul DWORD rdi
    pop rbp
    ret

func_div:
    push rbp
    mov rbp, rsp
    xor rdx, rdx ; Ainda bem que o eduardo me passou essa manha
    mov rax, rsp
    div DWORD rdi
    pop rbp
    ret

