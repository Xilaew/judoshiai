update_sources = [
    'main.c',
    ]

common_sources = [
    '../common/sha1.c',
    ]

auto_update_res = []
if host_machine.system() == 'windows'
    auto_update_res = import('windows').compile_resources('auto-update.rc', depend_files: '../etc/auto-update.ico')
endif

update_exe = executable( 'auto-update',
    update_sources, common_sources, auto_update_res,
    include_directories : includes,
    install : true,
    dependencies : [ ws_dep ] )