project('judoshiai', 'c', version : run_command( 'git', '-C', meson.source_root(), 'describe', '--tags' ).stdout().strip(), meson_version : '>= 0.47')

add_project_arguments(
    '-DSHIAI_VERSION="' + meson.project_version() + '"',
    '-DGTKVER=3',
    '-DUSE_PANGO',
    '-DENABLE_NLS',
    '-Wno-deprecated-declarations',
    language : 'c' )
if host_machine.system() == 'linux'
    add_project_arguments('-DENABLE_BINRELOC=',
        language : 'c')
endif
if host_machine.system() == 'windows'
        add_project_arguments('-DTGTEXT_S="' + host_machine.cpu_family() + '"',
        language : 'c')
endif

flex = find_program('flex', required : false)
bison = find_program('bison', required : false)
patch = find_program('patch')
libreoffice = find_program('soffice')

cc = meson.get_compiler('c')
ao_dep = dependency('ao')
curl_dep = dependency('libcurl')
dl_dep = cc.find_library('dl', required : host_machine.system() == 'linux')
glib_dep = dependency('glib-2.0')
gtk_dep = dependency('gtk+-3.0')
m_dep = cc.find_library('m', required : host_machine.system() == 'linux')
mpg_dep = dependency('libmpg123')
rsvg_dep = dependency('librsvg-2.0')
ssh_dep = dependency('libssh2')
thread_dep = dependency('threads')
ws_dep = cc.find_library('ws2_32', required : host_machine.system() == 'windows')
xml_dep = dependency('libxml-2.0')

includes = include_directories(['common', '3rdparty/httpp', '3rdparty/sqlite3', '3rdparty/cJSON', '3rdparty/lisp'])

# program files
subdir('auto-update')
subdir('judoinfo')
subdir('judojudogi')
if host_machine.system() == 'linux'
    subdir('judoproxy')
endif
subdir('judoshiai')
subdir('judotimer')
subdir('judoweight')
subdir('serial')

# data
subdir('doc')
subdir('po')
install_subdir('custom-examples', install_dir : '')
install_subdir('etc', install_dir : '')
install_subdir('licenses', install_dir : '')
install_subdir('svg', install_dir : '')
install_subdir('svg-lisp', install_dir : '')

# platform specific stuff
if host_machine.system() == 'linux'
    subdir('gnome')
elif host_machine.system() == 'windows'
    if meson.is_cross_build()
        sys_root = meson.get_cross_property('sys_root', meson.current_source_dir())
    else
        # TODO find a clever way to extract the relevant directories from the environment.
        # e.g run_command(bash, '-c', 'echo $PATH').ouput.strip.split(':').filter(!Windows)
        sys_root = ''
        # TODO icon_themes and gtk_themes could be downloaded from the internet during build.
        install_subdir('share', install_dir : '')
    endif
    install_subdir('share', install_dir : '')
    meson.add_install_script('bash', '-c', '@2@/copydlldeps.sh -d $MESON_INSTALL_DESTDIR_PREFIX/@0@ -F $MESON_INSTALL_DESTDIR_PREFIX/@0@ -R @1@'.format(get_option('bindir'), sys_root, meson.current_source_dir()))
    meson.add_install_script('bash', '-c', 'mkdir -p $MESON_INSTALL_DESTDIR_PREFIX/@0@/glib-2.0/schemas; cp @1@/share/glib-2.0/schemas/gschemas.compiled $MESON_INSTALL_DESTDIR_PREFIX/@0@/glib-2.0/schemas/'.format(get_option('datadir'), sys_root))
endif