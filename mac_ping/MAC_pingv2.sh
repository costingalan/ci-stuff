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

  echo "Time: $(date +%H:%M:%S -u) Details: $(sudo macping "$mac" -c 5 2>/dev/null | grep "5 packets") " >> "$host/$mac/$logfile"

done
