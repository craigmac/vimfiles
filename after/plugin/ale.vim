" https://github.com/w0rp/ale.vim
" some options should be set before ale loads, so they are
" in .vim/plugin/ale.vim
if !get(g:, 'loaded_ale') | finish | endif

nnoremap ]d :execute "normal \<Plug>(ale_next)" <Bar> ALEDetail<CR>
nnoremap [d :execute "normal \<Plug>(ale_previous)" <Bar> ALEDetail<CR>

" use `markdownlint-cli2` - VS Code Markdownlint plugin uses this
let g:ale_markdown_markdownlint_executable = 'markdownlint-cli2'
let g:ale_linters = { 
  \ 'markdown': ['vale', 'cspell', 'markdownlint'], 
  \ 'sh': ['shellcheck'],
  \ 'yaml': ['yamllint'],
\}

" TODO: look into setting up `:h ale#statusline#Count()` integration
