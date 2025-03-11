#!/bin/bash

file1=$(cat "$1")
file2=$(cat "$2")

nums1=""
nums2=""

for el in $file1; do
	if [[ "$el" =~ ^[-+]?[0-9]+\.?[0-9]*$ ]]; then
		nums1="$nums1$el "
	fi
done

for el in $file2; do
	if [[ "$el" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
		nums2="$nums2$el "
	fi
done

if [[ "$nums1" != "$nums2" ]]; then
	exit 1
fi

exit 0
