#!/bin/bash

#This is my third challenge script for this class.

#Checking to see if I have lxd already installed
#Using which command to see if I have it already
which lxd >/dev/null
if [ $? -ne 0 ]; then
#I don't have lxd already installed, so I need to install it now
               sudo snap install lxd
else
#I already have lxd
               echo "lxd is already installed"
fi


#Testing to see if I have lxdbr0 interface
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


#Launching a container running Ubuntu 20.04 server named COMP2101-S22
#Using which command to see if I have lxc existing
which lxc >/dev/null
if [ $? = 0 ]; then
#I already have lxc 
              lxc launch ubuntu:20.04 COMP2101-S22
else
#I did not find lxc yet, so exit with an echo message
              echo "Oops! You don't even have lxc yet."
fi


              
