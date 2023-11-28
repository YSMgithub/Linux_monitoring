#!/bin/bash

ech0="HOSTNAME = $(hostname)"
ech1="TIMEZONE = $(timedatectl | grep zone | awk '{print $3}') UTC $(timedatectl | grep Local | awk '{print $6}')"
ech2="USER = $(whoami)"
ech3="OS = $(hostnamectl | grep System | awk '{out=""; for(i=4;i<=NF;i++){out=out" "$i}; print $3,out}')"
ech4="DATE = $(date | awk '{print $2,$3,$4,$5}')"
ech5="UPTIME = $(uptime -p)"
ech6="UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
ech7="IP = $(ifconfig | grep inet | awk 'NR == 1 {print $2}')"
ech8="MASK = $(ifconfig | grep inet | awk 'NR == 1 {print $4}')"
ech9="GATEWAY = $(ip r | grep default | awk 'NR == 1 {print $3}')"
ech10="RAM_TOTAL = $(free | awk 'NR == 2 {printf("%.3f Gb\n", $2/1024/1024)}')"
ech11="RAM_USED = $(free | awk 'NR == 2 {printf("%.3f Gb\n", $3/1024/1024)}')"
ech12="RAM_FREE = $(free | awk 'NR == 2 {printf("%.3f Gb\n", $4/1024/1024)}')"
ech13="SPACE_ROOT = $(df /root | awk 'NR == 2 {printf("%.2f MB\n", $2/1024)}')"
ech14="SPACE_ROOT_USED = $(df /root | awk 'NR == 2 {printf("%.2f MB\n", $3/1024)}')"
ech15="SPACE_ROOT_FREE = $(df /root | awk 'NR == 2 {printf("%.2f MB\n", $4/1024)}')"
i=0
