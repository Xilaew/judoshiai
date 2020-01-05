judoweight_sources = [
    'comm.c',
    'main.c',
    'menus.c',
    'print.c',
    'svg.c'
    ]

common_sources = [
    '../common/auto-update.c',
    '../common/ip.c',
    '../common/language.c',
    '../common/protocol.c',
    '../common/serial.c',
    ]

judoweight_exe = executable( 'judoweight',
    judoweight_sources, common_sources,
    c_args : [ '-DAPP_NUM=4' ],
    include_directories : includes,
    install : true,
    dependencies : [ gtk_dep, rsvg_dep, ws_dep ] )