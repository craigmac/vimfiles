setlocal nonumber
setlocal norelativenumber
setlocal nospell
setlocal nolist
setlocal nofoldenable

nnoremap <buffer> gO <Cmd>HelpToc<CR>

if exists("b:undo_ftplugin")
  let b:undo_ftplugin ..= " | setl nu< rnu< spell< list< foldenable< | nunmap gO"
else
  let b:undo_ftplugin = "setl nu< rnu< spell< list< foldenable< | nunmap gO"
endif

