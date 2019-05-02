#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# get arco-cinnamon from git
git clone https://github.com/arcolinuxb/arco-cinnamon

# comment out unwanted packages in arco-cinnamon/archiso/packages.x86_64
sed -i '/^chromium/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^variety/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^arcolinux-variety/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^geany/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^arcolinux-geany/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^vim/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^atom/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^apm/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^electron/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^nss-mdns/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^xterm/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^simple-scan/s/^/#/' arco-cinnamon/archiso/packages.x86_64
sed -i '/^ristretto/s/^/#/' arco-cinnamon/archiso/packages.x86_64
