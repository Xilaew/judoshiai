#!/bin/bash
# This file documents the necessary steps to setup a build environment on a
# debian/ubuntu based system.
# Tested on: Ubuntu 19.10 64bit
set -e

function report() {
    echo "**************************"
    echo "$1"
    echo "**************************"
}

cd
report "Get essentials"
sudo apt-get -y install build-essential libgtk-3-dev bison flex gettext
report "Get libraries"
sudo apt-get -y install librsvg2-dev libao-dev libmpg123-dev libcurl4-openssl-dev libssh2-1-dev
report "For JudoProxy:"
sudo apt-get -y install libavcodec-dev libavformat-dev libavresample-dev libavutil-dev libswscale-dev
sudo apt-get -y install liblzma-dev libxml2-dev
report "Git"
sudo apt-get -y install git
report "LibreOffice for PDF creation"
sudo apt-get -y install libreoffice
report "FPM for Debian package creation"
sudo apt-get -y install ruby ruby-dev rubygems
sudo -E gem install fpm
report "rpm for Redhat package creation"
sudo apt-get -y install rpm
report "get mesonbuild"
sudo apt-get -y install python3 python3-pip python3-setuptools python3-wheel
sudo pip3 install meson