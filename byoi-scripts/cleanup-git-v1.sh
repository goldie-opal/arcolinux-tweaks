#!/bin/bash
cd ..
mv .git/config gitconfig
rm -rf .git
sh ./setup-git*
mv gitconfig .git/config
git add --all .
git commit -m "cleanup git"
git push origin master --force

echo "################################################################"
echo "###################    cleanup  Done      ######################"
echo "################################################################"
