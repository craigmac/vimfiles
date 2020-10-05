" Vim compiler file
" Compiler:	Vint for .vim files
" Maintainer: C.D. MacEachern <craigm@fastmail.com>
" Last Modified: 2020-04-17

if exists('current_compiler')
  finish
endif
let current_compiler = 'vint'

if exists(':CompilerSet') != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=vint
CompilerSet errorformat=%f:%l:%c:%m
