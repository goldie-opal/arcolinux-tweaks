#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Install nginx
sudo pacman -S nginx-mainline
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
sudo cp config/nginx.conf /etc/nginx/
sudo mkdir -p /srv/http/pacman-cache
sudo chown http:http /srv/http/pacman-cache
sudo mkdir -p /srv/http/arco-pacman-cache
sudo chown http:http /srv/http/arco-pacman-cache
sudo systemctl enable nginx.service
sudo systemctl start nginx.service

# Disable reflector service when using local cache
sudo systemctl stop reflector.timer
sudo systemctl disable reflector.timer

# Update pacman mirrorlist
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo cp config/mirrorlist-with-local-cache /etc/pacman.d/mirrorlist
sudo mv /etc/pacman.d/arcolinux-mirrorlist /etc/pacman.d/arcolinux-mirrorlist.bak
sudo cp config/arcolinux-mirrorlist-with-local-cache /etc/pacman.d/arcolinux-mirrorlist