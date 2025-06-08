#!/bin/bash

echo "Refreshing pacman caches"
pacman -Syu --noconfirm

echo "Installing git"
pacman -S --noconfirm git

staging_dir=$(mktemp -d)
pushd .

echo "Working in $staging_dir"
cd $staging_dir

echo "Grabbing dotfies from GitHub"

git clone --depth=1 https://github.com/marengohue/wsl-arch-dotfiles
cd wsl-arch-dotfiles/scripts
sh user.sh $1
sh util.sh
sh home.sh $1
sh tmux.sh $1
sh nvim.sh $1

echo "Cleaning up temp files"
popd
rm $staging_dir -rf

