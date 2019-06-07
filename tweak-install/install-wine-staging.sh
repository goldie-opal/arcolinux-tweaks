#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

sudo pacman -S --noconfirm --needed lib32-alsa-plugins lib32-libpulse wine-staging
yay -S wine-installer
