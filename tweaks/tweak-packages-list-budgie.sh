#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# get arco-budgie from git
git clone https://github.com/arcolinuxb/arco-budgie

# comment out unwanted packages in arco-budgie/archiso/packages.x86_64
sed -i '/^chromium/s/^/#/' arco-budgie/archiso/packages.x86_64
sed -i '/^variety/s/^/#/' arco-budgie/archiso/packages.x86_64
sed -i '/^arco-variety/s/^/#/' arco-budgie/archiso/packages.x86_64
sed -i '/^geany/s/^/#/' arco-budgie/archiso/packages.x86_64
sed -i '/^arco-geany/s/^/#/' arco-budgie/archiso/packages.x86_64
sed -i '/^arcolinux-arc-themes-git/s/^/#/' arco-budgie/archiso/packages.x86_64

echo lxappearance-gtk3 >> arco-budgie/archiso/packages.x86_64
echo arcolinux-arc-themes-nico-git  >> arco-budgie/archiso/packages.x86_64