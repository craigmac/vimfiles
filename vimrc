" vi:fdm=marker:nowrap:ft=vim:fdl=99:noet:tw=80
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
" Options {{{
filetype plugin indent on
syntax on
scriptencoding utf-8
let g:mapleader = ' '
set autoindent smartindent
set autoread autoshelldir
set backspace=indent,eol,start
set belloff=all
set complete-=i completeopt=menuone,popup
set diffopt+=algorithm:patience,vertical
set exrc secure
set foldopen+=jump
set formatoptions+=j
set grepprg=grep\ -HnriE\ $*
set hidden autowrite
set history=10000
set hlsearch incsearch
set smartcase
set laststatus=2
set linebreak breakindent showbreak=+
set listchars=tab:\│\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set modeline modelines=5
set mouse=nvi
set noswapfile
if has('mac') | set path-=/usr/include | endif
set ruler
set scrolloff=1 sidescrolloff=2
set sessionoptions-=options
set shortmess-=cS
set showcmd showmatch
set splitbelow splitright
" TODO find patch num for this one
" if has("patch-9.0.") | set splitkeep=screen | endif
set statusline=%<%f\ %h%m%r%=%P
set tags=./tags;,tags;
" set ttimeout ttimeoutlen=100
let g:omni_syntax_group_include_vim = 'lua\w\+'
let g:vim_indent_cont = shiftwidth()
set undofile undodir=~/.vim/undodir
set viewoptions-=options
set wildmenu wildoptions=fuzzy,pum,tagfile
packadd! matchit

" }}}

" Packages {{{
packadd! ale
packadd! asyncrun.vim
packadd! asynctasks.vim
packadd! fzf
packadd! fzf.vim
packadd! vim-commentary
packadd! vim-cool
packadd! vim-endwise
packadd! vim-eunuch
packadd! vim-fugitive
packadd! vim-qf
packadd  vim-markdown
packadd! vim-repeat
packadd! vim-rhubarb
packadd! vim-scriptease
packadd! vim-sensible
packadd! vim-sleuth
packadd! vim-surround
packadd! vim-unimpaired
packadd! vim-tmux-navigator
" }}}

" Mappings {{{
nnoremap <Leader>/ :grep! // **/*.<S-Left><Left><Left>
nnoremap <Leader>! :Redir<Space>
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader><Leader> <Cmd>buffer "<CR>
cnoremap <expr> %. getcmdtype() == ':' ? expand('%:h') .. '/' : '%.'
cnoremap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"
cnoremap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"
nnoremap <Leader>* :grep! <cword> **/*
nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/' .. &ft .. '.vim')<CR><CR>
nnoremap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>
xnoremap < <gv
xnoremap > >gv
nnoremap gh <Cmd>diffget //2<CR>
nnoremap gl <Cmd>diffget //3<CR>
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'
" allows vim-repeat too: ysiw' then vertical block select and . works
xnoremap . :normal .<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
inoremap <C-Space> <C-x><C-o>
nnoremap <expr> z= ':<C-u>setlocal spell<CR>'..v:count..'z='
inoremap {<CR> {<CR>}<C-o>O
inoremap {,<CR> {<CR>},<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap (,<CR> (<CR>),<C-o>O
inoremap [<CR> [<CR>]<C-o>O
inoremap [,<CR> [<CR>],<C-o>O
nnoremap ' `
" make I/A work on visual selections too
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>0oI':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A ':'A')
" }}}

" Colors {{{
colorscheme mine
" BUGFIX: keep after 'colorscheme' in case of wrong detection
set background=dark
" }}}

" Autocmds {{{
augroup MyInit
  autocmd!
  au FileType * if &ofu == "" | setl ofu=syntaxcomplete#Complete | endif
augroup END

" }}}

" Commands {{{
command! Cd tcd %:h
command! Bonly .+,$bwipeout
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Squeeze %s/\v(\n\n)\n+/\1/e
command! GitPRFiles cexpr! systemlist('git pr-files | grep md$')
" }}}

