
" maps for https://github.com/romainl/vim-qf
nmap <buffer> <Left> <Plug>(qf_older)
nmap <buffer> <Right> <Plug>(qf_newer)
nmap <buffer> <Up> :1chistory<CR>
nmap <buffer> <Down> :cnewer 99<CR>
nmap <buffer> dd :.Reject<CR>
xmap <buffer> d :Reject<CR>

if exists("b:undo_ftplugin")
  let b:undo_ftplugin ..= " | setl nu< rnu< list< spell<"
else
  let b:undo_ftplugin = "setl nu< rnu< list< spell<"
endif
