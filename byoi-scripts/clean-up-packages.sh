#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Remove un-needed packages
sudo pacman -Rns $(pacman -Qtdq)

# Clean pacman cache
sudo pacman -Sc
