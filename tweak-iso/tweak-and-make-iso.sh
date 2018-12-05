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
sed -i '/^zsh/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^oh-my/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^vivaldi/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^chromium/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^plank/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^arco-plank/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^variety/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^arco-variety/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^urxvt/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^rxvt/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^geany/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^arco-geany/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^vim/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^qt5-tools/s/^/#/' arco-xfce/archiso/packages.x86_64
sed -i '/^nss-mdns/s/^/#/' arco-xfce/archiso/packages.x86_64

# Add extra packages to list
cat updates/extra-packages.x86_64 >> arco-xfce/archiso/packages.x86_64
cp updates/tweak-config.sh arco-xfce/installation-scripts/
cd arco-xfce/installation-scripts/
sed -i '/arcolinux-iso ..\/work/a .\/tweak-config.sh' 30-build-the-iso-local-v3.sh
./30-build-the-iso-local-v3.sh