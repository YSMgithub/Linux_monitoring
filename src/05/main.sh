#!/bin/bash

START=$(date +%s)
path=$1

if [[ -d "$path" ]] && [[ ${path:(-1)} = '/' ]]
then
    bash echo.sh $path
    END=$(date +%s)
    TIME=$(( $END - $START ))
    echo "Script execution time (in seconds) =  $TIME"
else
    echo "no such directory"
fi