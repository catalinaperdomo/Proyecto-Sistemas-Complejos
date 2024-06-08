#!/bin/bash
# Tell batman-adv which interface to use
sudo batctl if add wlp0s20f3

# Activates the interfaces for batman-adv
sudo ifconfig wlp0s20f3 up
sudo ifconfig bat0 up # bat0 is created via the first command

# setting interfaces
sudo ifconfig wlp0s20f3 mtu 1532
#Asignacion del acces point y el channel
sudo iwconfig wlp0s20f3 mode ad-hoc essid RED-Adhoc ap 02:1B:55:AD:0C:02  channel 1 
sleep 2
sudo ip addr add 192.168.0.5/24 dev wlp0s20f3
