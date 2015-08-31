#!/bin/bash

LOGFILE=$(echo "$(date +%D -u).log" | sed 's:/:-:g')
MAC_ADDRESS=$1

echo "MAC: $MAC_ADDRESS Time: $(date +%H:%M -u) Details: `sudo macping $MAC_ADDRESS -c 5 2>/dev/null | grep "5 packets"` " >> $LOGFILE

