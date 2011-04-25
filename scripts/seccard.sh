#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Usage: ./seccard.sh <file> <pos>"
    exit
fi

file=$1
pos=$2

if [ ! -f $file ]; then
    echo "File not found or invalid"
    exit
fi

gpg -d $file | head -$pos | tail -1