" https://github.com/skywind3000/asyncrun.vim

" usually check g:loaded_pluginName here but asyncrun doesn't follow this
" convention, so we just check if this command is defined instead
if !exists(':AsyncRun')
  nmap <Leader>cc :<C-u>cwindow<CR>
  nmap <Leader>cq :<C-u>cclose<CR>
  nmap <Leader>ll :<C-u>lwindow<CR>
  nmap <Leader>lq :<C-u>lclose<CR>
  finish
endif

" replace :make with :Make seamlessly
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
cnoremap make Make

nmap <Leader>cc :<C-u>call asyncrun#quickfix_toggle(8)<CR>

