#!/bin/bash

failed_tests=0

path=$(dirname "$0")

if [[ ! -f "$path"/../../"$1" || "$1" != *\.exe ]]; then
    exit 255
fi

for in_file in $(find "$path"/../data -name "pos_*_in.txt" | sort); do
    out_file=${in_file//in/out}
    
    if ! "$path"/pos_case.sh "$in_file" "$out_file" "$1"; then
        failed_tests=$((failed_tests + 1))
        if [ "$2" == -v ]; then
            echo "$(basename "$in_file"): FAIL"
        fi
    else
        if [ "$2" == -v ]; then 
            echo "$(basename "$in_file"): PASS"
        fi
    fi
done

for in_file in "$path"/../data/neg_*_in.txt; do
    if ! "$path"/neg_case.sh "$in_file" "$1"; then
        if [ "$2" == -v ]; then
            echo "$(basename "$in_file"): FAIL"
        fi
        failed_tests=$((failed_tests + 1))
    else
        if [ "$2" == -v ]; then
            echo "$(basename "$in_file"): PASS"
        fi
    fi
done

exit $failed_tests
