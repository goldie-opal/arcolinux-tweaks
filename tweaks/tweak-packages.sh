#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
# Add my repo
echo '
[arcolinux_repo_go]
SigLevel = PackageOptional DatabaseOptional
Server = https://goldie-opal.github.io/$repo/$arch
' | sudo tee --append /etc/pacman.conf


# Install my packages
sudo pacman -S --needed --noconfirm xappearance-gtk3 archway-theme-git sardi-ghost-flexible-archway-git arcolinux-wallpapers-go-git
yay -S youtube-dl-gui-git ttf-mac-fonts tamzen-font-git github-desktop-bin mint-themes mint-y-icons mint-x-icons

