vim9script

# Options {{{
g:mapleader = ' '
if executable('rg') | set grepprg=rg\ --vimgrep\ $* | endif

set listchars=tab:→\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set noswapfile
set omnifunc=syntaxcomplete#Complete
set path-=/usr/include
set showbreak=↪\ 
set wildcharm=<C-z>
set wildoptions=pum,tagfile
set wildignore+=*/node_modules/*,*/venv/*,*/dist/*
set wildignore+=*.o,*.obj,*.png,*.jpg,*.jpeg,*.svg,*.gif

colorscheme zaibatsu
#}}}

# Packages config {{{
if has('patch-9.0.1880') | packadd editorconfig | endif

# fugitive
nnoremap <Leader>g :G<Space>
nnoremap <Leader>ge <cmd>Gedit <Bar> only<CR>
nnoremap <Leader>gd <cmd>Gvdiffsplit<CR>
nnoremap <Leader>gl <cmd>G log --oneline --decorate<CR>
nnoremap <Leader>gL <cmd>G log --oneline --decorate -- %<CR>
nnoremap <Leader>g/ :Ggrep! -HnriqE<Space>
nnoremap <Leader>gS :G! log -p -S<Space>
nnoremap <Leader>gs :G! log -p -S -- %<S-Left><S-Left>
nnoremap <Leader>g* :Ggrep! -Hnri --quiet <C-r>=expand("<cword>")<CR><CR>
nnoremap <Leader>gb <cmd>G blame<CR>
# set statusline=%f%{FugitiveStatusline()}%=%l,%c\ %P

# netrw
g:netrw_banner = 0
g:netrw_hide = 1
g:netrw_liststyle = 3
g:netrw_sizestyle = 'H'
# 'a' to toggle between normal/hiding these/only these displayed
g:netrw_list_hide = netrw_gitignore#Hide()
# use echoerr instead of temp window you have to close
g:netrw_use_errorwindow = 2

nnoremap <Leader>E <Cmd>Lexplore!<CR>
nnoremap <Leader>e. <Cmd>Lexplore! %:h<CR>
# }}}

# Mappings {{{
nmap <Leader>w <Cmd>update<CR>
nmap <Leader>, <Cmd>edit $MYVIMRC<CR>
nmap <Leader><CR> <Cmd>source %<CR> <bar> <Cmd>nohlsearch<CR>

imap <Nul> <C-x><C-o>

nnoremap <Leader>/ :vim! //j ** <Bar> cw 5<C-b><C-Right><Right><Right>
nmap m<CR> :<C-u>make<CR>

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

cmap <expr> <C-n> wildmenumode() ? '<C-N>' : '<Down>'
cmap <expr> <C-p> wildmenumode() ? '<C-P>' : '<Up>'

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y

xmap . :g/^/norm! .<CR>
# }}}

# Autocmds/Functions {{{
# augroup User
  # autocmd!
  # autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~ 'commit'
  #   | execute 'normal! g`"'
    # | endif
  # autocmd FileType qf packadd cfilter
  # autocmd BufReadPost fugitive://* setlocal bufhidden=delete
# augroup END

# }}}

# Commands {{{
# command! DiffOrig vert new | set bt=nofile | r ++edit \# | 0d_ | diffthis | wincmd p | diffthis
# # }}}

# vi: fdm=marker ft=vim fdl=0 ts=2 et sw=2 tw=100
