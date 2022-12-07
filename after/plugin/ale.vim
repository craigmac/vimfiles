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

" This is what I was using before ability to redefine
" g:ale_markdown_markdownlint_executable existed. The linter
" was defined in after/ale_linters/markdown/markdownlintcli2.vim as:
" call ale#linter#Define('markdown', {
" \   'name': 'markdownlintcli2',
" \   'executable': 'markdownlint-cli2',
" \   'lint_file': 1,
" \   'output_stream': 'stderr',
" \   'command': '%e %s',
" \   'callback': 'ale#handlers#markdownlint#Handle'
" \})
"
" \ 'markdown': ['vale', 'cspell', 'markdownlintcli2'], 
let g:ale_markdown_markdownlint_executable = 'markdownlint-cli2'
let g:ale_linters = { 
  \ 'markdown': ['vale', 'cspell', 'markdownlint'], 
  \ 'sh': ['shellcheck'], 'yaml': ['yamllint'],
\}
