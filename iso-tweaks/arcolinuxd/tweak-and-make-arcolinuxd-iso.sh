#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# get arco-xfce from git
git clone https://github.com/arcolinux/arcolinuxd-iso


sed -i 's/hwclock --systohc --utc/hwclock --systohc --local/' arcolinuxd-iso/archiso/airootfs/root/customize_airootfs.sh
sed -i 's/zoneinfo\/UTC/zoneinfo\/Australia\/Brisbane/' arcolinuxd-iso/archiso/airootfs/root/customize_airootfs.sh
sed -i 's/en_US.UTF-8/en_AU.UTF-8/' arcolinuxd-iso/archiso/airootfs/root/customize_airootfs.sh

cd arcolinuxd-iso/installation-scripts/
./30-build-the-iso-local.sh