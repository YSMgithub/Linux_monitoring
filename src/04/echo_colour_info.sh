#!/bin/bash
source config.sh

colours_name=(
    "white"
    "red"  
    "green"
    "blue"
    "purple"
    "black"
)
if [[ -n "$column1_background" ]] && [[ -n "$column1_font_color" ]] && [[ -n "$column2_background" ]] && [[ -n "$column2_font_color" ]]
then
    # from config
    echo -e "\nColumn 1 background = $column1_background (${colours_name[$column1_background - 1]})"
    echo "Column 1 font color = $column1_font_color (${colours_name[$column1_font_color - 1]})"
    echo "Column 2 background = $column2_background (${colours_name[$column2_background - 1]})"
    echo "Column 2 font color = $column2_font_color (${colours_name[$column2_font_color - 1]})"
fi

if [[ -z "$column1_background" ]] || [[ -z "$column1_font_color" ]] || [[ -z "$column2_background" ]] || [[ -z "$column2_font_color" ]]
then
    # default colours
    echo -e "Column 1 font color = default (${colours_name[$col_1_BG - 1]})"
    echo "Column 1 background = default (${colours_name[$col_1_TXT - 1]})"
    echo "Column 2 font color = default (${colours_name[$col_2_BG - 1]})"
    echo "Column 2 background = default (${colours_name[$col_2_TXT - 1]})"
fi

