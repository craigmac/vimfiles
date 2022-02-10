" vim: fdm=marker nowrap ft=vim et sts=2 ts=2 sw=2 fdl=99

" Bare-basics {{{
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
set encoding=utf-8
scriptencoding utf-8
let mapleader=' '
" }}}

" Plugin Settings {{{

" defaults I never use
let g:loaded_getscriptPlugin = 1
let g:loaded_logiPat = 1
let g:loaded_vimballPlugin = 1
let g:loaded_vimball = 1
let g:loaded_zipPlugin = 1
let g:loaded_gzip = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_2html_plugin = 1

" $VIMRUNTIME/pack/dist/opt/<plugin>
packadd! matchit " extended 'matchpairs', basically
packadd! cfilter

" pack/third-party/opt/<plugin>
packadd! apprentice
packadd! fzf.vim
packadd! vim-commentary
" no ! here to load ftdetect scripts it provides, immediately
packadd vim-markdown
packadd! vim-repeat
packadd! vim-surround
packadd! vim-textobj-user
packadd! vim-textobj-entire
packadd! vim-textobj-indent
packadd! vim-fugitive
packadd! vim-rhubarb
packadd! tagbar
packadd! ale | " https://github.com/wOrp/ale
packadd! YouCompleteMe | " https://github.com/ycm-core/YouCompleteMe

" brew install fzf first
if executable('fzf') && has('mac')
    set runtimepath+=/usr/local/opt/fzf
endif

" YouCompleteMe
let g:ycm_auto_trigger = 0
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_key_detailed_diagnostics = ''
nmap k <plug>(YCMHover)
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_disable_for_files_larger_than_kb = 0
let g:ycm_update_diagnostics_in_insert_mode = 0

" ale
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \ 'markdown': ['vale', 'cspell'],
  \ 'vim': ['vint'],
\}
" let g:ale_fixers = {}

" vim-markdown
let g:vim_markdown_frontmatter = 1

" fzf.vim
nnoremap <C-p> :GFiles<CR>
" FZF from directory buffer is in, use this when not in Git repo
nnoremap <Leader>e. :FZF %:h<CR>
" Jump to buffer in existing window if possible with this option
let g:fzf_buffers_jump = 1
nnoremap <Leader><Tab> :Buffers<CR>

" Change to git project directory
nnoremap <Leader>c :FZFCd ~/git<CR>
nnoremap <Leader>C :FZFCd!<CR>
nnoremap <Leader><C-]> :Tags<CR>
command! -bang -bar -nargs=? -complete=dir FZFCd
  \ call fzf#run(fzf#wrap(
  \ {'source': 'find '.( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) .' -type d',
  \ 'sink': 'cd'}))
" Function used to populate Quickfix with selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Layout of fzf UI
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" Default toggle preview window key of <C-/> is not widely supported on
" terminal emulators. Also it slows things down. Off until toggled on.
let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-o']
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['bg', 'Error'],
  \ 'fg+':     ['fg', 'Pmenu'],
  \ 'bg+':     ['bg', 'Pmenu'],
  \ 'hl+':     ['bg', 'Error'],
  \ 'info':    ['fg', 'Normal'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Statement'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Statement'],
  \ 'gutter':  ['bg', 'Normal'],
  \ 'spinner': ['fg', 'Label'],
  \ 'preview-fg': ['fg', 'Normal'],
  \ 'preview-bg': ['bg', 'Normal'],
  \ 'header':  ['fg', 'Comment'] }

" vim-fugitive - status overview and quick one-off commands
nnoremap <silent><Leader>gg <cmd>G<CR>
nnoremap <Leader>g<Space> :G<space>

" Add <cfile> to index and save, gW useful in 3 way merge diffs: choose
" a buffer and use gW to use all that versions' changes, i.e., --ours/theirs
nnoremap <silent><Leader>gw <cmd>Gwrite<CR>
nnoremap <silent><Leader>gW <cmd>Gwrite!<CR>

" Blames
noremap <silent><Leader>gb <cmd>G blame<CR>

" Location list no jump log of current file and general commit log (gL)
nnoremap <silent><Leader>gl <cmd>0Git log<CR>
nnoremap <silent><Leader>gL <cmd>Git log<CR>

" :Gedit is 'git checkout %' => reverts work tree file to index, be careful!
nnoremap <Leader>ge :Gedit<Space>
nnoremap <silent><Leader>gE :Gedit <bar> only<CR>

