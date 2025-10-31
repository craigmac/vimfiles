vim9script

# neovim-defaults (ish) {{{1
# TODO: grepprg or -H and -I with 'grep'

filetype plugin indent on
syntax on

# if we add lua heredoc to a vim script file, highlight it
g:vimsyn_embed = 'l'

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
set fillchars+=vert:│,fold:·
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
# }}}

g:mapleader = ' '
g:markdown_fenced_languages = ['json', 'bash']
g:netrw_banner = 0

# get full vim version like '9.1.1882' for display, e.g., in &titlestring
var ver = split(string(v:version), '\zs') # => ['9', '0', '1']
var patch = strpart(string(v:versionlong), 3)
g:full_version = printf("%s.%s.%s", ver[0], ver[-1], patch)

# UI/Special Chars
&guifont = has('win64') ? 'Adwaita_Mono:h14:cANSI:qDRAFT' : 'Adwaita Mono 14'
# eob not in modern editors and `set number` makes it irrelevant
set fillchars=eob:\ ,fold:\ ,foldopen:▼,foldclose:▶,foldsep:\ ,foldinner:\ 
# lastline is archaic and not needed, same with truncations
set fillchars+=diff:\ ,lastline:\ ,vert:│,trunc:\ ,truncrl:\ ,tpl_vert:│
# on but hidden until visually selected by changing hl-NonText and hl-SpecialKey
# SpecialKey also used for `:map` but that's ok. Neovim does this better with hl-WhiteSpace
set list
# extends/precedes are not in other modern editors, uses hl-NonText
set listchars=eol:¬,extends:\ ,precedes:\ 
# visualizing spaces, uses hl-SpecialKey
set listchars+=space:·,trail:█,nbsp:_,tab:>\ 
# handled in custom statusline
set noshowmode

# behaviour - add some modern assumptions
set splitbelow
set splitright
set number

# no wrap but if toggled on use these options
set nowrap
set breakindent
set breakindentopt=sbr
set linebreak
set nojoinspaces
set showbreak=↪\ 

# misc
set helpheight=0 # messes with 'equalalways
set smoothscroll
set undofile
set virtualedit=block

# completion/finding
set autocomplete
set complete=o^10,.^10,w^5,b^5
set completeopt=menuone,popup,fuzzy,noselect
set completefuzzycollect=keyword,files,whole_line
set completepopup=highlight:Pmenu,border:single,shadow:on
set pumborder=round
set findfunc=Find
set ignorecase
set pumheight=10
set smartcase
set wildcharm=<C-z>
set wildignore+=*.swp,*~,*.bak,*.o,*.obj,.DS_Store,.netrwh
set wildignore+=.git/,.node_modules/,.cache/,tmp/
set wildmode=noselect:lastused,full
set wildoptions=exacttext,fuzzy,pum,tagfile

# bars and lines
# ol' oneliner that works:
#set statusline=\ %{toupper(mode()\ ==\ ''\ ?\ 'b'\ :\ mode())}\ │\ %<%f\ %=\ %-20.(%l/%L\ %c:%{col('$')-1}%)\ %P\ %{&ft}\ 
var stl = ' '
stl ..= '%{ toupper(mode() == "" ? "b" : mode())}' # make ^V for visual block mode be one char
stl ..= ' │ '
stl ..= '%<%.50f' # relative file path, truncated at > 50 chars long on left side
stl ..= ' %='
# left-align 20 chars min. (pad right extra space): line/lines,column:max_col
stl ..= '%-20.(%l/%L,%c:%{ col("$")-1 }%)'
stl ..= ' %p%%' # e.g., 0% 43%100%
stl ..= ' %{&filetype}'
&statusline = stl
set titlestring=%{g:full_version}\ -\ %{getcwd()}

# configs go in `./plugin` and are loaded after this file then $MYVIMRDIR/plugged/**/plugin/*.vim
# files load so don't count on `g:loaded_<plugin>` variables in the `plugin/*.vim` files
plug#begin()
Plug 'romainl/vim-qf'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tommcdo/vim-lion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'
# or `./install{.ps1}` in $MYVIMDIR/plugged/fzf if below fails
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
# provides :Buffers, :GFiles, :Commands, etc.
Plug 'junegunn/fzf.vim'
plug#end()

nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader><Space> <Cmd>buffer #<CR>
nnoremap <Leader>b :<C-u>buffer<Space>
nnoremap <Leader>f :<C-u>find<Space>
nnoremap <Leader><CR> <Cmd>source %<CR>
nnoremap <Leader>z <Cmd>wincmd _ <Bar> wincmd \|<CR>
nnoremap <expr> <Leader>e exists('g:loaded_netrw') ? exists('w:netrw_rexlocal') ? '<Cmd>Rexplore<CR>' : '<Cmd>Explore<CR>' : '<Cmd>Explore<CR>'
nnoremap <expr> j v:count == 0 ? 'gj' : '<Esc>' .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : '<Esc>' .. v:count .. 'k'
nnoremap <Leader>vp <Cmd>tabedit $MYVIMDIR/plugged<CR>
nnoremap <Leader>vr <Cmd>tabedit $VIMRUNTIME<CR>

# nvim has :Inspect, we have this
nnoremap zS :<C-u>echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

# this trick only works in vim
cnoremap w!! w !sudo tee > /dev/null %
cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'
# retain cmdline history keys Up/Down even if wildmenu open
cnoremap <expr> <Up> wildmenumode() ? '<C-e><Up>' : '<Up>'
cnoremap <expr> <Down> wildmenumode() ? '<C-e><Down>' : '<Down>'

# specifically target the system clipboard
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

# repeat last command on visual lines
xnoremap . :normal .<CR>
tnoremap <Esc><Esc> <C-\><C-n>

augroup my.augroup.vimrc | autocmd!
  au FileType yaml setlocal foldmethod=indent
  au QuickFixCmdPost * cwindow
  au WinEnter,BufEnter,InsertLeave * setlocal cursorline
  au WinLeave,BufLeave,InsertEnter * setlocal nocursorline
  au BufReadPost * {
    var line = line("'\"")
    if line >= 1 && line <= line("$") && &filetype !~# 'commit' && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
      execute "normal! g`\""
    endif
  }
  # autocmd CmdlineChanged [:\/\?] call wildtrigger()
  autocmd CmdlineChanged : wildtrigger()
augroup END

packadd netrw
packadd nohlsearch
packadd hlyank

def Find(arg: string, _): list<string>
    g:filescache = globpath('.', '**', true, true)
    filter(g:filescache, '!isdirectory(v:val)')
    map(g:filescache, 'fnamemodify(v:val, ":.")')
    return arg == '' ? g:filescache : matchfuzzy(g:filescache, arg)
enddef
defcompile
g:filescache = []

set bg=light
colorscheme wildcharm

hi! PmenuBorder guibg=NONE
hi! link Pmenu Normal
hi! PmenuSel guibg=NONE
hi! PmenuMatch guibg=NONE
hi! PmenuSel guibg=#eeeeee
# highlight for match in pmenu AND currently selected line
hi! PmenuMatchSel guibg=#eeeeee
hi! PmenuKind guibg=NONE
hi! PmenuKindSel guibg=#eeeeee
hi! link PmenuExtra Normal
hi! PmenuExtraSel guifg=fg guibg=#eeeeee
# experimental: listchars is on, but hidden until visually selected, like zed/vscode
hi! NonText guifg=bg
hi! SpecialKey guifg=bg

# vi: et tw=100 sw=2 sts=-1 fdm=marker
