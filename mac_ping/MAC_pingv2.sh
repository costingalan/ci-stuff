#!/bin/bash

# Author: cgalan@cloudbasesolutions.com
# License: Apache v2.0
# Testing network connectivity

logfile="$(echo "$(date +%D -u).log" | sed 's:/:-:g')"
hostfile='hosts.txt'

for line in $(cat $hostfile)
do
  mac="$(echo "$line" | awk -F'|' '{print $2}')"
  host="$(echo "$line" | awk -F'|' '{print $1}')"
   
  mkdir -p "$host/$mac"

  [[ "$mac" =~ /(([0-9A-Fa-f]{2}[-:]){5}[0-9A-Fa-f]{2})|(([0-9A-Fa-f]{4}\.){2}[0-9A-Fa-f]{4}|([0-9A-Fa-f]{12}))/ig ]] && ok='1' || ok='0' #testing MAC 

  if [[ $ok == 1 ]]
    then
      echo "Time: $(date +%H:%M -u) Details: $(sudo macping "$mac" -c 5 2>/dev/null | grep "5 packets") " >> "$host/$mac/$logfile"
    else
      echo "The MAC: $mac for HOST: $host is INVALID"
  fi 

done
