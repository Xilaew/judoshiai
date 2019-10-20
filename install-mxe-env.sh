#!/bin/bash

sudo apt-get install autoconf automake autopoint bash bison bzip2 flex g++ g++-multilib gettext git gperf intltool libc6-dev-i386 libgdk-pixbuf2.0-dev libltdl-dev libssl-dev libtool-bin libxml-parser-perl lzip make openssl p7zip-full patch perl pkg-config python ruby sed unzip wget xz-utils

cd
git clone https://github.com/mxe/mxe.git
cd ~/mxe
make MXE_TARGETS='i686-w64-mingw32.shared x86_64-w64-mingw32.shared' gtk3 curl librsvg libao mpg123 gmp gnutls nettle libgpg_error
