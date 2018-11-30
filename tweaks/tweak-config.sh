#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


RemovePackages () {
	for package in $1
	do
		if pacman -Qi $package &> /dev/null; then
			sudo pacman -R --noconfirm $package
		fi
	done
}

# Set pacman mirrors
sudo cp config/mirrorlist /etc/pacman.d/mirrorlist
sudo chown root:root /etc/pacman.d/mirrorlist
sudo pacman -Sy

# Install intel microcode
sudo pacman -S --noconfirm intel-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Add some extra packages
yay --noconfirm --needed -S tamzen-font-git ttf-mac-fonts youtube-dl-gui-git youtube-dl ttf-pizzadude-bullets

# Remove unwanted packages
RemovePackages "urxvt-perls urxvt-resize-font-git rxvt-unicode rxvt-unicode-terminfo xterm"
RemovePackages "geany vim vim-runtime atom apm electron"
RemovePackages "variety arcolinux-variety-git plank arcolinux-plank-git arcolinux-plank-themes-git"
RemovePackages "vivaldi-codecs-ffmpeg-extra-bin vivaldi chromium"
RemovePackages "zsh-completions zsh-syntax-highlighting oh-my-zsh-git zsh"

sudo sed -i 's/mdns dns wins/dns/g' /etc/nsswitch.conf
