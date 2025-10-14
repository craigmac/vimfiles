vim9script

if exists("g:loaded_fugitive") | finish | endif

nnoremap <Leader>gg <Cmd>G<CR>
nnoremap <Leader>gP <Cmd>G push<CR>
nnoremap <Leader>g<Space> :<C-u>G <C-z><S-Tab>

