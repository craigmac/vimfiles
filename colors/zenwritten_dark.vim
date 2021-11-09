let g:terminal_color_0 = '#191919'
let g:terminal_color_1 = '#DE6E7C'
let g:terminal_color_2 = '#819B69'
let g:terminal_color_3 = '#B77E64'
let g:terminal_color_4 = '#6099C0'
let g:terminal_color_5 = '#B279A7'
let g:terminal_color_6 = '#66A5AD'
let g:terminal_color_7 = '#BBBBBB'
let g:terminal_color_8 = '#3D3839'
let g:terminal_color_9 = '#E8838F'
let g:terminal_color_10 = '#8BAE68'
let g:terminal_color_11 = '#D68C67'
let g:terminal_color_12 = '#61ABDA'
let g:terminal_color_13 = '#CF86C1'
let g:terminal_color_14 = '#65B8C1'
let g:terminal_color_15 = '#8E8E8E'

highlight Bold guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link LightspeedUnlabeledMatch Bold
highlight BufferVisible guifg=#CFCFCF guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisibleIndex guifg=#CFCFCF guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisibleSign guifg=#CFCFCF guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbr guifg=#9E9E9E guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbrDeprecated guifg=#686868 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbrMatch guifg=#BBBBBB guibg=NONE guisp=NONE gui=bold cterm=bold
highlight CmpItemAbbrMatchFuzzy guifg=#A6A6A6 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight CmpItemKind guifg=#8B8B8B guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemMenu guifg=#7F7F7F guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CocMarkdownLink guifg=#66A5AD guibg=NONE guisp=NONE gui=underline cterm=underline
highlight ColorColumn guifg=NONE guibg=#55392C guisp=NONE gui=NONE cterm=NONE
highlight! link LspReferenceRead ColorColumn
highlight! link LspReferenceText ColorColumn
highlight! link LspReferenceWrite ColorColumn
highlight Comment guifg=#686868 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight Conceal guifg=#7F7F7F guibg=NONE guisp=NONE gui=bold,italic cterm=bold,italic
highlight! link LightspeedMaskedChar Conceal
highlight Constant guifg=#8B8B8B guibg=NONE guisp=NONE gui=italic cterm=italic
highlight! link TroubleSource Constant
highlight! link WhichKeyValue Constant
highlight! link helpHyperTextJump Constant
highlight! link helpOption Constant
highlight Cursor guifg=#191919 guibg=#C9C9C9 guisp=NONE gui=NONE cterm=NONE
highlight! link TermCursor Cursor
highlight CursorLine guifg=NONE guibg=#222222 guisp=NONE gui=NONE cterm=NONE
highlight! link CursorColumn CursorLine
highlight! link NeogitDiffContextHighlight CursorLine
highlight! link TelescopeSelection CursorLine
highlight CursorLineNr guifg=#BBBBBB guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Delimiter guifg=#7C7C7C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link markdownLinkTextDelimiter Delimiter
highlight! link LspDiagnosticsDefaultError DiagnosticError
highlight! link NeogitNotificationError DiagnosticError
highlight DiagnosticHint guifg=#B279A7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsDefaultHint DiagnosticHint
highlight DiagnosticInfo guifg=#6099C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsDefaultInformation DiagnosticInfo
highlight! link NeogitNotificationInfo DiagnosticInfo
highlight! link TSNote DiagnosticInfo
highlight DiagnosticSignError guifg=#DE6E7C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocErrorSign DiagnosticSignError
highlight! link LspDiagnosticsSignError DiagnosticSignError
highlight DiagnosticSignHint guifg=#B279A7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocHintSign DiagnosticSignHint
highlight! link LspDiagnosticsSignHint DiagnosticSignHint
highlight DiagnosticSignInfo guifg=#6099C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocInfoSign DiagnosticSignInfo
highlight! link LspDiagnosticsSignInformation DiagnosticSignInfo
highlight DiagnosticSignWarn guifg=#B77E64 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocWarningSign DiagnosticSignWarn
highlight! link LspDiagnosticsSignWarning DiagnosticSignWarn
highlight DiagnosticUnderlineError guifg=#DE6E7C guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocErrorHighlight DiagnosticUnderlineError
highlight! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
highlight DiagnosticUnderlineHint guifg=#B279A7 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocHintHighlight DiagnosticUnderlineHint
highlight! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
highlight DiagnosticUnderlineInfo guifg=#6099C0 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocInfoHighlight DiagnosticUnderlineInfo
highlight! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
highlight DiagnosticUnderlineWarn guifg=#B77E64 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocWarningHighlight DiagnosticUnderlineWarn
highlight! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
highlight DiagnosticVirtualTextError guifg=#DE6E7C guibg=#251B1C guisp=NONE gui=NONE cterm=NONE
highlight! link CocErrorVirtualText DiagnosticVirtualTextError
highlight! link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
highlight DiagnosticVirtualTextWarn guifg=#B77E64 guibg=#211D1B guisp=NONE gui=NONE cterm=NONE
highlight! link CocWarningVitualText DiagnosticVirtualTextWarn
highlight! link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
highlight! link LspDiagnosticsDefaultWarning DiagnosticWarn
highlight! link NeogitNotificationWarning DiagnosticWarn
highlight DiffAdd guifg=NONE guibg=#232D1A guisp=NONE gui=NONE cterm=NONE
highlight! link NeogitDiffAddHighlight DiffAdd
highlight DiffChange guifg=NONE guibg=#1D2C36 guisp=NONE gui=NONE cterm=NONE
highlight DiffDelete guifg=NONE guibg=#3E2225 guisp=NONE gui=NONE cterm=NONE
highlight! link NeogitDiffDeleteHighlight DiffDelete
highlight DiffText guifg=#BBBBBB guibg=#324757 guisp=NONE gui=NONE cterm=NONE
highlight Directory guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Error guifg=#DE6E7C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link DiagnosticError Error
highlight! link ErrorMsg Error
highlight! link TSDanger Error
highlight FloatBorder guifg=#797979 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight FoldColumn guifg=#616161 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Folded guifg=#A3A3A3 guibg=#393939 guisp=NONE gui=NONE cterm=NONE
highlight Function guifg=#BBBBBB guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TroubleNormal Function
highlight! link TroubleText Function
highlight GitSignsAdd guifg=#819B69 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterAdd GitSignsAdd
highlight GitSignsChange guifg=#6099C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterChange GitSignsChange
highlight GitSignsDelete guifg=#DE6E7C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterDelete GitSignsDelete
highlight HopNextKey2 guifg=#6099C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Identifier guifg=#9E9E9E guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSVariable Identifier
highlight! link markdownCode Identifier
highlight IncSearch guifg=#191919 guibg=#BF8FB5 guisp=NONE gui=bold cterm=bold
highlight IndentBlanklineChar guifg=#353535 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Italic guifg=NONE guibg=NONE guisp=NONE gui=italic cterm=italic
highlight LightspeedGreyWash guifg=#686868 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link HopUnmatched LightspeedGreyWash
highlight LightspeedLabel guifg=#B279A7 guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight! link HopNextKey LightspeedLabel
highlight LightspeedLabelDistant guifg=#66A5AD guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight! link HopNextKey1 LightspeedLabelDistant
highlight LightspeedLabelDistantOverlapped guifg=#66A5AD guibg=NONE guisp=NONE gui=underline cterm=underline
highlight LightspeedLabelOverlapped guifg=#B279A7 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight LightspeedOneCharMatch guifg=#191919 guibg=#B279A7 guisp=NONE gui=bold cterm=bold
highlight LightspeedPendingChangeOpArea guifg=#B279A7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight LightspeedShortcut guifg=#191919 guibg=#B279A7 guisp=NONE gui=bold,underline cterm=bold,underline
highlight LineNr guifg=#616161 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocCodeLens LineNr
highlight! link LspCodeLens LineNr
highlight! link NeogitHunkHeader LineNr
highlight! link SignColumn LineNr
highlight! link WhichKeySeparator LineNr
highlight MoreMsg guifg=#819B69 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link Question MoreMsg
highlight NeogitHunkHeaderHighlight guifg=#BBBBBB guibg=#222222 guisp=NONE gui=bold cterm=bold
highlight! link NnnNormalNC NnnNormal
highlight NnnVertSplit guifg=bg guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NonText guifg=#555555 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link EndOfBuffer NonText
highlight! link Whitespace NonText
highlight Normal guifg=#BBBBBB guibg=#191919 guisp=NONE gui=NONE cterm=NONE
highlight NormalFloat guifg=NONE guibg=#282828 guisp=NONE gui=NONE cterm=NONE
highlight Number guifg=#BBBBBB guibg=NONE guisp=NONE gui=italic cterm=italic
highlight! link Boolean Number
highlight! link TSConstBuiltin Number
highlight! link TSConstMacro Number
highlight! link TSVariableBuiltin Number
highlight NvimTreeCursorLine guifg=NONE guibg=#2E2E2E guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeCursorColumn NvimTreeCursorLine
highlight NvimTreeNormal guifg=#BBBBBB guibg=#1F1F1F guisp=NONE gui=NONE cterm=NONE
highlight! link NnnNormal NvimTreeNormal
highlight NvimTreeRootFolder guifg=#6099C0 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight NvimTreeSpecialFile guifg=#B279A7 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight NvimTreeSymlink guifg=#6099C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeVertSplit guifg=bg guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Pmenu guifg=NONE guibg=#303030 guisp=NONE gui=NONE cterm=NONE
highlight PmenuSbar guifg=NONE guibg=#6A6A6A guisp=NONE gui=NONE cterm=NONE
highlight PmenuSel guifg=NONE guibg=#494949 guisp=NONE gui=NONE cterm=NONE
highlight PmenuThumb guifg=NONE guibg=#848484 guisp=NONE gui=NONE cterm=NONE
highlight Search guifg=#BBBBBB guibg=#65435E guisp=NONE gui=NONE cterm=NONE
highlight! link MatchParen Search
highlight! link Sneak Search
highlight! link LightspeedPendingOpArea SneakLabel
highlight SneakLabelMask guifg=#B279A7 guibg=#B279A7 guisp=NONE gui=NONE cterm=NONE
highlight Special guifg=#939393 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link TSNamespace Special
highlight! link TSTag Special
highlight! link WhichKeyGroup Special
highlight! link helpHyperTextEntry Special
highlight! link markdownH4 Special
highlight! link markdownH5 Special
highlight! link markdownH6 Special
highlight SpecialComment guifg=#686868 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight SpecialKey guifg=#555555 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight SpellBad guifg=#CB7A83 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocSelectedText SpellBad
highlight SpellCap guifg=#CB7A83 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link SpellLocal SpellCap
highlight SpellRare guifg=#CB7A83 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight Statement guifg=#BBBBBB guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link PreProc Statement
highlight! link WhichKey Statement
highlight! link markdownH2 Statement
highlight! link markdownH3 Statement
highlight StatusLine guifg=#BBBBBB guibg=#393939 guisp=NONE gui=NONE cterm=NONE
highlight! link TabLine StatusLine
highlight StatusLineNC guifg=#CFCFCF guibg=#2E2E2E guisp=NONE gui=NONE cterm=NONE
highlight! link TabLineFill StatusLineNC
highlight TSConstant guifg=#9E9E9E guibg=NONE guisp=NONE gui=bold cterm=bold
highlight TabLineSel guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link BufferCurrent TabLineSel
highlight TelescopeBorder guifg=#797979 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeMatching guifg=#B279A7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight TelescopeSelectionCaret guifg=#DE6E7C guibg=#222222 guisp=NONE gui=NONE cterm=NONE
highlight Title guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Todo guifg=NONE guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight Type guifg=#969696 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link helpSpecial Type
highlight Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline cterm=underline
highlight VertSplit guifg=#616161 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Visual guifg=NONE guibg=#404040 guisp=NONE gui=NONE cterm=NONE
highlight WarningMsg guifg=#B77E64 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link DiagnosticWarn WarningMsg
highlight! link TSWarning WarningMsg
highlight! link gitcommitOverflow WarningMsg
highlight WildMenu guifg=#191919 guibg=#B279A7 guisp=NONE gui=NONE cterm=NONE
highlight! link SneakLabel WildMenu
highlight diffAdded guifg=#819B69 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitNew diffAdded
highlight diffChanged guifg=#6099C0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitDirty diffChanged
highlight diffFile guifg=#B77E64 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight diffIndexLine guifg=#B77E64 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight diffLine guifg=#B279A7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight diffNewFile guifg=#819B69 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight diffOldFile guifg=#DE6E7C guibg=NONE guisp=NONE gui=italic cterm=italic
highlight diffRemoved guifg=#DE6E7C guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitDeleted diffRemoved
highlight lCursor guifg=#191919 guibg=#7F7F7F guisp=NONE gui=NONE cterm=NONE
highlight! link TermCursorNC lCursor
highlight markdownH1 guifg=#BBBBBB guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline

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
