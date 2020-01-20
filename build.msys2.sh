#!/bin/bash
# This file documents the necessary steps to make a clean build of judoshiai
# from the sources in an MSYS2 environment on Windows.

rm -rf build
# meson needs soffice.exe to be on the PATH in order to find it
export PATH=$PATH:/c/Program\ Files/LibreOffice/program
# the meson application comming with MSYS does not work. Use the one installed on Windows instead.
export PATH=/c/Program\ Files/meson:$PATH
meson build
cd build
ninja
DESTDIR="$PWD/install" ninja install

# Copy all DLLs into installation directory
pushd install/bin
../../../copydlldeps.sh -d . -F . -R /mingw64 -s /usr/bin -s /bin
popd

# add gdk pixbuff loaders (without them the app crashes)
mkdir -p install/lib/gdk-pixbuf-2.0/2.10.0/loaders
cp /mingw64/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache install/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
cp /mingw64/lib/gdk-pixbuf-2.0/2.10.0/loaders/*.dll install/lib/gdk-pixbuf-2.0/2.10.0/loaders/

cp -R ../share ./install/
