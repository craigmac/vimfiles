" ----------------------------------------------------------------------------
" Basics
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
set exrc | " search current dir for .vimrc/_vimrc/.exrc. First used, only.
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
set ignorecase smartcase
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

" ----------------------------------------------------------------------------
"  Finding, Grepping, Jumping
" ----------------------------------------------------------------------------
set path+=**10
" if executable('rg')
"   set grepprg=rg\ --vimgrep
" elseif executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor
" endif
nnoremap <Leader>/ :grep<Space>
" cnoremap grep Grep
" command! -nargs=+ -bar Grep :silent! grep! <args>|redraw!

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
nnoremap <silent><F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <silent><F4> :call utils#ToggleLocationList()<CR>
nnoremap <silent><F5> :silent! make % <bar> copen <bar> silent redraw!<CR>
nnoremap <silent><F6> :15Lexplore<CR>
nnoremap <silent><F9> :set list!<CR>
nnoremap <silent><F10> :set spell!<CR>
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>, :edit $MYVIMRC<CR>
nnoremap <Leader>t :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
tnoremap <C-v><Esc> <Esc>
nnoremap <silent><F1>f :help list-functions<CR>
nnoremap <silent><F1>k :help keycodes<CR>
nnoremap <Leader><Leader> :b #<CR>
nnoremap <Leader>b :<C-u>b <C-d>
nnoremap <Leader>e :<C-u>e <C-d>
nnoremap <Leader>n :nohl<CR>
nnoremap <C-p> :FZF<CR>

" I like the re-center on jumps.
nnoremap g; g;zz
nnoremap g, g,zz
" ----------------------------------------------------------------------------
"  Autocommands
" ----------------------------------------------------------------------------
augroup vimrc
  autocmd!
augroup END
autocmd vimrc BufNewFile,BufRead *.txt,*.md,*.adoc setlocal complete+=k
autocmd vimrc BufNewFile,BufRead *.txt,*.md,*.adoc setlocal tw=78
autocmd vimrc BufWinEnter */doc/*.txt setlocal nonumber norelativenumber
autocmd vimrc BufWritePost ~/.vim/gvimrc source ~/.vim/gvimrc
autocmd vimrc BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
autocmd vimrc BufWritePre /tmp/* setlocal noundofile
autocmd vimrc FileType * if &ft ==# 'qf' | setlocal nonu nornu | endif
autocmd vimrc QuickFixCmdPost [^l]* cwindow
autocmd vimrc QuickFixCmdPost  l* lwindow
autocmd vimrc VimEnter * cwindow
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd vimrc BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
autocmd vimrc BufNewFile,BufRead *.patch set filetype=diff
" Remember the positions in files with some git-specific exceptions.
autocmd vimrc BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$")
  \           && &filetype !~# 'commit\|gitrebase'
  \           && expand("%") !~ "ADD_EDIT.patch"
  \           && expand("%") !~ "addp-hunk-edit.diff" |
  \   exe "normal g`\"" |
  \ endif
if (v:version >=# 802)
  packadd! cfilter
endif

" ----------------------------------------------------------------------------
"  Commands
" ----------------------------------------------------------------------------
command! Api :help list-functions<CR>
command! Cd :cd %:h
command! TodoLocal :botright lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Only :.+,$bwipeout<CR>
command! Todo :noautocmd silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ *<CR>
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig"
if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif

" ----------------------------------------------------------------------------
" Work area
" ----------------------------------------------------------------------------
set runtimepath+=/usr/local/opt/fzf

"  TODO: this errors out.
function! RangeChooser() abort
  let temp = tempname()
  if has('gui_running')
    " execute 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
  else
    execute 'silent !ranger --choosefiles=' . shellescape(temp)
  endif
  if !filereadable(temp)
    redraw!
    " Nothing to read.
    return
  endif
  " Edit the first item.
  exec 'edit '. fnameescape(names[0])
  " Add any remaining items to the argument list (']a' with unimpaired.vim)
  for name in names[1:]
    exec 'argadd ' . fnameescape(name)
  endfor
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>R :<C-u>RangerChooser<CR>

colorscheme gruvbox