" Add all and start commit message with --verbose flag to show patches
nnoremap <silent><Leader>gc <cmd>G commit -av<CR>

" Vertical diffs on current file or any git object SHA.
" :h fugitive-object helpers: @ aka HEAD, :% index version of <cfile>
nnoremap <silent><Leader>gd <cmd>Gvdiffsplit<CR>
nnoremap <Leader>gD :Gvdiffsplit<space>

" Grepping git trees and commits messages. '!' to run it async.
" git grep 'foo bar' [branch/SHA]
" git log --grep='foobar' to search commit messages
" git log -Sfoobar (when 'foobar' was added/removed)
nnoremap <Leader>g/ :Ggrep! -Hnri --quiet<Space>
nnoremap <Leader>g? :Git! log --grep=
nnoremap <Leader>gS :Git! log -S
nnoremap <Leader>g* :Ggrep! -Hnri --quiet <C-r>=expand("<cword>")<CR><CR>

" git push/pull/fetching
" TODO: maybe use Dispatch for this?
nnoremap <silent><Leader>gP <cmd>G push<CR>
nnoremap <silent><Leader>gp <cmd>G pull<CR>
nnoremap <silent><Leader>gf <cmd>G fetch<CR>

" Requires vim-rhubarb, visual selection appends anchors to URL to highlight
" Reminder: ["register]y<C-g> to yank relative path to clipboard
" Reminder: :GBrowse! doesn't open URL just yanks it to clipboard
nnoremap <Leader>g@ <cmd>GBrowse<CR>
xnoremap <Leader>g@ <cmd>GBrowse<CR>

" }}}

" Options {{{
" most ftplugin/*.vim have their own indentexpr, this is backup that
" just copies indent from previous line
set autoindent
set autoread " auto re-read files changes outside of Vim
set belloff=all | " no sounds for all possible bell events
set breakindent " wrapped line continue visually indented
" yank/delete/change/put ops go to clipboard registers * and +
" Normally they would go to unnamed register.
set clipboard=unnamed,unnamedplus
set completeopt=menuone,popup
try " 8.1 something this became an option
  set diffopt+=algorithm:patience | " http://vimways.org/2018/the-power-of-diff/
catch /E474/
  set diffopt=vertical,iwhiteall,filler
endtry
set exrc | " Enable .vimrc/.exrc/.gvimrc auto read from pwd, for projects
set foldlevelstart=99 | " No folds closed by default. Modeline 'fdls' overrules
set grepprg=grep\ -Hnri
set hidden " hide buffers without needing to save them
set history=10000 | " Max possible value, use <C-f> in commandline to browse
set hlsearch " highlight all search matches until :nohl run
set laststatus=2 | " always show statuslines in all windows
if has('patch-8.2.2454') " leading spaces char introduced
  set listchars=tab:\│\ ,lead:·,trail:█,eol:
else
  set listchars=tab:\│\ ,space:·,trail:█,eol:
endif
set mouse=a
set noswapfile " no annoying *.foo~ files left around
set nowrap " defaults to line wrapping on
set number
set path-=/usr/include |  set path+=** | " Look recursively from ':pwd'
set secure " autocmd, shell, and write commands not allow in dir exrc
set shell=$SHELL | " macvim supposed to use this, but doesn't and sets 'sh'
set showmatch " on brackets briefly jump to matching to show it
set statusline=\ %f | " buffer name relative to :pwd
set statusline+=%m%r%h | " [+] when modified, [-] no modify [RO] and [help]
set statusline+=%= | " Start right-hand side of statusline
set statusline+=%{FugitiveStatusline()}
set statusline+=\ [%Y]
set statusline+=\ %P
set statusline +=\ %l:%c\ 
set suffixes+=.png,.jpeg,.jpg,.exe
set shortmess-=cS | "  No '1 of x' pmenu messages. [1/15] search results shown.
" Use for non-gui tabline, for gui use :h 'guitablabel'
set tabline=%!vim9utils#MyTabline()
set ignorecase smartcase " ignore case in searches, UNLESS capitals used
set showtabline=2 | " Always show tabline
set signcolumn=yes
set splitbelow " new horizontal split window always goes below current
set splitright " same but with new vertical split window
set tags=./tags;,tags; | " pwd and search up til root dir for tags file
set thesaurus=~/.vim/thesaurus/english.txt | " Use for :h i_CTRL-X_CTRL-T
set undofile undodir=~/.vim/undodir | " persistent undo on and where to save
set updatetime=250
" Character to act as 'wildchar' in a macro because <Tab> is unrecognized there
" Use in mapping to do auto-expansion like this:
" set wcm=<C-Z> | cnnoremap ss so $VIM/sessions/*.vim<C-Z>
set wildcharm=<C-z>
set wildignore=*.o,*.obj
set wildignore+=*.exe,*.dylib,%*
set wildignore+=*.png,*.jpeg,*.bmp,*.jpg
set wildignore+=*.pyc
if has('patch-8.2.4328') " new vertical menu introduced here
  set wildoptions=pum,tagfile | " :tag <C-d> will show tag kind and file
else
  set wildoptions=tagfile | " :tag <C-d> will show tag kind and file
endif
if has('termguicolors')
  " Terminal.app only supports 256 still (in 2021...)
  if !$TERM_PROGRAM =~# 'Apple_Terminal'
    set termguicolors
  endif
endif

" $VIMRUNTIME/ftplugin/markdown.vim
" This works like dogshit, I'm afraid. Limits of regex vim. Not doc'd either.
" let g:markdown_fenced_languages = ['js=javascript', 'jsx=javascript', 'json', 'cpp', 'shell=sh', 'bash=sh']
let g:markdown_folding = 1

" }}}

" Mappings {{{

if has('gui_macvim') && has('gui_running')
  " macvim installation 'vim' binary requires check if gui_running as well
  set guitablabel=%!vim9utils#Myguitablabel()
  let g:macvim_skip_cmd_opt_movement = 1
endif

" I want C-n/C-p to always be nearest and/or in same buffer,
" if I need to go further I'll use C-Space for YCM
inoremap <C-p> <C-x><C-p>
inoremap <C-n> <C-x><C-n>

" manual expansions, when I want it
inoremap (<CR> (<CR>)<Esc>O
inoremap (; (<CR>);<Esc>O
inoremap (, (<CR>),<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

" e.g. typing ':help g<C-p>' by default does not search history and simply
" goes to previous entry, but ':help g<Up>' will search history for previous
" pattern matching ':help g'. Also Up/Down go in/out of subfolders listings
" when wildmenu showing - default C-n/p here is to traverse results, equivalent
" to <Tab>/<S-Tab>. 
cnoremap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"
cnoremap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"

" If completion menu open use C-j/k instead of arrow keys to navigate
" parent/child folders.
cnoremap <expr> <C-j> wildmenumode() ? "\<Left>\<C-z>" : "\<C-j>"
cnoremap <expr> <C-k> wildmenumode() ? "\<Right>\<C-z>" : "\<C-k>"

" when I use this, I want a buffer GONE completely, no traces left.
nnoremap <Leader>dd <Cmd>bwipeout!<CR> 

nnoremap <Leader>ff :find *
nnoremap <Leader>fs :sfind *
nnoremap <Leader>fv :vert sfind *
" Tab-expand to show wildmenu then untab to unselect but still see menu
nnoremap <Leader>ee :edit *<C-z><S-Tab>
nnoremap <Leader>es :split *<C-z><S-Tab>
nnoremap <Leader>ev :vert split *<C-z><S-Tab>
" buffers not part of :pwd show '/' or '~' at the beginning, so we can remove
" those using filter magic. No wildmenu though, bummer.
nnoremap <Leader>b. :filter! /^\~\\|^\// ls t<CR>:b
nnoremap <Leader>bb :buffer *<C-z><S-Tab>
nnoremap <Leader>bs :sbuffer <C-d>
nnoremap <Leader>bv :vert sbuffer <C-d>

" NOTE: these need nmap to fire the CCR() function to determine how
" to handle the <CR> key at the end.
" tags
nmap <Leader>tj :tjump /<CR>
" preview window, close with C-w z
nmap <Leader>tp :ptjump /<CR>

" jumping: dlist here is remapping to djump in CCR()
nmap <Leader>dl :dlist /<CR>
" instead of just showing where the definition is setup to do the jump
nnoremap [D [D:djump<Space><Space><Space><C-r><C-w><S-Left><Left>
nnoremap ]D ]D:djump<Space><Space><Space><C-r><C-w><S-Left><Left>
nnoremap <Leader>i :ilist /
" Fill it out ready to do the jump
nnoremap [I [I:djump<Space><Space><Space><C-r><C-w><S-Left><Left>
nnoremap ]I ]I:djump<Space><Space><Space><C-r><C-w><S-Left><Left>

" Tmux functionality that I used
nnoremap <silent><C-b>v :vertical terminal ++close zsh<CR>
nnoremap <silent><C-b>s :terminal ++close zsh<CR>
tnoremap <silent><C-b>v <C-\><C-n>:vertical terminal ++close zsh<CR>
tnoremap <silent><C-b>s <C-\><C-n>:terminal ++close zsh<CR>
nnoremap <silent><C-b>! <C-w>T

" resizing windows
nnoremap <silent><S-Up> <Cmd>2wincmd+<CR>
nnoremap <silent><S-Down> <Cmd>2wincmd-<CR>
nnoremap <silent><S-Left> <Cmd>2wincmd <<CR>
nnoremap <silent><S-Right> <Cmd>2wincmd ><CR>

nnoremap <silent><C-b><CR> :terminal make<CR>

" Re-select visually selected area after indenting/dedenting.
xmap < <gv
xmap > >gv

" Move visual selection up/down lines.
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

" '%%' in command-line mode maybe expands to path of current buffer.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

if $TERM_PROGRAM =~# 'Apple_Terminal'
  " inoremap <Nul> <C-x><C-o>
  nnoremap <silent>OA <Cmd>2wincmd+<CR>
  nnoremap <silent>OB <Cmd>2wincmd-<CR>
  nnoremap <silent>[1;5D <Cmd>2wincmd <<CR>
  nnoremap <silent>[1;5C <Cmd>2wincmd ><CR>
else
  inoremap <C-Space> <C-x><C-o>
  nnoremap <silent><C-Up> <Cmd>2wincmd+<CR>
  nnoremap <silent><C-Down> <Cmd>2wincmd-<CR>
  nnoremap <silent><C-Left> <Cmd>2wincmd <<CR>
  nnoremap <silent><C-Right> <Cmd>2wincmd ><CR>
endif

" Function keys
nnoremap <silent><F3> :call vim9utils#ToggleQuickfixList()<CR>
nnoremap <silent><F4> :call vim9utils#ToggleLocationList()<CR>
nnoremap <silent><F7> :15Lexplore<CR>
nnoremap <silent>gO :TagbarOpenAutoClose<CR>
nnoremap <silent><F8> :TagbarOpenAutoClose<CR>
nnoremap <silent><F9> :set list!<CR>
nnoremap <silent><Leader>* :grep <cword><CR>

" Leader keys
nnoremap <Leader>w <cmd>update<CR>
nnoremap <Leader>, <cmd>edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
nnoremap <Leader><Leader> <cmd>buffer #<CR>
nnoremap <Leader><CR> :source %<CR>

" Vimdiff
nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>

nnoremap [q <cmd>cprevious<CR>
nnoremap ]q <cmd>cnext<CR>
nnoremap [Q <cmd>cfirst<CR>
nnoremap ]Q <cmd>clast<CR>
nnoremap [e <cmd>lprevious<CR>
nnoremap ]e <cmd>lnext<CR>
nnoremap ]E <cmd>llast<CR>
nnoremap [E <cmd>lfirst<CR>
nnoremap ]t <cmd>tabnext<CR>
nnoremap [t <cmd>tabprev<CR>
nnoremap [T <cmd>tabfirst<CR>
nnoremap ]T <cmd>tablast<CR>
nnoremap [t <cmd>tabfirst<CR>

" }}}

" Commands {{{

" <f-args> macro expansion explained/notes {{{
" <f-args> is maybe replaced with list of all whitespace/tab separated arguments
" to the command, e.g., :Grep argone -argtwo 'argthree' preserve\ literall
" spaces\ here\ for\ this\ argument
" => ['argone', '-argtwo', 'argthree', 'preserve literal spaces here for this
" argument']. 
"
" Command         <f-args> transform args to:
" :grep           (Nothing, <f-args> is removed)
" :grep ab        ['ab']
" :grep a\b       ['a\b']
" :grep a\ b      ['a b']
" :grep a\  b     ['a ', 'b']
" :grep a\\ b     ['a\', 'b']
" :grep a\\\b     ['a\\b']
" :grep a\\\ b    ['a\ b']
" :grep a\\\\b    ['a\\b']
" }}}
command! -nargs=+ -complete=file_in_path -bar Grep cgetexpr vim9utils#Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr vim9utils#Grep(<f-args>)
" replace standard :grep with ours automatically
cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

command! Api :help list-functions<CR>
command! Cd :lcd %:h
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Todo :botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ *<CR>
command! -nargs=1 Redir call utils#Redir(<q-args>)
command! JekyllOpen call utils#JekyllOpenLive()

" :Gshow<CR> || :Gshow <SHA> || :Gshow HEAD^^
" https://vi.stackexchange.com/questions/13433/how-to-load-list-of-files-in-commit-into-quickfix
" for expr2 in map() here we use string where v:val is index of current item in
" list, from systemlist() call. Since setqflist() requires a dict we use map to
" create one.
command! -nargs=? -bar Gshow call setqflist(map(systemlist("git show --pretty='' --name-only <args>"), '{"filename": v:val, "lnum": 1}')) | copen

" }}}

" Autocmd {{{
" Put all autocmds into this group so this file is
" safe to be re-sourced, by clearing all first with autocmd!
augroup vimrc
  autocmd!
  autocmd FileType * if !&omnifunc | setlocal omnifunc=syntaxcomplete#Complete | endif
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  autocmd BufEnter $MYVIMRC setlocal fdm=marker
  autocmd BufWritePre /tmp/* setlocal noundofile
  autocmd QuickFixCmdPost [^l]* botright cwindow
  autocmd QuickFixCmdPost  l* botright lwindow
  autocmd VimEnter * cwindow
  autocmd FileType gitcommit call feedkeys('i')
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  " I also set this in utils#Redir because it does 'nobuflisted'
  " This one catches other things that open 'nofile' buffers
  autocmd BufEnter * if &buftype ==# 'nofile' | nnoremap <buffer> q :bwipeout!<CR> | endif
  autocmd BufEnter * if &buftype ==# 'nofile' | setlocal nocursorcolumn | endif
  autocmd BufWinEnter * if &previewwindow | setlocal nonumber norelativenumber nolist | endif
  " Stop fugitive from littering buffer list
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" }}}

" Colorscheme and Syntax {{{

" See all active highlight groups with:
" :so $VIMRUNTIME/syntax/hitest.vim
"
" Colorscheme Extras for Plugins {{{
colorscheme apprentice
" set background=light
" colorscheme quiet

"}}}

function! SynGroup() " Outputs both the name of the syntax group, AND the translated syntax
  " group of the character the cursor is on.
  " line('.') and col('.') return the current position
  " synID(...) returns a numeric syntax ID
  " synIDtrans(l:s) translates the numeric syntax id l:s by following highlight links
  " synIDattr(l:s, 'name') returns the name corresponding to the numeric syntax ID
  " example output:
  " vimMapModKey -> Special
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
nnoremap <F2> :call SynGroup()<CR>
"}}}

" Playground {{{

" Terminal cursors:
"https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" Cursor settings:
"  1 -> blinking block  2 -> solid block  3 -> blinking underscore  4 -> solid underscore
"  5 -> blinking vertical bar 6 -> solid vertical bar
" Insert mode
let &t_SI = "\e[6 q"
" Normal mode
let &t_EI = "\e[2 q"

" Grepping
nmap <Leader>/ :grep<Space>
nnoremap <Leader>? :vimgrep //j **/*.md<S-Left><S-Left><Right>

nnoremap <Leader>! :Redir<Space>
nnoremap <Leader>@ :JekyllOpen<CR>

nnoremap g; g;zv
nnoremap g, g,zv
nnoremap <silent> } :keepjumps normal! }<CR>
nnoremap <silent> { :keepjumps normal! {<CR>

" }}}

" Neovim backports {{{
" Don't restore global maps/options, let vimrc handle that
set viewoptions-=options
set sessionoptions-=options
" Neovim really maps Q to execute last recorded macro which could be any
" register, but I mostly just use qq so no need to create elaborate backport
nnoremap Q @q
nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" }}}

" Experimental {{{

" Better :make
command! -bar Make :silent! lgetexpr vim9utils#Make() <Bar> lwindow
" cnoreabbrev <expr> make (getcmdtype() ==# ':' && getcmdline() ==# 'make')  ? 'Make'  : 'make'

" Check out PR # using gh pr checkout command and completion
command! -complete=customlist,Ghlistprs -nargs=1 Ghprcheckout silent! !gh pr checkout <args>
function! Ghlistprs(ArgLead, CmdLine, CursorPos)
  return systemlist('gh pr list | cut -f1')
endfunction

