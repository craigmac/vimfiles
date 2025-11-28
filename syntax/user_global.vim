" ref. `:h mysyntaxfile`, `:h syntax-loading` and `:h user_44.txt` for tutorial
"
" syntax rules are loaded everytime vim starts, so should only contain global
" syntax rules, not tied to any filetype. adding onto existing filetype syntax
" rules should be done in e.g., `after/syntax/python.vim`

" add some more matches for hl-Todo:
syntax keyword Todo contained HACK BUG FIX NOTE WARN FEAT

