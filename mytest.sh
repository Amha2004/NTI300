#!/bin/bash
if [ -z "$1"] ; then
   echo "EDITOR  Enter an  argument"
   exit 0;
fi
installed=$(yum list installed  $1 | grep $1 | awk -F. '{print $1}')
input="$1"
status=$(systemctl status $1 | grep Active | awk ' {print $2}')
inactive="inactive"
if [ $installed == $input ]; then
   echo "This package is installed"
   if [ $status == $inactive ]; then
        echo "Nooooo it is turned off"
        echo "Do you wish to start $1? 1 for yes, 2 for no:"
        select yn in "yes", "no"; do
        case $yn in
             yes  ) sysetmctl start $input; break;;
             no  ) exit 0;;
        esac
  done
else
    echo "My status is $status"
fi
else
   echo "you have not installed this packages "
echo "Do you wish to installed $input? 1 for yes, 2 for no;"
   select yn in "yes" "no"; do
                  case $yn in
 
                  yes ) yum install -y $input; break;;
                   no  ) exit 0;;
      
              esac
       done
fi
