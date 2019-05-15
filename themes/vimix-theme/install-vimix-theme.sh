#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


if pacman -Qi "vimix-icon-theme-git" &> /dev/null; then
	dconf load /org/cinnamon/ < vimix
else
	yay -S --noconfirm vimix-icon-theme-git
	yay -S --noconfirm vimix-gtk-themes-git
	yay -S --noconfirm kvantum-theme-vimix-git
	dconf load /org/cinnamon/ < vimix
fi
