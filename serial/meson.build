serial_sources = [
    'comm.c',
    'main.c',
    'serial.c'
    ]

common_sources = [
    '../common/avl.c',
    '../common/sha1.c',
    '../common/websock-protocol.c'
    ]

thirdparty_sources = [
    '../3rdparty/cJSON/cJSON.c',
    '../3rdparty/httpp/httpp.c',
    ]

serial_exe = executable( 'websock-serial',
    serial_sources, common_sources, thirdparty_sources, '../judoshiai/websock.c',
    include_directories : includes,
    install : true,
    dependencies : [ glib_dep, m_dep, ws_dep ] )