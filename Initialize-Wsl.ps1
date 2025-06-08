echo "Installing WSL"
wsl --update

echo "Installing WSL Arch Distro"
wsl --install archlinux --name "arch" --no-launch
wsl --set-default "arch"

echo "Downloading bootstrap script into a temp location"
$bootstrap = New-TemporaryFile
$r = wget 'https://raw.githubusercontent.com/marengohue/wsl-arch-dotfiles/refs/heads/main/_boostrap.sh'
echo $r.Content | out-file -Encoding utf8 $bootstrap.FullName

echo "Running Setup Script for Arch"
pushd .
cd $bootstrap.Directory
$filename = $bootstrap.Name
wsl -e bash -c "./$filename 'marengo'"
popd

echo "Cleaning up bootstrap script"
rm $bootstrap

echo "Setting up default user"
wsl --manage arch --set-default-user marengo

echo "Hello, World."
wsl