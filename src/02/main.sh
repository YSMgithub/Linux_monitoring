#!/bin/bash

source data.sh

function print {
    name_my="ech${i}"
    echo "${!name_my}"
}

while [ $i -lt 15 ]
do
    print
    ((++i))
done

bash file.sh
