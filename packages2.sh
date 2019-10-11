#!/bin/bash
https://raw.githubusercontent.com/Am#!/bin/bashfor packages in $(cat packages.txt); doyum -y install $packagesdoneha2004/NTI300/master/packages.txt
yum -y install wget
for packages in $(cat packages.txt); do
yum -y install $packages
done
