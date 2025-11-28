vim9script
# Debian 12:  `sudo apt get install vim-gtk3`          => 9.1.1244
# Windows 10: `winget install vim.vim --source winget` => 9.1.1882

# must be set now, see `:h go-M` for why
set guioptions-=M

# add neovim defaults {{{1

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
# }}}

g:mapleader = " "
g:netrw_banner = 0
g:markdown_fenced_languages = [ 'vim', 'lua', 'bash', 'ps1', 'python' ]
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
# Windows native vim.exe (not gvim.exe)
if has('win32') && !has('gui_running')
  # ref. `:h term.txt`. Adjust here what we know the terminal emulator can do, that isn't in 'win32'
  # builtin vim terminfo entry. 
  # NOTE: Windows native huge build vim/gvim doesn't have '+termresponse' feature so we can't
  # use `t_RB` for instance to have vim query for background colour, and there's no '+terminfo'
  # so we can't just set it to 'xterm-256color' and have something somewhat sane
  if &term == 'win32'
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
set findfunc=g:FindGitFiles
set ignorecase
# gets in the way less, default 0 means no maximum
set pumheight=5
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
# don't leave `*.un~` files in working directories
set undodir-=.
set smoothscroll

# bars and lines
var parts = [
  "%( %{% toupper(mode() == '' ? 'b' : mode()) .. ' │' %}%)",
  "%( %<%f%)",
  "%( %{% &modified && &buftype != 'terminal' ? '±' : '' %}%)",
  "%( %{% !&modifiable && &buftype != 'terminal' ? '!±' : '' %}%)",
  "%( %{% &readonly ? '[RO]' : '' %}%)",
  "%( %{% &previewwindow ? '[PRV]' : '' %}%)",
  "%( %a%)",
  "%=",
  "%( %{% reg_recording() != '' ? printf('@%s', reg_recording()) : '' %}%)",
  "%( %{% &showcmdloc == 'statusline' ? '%S' : '' %}%)",
  "%( %{% exists('b:keymap_name') ? '<' .. b:keymap_name .. '>' : '' %}%)",
  "%( %{% &fenc != 'utf-8' ? &fenc : '' %}%)",
  # "%-16.( %l↓%L %v→%{% virtcol('$') - 1 %}%)",
  #"%-10.( %l↓%L%)%6.( %v→%{% virtcol('$') - 1 %}%)",
  "%12.( %l↓%L%)%6.( %v→%{% virtcol('$') - 1 %}%)",
  "%5( %p%%%)",
  "%( %{% &filetype .. ' ' %}%)",        
]
&statusline = join(parts, '')
&titlestring = g:titlestring

# keymappings
nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader><Space> <Cmd>buffer #<CR>
nnoremap <Leader><CR> <Cmd>source %<CR>
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <expr><Leader>e exists('g:loaded_netrw') && exists('w:netrw_rexlocal') ? '<Cmd>Rex<CR>' : '<Cmd>Ex<CR>'
nnoremap zS <Cmd>echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <expr> j (&wrap && v:count == 0) ? 'gj' : 'j'
nnoremap <expr> k (&wrap && v:count == 0) ? 'gk' : 'k'
nnoremap <Leader>vp <Cmd>tabedit $MYVIMDIR/plugged<CR>
nnoremap <Leader>vr <Cmd>tabedit $VIMRUNTIME<CR>
nnoremap <Leader>t <Cmd>split $MYVIMDIR/todo.txt<CR>

# `n` goes forward, `N` goes backwards - regardless of search start direction
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

# explicitly target the system clipboard (`./gvimrc` overrides to `"*` versions)
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

# vim-only, unix-only trick to write current buffer with sudo
if !has('win32') | cnoremap w!! w !sudo tee > /dev/null % | endif
cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'
# retain ability to use cmdline history keys Up/Down even if wildmenu open
cnoremap <expr> <Up> wildmenumode() ? '<C-e><Up>' : '<Up>'
cnoremap <expr> <Down> wildmenumode() ? '<C-e><Down>' : '<Down>'

tnoremap <C-]><C-]> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>

# repeat last command on visual lines
xnoremap . :normal .<CR>

# tab/s-tab selects from &autocomplete pmenu if it's open,
# <C-e><Tab> to close menu and insert tab or <C-v><Tab> to skip trigger
inoremap <silent><expr> <Tab>   pumvisible() ? '<C-n>' : '<Tab>'
inoremap <silent><expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'

# cf. `:h scroll-smooth`, may have unforseen consequences
execute 'map <C-u> ' .. repeat('<C-y>', 15)
execute 'map <C-d> ' .. repeat('<C-e>', 15)

# autocmd groups naming convention:
#
# 'my.augroup.cursorline'    group of event(s) that triggers managing the 'cursorline' option
# 'my.augroup.winenter'      WinEnter event. a general catch all that's not limited to one subject
# 'my.augroup.term.winenter' WinEnter event, but specifically for terminal buffers
augroup my.augroup.cursorline.on | autocmd! | augroup END
augroup my.augroup.cursorline.off | autocmd! | augroup END
augroup my.augroup.colors | autocmd! | augroup END
augroup my.augroup.cmdline | autocmd! | augroup END
augroup my.augroup.bufwritepre | autocmd! | augroup END

