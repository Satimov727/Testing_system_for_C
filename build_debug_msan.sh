#!/bin/bash

path=$(dirname "$0")

if [ ! -f "$path"/main.c ]; then
    exit 1
fi

clang -std=c99 -Wall -Werror -fsanitize=memory -fno-omit-frame-pointer -g -o "$path"/main_msan.exe "$path"/main.c -lm
