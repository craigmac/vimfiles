vim9script
#   ^^^ viking ^^^
#
# 	One's own house is best,
# 	small though it be;
# 	at home is every one his own master.
# 	Though he but two goats possess,
# 	and a straw-thatched cot,
# 	even that is better than begging.

# Functions {{{1

# Purpose: Outputs both the name of the syntax group, AND the translated syntax
# nnoremap <F2> <cmd>call g:SynGroup()<CR>
export def SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') .. ' -> ' .. synIDattr(synIDtrans(l:s), 'name')
enddef

# Purpose: Helper function to abstract away all the ways to check that we are running
# in a GUI. MacVim in particular is tricky because it ships with a 'mvim' binary
# that will report v:true that it has('gui_macvim'). To account for this we have
# to check for 'gui_running' as well.
# Usage: if UsingGuiVim() | echo 'yep we are GUI-scale' | endif
export def UsingGUIVim(): bool
	return (has('gui_macvim') && has('gui_running')) || has('gui_running')
enddef

# Commands {{{1

# Purpose: Redirect almost any internal or external command to a scratch buffer.
# Usage: :Redir scriptnames, :Redir version, :Redir !ls -la, :Redir !uname -a
command! -nargs=1 -complete=command -bar -range Redir {
	silent viking#commands#Redir(<q-args>, <range>, <line1>, <line2>)
}

# Purpose: Show an overview of built-in Vim functions grouped by type.
# Usage: :Api
command! Api <Cmd>help list-functions<CR>

# Purpose: Open quickfix with list of files different than on given branch.
# Usage: :GitChanged master
command! -complete=customlist,Gitbranches -nargs=1 -bar GitChanged {
	setqflist(map(systemlist("git diff --name-only $(git merge-base HEAD <args>)"), '{"filename": v:val, "lnum": 1}'))
	copen
}

def Gitbranches(ArgLead: string, CmdLine: string, CursorPos: number): list<string>
	return systemlist('git branch')
enddef

# Purpose: Mimic :g/foo/# and :v/bar/# but persist results to the location list.
# Usage: :Global ^function!, Global! ^set
command! -bang -nargs=1 Global {
	setloclist(0, [], ' ', {
		'title': 'Global<bang> ' .. <q-args>,
		'efm': '%f:%l\ %m,%f:%l',
		'lines': execute('g<bang>/' .. <q-args> .. '/#')
			->split('\n')
			->map({_, val -> expand("%") .. ":" .. trim(val)}) })
}

# Change Vim :pwd to directory containing current buffer
command! Cd :tcd %:h

# Copy `:help arglist` files to a quickfix list and open quickfix list
command! -bar ArglistToQuickfix {
	setqflist(map(argv(-1), '{"filename": v:val}'))
	copen
}

# Add todos et al. from current buffer to location list and open it 
command! -bar TodoLocal <Cmd>botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ % <Bar> lopen<CR>

# Same as above but for every file in current working directory
command! -bar Todo <Cmd>botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ * <Bar> copen<CR>

# Purpose: does what :only does, but for buffers
# Usage: :Bufonly
command! -bar Bufonly :.+,$bwipeout | 

# Autocmds {{{1
augroup Viking
    autocmd!
    # autocmd BufNewFile,BufWritePre * :call viking#commands#EnsureDirExists()
augroup END

# Mappings {{{1

# Command-line {{{2
cnoremap <expr> <CR> viking#commands#CCR()

# Help mappings {{{2
nnoremap <F1><F1> <Cmd>helphelp<CR>
nnoremap <F1>f <Cmd>Api<CR>
nnoremap <F1>u <Cmd>help usr_42.txt<CR>
nnoremap <F1>o <Cmd>help option-list<CR>
nnoremap <F1>9 <Cmd>help vim9<CR>
nnoremap <F1>e <Cmd>help eval.txt<CR>
nnoremap <F1>l <Cmd>help lambda<CR>

# Editing {{{2

# Jump to column of mark rather than first non-blank character in the line
nnoremap ' `

# vim:set fdm=marker noet sw=2 sts=-1 ts=2 tw=80:
