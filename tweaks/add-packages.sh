#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

sudo pacman --needed -S lxappearance-gtk3 simplescreenrecorder galculator gimp qbittorrent ufw gufw lm_sensors nomacs timeshift xfburn ttf-ms-fonts 
sudo pacman --needed -S htop hddtemp asciinema dmidecode gnome-screenshot glances playerctl
yay -S youtube-dl-gui-git ttf-mac-fonts tamzen-font-git mint-themes mint-x-icons mint-y-icons