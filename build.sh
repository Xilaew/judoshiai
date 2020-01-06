rm -rf build
meson build
cd build
ninja
DESTDIR="./install" ninja install
