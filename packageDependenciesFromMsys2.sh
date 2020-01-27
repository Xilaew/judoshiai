set -e

JSBUILDDIR=/c/js-build
MSYSCHROOT=${JSBUILDDIR}/msys2
RELEASEDIR=${JSBUILDDIR}/release-win32/judoshiai
_arch=$(uname -m)
if [ "${_arch}" = "x86_64" ]; then
  _bitness=64
else
  _bitness=32
fi

[ -d ${MSYSCHROOT} ] && rm -rf ${MSYSCHROOT}
mkdir -p "${MSYSCHROOT}"
pushd "${MSYSCHROOT}" > /dev/null

mkdir -p var/lib/pacman
mkdir -p var/log
mkdir -p tmp

pacman -Syu --root "${MSYSCHROOT}"
pacman -S filesystem bash pacman --noconfirm --root "${MSYSCHROOT}"
_result=$?
if [ "$_result" -ne "0" ]; then
  exit_cleanly "1" "failed to create base data via command 'pacman -S filesystem bash pacman --noconfirm --root ${MSYSCHROOT}'"
fi

pacman -S mingw-w64-${_arch}-curl mingw-w64-${_arch}-gtk3 mingw-w64-${_arch}-libao mingw-w64-${_arch}-mpg123 --noconfirm --root "${MSYSCHROOT}"
_result=$?
if [ "$_result" -ne "0" ]; then
  exit_cleanly "1" "failed to create newgedit via command 'pacman -S gedit --noconfirm --root ${MSYSCHROOT}'"
fi
# some packages are pulled by the deps but we do not need them like python2
pacman -Rdd mingw-w64-${_arch}-python3 --noconfirm --root "${MSYSCHROOT}"

cp -R ${MSYSCHROOT}/mingw${_bitness}/* "${RELEASEDIR}/"

  # remove .a files not needed for the installer
  find ${RELEASEDIR} -name "*.a" -exec rm -f {} \;
  # remove unneeded binaries
  find ${RELEASEDIR} -not -name "judo*.exe" -name "*.exe" -exec rm -f {} \;
  rm -rf ${RELEASEDIR}/bin/py*
  rm -rf ${RELEASEDIR}/bin/*-config
  # remove other useless folders
  rm -rf ${RELEASEDIR}/var
  rm -rf ${RELEASEDIR}/ssl
  rm -rf ${RELEASEDIR}/include
  rm -rf ${RELEASEDIR}/share/man
  rm -rf ${RELEASEDIR}/readline
  rm -rf ${RELEASEDIR}/share/info
  rm -rf ${RELEASEDIR}/share/aclocal
  rm -rf ${RELEASEDIR}/share/gnome-common
  rm -rf ${RELEASEDIR}/share/glade
  rm -rf ${RELEASEDIR}/share/gettext
  rm -rf ${RELEASEDIR}/share/terminfo
  rm -rf ${RELEASEDIR}/share/tabset
  rm -rf ${RELEASEDIR}/share/pkgconfig
  rm -rf ${RELEASEDIR}/share/bash-completion
  rm -rf ${RELEASEDIR}/share/appdata
  rm -rf ${RELEASEDIR}/share/gdb
  # on windows we show the online help
  rm -rf ${RELEASEDIR}/share/help
  rm -rf ${RELEASEDIR}/share/gtk-doc
  rm -rf ${RELEASEDIR}/share/doc
  # remove on the lib folder
  rm -rf ${RELEASEDIR}/lib/terminfo
  rm -rf ${RELEASEDIR}/lib/python2*
  rm -rf ${RELEASEDIR}/lib/pkgconfig
  rm -rf ${RELEASEDIR}/lib/peas-demo

  # strip the binaries to reduce the size
  find ${RELEASEDIR} -name *.dll | xargs strip
  find ${RELEASEDIR} -name *.exe | xargs strip

  # remove some translation which seem to add a lot of size
  find ${RELEASEDIR}/share/locale/ -type f | grep -v atk10.mo | grep -v libpeas.mo | grep -v gsettings-desktop-schemas.mo | grep -v json-glib-1.0.mo | grep -v glib20.mo | grep -v gedit.mo | grep -v gedit-plugins.mo | grep -v gdk-pixbuf.mo | grep -v gtk30.mo | grep -v gtk30-properties.mo | grep -v gtksourceview-4.mo | grep -v iso_*.mo | xargs rm
  find ${RELEASEDIR}/share/locale -type d | xargs rmdir -p --ignore-fail-on-non-empty
