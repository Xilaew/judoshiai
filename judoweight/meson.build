judoweight_sources = [
    'comm.c',
    'main.c',
    'menus.c',
    'print.c',
    'svg.c'
    ]

common_sources = [
    '../common/auto-update.c',
    '../common/binreloc.c',
    '../common/ip.c',
    '../common/language.c',
    '../common/protocol.c',
    '../common/serial.c',
    ]

judoweight_res = []
if host_machine.system() == 'windows'
    judoweight_res = import('windows').compile_resources('judoweight.rc', depend_files: '../etc/judoweight.ico')
endif

judoweight_exe = executable( 'judoweight',
    judoweight_sources, common_sources, judoweight_res,
    c_args : [ '-DAPP_NUM=4' ],
    include_directories : includes,
    install : true,
    dependencies : [ gtk_dep, rsvg_dep, ws_dep ] )