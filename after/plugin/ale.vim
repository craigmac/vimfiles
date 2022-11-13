" https://github.com/w0rp/ale.vim

if !get(g:, 'loaded_ale') | finish | endif

let g:ale_set_signs = 0
let g:ale_disable_lsp = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_set_highlights = 1
let g:ale_echo_cursor = 0
let g:ale_detail_to_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_floating_preview = 1
let g:ale_hover_cursor = 0
nnoremap <silent> ]d :execute "normal \<Plug>(ale_next)" <Bar> ALEDetail<CR>
nnoremap <silent> [d :execute "normal \<Plug>(ale_previous)" <Bar> ALEDetail<CR>
let g:ale_linters_explicit = 1
let g:ale_linters = { 
	\ 'markdown': ['vale', 'cspell', 'markdownlintcli2'], 
	\ 'sh': ['shellcheck'], 'yaml': ['yamllint'],
\}
