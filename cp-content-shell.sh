#!/bin/sh
rm -rf ~/content-shell
mkdir ~/content-shell
cd ~/src/out/Default
cp icudtl.dat ~/content-shell
cp *.bin ~/content-shell
cp *.pak ~/content-shell
cp *.so ~/content-shell
cp content_shell ~/content-shell
cd ~
tar -zvcf content-shell.tar.gz content-shell

