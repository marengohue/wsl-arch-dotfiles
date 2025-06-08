#!/bin/bash

echo "Refreshing pacman caches"
pacman -Syu --noconfirm

echo "Installing git"
pacman -S --noconfirm git

echo "Setting up HTTPS credentials manager for git"
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"

staging_dir=$(mktemp -d)
pushd .

echo "Working in $staging_dir"
cd $staging_dir

echo "Grabbing dotfies from GitHub"

git clone --depth=1 https://github.com/marengohue/wsl-arch-dotfiles
cd wsl-arch-dotfiles/scripts
bash user.sh $1
bash util.sh
bash home.sh $1
bash tmux.sh $1
bash nvim.sh $1

echo "Cleaning up temp files"
popd
rm $staging_dir -rf

