#!/bin/bash

path=$(dirname "$0")

if [ ! -f "$path"/main.c ];then
    exit 1
fi

clang -std=c99 -Wall -Werror -fsanitize=undefined -fno-omit-frame-pointer -g -o "$path"/main_ubsan.exe "$path"/main.c -lm
