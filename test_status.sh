#!/bin/bash
if [ -z "$1"] ; then
   echo " you didn't provide and argument"
   exit 0;
fi
 
status=$(systemctl status $1 | grep Active | awk ' {print $2}')
inactive="inactive"

if [ $status == $inactive ]; then
   echo " noooooooo it is off"
else
   echo  "my status is $status"
fi

