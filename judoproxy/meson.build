judoproxy_sources = [
    'comm.c',
    'html.c',
    'main.c',
    'menus.c',
    'video.c'
    ]

common_sources = [
    '../common/auto-update.c',
    '../common/binreloc.c',
    '../common/ip.c',
    '../common/language.c',
    '../common/protocol.c',
    ]

judoproxy_exe = executable( 'judoproxy',
    judoproxy_sources, common_sources,
    c_args : [ '-DAPP_NUM=6' ],
    include_directories : includes,
    install : true,
    dependencies : [ curl_dep, gtk_dep, ws_dep, xml_dep ] )