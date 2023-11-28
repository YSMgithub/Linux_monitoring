#!/bin/bash

if [[ -z "$a" ]] || [[ -z "$b" ]] || [[ -z "$c" ]] || [[ -z "$d" ]]
then
    echo "Please, use script with 4 digit arguments from 1 to 6"
    exit 0
fi

for i in $a $b $c $d
do
    if ! [[ $i =~ ^[0-9]+$ ]]
    then
        echo "Only digit arguments are accept, try again"
        exit 0
    fi
done

for i in $a $b $c $d
do
    if [ $i -lt 1 ] || [ $i -gt 6 ]
    then
        echo "Only digit from 1 to 6 are accept, try again"
        exit 0
    fi
done

if [ $a -eq $b ] || [ $c -eq $d ]
then
    echo "Colors of text and BG cant be equal, try again"
    exit 0
fi
