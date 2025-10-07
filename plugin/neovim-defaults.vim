vim9script
# vi: et tw=100 sw=2 sts=-1 fdm=marker

# TODO: grepprg or -H and -I with 'grep'

# if we add lua heredoc to a vim script file, highlight it
g:vimsyn_embed = 'l'

filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set belloff=all
set comments+=fb:•
set commentstring=
set complete-=i
set define=''
set diffopt=internal,filler,closeoff,linematch:60
# adjust this on win32, no handy Nvim stdpath() function available in Vim
if !has('win32')
  if !isdirectory(expand('$HOME') .. '/.vim/cache/swap')
    call mkdir(expand('$HOME') .. '/.vim/cache/swap', 'p')
  endif
endif
&directory = expand('$HOME') .. '/.vim/cache/swap/' .. '/'
set display=lastline
set encoding=utf-8
set exrc
set fillchars=vert:│,fold:·,eob:-
set formatoptions=tcqj
if has('win64') | set isfname-=: | endif
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif
set hidden
set history=10000
set hlsearch
set incsearch
set include=''
set langnoremap
set laststatus=2
set modelines=5
set mouse=nvi
set mousemodel=popup_setpos
set nofsync
set nojoinspaces
set nolangremap
set nostartofline
set noswapfile
set nrformats=bin,hex
if v:version > 900 | set switchbuf=uselast | endif
set path-=/usr/include
set ruler
set sessionoptions+=unix,slash
set sessionoptions-=options
set shortmess+=CF
set shortmess-=S
set showcmd
set sidescroll=1
set smarttab
set tabpagemax=50
set tags=./tags;,tags
# turned on in nvim if term emulator detected capable of handling truecolor
set termguicolors
set ttimeout
set ttimeoutlen=50
set ttyfast
set undodir=~/.vim/cache/undo
set viewoptions+=unix,slash
set viewoptions-=options
set viminfo+=!
set wildmenu
if v:version > 900 | set wildoptions=pum,tagfile | endif

packadd matchit
# nvim ships a runtime lua plugin ran automatically
if v:version > 900 | packadd editorconfig | endif
# nvim has commenting builtin to its _defaults.lua
if v:version >= 901 | packadd comment | endif

# if we are in terminal vim, setup changing of cursor shapes
if !has('gui_running') && &term == 'win32'
  # Use DECSCUSR [DEC (S)et (CU)r(S)o(R)] style escape sequences
  &t_SI = "\e[6 q"    # non-blinking bar
  &t_SR = "\e[4 q"    # non-blinking underline
  &t_EI = "\e[2 q"    # non-blinking block
  &t_ti ..= "\e[2 q"  # non-blinking block
  &t_te ..= "\e[0 q"  # default (depends on terminal, normally blink block)
endif

nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
nnoremap & :&&<CR>
# rerun last macro with `Q`, unless in Visual/Replace modes
nnoremap <expr> Q mode() ==# 'V' ? ':normal! @<C-R>reg_recorded()<CR><CR>' : 'Q'
# in linewise Visual mode, execute macro on each selected line, like @.
xnoremap <expr> @ mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'

# }}}

augroup my.nvim.defaults | au!
  # equivalent to nvim's TermOpen event
  au TerminalWinOpen * {
    setl nomodifiable
    setl nonumber
    setl norelativenumber
    setl nolist
    setl signcolumn=no
    setl foldcolumn=0
  }
  # emulate nvim's gO in help files using vim runtime plugin for it
  au FileType help {
    packadd helptoc
    nnoremap <buffer> gO <Cmd>HelpToc<CR>
  }
augroup END

# link terminal buffer stl to regular stl don't use vim's green stl
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC

# vi: et sw=2 sts=-1 fdm=marker
