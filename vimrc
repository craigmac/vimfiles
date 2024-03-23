" vi: et tw=2 sw=2 sts=-1

let g:mapleader = ' '
let g:netrw_banner = 0
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:markdown_fenced_languages = ['json', 'bash']
let g:qf_mapping_ack_style = 1

set exrc secure
set grepprg=ag\ --vimgrep\ $*
set ignorecase smartcase
set nowrap
set splitright splitbelow
" respect existing tabs, but only show as taking 2 spaces in the file
set tabstop=2 shiftwidth=0
set wildcharm=<C-z>

packadd! matchit
if v:version > 900 | packadd! editorconfig | endif

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-cool'
Plug 'NLKNguyen/papercolor-theme'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

if executable('fzf')
  let &rtp ..= ',' .. fnamemodify(exepath('fzf'), ':p:h:h') .. '/opt/fzf'
  nmap <Leader>f <Cmd>FZF<CR>
else
  nmap <Leader>ff :<C-u>find<Space>
  nmap <Leader>fs :<C-u>sfind<Space>
  nmap <Leader>ft :<C-u>tabfind<Space>
endif

nnoremap <Leader>q <Plug>(qf_qf_toggle)
nnoremap <Leader>l <Plug>(qf_log_toggle)

nmap <Leader>w <Cmd>update<CR>
nmap <Leader>E <Cmd>Lexplore<CR>

nmap <Leader>ee :<C-u>edit **/*<C-z><S-Tab>
nmap <Leader>es :<C-u>split **/*<C-z><S-Tab>
nmap <Leader>et :<C-u>tabedit **/*<C-z><S-Tab>

nmap <Leader>bb :<C-u>buffer <C-z><S-Tab>
nmap <Leader>bs :<C-u>sbuffer <C-z><S-Tab>
nmap <Leader>bv :<C-u>vert sbuffer <C-z><S-Tab>

nmap <Leader>/ :<C-u>silent grep! <Bar> redraw!<C-b><S-Right><Space>

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'

nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

augroup Mine | autocmd!
  autocmd FileType yaml setlocal foldmethod=indent
  autocmd QuickFixCmdPost * cwindow
augroup END

if has('gui_running')
  set background=light
  colorscheme papercolor
else
  set background=dark
endif
