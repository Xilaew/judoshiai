#!/bin/bash
# This file documents the necessary steps to setup a cross compile environment
# for a windows XP target on a debian/ubuntu based operating system
# Tested on: Ubuntu 12 32bit
set -e

function report() {
    echo "**************************"
    echo "$1"
    echo "**************************"
}

cd
report "Stuff for WinXP build"
sudo apt-get -y install mingw32
sudo apt-get -y install wine
wget http://judoshiai.sourceforge.net/win32-gtk3.tgz
sudo tar xvzf win32-gtk3.tgz -C /opt
sudo mkdir -p /srv/win32builder/fixed_364/build/
sudo ln -s /opt/win32/gtk /srv/win32builder/fixed_364/build/win32

