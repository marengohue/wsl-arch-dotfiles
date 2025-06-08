#!/bin/bash

username=$1

echo "Creating user $username"
useradd --create-home $username
passwd $username

echo "Installing software"
pacman -S --noconfirm sudo nvim which

echo "Adding user $username to sudoers file"
echo "$username   ALL=(ALL:ALL) ALL" >> /etc/sudoers

nvim_location=$(which nvim)
echo "Nvim binary found at $nvim_location"
echo "Setting nvim as default visudo editor"
echo "Defaults      editor=$nvim_location, !env_editor" >> /etc/sudoers

echo "Detecting windows username"
IFS='\' read -ra userbits <<< $(WHOAMI.exe)
win_username=${userbits[1]}
echo $win_username
