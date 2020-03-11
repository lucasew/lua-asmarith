#!/usr/bin/env bash

# Para fins de saúde mental do programador não foi feita a variação para windows.
# O programa requere a versão 32 bits do interpretador lua, tentar carregar a biblioteca na versão 64 bits não vai funcionar.
# Testado no arch linux, compilado pelo clang pois o mesmo tem o parâmetro target, o qual possibilita mais facilmente realizar a compilação 32 bits (i386)
# O mesmo contém uma pequena suíte de testes para testar a binding no lado C e no lado Lua

NASMFLAGS="-felf -DELF_TYPE"
CFLAGS="-g -lc"

build() {
    nasm $NASMFLAGS ops.asm
    nasm $NASMFLAGS asm_io.asm
    clang $CFLAGS ops.o lualib.c -fPIC --shared -o arith.so
}

test() {
    build
    clang $CFLAGS ops.o test.c -o tester
    echo "[ * ] Testando módulo c"
    ./tester
    echo "[ * ] Testando módulo lua"
    lua test.lua
}

clean() {
    rm *.o *.so tester
}

case "$1" in
    build) build;;
    test) test;;
    clean) clean;;
    *) echo  \
"Comando não especificado ou inválido
Comandos disponívels: build test clean"
    exit 1
;;
esac
