" vi:fdm=marker:nowrap:ft=vim:fdl=99:noet:tw=80:nolist:isk+=-

" Options {{{
" ./plugin/neovim-defaults.vim loads before these
let g:mapleader = "\<Space>"
set completeopt=menu,menuone,popup,noselect,noinsert
set grepprg=git\ grep\ --untracked\ -In\ $*
set guifont=Iosevka\ Fixed:h24
set listchars=tab:→\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set omnifunc=syntaxcomplete#Complete
set path-=/usr/include
set runtimepath+=~/src/personal/fortnight
set showbreak=↪
set signcolumn=yes
set smartindent
set splitbelow splitright
set wildcharm=<C-z>
set wildoptions=pum,tagfile
" remove these from results, still searched unless removed from &path!
set wildignore+=*/node_modules/*,*/venv/*,*/dist/*
set wildignore+=*.o,*.obg,*.png,*.jpg,*.jpeg,*.svg,*.gif
colorscheme fortnight

"}}}

" Packages {{{
packadd vim-unimpaired
packadd vim-surround
packadd vim-commentary
packadd vim-repeat
packadd vim-tmux-navigator
packadd vim-markdown

packadd asyncrun.vim
packadd asynctasks.vim
packadd vim-floaterm
packadd fzf
packadd fzf.vim

" packadd lsp
" packadd apprentice
packadd vim-colortemplate
" }}}

" Mappings {{{
imap <C-Space> <C-x><C-o>

nmap m<CR> :<C-u>make<CR>
nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/' .. &ft .. '.vim')<CR><CR>
nmap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>
nmap zS <Cmd>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'
nmap g> :<C-u>Redir<Space>
nmap ' `
nnoremap / /\c
nnoremap ? ?\c

cmap <expr> %. getcmdtype() == ':' ? expand('%:h') .. '/' : '%.'
cmap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"
cmap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"

" }}}

" Autocmds/Functions {{{
augroup MyVimInit | autocmd!
  " autocmd BufEnter * if &bt ==# 'terminal' | norm! a | endif
  autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\"" | endif
augroup END
" }}}

" Commands {{{
command! Cd tcd %:h
command! Bonly .+,$bwipeout
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Squeeze %s/\v(\n\n)\n+/\1/e
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
\ | wincmd p | diffthis
" }}}

" TODO:

