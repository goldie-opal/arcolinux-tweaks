#!/bin/bash
set -e
###################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# comment out unwanted packages in packages.x86_64
sed -i '/^zsh/s/^/#/' packages.x86_64
sed -i '/^oh-my/s/^/#/' packages.x86_64
sed -i '/^vivaldi/s/^/#/' packages.x86_64
sed -i '/^chromium/s/^/#/' packages.x86_64
sed -i '/^plank/s/^/#/' packages.x86_64
sed -i '/^arco-plank/s/^/#/' packages.x86_64
sed -i '/^variety/s/^/#/' packages.x86_64
sed -i '/^arco-variety/s/^/#/' packages.x86_64
sed -i '/^urxvt/s/^/#/' packages.x86_64
sed -i '/^rxvt/s/^/#/' packages.x86_64
sed -i '/^geany/s/^/#/' packages.x86_64
sed -i '/^arco-geany/s/^/#/' packages.x86_64
sed -i '/^atom/s/^/#/' packages.x86_64
sed -i '/^electron/s/^/#/' packages.x86_64
sed -i '/^vim/s/^/#/' packages.x86_64
sed -i '/^qt5-tools/s/^/#/' packages.x86_64
sed -i '/^nss-mdns/s/^/#/' packages.x86_64