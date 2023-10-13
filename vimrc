vim9script

# Options {{{
g:mapleader = ' '
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif

# modernize using utf-8 characters
set listchars=tab:\ ,lead:·,trail:·,eol:\ ,precedes:\ ,extends:\ ,
set fillchars=vert:│,stl:\ ,stlnc:\ ,fold:\ ,foldopen:,foldclose:,foldsep:\ ,diff:-,eob:\ ,lastline:\ ,
set noswapfile
set omnifunc=syntaxcomplete#Complete
set path-=/usr/include
set showbreak=\ 
set wildoptions=pum,tagfile
set wildignore+=*/node_modules/*,*/venv/*,*/dist/*
set wildignore+=*.o,*.obj,*.png,*.jpg,*.jpeg,*.svg,*.gif
set splitbelow splitright
set signcolumn=yes
set foldcolumn=1
set list
set number relativenumber
set ignorecase smartcase
set cursorline
set termguicolors
set shortmess+=sWAI
colorscheme zaibatsu
#}}}

# Packages config {{{
if has('patch-9.0.1880') | packadd editorconfig | endif

g:netrw_banner = 0
g:netrw_hide = 1
g:netrw_liststyle = 3
g:netrw_sizestyle = 'H'
g:netrw_list_hide = netrw_gitignore#Hide()
# use echoerr instead of temp window you have to close
g:netrw_use_errorwindow = 2
# }}}

# Mappings {{{
nnoremap <Leader>E <Cmd>silent 25Lexplore<CR>
nnoremap <Leader>e. <Cmd>Lexplore! %:h<CR>

nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

cmap <expr> <C-n> wildmenumode() ? '<C-N>' : '<Down>'
cmap <expr> <C-p> wildmenumode() ? '<C-P>' : '<Up>'

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y

xmap . :g/^/norm! .<CR>
# }}}

# Autocmds/Functions {{{
augroup User
  autocmd!
  # autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~ 'commit'
  #   | execute 'normal! g`"'
    # | endif
  autocmd FileType qf packadd cfilter
augroup END

# }}}

# Commands {{{
# }}}

# vi: fdm=marker ft=vim fdl=0 et sw=2 sts=-1 tw=100
