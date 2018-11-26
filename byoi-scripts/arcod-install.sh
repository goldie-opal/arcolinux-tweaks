#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


# remove calamares packages from packages.x86_64
sed -i '/calamares/d' packages.x86_64
# remove blank and commented lines from packages.x86_64
sed -i '/^#/d' packages.x86_64
sed -i '/^$/d' packages.x86_64

# Backup pacman.conf before adding iso repo
cp /etc/pacman.conf pacman.conf

sudo su -c 'echo -e "\n[arcolinux_repo_iso]\nSigLevel = Required DatabaseOptional\nInclude = /etc/pacman.d/arcolinux-mirrorlist" >> /etc/pacman.conf'
sudo pacman -Syyu

# Install from packages.x86_64
sudo pacman --noconfirm --needed -S $(< packages.x86_64 )

# remove iso repo
sudo cp pacman.conf /etc/pacman.conf 
sudo pacman -Syy

# Enable LightDM if installed
if pacman -Qi lightdm &> /dev/null; then
	sudo systemctl enable lightdm.service
	sudo systemctl set-default graphical.target
fi
# Enable NetworkManager service if installed
if pacman -Qi networkmanager &> /dev/null; then
	sudo systemctl enable NetworkManager.service
fi
# Enable cups service if installed
if pacman -Qi ntp &> /dev/null; then
	sudo systemctl enable org.cups.cupsd.service
fi
# Enable bluetooth service if installed
if pacman -Qi bluez &> /dev/null; then
	sudo systemctl enable bluetooth.service
	# Set bluetooth to auto enable
	sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf
fi
# Enable ntpd service if installed
if pacman -Qi ntp &> /dev/null; then
	sudo systemctl enable ntpd.service
fi
# Enable samba services if installed
if pacman -Qi samba &> /dev/null; then
	sudo systemctl enable smb.service
	sudo systemctl enable nmb.service
	# sudo systemctl enable winbind.service - causes smb service to fail
	# get smb.conf
	sudo wget https://github.com/arcolinux/arcolinux-iso/raw/master/archiso/airootfs/etc/samba/smb.conf -O /etc/samba/smb.conf
fi
# Enable avahi service if installed
if pacman -Qi avahi &> /dev/null; then
	sudo systemctl enable avahi-daemon.service
fi
# Enable tlp services if installed
if pacman -Qi tlp &> /dev/null; then
	sudo systemctl enable tlp.service
	sudo systemctl enable tlp-sleep.service
fi
# Enable wpa_supplicant service if installed
#if pacman -Qi wpa_supplicant &> /dev/null; then
	# sudo systemctl enable wpa_supplicant.service
#fi

# Disable speaker
sudo su -c 'echo -e "blacklist pcspkr\n" > /etc/modprobe.d/nobeep.conf'

# shares on a mac
# sudo sed -i 's/dns/mdns dns wins/g' /etc/nsswitch.conf

# Add some extra hidden personal folders
[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"
[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
xdg-user-dirs-update

# Copy all files and folders from /etc/skel to ~
cp -rT /etc/skel ~

# cleanup
rm pacman.conf


# Use all cores
~/.bin/main/000-use-all-cores-makepkg-conf-v3.sh
