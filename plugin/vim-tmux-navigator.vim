vim9script

# skip if not loaded (probably not installed)
if !exists('g:loaded_tmux_navigator') | finish | endif

g:tmux_navigator_no_mappings = 1
g:tmux_navigator_disable_netrw_workaround = 1

# in vim <M-hjkl> verisons are less compatible, also we don't
# have the nvim's more comprehensive smart-splits.nvim, so no resizing keymaps
if has('win32') || has('win64')
  # Windows defaults to using è ê ë ì for <M-hjkl> in both gvim and vim
  # running from console or Windows Terminal
  nnoremap <silent> è :<C-u>TmuxNavigateLeft<CR>
  nnoremap <silent> ê :<C-u>TmuxNavigateDown<CR>
  nnoremap <silent> ë :<C-u>TmuxNavigateUp<CR>
  nnoremap <silent> ì :<C-u>TmuxNavigateRight<CR>
else
  nnoremap <silent> h :<C-u>TmuxNavigateLeft<CR>
  nnoremap <silent> j :<C-u>TmuxNavigateDown<CR>
  nnoremap <silent> k :<C-u>TmuxNavigateUp<CR>
  nnoremap <silent> l :<C-u>TmuxNavigateRight<CR>
endif

