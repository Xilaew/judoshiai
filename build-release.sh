rm -rf build-release
meson build-release --buildtype=release
cd build-release
ninja
DESTDIR="$PWD/install" ninja install
