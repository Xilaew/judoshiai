#!/bin/bash
# This file documents the necessary steps to setup a mingw/msys based cross
# compile environment for a windows 7/8/10 32bit and 64bit target on a
# debian/ubuntu based operating system.
# This is an alternative to the mxe cross environment.
# Tested on: Ubuntu 19.10 64 bit
set -e

function report() {
  echo "**************************"
  echo "$1"
  echo "**************************"
}

# install MinGw-W64
sudo apt update
sudo apt install mingw-w64 mingw-w64-tools wine-stable

MSYS2_PACKAGES="\
mingw-w64-x86_64-curl-7.67.0-1-any.pkg.tar.xz \
mingw-w64-x86_64-gtk3-3.24.9-4-any.pkg.tar.xz \
mingw-w64-x86_64-libao-1.2.2-1-any.pkg.tar.xz \
mingw-w64-x86_64-pango-1.43.0-3-any.pkg.tar.xz"

for package in $MSYS2_PACKAGES; do
    # Download prebuilt dependencies from MSYS2 project.
    wget http://repo.msys2.org/mingw/x86_64/${package}
    # Unpack prebuild dependencies from MSYS2 project.
    tar -xf ${package}
done

#sudo cp -r mingw64/* /usr/x86_64-w64-mingw32/

report "\
The mxe build environment has been successfully set up!
You can now cross compile JudoShiai for Windows 7, Windows 8, Windows 10
	./build-windows.sh"