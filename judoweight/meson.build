judoweight_sources = [
    'comm.c',
    'html.c',
    'main.c',
    'menus.c',
    'video.c'
    ]

common_sources = [
    '../common/auto-update.c',
    '../common/ip.c',
    '../common/language.c',
    '../common/protocol.c',
    ]

judoweight_exe = executable( 'judoweight',
    judoweight_sources, common_sources,
    c_args : [ '-DAPPLICATION="judoweight"', '-DAPP_NUM=4' ],
    include_directories : includes,
    install : true,
    dependencies : [ gtk_dep, ws_dep ] )