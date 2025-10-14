" https://github.com/justinmk/vim-sneak

if exists("g:loaded_sneak_plugin") | finish | endif

" label-mode ensures precise jump the first time, no ; or , required.
" sneak provided operator '[y|d|c|gc]z{object}' is also useful and quicker 'd/' with label-mode on.
let g:sneak#label = 1

" never think about search direction again, ; is forwards and , goes backwards
let g:sneak#absolute_dir = 1

" respect user 'ignorecase and 'smartcase values
let g:sneak#use_ic_scs = 1

" don't use sneak bindings in netrw buffers, keep 's' for 'sort'
let g:sneak#map_netrw = 0

" make f/F and t/T use label-mode (copied from docs)
nnoremap <silent> f :<C-U>call sneak#wrap('',           1, 0, 1, 2)<CR>
nnoremap <silent> F :<C-U>call sneak#wrap('',           1, 1, 1, 2)<CR>
xnoremap <silent> f :<C-U>call sneak#wrap(visualmode(), 1, 0, 1, 2)<CR>
xnoremap <silent> F :<C-U>call sneak#wrap(visualmode(), 1, 1, 1, 2)<CR>
onoremap <silent> f :<C-U>call sneak#wrap(v:operator,   1, 0, 1, 2)<CR>
onoremap <silent> F :<C-U>call sneak#wrap(v:operator,   1, 1, 1, 2)<CR>

nnoremap <silent> t :<C-U>call sneak#wrap('',           1, 0, 0, 2)<CR>
nnoremap <silent> T :<C-U>call sneak#wrap('',           1, 1, 0, 2)<CR>
xnoremap <silent> t :<C-U>call sneak#wrap(visualmode(), 1, 0, 0, 2)<CR>
xnoremap <silent> T :<C-U>call sneak#wrap(visualmode(), 1, 1, 0, 2)<CR>
onoremap <silent> t :<C-U>call sneak#wrap(v:operator,   1, 0, 0, 2)<CR>
onoremap <silent> T :<C-U>call sneak#wrap(v:operator,   1, 1, 0, 2)<CR>
