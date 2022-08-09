vim9script
import "./plugin/viking.vim" as viking
# Options {{{1
filetype plugin indent on
syntax on
scriptencoding utf-8
g:mapleader = ' '

set autoindent smartindent
set autoread autoshelldir
set backspace=indent,eol,start
set belloff=all
# put visual and normal mode actions that would normally go to unnamed " register,
# like yanks, into both the * (gui selection) and + (gui clipboard) registers,
# also allows mouse selections to copy to both on select
set clipboard^=unnamed,unnamedplus,autoselect,autoselectplus
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
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %Y\ %{FugitiveStatusline()}
set tags=./tags;,tags;
set ttimeout ttimeoutlen=100
set title
set undofile undodir=~/.vim/undodir
set viewoptions-=options
set wildmenu wildoptions=fuzzy,pum,tagfile

# tmux/emulator/tui specific {{{1

# turns off :h modifyOtherKeys everywhere, in case it's on, it conflicts with way
# tmux sends M-<key> bindings, and we don't NEED ability to distinguish C-[
# and C-{, etc., when iTerm is detected it's turned on.

if !viking.UsingGUIVim()
	# code to put (T)erminal (I)nto 'raw' mode
	&t_TI = ""
	# code to put (T)erminal raw mode to an (E)nd
	&t_TE = ""
	
	# (S)tart (I)nsert mode with bar shape (6)
	&t_SI = "\<Esc>[6 q"
	# (E)xit (I)nsert mode to box shape (2)
	&t_EI = "\<Esc>[2 q"
endif

# :help 'tmux-integration'
#  TODO: put all this in autload/tmux.vim
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
	set ttymouse=sgr
	&t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	&t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

	# Enable bracketed paste mode, see  :help xterm-bracketed-paste
	&t_BE = "\<Esc>[?2004h"
	&t_BD = "\<Esc>[?2004l"
	&t_PS = "\<Esc>[200~"
	&t_PE = "\<Esc>[201~"

	# Enable focus event tracking, see  :help xterm-focus-event
	&t_fe = "\<Esc>[?1004h"
	&t_fd = "\<Esc>[?1004l"
	execute "set <FocusGained>=\<Esc>[I"
	execute "set <FocusLost>=\<Esc>[O"

	# Enable modified arrow keys, see  :help arrow_modifiers
	execute "silent! set <xUp>=\<Esc>[@;*A"
	execute "silent! set <xDown>=\<Esc>[@;*B"
	execute "silent! set <xRight>=\<Esc>[@;*C"
	execute "silent! set <xLeft>=\<Esc>[@;*D"
endif

# Plugins {{{1
# packadd {{{2
packadd! matchit
packadd! vim-fugitive
packadd! vim-rhubarb

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

# https://github.com/christoomey/vim-tmux-navigator {{{2
g:tmux_navigator_no_mappings = 1
if !viking.UsingGUIVim()
	# these require modifyOtherKeys mode being on, :h map-alt-keys as well
	nnoremap <silent> h <C-\><C-n><cmd>TmuxNavigateLeft<CR>
	nnoremap <silent> j <C-\><C-n><cmd>TmuxNavigateDown<CR>
	nnoremap <silent> k <C-\><C-n><cmd>TmuxNavigateUp<CR>
	nnoremap <silent> l <C-\><C-n><cmd>TmuxNavigateRight<CR>
endif


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

# Colors {{{1
augroup Vimrc
	autocmd!
	autocmd ColorScheme habamax,habarena {
		# use VS style green comments
		highlight! link Comment String
	}
	autocmd ColorScheme * {
		# custom ALE highlighting for all colorschemes
		highlight! link ALEError SpellBad
		highlight! link ALEWarning SpellRare
		highlight! link ALEInfo SpellCap
		highlight! link ALEStyleError SpellBad
		highlight! link ALEStyleWarning SpellRare
	}
augroup END

if has('gui_running')
	set termguicolors
endif

# colorscheme habamax
colorscheme habarena


# Mappings {{{1
nmap <Leader>/ :grep<Space>
nnoremap <Leader>v :noautocmd vimgrep /\v/gj **/*<S-Left><S-Left><Right><Right><Right>
nnoremap <Leader>! :Redir<Space>
nnoremap <Leader>y <cmd>%y +<CR>
nnoremap <Leader><Leader> <Cmd>buffer #<CR>

command! -nargs=? -complete=shellcmd Terminal terminal ++close <q-args>
nnoremap <leader>3 :terminal<space>
nnoremap <leader>4 :Terminal<space>

nnoremap [q <Cmd>cprevious<CR>
nnoremap ]q <Cmd>cnext<CR>
nnoremap [Q <Cmd>cfirst<CR>
nnoremap ]Q <Cmd>clast<CR>
nnoremap [l <Cmd>lprevious<CR>
nnoremap ]l <Cmd>lnext<CR>
nnoremap ]L <Cmd>llast<CR>
nnoremap [L <Cmd>lfirst<CR>

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
nnoremap yol <Cmd>setlocal list!<CR>
nnoremap yon <Cmd>setlocal number!<CR>
nnoremap yor <Cmd>setlocal relativenumber!<CR>
nnoremap yos <Cmd>setlocal spell!<CR>
nnoremap yow <Cmd>setlocal wrap!<CR>

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'
# Workshop {{{1
if viking.UsingGUIVim()
	# scroll other window
	nnoremap <M-J> <C-w>p<C-d><C-w>p
	nnoremap <M-K> <C-w>p<C-u><C-w>p
	# we will use xnoremap <M-jkl> binding to do something else?
	nnoremap <silent> <M-h> <C-\><C-n><cmd>TmuxNavigateLeft<CR>
	nnoremap <silent> <M-j> <C-\><C-n><cmd>TmuxNavigateDown<CR>
	nnoremap <silent> <M-k> <C-\><C-n><cmd>TmuxNavigateUp<CR>
	nnoremap <silent> <M-l> <C-\><C-n><cmd>TmuxNavigateRight<CR>
	# TODO: on termwinenter? binding to auto enter insert mode - least suprise
	tnoremap <silent> <M-h> <C-\><C-n><cmd>TmuxNavigateLeft<CR>
	tnoremap <silent> <M-j> <C-\><C-n><cmd>TmuxNavigateDown<CR>
	tnoremap <silent> <M-k> <C-\><C-n><cmd>TmuxNavigateUp<CR>
	tnoremap <silent> <M-l> <C-\><C-n><cmd>TmuxNavigateRight<CR>
endif

# }}}

# vi: fdm=marker:nowrap:ft=vim:fdl=0:list
