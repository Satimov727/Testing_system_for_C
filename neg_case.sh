#!/bin/bash

if [[ $# -lt 2 ]]; then
    exit 1
fi

if [[ ! -f "$1" ]]; then
    exit 2
fi

path=$(dirname "$0")

if "$path"/../../"$2" < "$1" > "$path"/tmp_out.txt; then
    exit 3
fi

exit 0
