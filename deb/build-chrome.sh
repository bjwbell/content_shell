#!/bin/sh
cd src/
gn gen out/Default --args="is_debug=false"
ninja -C out/Default chrome
cd ..
