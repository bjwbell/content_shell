#!/bin/sh
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
mv depot_tools/* ~/bin/
rm -rf src
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/chrome ~/src
cd ~/src
./build/install-build-deps.sh
gclient runhooks
gn gen out/Default
ninja -C out/Default content_shell
