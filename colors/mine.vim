" My changes to 'default' + 'notermguicolors' colorscheme when using
" a terminal emulator that's using the 'Tomorrow Night' theme palette.

" hl-Normal will not be set: it uses the value from the terminal emulator
" foreground and background
if &tgc | echoerr "Colorscheme requires 'notermguicolors' set" | finish | endif
highlight clear

" source upstream first to get the latest definitions
runtime! colors/default.vim

let g:colors_name='mine'

" now the overrides
highlight! Folded ctermbg=236
highlight! FoldColumn ctermbg=236
highlight! PmenuSel cterm=reverse ctermfg=NONE ctermbg=NONE
highlight! Visual ctermbg=238
highlight! SignColumn ctermbg=238
highlight! CursorLine cterm=NONE ctermbg=236
highlight! CursorColumn ctermbg=236
highlight! CursorLineNr cterm=NONE ctermbg=236
highlight! PmenuSel cterm=NONE ctermbg=231 ctermfg=0
highlight! SpellBad cterm=undercurl ctermbg=NONE
highlight! SpellCap cterm=undercurl ctermbg=NONE guisp=Cyan
highlight! SpellRare cterm=undercurl ctermbg=NONE
highlight! SpellLocal cterm=undercurl ctermbg=NONE
highlight! TabLine cterm=NONE
