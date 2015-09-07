#!/bin/bash

LOGFILE=$(echo "$(date +%D -u).log" | sed 's:/:-:g')
HOSTFILE=hosts.txt

for line in `cat $HOSTFILE`
do
    MAC=`echo $line | awk -F'|' '{print $2}' `
    HOST=`echo $line | awk -F'|' '{print $1}' `
   
    mkdir -p $HOST/$MAC

    [[ "$MAC" =~ "/(([0-9A-Fa-f]{2}[-:]){5}[0-9A-Fa-f]{2})|(([0-9A-Fa-f]{4}\.){2}[0-9A-Fa-f]{4}|([0-9A-Fa-f]{12}))/ig" ]] && OK=1 || OK=0

    if [[ OK==1 ]]
    then
        echo "Time: $(date +%H:%M -u) Details: `sudo macping $MAC -c 5 2>/dev/null | grep "5 packets"` " >> $HOST/$MAC/$LOGFILE
    else
        echo "The MAC: $MAC is INVALID"
    fi 

done
