#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

listOfPackages="chromium
variety
arcolinux-variety
geany
arcolinux-geany
vivaldi
vivaldi-codecs-ffmpeg-extra-bin
vim
atom
apm
electron
nss-mdns
xterm
simple-scan
ristretto"

# Remove packages in list if installed
for package in "$listOfPackages"
do
	if pacman -Qi $package &> /dev/null; then
		sudo pacman -R --noconfirm $package
	fi
done