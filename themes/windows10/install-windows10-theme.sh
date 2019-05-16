#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


if pacman -Qi "windows10-gtk-theme-git" &> /dev/null; then
	dconf load /org/cinnamon/ < windows10
else
	yay -S --noconfirm windows10-gtk-theme-git
	yay -S --noconfirm windows10-dark-gtk-theme-git
	yay -S --noconfirm windows10-icon-theme-git
	dconf load /org/cinnamon/ < windows10
fi
