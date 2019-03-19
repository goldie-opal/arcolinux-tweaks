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

# Install nVidia drivers 
if pacman -Qi "conky-lua-archers" &> /dev/null; then
	sudo pacman -R --noconfirm conky-lua-archers libxnvctrl
fi
sudo pacman -S --noconfirm --needed nvidia-340xx nvidia-340xx-utils lib32-virtualgl lib32-nvidia-340xx-utils libxnvctrl-340xx
yay conky-lua-archers
