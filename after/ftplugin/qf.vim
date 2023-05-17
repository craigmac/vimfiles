" https://github.com/romainl/vim-qf
setlocal nonumber
setlocal norelativenumber
setlocal nolist
setlocal nospell

" maps for buffer, using https://github.com/romainl/vim-qf
" only set when qf is loaded
nmap <buffer> <Left> <Plug>(qf_older)
nmap <buffer> <Right> <Plug>(qf_newer)
nmap <buffer> <Up> :1chistory<CR>
nmap <buffer> <Down> :cnewer 99<CR>
nnoremap <buffer> dd :.Reject<CR>
xnoremap <buffer> d :Reject<CR>

if exists("b:undo_ftplugin")
  let b:undo_ftplugin ..= " | setl nu< rnu< list< spell<"
else
  let b:undo_ftplugin = "setl nu< rnu< list< spell<"
endif
