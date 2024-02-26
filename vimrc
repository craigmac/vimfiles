vim9script

g:mapleader = ' '
g:netrw_banner = 0
if has_key(environ(), 'TMUX') | set termguicolors | endif

set noswapfile			# annoying
set wildoptions=pum 		# vertical cmdline-completion menu

nmap <Leader>w <Cmd>update<CR>
nmap <Leader>E <Cmd>Lexplore<CR>

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

cmap <expr> <C-n> wildmenumode() ? '<C-N>' : '<Down>'
cmap <expr> <C-p> wildmenumode() ? '<C-P>' : '<Up>'

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y

colorscheme zaibatsu
