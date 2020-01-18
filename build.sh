#!/bin/bash
# This file documents the necessary steps to make a clean build of judoshiai
# from the sources.
rm -rf build
meson build --prefix=/usr/lib/judoshiai
cd build
ninja
DESTDIR="$PWD/install" ninja install
