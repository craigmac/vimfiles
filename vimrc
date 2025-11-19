vim9script
# config for Debian stable `apt get install vim-nox` and higher

# add neovim defaults {{{1

# must be set now, see `:h go-M` for why
set guioptions-=M

# source vim defaults first, thus ensuring nvim defaults override them
# (cf. `Q` in defaults.vim is not the same as `Q` in nvim's `_defaults.lua`)
source $VIMRUNTIME/defaults.vim

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
#if !isdirectory(&undodir) |  call mkdir(&undodir, 'p') | endif
#if !isdirectory(&directory) | call mkdir(&directory, 'p') | endif
#if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p') | endif

set autoindent
set autoread
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
# turned on in nvim if term emulator detected capable of handling truecolor,
# which most are now, so bet on it rather than recreating detection logic here
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
# TODO: defaults.vim uses Q for alias to gq (format)
# and nvim uses it for repeating last register recorded, but
# in vim there is no reg_recorded() function, so custom logic might be needed
#nnoremap Q <Cmd>normal! @<C-R>reg_recorded()<CR><CR>

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
# }}}

g:mapleader = " "
g:netrw_banner = 0
g:markdown_fenced_languages = [ 'vim', 'lua', 'sh=bash' ]
# support folding all: functions, heredocs, augroups, vim9 stuff when using `fdm=syntax`
g:vimsyn_folding = 'acefhiHlmpPrt'
# don't highlight strings inside of comments in vim filetypes
g:vimsyn_comment_strings = false
# allow function, heredoc, and if/do/for folding with `fdm=syntax` in &ft == 'sh'
g:sh_fold_enabled = 7

# get full vim version like '9.1.1882' for display, e.g., in &titlestring
var ver = split(string(v:version), '\zs') # => ['9', '0', '1']
var patch = strpart(string(v:versionlong), 3)
g:full_version = printf("%s.%s.%s", ver[0], ver[-1], patch)
g:titlestring = printf('%s %s [%s]', v:progname, g:full_version, getcwd())

# UI/special characters
if has('win32') && !has('gui_running')
  # ref. `:h term.txt`
  if &term ==# 'win32'
    # NOTE: Windows native huge build vim/gvim does not come with '+termresponse' feature builtin
    # so there's no querying of the terminal capabilities possible, like these:
    # (R)equest terminal (V)ersion string
    # &t_RV = 
    # (R)equest terminal (B)ackground/(F)oreground colour
    # &t_RB = 
    # &t_RF = 

    # Windows builtin terminfo when `&term == 'win32'` default is `set bg=dark`
    # setting it to this will try to redetect it rather than autoset bg to dark
    #set background=light
    set background=light

    # add more terminal capabilities that aren't in builtin 'win32' terminfo
    # (B)racketed paste (E)nable/(D)isable
    &t_BE = "\e[?2004h"
    &t_BD = "\e[?200l"
    # (P)aste (S)tart/(E)nd markers
    &t_PS = "\e[200~"
    &t_PE = "\e[201~"
    # (f)ocus event tracking (e)nable/(d)isable
    # if garbage shows up on screen when Vim starts this isn't supported
    &t_fe = "\e[?1004h"
    &t_fd = "\e[?1004l"
    execute "set <FocusGained>=\e[I"
    execute "set <FocusLost>=\e[O"
    # set (t)itle (s)tring
    # &t_ts =
    # (f)inished title (s)tring
    # &t_fs = 
  endif
endif

&guifont = has('win32') ? 'Adwaita_Mono:h14:cANSI:qDRAFT' : 'Adwaita Mono 14'
# eob not in modern editors and `set number` makes it irrelevant
set fillchars=eob:\ ,fold:\ ,foldinner:\ ,foldopen:▼,foldclose:▶,foldsep:\ 
# lastline is archaic and not needed, same with truncations
set fillchars+=diff:\ ,lastline:\ ,vert:│,trunc:\ ,truncrl:\ 
if has('patch-9.1.1883') | set fillchars+=tpl_vert:│ | endif
# extends/precedes are not in other modern editors, uses hl-NonText
set listchars=eol:¬,extends:\ ,precedes:\ 
# visualizing spaces, uses hl-SpecialKey
set listchars+=space:·,trail:█,nbsp:_,tab:>\ 
# allow '[3/782]' rather than default '[3/>99]'
set maxsearchcount=999
# handled in custom statusline
set noshowmode
set number
set pumborder=round

# behaviour - add some modern assumptions
set splitbelow
set splitright
set visualbell

# misc
set helpheight=0 # default of 20 messes with 'equalalways

# completion/finding
set autocomplete
set complete=o^10,.^10,w^5,b^5
set completeopt=menuone,popup,fuzzy,noselect
set completepopup=highlight:Pmenu,border:single,shadow:on
set completefuzzycollect=keyword,files,whole_line
set findfunc=Find
set ignorecase
set pumheight=10
set smartcase
set wildcharm=<C-z>
set wildignore+=*.swp,*~,*.bak,*.o,*.obj,.DS_Store,.netrwh
set wildignore+=.git/,.node_modules/,.cache/,tmp/
set wildmode=noselect:lastused,full
set wildoptions=fuzzy,pum,tagfile,exacttext

