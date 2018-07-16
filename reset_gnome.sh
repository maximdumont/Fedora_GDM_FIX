#!/bin/bash

if[ "$EUID" -ne 0] then 
    echo "Must Be Run As Root"
    exit
fi

if [ $1 == '--dnf-install'] then
    echo "Downloading ..."
    dnf install gdm -y
    dnf install "GNOME Desktop Environment" -y
    else
        echo "Skipping DNF Install..."
fi
if [ $2 =='--enable-gdm'] then
    echo "Setting GDM Service"
    systemctl -f enable gdm.service
fi

if [ $3 =='--enable-graphical-target'] then
    echo 'Setting Graphical Target'
    systemctl set-default graphical.target
fi

if [$4 =='--reboot'] then
    echo 'Rebooting'
    reboot    
fi