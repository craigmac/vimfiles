vim9script

# Options {{{1
filetype plugin indent on
syntax on
scriptencoding utf-8
g:mapleader = ' '
set autoindent smartindent
set autoread autoshelldir
set backspace=indent,eol,start
set belloff=all
set clipboard^=unnamed,unnamedplus
set complete-=i completeopt=menuone,popup
set diffopt+=algorithm:patience,vertical
set errorformat+=%f # :cgetfile list-of-filenames.txt
set exrc secure
set foldlevelstart=1 foldopen+=jump
set formatoptions+=j
set hidden
set history=10000
set hlsearch incsearch
set ignorecase smartcase
set laststatus=2
set linebreak breakindent showbreak=+
set listchars=tab:\│\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set modeline modelines=5
set mouse=nvi
set noswapfile
set path-=/usr/include | set path+=**20
set ruler
set scrolloff=1 sidescrolloff=2
set sessionoptions-=options
set shortmess-=cS
set showcmd showmatch showtabline=2
set splitbelow splitright
set statusline=%<%f\ %h%m%r%=%P\ %{FugitiveStatusline()}
set tags=./tags;,tags;
set ttimeout ttimeoutlen=100
set title
set undofile undodir=~/.vim/undodir
set viewoptions-=options
set wildmenu wildoptions=fuzzy,pum,tagfile
if executable('rg') | set grepprg=rg\ -i\ --vimgrep grepformat=%f:%l:%c:%m | endif
if executable('fzf') && has('mac') | set rtp+=/usr/local/opt/fzf | endif

# Plugins {{{1
packadd! matchit
# https://github.com/tpope/vim-markdown {{{2
g:markdown_recommended_style = 0
g:markdown_minlines = 5000
g:markdown_fenced_languages = ['cpp', 'jsx=javascriptreact', 'js=javascript', 'cmake', 'bash=sh', 'json']

# https://github.com/romainl/vim-cool {{{2
g:CoolTotalMatches = 1

# https://github.com/w0rp/ale.vim {{{2
g:ale_set_signs = 0
g:ale_disable_lsp = 1
g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
g:ale_set_highlights = 1
g:ale_echo_cursor = 0
g:ale_detail_to_floating_preview = 1
g:ale_hover_to_floating_preview = 1
g:ale_floating_preview = 1
g:ale_hover_cursor = 0
nnoremap <silent> ]e :execute "normal \<Plug>(ale_next)" <Bar> ALEDetail<CR>
nnoremap <silent> [e :execute "normal \<Plug>(ale_previous)" <Bar> ALEDetail<CR>
g:ale_linters_explicit = 1
g:ale_linters = { 'markdown': ['vale', 'cspell', 'markdownlintcli2'], 'sh': ['shellcheck'],
'yaml': ['yamllint'],
}

# https://github.com/romainl/vim-qf {{{2
g:qf_mapping_ack_style = 1
g:qf_auto_quit = 1
nmap <Leader>q <Plug>(qf_qf_toggle)
nmap <silent> <Leader>l <Plug>(qf_loc_toggle)
# https://github.com/tpope/vim-fugitive {{{2
nnoremap <Leader>gg <cmd>G<CR>
nnoremap <Leader>gd <cmd>Gvdiffsplit<CR>
nnoremap <Leader>g/ :Ggrep! -HnriqE<Space>
nnoremap <Leader>g? :Git! log -p -S %<Space>
nnoremap <Leader>g* :Ggrep! -Hnri --quiet <C-r>=expand("<cword>")<CR><CR>
nnoremap <Leader>gP <cmd>G push<CR>
nnoremap <Leader>gp <cmd>G pull<CR>
nnoremap <Leader>gb <cmd>Git blame<CR>
xnoremap <Leader>gb :Git blame<CR>

# https://github.com/junegunn/fzf.vim {{{2
nnoremap <Leader>e <Cmd>GFiles<CR>
nnoremap <Leader>F <Cmd>Files<CR>
nnoremap <Leader>b <Cmd>Buffers<CR>
nnoremap gO <Cmd>BTags<CR>

def Build_quickfix_list(lines: list<string>)
	setqflist(map(copy(lines), '{ "filename": v:val }'))
	copen
	cc
enddef

g:fzf_action = {
	'ctrl-q': function('Build_quickfix_list'),
	'ctrl-t': 'tab split',
	'ctrl-x': 'split',
	'ctrl-v': 'vsplit'
}
# Colors {{{1
augroup Vimrc
	autocmd!
	autocmd ColorScheme habamax,habarena {
		highlight! link Comment String
		highlight! link markdownUrl htmlLink
		# underline here is odd because you can't click on it
		highlight! link markdownLinkText String
		# using orange fg w/underline bc I link ALEWarning to it
		highlight! SpellRare term=standout cterm=underline ctermfg=173 guifg=#d7875f gui=undercurl
		highlight! link ALEError SpellBad
		highlight! link ALEWarning SpellRare
	}
augroup END

if has('gui_running') | set termguicolors | endif
colorscheme habamax

# Mappings {{{1
nnoremap <Leader>/ :grep<Space>
nnoremap <Leader>v :noautocmd vimgrep /\v/gj **/*<S-Left><S-Left><Right><Right><Right>
nnoremap <Leader>! :Redir<Space>
nnoremap <Leader>y <cmd>%y +<CR>
nnoremap <Leader><Leader> <Cmd>buffer #<CR>

cnoremap <expr> %. getcmdtype() == ':' ? expand('%:h') .. '/' : '%.'
cnoremap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"
cnoremap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"

nnoremap <Leader>* <Cmd>grep <cword> *<CR>
nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/' .. &ft .. '.vim')<CR><CR>
nnoremap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>

nnoremap gh <Cmd>diffget //2<CR>
nnoremap gl <Cmd>diffget //3<CR>

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

# Workshop {{{1
# ISSUES: 
# - leaves mixed tabs/spaces if 5 spaces and tabstop is 2 (1 extra space)
# - 2+ spaces in strings is replaced with tab!
nnoremap yo<Tab> <Cmd>%retab!<CR>

autocmd! Vimrc BufEnter * if &buftype == 'terminal' | normal! i | endif

# these require modifyOtherKeys mode being on, :h map-alt-keys as well
nnoremap <silent> h <C-w>h
nnoremap <silent> j <C-w>j
nnoremap <silent> k <C-w>k
nnoremap <silent> l <C-w>l
tnoremap <silent> h <C-w><C-n><C-w>h
tnoremap <silent> j <C-\><C-n><C-w>j
tnoremap <silent> k <C-\><C-n><C-w>k
tnoremap <silent> l <C-\><C-n><C-w>l

# }}}

# TODO: ale_floating_window_border idx 1 too narrow
# TODO: break up viking.vim stuff into autoload/* files
# TODO: add binding to SynGroup
# TODO: add '`' to matchit pairs in markdown files
# TODO: investigate using :Git difftool -y develop for pr review!
# TODO: combine these to use just leader-f and fallback to Files w no git repo
# TODO: use <C-M-hjkl> in all modes to resize borders
# TODO: send selected term bindings from habamax
# TODO: for markdown files in my work directory using {% comment %} for gcc
# TODO: fzf, turn on the C-n,C-p for history, and replace fzf.vim with custom

# vi: fdm=marker:nowrap:ft=vim:fdl=0:nolist
