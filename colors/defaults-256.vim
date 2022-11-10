" defaults but 0-15 values replaced with xterm 17-255 equivalents,
" for maximum support and consistency between 256+ color terminals
"
" Requirements:
" * 256-color capable terminal
" * User has not altered the 17-255 color range values
"
" original 16 => new xterm palette 17-255 equivalent
" 0 (black) => 232
" 1 (red) => 88
" 2 (green) => 28
" 3 (yellow) => 142
" 4 (blue) => 17
" 5 (magenta) => 90
" 6 (cyan) =>  24
" 7 (white) => 253
" 8 (grey) => 244
" 9 (bright red) => 196
" 10 (bright green) => 46
" 11 (bright yellow) => 226
" 12 (blue) => 20
" 13 (bright magenta) => 201
" 14 (bright cyan) => 51
" 15 (bright white) => 231

if !(&termguicolors) && &t_Co < 256
	echoerr '"defaults-256" colorscheme requires minimum or 256 color capable terminal.'
	finish
endif

highlight clear

let g:colors_name = 'defaults-256'

if &background ==# 'dark'
	highlight! ColorColumn ctermbg=88 guibg=DarkRed
	highlight! Comment ctermfg=51 guifg=#80a0ff
	highlight! Conceal ctermfg=253 ctermbg=242 guifg=LightGrey guibg=DarkGrey
	highlight! Constant ctermfg=201 guifg=#ffa0a0
	highlight! Cursor guifg=bg guibg=fg
	highlight! CursorColumn ctermbg=242 guibg=Grey40
	highlight! CursorLine cterm=underline guibg=Grey40
	highlight! CursorLineNr cterm=underline ctermfg=226 gui=bold guifg=Yellow
	highlight! DiagnosticError ctermfg=88 guifg=Red
	highlight! DiagnosticHint ctermfg=253 guifg=LightGrey
	highlight! DiagnosticInfo ctermfg=17 guifg=LightBlue
	highlight! DiagnosticUnderlineError cterm=underline gui=underline guisp=Red
	highlight! DiagnosticUnderlineHint cterm=underline gui=underline guisp=LightGrey
	highlight! DiagnosticUnderlineInfo cterm=underline gui=underline guisp=LightBlue
	highlight! DiagnosticUnderlineWarn cterm=underline gui=underline guisp=Orange
	highlight! DiagnosticWarn ctermfg=142 guifg=Orange
	highlight! DiffAdd ctermbg=17 guibg=DarkBlue
	highlight! DiffChange ctermbg=90 guibg=DarkMagenta
	highlight! DiffDelete ctermfg=20 ctermbg=24 gui=bold guifg=Blue guibg=DarkCyan
	highlight! DiffText cterm=bold ctermbg=196 gui=bold guibg=Red
	highlight! Directory ctermfg=159 guifg=Cyan
	highlight! Error ctermfg=231 ctermbg=196 guifg=White guibg=Red
	highlight! ErrorMsg ctermfg=231 ctermbg=88 guifg=White guibg=Red
	highlight! FloatShadow guibg=Black blend=80
	highlight! FloatShadowThrough guibg=Black blend=100
	highlight! FoldColumn ctermfg=51 ctermbg=242 guifg=Cyan guibg=Grey
	highlight! Folded ctermfg=51 ctermbg=242 guifg=Cyan guibg=DarkGrey
	highlight! Identifier cterm=bold ctermfg=51 guifg=#40ffff
	highlight! Ignore ctermfg=232 guifg=bg
	highlight! IncSearch cterm=reverse gui=reverse
	highlight! LineNr ctermfg=226 guifg=Yellow
	highlight! MatchParen ctermbg=24 guibg=DarkCyan
	highlight! ModeMsg cterm=bold gui=bold
	highlight! MoreMsg ctermfg=121 gui=bold guifg=SeaGreen
	highlight! MsgArea cterm=NONE ctermfg=231 ctermbg=232
	highlight! NonText ctermfg=20 gui=bold guifg=Blue
	highlight! NvimInternalError ctermfg=196 ctermbg=196 guifg=Red guibg=Red
	highlight! Pmenu ctermfg=232 ctermbg=201 guibg=Magenta
	highlight! PmenuSbar ctermbg=248 guibg=Grey
	highlight! PmenuSel ctermfg=242 ctermbg=232 guibg=DarkGrey
	highlight! PmenuThumb ctermbg=231 guibg=White
	highlight! PreProc ctermfg=81 guifg=#ff80ff
	highlight! Question ctermfg=121 gui=bold guifg=Green
	highlight! RedrawDebugClear ctermbg=226 guibg=Yellow
	highlight! RedrawDebugComposed ctermbg=46 guibg=Green
	highlight! RedrawDebugNormal cterm=reverse gui=reverse
	highlight! RedrawDebugRecompose ctermbg=196 guibg=Red
	highlight! Search ctermfg=232 ctermbg=226 guifg=Black guibg=Yellow
	highlight! SignColumn ctermfg=51 ctermbg=242 guifg=Cyan guibg=Grey
	highlight! Special ctermfg=224 guifg=Orange
	highlight! SpecialKey ctermfg=81 guifg=Cyan
	highlight! SpellBad ctermbg=196 gui=undercurl guisp=Red
	highlight! SpellCap ctermbg=20 gui=undercurl guisp=Blue
	highlight! SpellLocal ctermbg=51 gui=undercurl guisp=Cyan
	highlight! SpellRare ctermbg=201 gui=undercurl guisp=Magenta
	highlight! Statement ctermfg=226 gui=bold guifg=#ffff60
	highlight! StatusLine cterm=bold,reverse gui=bold,reverse
	highlight! StatusLineNC cterm=reverse gui=reverse
	highlight! TabLine cterm=underline ctermfg=231 ctermbg=242 gui=underline guibg=DarkGrey
	highlight! TabLineFill cterm=reverse gui=reverse
	highlight! TabLineSel cterm=bold gui=bold
	highlight! TermCursor cterm=reverse gui=reverse
	highlight! Title ctermfg=225 gui=bold guifg=Magenta
	highlight! Todo ctermfg=232 ctermbg=226 guifg=Blue guibg=Yellow
	highlight! Type ctermfg=121 gui=bold guifg=#60ff60
	highlight! Underlined cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
	highlight! Visual ctermbg=242 guibg=DarkGrey
	highlight! link VisualNC Visual
	highlight! WarningMsg ctermfg=224 guifg=Red
	highlight! WildMenu ctermfg=232 ctermbg=226 guifg=Black guibg=Yellow
	highlight! WinBar cterm=bold gui=bold
	highlight! lCursor guifg=bg guibg=fg

	" Links
	highlight! link Boolean Constant
	highlight! link Character Constant
	highlight! link Conditional Statement
	highlight! link CurSearch IncSearch
	highlight! link CursorLineFold FoldColumn
	highlight! link CursorLineSign SignColumn
	highlight! link Debug Special
	highlight! link Define PreProc
	highlight! link Delimiter Special
	highlight! link DiagnosticFloatingError DiagnosticError
	highlight! link DiagnosticFloatingHint DiagnosticHint
	highlight! link DiagnosticFloatingInfo DiagnosticInfo
	highlight! link DiagnosticFloatingWarn DiagnosticWarn
	highlight! link DiagnosticSignError DiagnosticError
	highlight! link DiagnosticSignHint DiagnosticHint
	highlight! link DiagnosticSignInfo DiagnosticInfo
	highlight! link DiagnosticSignWarn DiagnosticWarn
	highlight! link DiagnosticVirtualTextError DiagnosticError
	highlight! link DiagnosticVirtualTextHint DiagnosticHint
	highlight! link DiagnosticVirtualTextInfo DiagnosticInfo
	highlight! link DiagnosticVirtualTextWarn DiagnosticWarn
	highlight! link EndOfBuffer NonText
	highlight! link Exception Statement
	highlight! link Float Number
	highlight! link FloatBorder WinSeparator
	highlight! link Function Identifier
	highlight! link Include PreProc
	highlight! link Keyword Statement
	highlight! link Label Statement
	highlight! link LineNrAbove LineNr
	highlight! link LineNrBelow LineNr
	highlight! link Macro PreProc
	highlight! link MsgSeparator StatusLine
	highlight! link NormalFloat Pmenu
	highlight! link NormalNC Normal
	highlight! link Number Constant
	highlight! link NvimAnd NvimBinaryOperator
	highlight! link NvimArrow Delimiter
	highlight! link NvimAssignment Operator
	highlight! link NvimAssignmentWithAddition NvimAugmentedAssignment
	highlight! link NvimAssignmentWithConcatenation NvimAugmentedAssignment
	highlight! link NvimAssignmentWithSubtraction NvimAugmentedAssignment
	highlight! link NvimAugmentedAssignment NvimAssignment
	highlight! link NvimBinaryMinus NvimBinaryOperator
	highlight! link NvimBinaryOperator NvimOperator
	highlight! link NvimBinaryPlus NvimBinaryOperator
	highlight! link NvimCallingParenthesis NvimParenthesis
	highlight! link NvimColon Delimiter
	highlight! link NvimComma Delimiter
	highlight! link NvimComparison NvimBinaryOperator
	highlight! link NvimComparisonModifier NvimComparison
	highlight! link NvimConcat NvimBinaryOperator
	highlight! link NvimConcatOrSubscript NvimConcat
	highlight! link NvimContainer NvimParenthesis
	highlight! link NvimCurly NvimSubscript
	highlight! link NvimDict NvimContainer
	highlight! link NvimDivision NvimBinaryOperator
	highlight! link NvimDoubleQuote NvimStringQuote
	highlight! link NvimDoubleQuotedBody NvimStringBody
	highlight! link NvimDoubleQuotedEscape NvimStringSpecial
	highlight! link NvimDoubleQuotedUnknownEscape NvimInvalidValue
	highlight! link NvimEnvironmentName NvimIdentifier
	highlight! link NvimEnvironmentSigil NvimOptionSigil
	highlight! link NvimFigureBrace NvimInternalError
	highlight! link NvimFloat NvimNumber
	highlight! link NvimIdentifier Identifier
	highlight! link NvimIdentifierKey NvimIdentifier
	highlight! link NvimIdentifierName NvimIdentifier
	highlight! link NvimIdentifierScope NvimIdentifier
	highlight! link NvimIdentifierScopeDelimiter NvimIdentifier
	highlight! link NvimInvalid Error
	highlight! link NvimInvalidAnd NvimInvalidBinaryOperator
	highlight! link NvimInvalidArrow NvimInvalidDelimiter
	highlight! link NvimInvalidAssignment NvimInvalid
	highlight! link NvimInvalidAssignmentWithAddition NvimInvalidAugmentedAssignment
	highlight! link NvimInvalidAssignmentWithConcatenation NvimInvalidAugmentedAssignment
	highlight! link NvimInvalidAssignmentWithSubtraction NvimInvalidAugmentedAssignment
	highlight! link NvimInvalidAugmentedAssignment NvimInvalidAssignment
	highlight! link NvimInvalidBinaryMinus NvimInvalidBinaryOperator
	highlight! link NvimInvalidBinaryOperator NvimInvalidOperator
	highlight! link NvimInvalidBinaryPlus NvimInvalidBinaryOperator
	highlight! link NvimInvalidCallingParenthesis NvimInvalidParenthesis
	highlight! link NvimInvalidColon NvimInvalidDelimiter
	highlight! link NvimInvalidComma NvimInvalidDelimiter
	highlight! link NvimInvalidComparison NvimInvalidBinaryOperator
	highlight! link NvimInvalidComparisonModifier NvimInvalidComparison
	highlight! link NvimInvalidConcat NvimInvalidBinaryOperator
	highlight! link NvimInvalidConcatOrSubscript NvimInvalidConcat
	highlight! link NvimInvalidContainer NvimInvalidParenthesis
	highlight! link NvimInvalidCurly NvimInvalidSubscript
	highlight! link NvimInvalidDelimiter NvimInvalid
	highlight! link NvimInvalidDict NvimInvalidContainer
	highlight! link NvimInvalidDivision NvimInvalidBinaryOperator
	highlight! link NvimInvalidDoubleQuote NvimInvalidStringQuote
	highlight! link NvimInvalidDoubleQuotedBody NvimInvalidStringBody
	highlight! link NvimInvalidDoubleQuotedEscape NvimInvalidStringSpecial
	highlight! link NvimInvalidDoubleQuotedUnknownEscape NvimInvalidValue
	highlight! link NvimInvalidEnvironmentName NvimInvalidIdentifier
	highlight! link NvimInvalidEnvironmentSigil NvimInvalidOptionSigil
	highlight! link NvimInvalidFigureBrace NvimInvalidDelimiter
	highlight! link NvimInvalidFloat NvimInvalidNumber
	highlight! link NvimInvalidIdentifier NvimInvalidValue
	highlight! link NvimInvalidIdentifierKey NvimInvalidIdentifier
	highlight! link NvimInvalidIdentifierName NvimInvalidIdentifier
	highlight! link NvimInvalidIdentifierScope NvimInvalidIdentifier
	highlight! link NvimInvalidIdentifierScopeDelimiter NvimInvalidIdentifier
	highlight! link NvimInvalidLambda NvimInvalidParenthesis
	highlight! link NvimInvalidList NvimInvalidContainer
	highlight! link NvimInvalidMod NvimInvalidBinaryOperator
	highlight! link NvimInvalidMultiplication NvimInvalidBinaryOperator
	highlight! link NvimInvalidNestingParenthesis NvimInvalidParenthesis
	highlight! link NvimInvalidNot NvimInvalidUnaryOperator
	highlight! link NvimInvalidNumber NvimInvalidValue
	highlight! link NvimInvalidNumberPrefix NvimInvalidNumber
	highlight! link NvimInvalidOperator NvimInvalid
	highlight! link NvimInvalidOptionName NvimInvalidIdentifier
	highlight! link NvimInvalidOptionScope NvimInvalidIdentifierScope
	highlight! link NvimInvalidOptionScopeDelimiter NvimInvalidIdentifierScopeDelimiter
	highlight! link NvimInvalidOptionSigil NvimInvalidIdentifier
	highlight! link NvimInvalidOr NvimInvalidBinaryOperator
	highlight! link NvimInvalidParenthesis NvimInvalidDelimiter
	highlight! link NvimInvalidPlainAssignment NvimInvalidAssignment
	highlight! link NvimInvalidRegister NvimInvalidValue
	highlight! link NvimInvalidSingleQuote NvimInvalidStringQuote
	highlight! link NvimInvalidSingleQuotedBody NvimInvalidStringBody
	highlight! link NvimInvalidSingleQuotedQuote NvimInvalidStringSpecial
	highlight! link NvimInvalidSingleQuotedUnknownEscape NvimInternalError
	highlight! link NvimInvalidSpacing ErrorMsg
	highlight! link NvimInvalidString NvimInvalidValue
	highlight! link NvimInvalidStringBody NvimStringBody
	highlight! link NvimInvalidStringQuote NvimInvalidString
	highlight! link NvimInvalidStringSpecial NvimStringSpecial
	highlight! link NvimInvalidSubscript NvimInvalidParenthesis
	highlight! link NvimInvalidSubscriptBracket NvimInvalidSubscript
	highlight! link NvimInvalidSubscriptColon NvimInvalidSubscript
	highlight! link NvimInvalidTernary NvimInvalidOperator
	highlight! link NvimInvalidTernaryColon NvimInvalidTernary
	highlight! link NvimInvalidUnaryMinus NvimInvalidUnaryOperator
	highlight! link NvimInvalidUnaryOperator NvimInvalidOperator
	highlight! link NvimInvalidUnaryPlus NvimInvalidUnaryOperator
	highlight! link NvimInvalidValue NvimInvalid
	highlight! link NvimLambda NvimParenthesis
	highlight! link NvimList NvimContainer
	highlight! link NvimMod NvimBinaryOperator
	highlight! link NvimMultiplication NvimBinaryOperator
	highlight! link NvimNestingParenthesis NvimParenthesis
	highlight! link NvimNot NvimUnaryOperator
	highlight! link NvimNumber Number
	highlight! link NvimNumberPrefix Type
	highlight! link NvimOperator Operator
	highlight! link NvimOptionName NvimIdentifier
	highlight! link NvimOptionScope NvimIdentifierScope
	highlight! link NvimOptionScopeDelimiter NvimIdentifierScopeDelimiter
	highlight! link NvimOptionSigil Type
	highlight! link NvimOr NvimBinaryOperator
	highlight! link NvimParenthesis Delimiter
	highlight! link NvimPlainAssignment NvimAssignment
	highlight! link NvimRegister SpecialChar
	highlight! link NvimSingleQuote NvimStringQuote
	highlight! link NvimSingleQuotedBody NvimStringBody
	highlight! link NvimSingleQuotedQuote NvimStringSpecial
	highlight! link NvimSingleQuotedUnknownEscape NvimInternalError
	highlight! link NvimSpacing Normal
	highlight! link NvimString String
	highlight! link NvimStringBody NvimString
	highlight! link NvimStringQuote NvimString
	highlight! link NvimStringSpecial SpecialChar
	highlight! link NvimSubscript NvimParenthesis
	highlight! link NvimSubscriptBracket NvimSubscript
	highlight! link NvimSubscriptColon NvimSubscript
	highlight! link NvimTernary NvimOperator
	highlight! link NvimTernaryColon NvimTernary
	highlight! link NvimUnaryMinus NvimUnaryOperator
	highlight! link NvimUnaryOperator NvimOperator
	highlight! link NvimUnaryPlus NvimUnaryOperator
	highlight! link Operator Statement
	highlight! link PreCondit PreProc
	highlight! link QuickFixLine Search
	highlight! link Repeat Statement
	highlight! link SpecialChar Special
	highlight! link SpecialComment Special
	highlight! link StorageClass Type
	highlight! link String Constant
	highlight! link Structure Type
	highlight! link Substitute Search
	highlight! link Tag Special
	highlight! link TermCursorNC TermCursor
	highlight! link Typedef Type
	highlight! link VertSplit Normal
	highlight! link Whitespace NonText
	highlight! link WinBarNC WinBar
	highlight! link WinSeparator VertSplit
