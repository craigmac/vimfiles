" bring us closer to neovim defaults, in nvim see `:h vim-diff`
"
" in case we are already nvim
if has('nvim') | finish | endif
set nocompatible
filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set belloff=all
set commentstring=
set complete-=i
" adjust this on win32, no handy Nvim stdpath() function available in Vim
if !has('win32')
  if !isdirectory(expand('$HOME') . '/.vim/cache/swap')
    call mkdir(expand('$HOME') . '/.vim/cache/swap', 'p')
  endif
endif
let &directory=expand('$HOME') . '/.vim/cache/swap/' . '/'
set display=lastline
set encoding=utf-8
set fillchars="vert:│,fold:·,eob:~"
set formatoptions=tcqj
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif
set hidden
set history=10000
set hlsearch
set incsearch
set langnoremap
set laststatus=2
set modelines=5
set mouse=nvi
set mousemodel=popup_setpos
set nofsync
set nojoinspaces
set nolangremap
set nostartofline
set nrformats=bin,hex
set ruler
set sessionoptions+=unix,slash
set sessionoptions-=options
set shortmess+=F
set shortmess-=S
set showcmd
set sidescroll=1
set smarttab
if v:version > 900 | set switchbuf=uselast | endif
set tabpagemax=50
set tags=./tags;,tags
" turned on in nvim if term emulator detected capable of handling truecolor
set termguicolors
set ttimeout
set ttimeoutlen=50
set ttyfast
set undodir=~/.vim/cache/undo
set viewoptions+=unix,slash
set viewoptions-=options
set viminfo+=!
set wildmenu
if v:version > 900 | set wildoptions+=pum | endif
let g:vimsyn_embed = 'l'
packadd matchit
" nvim ships a runtime lua plugin ran automatically
if v:version > 900 | packadd editorconfig | endif

nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
nnoremap & :&&<CR>
nnoremap Q @@

" termcap mode 
let &t_ti.="\e[1 q"
" insert mode
let &t_SI.="\e[5 q"
" replace mode
let &t_SR.="\e[3 q"
" end insert/replace mode
let &t_EI.="\e[1 q"
" end of termcap mode
let &t_te.="\e[0 q"

" vi:et ts=2 sw=2 sts=-1
