" My changes to default colorscheme for dark bg with 'termguicolors'
if !&tgc | echoerr "Colorscheme requires 'termguicolors' set" | finish | endif
highlight clear

let g:colors_name='neo-defaults'

" TODO: explain why: not defined by default and uses hardcoded xterm dark values
" From tomorrow palette (same 0-16 for tomorrow and tomorrow night)
let g:terminal_ansi_colors = [
  \ '#1d1f21', '#cc6666', '#b5bd68', '#f0c674',
  \ '#81a2be', '#b294bb', '#8abeb7', '#c5c8c6',
  \ '#666666', '#cc6666', '#b5bd68', '#f0c674',
  \ '#81a2be', '#b294bb', '#8abeb7', '#ffffff',
\ ]

" The map that translates color string names, like 'Cyan', to hex values, is in
" $VIMRUNTIME/colors/lists/default.vim

" Swatch samples of the named colors and their hex values are found at
" https://en.wikipedia.org/wiki/X11_color_names#Color_name_chart
highlight! Folded guifg=#55cccc guibg=#555555
highlight! FoldColumn guibg=NONE
" highlight! StatusLineNC guifg=LightGrey
highlight! Pmenu guibg=violet guifg=black
highlight! PmenuSel guibg=white guifg=black
highlight! PmenuSbar guifg=black guibg=#cccccc
highlight! PmenuThumb guifg=black
highlight! Visual guifg=black guibg=#55cccc
highlight! SignColumn guifg=Cyan guibg=NONE
highlight! CursorLine cterm=NONE gui=NONE
" highlight! CursorColumn
highlight! CursorLineNr gui=NONE cterm=NONE
highlight! SpellBad cterm=undercurl ctermbg=NONE ctermul=1 gui=undercurl guisp=Red guibg=NONE
highlight! SpellCap cterm=undercurl ctermul=4 gui=undercurl guisp=Blue guibg=NONE ctermbg=NONE
highlight! SpellRare cterm=undercurl ctermbg=NONE ctermul=5 gui=undercurl guisp=Magenta
highlight! SpellLocal cterm=undercurl ctermbg=NONE ctermul=6 gui=undercurl guisp=Cyan
highlight! TabLine cterm=reverse gui=reverse 

highlight! link CurSearch IncSearch
highlight! NonText gui=NONE guifg=Cyan
