" https://github.com/junegunn/fzf.vim

if !g:loaded_fzf_vim
  finish
endif

let g:fzf_layout = { 'down': '30%' }
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" with this on, c-n/p will cycle history, use c-j/k for up/down
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <Leader><Leader> <Cmd>GFiles<CR>
nnoremap <Leader>e <Cmd>Files<CR>
nnoremap <Leader>b <Cmd>Buffers<CR>
nnoremap gO <Cmd>BTags<CR>

function! s:build_quickfix_list(lines) abort
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
\}

