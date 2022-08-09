setlocal nonumber
setlocal norelativenumber
setlocal nospell
setlocal nolist
setlocal nofoldenable
nnoremap <buffer> <CR> <C-]>

function! s:search_term()
	" finds options ("), help tags (|), and commands (`)
	let conceal_marker = '[' . "'" . '|' . '`' . ']'
	let pat = conceal_marker . '\zs\k\+\ze' . conceal_marker
	call search(pat, '', 0, 0,	{ 
				\ -> synID(line('.'), col('.'), 0) == 106 || synID(line('.'), col('.'), 0) == 0
				\ })
endfunction

nnoremap <silent> <buffer> <Tab> <cmd>call <SID>search_term()<CR>
