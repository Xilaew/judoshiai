#!/bin/bash

function installMxeFromPrebuilt() {
# Add mxe repositoy to apt unless it is already available,
  ( grep 'https://pkg.mxe.cc/repos/apt' /etc/apt/sources.list || sudo echo "deb [trusted=yes] https://pkg.mxe.cc/repos/apt bionic main" >> /etc/apt/sources.list ) && \
  sudo apt update && \
# Install cross compiler and cross compiled libraries via apt.
  sudo apt-get -y install mxe-x86-64-w64-mingw32.shared-gtk3 mxe-x86-64-w64-mingw32.shared-curl mxe-x86-64-w64-mingw32.shared-librsvg mxe-x86-64-w64-mingw32.shared-libao mxe-x86-64-w64-mingw32.shared-mpg123
  sudo apt-get -y install mxe-i686-w64-mingw32.shared-gtk3 mxe-i686-w64-mingw32.shared-curl mxe-i686-w64-mingw32.shared-librsvg mxe-i686-w64-mingw32.shared-libao mxe-i686-w64-mingw32.shared-mpg123
}

function installMxeFromSource(){
  # install all necessary build tools to build mxe
  # clone the mxe git repository
  # and build the cross compiler and all libraries required by judoshiai
  sudo apt-get -y install autoconf automake autopoint bash bison bzip2 flex g++ g++-multilib gettext git gperf intltool libc6-dev-i386 libgdk-pixbuf2.0-dev libltdl-dev libssl-dev libtool-bin libxml-parser-perl lzip make openssl p7zip-full patch perl pkg-config python ruby sed unzip wget xz-utils && \
  cd EE && \
  git clone https://github.com/mxe/mxe.git && \
  cd ~/mxe && \
  make MXE_TARGETS='i686-w64-mingw32.shared x86_64-w64-mingw32.shared' gtk3 curl librsvg libao mpg123 gmp gnutls nettle libgpg_error
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
      'prebuilt' ) installMxeFromPrebuilt && success || fail ; break;;
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

askPrebuiltOrSource
