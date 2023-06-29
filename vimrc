" vi: fdm=marker:nowrap:ft=vim:fdl=99:noet:tw=100:nolist

" Options {{{
let g:mapleader = "\<Space>"
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif

set guifont=Iosevka\ Fixed:h24
set listchars=tab:→\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set noswapfile
set omnifunc=syntaxcomplete#Complete
set path-=/usr/include
set runtimepath+=~/src/personal/colorschemes
set showbreak=↪\ 
set signcolumn=yes
set smartindent
set spelllang=en_gb
set splitbelow splitright
set wildcharm=<C-z>
set wildoptions=pum,tagfile
set wildignore+=*/node_modules/*,*/venv/*,*/dist/*
set wildignore+=*.o,*.obg,*.png,*.jpg,*.jpeg,*.svg,*.gif
colorscheme fortnight
"}}}

" Packages {{{
packadd vim-unimpaired
packadd vim-surround
packadd vim-commentary
packadd vim-repeat
packadd vim-tmux-navigator
packadd vim-fugitive
packadd vim-rhubarb
packadd vim-qf

packadd fzf
packadd fzf.vim
packadd YouCompleteMe
packadd ale
packadd vim-colortemplate
" }}}

" Mappings {{{
imap <C-Space> <C-x><C-o>
nmap <Leader>/ :<C-u>silent grep!<Space>
nmap m<CR> :<C-u>make<CR>
nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>
nmap zS <Cmd>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'
nmap g> :<C-u>Redir<Space>
nmap ' `
nnoremap / /\c
nnoremap ? ?\c

cmap <expr> %. getcmdtype() == ':' ? expand('%:h') .. '/' : '%.'
cmap <expr> <C-n> wildmenumode() ? '<C-N>' : '<Down>'
cmap <expr> <C-p> wildmenumode() ? '<C-P>' : '<Up>'

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y

xmap . :g/^/norm! .<CR>
" }}}

" Autocmds/Functions {{{
augroup MyAugroup
  autocmd!
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$")
    \&& &ft !~ 'commit' | execute 'normal! g`"'
    \| endif
augroup END

" }}}

" Commands {{{
command! Cd tcd %:h
command! Bonly .+,$bwipeout
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! RemoveExtraNewlines :%s/\v(\n\n)\n+/\1/e
command! DiffOrig vert new | set bt=nofile | r ++edit \# | 0d_ | diffthis | wincmd p | diffthis
" }}}

" TODO:
" * make install/update script in .vim/install.sh for YCM and submodules
"