# no wrap but if toggled on use these options
set nowrap
set breakindent
set breakindentopt=sbr
set linebreak
set nojoinspaces
set showbreak=↳\ 

# editing
set spelloptions=camel
set spellsuggest=fast,5,timeout:1000
set virtualedit=block

# startup/runtime behaviour
set exrc
set diffopt+=followwrap,algorithm:minimal
set sidescrolloff=2
set tabclose=uselast
set undofile
set smoothscroll

# bars and lines
var parts = [
  " %{toupper(mode() == '' ? 'b' : mode())}",
  " │%<%f ",
  "%{ &modified ? '● ' : '' }",
  "%{ &readonly ? '⊗ ' : '' }",
  "%3*%{ &previewwindow ? '[Preview Window] ' : '' }%*",
  "%=",
  "%-20.(▼ %l/%L ▶ %c:%{col('$')-1} %)",
  "%p%%",
  "%( %{&filetype} %)"
]
&statusline = join(parts, '')

# keymappings
nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader><Space> <Cmd>buffer #<CR>
nnoremap <Leader><CR> <Cmd>source %<CR>
nnoremap <Leader>z <Cmd>wincmd _ <Bar> wincmd \|<CR>
nnoremap <expr> <Leader>e exists('g:loaded_netrw') ? exists('w:netrw_rexlocal') ? '<Cmd>Rexplore<CR>' : '<Cmd>Explore<CR>' : '<Cmd>Explore<CR>'
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader>f :<C-u>find **/*
nnoremap <Leader>b :<C-u>buffer <C-z><S-Tab>
nnoremap zS <Cmd>echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <expr> j (&wrap && v:count == 0) ? 'gj' : 'j'
nnoremap <expr> k (&wrap && v:count == 0) ? 'gk' : 'k'
nnoremap <Leader>vp <Cmd>tabedit $MYVIMDIR/plugged<CR>
nnoremap <Leader>vr <Cmd>tabedit $VIMRUNTIME<CR>

# `n` goes forward, `N` goes backwards - regardless of search start direction
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

# explicitly target the system clipboard (gvimrc overrides to `"*` versions)
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

# moving around with <A-hjkl>
nnoremap h <Cmd>wincmd h<CR>
nnoremap j <Cmd>wincmd j<CR>
nnoremap k <Cmd>wincmd k<CR>
nnoremap l <Cmd>wincmd l<CR>
tnoremap h <C-\><C-n><Cmd>wincmd h<CR>
tnoremap j <C-\><C-n><Cmd>wincmd j<CR>
tnoremap k <C-\><C-n><Cmd>wincmd k<CR>
tnoremap l <C-\><C-n><Cmd>wincmd l<CR>

cnoremap w!! w !sudo tee > /dev/null %
cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'
# retain cmdline history keys Up/Down even if wildmenu open
cnoremap <expr> <Up> wildmenumode() ? '<C-e><Up>' : '<Up>'
cnoremap <expr> <Down> wildmenumode() ? '<C-e><Down>' : '<Down>'

tnoremap <C-]><C-]> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>

# repeat last command on visual lines
xnoremap . :normal .<CR>

augroup my.augroup.vimrc | autocmd!
  au WinEnter,BufEnter,InsertLeave * setlocal cursorline
  au WinLeave,BufLeave,InsertEnter * setlocal nocursorline

  # autocompletion on cmdline and searches
  au CmdlineChanged [:\/\?] wildtrigger()

  # create missing dirs on save, like neovim's :w ++p
  au BufWritePre * {
    if &modifiable && !isdirectory(expand("%:p:h"))
      mkdir(expand("%:p:h"), "p")
    endif
  }
augroup END

def g:FindGitFiles(cmdarg: string, cmdcomplete: bool): any
  var fnames = systemlist('git ls-files')
  return fnames->filter((idx, val) => val =~? cmdarg)
enddef

def Find(arg: string, _): list<string>
  g:filescache = globpath('.', '**', true, true)
  filter(g:filescache, '!isdirectory(v:val)')
  map(g:filescache, 'fnamemodify(v:val, ":.")')
  return arg == '' ? g:filescache : matchfuzzy(g:filescache, arg)
enddef
defcompile
g:filescache = []

packadd netrw
packadd nohlsearch
packadd hlyank

# make popup windows bg same as Normal and use 'pumborder' instead
hi! link Pmenu Normal
hi! link PmenuExtra Normal
hi! PmenuBorder guibg=NONE
hi! PmenuMatch guibg=NONE
hi! PmenuKind guibg=NONE

# `:h hl-User1..9` choose colours that work against `hl-StatusLine`
hi! User1 guifg=Black ctermfg=232
hi! User2 guifg=White guibg=Red
hi! User3 guifg=Black guibg=Green
hi! User4 guifg=Black guibg=Yellow
hi! User5 guifg=White guibg=Blue
hi! User6 guifg=Black guibg=Magenta
hi! User7 guifg=Black guibg=Cyan
hi! User8 guifg=White ctermfg=231

# vi: et sw=2 sts=-1 tw=100 fdm=marker
