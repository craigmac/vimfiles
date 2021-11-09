let g:terminal_color_0 = '#F0EDEC'
let g:terminal_color_1 = '#A8334C'
let g:terminal_color_2 = '#4F6C31'
let g:terminal_color_3 = '#944927'
let g:terminal_color_4 = '#286486'
let g:terminal_color_5 = '#88507D'
let g:terminal_color_6 = '#3B8992'
let g:terminal_color_7 = '#2C363C'
let g:terminal_color_8 = '#CFC1BA'
let g:terminal_color_9 = '#94253E'
let g:terminal_color_10 = '#3F5A22'
let g:terminal_color_11 = '#803D1C'
let g:terminal_color_12 = '#1D5573'
let g:terminal_color_13 = '#7B3B70'
let g:terminal_color_14 = '#2B747C'
let g:terminal_color_15 = '#4F5E68'

highlight Bold guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link LightspeedUnlabeledMatch Bold
highlight BufferVisible guifg=#596A76 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisibleIndex guifg=#596A76 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisibleSign guifg=#596A76 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbr guifg=#44525B guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbrDeprecated guifg=#728794 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbrMatch guifg=#2C363C guibg=NONE guisp=NONE gui=bold cterm=bold
highlight CmpItemAbbrMatchFuzzy guifg=#3E4B53 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight CmpItemKind guifg=#556570 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemMenu guifg=#5E6F7B guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CocMarkdownLink guifg=#3B8992 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight ColorColumn guifg=NONE guibg=#E6C5BD guisp=NONE gui=NONE cterm=NONE
highlight! link LspReferenceRead ColorColumn
highlight! link LspReferenceText ColorColumn
highlight! link LspReferenceWrite ColorColumn
highlight Comment guifg=#948985 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight Conceal guifg=#4F5E68 guibg=NONE guisp=NONE gui=bold,italic cterm=bold,italic
highlight! link LightspeedMaskedChar Conceal
highlight Constant guifg=#556570 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight! link TroubleSource Constant
highlight! link WhichKeyValue Constant
highlight! link helpHyperTextJump Constant
highlight! link helpOption Constant
highlight Cursor guifg=#F0EDEC guibg=#2C363C guisp=NONE gui=NONE cterm=NONE
highlight! link TermCursor Cursor
highlight CursorLine guifg=NONE guibg=#E9E4E2 guisp=NONE gui=NONE cterm=NONE
highlight! link CursorColumn CursorLine
highlight! link NeogitDiffContextHighlight CursorLine
highlight! link TelescopeSelection CursorLine
highlight CursorLineNr guifg=#2C363C guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Delimiter guifg=#8E817B guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link markdownLinkTextDelimiter Delimiter
highlight! link LspDiagnosticsDefaultError DiagnosticError
highlight! link NeogitNotificationError DiagnosticError
highlight DiagnosticHint guifg=#88507D guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsDefaultHint DiagnosticHint
highlight DiagnosticInfo guifg=#286486 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsDefaultInformation DiagnosticInfo
highlight! link NeogitNotificationInfo DiagnosticInfo
highlight! link TSNote DiagnosticInfo
highlight DiagnosticSignError guifg=#A8334C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocErrorSign DiagnosticSignError
highlight! link LspDiagnosticsSignError DiagnosticSignError
highlight DiagnosticSignHint guifg=#88507D guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocHintSign DiagnosticSignHint
highlight! link LspDiagnosticsSignHint DiagnosticSignHint
highlight DiagnosticSignInfo guifg=#286486 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocInfoSign DiagnosticSignInfo
highlight! link LspDiagnosticsSignInformation DiagnosticSignInfo
highlight DiagnosticSignWarn guifg=#944927 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocWarningSign DiagnosticSignWarn
highlight! link LspDiagnosticsSignWarning DiagnosticSignWarn
highlight DiagnosticUnderlineError guifg=#A8334C guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocErrorHighlight DiagnosticUnderlineError
highlight! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
highlight DiagnosticUnderlineHint guifg=#88507D guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocHintHighlight DiagnosticUnderlineHint
highlight! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
highlight DiagnosticUnderlineInfo guifg=#286486 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocInfoHighlight DiagnosticUnderlineInfo
highlight! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
highlight DiagnosticUnderlineWarn guifg=#944927 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocWarningHighlight DiagnosticUnderlineWarn
highlight! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
highlight DiagnosticVirtualTextError guifg=#A8334C guibg=#F2DEE0 guisp=NONE gui=NONE cterm=NONE
highlight! link CocErrorVirtualText DiagnosticVirtualTextError
highlight! link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
highlight DiagnosticVirtualTextWarn guifg=#944927 guibg=#F2DEDA guisp=NONE gui=NONE cterm=NONE
highlight! link CocWarningVitualText DiagnosticVirtualTextWarn
highlight! link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
highlight! link LspDiagnosticsDefaultWarning DiagnosticWarn
highlight! link NeogitNotificationWarning DiagnosticWarn
highlight DiffAdd guifg=NONE guibg=#CBE5B8 guisp=NONE gui=NONE cterm=NONE
highlight! link NeogitDiffAddHighlight DiffAdd
highlight DiffChange guifg=NONE guibg=#D4DEE7 guisp=NONE gui=NONE cterm=NONE
highlight DiffDelete guifg=NONE guibg=#EBD8DA guisp=NONE gui=NONE cterm=NONE
highlight! link NeogitDiffDeleteHighlight DiffDelete
highlight DiffText guifg=#2C363C guibg=#A9BED1 guisp=NONE gui=NONE cterm=NONE
highlight Directory guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Error guifg=#A8334C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link DiagnosticError Error
highlight! link ErrorMsg Error
highlight! link TSDanger Error
highlight FloatBorder guifg=#786D68 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight FoldColumn guifg=#A4968F guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Folded guifg=#564E4A guibg=#CDC2BC guisp=NONE gui=NONE cterm=NONE
highlight Function guifg=#2C363C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TroubleNormal Function
highlight! link TroubleText Function
highlight GitSignsAdd guifg=#4F6C31 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterAdd GitSignsAdd
highlight GitSignsChange guifg=#286486 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterChange GitSignsChange
highlight GitSignsDelete guifg=#A8334C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterDelete GitSignsDelete
highlight HopNextKey2 guifg=#286486 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Identifier guifg=#44525B guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSVariable Identifier
highlight! link markdownCode Identifier
highlight IncSearch guifg=#F0EDEC guibg=#C074B2 guisp=NONE gui=bold cterm=bold
highlight IndentBlanklineChar guifg=#D4CDCA guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Italic guifg=NONE guibg=NONE guisp=NONE gui=italic cterm=italic
highlight LightspeedGreyWash guifg=#948985 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link HopUnmatched LightspeedGreyWash
highlight LightspeedLabel guifg=#88507D guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight! link HopNextKey LightspeedLabel
highlight LightspeedLabelDistant guifg=#3B8992 guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight! link HopNextKey1 LightspeedLabelDistant
highlight LightspeedLabelDistantOverlapped guifg=#3B8992 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight LightspeedLabelOverlapped guifg=#88507D guibg=NONE guisp=NONE gui=underline cterm=underline
highlight LightspeedOneCharMatch guifg=#F0EDEC guibg=#88507D guisp=NONE gui=bold cterm=bold
highlight LightspeedPendingChangeOpArea guifg=#88507D guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight LightspeedShortcut guifg=#F0EDEC guibg=#88507D guisp=NONE gui=bold,underline cterm=bold,underline
highlight LineNr guifg=#A4968F guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocCodeLens LineNr
highlight! link LspCodeLens LineNr
highlight! link NeogitHunkHeader LineNr
highlight! link SignColumn LineNr
highlight! link WhichKeySeparator LineNr
highlight MoreMsg guifg=#4F6C31 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link Question MoreMsg
highlight NeogitHunkHeaderHighlight guifg=#2C363C guibg=#E9E4E2 guisp=NONE gui=bold cterm=bold
highlight! link NnnNormalNC NnnNormal
highlight NnnVertSplit guifg=bg guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NonText guifg=#BBABA3 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link EndOfBuffer NonText
highlight! link Whitespace NonText
highlight Normal guifg=#2C363C guibg=#F0EDEC guisp=NONE gui=NONE cterm=NONE
highlight NormalFloat guifg=NONE guibg=#E1DCD9 guisp=NONE gui=NONE cterm=NONE
highlight Number guifg=#2C363C guibg=NONE guisp=NONE gui=italic cterm=italic
highlight! link Boolean Number
highlight! link TSConstBuiltin Number
highlight! link TSConstMacro Number
highlight! link TSVariableBuiltin Number
highlight NvimTreeCursorLine guifg=NONE guibg=#DAD3CF guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeCursorColumn NvimTreeCursorLine
highlight NvimTreeNormal guifg=#2C363C guibg=#E9E4E2 guisp=NONE gui=NONE cterm=NONE
highlight! link NnnNormal NvimTreeNormal
highlight NvimTreeRootFolder guifg=#286486 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight NvimTreeSpecialFile guifg=#88507D guibg=NONE guisp=NONE gui=underline cterm=underline
highlight NvimTreeSymlink guifg=#286486 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeVertSplit guifg=bg guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Pmenu guifg=NONE guibg=#DAD3CF guisp=NONE gui=NONE cterm=NONE
highlight PmenuSbar guifg=NONE guibg=#B2A39B guisp=NONE gui=NONE cterm=NONE
highlight PmenuSel guifg=NONE guibg=#C4B6AF guisp=NONE gui=NONE cterm=NONE
highlight PmenuThumb guifg=NONE guibg=#F7F6F5 guisp=NONE gui=NONE cterm=NONE
highlight Search guifg=#2C363C guibg=#DEB9D6 guisp=NONE gui=NONE cterm=NONE
highlight! link MatchParen Search
highlight! link Sneak Search
highlight! link LightspeedPendingOpArea SneakLabel
highlight SneakLabelMask guifg=#88507D guibg=#88507D guisp=NONE gui=NONE cterm=NONE
highlight Special guifg=#4F5E68 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link TSNamespace Special
highlight! link TSTag Special
highlight! link WhichKeyGroup Special
highlight! link helpHyperTextEntry Special
highlight! link markdownH4 Special
highlight! link markdownH5 Special
highlight! link markdownH6 Special
highlight SpecialComment guifg=#948985 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight SpecialKey guifg=#BBABA3 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight SpellBad guifg=#974352 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocSelectedText SpellBad
highlight SpellCap guifg=#974352 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link SpellLocal SpellCap
highlight SpellRare guifg=#974352 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight Statement guifg=#2C363C guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link PreProc Statement
highlight! link WhichKey Statement
highlight! link markdownH2 Statement
highlight! link markdownH3 Statement
highlight StatusLine guifg=#2C363C guibg=#D1C7C3 guisp=NONE gui=NONE cterm=NONE
highlight! link TabLine StatusLine
highlight StatusLineNC guifg=#596A76 guibg=#DAD3CF guisp=NONE gui=NONE cterm=NONE
highlight! link TabLineFill StatusLineNC
highlight TSConstant guifg=#44525B guibg=NONE guisp=NONE gui=bold cterm=bold
highlight TabLineSel guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link BufferCurrent TabLineSel
highlight TelescopeBorder guifg=#786D68 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeMatching guifg=#88507D guibg=NONE guisp=NONE gui=bold cterm=bold
highlight TelescopeSelectionCaret guifg=#A8334C guibg=#E9E4E2 guisp=NONE gui=NONE cterm=NONE
highlight Title guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Todo guifg=NONE guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight Type guifg=#6A5549 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link helpSpecial Type
highlight Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline cterm=underline
highlight VertSplit guifg=#A4968F guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Visual guifg=NONE guibg=#CBD9E3 guisp=NONE gui=NONE cterm=NONE
highlight WarningMsg guifg=#944927 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link DiagnosticWarn WarningMsg
highlight! link TSWarning WarningMsg
highlight! link gitcommitOverflow WarningMsg
highlight WildMenu guifg=#F0EDEC guibg=#88507D guisp=NONE gui=NONE cterm=NONE
highlight! link SneakLabel WildMenu
highlight diffAdded guifg=#4F6C31 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitNew diffAdded
highlight diffChanged guifg=#286486 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitDirty diffChanged
highlight diffFile guifg=#944927 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight diffIndexLine guifg=#944927 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight diffLine guifg=#88507D guibg=NONE guisp=NONE gui=bold cterm=bold
highlight diffNewFile guifg=#4F6C31 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight diffOldFile guifg=#A8334C guibg=NONE guisp=NONE gui=italic cterm=italic
highlight diffRemoved guifg=#A8334C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitDeleted diffRemoved
highlight lCursor guifg=#F0EDEC guibg=#4D5C65 guisp=NONE gui=NONE cterm=NONE
highlight! link TermCursorNC lCursor
highlight markdownH1 guifg=#2C363C guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline

let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')
if !s:italics
  " start_no_italics
  highlight Boolean gui=NONE cterm=NONE
  highlight Comment gui=NONE cterm=NONE
  highlight Constant gui=NONE cterm=NONE
  highlight Number gui=NONE cterm=NONE
  highlight SpecialKey gui=NONE cterm=NONE
  highlight TSConstBuiltin gui=NONE cterm=NONE
  highlight TSConstMacro gui=NONE cterm=NONE
  highlight TSVariableBuiltin gui=NONE cterm=NONE
  highlight TroubleSource gui=NONE cterm=NONE
  highlight WhichKeyValue gui=NONE cterm=NONE
  highlight diffNewFile gui=NONE cterm=NONE
  highlight diffOldFile gui=NONE cterm=NONE
  highlight helpHyperTextJump gui=NONE cterm=NONE
  highlight helpOption gui=NONE cterm=NONE
" end_no_italics
endif
