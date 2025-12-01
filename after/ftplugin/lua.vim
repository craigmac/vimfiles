" user overrides for $VIMRUNTIME/ftplugin/lua.vim

" default is 3, but 1 is closer to LuaJIT (it's based on 5.1)
let g:lua_subversion = 1

" vim runtime ftplugin for lua does not set any of these
" .editorconfig is preferred - use these otherwise (from nvim's stylua.toml)
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=-1
setlocal textwidth=100

" attempt to add `--[[ ... --]]` style comments, treesitter would be better
setlocal comments=:---,:--,s1:--\[\[,m:\ \ ,ex:--\]\]

let b:undo_ftplugin ..= " | setl cms< sw< sts< tw<"
