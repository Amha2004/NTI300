#!/bin/bash
if [ -z $1] 
then
   echo "specify the programm or service you would like to instll"
   exit 0;
fi
installed=$(rpm -q $1 | grep Installed | awk  '{print $2}')
status=$(rpm -q $1 | grep $1| awk ' {print $2}')
if [[ $installed == $input ]] 
then
      echo "--> ${1} is not installed."
      read -p "--> would you like to install ${1}? [y/n] " yn
            case $yn in
                     [Yy]* ) yum -y install $1;;
                     [Nn]* ) echo "### Exiting installation program."; 
                     exit 0;;
                     * ) echo "--> please answer yse or no.";; #fix
            esac
else

     echo "--> ${1} is installed
     installed=$(systemctl status $1 | grep Active | awk '{print $2}')
     inactive='inactive'
     
           if [[ $installed == $inactive ]]
           then
               read -p "--> would you like to start ${1}? [y/n] " yn
                     case $yn in
                              [Yy]* ) systemctl start $1;;
                              [Nn]* ) echo "Exiting activation program.";
                              exit 0;;
                     esac
               echo "--> ${1} is now $installed}."
         else
               echo "--> ${1} is ${installed}."
               
        fi
        
fi
