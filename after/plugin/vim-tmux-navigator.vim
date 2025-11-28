" https://github.com/christoomey/vim-tmux-navigator

if !exists('g:loaded_tmux_navigator')
  " setup some fallbacks if plugin not loaded/doesn't exist and exit here
  nnoremap h <Cmd>wincmd h<CR>
  nnoremap j <Cmd>wincmd j<CR>
  nnoremap k <Cmd>wincmd k<CR>
  nnoremap l <Cmd>wincmd l<CR>
  tnoremap h <C-\><C-n><Cmd>wincmd h<CR>
  tnoremap j <C-\><C-n><Cmd>wincmd j<CR>
  tnoremap k <C-\><C-n><Cmd>wincmd k<CR>
  tnoremap l <C-\><C-n><Cmd>wincmd l<CR>
  finish
endif

" no resize mappings like nvim's more comprehensive smart-splits.nvim
if has('win32')
  " Windows defaults to using è ê ë ì for <M-hjkl> in both gvim and vim
  " running from console or Windows Terminal
  nnoremap <silent> è <Cmd>TmuxNavigateLeft<CR>
  nnoremap <silent> ê <Cmd>TmuxNavigateDown<CR>
  nnoremap <silent> ë <Cmd>TmuxNavigateUp<CR>
  nnoremap <silent> ì <Cmd>TmuxNavigateRight<CR>
else
  nnoremap <silent> h <Cmd>TmuxNavigateLeft<CR>
  nnoremap <silent> j <Cmd>TmuxNavigateDown<CR>
  nnoremap <silent> k <Cmd>TmuxNavigateUp<CR>
  nnoremap <silent> l <Cmd>TmuxNavigateRight<CR>
endif

