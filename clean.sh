#!/bin/bash

path=$(dirname "$0")

for file in $(find "$path" -type f | sort); do
    if [[ "$file" != *app\.exe && "$file" != *\.md && "$file" != *\.sh && "$file" != *\.txt && "$file" != *\.c || "$file" == *tmp_out.txt ]]; then
        rm "$file"
    fi

done
