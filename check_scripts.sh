#!/bin/bash

path=$(dirname "$0")

find "$path" -name "*\.sh" -exec shellcheck "{}" \; 
