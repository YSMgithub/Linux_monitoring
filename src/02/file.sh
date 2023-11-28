#!/bin/bash

source data.sh

function print {
    name_my="ech${i}"
    echo "${!name_my}"
}

echo "Write data to file? [Y/N]: "
read choose

if [[ $choose = y ]] || [[ $choose = Y ]]
then
    file=$(date +"%d_%m_%Y_%H_%M_%S".status)
    touch $file
    i=0
    while [ $i -lt 15 ]
    do
        print >> $file
        ((++i))
    done
    echo "Saved to: $file"
fi
