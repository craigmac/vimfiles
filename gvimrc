" for macvim 8.2.2576+ with running gui (:echo has('gui_running'))
" macvim can be run from CLI as well, so these settings only apply
" when running gui version.

" ----------------------------------------------------------------------------
"  GUI Visuals
" ----------------------------------------------------------------------------
set guifont=JetBrainsMonoNL-Regular:h18
" Turn off blinking cursor in 'a'll modes
set guicursor=a:blinkon0
" Scroll bars on left/right/bottom off
set guioptions-=r
set guioptions-=L
set guioptions-=b

" ----------------------------------------------------------------------------
"  GUI behaviours
" ----------------------------------------------------------------------------
" Macvim you can drop and drop bunch of files onto app icon
" and it opens each of them in new tabs, so bump this up from 10
set tabpagemax=100

" ----------------------------------------------------------------------------
"  GUI keybindings
" ----------------------------------------------------------------------------
" Allows binding of all Option-key combinations
set macmeta
nnoremap <D-j> <C-w>p<C-e><C-w>p
nnoremap <D-k> <C-w>p<C-y><C-w>p
nnoremap <D-J> <C-w>p<C-d><C-w>p
nnoremap <D-K> <C-w>p<C-u><C-w>p
