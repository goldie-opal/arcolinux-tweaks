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
	sudo pacman --noconfirm -U mint-x-icons-1.5.1-1-any.pkg.tar.xz mint-y-icons-1.3.3-1-any.pkg.tar.xz
	sudo pacman --noconfirm -U mint-themes-1.7.8-1-any.pkg.tar.xz
	dconf load /org/cinnamon/ < mint-y-aqua
fi
