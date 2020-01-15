update_sources = [
    'main.c',
    ]

common_sources = [
    '../common/sha1.c',
    ]

update_exe = executable( 'auto-update',
    update_sources, common_sources,
    include_directories : includes,
    install : true,
    dependencies : [ ws_dep ] )