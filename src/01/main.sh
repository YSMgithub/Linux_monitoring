#!/bin/bash

if [[ -z "$1" ]] || [[ -n "$2" ]] || [[ $1 =~ ^[0-9]+$ ]]
then
    echo "Incorrect input"
else
    echo $1
fi