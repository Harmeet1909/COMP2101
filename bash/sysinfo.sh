#!/bin/bash
#Doing challenge script for my Lab 2
#Collecting information about my system in a more specific way

#Creating variables for this script

#varibale for finding fully qualified domain name of the system
fqdn=$(echo -n "FQDN: " ; hostname --fqdn)

#variable for getting the operating system's name and version
osversion=$(echo -n "OS-Version: " ; source /etc/os-release ; echo $NAME $VERSION)

#variable to know the ip address being used by computer
ipaddress=$(echo -n "Primary Ip Address: " ; hostname -I)

#variable to find the free available space for root file system
rootfreespace=$(echo -n "Available space for root file system: " ; df -h / | grep -v Avail | awk '{print$4}')
 

 #This is what I am expecting from my script
 
cat <<EOF
Report for my $HOSTNAME
=======================
$fqdn
$osversion
$ipaddress
$rootfreespace
=======================

EOF
