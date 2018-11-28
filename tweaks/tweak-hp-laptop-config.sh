#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Install nVidia drivers and Bumblebee
sudo pacman -S --noconfirm --needed nvidia bumblebee nvidia-utils bbswitch primus lib32-virtualgl lib32-nvidia-utils
sudo gpasswd -a $USER bumblebee
sudo systemctl enable bumblebeed.service

# Configure hw clock to use localtime for dual booting
sudo timedatectl set-local-rtc 1 
sudo hwclock --systohc --local

# Copy script to reset lan after waking
sudo cp config/reset_lan_after_sleep.sh  /usr/lib/systemd/system-sleep/
sudo chown root:root  /usr/lib/systemd/system-sleep/reset_lan_after_sleep.sh 

# Install Bluetooth Driver
sudo pacman --needed -S linux-headers dkms
yay -S rtbth-dkms-git
sudo cp config/rtbth.conf /etc/modules-load.d/

# Disable reflector service 
sudo systemctl stop reflector.timer
sudo systemctl disable reflector.timer