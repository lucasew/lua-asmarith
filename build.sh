#!/usr/bin/env bash
COMPILER=gcc
NASM=nasm

NASMFLAGS="-felf32 -DELF_TYPE"
CFLAGS="--target=i386-pc-linux-gnu -g -lc"

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
    lua32 test.lua
}

clean() {
    rm *.o *.so tester
}

case "$1" in
    build) build;;
    test) test;;
    clean) clean;;
    *) echo "Comando não especificado ou inválido";;
esac


exit 1
