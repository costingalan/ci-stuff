#!/bin/bash

LOGFILE=$(echo "$(date +%D).log" | sed 's:/:-:g')
MAC_ADDRESS=$1

echo "The time is: $(date +%H:%M) Details: `sudo macping $MAC_ADDRESS -c 3 2>/dev/null | grep "3 packets"` " >> $LOGFILE