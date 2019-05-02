#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

yay mint-themes
dconf load /org/cinnamon/ < cinnamon_desktop_backup
