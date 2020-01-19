#!/bin/bash
# This file documents the necessary steps to make a clean build of judoshiai
# from the sources in an MSYS2 environment on Windows.

rm -rf build
# meson needs soffice.exe to be on the PATH in order to find it
export PATH=$PATH:/c/Program\ Files/LibreOffice/program
# the meson application comming with MSYS does not work. Use the one installed on Windows instead.
export PATH=/c/Program\ Files/meson:$PATH:/c/Program\ Files/LibreOffice/program
meson build
cd build
ninja
DESTDIR="$PWD/install" ninja install
