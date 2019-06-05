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


function installNvidiaDrivers() {
	# Install nVidia drivers and Optimus Manager
	sudo pacman -S --noconfirm --needed nvidia nvidia-utils bbswitch lib32-virtualgl lib32-nvidia-utils  nvidia-settings xf86-video-nouveau
	yay -S optimus-manager optimus-manager-qt
}


function setHardwareClock() {
	# Configure hw clock to use localtime for dual booting
	sudo timedatectl set-local-rtc 1 
	sudo hwclock --systohc --local
}


function installBlueToothDriver() {
	# Install Bluetooth Driver -  may be causing issues with latest kernels
	sudo pacman --needed --noconfirm -S linux-headers dkms
	yay -S rtbth-dkms-git
	sudo touch /etc/modules-load.d/rtbth.conf
	sudo su -c 'echo -e "rtbth" > /etc/modules-load.d/rtbth.conf'
}

function setPeriodicTrim() {
	#Enable periodic trim
	sudo sed -i 's/,discard / /g' /etc/fstab
	sudo systemctl enable fstrim.timer
	sudo systemctl start fstrim.timer
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
installNvidiaDrivers
setHardwareClock
#installBlueToothDriver
setPeriodicTrim
applyTweaks