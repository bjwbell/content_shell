#!/bin/sh
rm -rf chrome-deb

mkdir chrome-deb
mkdir chrome-deb/out
mkdir chrome-deb/out/Release
mkdir chrome-deb/out/Release/lib

cd src/out/Default
cp icudtl.dat ../../../chrome-deb/out/Release
cp *.bin ../../../chrome-deb/out/Release
cp *.pak ../../../chrome-deb/out/Release
cp *.so ../../../chrome-deb/out/Release/lib
cp chrome ../../../chrome-deb/out/Release
cp -r locales ../../../chrome-deb/out/Release
cp -r resources ../../../chrome-deb/out/Release
cd ../../../

cd chrome-deb
cp -r ../debian .
cp -r out/Release out/Release-chromium
debuild --no-lintian -us -uc



