rm -rf build
meson build --prefix=/usr/lib/judoshiai
cd build
ninja
DESTDIR="$PWD/install" ninja install
