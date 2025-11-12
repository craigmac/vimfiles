hi! clear

set background=dark

hi! SpecialKey term=bold ctermfg=9 guifg=bg
hi! EndOfBuffer links to NonText
hi! NonText term=bold ctermfg=9 gui=bold guifg=bg
hi! Directory term=bold ctermfg=11 guifg=Cyan
hi! ErrorMsg term=standout ctermfg=15 ctermbg=4 guifg=White guibg=Red
hi! IncSearch term=reverse cterm=reverse gui=reverse
hi! Search term=reverse ctermfg=0 ctermbg=14 guifg=Black guibg=Yellow
hi! CurSearch links to Search
hi! MoreMsg term=bold ctermfg=10 gui=bold guifg=SeaGreen
hi! ModeMsg term=bold cterm=bold gui=bold
hi! LineNr term=underline ctermfg=14 guifg=Grey50
hi! LineNrAbove cleared
hi! LineNrBelow cleared
hi! CursorLineNr term=bold cterm=underline ctermfg=14 gui=bold guifg=Grey100
hi! CursorLineSign links to SignColumn
hi! CursorLineFold links to FoldColumn
hi! Question term=standout ctermfg=10 gui=bold guifg=Green
hi! StatusLine term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi! StatusLineNC term=reverse cterm=reverse gui=reverse
hi! VertSplit term=reverse cterm=reverse
hi! Title term=bold ctermfg=13 gui=bold guifg=Magenta
hi! Visual term=reverse cterm=reverse guifg=LightGrey guibg=#575757
hi! VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline
hi! WarningMsg term=standout ctermfg=12 guifg=Red
hi! WildMenu term=standout ctermfg=0 ctermbg=14 guifg=Black guibg=Yellow
hi! Folded term=standout ctermfg=11 ctermbg=8 guifg=Cyan guibg=DarkGrey
hi! FoldColumn term=standout ctermfg=11 ctermbg=8 guifg=Cyan guibg=Grey
hi! DiffAdd term=bold ctermbg=1 guibg=DarkBlue
hi! DiffChange term=bold ctermbg=5 guibg=DarkMagenta
hi! DiffDelete term=bold ctermfg=9 ctermbg=3 gui=bold guifg=Blue
hi!                    guibg=DarkCyan
hi! DiffText term=reverse cterm=bold ctermbg=12 gui=bold guibg=Red
hi! DiffTextAdd links to DiffText
hi! SignColumn term=standout ctermfg=11 ctermbg=8 guifg=Cyan guibg=Grey
hi! Conceal ctermfg=7 ctermbg=8 guifg=LightGrey guibg=DarkGrey
hi! SpellBad term=reverse ctermbg=12 gui=undercurl guisp=Red
hi! SpellCap term=reverse ctermbg=9 gui=undercurl guisp=Blue
hi! SpellRare term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi! SpellLocal term=underline ctermbg=11 gui=undercurl guisp=Cyan
hi! Pmenu ctermfg=0 ctermbg=13 guibg=Magenta
hi! PmenuSel ctermfg=8 ctermbg=0 guibg=DarkGrey
hi! PmenuMatch links to Pmenu
hi! PmenuMatchSel links to PmenuSel
hi! PmenuKind links to Pmenu
hi! PmenuKindSel links to PmenuSel
hi! PmenuExtra links to Pmenu
hi! PmenuExtraSel links to PmenuSel
hi! PmenuSbar ctermbg=7 guibg=Grey
hi! PmenuThumb ctermbg=15 guibg=White
hi! PmenuBorder links to Pmenu
hi! PmenuShadow ctermfg=8 ctermbg=0 guifg=DarkGrey guibg=Black
hi! TabLine term=underline cterm=underline ctermfg=15 ctermbg=8
hi!                    gui=underline guibg=DarkGrey
hi! TabLineSel term=bold cterm=bold gui=bold
hi! TabLineFill term=reverse cterm=reverse gui=reverse
hi! CursorColumn term=reverse ctermbg=8 guibg=Grey40
hi! CursorLine term=underline cterm=underline guibg=Grey20
hi! ColorColumn term=reverse ctermbg=4 guibg=DarkRed
hi! QuickFixLine links to Search
hi! StatusLineTerm term=bold,reverse cterm=bold ctermfg=0 ctermbg=10 gui=bold
hi!                    guifg=bg guibg=LightGreen
hi!                    links to StatusLine
hi! StatusLineTermNC term=reverse ctermfg=0 ctermbg=10 guifg=bg
hi!                    guibg=LightGreen
hi!                    links to StatusLineNC
hi! MsgArea cleared
hi! ComplMatchIns cleared
hi! TabPanel links to Normal
hi! TabPanelSel links to TabLineSel
hi! TabPanelFill links to Normal
hi! PreInsert links to NonText
hi! Cursor guifg=bg guibg=fg
hi! lCursor guifg=bg guibg=fg
hi! TitleBar guifg=fg guibg=bg
hi! TitleBarNC cleared
hi! PopupSelected links to PmenuSel
hi! MessageWindow links to Pmenu
hi! PopupNotification links to Normal
hi! Added ctermfg=10 guifg=LimeGreen
hi! Normal guifg=Grey90 guibg=Grey10 font=Adwaita_Mono:h14:cANSI:qDRAFT
hi! MatchParen term=reverse ctermbg=3 guibg=DarkCyan
hi! ToolbarLine term=underline ctermbg=8 guibg=Grey50
hi! ToolbarButton cterm=bold ctermfg=0 ctermbg=7 gui=bold guifg=Black
hi!                    guibg=LightGrey
hi! Comment term=bold ctermfg=11 guifg=#80a0ff
hi! Constant term=underline ctermfg=13 guifg=#ffa0a0
hi! Special term=bold ctermfg=12 guifg=Orange
hi! Identifier term=underline cterm=bold ctermfg=11 guifg=#40ffff
hi! Statement term=bold ctermfg=14 gui=bold guifg=#ffff60
hi! PreProc term=underline ctermfg=9 guifg=#ff80ff
hi! Type term=underline ctermfg=10 gui=bold guifg=#60ff60
hi! Underlined term=underline cterm=underline ctermfg=9 gui=underline
hi!                    guifg=#80a0ff
hi! Ignore ctermfg=0 guifg=bg
hi! Changed ctermfg=9 guifg=DodgerBlue
hi! Removed ctermfg=12 guifg=Red
hi! Error term=reverse ctermfg=15 ctermbg=12 guifg=White guibg=Red
hi! Todo term=standout ctermfg=0 ctermbg=14 guifg=Blue guibg=Yellow
hi! Bold term=bold cterm=bold gui=bold
hi! Italic term=italic cterm=italic gui=italic
hi! BoldItalic term=bold,italic cterm=bold,italic gui=bold,italic
hi! String links to Constant
hi! Character links to Constant
hi! Number links to Constant
hi! Boolean links to Constant
hi! Float links to Number
hi! Function links to Identifier
hi! Conditional links to Statement
hi! Repeat links to Statement
hi! Label links to Statement
hi! Operator links to Statement
hi! Keyword links to Statement
hi! Exception links to Statement
hi! Include links to PreProc
hi! Define links to PreProc
hi! Macro links to PreProc
hi! PreCondit links to PreProc
hi! StorageClass links to Type
hi! Structure links to Type
hi! Typedef links to Type
hi! Tag links to Special
hi! SpecialChar links to Special
hi! Delimiter links to Special
hi! SpecialComment links to Special
hi! Debug links to Special
hi! User1 ctermfg=232 guifg=Black
hi! User2 guifg=White guibg=Red
hi! User3 guifg=Black guibg=Green
hi! User4 guifg=Black guibg=Yellow
hi! User5 guifg=White guibg=Blue
hi! User6 guifg=Black guibg=Magenta
hi! User7 guifg=Black guibg=Cyan
hi! User8 ctermfg=231 guifg=White
hi! Terminal links to Normal
hi! vimTodo links to Todo
hi! vimCommand links to Statement
hi! vimBang links to vimOper
hi! vimCommandModifier links to vimCommand
hi! vimCommandModifierBang links to vimBang
hi! vimStdPlugin cleared
hi! vimOption links to PreProc
hi! vimSetEqual cleared
hi! vimSetMod links to vimOption
hi! vimOptionVarName links to Identifier
hi! vimErrSetting links to vimError
hi! vimAutoEvent links to Type
hi! vimAutoEventSep cleared
hi! vimUserAutoEvent cleared
hi! vimUserAutoEventSep cleared
hi! vimAutocmdMod links to Special
hi! vimAutocmdBlock cleared
hi! vimGroup links to Type
hi! vimHLGroup links to vimGroup
hi! vimFuncName links to Function
hi! vimVimVarName links to Identifier
hi! vim9Null links to Constant
hi! vim9Boolean links to Boolean
hi! vimSubscript cleared
hi! vimGlobal cleared
hi! vimSubst1 links to vimSubst
hi! vimNumber links to Number
hi! vimAbb links to vimCommand
hi! vimAddress links to vimMark
hi! vimAt links to vimCommand
hi! vimAutocmd links to vimCommand
hi! vimAugroup cleared
hi! vimBehave links to vimCommand
hi! vimCall links to vimCommand
hi! vimCatch links to vimCommand
hi! vimConst links to vimCommand
hi! vimDoautocmd links to vimCommand
hi! vimDebuggreedy links to vimCommand
hi! vimDef links to vimCommand
hi! vimDefFold cleared
hi! vimDefer links to vimCommand
hi! vimDelcommand links to vimCommand
hi! vimDelFunction links to vimCommand
hi! vimElse links to vimCommand
hi! vimEnddef links to vimCommand
hi! vimEndfunction links to vimCommand
hi! vimEndif links to vimCommand
hi! vimEval links to vimCommand
hi! vimExecute cleared
hi! vimIsCommand cleared
hi! vimExtCmd cleared
hi! vimExFilter links to vimCommand
hi! vimExMark links to vimCommand
hi! vimFiletype cleared
hi! vimFor links to vimCommand
hi! vimFunction links to vimCommand
hi! vimFunctionFold cleared
hi! vimGrep links to vimCommand
hi! vimGrepAdd links to vimCommand
hi! vimHelpgrep links to vimCommand
hi! vimHighlight links to vimCommand
hi! vimImport links to vimCommand
hi! vimLet links to vimCommand
hi! vimLoadkeymap cleared
hi! vimLockvar links to vimCommand
hi! vimMake links to vimCommand
hi! vimMap links to vimCommand
hi! vimMark links to Number
hi! vimMatch links to vimCommand
hi! vimNotFunc links to vimCommand
hi! vimNormal links to vimCommand
hi! vimProfdel links to vimCommand
hi! vimProfile links to vimCommand
hi! vimRedir links to vimCommand
hi! vimSet links to vimCommand
hi! vimSleep links to vimCommand
hi! vimSort links to vimCommand
hi! vimSyntax links to vimCommand
hi! vimSyntime links to vimCommand
hi! vimSynColor links to vimCommand
hi! vimSynLink links to vimCommand
hi! vimTerminal links to vimCommand
hi! vimThrow links to vimCommand
hi! vimUniq links to vimCommand
hi! vimUnlet links to vimCommand
hi! vimUnlockvar links to vimCommand
hi! vimUnmap links to vimMap
hi! vimUserCmd links to vimCommand
hi! vimVimgrep links to vimCommand
hi! vimVimgrepadd links to vimCommand
hi! vimWincmd links to vimCommand
hi! vimMenu links to vimCommand
hi! vimMenutranslate cleared
hi! vimLua links to vimCommand
hi! vimMzScheme links to vimCommand
hi! vimPerl links to vimCommand
hi! vimPython links to vimCommand
hi! vimPython3 links to vimCommand
hi! vimPythonX links to vimCommand
hi! vimRuby links to vimCommand
hi! vimTcl links to vimCommand
hi! vim9Abstract links to vimCommand
hi! vim9Class links to vimCommand
hi! vim9Const links to vimCommand
hi! vim9Enum links to vimCommand
hi! vim9Export links to vimCommand
hi! vim9Final links to vimCommand
hi! vim9For links to vimCommand
hi! vim9Interface links to vimCommand
hi! vim9Type links to vimCommand
hi! vim9Var links to vimCommand
hi! vimCmdSep cleared
hi! vimCount links to Number
hi! vimWhitespace cleared
hi! vimSubscriptBracket cleared
hi! vim9Super links to Identifier
hi! vim9This links to Identifier
hi! vimVar links to Normal
hi! vimVarScope links to Identifier
hi! vimFBVar links to vimVar
hi! vimVimVar links to Identifier
hi! vimVarNameError cleared
hi! vimOptionVar links to Identifier
hi! vimEnvvar links to PreProc
hi! vimLetRegister links to vimRegister
hi! vim9TypeArgs cleared
hi! vim9LhsVariable links to vimVar
hi! vimLetHeredoc links to vimString
hi! vimOper links to Operator
hi! vim9LhsVariableList cleared
hi! vim9LhsRegister links to vimLetRegister
hi! vimOperParen cleared
hi! vimLambda cleared
hi! vimString links to String
hi! vim9LambdaParams cleared
hi! vimInsert links to vimString
hi! vimBehaveError links to vimError
hi! vimBehaveBang links to vimBang
hi! vimBehaveModel links to vimBehave
hi! vimCatchPattern cleared
hi! vim9ClassBody cleared
hi! vim9Def cleared
hi! vim9EnumBody cleared
hi! vim9InterfaceBody cleared
hi! vimFTCmd links to vimCommand
hi! vimFTOption links to vimSynType
hi! vimFTError links to vimError
hi! vimImportAutoload links to Special
hi! vimImportFilename cleared
hi! vimImportName cleared
hi! vim9Comment links to Comment
hi! vimFilter cleared
hi! vimLineComment links to vimComment
hi! vimSpecFile links to Identifier
hi! vimSubst links to vimCommand
hi! vimRegister links to SpecialChar
hi! vimCmplxRepeat links to SpecialChar
hi! vimNotation links to Special
hi! vimCtrlChar links to SpecialChar
hi! vimContinue links to Special
hi! vimAugroupKey links to vimCommand
hi! vimAugroupEnd cleared
hi! vimAugroupError links to vimError
hi! vimComment links to Comment
hi! vimAugroupName cleared
hi! vimAugroupBang links to vimBang
hi! vim9LineComment links to vimComment
hi! vimContinueString links to vimString
hi! vimParenSep links to Delimiter
hi! vimSep links to Delimiter
hi! vimOperError links to Error
hi! vimOperContinue links to vimContinue
hi! vimOperContinueComment links to vimContinueComment
hi! vimLambdaOperator links to vimOper
hi! vimLambdaBrace links to Delimiter
hi! vimLambdaParams cleared
hi! vimFunctionParam links to vimVar
hi! vim9LambdaBlock cleared
hi! vim9LambdaOperatorComment links to vim9Comment
hi! vim9LambdaOperator links to vimOper
hi! vim9LambdaParen links to vimParenSep
hi! vimDefParam links to vimVar
hi! vim9LambdaReturnType cleared
hi! vimSearch links to vimString
hi! vim9Block cleared
hi! vim9Search links to vimString
hi! vimFunctionPattern cleared
hi! vimFunctionName cleared
hi! vimFunctionBang links to vimBang
hi! vimDefName cleared
hi! vimDefBang links to vimBang
hi! vimFunctionSID links to vimNotation
hi! vimFunctionScope links to vimVarScope
hi! vimFunctionParams cleared
hi! vimFunctionError links to vimError
hi! vimDefTypeParams cleared
hi! vimDefParams cleared
hi! vimFunctionBody cleared
hi! vimFunctionComment links to vimComment
hi! vimDefBody cleared
hi! vimDefComment links to vim9Comment
hi! vimFunctionMod links to Special
hi! vim9CommentError links to vimError
hi! vimReturnType cleared
hi! vimCommentError links to vimError
hi! vimFunctionParamEquals links to vimOper
hi! vim9DefTypeParam cleared
hi! vimParamType cleared
hi! vimDelfunctionBang links to vimBang
hi! vimTypeSep cleared
hi! vimType links to Type
hi! vimTypeAny links to vimType
hi! vimTypeObject links to vimType
hi! vimUserType cleared
hi! vimCompoundType cleared
hi! vim9MethodDefName cleared
hi! vim9ConstructorDefName cleared
hi! vim9MethodDef links to vimCommand
hi! vim9MethodDefParams cleared
hi! vim9MethodDefTypeParams cleared
hi! vim9MethodDefBody cleared
hi! vim9MethodDefComment links to vimDefComment
hi! vim9MethodDefReturnType cleared
hi! vim9ConstructorDefParams cleared
hi! vim9ConstuctorDefTypeParams cleared
hi! vim9ConstructorDefParam links to vimVar
hi! vim9MethodNameError links to vimFunctionError
hi! vim9MethodName links to vimFuncName
hi! vim9MethodDefFold cleared
hi! vim9Extends links to Keyword
hi! vim9Implements links to Keyword
hi! vim9Public links to vimCommand
hi! vim9Static links to vimCommand
hi! vim9ClassName cleared
hi! vim9SuperClass cleared
hi! vim9InterfaceListComma cleared
hi! vim9ImplementedInterface cleared
hi! vim9AbstractDef links to vimCommand
hi! vim9EnumName cleared
hi! vim9EnumNameTrailing cleared
hi! vim9EnumNameEmpty cleared
hi! vim9EnumNameComment links to vim9Comment
hi! vim9EnumImplements links to vim9Implements
hi! vim9EnumValue cleared
hi! vimCommentString links to vimString
hi! vim9EnumNameContinue links to vimContinue
hi! vim9EnumNameContinueComment links to vim9Comment
hi! vim9EnumValueTypeArgs cleared
hi! vim9EnumValueArgList cleared
hi! vim9EnumValueListComma cleared
hi! vim9EnumValueListCommaComment links to vim9Comment
hi! vim9EnumImplementedInterface cleared
hi! vim9EnumInterfaceListComma cleared
hi! vim9EnumImplementedInterfaceComment links to vim9Comment
hi! vim9InterfaceName cleared
hi! vim9AbstractDefName cleared
hi! vim9AbstractDefParams cleared
hi! vim9AbstractDefTypeParams cleared
hi! vim9AbstractDefReturnType cleared
hi! vim9TypeAlias cleared
hi! vim9TypeAliasError links to vimError
hi! vim9TypeEquals links to vimOper
hi! vimKeymapLhs cleared
hi! vimKeymapStart cleared
hi! vimKeymapRhs cleared
hi! vimKeymapTailComment links to vimComment
hi! vim9CommentTitle links to PreProc
hi! vim9KeymapLineComment links to vimKeymapLineComment
hi! vimCommentTitle links to PreProc
hi! vimSpecFileMod links to vimSpecFile
hi! vimEscapeBrace cleared
hi! vimSubstRep cleared
hi! vimSubstRange cleared
hi! vimUserCmdAttrs cleared
hi! vimUserCmdName cleared
hi! vimUserCmdAttr links to Special
hi! vimUserCmdAttrError links to Error
hi! vimUserCmdAttrKey links to vimUserCmdAttr
hi! vimUserCmdAttrAddr links to vimSpecial
hi! vimUserCmdAttrComplete links to vimSpecial
hi! vimUserCmdError links to Error
hi! vimUserCmdAttrNargs links to vimSpecial
hi! vimUserCmdAttrRange links to vimSpecial
hi! vimUserCmdAttrCompleteFunc links to vimVar
hi! vimUserCmdBlock cleared
hi! vimUserCmdReplacement cleared
hi! vimComFilter cleared
hi! vimDelcommandAttr links to vimUserCmdAttr
hi! vimDelcommandName cleared
hi! vimPatSepErr links to vimError
hi! vimPatSep links to SpecialChar
hi! vimPatSepZ links to vimPatSep
hi! vimPatSepZone links to vimString
hi! vimPatSepR links to vimPatSep
hi! vimPatRegion cleared
hi! vimNotPatSep links to vimString
hi! vimEscape links to Special
hi! vimStringEnd links to vimString
hi! vimQuoteEscape links to vimEscape
hi! vimStringInterpolationExpr cleared
hi! vimStringInterpolationBrace links to vimEscape
hi! vimSubstTwoBS links to vimString
hi! vimSubstSubstr links to SpecialChar
hi! vimCollection cleared
hi! vimSubstPat cleared
hi! vimSubstFlags links to Special
hi! vimSubstCount links to Number
hi! vimSubstFlagErr links to vimError
hi! vimSubstDelim links to Delimiter
hi! vimSubstRep4 cleared
hi! vimCollClass cleared
hi! vimCollClassErr links to vimError
hi! vimMarkArg cleared
hi! vimMarkArgError links to vimError
hi! vimMarkNumber links to vimNumber
hi! vimPlainMark links to vimMark
hi! vimRange cleared
hi! vimAtArg links to Special
hi! vimSetBang links to vimBang
hi! vimSetArgs cleared
hi! vimSetComment links to vimComment
hi! vimSetCmdSep cleared
hi! vimSetEscape cleared
hi! vimSetBarEscape cleared
hi! vimSetQuoteEscape cleared
hi! vimSetAll links to vimOption
hi! vimSetTermcap links to vimOption
hi! vimSetSep links to vimSep
hi! vimVarList cleared
hi! vimLetVar links to vimVar
hi! vimLetVarSubscript cleared
hi! vimUnletBang links to vimBang
hi! vimUnletVars cleared
hi! vimLetHeredocStart links to Special
hi! vimLetHeredocStop links to Special
hi! vim9Variable links to vimVar
hi! vim9VariableList cleared
hi! vim9VariableTypeSep cleared
hi! vim9VariableType links to vimType
hi! vim9VariableTypeAny links to vimTypeAny
hi! vim9VariableTypeObject links to vimTypeObject
hi! vim9VariableCompoundType cleared
hi! vim9VariableUserType cleared
hi! vimLockvarBang links to vimBang
hi! vimLockvarDepth links to vimNumber
hi! vimLockvarVars cleared
hi! vim9ForInComment links to vim9Comment
hi! vimForInComment cleared
hi! vimForInContinue links to vimContinue
hi! vimForInContinueComment links to vimContinueComment
hi! vimMapMod links to vimBracket
hi! vimMapLhs cleared
hi! vimWildcardQuestion links to vimWildcard
hi! vimWildcardStar links to vimWildcard
hi! vimWildcardBraceComma links to vimWildcard
hi! vimWildcard links to Special
hi! vimWildcardEscape links to vimWildcard
hi! vimWildcardBrace cleared
hi! vimWildcardBracket links to vimWildcard
hi! vimWildcardIntervalNumber cleared
hi! vimWildcardInterval links to vimWildcard
hi! vimWildcardBracketStart links to vimWildcard
hi! vimWildcardBracketHyphen links to vimWildcard
hi! vimWildcardBracketEnd links to vimWildcard
hi! vimWildcardBracketCharacter links to Normal
hi! vimWildcardBracketRightBracket links to vimWildcardBracketCharacter
hi! vimWildcardBracketEscape links to vimWildcard
hi! vimWildcardBracketCharacterClass links to vimWildcard
hi! vimWildcardBracketEquivalenceClass links to vimWildcard
hi! vimWildcardBracketCollatingSymbol links to vimWildcard
hi! vimWildcardBracketCaret links to vimWildcard
hi! vimAutoEventGlob links to Type
hi! vimAutocmdGroup cleared
hi! vimAutocmdBang links to vimBang
hi! vimAutocmdPatternSep links to vimSep
hi! vimAutocmdPatternEscape links to Special
hi! vimAutocmdPattern cleared
hi! vimAutocmdBufferPattern links to Special
hi! vimDoautocmdMod links to Special
hi! vimEcho links to vimCommand
hi! vimEchohlNone links to vimGroup
hi! vimEchohl links to vimCommand
hi! vimExFilterBang links to vimBang
hi! vimExFilterPattern cleared
hi! vimGrepBang links to vimBang
hi! vimGrepArgs cleared
hi! vimGrepBarEscape cleared
hi! vimMakeBang links to vimBang
hi! vimMakeArgs cleared
hi! vimMakeBarEscape cleared
hi! vimHelpgrepBang cleared
hi! vimHelpgrepPattern cleared
hi! vimVimgrepBang links to vimBang
hi! vimVimgrepPattern cleared
hi! vimVimgrepFile cleared
hi! vimVimgrepFlags links to Special
hi! vimVimgrepEscape cleared
hi! vimVimgrepBarEscape cleared
hi! vimMapBang links to vimBang
hi! vimMapLeader links to vimBracket
hi! vimMapRhs cleared
hi! vimMapRhsContinue cleared
hi! vimMapModKey links to vimFunctionSID
hi! vimMapModErr links to vimError
hi! vimMapLeaderKey links to vimNotation
hi! vimMenuBang links to vimBang
hi! vimMenuMod links to vimMapMod
hi! vimMenuName links to PreProc
hi! vimMenuPriority links to Number
hi! vimMenuStatus links to Special
hi! vimMenuRhs cleared
hi! vimMenuRhsContinue cleared
hi! vimMenuNotation links to vimNotation
hi! vimMenuClear links to Special
hi! vimMenutranslateName cleared
hi! vimMenutranslateComment links to vimComment
hi! vimBracket links to Delimiter
hi! vimUsrCmd cleared
hi! vimCompilerSet links to vimCommand
hi! vimSynMenuPath links to vimMenuName
hi! vimSynMenu links to vimCommand
hi! vimSynMenuColon cleared
hi! vimSynMenuName cleared
hi! vimSynColorGroup cleared
hi! vimHiKeyList cleared
hi! vimSynLinkGroup cleared
hi! vimElseIfErr links to Error
hi! vimBufnrWarn links to vimWarn
hi! vimMatchGroup links to vimGroup
hi! vimMatchNone links to vimGroup
hi! vimMatchPattern cleared
hi! vimNormalArg cleared
hi! vimProfileArg links to vimSpecial
hi! vimProfileBang links to vimBang
hi! vimProfilePattern cleared
hi! vimProfdelArg links to vimSpecial
hi! vimRedirBang links to vimBang
hi! vimRedirFileOperator links to vimOper
hi! vimRedirVariableOperator links to vimOper
hi! vimRedirRegister links to vimRegister
hi! vimRedirEnd links to Special
hi! vimRedirFile cleared
hi! vimRedirRegisterOperator links to vimOper
hi! vimSleepBang links to vimBang
hi! vimSleepArg links to Constant
hi! vimSortBang links to vimBang
hi! vimSortPattern cleared
hi! vimSortOptionsError links to Error
hi! vimSortOptions links to Special
hi! vimTerminalOptions cleared
hi! vimTerminalCommand cleared
hi! vimTerminalContinue links to vimContinue
hi! vimTerminalContinueComment links to vimContinueComment
hi! vimTerminalOption links to vimSpecial
hi! vimTerminalKillOptionArg links to Constant
hi! vimTerminalSizeOptionArg links to Constant
hi! vimTerminalEofOptionArg cleared
hi! vimTerminalTypeOptionArg links to Constant
hi! vimTerminalApiOptionArg cleared
hi! vimUniqBang links to vimBang
hi! vimUniqPattern cleared
hi! vimUniqOptionsError cleared
hi! vimUniqOptions links to Special
hi! vimWincmdArg cleared
hi! vimGroupSpecial links to Special
hi! vimGroupList cleared
hi! vimSynError links to vimError
hi! vimSynContains links to vimSynOption
hi! vimSynKeyContainedin links to vimSynContains
hi! vimSynNextgroup links to vimSynOption
hi! vimSynCcharValue links to Character
hi! vimSynCchar links to vimSynOption
hi! vimSynType links to vimSpecial
hi! vimSynCase links to Type
hi! vimSynCaseError links to vimError
hi! vimClusterName cleared
hi! vimGroupName links to Normal
hi! vimGroupAdd links to vimSynOption
hi! vimGroupRem links to vimSynOption
hi! vimSynConceal links to Type
hi! vimSynConcealError links to vimError
hi! vimSynFoldlevel links to Type
hi! vimSynFoldlevelError links to vimError
hi! vimSynIskeyword links to Type
hi! vimSynIskeywordSep links to Delimiter
hi! vimSynKeyOpt links to vimSynOption
hi! vimSynKeyRegion cleared
hi! vimSynMtchOpt links to vimSynOption
hi! vimSynRegPat links to vimString
hi! vimMtchComment links to vimComment
hi! vimSynMatchRegion cleared
hi! vimSynPatRange links to vimString
hi! vimSynNotPatRange links to vimSynRegPat
hi! vimSynRegOpt links to vimSynOption
hi! vimSynReg links to Type
hi! vimSynMtchGrp links to vimSynOption
hi! vimSynRegion cleared
hi! vimSynPatMod cleared
hi! vimSynSpell links to Type
hi! vimSynSpellError links to vimError
hi! vimSyncClear links to Type
hi! vimSyncMatch links to Type
hi! vimSyncError links to vimError
hi! vimSyncRegion links to Type
hi! vimSyncArgs cleared
hi! vimSyncLines links to Type
hi! vimSyncLinebreak links to Type
hi! vimSyncLinecont links to Type
hi! vimSyncFromstart links to Type
hi! vimSyncCcomment links to Type
hi! vimSyncGroupName links to vimGroupName
hi! vimSyncKey links to Type
hi! vimSyncGroup links to vimGroupName
hi! vimSyncNone links to Type
hi! vimSyntimeArg links to vimSpecial
hi! vimHiLink cleared
hi! vimHiClear links to Type
hi! vimHiCtermError links to vimError
hi! vimHiBang links to vimBang
hi! vimHiGroup links to vimGroupName
hi! vimHiNone links to vimGroup
hi! vimHiAttrib links to PreProc
hi! vimFgBgAttrib links to vimHiAttrib
hi! vimHiAttribList links to vimError
hi! vimHiCtermColor links to Constant
hi! vimHiFontname cleared
hi! vimHiGuiFontname cleared
hi! vimHiGuiRgb links to vimNumber
hi! vimHiTerm links to Type
hi! vimHiCTerm links to vimHiTerm
hi! vimHiStartStop links to vimHiTerm
hi! vimHiCtermFgBg links to vimHiTerm
hi! vimHiCtermul links to vimHiTerm
hi! vimHiCtermfont links to vimHiTerm
hi! vimHiGui links to vimHiTerm
hi! vimHiGuiFont links to vimHiTerm
hi! vimHiGuiFgBg links to vimHiTerm
hi! vimHiKeyError links to vimError
hi! vimHiTermcap cleared
hi! vimHiNmbr links to Number
hi! luaMetaMethod links to Function
hi! luaParenError links to Error
hi! luaParen cleared
hi! luaError links to Error
hi! luaFunction links to Function
hi! luaFunctionBlock cleared
hi! luaCondElse links to Conditional
hi! luaCondEnd cleared
hi! luaCond links to Conditional
hi! luaCondElseif cleared
hi! luaCondStart cleared
hi! luaStatement links to Statement
hi! luaBlock cleared
hi! luaRepeat links to Repeat
hi! luaRepeatBlock cleared
hi! luaWhile cleared
hi! luaFor links to Repeat
hi! luaLabel links to Label
hi! luaOperator links to Operator
hi! luaSymbolOperator links to luaOperator
hi! luaTodo links to Todo
hi! luaComment links to Comment
hi! luaInnerComment cleared
hi! luaCommentDelimiter links to luaComment
hi! luaConstant links to Constant
hi! luaSpecial links to SpecialChar
hi! luaString2 links to String
hi! luaStringDelimiter links to luaString
hi! luaString links to String
hi! luaNumber links to Number
hi! luaTable links to Structure
hi! luaTableBlock cleared
hi! luaFunc links to Identifier
hi! vimLuaHeredoc cleared
hi! vimLuaStatement cleared
hi! vimScriptHeredocStart links to vimLetHeredocStart
hi! vimScriptHeredocStop links to vimLetHeredocStop
hi! vimMzSchemeHeredoc cleared
hi! vimMzSchemeStatement cleared
hi! vimPerlHeredoc cleared
hi! vimPerlStatement cleared
hi! vimPythonHeredoc cleared
hi! vimPythonStatement cleared
hi! vimPython3Heredoc cleared
hi! vimPython3Statement cleared
hi! vimPythonXHeredoc cleared
hi! vimPythonXStatement cleared
hi! vimRubyHeredoc cleared
hi! vimRubyStatement cleared
hi! vimTclHeredoc cleared
hi! vimTclStatement cleared
hi! vimFunc links to vimError
hi! vimUserFunc links to Normal
hi! vim9UserFunc cleared
hi! vim9Func links to vimError
hi! vimCommentTitleLeader cleared
hi! vim9CommentTitleLeader cleared
hi! vimShebang links to PreProc
hi! vimContinueComment links to vimComment
hi! vim9ContinueComment links to vimContinueComment
hi! vimSearchDelim links to Delimiter
hi! vim9SearchDelim links to Delimiter
hi! vim9LegacyHeader cleared
hi! vim9Vim9ScriptArg links to Special
hi! vim9Vim9Script links to vimCommand
hi! vimAugroupSyncA cleared
hi! vimError links to Error
hi! vimShebangError links to vimError
hi! vimSynIskeywordError links to vimError
hi! vimWarn links to WarningMsg
hi! vimCondHL links to vimCommand
hi! vimFuncEcho links to vimCommand
hi! vimSynOption links to Special
hi! vimImportAs links to vimImport
hi! vimKeymapLineComment links to vimComment
hi! vimMakeadd links to vimCommand
hi! vimNonText links to NonText
hi! vimPattern links to Type
hi! vimSpecial links to Type
hi! vimScriptDelim links to Comment
hi! vimStringCont links to vimString
hi! vimUserCmdKey links to vimCommand
hi! helpHeadline links to Statement
hi! helpSectionDelim links to PreProc
hi! helpIgnore links to Ignore
hi! helpExample links to Comment
hi! helpExampleHighlight_vim cleared
hi! helpExampleHighlight_vim9 cleared
hi! vim9LegacyHeader_HelpExample cleared
hi! helpHyperTextJump links to Identifier
hi! helpSpecial links to Special
hi! helpReturnType cleared
hi! helpHyperTextEntry links to String
hi! helpOption links to Type
hi! helpExCommand_Version cleared
hi! helpBar links to Ignore
hi! helpStar links to Ignore
hi! helpBacktick links to Ignore
hi! helpNormal cleared
hi! helpVim links to Identifier
hi! helpCommand links to Comment
hi! helpHeader links to PreProc
hi! helpGraphic cleared
hi! helpNote links to Todo
hi! helpWarning links to Todo
hi! helpDeprecated links to Todo
hi! helpLeadBlank cleared
hi! helpNotVi links to Special
hi! helpComment links to Comment
hi! helpConstant links to Constant
hi! helpString links to String
hi! helpCharacter links to Character
hi! helpNumber links to Number
hi! helpBoolean links to Boolean
hi! helpFloat links to Float
hi! helpIdentifier links to Identifier
hi! helpFunction links to Function
hi! helpStatement links to Statement
hi! helpConditional links to Conditional
hi! helpRepeat links to Repeat
hi! helpLabel links to Label
hi! helpOperator links to Operator
hi! helpKeyword links to Keyword
hi! helpException links to Exception
hi! helpPreProc links to PreProc
hi! helpInclude links to Include
hi! helpDefine links to Define
hi! helpMacro links to Macro
hi! helpPreCondit links to PreCondit
hi! helpType links to Type
hi! helpStorageClass links to StorageClass
hi! helpStructure links to Structure
hi! helpTypedef links to Typedef
hi! helpSpecialChar links to SpecialChar
hi! helpTag links to Tag
hi! helpDelimiter links to Delimiter
hi! helpSpecialComment links to SpecialComment
hi! helpDebug links to Debug
hi! helpUnderlined links to Underlined
hi! helpBold links to Bold
hi! helpItalic links to Italic
hi! helpBoldItalic links to BoldItalic
hi! helpError links to Error
hi! helpTodo links to Todo
hi! helpURL links to String
hi! helpDiffAdded links to Added
hi! helpDiffChanged links to Changed
hi! helpDiffRemoved links to Removed
