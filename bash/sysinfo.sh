#!/bin/bash
#My first challenge script for this class

#This script displays the important identity information about the system


#This is the fully-qualified domain name for this system
echo FQDN
hostname --fqdn

#This is the OS name and version of the Linux distro in use
echo System Information
hostnamectl

#This is the primary ip address my machine is using
echo Primary IP address
ip a s ens33 | grep -w inet | awk '{print$2}'

#This is the space available for my root filesystem
echo Available space for root filesystem
df -h /dev/sda3 | awk '{print$4}'

exit
