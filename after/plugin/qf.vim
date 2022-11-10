" https://github.com/romainl/vim-qf
" options to change after vim-qf has loaded, if needed.

if !get(g:, 'loaded_qf') | finish | endif

" mappings that apply to 'qf' buftype only, go in `after/ftplugin/qf.vim`
nnoremap <Leader>cc <Plug>(qf_qf_toggle)
nnoremap <Leader>ll <Plug>(qf_loc_toggle)
