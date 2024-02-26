" keep in ./plugin directory wherever your vimrc is to run this first before
" your vimrc settings, to bring us close to neovim defaults
set nocompatible
filetype plugin indent on
syntax on

set autoindent
set autoread
set bg=dark
set backspace=indent,eol,start
set belloff=all
set commentstring=
set complete-=i
" on win32 you'll have to adjust this yourself, Vim doesn't have any
" handy stdpath() functions from Neovim.
if !has('win32')
  " E303 errors happen if .vim/tmp/swap doesn't exist, so make it
  if !finddir(expand('$HOME') .. '/.vim/tmp/swap')
    call mkdir(expand('$HOME') .. '/.vim/tmp/swap', 'p')
  endif
endif
set directory=~/.vim/tmp/swap//
set display=lastline
set encoding=utf-8
set fillchars=vert:│,fold:·,eob:~
set formatoptions=tcqj
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
set switchbuf=uselast
set tabpagemax=50
set tags=./tags;,tags
set ttimeout
set ttimeoutlen=50
set ttyfast
set undodir=~/.vim/tmp/undo
set viewoptions+=unix,slash
set viewoptions-=options
set viminfo+=!
set wildmenu
set wildoptions+=pum
let g:vimsyn_embed = 'l'
packadd matchit

nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
nnoremap & :&&<CR>
nnoremap Q @@

" vi:et ts=2 sw=2 sts=-1
