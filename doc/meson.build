documentation = [
    'judoshiai-en.odt',
    'judoshiai-es.odt',
    'judoshiai-fi.odt',
    'judoshiai-fr.odt',
    'judoshiai-nl.odt',
    'judoshiai-uk.odt',

    'judotimer-en.odg',
    'judotimer-es.odg',
    'judotimer-fi.odg',
    'judotimer-sk.odg',

    'lisp_en.odt',
    'sql-guide-en.odt'
]

output = []
foreach doc : documentation
  sp = doc.split('.')
  output += '.'.join([sp[0],'pdf'])
endforeach

pdf_documentation = custom_target(
    'documentation',
    input : documentation,
    output : output,
    install : true,
    install_dir : 'doc',
    command : [ libreoffice, '--headless', '--convert-to', 'pdf', '@INPUT@', '--outdir', '@OUTDIR@' ]
)