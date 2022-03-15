" vim: fdm=marker nowrap ft=vim fdl=2 list
" Options {{{1
set nocompatible
filetype plugin indent on
syntax on
scriptencoding utf-8
let mapleader=' '

set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set breakindent
set clipboard=unnamed,unnamedplus
set complete-=i
set completeopt=menuone,popup
set diffopt+=algorithm:patience
set display=truncate
set encoding=utf-8
set errorformat+=%f | " :cexpr system('cat /tmp/list-o-filenames.txt')
set exrc
set foldlevelstart=99
set formatoptions+=j
set grepprg=grep\ -Hnri
set hidden
set history=10000
set hlsearch
set incsearch
set laststatus=2
set linebreak showbreak=↪
set listchars=tab:┊\ ,lead:·,trail:█,eol:
set mouse=a
set nolangremap
set noswapfile
set nrformats-=octal
set number relativenumber
set path-=/usr/include | set path+=**
set ruler
set scrolloff=1
set secure
set sessionoptions-=options
set showcmd
set showmatch
set sidescrolloff=2
set statusline=%f
set statusline+=%m%r%h
set statusline+=%=
set statusline+=%{FugitiveStatusline()}
set statusline+=\ [%Y]
set statusline+=\ %P
set statusline +=\ %c
set suffixes+=.png,.jpeg,.jpg,.exe
set shortmess-=cS
" set tabline=%!vim9utils#MyTabline()
set ignorecase smartcase
set signcolumn=number
set splitbelow splitright
set tags=./tags;,tags;
set title
set ttimeout ttimeoutlen=100
set undofile undodir=~/.vim/undodir
set updatetime=250
set viewoptions-=options
set wildcharm=<C-z>
set wildignore=*.o,*.obj
set wildignore+=*.exe,*.dylib,%*
set wildignore+=*.png,*.jpeg,*.bmp,*.jpg
set wildignore+=*.pyc
set wildoptions=fuzzy,pum,tagfile
set wildmenu

if has('termguicolors')
	if !$TERM_PROGRAM =~# 'Apple_Terminal'
		set termguicolors
	endif
endif

" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

if executable('fzf') && has('mac')
		set runtimepath+=/usr/local/opt/fzf
endif

" Plugins {{{1
let g:loaded_getscriptPlugin = 1
let g:loaded_logiPat = 1
let g:loaded_vimballPlugin = 1
let g:loaded_vimball = 1
let g:loaded_zipPlugin = 1
let g:loaded_gzip = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_2html_plugin = 1

packadd! matchit
packadd! cfilter

let g:markdown_fenced_languages = ['cpp', 'javascriptreact', 'cmake', 'bash=sh', 'json']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 1000

" minpac {{{2
packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('romainl/apprentice')
call minpac#add('tpope/vim-characterize')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('preservim/tagbar')
call minpac#add('w0rp/ale')
call minpac#add('junegunn/fzf.vim')
call minpac#add('skywind3000/asyncrun.vim')
call minpac#add('skywind3000/asynctasks.vim')
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('prabirshrestha/asyncomplete.vim')
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
call minpac#add('wellle/targets.vim')
call minpac#add('mbbill/undotree')
call minpac#add('romainl/vim-cool')
call minpac#add('romainl/vim-qf')
call minpac#add('tpope/vim-liquid')

call minpac#add('habamax/vim-habaurora')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" https://github.com/preservim/tagbar {{{2
let g:tagbar_type_liquid = {
	\ 'kinds' : [
		\ 'c:chapter',
		\ 's:section',
		\ 'S:subsection',
		\ 't:subsubsection',
		\ 'T:13subsection',
		\ 'u:14subsection',
		\ '?:unknown',
	\ ],
\ }

" https://github.com/romainl/vim-qf {{{2
let g:qf_mapping_ack_style = 1
let g:qf_auto_quit = 1

" https://github.com/romainl/vim-cool {{{2
let g:CoolTotalMatches = 1

" https://github.com/mbbill/undotree {{{2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_HelpLine = 0
nnoremap <Leader>u <cmd>UndotreeToggle<CR>

" https://github.com/prabirshrestha/vim-lsp and asyncomplete.vim {{{2
let g:asyncomplete_auto_popup = 0

" if executable('pyls')
	" pip install python-language-server
	" autocmd User lsp_setup call lsp#register_server({
	" 	\ 'name': 'pyls',
	" 	\ 'cmd': {server_info->['pyls']},
	" 	\ 'allowlist': ['python'],
	" 	\ })
" endif

" TODO move this to utils autoload
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
	let g:lsp_format_sync_timeout = 1000
endfunction

augroup lsp_install
	autocmd!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" https://github.com/skywind3000/asyncrun.vim  & asynctasks.vim {{{2
let g:asyncrun_open = 6
let g:asynctasks_term_pos = "bottom"
let g:asynctasks_term_reuse = 1
let g:asynctasks_term_focus = 0

" https://github.com/w0rp/ale {{{2
let g:ale_set_loclist = 1 | " update loclist, bound to C-n/p for me
let g:ale_set_signs = 0 | " no marks in number/sign columns
let g:ale_disable_lsp = 1 | " turn off ale lsp stuff completely
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_set_highlights = 1 | " in-text highlights, not including signs
let g:ale_virtualtext_cursor = 0 | " virtual text at EOL showing lint msg
let g:ale_echo_cursor = 0 | " echo closeby warn/errs on cursor line
let g:ale_cursor_detail = 0 | " open preview win when cursor on line with errs
let g:ale_detail_to_floating_preview = 1 | " Use float win for :ALEDetail
let g:ale_hover_to_floating_preview = 1
let g:ale_floating_preview = 1 | " Use float for everything
let g:ale_hover_to_preview = 0 | " Use preview win for hover messages
let g:ale_hover_cursor = 0
nnoremap <silent><C-p> :silent! lprevious<CR>:ALEDetail<CR><Esc>
nnoremap <silent>p :silent! lfirst<CR>:ALEDetail<CR><Esc>
nnoremap <silent><C-n> :silent! lnext<CR>:ALEDetail<CR><Esc>
nnoremap <silent>n :silent! llast<CR>:ALEDetail<CR><Esc>

let g:ale_linters_explicit = 1
let g:ale_linters = {
	\ 'markdown': ['vale', 'cspell', 'markdownlintcli2'],
	\ 'vim': ['vint'],
\}
" let g:ale_fixers = {}

