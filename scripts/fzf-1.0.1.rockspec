local _MODREV, _SPECREV = 'scm', '-1'
rockspec_format = "3.0"
package = 'fzf'
version = _MODREV .. _SPECREV

description = {
   summary = 'Rewritting fzf in lua',
   labels = {
     'terminal',
   },
   homepage = 'http://github.com/PyDevC/fzf',
}

dependencies = {
   'lua >= 5.1',
   'penlight == 1.14',
    'lanes >= 3.17',
}

source = {
   url = 'http://github.com/PyDevC/fzf',
}

build = {
   type = 'builtin',
   copy_directories = {
     'doc',
     'plugin',
   },
}
