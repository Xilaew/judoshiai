judoinfo_sources = [
    'comm.c',
    'main.c',
    'menus.c',
    'svg.c',
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

judoinfo_res = []
if host_machine.system() == 'windows'
    judoinfo_res = import('windows').compile_resources('judoinfo.rc', depend_files: '../etc/judoinfo.ico')
endif

judoinfo_exe = executable( 'judoinfo',
    judoinfo_sources, common_sources, judoinfo_res,
    c_args : [ '-DAPP_NUM=3' ],
    include_directories : includes,
    install : true,
    dependencies : [ gtk_dep, rsvg_dep, ws_dep ] )