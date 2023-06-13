" completions/lsp
let g:ale_completion_enabled = 0
" ignore LSP linters, and also tsserver. `:h ale-lsp`
let g:ale_disable_lsp = 0

" chrome
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_set_signs = 1
let g:ale_set_highlights = 0

" features
let g:ale_echo_cursor = 0
" show info about current word on CursorHold event
let g:ale_hover_cursor = 1
" use floating windows instead of echoing to msgarea
let g:ale_floating_preview = 1

