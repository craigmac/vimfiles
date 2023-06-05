" https://github.com/tpope/vim-fugitive

" only run this file fugitive is loaded
if !get(g:, 'loaded_fugitive') | finish | endif

set statusline=%{FugitiveStatusline()}%=%f%=%-14.(%l,%c%V%)\ %P
autocmd! BufReadPost fugitive://* setlocal bufhidden=delete

" git/fugitive general interface
nnoremap <Leader>gg <cmd>G<CR>
nnoremap g<Leader> :G<space>

" Diff/versions
nnoremap <Leader>ge <cmd>Gedit <Bar> only<CR>
nnoremap <Leader>gd <cmd>Gvdiffsplit<CR>

" Logs
nnoremap <Leader>gl <cmd>G log --oneline --decorate<CR>
nnoremap <Leader>gL <cmd>G log --oneline --decorate -- %<CR>

" Searching/Finding
nnoremap <Leader>g/ :Ggrep! -HnriqE<Space>
nnoremap <Leader>gS :G! log -p -S<Space>
nnoremap <Leader>gs :G! log -p -S -- %<S-Left><S-Left>
nnoremap <Leader>g* :Ggrep! -Hnri --quiet <C-r>=expand("<cword>")<CR><CR>
nnoremap <Leader>gb <cmd>G blame<CR>

" Fetching/Merging/Pushing
nnoremap <Leader>gP <cmd>G push<CR>
nnoremap <Leader>gp <cmd>G pull<CR>

" Committing/Adding
nnoremap <Leader>G :G commit -am ''<Left>

" URL/github/web
nnoremap <Leader>gx <cmd>GBrowse<CR>

