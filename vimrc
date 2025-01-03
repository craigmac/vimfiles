vim9script
# vi: et tw=100 sw=2 sts=-1 fdm=marker

# nvim-ish defaults {{{
# bring us closer to neovim defaults. In nvim see `:h vim-diff`
set nocompatible
filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set belloff=all
set commentstring=
set complete-=i
# adjust this on win32, no handy Nvim stdpath() function available in Vim
if !has('win32')
  if !isdirectory(expand('$HOME') .. '/.vim/cache/swap')
    call mkdir(expand('$HOME') .. '/.vim/cache/swap', 'p')
  endif
endif
&directory = expand('$HOME') .. '/.vim/cache/swap/' .. '/'
set display=lastline
set encoding=utf-8
set fillchars=vert:│,fold:·,eob:-
set formatoptions=tcqj
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif
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
if v:version > 900 | set switchbuf=uselast | endif
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
if v:version > 900 | set wildoptions+=pum | endif
g:vimsyn_embed = 'l'
packadd matchit
# nvim ships a runtime lua plugin ran automatically
if v:version > 900 | packadd editorconfig | endif

nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
nnoremap & :&&<CR>
nnoremap Q @@

# termcap mode 
&t_ti = &t_ti .. "\e[1 q"
# insert mode
&t_SI = &t_SI .. "\e[5 q"
# replace mode
&t_SR = &t_SR .. "\e[3 q"
# end insert/replace mode
&t_EI = &t_EI .. "\e[1 q"
# end of termcap mode
&t_te = &t_te .. "\e[0 q"
# }}}

# globals
g:mapleader = ' '
g:markdown_fenced_languages = ['json', 'bash']
g:netrw_banner = 0
g:netrw_list_hide = netrw_gitignore#Hide()
g:qf_mapping_ack_style = 1
g:tmux_navigator_no_mappings = 1
g:is_posix = 1 # more-better colours for sh ft

# options
set guifont=Berkeley\ Mono\ 16
set fillchars=eob:-,fold:\ ,foldopen:▶,foldclose:▼,diff:\ ,lastline:\  
set listchars=eol:¬,tab:>\ ,trail:█,extends:»,precedes:«
set linebreak showbreak=↪\ 
set shiftwidth=2 softtabstop=-1
set shortmess=aoOstTWAIcCqFS
set smoothscroll
set undofile
set ignorecase smartcase
set wildcharm=<C-z>
set wildignore+=*.swp,*~,*.o,*.obj,.DS_Store,*.bak
set wildoptions+=fuzzy

# configs go in `./plugin`, e.g., `plugin/vim-fugitive.vim`
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0ng/vim-hybrid'
call plug#end()

nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader><CR> <Cmd>source %<CR>
nmap <expr> <Leader>e exists("g:loaded_netrw") == 1 ? "<Cmd>Rexplore<CR>" : "<Cmd>Explore<CR>"
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

cnoremap w!! w !sudo tee > /dev/null %
cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'

nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

# repeat last command on visual lines
xnoremap . :normal .<CR>
tnoremap <Esc><Esc> <C-\><C-n>

augroup Vimrc | autocmd!
  au FileType yaml setlocal foldmethod=indent
  au QuickFixCmdPost * cwindow
  au WinEnter,BufEnter,InsertLeave * setlocal cursorline
  au WinLeave,BufLeave,InsertEnter * setlocal nocursorline
#  au BufReadPost *
#       | var line = line("'\"")
#       | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
#           && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
#       |    exe "normal! g`\""
#       | endif
augroup END

# TODO: statusline

