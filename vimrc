vim9script
import "./plugin/viking.vim" as viking
import autoload "fuzzy.vim"

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
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %Y\ %{FugitiveStatusline()}
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
nnoremap <Leader>gb <cmd>Git blame<CR>
xnoremap <Leader>gb :Git blame<CR>
# TODO: investigate using :Git difftool -y develop for pr review!

# https://github.com/junegunn/fzf.vim {{{2
g:fzf_buffers_jump = 1
g:fzf_preview_window = ['right:50%:hidden', 'ctrl-l']
# TODO: combine these to use just leader-f and fallback to Files w no git repo
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
g:fzf_colors = {
	'fg': ['fg', 'Normal'],
	'bg': ['bg', 'Normal'],
	'hl': ['fg', 'Comment'],
	'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	'bg+': ['bg', 'CursorLine', 'CursorColumn'],
	'hl+': ['fg', 'Statement'],
	'info': ['fg', 'PreProc'],
	'border': ['fg', 'Ignore'],
	'prompt': ['fg', 'Conditional'],
	'pointer': ['fg', 'Exception'],
	'marker': ['fg', 'Keyword'],
	'spinner': ['fg', 'Label'],
	'header': ['fg', 'Comment'],
	'preview-fg': ['fg', 'Normal'],
	'preview-bg': ['bg', 'Normal']
}

# Colors {{{1
augroup Vimrc
	autocmd!
	autocmd ColorScheme habamax,habarena {
		# use VS style green comments
		highlight! link Comment String
		highlight! link markdownUrl htmlLink
		# underline here is odd because you can't click on it
		highlight! link markdownLinkText String
	}
	autocmd ColorScheme * {
		highlight! link ALEError SpellBad
		highlight! link ALEWarning SpellRare
		highlight! link ALEInfo SpellCap
		highlight! link ALEStyleError SpellBad
		highlight! link ALEStyleWarning SpellRare
	}
	autocmd Colorscheme solarized8,solarized8_high,solarized8_low {
		highlight! TabLine cterm=NONE ctermfg=12 ctermbg=7 gui=NONE guifg=#839496 guibg=#eee8d5
		highlight! TabLineFill cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
		highlight! TabLineSel cterm=reverse gui=reverse guifg=#586e75 guibg=#eee8d5
		highlight! link CurSearch IncSearch
	}
	autocmd Colorscheme solarized8_flat {
		highlight! link CurSearch IncSearch
		set fillchars=vert:\ ,fold:\ ,eob:\ 
	}
augroup END

if has('gui_running') | set termguicolors | endif

g:solarized_italics = 1
g:solarized_visibility = 'low'
g:solarized_extra_hi_groups = 1
if !&termguicolors | g:solarized_use16 = 1 | endif
colorscheme solarized8_flat

# Mappings {{{1
nnoremap <Leader>/ :grep<Space>
nnoremap <Leader>v :noautocmd vimgrep /\v/gj **/*<S-Left><S-Left><Right><Right><Right>
nnoremap <Leader>! :Redir<Space>
nnoremap <Leader>y <cmd>%y +<CR>
nnoremap <Leader><Leader> <Cmd>buffer #<CR>

command! -nargs=? -complete=shellcmd Terminal terminal ++close <q-args>
nnoremap <leader>3 :terminal<space>
nnoremap <leader>4 :Terminal<space>

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

# Experimental unimpaired toggle between tab/spaces in file
# ISSUES: 
# - leaves mixed tabs/spaces if 5 spaces and tabstop is 2 (1 extra space)
# - if there's two spaces in between text (not at beginning of line),
#   it replaces it with a tab character there too. See warning in :h
#   retab-example
nnoremap yo<Tab> <Cmd>%retab!<CR>

# TODO:
# - add binding to SynGroup
# - add '`' to matchit pairs in markdown files

# }}}

# vi: fdm=marker:nowrap:ft=vim:fdl=1:nolist
