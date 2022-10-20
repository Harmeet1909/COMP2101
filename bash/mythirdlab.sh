#!/bin/bash

#This is my third challenge script for this class.

#####Checking to see if I have lxd already installed
#Using which command to see if I have it already
which lxd >/dev/null
if [ $? -ne 0 ]; then
#I don't have lxd already installed, so I need to install it now
               sudo snap install lxd
else
#I already have lxd
               echo "lxd is already installed"
fi




#####Testing to see if I have lxdbr0 interface
#Searching route table to see if I have lxdbr0 interface already
#Need to run lxd init --auto if no lxdbr0 is found
ip r | grep lxdbr0 > /dev/null
if [ $? -ne 0 ]; then
#I don't have any lxdbr0 interface 
                lxd init --auto
else
#lxdbr0 interface already exists
                echo "lxdbr0 interface is already existing"
fi




#####Launching a container running Ubuntu 20.04 server named COMP2101-S22
#Using lxc list to verify whether if I have the container or not
sudo lxc list COMP2101
if [ $? -eq 0 ]; then
#I have the container already,so exit with an echo message
               echo "You already have COMP2101-S22 container."
else
#Need to launch the container
                lxc launch ubuntu:20.04 COMP2101-S22
                if [ $? -eq 0 ];then
                #Successfully launched
                              echo "The required container has been successfully launched."
                else
                #Failed to launch, notify user and exit
                              echo "COMP2101-S22 could not be made and thus failed to launch." >&2
                              exit 1
                fi
fi




#####Adding the container's current IP address in /etc/hosts
#Checking to see if COMP2101-S22 is already there using grep command
grep COMP2101-S22 /etc/hosts >/dev/null
if [ $? -eq 0 ];then
#Current IP address of COMP2101-S22 is already there in /etc/hosts
              echo "You already have the current ip address of COMP2101-S22 in /etc/hosts."
else
#Need to add IP in /etc/hosts
              lxc list -f compact -c 4n COMP2101-S22 | grep -v IPV4 | sudo tee -a /etc/hosts
              if [ $? -eq 0 ];then
              #Successfully added
                            echo "The current IP address of COMP2101-S22 is successfully added to /etc/hosts."
              else 
              #Failed to add, notify user and exit
                            echo "The required IP address could not be added in /etc/hosts." >&2
                            exit 1
              fi
fi
               



#####Checking to see if I have apache2 already installed
#Using which command to see if I have it already
sudo lxc exec COMP2101-S22 'which apache2' >/dev/null
if [ $? -ne 0 ]; then
#I don't have apache2 already installed, so I need to install it now
               sudo apt install apache2
else
#I already have apache2
               echo "apache2 is already installed"
fi




#####Retrieving the default web page from container's web service
#Running which command to see if I have curl already installed
sudo lxc exec COMP2101-S22 'which curl' >/dev/null 
if [ $? -ne 0 ];then
#I need to install curl first
                sudo apt install curl
else
#I already have curl installed             
#Running curl http://COMP2101-S22 command to retrieve the web page
                sudo lxc exec COMP2101-S22 'curl http://COMP2101-S22' 
                if [ $?-eq 0 ];then
                #Succeeded in retrieving the default web page
                               echo "Succeeded in retrieving the default web page."
                else
                #Failed in retriving the web page
                               echo "Failed in retrieving the default web page." >&2 
                exit 1 
                fi  
fi 

