" Show the body width boundary
setlocal colorcolumn=73
setlocal textwidth=72

" Warning if only first is over 50 characters long.
match ErrorMsg /\%1l.\%>51v/

" Turn on good spelling.
setlocal spell
