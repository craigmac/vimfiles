let g:terminal_color_0 = '#1A1825'
let g:terminal_color_1 = '#EB7193'
let g:terminal_color_2 = '#317490'
let g:terminal_color_3 = '#F6C074'
let g:terminal_color_4 = '#9CCFD8'
let g:terminal_color_5 = '#C4A7E7'
let g:terminal_color_6 = '#9CCFD8'
let g:terminal_color_7 = '#E1D4D4'
let g:terminal_color_8 = '#3A3651'
let g:terminal_color_9 = '#F289A4'
let g:terminal_color_10 = '#358DAF'
let g:terminal_color_11 = '#F9CA8E'
let g:terminal_color_12 = '#94DAE6'
let g:terminal_color_13 = '#CEB3EF'
let g:terminal_color_14 = '#94DAE6'
let g:terminal_color_15 = '#BF9B99'

highlight Bold guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link LightspeedUnlabeledMatch Bold
highlight BufferVisible guifg=#E9E0E0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisibleIndex guifg=#E9E0E0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight BufferVisibleSign guifg=#E9E0E0 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbr guifg=#CAB0AF guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbrDeprecated guifg=#9C6A68 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemAbbrMatch guifg=#E1D4D4 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight CmpItemAbbrMatchFuzzy guifg=#D0B9B8 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight CmpItemKind guifg=#BC9493 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CmpItemMenu guifg=#B48583 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight CocMarkdownLink guifg=#9CCFD8 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight ColorColumn guifg=NONE guibg=#4C3D2C guisp=NONE gui=NONE cterm=NONE
highlight! link LspReferenceRead ColorColumn
highlight! link LspReferenceText ColorColumn
highlight! link LspReferenceWrite ColorColumn
highlight Comment guifg=#69657E guibg=NONE guisp=NONE gui=italic cterm=italic
highlight Conceal guifg=#B48583 guibg=NONE guisp=NONE gui=bold,italic cterm=bold,italic
highlight! link LightspeedMaskedChar Conceal
highlight Constant guifg=#BC9493 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight! link TroubleSource Constant
highlight! link WhichKeyValue Constant
highlight! link helpHyperTextJump Constant
highlight! link helpOption Constant
highlight Cursor guifg=#1A1825 guibg=#E7DDDD guisp=NONE gui=NONE cterm=NONE
highlight! link TermCursor Cursor
highlight CursorLine guifg=NONE guibg=#222030 guisp=NONE gui=NONE cterm=NONE
highlight! link CursorColumn CursorLine
highlight! link NeogitDiffContextHighlight CursorLine
highlight! link TelescopeSelection CursorLine
highlight CursorLineNr guifg=#E1D4D4 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Delimiter guifg=#7D7997 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link markdownLinkTextDelimiter Delimiter
highlight! link LspDiagnosticsDefaultError DiagnosticError
highlight! link NeogitNotificationError DiagnosticError
highlight DiagnosticHint guifg=#C4A7E7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsDefaultHint DiagnosticHint
highlight DiagnosticInfo guifg=#9CCFD8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link LspDiagnosticsDefaultInformation DiagnosticInfo
highlight! link NeogitNotificationInfo DiagnosticInfo
highlight! link TSNote DiagnosticInfo
highlight DiagnosticSignError guifg=#EB7193 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocErrorSign DiagnosticSignError
highlight! link LspDiagnosticsSignError DiagnosticSignError
highlight DiagnosticSignHint guifg=#C4A7E7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocHintSign DiagnosticSignHint
highlight! link LspDiagnosticsSignHint DiagnosticSignHint
highlight DiagnosticSignInfo guifg=#9CCFD8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocInfoSign DiagnosticSignInfo
highlight! link LspDiagnosticsSignInformation DiagnosticSignInfo
highlight DiagnosticSignWarn guifg=#F6C074 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocWarningSign DiagnosticSignWarn
highlight! link LspDiagnosticsSignWarning DiagnosticSignWarn
highlight DiagnosticUnderlineError guifg=#EB7193 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocErrorHighlight DiagnosticUnderlineError
highlight! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
highlight DiagnosticUnderlineHint guifg=#C4A7E7 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocHintHighlight DiagnosticUnderlineHint
highlight! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
highlight DiagnosticUnderlineInfo guifg=#9CCFD8 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocInfoHighlight DiagnosticUnderlineInfo
highlight! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
highlight DiagnosticUnderlineWarn guifg=#F6C074 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocWarningHighlight DiagnosticUnderlineWarn
highlight! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
highlight DiagnosticVirtualTextError guifg=#EB7193 guibg=#241B1D guisp=NONE gui=NONE cterm=NONE
highlight! link CocErrorVirtualText DiagnosticVirtualTextError
highlight! link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
highlight DiagnosticVirtualTextWarn guifg=#F6C074 guibg=#1F1D1B guisp=NONE gui=NONE cterm=NONE
highlight! link CocWarningVitualText DiagnosticVirtualTextWarn
highlight! link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
highlight! link LspDiagnosticsDefaultWarning DiagnosticWarn
highlight! link NeogitNotificationWarning DiagnosticWarn
highlight DiffAdd guifg=NONE guibg=#1D2C34 guisp=NONE gui=NONE cterm=NONE
highlight! link NeogitDiffAddHighlight DiffAdd
highlight DiffChange guifg=NONE guibg=#1C2D2F guisp=NONE gui=NONE cterm=NONE
highlight DiffDelete guifg=NONE guibg=#3D2229 guisp=NONE gui=NONE cterm=NONE
highlight! link NeogitDiffDeleteHighlight DiffDelete
highlight DiffText guifg=#E1D4D4 guibg=#30484C guisp=NONE gui=NONE cterm=NONE
highlight Directory guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Error guifg=#EB7193 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link DiagnosticError Error
highlight! link ErrorMsg Error
highlight! link TSDanger Error
highlight FloatBorder guifg=#7A7695 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight FoldColumn guifg=#625D7F guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Folded guifg=#A4A1B7 guibg=#3A364E guisp=NONE gui=NONE cterm=NONE
highlight Function guifg=#E1D4D4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TroubleNormal Function
highlight! link TroubleText Function
highlight GitSignsAdd guifg=#317490 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterAdd GitSignsAdd
highlight GitSignsChange guifg=#9CCFD8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterChange GitSignsChange
highlight GitSignsDelete guifg=#EB7193 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link GitGutterDelete GitSignsDelete
highlight HopNextKey2 guifg=#9CCFD8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Identifier guifg=#CAB0AF guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSVariable Identifier
highlight! link markdownCode Identifier
highlight IncSearch guifg=#1A1825 guibg=#B48DE0 guisp=NONE gui=bold cterm=bold
highlight IndentBlanklineChar guifg=#353345 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Italic guifg=NONE guibg=NONE guisp=NONE gui=italic cterm=italic
highlight LightspeedGreyWash guifg=#69657E guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link HopUnmatched LightspeedGreyWash
highlight LightspeedLabel guifg=#C4A7E7 guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight! link HopNextKey LightspeedLabel
highlight LightspeedLabelDistant guifg=#9CCFD8 guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight! link HopNextKey1 LightspeedLabelDistant
highlight LightspeedLabelDistantOverlapped guifg=#9CCFD8 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight LightspeedLabelOverlapped guifg=#C4A7E7 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight LightspeedOneCharMatch guifg=#1A1825 guibg=#C4A7E7 guisp=NONE gui=bold cterm=bold
highlight LightspeedPendingChangeOpArea guifg=#C4A7E7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight LightspeedShortcut guifg=#1A1825 guibg=#C4A7E7 guisp=NONE gui=bold,underline cterm=bold,underline
highlight LineNr guifg=#625D7F guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link CocCodeLens LineNr
highlight! link LspCodeLens LineNr
highlight! link NeogitHunkHeader LineNr
highlight! link SignColumn LineNr
highlight! link WhichKeySeparator LineNr
highlight MoreMsg guifg=#317490 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link Question MoreMsg
highlight NeogitHunkHeaderHighlight guifg=#E1D4D4 guibg=#222030 guisp=NONE gui=bold cterm=bold
highlight! link NnnNormalNC NnnNormal
highlight NnnVertSplit guifg=bg guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NonText guifg=#565172 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link EndOfBuffer NonText
highlight! link Whitespace NonText
highlight Normal guifg=#E1D4D4 guibg=#1A1825 guisp=NONE gui=NONE cterm=NONE
highlight NormalFloat guifg=NONE guibg=#282638 guisp=NONE gui=NONE cterm=NONE
highlight Number guifg=#E1D4D4 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight! link Boolean Number
highlight! link TSConstBuiltin Number
highlight! link TSConstMacro Number
highlight! link TSVariableBuiltin Number
highlight NvimTreeCursorLine guifg=NONE guibg=#2F2C40 guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeCursorColumn NvimTreeCursorLine
highlight NvimTreeNormal guifg=#E1D4D4 guibg=#201E2D guisp=NONE gui=NONE cterm=NONE
highlight! link NnnNormal NvimTreeNormal
highlight NvimTreeRootFolder guifg=#9CCFD8 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight NvimTreeSpecialFile guifg=#C4A7E7 guibg=NONE guisp=NONE gui=underline cterm=underline
highlight NvimTreeSymlink guifg=#9CCFD8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight NvimTreeVertSplit guifg=bg guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Pmenu guifg=NONE guibg=#312E43 guisp=NONE gui=NONE cterm=NONE
highlight PmenuSbar guifg=NONE guibg=#6B6788 guisp=NONE gui=NONE cterm=NONE
highlight PmenuSel guifg=NONE guibg=#4A4563 guisp=NONE gui=NONE cterm=NONE
highlight PmenuThumb guifg=NONE guibg=#84809D guisp=NONE gui=NONE cterm=NONE
highlight Search guifg=#E1D4D4 guibg=#673592 guisp=NONE gui=NONE cterm=NONE
highlight! link MatchParen Search
highlight! link Sneak Search
highlight! link LightspeedPendingOpArea SneakLabel
highlight SneakLabelMask guifg=#C4A7E7 guibg=#C4A7E7 guisp=NONE gui=NONE cterm=NONE
highlight Special guifg=#9CCFD8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link TSNamespace Special
highlight! link TSTag Special
highlight! link WhichKeyGroup Special
highlight! link helpHyperTextEntry Special
highlight! link markdownH4 Special
highlight! link markdownH5 Special
highlight! link markdownH6 Special
highlight SpecialComment guifg=#69657E guibg=NONE guisp=NONE gui=bold cterm=bold
highlight SpecialKey guifg=#565172 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight SpellBad guifg=#D67E95 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link CocSelectedText SpellBad
highlight SpellCap guifg=#D67E95 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight! link SpellLocal SpellCap
highlight SpellRare guifg=#D67E95 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
highlight Statement guifg=#317490 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link PreProc Statement
highlight! link WhichKey Statement
highlight! link markdownH2 Statement
highlight! link markdownH3 Statement
highlight StatusLine guifg=#E1D4D4 guibg=#3A364E guisp=NONE gui=NONE cterm=NONE
highlight! link TabLine StatusLine
highlight StatusLineNC guifg=#E9E0E0 guibg=#2F2C40 guisp=NONE gui=NONE cterm=NONE
highlight! link TabLineFill StatusLineNC
highlight TSConstant guifg=#CAB0AF guibg=NONE guisp=NONE gui=bold cterm=bold
highlight TabLineSel guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight! link BufferCurrent TabLineSel
highlight TelescopeBorder guifg=#7A7695 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight TelescopeMatching guifg=#C4A7E7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight TelescopeSelectionCaret guifg=#EB7193 guibg=#222030 guisp=NONE gui=NONE cterm=NONE
highlight Title guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
highlight Todo guifg=NONE guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
highlight Type guifg=#DFDEF1 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link helpSpecial Type
highlight Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline cterm=underline
highlight VertSplit guifg=#625D7F guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight Visual guifg=NONE guibg=#523A39 guisp=NONE gui=NONE cterm=NONE
highlight WarningMsg guifg=#F6C074 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link DiagnosticWarn WarningMsg
highlight! link TSWarning WarningMsg
highlight! link gitcommitOverflow WarningMsg
highlight WildMenu guifg=#1A1825 guibg=#C4A7E7 guisp=NONE gui=NONE cterm=NONE
highlight! link SneakLabel WildMenu
highlight diffAdded guifg=#317490 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitNew diffAdded
highlight diffChanged guifg=#9CCFD8 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitDirty diffChanged
highlight diffFile guifg=#F6C074 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight diffIndexLine guifg=#F6C074 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight diffLine guifg=#C4A7E7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight diffNewFile guifg=#317490 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight diffOldFile guifg=#EB7193 guibg=NONE guisp=NONE gui=italic cterm=italic
highlight diffRemoved guifg=#EB7193 guibg=NONE guisp=NONE gui=NONE cterm=NONE
highlight! link NvimTreeGitDeleted diffRemoved
highlight lCursor guifg=#1A1825 guibg=#B27F7C guisp=NONE gui=NONE cterm=NONE
highlight! link TermCursorNC lCursor
highlight markdownH1 guifg=#E1D4D4 guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline

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
