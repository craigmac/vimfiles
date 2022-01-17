" Vim compiler file
" Compiler: Vint for .vim files
" Maintainer: C.D. MacEachern <craigm@fastmail.com>
" Last Modified: 2020-04-17

if exists('current_compiler')
  finish
endif
let current_compiler = 'vint'

" older Vim always used :setlocal
if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=vint\ %
" Only Add otherwise it wipes out all others
CompilerSet errorformat+=%f:%l:%c:%m
