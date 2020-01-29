#!/bin/bash
# This file documents the necessary steps to setup an M cross environment (mxe)
# based cross compile environment for a windows 7/8/10 32bit and 64bit target
# on a debian/ubuntu based operating system.
# This is the recommended cross compiler environment for judoshiai.
# Tested on: Ubuntu 19.10 64 bit
set -e

# If further dependencies are needed to cross compile for Windows, simply add theire names here.
LIBS="\
gtk3,\
curl,\
librsvg,\
libao,\
mpg123"

ARCHS="\
x86_64-w64-mingw32,\
i686-w64-mingw32"

TYPES="\
static,\
shared"

PACKAGES_DEB=`eval echo mxe-{${ARCHS//_/-}}.{$TYPES}-{$LIBS} | tr -d {}`

MXE_TARGETS=`eval echo {$ARCHS}.{$TYPES} | tr -d {}`

function installMxeFromPrebuilt() {
# Add mxe repositoy to apt unless it is already available,
  ( grep 'https://pkg.mxe.cc/repos/apt' /etc/apt/sources.list || echo "deb [trusted=yes] https://pkg.mxe.cc/repos/apt bionic main" | sudo tee -a /etc/apt/sources.list > /dev/null ) && \
  sudo apt update && \
# Install cross compiler and cross compiled libraries via apt.
  sudo apt-get -y install $PACKAGES_DEB
}

function installMxeFromSource(){
  # install all necessary build tools to build mxe
  # clone the mxe git repository
  # and build the cross compiler and all libraries required by judoshiai
  sudo apt-get -y install autoconf automake autopoint bash bison bzip2 flex g++ g++-multilib gettext git gperf intltool libc6-dev-i386 libgdk-pixbuf2.0-dev libltdl-dev libssl-dev libtool-bin libxml-parser-perl lzip make openssl p7zip-full patch perl pkg-config python ruby sed unzip wget xz-utils && \
  cd && \
  git clone https://github.com/mxe/mxe.git && \
  cd ~/mxe && \
  make MXE_TARGETS="$MXE_TARGETS" ${LIBS//,/ }
}

function report() {
  echo "**************************"
  echo "$1"
  echo "**************************"
}

function askPrebuiltOrSource() {
  echo "Do you wish to install M Cross Environment from source or from prebuilt packages?";
  select yn in "prebuilt" "source"; do
    case $yn in
      'prebuilt' ) installMxeFromPrebuilt && success || fail; break;;
      'source' ) ( installMxeFromSource && success ) || fail; break;;
    esac
  done
}

function success(){
  report "\
The mxe build environment has been successfully set up!
You can now cross compile JudoShiai for Windows 7, Windows 8, Windows 10
	./build-windows.sh"
}

function fail(){
  report "\
An error occured trying to setup M Cross Environment
You can now eighter try another method, or STRG-C"
  askPrebuiltOrSource
}

report "\
This will install the M Cross Environment (mxe) and all Libraries necessary to
successfully cross compile Judoshiai for Windows 7, Windows 8 and Windows 10.
You can choose to build mxe from source which will take quite a while or simply
install a prebuilt version from https://pkg.mxe.cc"

if [ -z "$CI" ]; then
  askPrebuiltOrSource
else
  installMxeFromPrebuilt
fi
