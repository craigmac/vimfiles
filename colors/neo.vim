" neo.vim - a dark, 256-color colourscheme inspired by Visual Studio Code and
" Neovim colours.

" 'neo' palette:
"
" ANSI        xterm no.     RGB
" 'black':    234       #1E1E1E
" 'red':      167       #D75F5F
" 'green':    151       #B5CEA8
" 'yellow':   222       #FFD787
" 'blue':     75        #569CD6
" 'magenta':  176       #C586C0
" 'cyan':     117       #9CDCFE
" 'white':    188       #D4D4D4

set background=dark

hi clear
let g:colors_name = 'neo'

if !&termguicolors
  if &t_Co < 256
    echoerr 'neo colourscheme requires 256-colour capable terminal.'
    finish
  endif
endif

let g:terminal_color_0 = '#1e1e1e'
let g:terminal_color_1 = '#d75f5f'
let g:terminal_color_2 = '#b5cea8'
let g:terminal_color_3 = '#ffd787'
let g:terminal_color_4 = '#569cd6'
let g:terminal_color_5 = '#c586c0'
let g:terminal_color_6 = '#9cdcfe'
let g:terminal_color_7 = '#d4d4d4'

" Preferred groups, see :help group-name
" NOTE: only declare background here, otherwise CursorLine won't work correctly
highlight! Normal cterm=NONE ctermfg=188 ctermbg=234 gui=NONE guifg=#D4D4D4 guibg=#1e1e1e

" comments and things we generally dim, like :help 'listchars'
highlight! Comment cterm=NONE ctermfg=244 ctermbg=NONE gui=NONE guifg=#808080 guibg=NONE

" strings, characters, boolean, floating points
highlight! Constant cterm=NONE ctermfg=176 ctermbg=NONE gui=NONE guifg=#C586C0 guibg=NONE

" variable names, function/method names
highlight! Identifier cterm=NONE ctermfg=151 ctermbg=NONE gui=NONE guifg=#B5CEA8 guibg=NONE

" if, then, else, switch etc.
highlight! Statement cterm=NONE ctermfg=117 ctermbg=NONE gui=NONE guifg=#9CDCFE  guibg=NONE

" includes, defines, macros, #if/else
highlight! link PreProc Identifier

" int/long/char/types, static, struct, union, enum, typedef, etc.
highlight! link Type Identifier

" special char in a constant or comment, debug statements,
" delimiter characters, tag markers for <C-]>
highlight! Special cterm=NONE ctermfg=188 ctermbg=NONE gui=NONE guifg=#D4D4D4 guibg=NONE

" stand out text, html links
highlight! Underline cterm=underline ctermfg=188 ctermbg=NONE gui=underline guisp=#D4D4D4 guibg=NONE

" left blank or hidden
highlight! Ignore cterm=NONE ctermfg=234 ctermbg=NONE gui=NONE guifg=#1E1E1E guibg=NONE

" any erroneous construct
highlight! Error cterm=NONE ctermfg=NONE ctermbg=167 gui=NONE guifg=NONE guibg=#D75F5F

" things needing extra attention, like todo/fixme/xxx
highlight! link Todo IncSearch

