#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Disable reflector service when using local cache
sudo systemctl stop reflector.timer
sudo systemctl disable reflector.timer

# Update pacman mirrorlist
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo cp config/mirrorlist-with-local-cache /etc/pacman.d/mirrorlist
sudo mv /etc/pacman.d/arcolinux-mirrorlist /etc/pacman.d/arcolinux-mirrorlist.bak
sudo cp config/arcolinux-mirrorlist-with-local-cache /etc/pacman.d/arcolinux-mirrorlist