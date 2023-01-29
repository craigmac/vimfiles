" vimrc for vim HEAD, use vim -u vimrc-minimal for others

" Options {{{
filetype plugin indent on
syntax on
scriptencoding utf-8
let g:mapleader = ' '
set autoindent smartindent
set autoread autoshelldir
set backspace=indent,eol,start
set belloff=all complete-=i completeopt=menuone,popup
set diffopt+=algorithm:patience,vertical
set exrc secure
set foldopen+=jump
set formatoptions+=j
set grepprg=git\ grep\ --untracked\ -In\ $*
set hidden autowrite
set history=10000
set hlsearch incsearch
set smartcase
set laststatus=2
set linebreak breakindent showbreak="↪"
set listchars=tab:\│\ ,lead:·,trail:▓,eol:¬,precedes:«,extends:»
set modeline modelines=5
set mouse=nvi
set noswapfile
if has('mac') | set path-=/usr/include | endif
set pumheight=10
set ruler
set scrolloff=1 sidescrolloff=2
set sessionoptions-=options
set shortmess-=cS
set showcmd
set splitbelow splitright
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set tags=./tags;,tags;
set wildcharm=<C-z>
set wildmenu wildoptions=fuzzy,pum,tagfile

if $TERM == 'alacritty' | set ttymouse=sgr | endif
" }}}

" Packages {{{
packadd! matchit

packadd vim-markdown
packadd! vim-sensible
packadd! vim-commentary
packadd! vim-unimpaired
packadd! vim-surround
packadd! vim-repeat
packadd! vim-cool
packadd! vim-qf
packadd! ale
" packadd! lsp
" }}}

" Mappings {{{
nmap <Leader>ee :<C-u>edit <C-z><S-Tab>
nmap <Leader>es :<C-u>split <C-z><S-Tab>
nmap <Leader>ev :<C-u>vert split <C-z><S-Tab>
nmap <Leader>e. :<C-u>edit %.<C-z><S-Tab>
nmap <Leader>ff :<C-u>find **/*
nmap <Leader>fs :<C-u>sfind **/*
nmap <Leader>fv :<C-u>vertical sfind **/*
nmap <Leader>aa :<C-u>argadd **/*
nmap <Leader>bb :<C-u>buffer <C-z><S-Tab>
nmap <Leader>bs :<C-u>sbuffer <C-z><S-Tab>
nmap <Leader>bv :<C-u>vertical sbuffer <C-z><S-Tab>

nnoremap <Leader>/ :silent grep! <Bar>redraw!<S-Left>
nmap g> :<C-U>Redir<Space>
nmap <Leader>y "+y
xmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader><Leader> <Cmd>buffer "<CR>
cmap <expr> %. getcmdtype() == ':' ? expand('%:h') .. '/' : '%.'
cmap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"
cmap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"
nmap <Leader>* <Cmd>silent grep! <cword> <Bar>redraw!<CR>
nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/' .. &ft .. '.vim')<CR><CR>
nmap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>
xnoremap < <gv
xnoremap > >gv
nmap zS <Cmd>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>
nmap gh <Cmd>diffget //2<CR>
nmap gl <Cmd>diffget //3<CR>
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'
" allows vim-repeat too: ysiw' then vertical block select and . works
xnoremap . <Cmd>normal .<CR>
tmap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
inoremap {<CR> {<CR>}<C-o>O
inoremap {,<CR> {<CR>},<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap (,<CR> (<CR>),<C-o>O
inoremap [<CR> [<CR>]<C-o>O
inoremap [,<CR> [<CR>],<C-o>O
nmap ' `
" prepend/append visual selections with I and A
xnoremap <expr> I (mode() =~# '[vV]' ? '<C-v>0oI' : 'I')  
xnoremap <expr> A (mode() =~# '[vV]' ? '<C-v>0o$A ' : 'A') 
nmap <C-l> <Cmd>nohlsearch<Bar>diffupdate<CR>

nmap <M-h> <C-\><C-n><C-w>h
nmap <M-j> <C-\><C-n><C-w>j
nmap <M-k> <C-\><C-n><C-w>k
nmap <M-l> <C-\><C-n><C-w>l
tmap <M-h> <C-\><C-n><C-w>h
tmap <M-j> <C-\><C-n><C-w>j
tmap <M-k> <C-\><C-n><C-w>k
tmap <M-l> <C-\><C-n><C-w>l
" }}}

" Colors {{{
set termguicolors
colorscheme dracula
" }}}

" Autocmds {{{
augroup MyInit | au! 
  autocmd! BufEnter * if &bt ==# 'terminal' | norm! a | endif
augroup END
" }}}

" Commands {{{
command! Cd tcd %:h
command! Bonly .+,$bwipeout
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Squeeze %s/\v(\n\n)\n+/\1/e
command! GitPRFiles cexpr! systemlist('git pr-files | grep md$')
" }}}

" Shed {{{

" }}}
" vi:fdm=marker:nowrap:ft=vim:fdl=99:noet:tw=80:nolist
