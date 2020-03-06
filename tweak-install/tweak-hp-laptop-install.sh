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

function installNvidiaDriversOptimusManager() {
	# Install nVidia drivers and Optimus Manager
	sudo pacman -S --noconfirm --needed nvidia nvidia-utils bbswitch lib32-virtualgl lib32-nvidia-utils nvidia-settings xf86-video-nouveau

	if pacman -Qi "optimus-manager" &> /dev/null; then
		echo
	else
		yay -S --noconfirm optimus-manager optimus-manager-qt
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
		yay -S --noconfirm rtbth-dkms-git
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
	sudo pacman -S --needed systemd-resolvconf 
	sudo pacman -S --needed --noconfirm vivaldi-widevine vivaldi-ffmpeg-codecs flashplugin pepper-flash
	sudo pacman -S --needed --noconfirm qt5-translations aspell-en gimp-help-en hunspell-en_AU hyphen-en firefox-i18n-en-us thunderbird-i18n-en-us hunspell-en_US
	yay youtube-dl-gui-git 
	# Set number of cores
	~/.bin/main/000-use-all-cores-makepkg-conf-v4.sh
	sudo sed -i 's/loglevel=/udev.log_priority=/g' /etc/default/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	sudo sed -i 's/ fsck/ /g' /etc/mkinitcpio.conf
	sudo mkinitcpio -p linux
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

function Gaming() {
	sudo pacman -S --needed --noconfirm wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader wine-gecko wine-mono
	sudo pacman -S --needed --noconfirm arcolinux-meta-steam lutris
}


updateMirrors
installIntelUcode
installNvidiaDriversOptimusManager
setHardwareClock
installBlueToothDriver
setPeriodicTrim
applyTweaks
installMintTheme
Gaming