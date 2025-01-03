vim9script

if !exists("g:loaded_tmux_navigator") | finish | endif

" in vim <M-hjkl> verisons are less compatible, also we don't
" have the nvim's more comprehensive smart-splits.nvim, so no <C-M-hjkl>
nnoremap <silent> h :<C-u>TmuxNavigateLeft<CR>
nnoremap <silent> j :<C-u>TmuxNavigateDown<CR>
nnoremap <silent> k :<C-u>TmuxNavigateUp<CR>
nnoremap <silent> l :<C-u>TmuxNavigateRight<CR>

