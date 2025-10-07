vim9script

# if we add lua heredoc to a vim script file, highlight it
g:vimsyn_embed = 'l'

# bring us as close to neovim defaults as we can
set autoindent
set autoread
set belloff=all
set backspace=indent,eol,start
set comments+=fb:•
set commentstring=
set define=''
set diffopt=internal,filler,closeoff,linematch:60
set display=lastline
set exrc
set formatoptions=tcqj
if has('win64') | set isfname-=: | endif
# TODO: grepprg or -H and -I with 'grep'
set hidden
set history=10000
set hlsearch
set incsearch
set include=''
set nojoinspaces
set langnoremap
set nolangremap
set laststatus=2
set mouse=nvi
set mousemodel=popup_setpos
set nrformats=bin,hex
set path-=/usr/include
set ruler
set sessionoptions+=unix,slash
set sessionoptions-=options
set shortmess+=CF
set shortmess-=S
set showcmd
set smarttab
set nostartofline
set switchbuf=uselast
set noswapfile
set tabpagemax=50
set termguicolors
set ttimeout
set ttimeoutlen=50
set wildmenu
set wildoptions=pum,tagfile

# if we are in terminal vim, setup changing of cursor shapes
if !has('gui')
  &t_EI = "\e[2 q"
  &t_SI = "\e[5 q"
  &t_SR = "\e[3 q"
endif

nnoremap Y y$
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
nnoremap & :&&<CR>
# rerun last macro
nnoremap <expr> Q mode() ==# 'V' ? ':normal! @<C-R>reg_recorded()<CR><CR>' : 'Q'
# in linewise visual mode, execute macro on each selected line, like @.
xnoremap <expr> @ mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'
xnoremap # y?\V<C-R>"<CR>
xnoremap * y/\V<C-R>"<CR>

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
