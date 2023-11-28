#!/bin/bash

source colours.sh
export a=$1
export b=$2
export c=$3
export d=$4
i=0

check=$(bash check.sh)

if [[ -n "$check" ]]
then
    echo "$check"
    exit 0
fi

p1="\033[0;${colours[$2 - 1]};${colours[$1 + 5]}m"
p2="\033[0;${colours[$4 - 1]};${colours[$3 + 5]}m"
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

while [ $i -lt 15 ]
do
    print
    ((++i))
done
