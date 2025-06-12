#!/bin/bash

echo "Installing necessry software to use with nvim"
pacman -Sy --noconfirm ripgrep fd unzip gcc make

echo "Installing nvim dotfiles"
git clone https://github.com/marengohue/nvim-dotfiles "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
