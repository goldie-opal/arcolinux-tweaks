#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# get arco-xfce from git
git clone https://github.com/arcolinuxb/arco-xfce

# comment out unwanted packages in arco-xfce/archiso/packages.x86_64
sed -i '/^chromium/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^variety/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^arcolinux-variety/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^geany/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^arcolinux-geany/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^arcolinux-arc-themes-git/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^vivaldi/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^vivaldi-codecs-ffmpeg-extra-bin/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^vim/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^atom/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^apm/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^electron/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^nss-mdns/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^xterm/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^simple-scan/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^ristretto/s/^/#/' arco-xfce/archiso/packages.x86_64

# add extra packages
echo lxappearance-gtk3 >> arco-xfce/archiso/packages.x86_64
echo arcolinux-arc-themes-nico-git  >> arco-xfce/archiso/packages.x86_64