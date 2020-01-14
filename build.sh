rm -rf build
meson build
cd build
ninja
DESTDIR="$PWD/install" ninja install
