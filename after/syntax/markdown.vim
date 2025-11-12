" syntax matching and highlighting of 'liquid' tags
" embedded in markdown file: https://jekyllrb.com/docs/liquid/

syntax match liquidTag "{%\s\+.\+_.\+\s\+%}"
syntax match markdownInlineCode "`[^`]\+`"

highlight! link liquidTag String
highlight! link markdownInlineCode String


