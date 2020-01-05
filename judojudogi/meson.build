judojudogi_sources = [
    'comm.c',
    'main.c',
    'menus.c',
    'trees.c'
    ]

common_sources = [
    '../common/auto-update.c',
    '../common/avl.c',
    '../common/binreloc.c',
    '../common/common.c',
    '../common/common-utils.c',
    '../common/ip.c',
    '../common/language.c',
    '../common/protocol.c',
    '../common/websock-protocol.c'
    ]

judojudogi_exe = executable( 'judojudogi',
    judojudogi_sources, common_sources,
    c_args : [ '-DAPP_NUM=5' ],
    include_directories : includes,
    install : true,
    dependencies : [ gtk_dep, ws_dep ] )