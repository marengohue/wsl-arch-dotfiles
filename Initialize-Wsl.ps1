echo "Installing WSL"
wsl --update

echo "Installing WSL Arch Distro"
wsl --install archlinux --name "arch" --no-launch
wsl --set-default "arch"

echo "Running Setup Script for Arch"
wsl -e sh -c '$(curl -fsSL https://raw.githubusercontent.com/marengohue/wsl-arch-dotfiles/refs/heads/main/_bootstrap.sh) "marengo"'

echo "Setting up default user"
wsl --manage arch --set-default-user marengo

echo "Hello, World."
wsl