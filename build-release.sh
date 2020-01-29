#!/bin/bash
# This file documents the necessary steps to compile judoshiai for linux and
# create all kinds of packages to distribute judoshiai for linux hosts
set -e
SHIAI_VER_NUM=`git describe --tags`

rm -rf build-release
meson build-release --prefix=/usr/lib/judoshiai --buildtype=release
cd build-release
ninja
DESTDIR="$PWD/install" ninja install

ninja dist
mv meson-dist/* ./

fpm -s dir -t deb -C "$PWD/install" --name judoshiai --version "$SHIAI_VER_NUM" --iteration 1 \
-d libao4 -d libatk1.0-0 -d libcairo2 -d libcurl4 -d libgdk-pixbuf2.0-0 -d libgtk-3-0 \
-d libpango-1.0-0 -d librsvg2-2 -d libssh2-1 \
--description "JudoShiai Package" --url "https://judoshiai.fi/index-en.php" --maintainer "oh2ncp@kolumbus.fi" \
--deb-no-default-config-files

fpm -s dir -t rpm -C "$PWD/install" --name judoshiai --version "$SHIAI_VER_NUM" --iteration 1 \
-d libao -d atk -d cairo -d libcurl -d gdk-pixbuf2 -d gtk3 \
-d pango -d librsvg2 -d libssh2 \
--description "JudoShiai Package" --url "https://judoshiai.fi/index-en.php" --maintainer "oh2ncp@kolumbus.fi"

fpm -s dir -t sh -C "$PWD/install" --name judoshiai --version "$SHIAI_VER_NUM" --iteration 1 \
-d libao -d atk -d cairo -d libcurl -d gdk-pixbuf2 -d gtk3 \
-d pango -d librsvg2 -d libssh2 \
--description "JudoShiai Package" --url "https://judoshiai.fi/index-en.php" --maintainer "oh2ncp@kolumbus.fi"
mv judoshiai.sh judoshiai-$SHIAI_VER_NUM.sh