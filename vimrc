" all `./plugin/*.vim` files are sourced before this

let g:mapleader = ' '
let g:markdown_fenced_languages = ['json', 'bash']
let g:netrw_banner = 0
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:qf_mapping_ack_style = 1
let g:tmux_navigator_no_mappings = 1
let g:is_posix = 1 " more-better colours for sh ft

set tabstop=2 " leave any existing tabs, but show them as 2 spaces
set shiftwidth=0 " when 0, use tabstop value
set undofile
set undodir=~/.vim/cache/undo
set ignorecase " favouring laziness over preciseness here
set smartcase

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0ng/vim-hybrid'
call plug#end()

nmap <Leader>q <Plug>(qf_qf_toggle)
nmap <Leader>l <Plug>(qf_log_toggle)

nnoremap <silent> <M-h> :<C-u>TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :<C-u>TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :<C-u>TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :<C-u>TmuxNavigateRight<CR>

" mine
nmap <Leader>w <Cmd>update<CR>
nmap <Leader><CR> <Cmd>source %<CR>
nmap <expr> <Leader>e exists(":Explore") == 2 ? "<Cmd>Rexplore<CR>" : "<Cmd>Explore<CR>"
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>" .. v:count .. 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>" .. v:count .. 'k'

cnoremap w!! w !sudo tee > /dev/null %
cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'

nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

augroup Vimrc | autocmd!
  autocmd FileType yaml setlocal foldmethod=indent
  autocmd QuickFixCmdPost * cwindow
augroup END

colorscheme hybrid
hi! link CurSearch IncSearch

" experiments:

" def MyTabLabel(n: number): string
"   var buflist = tabpagebuflist(n)
"   var winnr = tabpagewinnr(n)
"   return bufname(buflist[winnr - 1])
" enddef

" def g:MyTabline(): string
"   var s = ""
"   for i in range(tabpagenr('$'))
"     if i + 1 = tabpagenr()
"       s = s .. '%#TabLineSel#'
"     else
"       s = s .. '%#TabLine#'
"     endif
"     s = s .. '%' .. i + 1 .. 'T'
"     s = s .. ' %{MyTabLabel(' .. i + 1 .. ')}'
"   endfor
"   s = s .. '%#TabLineFill#%T'
"   if tabpagenr('$') > 1
"     s = s .. '%=%#TabLine#%999Xclose'
"   endif
"   return s
" enddef

" set showtabline=2
" tabline insanity: `:h setting-tabline`
"
" hl-TabLine hl-Title hl-TabLineSel hl-TabLineFill
" tabpagenr() tabpagebuflist() tabpagewinnr()
" set tabline=%!MyTabline()

" TODO:
" - add highlights like habamax to matching pmenu stuff
" - any other highlights missing from 9 year old hybrid
" - tmux navigator setup with alt

" vi: et tw=100 sw=2 sts=-1
