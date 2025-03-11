#!/bin/bash

if [[ $# -lt 3 ]]; then
    exit 1
fi

if [[ ! -f "$1" || ! -f "$2" ]]; then
    exit 2
fi

path=$(dirname "$0")

if ! "$path"/../../"$3" < "$1" > "$path"/tmp_out.txt; then
    exit 3
fi

if ! "$path"/comparator.sh "$2" "$path"/tmp_out.txt; then
    exit 3
fi

exit 0
