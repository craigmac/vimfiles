vim9script

g:mapleader = ' '
g:markdown_fenced_languages = ['json', 'bash']
g:netrw_banner = 0

var ver = split(string(v:version), '\zs') # => ['9', '0', '1']
var patch = strpart(string(v:versionlong), 3)
g:full_version = printf("%s.%s.%s", ver[0], ver[-1], patch)

# UI/Special Chars
&guifont = has('win64') ? 'Adwaita_Mono:h14:cANSI:qDRAFT' : 'Adwaita Mono 14'
set fillchars=eob:\ ,fold:\ ,foldopen:▼,foldclose:▶,foldsep:\ ,foldinner:\ 
set fillchars+=diff:\ ,lastline:⋯,vert:│,trunc:⋯,truncrl:⋯,tpl_vert:│
set list
set listchars=eol:¬,tab:>\ ,trail:█,extends:»,precedes:«

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
set statusline=%<%f\ »\ %l/%L:%c\ »\ %p%%\ »\ %{&ft}
set titlestring=%{g:full_version}\ -\ %{getcwd()}

# configs go in `./plugin`, e.g., `plugin/vim-fugitive.vim`
plug#begin()
Plug 'romainl/vim-qf'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tommcdo/vim-lion'
plug#end()

nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader><Space> <Cmd>buffer #<CR>
nnoremap <Leader>b :<C-u>buffer<Space>
nnoremap <Leader>f :<C-u>find<Space>
nnoremap <Leader><CR> <Cmd>source %<CR>
nnoremap <Leader>z <Cmd>wincmd _ <Bar> wincmd \|<CR>
nnoremap <expr> <Leader>e exists("g:loaded_netrw") == 1 ? "<Cmd>Rexplore<CR>" : "<Cmd>Explore<CR>"
nnoremap <expr> j v:count == 0 ? 'gj' : '<Esc>' .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : '<Esc>' .. v:count .. 'k'

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

packadd editorconfig
packadd netrw
packadd nohlsearch
packadd hlyank
packadd comment

def Find(arg: string, _): list<string>
    g:filescache = globpath('.', '**', true, true)
    filter(g:filescache, '!isdirectory(v:val)')
    map(g:filescache, 'fnamemodify(v:val, ":.")')
    return arg == '' ? g:filescache : matchfuzzy(g:filescache, arg)
enddef
defcompile
g:filescache = []

colorscheme wildcharm
set bg=light

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

# colorscheme play
# vi: et tw=100 sw=2 sts=-1 fdm=marker
