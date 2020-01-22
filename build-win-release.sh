rm -rf build-win64-release
meson build-win64-release --cross-file linux-mxe-x86_64-w64-mingw32.shared.txt --buildtype=release --prefix=/
pushd build-win64-release
ninja
DESTDIR="$PWD/install" ninja install
popd

rm -rf build-win32-release
meson build-win32-release --cross-file linux-mxe-i686-w64-mingw32.shared.txt --buildtype=release --prefix=/
pushd build-win32-release
ninja
DESTDIR="$PWD/install" ninja install
popd