else
	highlight! ColorColumn ctermbg=224 guibg=LightRed
	highlight! Comment ctermfg=17 guifg=Blue
	highlight! Conceal ctermfg=253 ctermbg=242 guifg=LightGrey guibg=DarkGrey
	highlight! Constant ctermfg=88 guifg=Magenta
	highlight! Cursor guifg=bg guibg=fg
	highlight! CursorColumn ctermbg=253 guibg=Grey90
	highlight! CursorLine cterm=underline guibg=Grey90
	highlight! CursorLineNr cterm=underline ctermfg=130 gui=bold guifg=Brown
	highlight! DiagnosticError ctermfg=88 guifg=Red
	highlight! DiagnosticHint ctermfg=253 guifg=LightGrey
	highlight! DiagnosticInfo ctermfg=17 guifg=LightBlue
	highlight! DiagnosticUnderlineError cterm=underline gui=underline guisp=Red
	highlight! DiagnosticUnderlineHint cterm=underline gui=underline guisp=LightGrey
	highlight! DiagnosticUnderlineInfo cterm=underline gui=underline guisp=LightBlue
	highlight! DiagnosticUnderlineWarn cterm=underline gui=underline guisp=Orange
	highlight! DiagnosticWarn ctermfg=142 guifg=Orange
	highlight! DiffAdd ctermbg=81 guibg=LightBlue
	highlight! DiffChange ctermbg=225 guibg=LightMagenta
	highlight! DiffDelete ctermfg=20 ctermbg=159 gui=bold guifg=Blue guibg=LightCyan
	highlight! DiffText cterm=bold ctermbg=196 gui=bold guibg=Red
	highlight! Directory ctermfg=17 guifg=Blue
	highlight! Error ctermfg=231 ctermbg=196 guifg=White guibg=Red
	highlight! ErrorMsg ctermfg=231 ctermbg=88 guifg=White guibg=Red
	highlight! FloatShadow guibg=Black blend=80
	highlight! FloatShadowThrough guibg=Black blend=100
	highlight! FoldColumn ctermfg=17 ctermbg=248 guifg=DarkBlue guibg=Grey
	highlight! Folded ctermfg=17 ctermbg=248 guifg=DarkBlue guibg=LightGrey
	highlight! Identifier ctermfg=24 guifg=DarkCyan
	highlight! Ignore ctermfg=231 guifg=bg
	highlight! IncSearch cterm=reverse gui=reverse
	highlight! LineNr ctermfg=130 guifg=Brown
	highlight! MatchParen ctermbg=51 guibg=Cyan
	highlight! ModeMsg cterm=bold gui=bold
	highlight! MoreMsg ctermfg=28 gui=bold guifg=SeaGreen
	highlight! MsgArea cterm=NONE ctermfg=232 ctermbg=231
	highlight! NonText ctermfg=20 gui=bold guifg=Blue
	highlight! Normal cterm=NONE ctermfg=232 ctermbg=231
	highlight! NvimInternalError ctermfg=196 ctermbg=196 guifg=Red guibg=Red
	highlight! Pmenu ctermfg=232 ctermbg=225 guibg=LightMagenta
	highlight! PmenuSbar ctermbg=248 guibg=Grey
	highlight! PmenuSel ctermfg=232 ctermbg=253 guibg=Grey
	highlight! PmenuThumb ctermbg=232 guibg=Black
	highlight! PreProc ctermfg=90 guifg=#6a0dad
	highlight! Question ctermfg=28 gui=bold guifg=SeaGreen
	highlight! RedrawDebugClear ctermbg=226 guibg=Yellow
	highlight! RedrawDebugComposed ctermbg=46 guibg=Green
	highlight! RedrawDebugNormal cterm=reverse gui=reverse
	highlight! RedrawDebugRecompose ctermbg=196 guibg=Red
	highlight! Search ctermbg=226 guibg=Yellow
	highlight! SignColumn ctermfg=17 ctermbg=248 guifg=DarkBlue guibg=Grey
	highlight! Special ctermfg=90 guifg=#6a5acd
	highlight! SpecialKey ctermfg=17 guifg=Blue
	highlight! SpellBad ctermbg=224 gui=undercurl guisp=Red
	highlight! SpellCap ctermbg=81 gui=undercurl guisp=Blue
	highlight! SpellLocal ctermbg=51 gui=undercurl guisp=DarkCyan
	highlight! SpellRare ctermbg=225 gui=undercurl guisp=Magenta
	highlight! Statement ctermfg=130 gui=bold guifg=Brown
	highlight! StatusLine cterm=bold,reverse gui=bold,reverse
	highlight! StatusLineNC cterm=reverse gui=reverse
	highlight! TabLine cterm=underline ctermfg=232 ctermbg=253 gui=underline guibg=LightGrey
	highlight! TabLineFill cterm=reverse gui=reverse
	highlight! TabLineSel cterm=bold gui=bold
	highlight! TermCursor cterm=reverse gui=reverse
	highlight! Title ctermfg=90 gui=bold guifg=Magenta
	highlight! Todo ctermfg=232 ctermbg=226 guifg=Blue guibg=Yellow
	highlight! Type ctermfg=28 gui=bold guifg=SeaGreen
	highlight! Underlined cterm=underline ctermfg=90 gui=underline guifg=SlateBlue
	highlight! Visual ctermbg=253 guibg=LightGrey
	highlight! WarningMsg ctermfg=88 guifg=Red
	highlight! WildMenu ctermfg=232 ctermbg=226 guifg=Black guibg=Yellow
	highlight! WinBar cterm=bold gui=bold
	highlight! lCursor guifg=bg guibg=fg

	" Links
	highlight! link Boolean Constant
	highlight! link Character Constant
	highlight! link Conditional Statement
	highlight! link CurSearch IncSearch
	highlight! link CursorLineFold FoldColumn
	highlight! link CursorLineSign SignColumn
	highlight! link Debug Special
	highlight! link Define PreProc
	highlight! link Delimiter Special
	highlight! link DiagnosticFloatingError DiagnosticError
	highlight! link DiagnosticFloatingHint DiagnosticHint
	highlight! link DiagnosticFloatingInfo DiagnosticInfo
	highlight! link DiagnosticFloatingWarn DiagnosticWarn
	highlight! link DiagnosticSignError DiagnosticError
	highlight! link DiagnosticSignHint DiagnosticHint
	highlight! link DiagnosticSignInfo DiagnosticInfo
	highlight! link DiagnosticSignWarn DiagnosticWarn
	highlight! link DiagnosticVirtualTextError DiagnosticError
	highlight! link DiagnosticVirtualTextHint DiagnosticHint
	highlight! link DiagnosticVirtualTextInfo DiagnosticInfo
	highlight! link DiagnosticVirtualTextWarn DiagnosticWarn
	highlight! link EndOfBuffer NonText
	highlight! link Exception Statement
	highlight! link Float Number
	highlight! link FloatBorder WinSeparator
	highlight! link Function Identifier
	highlight! link Include PreProc
	highlight! link Keyword Statement
	highlight! link Label Statement
	highlight! link LineNrAbove LineNr
	highlight! link LineNrBelow LineNr
	highlight! link Macro PreProc
	highlight! link MsgSeparator StatusLine
	highlight! link NormalFloat Pmenu
	highlight! link NormalNC Normal
	highlight! link Number Constant
	highlight! link NvimAnd NvimBinaryOperator
	highlight! link NvimArrow Delimiter
	highlight! link NvimAssignment Operator
	highlight! link NvimAssignmentWithAddition NvimAugmentedAssignment
	highlight! link NvimAssignmentWithConcatenation NvimAugmentedAssignment
	highlight! link NvimAssignmentWithSubtraction NvimAugmentedAssignment
	highlight! link NvimAugmentedAssignment NvimAssignment
	highlight! link NvimBinaryMinus NvimBinaryOperator
	highlight! link NvimBinaryOperator NvimOperator
	highlight! link NvimBinaryPlus NvimBinaryOperator
	highlight! link NvimCallingParenthesis NvimParenthesis
	highlight! link NvimColon Delimiter
	highlight! link NvimComma Delimiter
	highlight! link NvimComparison NvimBinaryOperator
	highlight! link NvimComparisonModifier NvimComparison
	highlight! link NvimConcat NvimBinaryOperator
	highlight! link NvimConcatOrSubscript NvimConcat
	highlight! link NvimContainer NvimParenthesis
	highlight! link NvimCurly NvimSubscript
	highlight! link NvimDict NvimContainer
	highlight! link NvimDivision NvimBinaryOperator
	highlight! link NvimDoubleQuote NvimStringQuote
	highlight! link NvimDoubleQuotedBody NvimStringBody
	highlight! link NvimDoubleQuotedEscape NvimStringSpecial
	highlight! link NvimDoubleQuotedUnknownEscape NvimInvalidValue
	highlight! link NvimEnvironmentName NvimIdentifier
	highlight! link NvimEnvironmentSigil NvimOptionSigil
	highlight! link NvimFigureBrace NvimInternalError
	highlight! link NvimFloat NvimNumber
	highlight! link NvimIdentifier Identifier
	highlight! link NvimIdentifierKey NvimIdentifier
	highlight! link NvimIdentifierName NvimIdentifier
	highlight! link NvimIdentifierScope NvimIdentifier
	highlight! link NvimIdentifierScopeDelimiter NvimIdentifier
	highlight! link NvimInvalid Error
	highlight! link NvimInvalidAnd NvimInvalidBinaryOperator
	highlight! link NvimInvalidArrow NvimInvalidDelimiter
	highlight! link NvimInvalidAssignment NvimInvalid
	highlight! link NvimInvalidAssignmentWithAddition NvimInvalidAugmentedAssignment
	highlight! link NvimInvalidAssignmentWithConcatenation NvimInvalidAugmentedAssignment
	highlight! link NvimInvalidAssignmentWithSubtraction NvimInvalidAugmentedAssignment
	highlight! link NvimInvalidAugmentedAssignment NvimInvalidAssignment
	highlight! link NvimInvalidBinaryMinus NvimInvalidBinaryOperator
	highlight! link NvimInvalidBinaryOperator NvimInvalidOperator
	highlight! link NvimInvalidBinaryPlus NvimInvalidBinaryOperator
	highlight! link NvimInvalidCallingParenthesis NvimInvalidParenthesis
	highlight! link NvimInvalidColon NvimInvalidDelimiter
	highlight! link NvimInvalidComma NvimInvalidDelimiter
	highlight! link NvimInvalidComparison NvimInvalidBinaryOperator
	highlight! link NvimInvalidComparisonModifier NvimInvalidComparison
	highlight! link NvimInvalidConcat NvimInvalidBinaryOperator
	highlight! link NvimInvalidConcatOrSubscript NvimInvalidConcat
	highlight! link NvimInvalidContainer NvimInvalidParenthesis
	highlight! link NvimInvalidCurly NvimInvalidSubscript
	highlight! link NvimInvalidDelimiter NvimInvalid
	highlight! link NvimInvalidDict NvimInvalidContainer
	highlight! link NvimInvalidDivision NvimInvalidBinaryOperator
	highlight! link NvimInvalidDoubleQuote NvimInvalidStringQuote
	highlight! link NvimInvalidDoubleQuotedBody NvimInvalidStringBody
	highlight! link NvimInvalidDoubleQuotedEscape NvimInvalidStringSpecial
	highlight! link NvimInvalidDoubleQuotedUnknownEscape NvimInvalidValue
	highlight! link NvimInvalidEnvironmentName NvimInvalidIdentifier
	highlight! link NvimInvalidEnvironmentSigil NvimInvalidOptionSigil
	highlight! link NvimInvalidFigureBrace NvimInvalidDelimiter
	highlight! link NvimInvalidFloat NvimInvalidNumber
	highlight! link NvimInvalidIdentifier NvimInvalidValue
	highlight! link NvimInvalidIdentifierKey NvimInvalidIdentifier
	highlight! link NvimInvalidIdentifierName NvimInvalidIdentifier
	highlight! link NvimInvalidIdentifierScope NvimInvalidIdentifier
	highlight! link NvimInvalidIdentifierScopeDelimiter NvimInvalidIdentifier
	highlight! link NvimInvalidLambda NvimInvalidParenthesis
	highlight! link NvimInvalidList NvimInvalidContainer
	highlight! link NvimInvalidMod NvimInvalidBinaryOperator
	highlight! link NvimInvalidMultiplication NvimInvalidBinaryOperator
	highlight! link NvimInvalidNestingParenthesis NvimInvalidParenthesis
	highlight! link NvimInvalidNot NvimInvalidUnaryOperator
	highlight! link NvimInvalidNumber NvimInvalidValue
	highlight! link NvimInvalidNumberPrefix NvimInvalidNumber
	highlight! link NvimInvalidOperator NvimInvalid
	highlight! link NvimInvalidOptionName NvimInvalidIdentifier
	highlight! link NvimInvalidOptionScope NvimInvalidIdentifierScope
	highlight! link NvimInvalidOptionScopeDelimiter NvimInvalidIdentifierScopeDelimiter
	highlight! link NvimInvalidOptionSigil NvimInvalidIdentifier
	highlight! link NvimInvalidOr NvimInvalidBinaryOperator
	highlight! link NvimInvalidParenthesis NvimInvalidDelimiter
	highlight! link NvimInvalidPlainAssignment NvimInvalidAssignment
	highlight! link NvimInvalidRegister NvimInvalidValue
	highlight! link NvimInvalidSingleQuote NvimInvalidStringQuote
	highlight! link NvimInvalidSingleQuotedBody NvimInvalidStringBody
	highlight! link NvimInvalidSingleQuotedQuote NvimInvalidStringSpecial
	highlight! link NvimInvalidSingleQuotedUnknownEscape NvimInternalError
	highlight! link NvimInvalidSpacing ErrorMsg
	highlight! link NvimInvalidString NvimInvalidValue
	highlight! link NvimInvalidStringBody NvimStringBody
	highlight! link NvimInvalidStringQuote NvimInvalidString
	highlight! link NvimInvalidStringSpecial NvimStringSpecial
	highlight! link NvimInvalidSubscript NvimInvalidParenthesis
	highlight! link NvimInvalidSubscriptBracket NvimInvalidSubscript
	highlight! link NvimInvalidSubscriptColon NvimInvalidSubscript
	highlight! link NvimInvalidTernary NvimInvalidOperator
	highlight! link NvimInvalidTernaryColon NvimInvalidTernary
	highlight! link NvimInvalidUnaryMinus NvimInvalidUnaryOperator
	highlight! link NvimInvalidUnaryOperator NvimInvalidOperator
	highlight! link NvimInvalidUnaryPlus NvimInvalidUnaryOperator
	highlight! link NvimInvalidValue NvimInvalid
	highlight! link NvimLambda NvimParenthesis
	highlight! link NvimList NvimContainer
	highlight! link NvimMod NvimBinaryOperator
	highlight! link NvimMultiplication NvimBinaryOperator
	highlight! link NvimNestingParenthesis NvimParenthesis
	highlight! link NvimNot NvimUnaryOperator
	highlight! link NvimNumber Number
	highlight! link NvimNumberPrefix Type
	highlight! link NvimOperator Operator
	highlight! link NvimOptionName NvimIdentifier
	highlight! link NvimOptionScope NvimIdentifierScope
	highlight! link NvimOptionScopeDelimiter NvimIdentifierScopeDelimiter
	highlight! link NvimOptionSigil Type
	highlight! link NvimOr NvimBinaryOperator
	highlight! link NvimParenthesis Delimiter
	highlight! link NvimPlainAssignment NvimAssignment
	highlight! link NvimRegister SpecialChar
	highlight! link NvimSingleQuote NvimStringQuote
	highlight! link NvimSingleQuotedBody NvimStringBody
	highlight! link NvimSingleQuotedQuote NvimStringSpecial
	highlight! link NvimSingleQuotedUnknownEscape NvimInternalError
	highlight! link NvimSpacing Normal
	highlight! link NvimString String
	highlight! link NvimStringBody NvimString
	highlight! link NvimStringQuote NvimString
	highlight! link NvimStringSpecial SpecialChar
	highlight! link NvimSubscript NvimParenthesis
	highlight! link NvimSubscriptBracket NvimSubscript
	highlight! link NvimSubscriptColon NvimSubscript
	highlight! link NvimTernary NvimOperator
	highlight! link NvimTernaryColon NvimTernary
	highlight! link NvimUnaryMinus NvimUnaryOperator
	highlight! link NvimUnaryOperator NvimOperator
	highlight! link NvimUnaryPlus NvimUnaryOperator
	highlight! link Operator Statement
	highlight! link PreCondit PreProc
	highlight! link QuickFixLine Search
	highlight! link Repeat Statement
	highlight! link SpecialChar Special
	highlight! link SpecialComment Special
	highlight! link StorageClass Type
	highlight! link String Constant
	highlight! link Structure Type
	highlight! link Substitute Search
	highlight! link Tag Special
	highlight! link TermCursorNC TermCursor
	highlight! link Typedef Type
	highlight! link VertSplit Normal
	highlight! link VisualNC Visual
	highlight! link Whitespace NonText
	highlight! link WinBarNC WinBar
	highlight! link WinSeparator VertSplit
endif

" vi:fdm=indent:et:sw=2:sts=-1:ts=2:
