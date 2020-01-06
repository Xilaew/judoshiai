rm -rf build-win64-release
meson build-win64-release --cross-file linux-mxe-x86_64-w64-mingw32.shared.txt --buildtype=release
cd build-win64-release
ninja
DESTDIR="./install" ninja install