au my.augroup.cursorline.on WinEnter,BufEnter,InsertLeave * setlocal cursorline
au my.augroup.cursorline.off WinLeave,BufLeave,InsertEnter * setlocal nocursorline
# not triggered during startup, call `:colorscheme default` later to explicitly trigger
# au my.augroup.colors ColorScheme * call ColorSchemeSettings()
au my.augroup.cmdline CmdlineChanged : {
  if !has('win32') | wildtrigger() | endif
  # skip lagging `:!` on Windows, you can always hit <Tab> to manually trigger it
  var ln = getcmdline()
  if ln !~ '^!' | wildtrigger() | endif
}

# create missing dirs on save, like neovim's :w ++p
au my.augroup.bufwritepre BufWritePre * {
  if &modifiable && !isdirectory(expand("%:p:h"))
    mkdir(expand("%:p:h"), "p")
  endif
}

# slow on Windows but better than vanilla `:f **/*<C-z><S-z>`
# def g:Find(arg: string, _): list<string>
#   g:filescache = globpath('.', '**', true, true)
#   filter(g:filescache, '!isdirectory(v:val)')
#   map(g:filescache, 'fnamemodify(v:val, ":.")')
#   return arg == '' ? g:filescache : matchfuzzy(g:filescache, arg)
# enddef
# # defcompile
# g:filescache = []

# better than g:Find, but beware: if 'wildtrigger' is set, this function
# will be ran on each keystroke in the cmdline
def g:FindGitFiles(arg: string, cmdcomplete: bool): list<string>
  if empty(g:filescache)
    # -z flags means NUL separated, to avoid stray ^M chars from Windows
    var getfilescmd = printf('git ls-files %s', has('win32') ? '-z' : '')  
    #if has('win32') 
    #  getfilescmd ..= ' -z'
    #endif
    g:filescache = systemlist(getfilescmd)
  endif
  return g:filescache->filter((i, fname) => fname =~? arg)
enddef
defcompile
# empty it on startup and re-source, leaving cmdline should empty it too
g:filescache = []
# <afile> expands to `:h cmdline-char`
au! my.augroup.cmdline CmdlineLeave if expand("<afile>") == ':' \| g:filescache = [] \| endif

# set tabpage directory to path of current buffer
command! Cd <Cmd>tcd %:h<CR>
# WARN: can/will mess up custom whitespace alignments! squeeze 2+ spaces to 1
command! SqueezeWhiteSpace <Cmd>%s/\v\s{2,}/ /gce<CR>
# squeeze 2+ empty lines into one empty line
command! SqueezeNewLines <Cmd>%s/\v\n{3,}/\n\n/gce<CR>

packadd netrw
packadd nohlsearch
packadd hlyank

plug#begin()
  Plug 'tpope/vim-unimpaired' | Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dispatch'   | Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'    | Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'  | Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/vim-easy-align'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'romainl/vim-qf'
plug#end()

# fixes/tweaks I set for ALL colorschemes
#def g:ColorSchemeSettings()
  # hi! link Pmenu Normal
  # hi! link PmenuExtra Normal
  # hi! PmenuBorder guibg=NONE
  # hi! PmenuMatch guibg=NONE
  # hi! PmenuKind guibg=NONE
  # hi! CursorLine cterm=NONE gui=NONE
  # hi! CursorLineNr cterm=NONE gui=NONE

  # `:h hl-User1..9` choose colours that work against `hl-StatusLine`
#   hi! User1 guifg=Black ctermfg=232
#   hi! User2 guifg=White guibg=Red
#   hi! User3 guifg=Black guibg=Green
#   hi! User4 guifg=Black guibg=Yellow
#   hi! User5 guifg=White guibg=Blue
#   hi! User6 guifg=Black guibg=Magenta
#   hi! User7 guifg=Black guibg=Cyan
#   hi! User8 guifg=White ctermfg=231
# enddef

# Windows native vim.exe, 'win32' covers both 32 and 64bit. Set location
# where `winget` installs python3 and use pwsh.exe over default cmd.exe, etc.
if has('win32')
  set shell=pwsh
  var local_programs = expand('$LOCALAPPDATA/Programs')
  # https://github.com/ShayHill/article_install_vim_in_windows?tab=readme-ov-file#the-python-launcher
  execute 'set pythonthreehome=' .. local_programs .. "/Python/Python313"
  execute 'set pythonthreedll=' .. local_programs .. "/Python/Python313/python313.dll"
endif

set background=light
colorscheme wildcharm

# match 'One Half Light' background
hi! Normal guibg=NONE guifg=NONE ctermfg=NONE ctermbg=NONE
hi! link Pmenu Normal
hi! link PmenuExtra Normal
hi! PmenuBorder guibg=NONE
hi! PmenuMatch guibg=NONE
hi! PmenuKind guibg=NONE
hi! CursorLine cterm=NONE gui=NONE
hi! CursorLineNr cterm=NONE gui=NONE

# experiments:

# `:h win32-term`
if exists('$WT_SESSION')
  # Windows doesn't/can't use terminfo/termcap, and the builtin 'win32' termcap
  # vim defaults to is for the old win32 console (cmd.exe). nvim has newer
  # 'vtpcon' builtin that supports way more on Windows Terminal.
  
endif

# vi: et sw=2 sts=-1 tw=100 fdm=marker
