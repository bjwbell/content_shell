#!/bin/sh
rm -rf ~/content-shell
rm -f ~/content-shell.tar.gz
mkdir ~/content-shell
cd ~/src/out/Default
cp icudtl.dat ~/content-shell
cp *.bin ~/content-shell
cp *.pak ~/content-shell
cp *.so ~/content-shell
cp content_shell ~/content-shell
cp chrome ~/content-shell
cp -r locales ~/content-shell
cp -r resources ~/content-shell
cp -r ui ~/content-shell
cd ~
tar -zvcf content-shell.tar.gz content-shell
