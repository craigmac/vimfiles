vim9script
# neovim-defaults (ish) {{{1
# TODO: grepprg or -H and -I with 'grep'

filetype plugin indent on
syntax on

# if we add a lua heredoc to a vim script file, highlight it
g:vimsyn_embed = 'l'
# highlight neovim specific vim script elements
g:vimsyn_vim_features = ['nvim']

# python optional highlighting preferences
g:python_no_builtin_highlight = 1
g:python_no_doctest_highlight = 1
g:python_no_doctest_code_highlight = 1
g:python_no_exception_highlight = 1
g:python_no_number_highlight = 1
g:python_space_error_highlight = 1

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
set wildoptions=pum,tagfile

packadd matchit
# nvim ships a runtime lua plugin ran automatically
packadd editorconfig
# nvim has commenting builtin to its _defaults.lua
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
# support folding all: functions, heredocs, augroups, vim9 stuff when using `fdm=syntax`
g:vimsyn_folding = 'acefhiHlmpPrt'
# allow function, heredoc, and if/do/for folding with `fdm=syntax` in &ft == 'sh'
g:sh_fold_enabled = 7

# get full vim version like '9.1.1882' for display, e.g., in &titlestring
var ver = split(string(v:version), '\zs') # => ['9', '0', '1']
var patch = strpart(string(v:versionlong), 3)
g:fullversion = printf("%s.%s.%s", ver[0], ver[-1], patch)

# UI/Special Chars
&guifont = has('win64') ? 'Adwaita_Mono:h14:cANSI:qDRAFT' : 'Adwaita Mono 14'
# eob not in modern editors and `set number` makes it irrelevant
set fillchars=eob:\ ,fold:\ ,foldopen:▼,foldclose:▶,foldsep:\ ,foldinner:\ 
# lastline is archaic and not needed, same with truncations
set fillchars+=diff:\ ,lastline:\ ,vert:│,trunc:\ ,truncrl:\ ,tpl_vert:│
# extends/precedes are not in other modern editors, uses hl-NonText
set listchars=eol:¬,extends:\ ,precedes:\ 
# visualizing spaces, uses hl-SpecialKey
set listchars+=space:·,trail:█,nbsp:_,tab:>\ 
# 1 ensures we never move onto the 'extends' `&listchars` when nowrap is on
set sidescrolloff=1
# handled in custom statusline
set noshowmode
# allow '[3/782]' rather than default '[3/>99]'
set maxsearchcount=999
# show full version including patch number in title
var titleparts =<< EOF
%<%(%{getenv('USERNAME')}@%)
%(%{ hostname()}%)
%=
%( %{getcwd()}%)
%=
%( v. %{% exists('g:fullversion') ? g:fullversion : v:versionlong %}%)
%=
EOF
&titlestring = join(titleparts, '')

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
set showbreak=↳\ 

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
# value is one of those `:h option-value-function` options
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
# `:h let-heredoc` used to reduce quotes use
var parts =<< EOF
 %{toupper(mode() == '' ? 'b' : mode())}
 │%<%f 
%{ &modified ? '● ' : '' }
%{ &readonly ? '⊗ ' : '' }
%3*%{ &previewwindow ? '[Preview Window] ' : '' }%*
%=
%-20.(▼ %l/%L ▶ %c:%{col('$')-1} %)
%p%%
%( %{&filetype} %)
EOF
# keep exact spacing above rather than add space between each element in list
&statusline = join(parts, '')

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
nmap zS :<C-u>echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

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
tmap <Esc><Esc> <C-\><C-n>

augroup my.augroup.vimrc | autocmd!
  au WinEnter,BufEnter,InsertLeave * setlocal cursorline
  au WinLeave,BufLeave,InsertEnter * setlocal nocursorline
  au BufReadPost * {
    var line = line("'\"")
    if line >= 1 && line <= line("$") && &filetype !~# 'commit' && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
      execute "normal! g`\""
    endif
  }
  au CmdlineChanged [:\/\?] wildtrigger()
  au FileType vim {
    setlocal foldmethod=syntax
  }
  #au ColorScheme default echomsg 'Default colorscheme set.'
  au ColorScheme default call SetMyColors()
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

# colorscheme retrobox
# make popup windows bg same as Normal and use 'pumborder' instead
# 'listchars' is on, but hidden until visually selected, like zed/vscode
#hi! NonText guifg=bg
# NOTE: SpecialKey will be hidden in :digraphs and :nmap and other places
#hi! SpecialKey guifg=bg

# `:h hl-User1..9`
hi! User1 guifg=Black ctermfg=232
# red
hi! User2 guifg=White guibg=Red
# green
hi! User3 guifg=Black guibg=Green
# yellow
hi! User4 guifg=Black guibg=Yellow
# blue
hi! User5 guifg=White guibg=Blue
# magenta
hi! User6 guifg=Black guibg=Magenta
# cyan
hi! User7 guifg=Black guibg=Cyan
# white
hi! User8 guifg=White ctermfg=231

# 9.2 patches (coming in next official release):
#if has('patch-9.1.1900')
#endif

# colors for default colorscheme with set bg=dark and termguicolors
def g:SetMyColors()
  # increase and decrease brightness of pure black/white by 10%
  # set Normal bg/fg first so we can use 'bg' and 'fg' to refer to them
  hi! Normal guibg=Grey10 guifg=Grey90
  hi! CursorLine guibg=Grey20
  hi! CursorLineNr gui=bold guifg=Grey100
  hi! LineNr guifg=Grey50
  hi! LineNr guifg=Grey50
  hi! VertSplit gui=NONE
  # still in blue family (default is 'Blue') better contrast against bg
  hi! NonText guifg=skyblue
  # default is 'reverse', let's make it &bg independent
  hi! IncSearch gui=reverse guifg=fg guibg=bg
  # links 
  hi! link SpecialKey NonText
  hi! link StatusLineTerm     StatusLine
  hi! link StatusLineTermNC   StatusLineNC
  hi! link TabPanel           Normal
  hi! link TabPanelFill       Normal
  hi! link Terminal           Normal
  hi! link MessageWindow      Pmenu
  hi! link PopupNotification  Normal
  hi! link PopupSelected      PmenuSel
  hi! link PreInsert          NonText
  hi! link CurSearch          IncSearch
  # Pmenu
  hi! Pmenu guifg=NONE guibg=bg
  hi! PmenuSel guibg=Grey20
  hi! link PmenuBorder        Pmenu
  # addding colour here is too much, must be subtle bc it's being
  # used constantly when 'autocomplete' is on
  hi! PmenuMatch gui=bold guifg=Grey100
  hi! PmenuMatchSel gui=bold guifg=Grey100 guibg=NONE
  hi! link PmenuKind     Pmenu
  hi! link PmenuKindSel  PmenuSel
  hi! link PmenuExtra    Pmenu
  hi! link PmenuExtraSel PmenuSel
  hi! PmenuSbar guibg=Grey
  hi! PmenuThumb guibg=White
  hi! PmenuShadow guifg=DarkGrey guibg=Grey0

enddef

# no hl-Normal is set is set for default colorscheme
# assumes light background, so if you start a noconfig gvim and do `:set bg=dark`
# the hl-Normal guibg and guifg don't change, so it gets hard to see
g:SetMyColors()

# vi: et tw=100 sw=2 sts=-1 fdm=marker
