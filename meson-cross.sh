rm -rf cross
mkdir cross
meson cross --cross-file linux-mxe-x86_64-w64-mingw32.shared.txt
cd cross
ninja
DESTDIR="./install" ninja install
