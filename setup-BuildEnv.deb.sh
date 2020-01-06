#!/bin/bash
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
report "Stuff for WinXP build"
sudo apt-get -y install mingw-w64
sudo apt-get -y install wine-stable
wget http://judoshiai.sourceforge.net/win32-gtk3.tgz
sudo tar xvzf win32-gtk3.tgz -C /opt
report "Stuff for Win32 and Win64 builds. This will take a long time to finish."
grep  'https://pkg.mxe.cc/repos/apt' /etc/apt/sources.list || sudo echo "deb [trusted=yes] https://pkg.mxe.cc/repos/apt bionic main" >> /etc/apt/sources.list
sudo apt update
sudo apt-get -y install mxe-x86-64-w64-mingw32.shared-gtk3 mxe-x86-64-w64-mingw32.shared-curl mxe-x86-64-w64-mingw32.shared-librsvg mxe-x86-64-w64-mingw32.shared-libao mxe-x86-64-w64-mingw32.shared-mpg123
report "Get JudoShiai source code"
cd
(cd judoshiai; git status) || git clone http://git.code.sf.net/p/judoshiai/judoshiai
cd judoshiai
report "Compile all"
./build-all.sh
