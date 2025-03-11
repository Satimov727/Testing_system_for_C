#!/bin/bash

path=$(dirname "$0")

if [ ! -f "$path"/main.c ]; then
    exit 1
fi

clang -std=c99 -Wall -Werror -fsanitize=address -fno-omit-frame-pointer -g -o "$path"/main_asan.exe "$path"/main.c -lm
