#!/bin/bash
set -e

if command -v apt-get &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y lua5.3 liblua5.3-dev nasm clang
else
    echo "Warning: apt-get not found. Skipping system dependency installation."
    echo "Please ensure lua5.3, liblua5.3-dev, nasm, and clang are installed."
fi
