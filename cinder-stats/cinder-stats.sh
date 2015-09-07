#!/bin/bash

#This tool looks in the logs file and returns the number of total builds, sucess builds and failed builds on every job.
#It looks at iSCSI builds, SMB3_linux and SMB3_windows.
#Usage: ./cinder-stats.sh LOGFILE

#Exit status  number:
#    "1": The logfile was not specified.
#    "2": The logfile does not exist.
#    "3": The logfile does not exist and you don't want to create one.


if [[ $# != 1 ]];
then
    echo "We need the LOGFILE as a parameter!"  
    exit 1;
fi

LOGFILE=$1
if [ ! -f $LOGFILE ];
then
    echo "$LOGFILE does not exist"
    exit 2;
fi

case "${create_logfile}" in
    Y)
      echo "Creating $LOGFILE for results"
      touch $LOGFILE
    N)
      echo "Please create the logfile and run the script again."
      echo "Exiting"
      exit 3;
 
esac
