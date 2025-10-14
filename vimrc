vim9script
# vi: et tw=100 sw=2 sts=-1 fdm=marker

# globals
g:mapleader = ' '
g:markdown_fenced_languages = ['json', 'bash']
g:netrw_banner = 0
g:is_posix = 1 # more-better colours for sh ft

# options
set findfunc=Find
&guifont = has('win64') ? 'Adwaita_Mono:h14:cANSI:qDRAFT' : 'Adwaita Mono 14'
set fillchars=eob:-,fold:\ ,foldopen:▶,foldclose:▼,diff:\ ,lastline:\  
set list listchars=eol:\ ,tab:>\ ,trail:█,extends:»,precedes:«
set linebreak showbreak=↪\ 
set pumheight=10
set noshowmode
set shiftwidth=2 softtabstop=-1
set shortmess=aoOstTWAIcCqFS
set smoothscroll
set undofile
set ignorecase smartcase
set wildcharm=<C-z>
set wildignore+=*.swp,*~,*.o,*.obj,.DS_Store,*.bak
# ignore matches that have these directories somewhere in the full path
set wildignore+=.git/,.node_modules/,.cache/,tmp/
# works well with wildtrigger()
set wildmode=noselect:lastused,full
set wildoptions=exacttext,fuzzy,pum,tagfile

# configs go in `./plugin`, e.g., `plugin/vim-fugitive.vim`
plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'romainl/vim-qf'
Plug 'tommcdo/vim-lion'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
plug#end()

nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader><Space> <Cmd>buffer #<CR>
nnoremap <Leader>b :<C-u>buffer<Space>
nnoremap <Leader>f :<C-u>find<Space>
nnoremap <Leader><CR> <Cmd>source %<CR>
# zoom current window, use <C-w>= to un-zoom
nnoremap <Leader>z :<C-u>wincmd _ <Bar> wincmd \|<CR>
nnoremap <expr> <Leader>e exists("g:loaded_netrw") == 1 ? "<Cmd>Rexplore<CR>" : "<Cmd>Explore<CR>"
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

# this trick only works in vim
cnoremap w!! w !sudo tee > /dev/null %
cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'
# retain cmdline history Up/Down with wildtrigger() by cancelling it first
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
  au CmdlineChanged [:\/\?] call wildtrigger()
  # reset any cache setup for use with Find()
  au CmdlineEnter : g:filescache = []
augroup END

packadd netrw
packadd nohlsearch
packadd hlyank

# takes quite a while to load sometimes, but basic fuzzy finding
def Find(arg: string, _): list<string>
  if empty(g:filescache)
    # use 1 instead of 0 for third param to ignore 'wildignore and 'suffixes
    g:filescache = globpath('.', '**', 0, 1)
    filter(g:filescache, '!isdirectory(v:val)')
    map(g:filescache, "fnamemodify(v:val, ':.')")
  endif
  return arg == '' ? g:filescache : matchfuzzy(g:filescache, arg)
enddef
defcompile
g:filescache = []

colorscheme sorbet
