#!/bin/sh
rm -rf ~/cp-content-shell
mkdir ~/cp-content-shell
cd ~/src/out/Default
cp icudtl.dat ~/cp-content-shell
cp *.bin ~/cp-content-shell
cp *.so ~/cp-content-shell
cp content_shell ~/cp-content-shell
cd ~
tar -zvcf cp-content-shell.tar.gz cp-content-shell

