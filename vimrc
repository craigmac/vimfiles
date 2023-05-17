" Options {{{
" ./plugin/neovim-defaults.vim loads too
let g:mapleader = "\<Space>"
set runtimepath+=~/src/personal/neo
set completeopt=menu,menuone,popup,noselect,noinsert
set grepprg=git\ grep\ --untracked\ -In\ $*
set guifont=Iosevka\ Fixed:h24
set listchars=tab:→\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set path-=/usr/include
set showbreak=↪
set signcolumn=yes
set smartindent
set smartcase
set splitbelow splitright
set wildcharm=<C-z>
set wildoptions=fuzzy,pum,tagfile

"}}}

" Packages {{{

" call minpac#add('yegappan/lsp')
" }}}

" Mappings {{{
nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/' .. &ft .. '.vim')<CR><CR>
nmap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>
nmap zS <Cmd>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'
nmap g> :<C-U>Redir<Space>
nmap ' `

cmap <expr> %. getcmdtype() == ':' ? expand('%:h') .. '/' : '%.'
cmap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"
cmap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"

" }}}

" Autocmds/Functions {{{
augroup MyVimInit | autocmd!
  autocmd! BufEnter * if &bt ==# 'terminal' | norm! a | endif
augroup END
" }}}

" Colors {{{
colorscheme neo
" }}}

" Commands {{{
command! Cd tcd %:h
command! Bonly .+,$bwipeout
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Squeeze %s/\v(\n\n)\n+/\1/e
" }}}

" LSP {{{

" def On_lsp_buffer_enabled()
"   setlocal omnifunc=lsp#complete tagfunc=lsp#tagfunc
"   # replace 'goto definition' binding
"   nmap <buffer> gd <plug>(lsp-definition)
"   # replaces 'goto global declaration' which is sorta the same
"   nmap <buffer> gD <plug>(lsp-type-definition)
"   # replaces 'goto sleep' bindings which are useless anyway
"   nmap <buffer> gs <plug>(lsp-document-symbol-search)
"   nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"   # replaces 'search for word without word boundaries \< and \>' binding
"   nmap <buffer> g*<plug>(lsp-references)
"   # using I because gi replaces 'goto last insert' which I use
"   nmap <buffer> gI <plug>(lsp-implementation)
"   # replaces 'format like gq but keep cursor still' binding
"   nmap <buffer> gw <plug>(lsp-rename)
"   # replaces 'goto macro definition' mappingss
"   nmap <buffer> [e <plug>(lsp-previous-diagnostic)
"   nmap <buffer> ]e <plug>(lsp-next-diagnostic)
"   nmap <buffer> K <plug>(lsp-hover)
"   imap <buffer> <expr><C-f> lsp#scroll(+4)
"   imap <buffer> <expr><C-b> lsp#scroll(-4)
"   g:lsp_fold_enabled = 0
"   g:lsp_format_sync_timeout = 1000
"   g:lsp_diagnostics_enabled = 1
"   # Highlight references to symbol under cursor like * was pressed in normal
"   g:lsp_document_highlight_enabled = 1
"   # TODO: semantic highlights with :h vim-lsp-semantic
"     autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
" enddef

" augroup lsp_install | autocmd!
"   # called only for languages with a server registered
"   autocmd User lsp_buffer_enabled call On_lsp_buffer_enabled()
" augroup END

" }}}

" TODO:
 
" vi:fdm=marker:nowrap:ft=vim:fdl=99:noet:tw=80:nolist
