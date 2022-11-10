" https://github.com/skywind3000/asynctasks.vim

" TODO: it doesn't use this idiom? Make PR for it?
" if !get(g:, 'loaded_asynctasks') | finish | endif
let g:asyncrun_open = 10
nnoremap <silent> <F5> <Cmd>AsyncTask file-build<CR>
nnoremap <silent> <F6> <Cmd>AsyncTask file-run<CR>
nnoremap <silent> <C-F5> <Cmd>AsyncTask project-build<CR>
nnoremap <silent> <C-F6> <Cmd>AsyncTask project-run<CR>

" TODO: create mapping to run AsyncTask grep<CR>

