finish

let lspServers = [
  \ #{
  \   name: 'clangd',
  \   filetype: ['c', 'cpp'],
  \   path: '/usr/bin/clangd',
  \   args: ['--background-index']
  \ },
  \ #{
  \   name: 'vimls',
  \   filetype: ['vim'],
  \   path: '/usr/local/bin/vim-language-server',
  \   args: ['--stdio']
  \ },
\]

autocmd VimEnter * call LspAddServer(lspServers)

let lspOpts = {'autoHighlightDiags': v:true}
autocmd VimEnter * call LspOptionsSet(lspOpts)

function! On_lsp_buffer_enabled()
  setlocal omnifunc=lsp#complete tagfunc=lsp#tagfunc
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gD <plug>(lsp-type-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> g*<plug>(lsp-references)
  nmap <buffer> gI <plug>(lsp-implementation)
  nmap <buffer> gw <plug>(lsp-rename)
  nmap <buffer> [e <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]e <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  imap <buffer> <expr><C-f> lsp#scroll(+4)
  imap <buffer> <expr><C-b> lsp#scroll(-4)
  let g:lsp_fold_enabled = 0
  let g:lsp_format_sync_timeout = 1000
  let g:lsp_diagnostics_enabled = 1
  let g:lsp_document_highlight_enabled = 1
endfunction

augroup lsp_install | autocmd!
  " only called for filetypes with a server registered
  autocmd User lsp_buffer_enabled call On_lsp_buffer_enabled()
augroup END

