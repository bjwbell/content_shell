#!/bin/sh
rm -rf _gclient_src_*
rm -f .gclient
rm -rf .gclient_entries
rm -rf src
rm -rf _bad_scm
rm -rf chrome-deb

fetch --nohooks chromium

cd src/
git add remote codecommit ssh://APKAJHXR727PTXMIECSQ@git-codecommit.us-east-1.amazonaws.com/v1/repos/chrome
git fetch codecommit ironframe
git checkout ironframe
gclient runhooks
gclient sync
