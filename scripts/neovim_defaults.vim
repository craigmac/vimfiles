vim9script

# Emulate Neovim defaults

# source vim defaults first, thus ensuring nvim defaults override them
# (cf. `Q` in defaults.vim is not the same as `Q` in nvim's `_defaults.lua`)
source $VIMRUNTIME/defaults.vim
# undo some changes it made, :legacy required here for vim9script
unlet! g:c_comment_strings
autocmd! vimHints

# if we add a lua heredoc to a vim script file, highlight it
g:vimsyn_embed = 'l'
# highlight neovim specific vim script elements
g:vimsyn_vim_features = ['nvim']

# honour env vars for these first and if not there, setup nvim defaults
#if !getenv('XDG_CONFIG_HOME')
  # exe "setenv('XDG_CONFIG_HOME', " .. has('win32') ? getenv('LOCALAPPDATA') :
  #    getenv('HOME')
  #  var loc = has('win32') ? getenv('LOCALAPPDATA') : getenv('HOME')
  # does execute work with printf?
  #exe printf("setenv('XDG_CONFIG_HOME', %s)", loc)
#endif

#&undodir = stdpath_data .. '/undo//'
#&directory = stdpath_data .. '/swap//'
#&backupdir = stdpath_data .. '/backup//'

# create missing directories
#if !isdirectory(&undodir) | call mkdir(&undodir, 'p') | endif
#if !isdirectory(&directory) | call mkdir(&directory, 'p') | endif
#if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p') | endif

set autoindent
set autoread
set background=dark
set belloff=all
set comments+=fb:•
set commentstring=
set complete-=i
set define=''
set diffopt=internal,filler,closeoff,linematch:60
# vim's defaults.vim sets to 'truncate'
set display=lastline
set encoding=utf-8
set exrc
set fillchars+=vert:│,fold:·
set formatoptions=tcqj
if has('win32') | set isfname-=: | endif
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif
set hidden
set history=10000
set hlsearch
set include=''
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
set switchbuf=uselast
set path-=/usr/include
set sessionoptions+=unix,slash
set sessionoptions-=options
set shortmess+=CF
set shortmess-=S
set sidescroll=1
set smarttab
set tabpagemax=50
set tags=./tags;,tags
# `vim --clean` defaults to 16 in Windows Terminal, nvim default is 256
set t_Co=256
# turned on in nvim if term emulator detected capable of handling truecolor,
# which most are now, so bet on it rather than recreating detection logic here,
# especially because Windows Terminal doesn't answer termrequests via `t_RB`
# and Windows doesn't use the terminfo database (vim/nvim ship builtin terminfos
# specific to Windows for this reason, vim has 'win32' and nvim has a 'vtpcon')
set termguicolors
# vim's defaults.vim sets to 100
set ttimeoutlen=50
set ttyfast
set viewoptions+=unix,slash
set viewoptions-=options
set viminfo+=!
set wildmenu
set wildoptions=pum,tagfile

# nvim loads this plugin by default
packadd matchit
# nvim ships a runtime lua plugin ran automatically. vim added this later.
# don't add colorcolumn at textwidth + 1 by default, nvim doesn't do this
g:EditorConfig_max_line_indicator = 'none'
packadd editorconfig
# nvim has commenting builtin to its _defaults.lua. vim added this later.
packadd comment

# if we are in terminal vim, setup changing of cursor shapes
if !has('gui_running')
  # Use DECSCUSR [DEC (S)et (CU)r(S)o(R)] style escape sequences
  &t_SI = "\e[6 q"    # non-blinking bar
  &t_SR = "\e[4 q"    # non-blinking underline
  &t_EI = "\e[2 q"    # non-blinking block
  &t_ti ..= "\e[2 q"  # non-blinking block
  &t_te ..= "\e[0 q"  # default (depends on terminal, normally blink block)
endif

nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-W> <C-G>u<C-W>
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
nnoremap & :&&<CR>

augroup my.nvim.defaults | au!
  # equivalent to nvim's TermOpen event
  au TerminalWinOpen * {
    setlocal nomodifiable
    setlocal nonumber
    setlocal norelativenumber
    setlocal nolist
    setlocal signcolumn=no
    setlocal foldcolumn=0
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



