#!/bin/bash

username=$1

echo "Creating a config symlink for %appdata% in ~/.win.config"
host_home=$(wslpath $(cmd.exe /C "echo %USERPROFILE%" 2>/dev/null | tr -d '\r'))
ln -s "$host_home/AppData/Roaming" "/home/$username/.win.config"

echo "Copying .bashrc"
cp ../config/.bashrc /home/$username --force

echo "Setting up alacritty config"
mkdir --parents "/home/$username/.win.config/alacritty"
cp "../config/alacritty.toml" "/home/$username/.win.config/alacritty/alacritty.toml"