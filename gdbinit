python
import os
if 'JHBUILD_PREFIX' in os.environ:
    gdb.execute('add-auto-load-safe-path {}/share/gdb/auto-load'.format(os.environ['JHBUILD_PREFIX']))
    gdb.execute('add-auto-load-scripts-directory {}/share/gdb/auto-load'.format(os.environ['JHBUILD_PREFIX']))
end

source ~/gdb-dashboard/.gdbinit

set history save off
