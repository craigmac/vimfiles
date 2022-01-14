" use 'dictionary' value for words
setlocal complete+=k
setlocal spell
setlocal foldlevel=99

compiler vale

" TODO: could be made more robust to support other style Mardown headings
let &l:define = '\v^#+\s*.+$'

" in vimrc my CCR() fn handles the CR here so need nmap to trigger it
nmap <buffer> gO :dlist /<CR>
