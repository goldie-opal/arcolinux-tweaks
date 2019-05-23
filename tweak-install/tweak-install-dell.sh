#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

function installIntelUcode() {
	# Install intel microcode
	sudo pacman -S --noconfirm intel-ucode
	sudo grub-mkconfig -o /boot/grub/grub.cfg
}

function setHardwareClock() {
	# Configure hw clock to use localtime for dual booting
	sudo timedatectl set-local-rtc 1 
	sudo hwclock --systohc --local
}

function installNvidia340Drivers() {
	# Install nVidia drivers 
	if pacman -Qi "conky-lua-archers" &> /dev/null; then
		sudo pacman -R --noconfirm conky-lua-archers libxnvctrl
	fi
	sudo pacman -S --noconfirm --needed nvidia-340xx nvidia-340xx-utils lib32-virtualgl lib32-nvidia-340xx-utils libxnvctrl-340xx
}


function applyTweaks() {
	# Fix dns
	sudo pacman -S systemd-resolvconf

	# Set number of cores
	~/.bin/main/000-use-all-cores-makepkg-conf-v3.sh

	# Faster shutdown
	FIND="use_lvmetad = 1"
	REPLACE="use_lvmetad = 0"
	find /etc/lvm/lvm.conf -type f -exec sudo sed -i "s/$FIND/$REPLACE/g" {} \;
	sudo systemctl stop lvm2-lvmetad.socket lvm2-lvmetad.service
	sudo systemctl disable lvm2-lvmetad.socket lvm2-lvmetad.service
	sudo systemctl mask lvm2-monitor
}

installIntelUcode
installNvidia340Drivers
setHardwareClock
applyTweaks
