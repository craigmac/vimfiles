vim9script
# Run if ale was loaded
# https://github.com/w0rp/ale.vim

if !g:loaded_ale
  finish
endif

g:ale_set_signs = 0
g:ale_disable_lsp = 1
g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
g:ale_set_highlights = 1
g:ale_echo_cursor = 0
g:ale_detail_to_floating_preview = 1
g:ale_hover_to_floating_preview = 1
g:ale_floating_preview = 1
g:ale_hover_cursor = 0
nnoremap <silent> ]d :execute "normal \<Plug>(ale_next)" <Bar> ALEDetail<CR>
nnoremap <silent> [d :execute "normal \<Plug>(ale_previous)" <Bar> ALEDetail<CR>
g:ale_linters_explicit = 1
g:ale_linters = { 'markdown': ['vale', 'cspell', 'markdownlintcli2'], 'sh': ['shellcheck'],
'yaml': ['yamllint'],
}
