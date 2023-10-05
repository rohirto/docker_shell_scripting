#!/bin/bash

directory="/workspaces/docker_shell_scripting/scripts/test"
#check if our directory exists or not
if [ ! -d "$directory" ]
then
    echo "directory does not exists"
    exit 1
fi


upper() {
    shift
    for i; do
        tr a-z A-Z <"$i" >"$i.out"
        rm "$i"
        mv "$i.out" "$i"
        shift
    done
}

lower() {
    shift
    for i; do
        tr A-Z a-z <"$i" >"$i.out"
        rm "$i"
        mv "$i.out" "$i"
        shift
    done
}

print() {
    shift
    for i; do
        lpr "$i"
        shift
    done
}

usage_error() {
    echo "$1 syntax is $1 <option> <input files>"
    echo ""
    echo "where option is one of the following"
    echo "p - to print frame files"
    echo "u - to save as uppercase"
    echo "l - to save as lowercase"
    echo "example: $1 -u file1.txt"
}

case $1 in
    p | -p) print "$@";;
    u | -u) upper "$@";;
    l | -l) lower "$@";;
    *) usage_error "$(basename "$0")";;
esac
