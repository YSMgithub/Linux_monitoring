#!/bin/bash
source config.sh

for i in $column1_background $column1_font_color $column2_background $column2_font_color
do
    if ! [[ $i =~ ^[0-9]+$ ]]
    then
        echo "Only digit arguments are accept, try again"
        exit 0
    fi
done

for i in $column1_background $column1_font_color $column2_background $column2_font_color
do
    if [ $i -lt 1 ] || [ $i -gt 6 ]
    then
        echo "Only digit from 1 to 6 are accept, try again"
        exit 0
    fi
done

if [[ -n "$column1_background" ]] && [[ -n "$column1_font_color" ]] && [[ -n "$column2_background" ]] && [[ -n "$column2_font_color" ]]
then
    if [ $column1_background -eq $column1_font_color ] || [ $column2_background -eq $column2_font_color ]
    then
        echo "Colors of text and BG cant be equal, try again"
        exit 0
    fi
fi


