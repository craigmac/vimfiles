" settings needed *before* a plugin has been loaded

" https://github.com/tpope/vim-markdown
let g:markdown_recommended_style = 0
let g:markdown_minlines = 5000
let g:markdown_fenced_languages = ['cpp', 'jsx=javascriptreact', 'js=javascript', 'cmake', 'bash=sh', 'json', 'ts=typescript']

" https://github.com/romainl/vim-cool
let g:cool_total_matches = 1

" https://github.com/christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

" https://github.com/romainl/vim-qf
let g:qf_mapping_ack_style = 1

" https://github.com/w0rp/ale.vim
let g:ale_disable_lsp = 1
let g:ale_sign_warning = 'W>'
let g:ale_sign_error = 'E>'
let g:ale_sign_style_error = 'S>'
let g:ale_sign_info = 'I>'
