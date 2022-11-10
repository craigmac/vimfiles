setlocal nonumber
setlocal norelativenumber
setlocal nospell
setlocal nolist
setlocal nofoldenable
nnoremap <buffer> <CR> <C-]>

function! s:Search_term()
	" finds options ("), help tags (|), and commands (`)
	let conceal_marker = '[' . "'" . '|' . '`' . ']'
	let pat = conceal_marker . '\zs\k\+\ze' . conceal_marker
	call search(pat, '', 0, 0,	{ 
				\ -> synID(line('.'), col('.'), 0) == 106 || synID(line('.'), col('.'), 0) == 0
				\ })
endfunction

nnoremap <silent> <buffer> <Tab> <cmd>call <SID>Search_term()<CR>

if exists("b:undo_ftplugin")
	let b:undo_ftplugin ..= " | setl nu< rnu< spell< list< foldenable<"
else
	let b:undo_ftplugin = "setl nu< rnu< spell< list< foldenable<"
endif

