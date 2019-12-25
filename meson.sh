rm -rf build
mkdir build
meson build
cd build
ninja
DESTDIR="./install" ninja install
