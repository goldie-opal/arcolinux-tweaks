#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Install intel microcode
sudo pacman -S --noconfirm intel-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Configure hw clock to use localtime for dual booting
sudo timedatectl set-local-rtc 1 
sudo hwclock --systohc --local

# Install nVidia drivers 
if pacman -Qi "conky-lua-archers" &> /dev/null; then
	sudo pacman -R --noconfirm conky-lua-archers libxnvctrl
fi
sudo pacman -S --noconfirm --needed nvidia-340xx nvidia-340xx-utils lib32-virtualgl lib32-nvidia-340xx-utils libxnvctrl-340xx


# Install extra packages
yay -S youtube-dl-gui-git ttf-mac-fonts tamzen-font-git
sudo pacman -S --noconfirm --needed pepper-flash flashplugin

# Remove unwanted packages if installed
listOfPackages="chromium
variety
arcolinux-variety
geany
arcolinux-geany
vim
atom
apm
electron
nss-mdns
xterm
simple-scan
amd-ucode
xf86-video-amdgpu
ristretto"

# Remove packages in list if installed
for package in "$listOfPackages"
do
	if pacman -Qi $package &> /dev/null; then
		sudo pacman -R --noconfirm $package
	fi
done

# Faster shutdown
FIND="use_lvmetad = 1"
REPLACE="use_lvmetad = 0"
find /etc/lvm/lvm.conf -type f -exec sudo sed -i "s/$FIND/$REPLACE/g" {} \;
sudo systemctl stop lvm2-lvmetad.socket lvm2-lvmetad.service
sudo systemctl disable lvm2-lvmetad.socket lvm2-lvmetad.service
sudo systemctl mask lvm2-monitor
