vim9script
# vi: et tw=100 sw=2 sts=-1 fdm=marker

# globals
g:mapleader = ' '
g:markdown_fenced_languages = ['json', 'bash']
g:netrw_banner = 0
g:is_posix = 1 # more-better colours for sh ft

# options
&guifont = has('win64') ? 'Adwaita_Mono:h14:cANSI:qDRAFT' : 'Adwaita Mono 14'
set fillchars=eob:-,fold:\ ,foldopen:▶,foldclose:▼,diff:\ ,lastline:\  
set listchars=eol:¬,tab:>\ ,trail:█,extends:»,precedes:«
set linebreak showbreak=↪\ 
set noshowmode
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
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tommcdo/vim-lion'
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
  au BufReadPost * {
    var line = line("'\"")
    if line >= 1 && line <= line("$") && &filetype !~# 'commit' && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
      execute "normal! g`\""
    endif
  }
augroup END

packadd netrw
packadd nohlsearch
packadd hlyank

colorscheme hybrid
