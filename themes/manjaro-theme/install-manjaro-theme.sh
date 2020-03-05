#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


if pacman -Qi "mint-x-icons" &> /dev/null; then
	dconf load /org/cinnamon/ < mint-y-aqua
else
	yay -S --noconfirm mint-x-icons
	yay -S --noconfirm mint-y-icons
	yay -S --noconfirm mint-themes
	yay -S --noconfirm papirus-maia-icon-theme-git
	dconf load /org/cinnamon/ < mint-y-dark-teal
	sudo cp lightdm-gtk-greeter.conf /etc/lightdm
fi
