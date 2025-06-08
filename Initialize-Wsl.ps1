echo "Installing WSL"
wsl --update

echo "Installing WSL Arch Distro"
wsl --install archlinux --name "arch" --no-launch
wsl --set-default "arch"

echo "Running Setup Script"
wsl -e ./arch.setup.sh

echo "Setting up default user"
wsl --manage arch --set-default-user marengo

echo "Hello, World."
wsl