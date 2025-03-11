#!/bin/bash

path=$(dirname "$0")

if [[ ! -f "$path"/main.exe ]]; then
    exit 1
fi

"$path"/func_tests/scripts/func_tests.sh "$path"/main.exe

gcov main.c
