#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

function updateMirrors() {
	sudo su -c 'echo -e "Server = http://mirror.internode.on.net/pub/archlinux/\$repo/os/\$arch\nServer = http://ftp.iinet.net.au/pub/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist'
	sudo pacman -Syu	
}

function installIntelUcode() {
	# Install intel microcode
	sudo pacman -S --noconfirm intel-ucode
	sudo grub-mkconfig -o /boot/grub/grub.cfg
}

function installNvidiaDrivers() {
	# Install nVidia drivers and Bumblebee
	sudo pacman -S --noconfirm --needed nvidia bumblebee nvidia-utils bbswitch primus lib32-virtualgl lib32-nvidia-utils lib32-primus nvidia-settings
	sudo gpasswd -a $USER bumblebee
	sudo systemctl enable bumblebeed.service
}

function installNvidiaDriversOptimusManager() {
	# Install nVidia drivers and Optimus Manager
	sudo pacman -S --noconfirm --needed nvidia nvidia-utils bbswitch lib32-virtualgl lib32-nvidia-utils nvidia-settings xf86-video-nouveau

	if pacman -Qi "optimus-manager" &> /dev/null; then
		echo
	else
		yay -S optimus-manager optimus-manager-qt
		sudo systemctl enable optimus-manager.service
	fi	
}

function setHardwareClock() {
	# Configure hw clock to use localtime for dual booting
	sudo timedatectl set-local-rtc 1 
	sudo hwclock --systohc --local
}

function installBlueToothDriver() {
	# Install Bluetooth Driver -  may be causing issues with latest kernels
	if pacman -Qi "rtbth-dkms-git" &> /dev/null; then
		echo
	else
		sudo pacman --needed --noconfirm -S linux-headers dkms
		yay -S rtbth-dkms-git
		sudo touch /etc/modules-load.d/rtbth.conf
		sudo su -c 'echo -e "rtbth" > /etc/modules-load.d/rtbth.conf'
	fi

}

function setPeriodicTrim() {
	#Enable periodic trim
	sudo sed -i 's/,discard / /g' /etc/fstab
	sudo systemctl enable fstrim.timer
	sudo systemctl start fstrim.timer
}

function applyTweaks() {
	# Fix dns
	sudo pacman -S --needed systemd-resolvconf vivaldi-widevine vivaldi-ffmpeg-codecs flashplugin pepper-flash
	yay youtube-dl-gui-git 
	# Set number of cores
	~/.bin/main/000-use-all-cores-makepkg-conf-v4.sh
	sudo sed -i 's/loglevel=/udev.log_priority=/g' /etc/defaults/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	sudo sed -i 's/ fsck / /g' /etc/mkinitcpio.conf
	sudo mkinitcpio -p linux
}

function installWine() {
	sudo pacman -S --noconfirm --needed lib32-alsa-plugins lib32-libpulse
	if pacman -Qi "wine-installer-git" &> /dev/null; then
		echo
	else
		yay -S wine-installer-git		
	fi
}

function installWineStaging() {
	sudo pacman -S --noconfirm --needed lib32-alsa-plugins lib32-libpulse wine-staging
	if pacman -Qi "wine-installer-git" &> /dev/null; then
		echo
	else
		yay -S wine-installer-git
	fi
}

function installMintTheme() {
	if pacman -Qi "mint-x-icons" &> /dev/null; then
		dconf load /org/cinnamon/ < mint-y-aqua
	else
		yay -S --noconfirm mint-x-icons
		yay -S --noconfirm mint-y-icons
		yay -S --noconfirm mint-themes
		yay -S --noconfirm papirus-maia-icon-theme-git
		dconf load /org/cinnamon/ < mint-y-dark-teal
		sudo cp lightdm-gtk-greeter.conf /etc/lightdm
	fi
}

updateMirrors
#installIntelUcode
#installNvidiaDrivers
installNvidiaDriversOptimusManager
setHardwareClock
installBlueToothDriver
#installWine
#installWineStaging
setPeriodicTrim
applyTweaks
installMintTheme
