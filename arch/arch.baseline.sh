echo "Refreshing pacman caches"
pacman -Syu --noconfirm

echo "Installing git"
pacman -S --noconfirm git

staging_dir=$(mktemp -d)
cd $staging_dir
