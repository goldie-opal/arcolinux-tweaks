#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


#cat updates/extra-packages.x86_64 >> arco-xfce/archiso/packages.x86_64
echo '
[arcolinux_repo_go]
SigLevel = PackageOptional DatabaseOptional
Server = https://goldie-opal.github.io/$repo/$arch

[arcolinux_repo_go_iso]
SigLevel = PackageOptional DatabaseOptional
Server = https://goldie-opal.github.io/$repo/$arch
' | sudo tee --append ../work/archiso/pacman.conf

echo '
[arcolinux_repo_go]
SigLevel = PackageOptional DatabaseOptional
Server = https://goldie-opal.github.io/$repo/$arch

' | sudo tee --append ../work/archiso/pacman.conf.work_dir

sed -i 's/hwclock --systohc --utc/hwclock --systohc --local/' ../work/archiso/airootfs/root/customize_airootfs.sh
sed -i 's/zoneinfo\/UTC/zoneinfo\/Australia\/Brisbane/' ../work/archiso/airootfs/root/customize_airootfs.sh
sed -i 's/en_US.UTF-8/en_AU.UTF-8/' ../work/archiso/airootfs/root/customize_airootfs.sh
