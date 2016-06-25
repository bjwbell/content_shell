#!/bin/sh
fetch --nohooks chromium
cd src;
gclient runhooks
gclient sync
git apply $1
gn gen out/Default
ninja -C out/Default content_shell
