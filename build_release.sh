#!/bin/bash

path=$(dirname "$0")

if [[ ! -f "$path"/main.c ]]; then
    exit 1
fi

gcc -std=c99 -Wall -Werror -Wextra -O3 -o "$path"/app.exe "$path"/main.c
