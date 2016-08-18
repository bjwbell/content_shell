#!/bin/sh
rm -rf chrome-deb

mkdir chrome-deb
mkdir chrome-deb/libs

cd src/out/Default
cp icudtl.dat ../../../chrome-deb
cp *.bin ../../../chrome-deb
cp *.pak ../../../chrome-deb
cp *.so ../../../chrome-deb/libs
cp chrome ../../../chrome-deb
cp -r locales ../../../chrome-deb
cp -r resources ../../../chrome-deb
cp -r ui ../../../chrome-deb
cd ../../../

cd chrome-deb
cp -r ../debian .
debuild -us -uc



