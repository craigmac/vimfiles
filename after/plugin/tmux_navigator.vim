" https://github.com/christoomey/vim-tmux-navigator

" only source this file is tmux navigator was loaded
if !get(g:, 'loaded_tmux_navigator') | finish | endif


if has('nvim')
  " Neovim has the <M-..> variants available
  noremap <silent> <M-h> <cmd>TmuxNavigateLeft<CR>
  noremap <silent> <M-j> <cmd>TmuxNavigateDown<CR>
  noremap <silent> <M-k> <cmd>TmuxNavigateUp<CR>
  noremap <silent> <M-l> <cmd>TmuxNavigateRight<CR>
  tnoremap <silent> <M-h> <cmd>TmuxNavigateLeft<CR>
  tnoremap <silent> <M-j> <cmd>TmuxNavigateDown<CR>
  tnoremap <silent> <M-k> <cmd>TmuxNavigateUp<CR>
  tnoremap <silent> <M-l> <cmd>TmuxNavigateRight<CR>
elseif &term =~# '\(xterm-kitty\|wezterm\)' && has('mac')
  " Make <C-[> just another Esc to exit insert mode immediately,
  " rather than wait ~1s for another key, and don't use ^[ in
  " mappings.
  map <nowait><C-[> <Esc>
  noremap <silent> è <cmd>TmuxNavigateLeft<CR>
  noremap <silent> ê <cmd>TmuxNavigateDown<CR>
  noremap <silent> ë <cmd>TmuxNavigateUp<CR>
  noremap <silent> ì <cmd>TmuxNavigateRight<CR>
  tnoremap <silent> è <cmd>TmuxNavigateLeft<CR>
  tnoremap <silent> ê <cmd>TmuxNavigateDown<CR>
  tnoremap <silent> ë <cmd>TmuxNavigateUp<CR>
  tnoremap <silent> ì <cmd>TmuxNavigateRight<CR>
else
  " fallback which may work ok with xterm-like on non-macos
  " and tmux
  noremap <silent> h <cmd>TmuxNavigateLeft<CR>
  noremap <silent> j <cmd>TmuxNavigateDown<CR>
  noremap <silent> k <cmd>TmuxNavigateUp<CR>
  noremap <silent> l <cmd>TmuxNavigateRight<CR>
  tnoremap <silent> h <cmd>TmuxNavigateLeft<CR>
  tnoremap <silent> j <cmd>TmuxNavigateDown<CR>
  tnoremap <silent> k <cmd>TmuxNavigateUp<CR>
  tnoremap <silent> l <cmd>TmuxNavigateRight<CR>
endif
