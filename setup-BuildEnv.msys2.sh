#!/bin/bash
# This file documents the necessary steps to setup a build environment inside
# an MSYS2 console on Windows. First install MSYS2 according to the instructions
# on this Website https://www.msys2.org/.
# after that you can run this script in the MSYS2 Console in order to install
# all required additional Software.
# Tested on: Windows 10 with MSYS version http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20190524.exe
set -e
_arch=$(uname -m)
if [ "${_arch}" = "x86_64" ]; then
  _bitness=64
else
  _bitness=32
fi
pacman -S mingw-w64-${_arch}-gcc mingw-w64-${_arch}-ccache mingw-w64-${_arch}-curl mingw-w64-${_arch}-gtk3 mingw-w64-${_arch}-libao mingw-w64-${_arch}-mpg123 flex bison --noconfirm

# the Meson that can be installed with MSYS2 has some quirks, so we use the one natively build for windows.
curl -L https://github.com/mesonbuild/meson/releases/download/0.53.0/meson-0.53.0-64.msi --output meson-0.53.0-64.msi
start ./meson-0.53.0-64.msi
# We also rely on a native Libre Office installation on Windows.
curl -L https://download.documentfoundation.org/libreoffice/stable/6.3.4/win/x86_64/LibreOffice_6.3.4_Win_x64.msi --output LibreOffice_6.3.4_Win_x64.msi
start ./LibreOffice_6.3.4_Win_x64.msi