highlight! link Conceal Comment
highlight! link CurSearch IncSearch
highlight! link ColorColumn Error
highlight! Cursor guifg=#1E1E1E guibg=#D4D4D4
highlight! link CursorColumn ColorColumn
highlight! CursorLine cterm=NONE ctermfg=NONE ctermbg=237 gui=NONE guifg=NONE guibg=#3C3C3C
highlight! link CursorLineNr CursorLine
highlight! link Debug Special
highlight! DiffAdd cterm=NONE ctermfg=234 ctermbg=151 gui=NONE guifg=#1E1E1E guibg=#B5CEA8
highlight! DiffChange cterm=NONE ctermfg=234 ctermbg=188 gui=NONE guifg=#1E1E1E guibg=#D4D4D4
highlight! DiffDelete cterm=NONE ctermfg=167 ctermbg=NONE gui=NONE guifg=#D75F5F guibg=NONE
highlight! DiffText cterm=NONE ctermfg=234 ctermbg=117 gui=NONE guifg=#1E1E1E guibg=#9CDCFE
highlight! link Directory Constant
highlight! link FoldColumn Normal
highlight! link Folded Comment
highlight! IncSearch cterm=NONE ctermfg=234 ctermbg=228 gui=NONE guifg=#1e1e1e guibg=#FFFF87
highlight! link LineNr Comment
highlight! link LineNrAbove LineNr
highlight! link LineNrBelow LineNr
highlight! MatchParen cterm=NONE ctermfg=234 ctermbg=151 gui=NONE guifg=#1e1e1e guibg=#B5CEA8
highlight! link ModeMsg Normal
highlight! link MoreMsg Normal
highlight! Question cterm=NONE ctermfg=188 ctermbg=NONE gui=NONE guifg=#D4D4D4 guibg=NONE
highlight! link QuickFixLine Visual
highlight! link Search StatusLine
highlight! link SignColumn Normal
highlight! link SpecialKey Comment
highlight! SpellBad cterm=undercurl ctermfg=167 ctermbg=NONE gui=undercurl guifg=NONE guibg=NONE guisp=#D75F5F
highlight! link SpellCap SpellBad
highlight! link SpellRare SpellBad
highlight! link SpellLocal SpellBad
highlight! StatusLine cterm=NONE ctermfg=234 ctermbg=151 gui=NONE guifg=#1E1E1E guibg=#b5cea8
highlight! StatusLineNC cterm=NONE ctermfg=234 ctermbg=244 gui=NONE guifg=#1E1E1E guibg=#808080
highlight! link TabLine StatusLineNC
highlight! link TabLineFill CursorLine
highlight! link TabLineSel StatusLine
highlight! TermCursor cterm=reverse gui=reverse
highlight! TermCursorNC cterm=NONE gui=NONE guifg=NONE guibg=NONE
highlight! link Title Constant
highlight! link VertSplit Comment
highlight! Visual cterm=NONE ctermfg=234 ctermbg=75 gui=NONE guifg=#1e1e1e guibg=#569CD6
highlight! link Underlined Underline
highlight! link WarningMsg DiffDelete
highlight! link WildMenu PmenuSel
highlight! link WinBar StatusLine
highlight! link WinBarNC StatusLineNC
highlight! link lCursor Cursor

highlight! Pmenu cterm=NONE ctermfg=234 ctermbg=176 gui=NONE guifg=#1E1E1E guibg=#C586C0
highlight! PmenuThumb cterm=NONE ctermfg=NONE ctermbg=176 gui=NONE guifg=NONE guibg=#C586C0
highlight! PmenuSbar cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight! PmenuSel cterm=NONE ctermfg=234 ctermbg=188 gui=NONE guifg=#1E1E1E guibg=#D4D4D4

" Links
highlight! link Character Constant
highlight! link CursorLineFold FoldColumn
highlight! link EndOfBuffer NonText
highlight! link ErrorMsg Error
highlight! link MsgArea Normal
highlight! link NonText Comment
highlight! link NormalFloat Normal
highlight! link NormalNC Normal
highlight! link String Constant
highlight! link VisualNC Visual
highlight! link VisualNOS Visual
highlight! link WhiteSpace NonText
highlight! link WinSeparator VertSplit
highlight! link vimOption Identifier
highlight! link vimHiAttrib Constant

" see :h hl-StatusLineTerm, needs special handling for nvim to mimic
" Vim's StatusLineTerm
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
augroup Neocolorscheme
  autocmd! TermOpen,WinEnter * if &buftype=='terminal'
        \|setlocal winhighlight=StatusLine:StatusLineTerm,StatuslineNC:StatusLineTermNC
        \|else|setlocal winhighlight=|endif
augroup END

" help ft
highlight! link helpExample Statement
highlight! link helpHyperTextJump Underline

" vi:fdm=indent:et:sw=2:sts=-1:ts=2:
