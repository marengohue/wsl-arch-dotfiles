#!/bin/bash

username=$1

pacman -Sy --noconfirm tmux

echo "Appending .tmuxrc to .bashrc"
cat ../config/.tmuxrc >> /home/$username/.bashrc