judoshiai_sources = [
    'another-shiai.c',
    'categories.c',
    'category-graph.c',
    'comm.c',
    'competitors.c',
    'completion.c',
    'custom-category.c',
    'custom-category-parser.c',
    'custom-category-svg-template.c',
    'db.c',
    'db-categories.c',
    'db-competitors.c',
    'db-matches.c',
    'db-table.c',
    'db-validate.c',
    'drawing.c',
    'ftp.c',
    'gdpr.c',
    'httpd.c',
    'import.c',
    'log.c',
    'main.c',
    'match-data.c',
    'matches.c',
    'match-graph.c',
    'medal-matches.c',
    'menuacts.c',
    'menus.c',
    'names.c',
    'popup-menu.c',
    'print.c',
    'print-texts.c',
    'properties.c',
    'search.c',
    'set-categories.c',
    'set-one-judoka.c',
    'set-password.c',
    'sheets.c',
    'sql-dialog.c',
    'svg.c',
    'svg-lisp.c',
    'trees.c',
    'util.c',
    'websock.c',
    'write-results.c'
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
    '../common/serial.c',
    '../common/sha1.c',
    '../common/websock-protocol.c'
    ]

thirdparty_sources = [
    '../3rdparty/cJSON/cJSON.c',
    '../3rdparty/httpp/httpp.c',
    '../3rdparty/lisp/minilisp.c'
    ]

basic = custom_target(
    'basic.tab.h',
    output : [ 'basic.tab.c', 'basic.tab.h', 'basic.output' ],
    input : 'basic.y',
    command : [ bison, '-t', '-v', '-d', '-o', '@OUTPUT0@', '@INPUT@'],
)

lex = custom_target(
    'lex.yy.c',
    output : 'lex.yy.c',
    input : [ 'basic.l', basic ],
    command : [ flex, '-o', '@OUTPUT@', '@INPUT0@']
)

sqlite = custom_target(
    'sqlite3-patched.c',
    output : 'sqlite3-patched.c',
    input : [ '../3rdparty/sqlite3/sqlite3.c', 'sqlite3.patch' ],
    command : [ patch, '-p2', '-o', '@OUTPUT@', '@INPUT@']
)

judoshiai_exe = executable( 'judoshiai',
    judoshiai_sources, common_sources, thirdparty_sources, 
    lex, basic[0], sqlite,
    c_args : [ '-DAPP_NUM=1' ],
    include_directories : includes,
    install : true,
    dependencies : [ curl_dep, dl_dep, gtk_dep, rsvg_dep, ssh_dep, thread_dep, ws_dep ] )
