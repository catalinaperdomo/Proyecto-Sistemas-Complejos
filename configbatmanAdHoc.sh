#!/bin/bash

#Modo 
sudo modprobe batman-adv
#Se para el proseso de red de la maquina
sudo pkill NetworkManager
#se apaga la interfaz wan de la maquina y se asigna el modo adhoc
sudo ifconfig wlp0s20f3 down
sudo iwconfig wlp0s20f3 mode ad-hoc 

sudo ifconfig wlp0s20f3 mtu 1532
#Asignacion del acces point y el channel
sudo iwconfig wlp0s20f3 mode ad-hoc essid RED-Adhoc ap 02:1B:55:AD:0C:02  channel 1 
sleep 1
#Se enciende la interfaz wan de la maquina
sudo ip link set wlp0s20f3 up 
sleep 1
#Se asigna la interfaz virtual de BATMAN a la WAN
sudo batctl if add wlp0s20f3
sudo ifconfig bat0 up
#Se asigna la IP a la interfaz virtual
sudo ifconfig bat0 192.168.0.5/24


echo "Configuracion realizada con exito"
