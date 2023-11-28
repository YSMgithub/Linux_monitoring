#!/bin/bash
source config.sh
source colours.sh

checkFLG=$(bash check.sh)

if [[ -n "$checkFLG" ]]
then
    echo "$checkFLG"
    exit 0
fi

if [[ -z "$column1_background" ]] || [[ -z "$column1_font_color" ]] || [[ -z "$column2_background" ]] || [[ -z "$column2_font_color" ]]
then
    # default colours
    col_1_BG=1
    col_1_TXT=6
    col_2_BG=6
    col_2_TXT=1 
fi

if [[ -n "$column1_background" ]] && [[ -n "$column1_font_color" ]] && [[ -n "$column2_background" ]] && [[ -n "$column2_font_color" ]]
then
    # from config
    col_1_BG=$column1_background
    col_1_TXT=$column1_font_color
    col_2_BG=$column2_background
    col_2_TXT=$column2_font_color
fi

p1="\033[0;${colours[col_1_TXT - 1]};${colours[col_1_BG + 5]}m"
p2="\033[0;${colours[col_2_TXT - 1]};${colours[col_2_BG + 5]}m"
res="\033[0;0m"
ech0="${p1}HOSTNAME$res = $p2$(hostname)$res"
ech1="${p1}TIMEZONE$res = $p2$(timedatectl | grep zone | awk '{print $3}') UTC $(timedatectl | grep Local | awk '{print $6}')$res"
ech2="${p1}USER$res = $p2$(whoami)$res"
ech3="${p1}OS$res = $p2$(hostnamectl | grep System | awk '{out=""; for(i=4;i<=NF;i++){out=out" "$i}; print $3,out}')$res"
ech4="${p1}DATE$res = $p2$(date | awk '{print $2,$3,$4,$5}')$res"
ech5="${p1}UPTIME$res = $p2$(uptime -p)$res"
ech6="${p1}UPTIME_SEC$res = $p2$(cat /proc/uptime | awk '{print $1}')$res"
ech7="${p1}IP$res = $p2$(ifconfig | grep inet | awk 'NR == 1 {print $2}')$res"
ech8="${p1}MASK$res = $p2$(ifconfig | grep inet | awk 'NR == 1 {print $4}')$res"
ech9="${p1}GATEWAY$res = $p2$(ip r | grep default | awk 'NR == 1 {print $3}')$res"
ech10="${p1}RAM_TOTAL$res = $p2$(free | awk 'NR == 2 {printf("%.3f Gb\n", $2/1024/1024)}')$res"
ech11="${p1}RAM_USED$res = $p2$(free | awk 'NR == 2 {printf("%.3f Gb\n", $3/1024/1024)}')$res"
ech12="${p1}RAM_FREE$res = $p2$(free | awk 'NR == 2 {printf("%.3f Gb\n", $4/1024/1024)}')$res"
ech13="${p1}SPACE_ROOT$res = $p2$(df /root | awk 'NR == 2 {printf("%.2f MB\n", $2/1024)}')$res"
ech14="${p1}SPACE_ROOT_USED$res = $p2$(df /root | awk 'NR == 2 {printf("%.2f MB\n", $3/1024)}')$res"
ech15="${p1}SPACE_ROOT_FREE$res = $p2$(df /root | awk 'NR == 2 {printf("%.2f MB\n", $4/1024)}')$res"

function print {
    name_my="ech${i}"
    echo -e "${!name_my}"
}

i=0

while [ $i -lt 15 ]
do
    print
    ((++i))
done

export col_1_BG
export col_1_TXT
export col_2_BG
export col_2_TXT 

bash echo_colour_info.sh
