judotimer_sources = [
    'comm.c',
    'main.c',
    'menus.c',
    'show-ad.c',
    'sound.c',
    'stopwatch.c',
    'tvlogo.c',
    'video.c'
    ]

common_sources = [
    '../common/auto-update.c',
    '../common/binreloc.c',
    '../common/common.c',
    '../common/common-utils.c',
    '../common/ip.c',
    '../common/language.c',
    '../common/protocol.c',
    '../common/websock-protocol.c'
    ]

judotimer_res = []
if host_machine.system() == 'windows'
    judotimer_res = import('windows').compile_resources('judotimer.rc', depend_files: '../etc/judotimer.ico')
endif

judotimer_exe = executable( 'judotimer',
    judotimer_sources, common_sources, judotimer_res,
    c_args : [ '-DAPP_NUM=2' ],
    include_directories : includes,
    install : true,
    dependencies : [ ao_dep, dl_dep, gtk_dep, mpg_dep, rsvg_dep, ws_dep ] )