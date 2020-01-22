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

judoproxy_res = []
if host_machine.system() == 'windows'
    judoproxy_res = import('windows').compile_resources('judoproxy.rc', depend_files: '../etc/judoproxy.ico')
endif

judoproxy_exe = executable( 'judoproxy',
    judoproxy_sources, common_sources, judoproxy_res,
    c_args : [ '-DAPP_NUM=6' ],
    include_directories : includes,
    install : true,
    dependencies : [ curl_dep, gtk_dep, ws_dep, xml_dep ] )