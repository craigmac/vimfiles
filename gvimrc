" GUI settings - see `:h gui.txt` for common stuff, `:h gui-macvim` for MacVim

" for MacVim.app we have to check both because 'mvim' can also be TUI
if has('mac') && has('gui_running')
  set macmeta
endif

set tabpagemax=100

" default is `egmrLtT`
"
" set guioptions-=e | " remove native gui tabline, use `tabline` instead of
set guioptions-=r | " remove right hand scrollbar
set guioptions-=L | " remove left hand scrollbar when window is vert split
set guioptions+=P | " visual mode selections (w mouse or keys) copied to + register
set guioptions-=t | " remove tearoff menus
set guioptions-=T | " remove toolbar
set guioptions-=m | " remove menubar
set guioptions+=k | " recommended by macvim when its 'smooth resize' option is on

" gvim defaults to ~ which always messes me up and causes huge lag with fzf
cd $MYVIMDIR
