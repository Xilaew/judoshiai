launchers = [
    'judoshiai.desktop',
    'judotimer.desktop',
    'judoinfo.desktop',
    'judoweight.desktop',
    'judojudogi.desktop',
    'judoproxy.desktop'
]

# Until meson supports an install_link command we use this slightly complicated workaround
bindir = get_option('bindir')
meson.add_install_script('sh', '-c',
                         'mkdir -p $DESTDIR/usr/bin; ln -s -r -f -t $DESTDIR/usr/bin $MESON_INSTALL_DESTDIR_PREFIX/@0@/judoshiai $MESON_INSTALL_DESTDIR_PREFIX/@0@/judojudogi $MESON_INSTALL_DESTDIR_PREFIX/@0@/judoproxy $MESON_INSTALL_DESTDIR_PREFIX/@0@/judoinfo $MESON_INSTALL_DESTDIR_PREFIX/@0@/judotimer $MESON_INSTALL_DESTDIR_PREFIX/@0@/judoweight'.format(bindir))

mime_info = [
    'judoshiai.mime',
    'judoshiai.keys'
]

install_data(launchers, install_dir : '/usr/share/applications')
install_data(mime_info, install_dir : '/usr/share/mime-info')
install_data('judoshiai.applications', install_dir : '/usr/share/application-registry')
install_data('judoshiai.packages', install_dir : '/usr/lib/mime/packages', rename : 'judoshiai')
install_data('judoshiai.xml', install_dir : '/usr/share/mime/packages')
install_data('judoshiai.menu', install_dir : '/usr/share/menu', rename : 'judoshiai')

images = [
    '../etc/png/judoinfo.png',
    '../etc/png/judojudogi.png',
    '../etc/png/judoproxy.png',
    '../etc/png/judoshiai.png',
    '../etc/png/judotimer.png',
    '../etc/png/judoweight.png',
]

install_data(images, install_dir : '/usr/share/pixmaps')