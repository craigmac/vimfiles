" Author: C.D. MacEachern <craigm@fastmail.com>
" Description: vim 8.0+ configuration, requires '+packages'.

" Bootstrap
source $VIMRUNTIME/defaults.vim

let mapleader=' '
let maplocalleader='\'

augroup init
  autocmd!
augroup END

" Options
set autoread
set belloff=all
set complete-=i | " Don't search includes.
" TODO: see how this works with :args **/*.jsx etc., will it scan those?
" set complete-=u | " Don't scan unloaded buffers in buffer list.
set completeopt=menuone,noinsert,noselect
set hidden
set foldnestmax=2
set ignorecase smartcase
set laststatus=2
set noswapfile
set nowrap
set number relativenumber
" Add onto this per filetypes in after/ftplugin/*.vim
set path=.,,
set spelllang=en_ca
" default is %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set splitbelow splitright
set thesaurus=~/.vim/thesaurus/english.txt
set undofile
set undodir=~/.vim/undodir
set wildignore+=*.o,*.obj,*.pyc,*.pyd,*.dll
set wildignore+=*.exe,*.bin,*.zip
set wildignore+=*.bmp,*.jpg,*.jpeg,*.svg,*.png

" Plugin variables
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_sizestyle='h'
let g:netrw_winsize=15

" Packages
packadd! photon.vim
packadd! targets.vim
packadd! vim-commentary
packadd! vim-dispatch
packadd! vim-editorconfig
packadd! vim-indent-object
packadd! vim-repeat
packadd! vim-surround
packadd! vim-unimpaired

" Mappings
set wildcharm=<C-z>

" Edit/Buffer/Find (adds ignorecase flag for quick completions)
nnoremap <Leader>e :edit **/*<C-z><S-Tab>
nnoremap <Leader>E :split **/*<C-z><S-Tab>
nnoremap <Leader>ve :vsplit<CR>:edit **/*<C-z><S-Tab>

nnoremap <Leader>b :buffer <C-z><S-Tab>*
nnoremap <Leader>B :buffers!<CR>:b
nnoremap <Leader>vb :vsplit<CR>:buffer <C-z><S-Tab>*

nnoremap <Leader>f :find **/*<C-z><S-Tab>
nnoremap <Leader>F :split<CR>:find **/*<C-z><S-Tab>
nnoremap <Leader>vf :vsplit<CR>:find **/*<C-z><S-Tab>

nnoremap <Leader>o :g//#<Left><Left>
set splitbelow  " horizontal splitting commands open below always.
set splitright  " vertical splitting commands open to right always.

map q: :q
nnoremap <silent><F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <silent><F4> :call utils#ToggleLocationList()<CR>
nnoremap <silent><F5> :silent! make % <bar> copen <bar> silent redraw!<CR>
nnoremap <silent><F6> :15Lexplore<CR>
nnoremap <F9> :set list!<CR>
nnoremap <F10> :set spell!<CR>
nnoremap <silent><Leader>tn :tabnew<CR>
tnoremap <Esc> <C-\><C-n>
" Send actual Escape char to app running in term, e.g., 'top'
tnoremap <C-v><Esc> <Esc>
nnoremap <Leader>w :update<CR>
" Follows global 'hidden' option wrt what to do when hidden.
nnoremap <Leader>h :hide<CR>
" Unload and delete from :ls/:buffers list (unless '!' post-fix used).
" Option values, vars and maps/abbrevs for the buffer are cleared.
nnoremap <Leader>q :bdelete<CR>
nnoremap <silent><Leader>n :nohlsearch<CR>
nnoremap <silent><Leader>, :edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
if has('linux')
  nnoremap <Esc>j <C-w>p<C-e><C-w>p
  nnoremap <Esc>k <C-w>p<C-y><C-w>p
elseif has('mac')
  nnoremap ∆ <C-w>p<C-e><C-w>p
  nnoremap ˚ <C-w>p<C-y><C-w>p
  " Dropping a bunch of files onto MacVim opens each in its own tab,
  " and the default is only 10, so bump it up on MacVim.
  set tabpagemax=100
endif


"  Abbreviations
inoreabbrev (<CR> (<CR>)<Esc>O
inoreabbrev ({<CR> ({<CR>});<Esc>O
inoreabbrev {<CR> {<CR>}<Esc>O
inoreabbrev {; {<CR>};<Esc>O
inoreabbrev {, {<CR>},<Esc>O
inoreabbrev [<CR> [<CR>]<Esc>O
inoreabbrev [; [<CR>];<Esc>O
inoreabbrev [, [<CR>],<Esc>O
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" %% in command-line auto-expands to current file's directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Auto-commands
autocmd init QuickFixCmdPost [^l]* cwindow
autocmd init QuickFixCmdPost  l* lwindow
autocmd init VimEnter * cwindow
autocmd init BufWritePre /tmp/* setlocal noundofile
autocmd init BufNewFile,BufRead *.txt,*.md,*.adoc setlocal complete+=k
" HACK: fixes reviving unlisted buffer (:buffers!), because FileType
" is not run unless we do quick :e to trigger it. Adding 'doc/' to match
" only vim help documents (**/doc/foo.txt).
autocmd init BufWinEnter */doc/*.txt setlocal nonumber norelativenumber
autocmd init BufWritePost ~/.vim/vimrc source ~/.vim/vimrc

" Commands
" TODO: make this a job() to use async
" TODO: moves these to autoload/utils.vim
command! Todo :silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ **<CR>
command! LocalTodo :lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Cd :cd %:h
" Wipe out all buffers for real (not set to hidden) except current one.
command! Only :.+,$bwipeout<CR>

" better prompts for :ls/files/buffers/dlist/ilist etc.
" https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86
function! CCR()
  let cmdline = getcmdline()
  if cmdline =~ '\v\C^(ls|files|buffers)'
    " like :ls but prompts for a buffer command
    return "\<CR>:b"
  elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
    " like :g//# but prompts for a command
    return "\<CR>:"
  elseif cmdline =~ '\v\C^(dli|il)'
    " like :dlist or :ilist but prompts for a count for :djump or :ijump
    return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
  elseif cmdline =~ '\v\C^(cli|lli)'
    " like :clist or :llist but prompts for an error/location number
    return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
  elseif cmdline =~ '\C^old'
    " like :oldfiles but prompts for an old file to edit
    set nomore
    return "\<CR>:sil se more|e #<"
  elseif cmdline =~ '\C^changes'
    " like :changes but prompts for a change to jump to
    set nomore
    return "\<CR>:sil se more|norm! g;\<S-Left>"
  elseif cmdline =~ '\C^ju'
    " like :jumps but prompts for a position to jump to
    set nomore
    return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
  elseif cmdline =~ '\C^marks'
    " like :marks but prompts for a mark to jump to
    return "\<CR>:norm! `"
  elseif cmdline =~ '\C^undol'
    " like :undolist but prompts for a change to undo
    return "\<CR>:u "
  else
    return "\<CR>"
  endif
endfunction
cnoremap <expr> <CR> CCR()

" Playground
" TODO: install vim-ocs52

rviminfo!
silent! helptags ALL
colorscheme photon

