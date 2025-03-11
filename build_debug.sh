#!/bin/bash

path=$(dirname "$0")

if [ ! -f "$path"/main.c ]; then
    exit 1
fi

gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -g3 -o "$path"/main.exe "$path"/main.c -lm
