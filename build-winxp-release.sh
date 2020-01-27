rm -rf build-winxp-release
PKG_CONFIG_PATH=$PWD/pkgconfig:/opt/win32/gtk/lib/pkgconfig:/opt/win32/rsvg/lib/pkgconfig meson build-winxp-release --cross-file linux-mingw-w64-32bit.txt --buildtype=release --prefix=/
pushd build-winxp-release
ninja
DESTDIR="$PWD/install" ninja install
popd