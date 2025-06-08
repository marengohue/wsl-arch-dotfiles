#!/usr/bin/sh

username="marengo"

echo "Creating user $username"
useradd --create-home $username
passwd $username

echo "Refreshing pacman caches"
pacman -Syu --noconfirm

echo "Installing software"
pacman -S --noconfirm sudo nvim which base-devel git

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

echo "Creating a config symlink for %appdata% in ~/.win.config"
host_home=$(wslpath $(cmd.exe /C "echo %USERPROFILE%" 2>/dev/null | tr -d '\r'))
ln -s "$host_home/AppData/Roaming" "/home/$username/.win.config"
