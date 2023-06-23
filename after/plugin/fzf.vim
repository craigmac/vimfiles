" https://github.com/junegunn/fzf.vim
" pair with:
" https://github.com/junegunn/fzf (run `make` in dir if fzf not installed
" already on system, and add the output dir to rtp and path, see fzf docs)
"
" Quickref:
" :call fzf#run() => main call that takes a 'spec' dictionary of options
" usually it is called with a fzf#wrap() inside, which takes the 'spec' dict
" like this:
" :call fzf#run(fzf#wrap({'source': 'ls'}))
" The wrap() call just extends/merges the dict with global fzf options and
" returns a new dict
"
" env vars $FZF_DEFAULT_COMMAND and $FZF_DEFAULT_OPTS apply!
" Or you can use :FZF fzf_options path, e.g. :FZF --reverse ~

if !get(g:, 'loaded_fzf') | finish | endif
if !get(g:, 'loaded_fzf_vim')
  nmap <Leader>ee :edit *<C-z><S-Tab>
  nmap <Leader>es :split *<C-z><S-Tab>
  nmap <Leader>ev :vert split *<C-z><S-Tab>
  nmap <Leader>en <Cmd>enew<CR>
  nmap <Leader>bb :buffer <C-z><S-Tab>
  nmap <Leader>bs :sbuffer <C-z><S-Tab>
  nmap <Leader>bv :vert sbuffer <C-z><S-Tab>
  nmap <Leader>ff :find **/*
  nmap <Leader>fs :sfind **/*
  nmap <Leader>fv :vert sfind **/*
  finish
endif

" full width layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" bottom style like Ivy
" let g:fzf_layout = { 'down': '25%' }

"  'fzf-item'    ['fg|bg of', 'this hi group name']
" fg/bg/hl+ means the current item, like current line fg
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['bg', 'Search'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine'],
  \ 'hl+':     ['fg', 'CurSearch'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Comment'],
  \ 'pointer': ['fg', 'CursorLineNr'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Comment'],
  \ 'gutter':  ['bg', 'Normal'],
  \ 'header':  ['fg', 'Comment'] }

" with this on, c-n/p will cycle history, use c-j/k for up/down as normal
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_preview_window = ['right,50%', 'ctrl-o']

nnoremap <Leader>f <Cmd>FZF<CR>
nnoremap <Leader><Leader> <Cmd>b #<CR>
nnoremap <Leader>V <Cmd>FZF $VIMRUNTIME<CR>
nnoremap <Leader>/ <Cmd>Rg<CR>
nnoremap <Leader>* :<C-u>Rg <C-r><C-w><CR>
nnoremap <Leader><F1> <Cmd>Helptags<CR>

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