" https://github.com/junegunn/fzf.vim {{{2
nnoremap <Leader><Leader> :GFiles<CR>
nnoremap <Leader>e. :FZF %:h<CR>
let g:fzf_buffers_jump = 1
nnoremap <Leader><Tab> :Buffers<CR>
nnoremap <Leader>c :FZFCd ~/git<CR>
nnoremap <Leader>C :FZFCd!<CR>
nnoremap <Leader><C-]> :Tags<CR>
command! -bang -bar -nargs=? -complete=dir FZFCd
	\ call fzf#run(fzf#wrap(
	\ {'source': 'find '..( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) ..
	\ ' -type d -maxdepth 1', 'sink': 'tcd'}))
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction
let g:fzf_action = {
	\ 'ctrl-q': function('s:build_quickfix_list'),
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-o']
let g:fzf_colors =
	\ {
		\ 'fg': ['fg', 'Normal'],
		\ 'bg': ['bg', 'Normal'],
		\ 'hl': ['bg', 'Error'],
		\ 'fg+': ['fg', 'Pmenu'],
		\ 'bg+': ['bg', 'Pmenu'],
		\ 'hl+': ['bg', 'Error'],
		\ 'info': ['fg', 'Normal'],
		\ 'border': ['fg', 'Normal'],
		\ 'prompt': ['fg', 'Statement'],
		\ 'pointer': ['fg', 'Statement'],
		\ 'marker': ['fg', 'Statement'],
		\ 'gutter': ['bg', 'Normal'],
		\ 'spinner': ['fg', 'Label'],
		\ 'preview-fg': ['fg', 'Normal'],
		\ 'preview-bg': ['bg', 'Normal'],
		\ 'header': ['fg', 'Comment']
\ }

" https://github.com/tpope/vim-fugitive {{{2
nnoremap <silent><Leader>gg <cmd>G<CR>
nnoremap <Leader>g<Space> :G<space>

" Add <cfile> to index and save, gW useful in 3 way merge diffs: choose
" a buffer and use gW to use all that versions' changes, i.e., --ours/theirs
nnoremap <silent><Leader>gw <cmd>Gwrite<CR>
nnoremap <silent><Leader>gW <cmd>Gwrite!<CR>
noremap <silent><Leader>gb <cmd>G blame<CR>
nnoremap <silent><Leader>gl <cmd>0Git log<CR>
nnoremap <silent><Leader>gL <cmd>Git log<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <silent><Leader>ge :Gedit <bar> only<CR>
nnoremap <silent><Leader>gd <cmd>Gvdiffsplit<CR>
nnoremap <Leader>gD :Gvdiffsplit<space>
nnoremap <Leader>g/ :Ggrep! -HnriqE <Space>
nnoremap <Leader>g? :Git! log -p -S %
nnoremap <Leader>g* :Ggrep! -Hnri --quiet <C-r>=expand("<cword>")<CR><CR>
nnoremap <silent><Leader>gP <cmd>G push<CR>
nnoremap <silent><Leader>gp <cmd>G pull<CR>
nnoremap <silent><Leader>gf <cmd>G fetch<CR>
nnoremap <Leader>g@ <cmd>GBrowse<CR>

" Mappings {{{1
nmap <Leader>/ :grep<Space>
nnoremap <Leader>? :noautocmd vimgrep /\v/gj **/*.md<S-Left><S-Left><Right>
nnoremap <Leader>! :Redir<Space>
nnoremap <Leader>@ :JekyllOpen<CR>
nnoremap <Leader>z za
nnoremap g; g;zv
nnoremap g, g,zv
nnoremap <silent> } :keepjumps normal! }<CR>
nnoremap <silent> { :keepjumps normal! {<CR>
inoremap (<CR> (<CR>)<Esc>O
inoremap (; (<CR>);<Esc>O
inoremap (, (<CR>),<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

cnoremap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"
cnoremap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"
cnoremap <expr> <C-j> wildmenumode() ? "\<Left>\<C-z>" : "\<C-j>"
cnoremap <expr> <C-k> wildmenumode() ? "\<Right>\<C-z>" : "\<C-k>"

nnoremap <Leader>dd <Cmd>bwipeout!<CR>

nnoremap <Leader>ff :find<space>
nnoremap <Leader>fs :sfind<space>
nnoremap <Leader>fv :vert sfind<space> 
nnoremap <Leader>ee :edit <C-z><S-Tab>
nnoremap <Leader>es :split <C-z><S-Tab>
nnoremap <Leader>ev :vert split <C-z><S-Tab>
" buffers not part of :pwd show '/' or '~' at the beginning, so we can remove
nnoremap <Leader>b. :filter! /^\~\\|^\// ls t<CR>:b
nnoremap <Leader>b<Tab> :buffer <C-z><S-Tab>
nnoremap <Leader>bs :sbuffer <C-d>
nnoremap <Leader>bv :vert sbuffer <C-d>

cnoremap <expr> <CR> vim9utils#CCR()

nnoremap <silent><C-b>v :vertical terminal ++close zsh<CR>
noremap <silent><C-b>s :terminal ++close zsh<CR>
tnoremap <silent><C-b>v <C-\><C-n>:vertical terminal ++close zsh<CR>
tnoremap <silent><C-b>s <C-\><C-n>:terminal ++close zsh<CR>
nnoremap <silent><C-b>! <C-w>T

xmap < <gv
xmap > >gv

xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

if $TERM_PROGRAM =~# 'Apple_Terminal'
	imap <Nul> <Plug>(asyncomplete_force_refresh)
	nnoremap <silent>[1;2A <Cmd>2wincmd+<CR>
	nnoremap <silent>[1;2B <Cmd>2wincmd-<CR>
	nnoremap <silent>[1;2D <Cmd>2wincmd <<CR>
	nnoremap <silent>[1;2C <Cmd>2wincmd ><CR>
else
	imap <C-@> <Plug>(asyncomplete_force_refresh)
	nnoremap <silent><S-Up> <Cmd>2wincmd+<CR>
	nnoremap <silent><S-Down> <Cmd>2wincmd-<CR>
	nnoremap <silent><S-Left> <Cmd>2wincmd <<CR>
	nnoremap <silent><S-Right> <Cmd>2wincmd ><CR>
endif

nnoremap <silent><F2> :call vim9utils#SynGroup()<CR>
nmap <silent><F3> <Plug>(qf_qf_toggle)
nmap <silent><F4> <Plug>(qf_loc_toggle)
nnoremap <F5> :AsyncTask <C-z>
nnoremap <silent><F7> :15Lexplore<CR>
nnoremap <silent>gO :TagbarOpenAutoClose<CR>
nnoremap <silent><F8> :TagbarOpenAutoClose<CR>
nnoremap <silent><F9> :set list!<CR>
nnoremap <silent><Leader>* :grep <cword> *<CR>

nnoremap <Leader>w <cmd>update<CR>
nnoremap <Leader>, <cmd>edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
nnoremap <Leader>bb <cmd>buffer #<CR>
nnoremap <Leader><CR> :source %<CR>

nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>

nnoremap [q <cmd>cprevious<CR>
nnoremap ]q <cmd>cnext<CR>
nnoremap [Q <cmd>cfirst<CR>
nnoremap ]Q <cmd>clast<CR>
nnoremap ]t <cmd>tabnext<CR>
nnoremap [t <cmd>tabprev<CR>
nnoremap [T <cmd>tabfirst<CR>
nnoremap ]T <cmd>tablast<CR>
nnoremap [t <cmd>tabfirst<CR>

" Neovim backports
nnoremap Q @q
nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Commands {{{1
command! Api :help list-functions<CR>
command! Cd :lcd %:h
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Todo :botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ *<CR>
command! -nargs=1 Redir call utils#Redir(<q-args>)
command! JekyllOpen call utils#JekyllOpenLive()

" https://vi.stackexchange.com/questions/13433/how-to-load-list-of-files-in-commit-into-quickfix
command! -nargs=? -bar GitShow call setqflist(map(systemlist("git show --pretty='' --name-only <args>"), '{"filename": v:val, "lnum": 1}')) | copen
command! -complete=customlist,Gitbranches -nargs=1 -bar GitPRFiles call setqflist(map(systemlist("git diff --name-only $(git merge-base HEAD <args>)"), '{"filename": v:val, "lnum": 1}')) | copen

function! Gitbranches(ArgLead, CmdLine, CursorPos) abort
	return systemlist('git branch')
endfunction

" Autocmd {{{1
augroup vimrc
	autocmd!
	autocmd FileType * if !&omnifunc | setlocal omnifunc=syntaxcomplete#Complete | endif
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	autocmd BufWritePre /tmp/* setlocal noundofile
	autocmd QuickFixCmdPost [^l]* botright cwindow
	autocmd QuickFixCmdPost  l* botright lwindow
	autocmd VimEnter * cwindow
	autocmd FileType gitcommit call feedkeys('i')
	autocmd BufEnter * if &buftype ==# 'nofile' | nnoremap <buffer> q :bwipeout!<CR> | endif
	autocmd BufEnter * if &buftype ==# 'nofile' | setlocal nocursorcolumn | endif
	autocmd BufWinEnter * if &previewwindow | setlocal nonumber norelativenumber nolist | endif
	autocmd BufReadPost fugitive://* set bufhidden=delete
	autocmd DirChanged * let &titlestring = fnamemodify(getcwd(), ":~")
	autocmd BufReadPost *
		\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
		\ | exe "normal! g`\""
		\ | endif
augroup END

" Colorscheme and Syntax {{{1
function! CustomHighlightsLight() abort
	" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
	" 'cursorline' coloring overrules syntax highlighting of background
	" below and gets in the way with e.g., DiffAdd
	highlight! Comment cterm=italic
	" highlight Normal ctermbg=255
	" fugitive
	highlight! link diffAdded DiffAdd
	highlight! link diffRemoved DiffDelete
	highlight! link diffChanged DiffChange
	highlight! LineNr ctermfg=161
endfunction

" TODO: stuff!

augroup MyColors
	autocmd!
	autocmd ColorScheme habaurora call CustomHighlightsLight()
augroup END

colorscheme habaurora

