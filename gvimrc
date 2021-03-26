" macvim 8.2.2576+: brew install macvim

" ----------------------------------------------------------------------------
" Bare-basics.
" ----------------------------------------------------------------------------
filetype plugin on " enable loading plugin/foo.vim files for all filetypes
filetype indent on " enable loading indent/foo.vim files for all filetypes
syntax on
set encoding=utf-8
scriptencoding utf-8
let mapleader=' '

" ----------------------------------------------------------------------------
"  Options
" ----------------------------------------------------------------------------
set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set clipboard=unnamed,unnamedplus
set completeopt=menuone,popup
set foldlevelstart=99
set guifont=JetBrainsMonoNL-Regular:h18
set hidden
set history=200
set hlsearch
set incsearch
set laststatus=2
set listchars=eol:$,space:·,
set modeline
set mouse=a
set noswapfile
set nrformats-=octal
set number
set path-=/usr/include
set relativenumber
set ruler
set scrolloff=2
set showcmd
set showmatch
set showmode
set smartcase
set tags=./tags;,tags;
set ttimeout
set ttimeoutlen=100
set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*/.node_modules/*,*.o,*.obj
set wildcharm=<C-z>
set wildmenu
set wildmode=list:longest,longest:full
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_sizestyle='h'
let g:netrw_winsize=15
let g:netrw_list_hide=netrw_gitignore#Hide() . '.*\.swp$'
" Turn off blinking cursor in 'a'll modes
set guicursor=a:blinkon0
" Scroll bars on left/right/bottom off
set guioptions-=r
set guioptions-=L
set guioptions-=b
" Macvim you can drop and drop bunch of files onto app icon
" and it opens each of them in new tabs, so bump this up from 10
set tabpagemax=100

" ----------------------------------------------------------------------------
"  Finding, Grepping, Jumping
" ----------------------------------------------------------------------------
set path+=**10
if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
nnoremap <Leader>/ :grep<Space>
cnoremap grep Grep
command! -nargs=+ -bar Grep :silent! grep! <args>|redraw!

" ----------------------------------------------------------------------------
"  Remaps
" ----------------------------------------------------------------------------
" Don't use Ex mode, use Q for formatting instead.
map Q gq 
" Re-select visually selected area after indenting/dedenting.
xmap < <gv
xmap > >gv
" Move visual selection up/down lines.
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
" '%%' in command-line mode maybe expands to path of current buffer.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <F4> :call utils#ToggleLocationList()<CR>
nnoremap <F5> :silent! make % <bar> copen <bar> silent redraw!<CR>
nnoremap <F6> :15Lexplore<CR>
nnoremap <F9> :set list!<CR>
nnoremap <F10> :set spell!<CR>
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>, :edit $MYGVIMRC<CR>
nnoremap <Leader>t :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
tnoremap <C-v><Esc> <Esc>
" Allows binding of all Option-key combinations
set macmeta
nnoremap <D-j> <C-w>p<C-e><C-w>p
nnoremap <D-k> <C-w>p<C-y><C-w>p
nnoremap <D-J> <C-w>p<C-d><C-w>p
nnoremap <D-K> <C-w>p<C-u><C-w>p
nnoremap <F1>f :help list-functions<CR>
nnoremap <F1>k :help keycodes<CR>
nnoremap <Leader><Leader> :b #<CR>
nnoremap <Leader>b :<C-u>b <C-d>
nnoremap <Leader>e :<C-u>e <C-d>

" ----------------------------------------------------------------------------
"  Autocommands
" ----------------------------------------------------------------------------
augroup gvimrc
  autocmd!
augroup END
autocmd gvimrc BufNewFile,BufRead *.txt,*.md,*.adoc setlocal complete+=k
autocmd gvimrc BufNewFile,BufRead *.txt,*.md,*.adoc setlocal tw=78
autocmd gvimrc BufWinEnter */doc/*.txt setlocal nonumber norelativenumber
autocmd gvimrc BufWritePost ~/.vim/gvimrc source ~/.vim/gvimrc
autocmd gvimrc BufWritePre /tmp/* setlocal noundofile
autocmd gvimrc FileType * if &ft ==# 'qf' | setlocal nonu nornu | endif
autocmd gvimrc QuickFixCmdPost [^l]* cwindow
autocmd gvimrc QuickFixCmdPost  l* lwindow
autocmd gvimrc VimEnter * cwindow
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd gvimrc BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
autocmd gvimrc BufNewFile,BufRead *.patch set filetype=diff
" Remember the positions in files with some git-specific exceptions.
autocmd gvimrc BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$")
  \           && &filetype !~# 'commit\|gitrebase'
  \           && expand("%") !~ "ADD_EDIT.patch"
  \           && expand("%") !~ "addp-hunk-edit.diff" |
  \   exe "normal g`\"" |
  \ endif
if (v:version >=# 802)
  runtime! cfilter
endif

" ----------------------------------------------------------------------------
"  Commands
" ----------------------------------------------------------------------------
command! Api :help list-functions<CR>
command! Cd :cd %:h
command! TodoLocal :botright lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Only :.+,$bwipeout<CR>
command! Todo :botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ *<CR>
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig"
if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif

colorscheme macvim
