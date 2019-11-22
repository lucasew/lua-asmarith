%include "asm_io.inc"

segment .text
global func_sum, func_sub, func_mul, func_div

func_sum:
    push ebp ; em 64 bit ebp vira ebp, motivo? Lua não reconhece as libs 32 bits e não iria funcionar
    mov ebp, esp
    mov eax, [ebp + 8]
    add eax, [ebp + 12]
    pop ebp
    ret

func_sub:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    sub eax, [ebp + 12]
    pop ebp
    ret

func_mul:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mul DWORD [ebp + 12]
    pop ebp
    ret

func_div:
    push ebp
    mov ebp, esp
    xor edx, edx ; Ainda bem que o eduardo me passou essa manha
    mov eax, [ebp + 8]
    div DWORD [ebp + 12]
    pop ebp
    ret

