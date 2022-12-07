" Settings for https://github.com/yegappan/lsp

" TODO: PR to get a g:loaded_lsp defined to test here like most
" plugins have?
if !get(g:, 'loaded_lsp') | finish | endif

let lspServers = [
  \ #{
  \   filetype: ['c', 'cpp'],
  \   path: '/usr/bin/clangd',
  \   args: ['--background-index']
  \ },
\ ]
  " \ #{
  " \   filetype: ['vim'],
  " \   path: '/usr/local/bin/vim-language-server',
  " \   args: ['--stdio']
  " \ },
  " \ #{
  " \   filetype: ['sh', 'bash'],
  " \   path: '/usr/local/bin/bash-language-server',
  " \   args: ['start']
  " \ },
" \]
call LspAddServer(lspServers)
