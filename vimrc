vim9script
# vi: fdm=marker:nowrap:ft=vim:fdl=99:noet:tw=100:nolist

# Options {{{
# ./plugin/neovim-defaults.vim loads before these
g:mapleader = "\<Space>"
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif

# set completeopt=menu,menuone,popup,noselect,noinsert
set guifont=Iosevka\ Fixed:h24
set listchars=tab:→\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set omnifunc=syntaxcomplete#Complete
set path-=/usr/include path+=after/**,pack/git/opt/**
set runtimepath+=~/src/personal/colorschemes
set showbreak=↪
set signcolumn=yes
set smartindent
set splitbelow splitright
set wildcharm=<C-z>
set wildoptions=pum,tagfile
set wildignore+=*/node_modules/*,*/venv/*,*/dist/*
set wildignore+=*.o,*.obg,*.png,*.jpg,*.jpeg,*.svg,*.gif
colorscheme fortnight
#}}}

# Packages {{{
packadd vim-unimpaired
packadd vim-surround
packadd vim-commentary
packadd vim-repeat
packadd vim-tmux-navigator
packadd vim-fugitive
packadd vim-rhubarb

# }}}

# Mappings {{{
imap <C-Space> <C-x><C-o>

nmap m<CR> :<C-u>make<CR>
nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>
nmap zS <Cmd>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'
nmap g> :<C-u>Redir<Space>
nmap ' `
nnoremap / /\c
nnoremap ? ?\c

cmap <expr> %. getcmdtype() == ':' ? expand('%:h') .. '/' : '%.'
cmap <expr> <C-n> wildmenumode() ? '<C-N>' : '<Down>'
cmap <expr> <C-p> wildmenumode() ? '<C-P>' : '<Up>'

nmap <Leader>ee :edit *<C-z><S-Tab>
nmap <Leader>es :split *<C-z><S-Tab>
nmap <Leader>ev :vert split *<C-z><S-Tab>
nmap <Leader>en <Cmd>enew<CR>
nmap <Leader>bb :buffer <C-z><S-Tab>
nmap <Leader>bs :sbuffer <C-z><S-Tab>
nmap <Leader>bv :vert sbuffer <C-z><S-Tab>
nmap <Leader>ff :find *
nmap <Leader>fs :sfind *
nmap <Leader>fv :vert sfind *

xmap . :g/^/norm! .<CR>
# }}}

# Autocmds/Functions {{{
# augroup MyAugroup | autocmd!
#   autocmd BufReadPost * {
#    if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~ 'commit'
#      execute 'normal! g`"'
#    endif
#  }
#  # autocmd imEnter,DirChanged * {
#  # }
#augroup END

# call autocmd_add({replace: true, group: 'DemoGroup', event: 'BufEnter', pattern: '*', cmd: 'echo print("bufenter fired")'})

# }}}

# Commands {{{
command! Cd tcd %:h
command! Bonly .+,$bwipeout
command! TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! RemoveExtraNewlines :%s/\v(\n\n)\n+/\1/e
command! DiffOrig vert new | set bt=nofile | r ++edit \# | 0d_ | diffthis | wincmd p | diffthis
# }}}

## TODO:

