#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

sudo pacman -R variety arco-variety geany arco-geany chromium
sudo pacman --needed -S lxappearance-gtk3
yay -S youtube-dl-gui-git ttf-mac-fonts tamzen-font-git github-desktop-bin mint-themes mint-x-icons mint-y-icons