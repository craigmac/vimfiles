" https://github.com/christoomey/vim-tmux-navigator

" only source this file is tmux navigator was loaded
if !get(g:, 'loaded_tmux_navigator') | finish | endif
" on macOS with Alacritty Meta keys with Vim (not Neovim)
" they are received by Vim as escape sequences like j for <M-j>
if has('mac') && !has('nvim')
	" echomsg 'Loaded macOS maps for Alt/Meta'
	nmap h <M-h>
	nmap j <M-j>
	nmap k <M-k>
	nmap l <M-l>
	imap h <M-h>
	imap j <M-j>
	imap k <M-k>
	imap l <M-l>
	tmap h <M-h>
	tmap j <M-j>
	tmap k <M-k>
	tmap l <M-l>
endif

nnoremap <silent> <M-h> <cmd>TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> <cmd>TmuxNavigateDown<CR>
nnoremap <silent> <M-k> <cmd>TmuxNavigateUp<CR>
nnoremap <silent> <M-l> <cmd>TmuxNavigateRight<CR>
inoremap <silent> <M-h> <cmd>TmuxNavigateLeft<CR>
inoremap <silent> <M-j> <cmd>TmuxNavigateDown<CR>
inoremap <silent> <M-k> <cmd>TmuxNavigateUp<CR>
inoremap <silent> <M-l> <cmd>TmuxNavigateRight<CR>
tnoremap <silent> <M-h> <cmd>TmuxNavigateLeft<CR>
tnoremap <silent> <M-j> <cmd>TmuxNavigateDown<CR>
tnoremap <silent> <M-k> <cmd>TmuxNavigateUp<CR>
tnoremap <silent> <M-l> <cmd>TmuxNavigateRight<CR>
