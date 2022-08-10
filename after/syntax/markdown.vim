" File: after/syntax/markdown.vim
" Author: C.D. MacEachern
" Description: Additional liquid tags syntax groups for vim-markdown

syntax match liquidTag "{%\s\+.\+_.\+\s\+%}"
syntax match markdownInlineCode "`[^`]\+`"

highlight! link liquidTag String
highlight! link markdownInlineCode String


