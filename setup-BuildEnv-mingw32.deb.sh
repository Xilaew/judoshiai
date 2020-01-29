#!/bin/bash
# This file documents the necessary steps to setup a cross compile environment
# for a windows XP target on a debian/ubuntu based operating system
# Tested on: Ubuntu 19.10 x86_64
set -e

function report() {
    echo "**************************"
    echo "$1"
    echo "**************************"
}

report "Stuff for WinXP build"
sudo apt update
sudo apt-get -y install mingw-w64
sudo apt-get -y install wine-stable
wget http://judoshiai.sourceforge.net/win32-gtk3.tgz
sudo tar xvzf win32-gtk3.tgz -C /opt
sudo mkdir -p /srv/win32builder/fixed_364/build/
sudo ln -s /opt/win32/gtk /srv/win32builder/fixed_364/build/win32

