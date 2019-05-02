#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


# Configure hw clock to use localtime for dual booting
sudo timedatectl set-local-rtc 1 
sudo hwclock --systohc --local
