" My settings for netrw buffers
" use :NetrwSettings to see all current settings available to set and their
" values

" turn off banner
let g:netrw_banner=0
" show hidden files
let g:netrw_hide=1
" use tree-style listing
let g:netrw_liststyle=3
" human-readable file size listings
let g:netrw_sizestyle="H"
" 'a' to toggle between normal/hiding these/only these displayed
let g:netrw_list_hide= netrw_gitignore#Hide()
" use echoerr instead of temp window you have to close
let g:netrw_use_errorwindow = 2



