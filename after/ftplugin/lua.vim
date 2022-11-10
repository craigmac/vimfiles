setlocal noexpandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=-1
setlocal textwidth=100

" turn '.' into '/'
setlocal includeexpr=substitute(v:fname,'\\.','/','g')

" Try '/init.lua' tacked onto the end, as if you'd written
" `require('my/config/init')` when you wrote `require('my/config')`
let &l:suffixesadd .= "," .. v:fname .. "/init.lua"

" nnoremap <expr> <buffer> gf <SID>MyLuaGF()<CR>
" nnoremap <expr> <buffer> K <SID>MyLuaK()<CR>

" TODO: write. better K support by expanding help search on something
" like vim.api.nvim_... with cursor over 'n' in 'nvim_..' won't work
"function! s:MyLuaK() abort
	" K has to remain neutral in upstream, but if you're only using lua
	" for configuring neovim, we can do much better than just trying to call
	" 'man <word>'.
"endfunction

"function! s:MyLuaGF() abort
" TODO: write this to fix that awful 'gf' bug that just opens
" 'my.foldernamehere' bc it matches rather than trying to open
" 'my/foldernamehere/init.lua'. I believe I had something like
" this in ftplugin/vim.vim somewhere?
"endfunction

if exists("b:undo_ftplugin")
	let b:undo_ftplugin ..= " | setl et< sw< sts< ts< tw<"
else
	let b:undo_ftplugin = "setl et< sw< sts< ts< tw<"
endif

