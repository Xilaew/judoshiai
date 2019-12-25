project('judoshiai', 'c', version : '3.0-ALPHA-4')
SHIAI_VERSION = '"meson.project_version()"'

add_project_arguments(
    '-DSHIAI_VERSION=' + SHIAI_VERSION,
    '-DGTKVER=3',
    '-DUSE_PANGO',
    '-DENABLE_NLS',
    language : 'c' )
if host_machine.system() == 'linux'
    add_project_arguments('-DENABLE_BINRELOC=',
        language : 'c')
endif
if host_machine.system() == 'windows'
        add_project_arguments('-DTGTEXT_S="' + host_machine.cpu_family() + '"',
        language : 'c')
endif

flex = find_program('flex')
bison = find_program('bison')
patch = find_program('patch')

curl_dep = dependency('libcurl')
cc = meson.get_compiler('c')
dl_dep = cc.find_library('dl', required : false)
ws_dep = cc.find_library('ws2_32', required : false)
gtk_dep = dependency('gtk+-3.0')
rsvg_dep = dependency('librsvg-2.0')
ssh_dep = dependency('libssh2')
thread_dep = dependency('threads')
ao_dep = dependency('ao')
mpg_dep = dependency('libmpg123')

includes = include_directories(['common', '3rdparty/httpp', '3rdparty/sqlite3', '3rdparty/cJSON', '3rdparty/lisp'])

subdir('judoinfo')
subdir('judojudogi')
subdir('judoproxy')
subdir('judoshiai')
subdir('judotimer')
