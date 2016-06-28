#!/bin/sh
fetch chromium
cd src;
gclient runhooks
git apply $1
gn gen out/Default
ninja -C out/Default content_shell
