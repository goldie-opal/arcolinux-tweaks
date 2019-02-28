#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
# Add my repo
echo '
[arcolinux_repo_go]
SigLevel = PackageOptional DatabaseOptional
Server = https://goldie-opal.github.io/$repo/$arch
' | sudo tee --append /etc/pacman.conf


# Set pacman mirrors
sudo cp config/mirrorlist /etc/pacman.d/mirrorlist
sudo chown root:root /etc/pacman.d/mirrorlist
sudo pacman -Sy

# Install intel microcode
sudo pacman -S --noconfirm intel-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Install nVidia drivers 
if pacman -Qi "conky-lua-archers" &> /dev/null; then
	sudo pacman -R --noconfirm conky-lua-archers libxnvctrl
fi
sudo pacman -S --noconfirm --needed nvidia-340xx nvidia-340xx-utils lib32-virtualgl lib32-nvidia-340xx-utils libxnvctrl-340xx
yay conky-lua-archers

# Disable reflector service when using local cache
sudo systemctl stop reflector.timer
sudo systemctl disable reflector.timer

# Install my packages
sudo pacman -S --needed --noconfirm xappearance-gtk3 archway-theme-git sardi-ghost-flexible-archway-git arcolinux-wallpapers-go-git
yay -S youtube-dl-gui-git ttf-mac-fonts tamzen-font-git mint-themes mint-y-icons mint-x-icons