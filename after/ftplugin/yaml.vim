setlocal foldmethod=indent
setlocal expandtab
setlocal list

" TODO: these were for python, adjust to valid regex for yaml toplevel key
" let b:next_toplevel='\v%$\|^(class\|def\|async def)>'
" let b:prev_toplevel='^(class\|def\|async def)>'

" if !exists('g:no_plugin_maps') && !exists('g:no_yaml_maps')
"   execute "nnoremap <silent> <buffer> ]] :call <SID>Yaml_jump('n', '". b:next_toplevel."', 'W', v:count1)<CR>"
"   execute "nnoremap <silent> <buffer> [[ :call <SID>Yaml_jump('n', '". b:prev_toplevel."', 'Wb', v:count1)<cr>"
" endif

" function! s:Yaml_jump () abort
" endfunction

if exists("b:undo_ftplugin") " because '..=' fails otherwise
  let b:undo_ftplugin ..= " | setl et< fdm< list< "
else
  let b:undo_ftplugin = "setl et< fdm< list<"
endif




