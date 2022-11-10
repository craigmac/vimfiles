" reminder: b:did_ftplugin value is ignored for after/* no need to set for
" personal vim/after/ftplugin/*.vim files

setlocal noexpandtab
setlocal shiftwidth=2
setlocal softtabstop=-1
setlocal tabstop=2
setlocal textwidth=80
setlocal foldmethod=indent
setlocal foldnestmax=1
setlocal suffixesadd=.vim

let &l:define = '\C^command\|^function\|^def'

if exists("b:undo_ftplugin")
  let b:undo_ftplugin ..= " | setl et< sw< sts< ts< fdm< fdn< sua<"
else
  let b:undo_ftplugin = "setl et< sw< sts< ts< fdm< fdn< sua<"
endif
