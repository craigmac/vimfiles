" GUI specific settings for Vim 8+

" Turn off alt-{key} being used for menus allowing bindings on alt in GUI
" If you want to bind Alt-key for a menu use e.g., :simalt f<CR> for Alt-f
" F10 will still be menu key, unless bound by user.
set winaltkeys=no
set belloff=all
set guifont=Iosevka\ Fixed:h22

" In Windows, don't run popup cmd.exe for external commands,
" use :term instead. See :h gui-shell-win32
set guioptions+=!
" Use console dialogs instead of native ones for simple choices
set guioptions+=c
" Use Vim icon in top-left corner on GTK/Windows in upper-left corner
set guioptions+=i
" set Vim as owner of global selection ("*) on visual mode start or extend
" With this, a mouse select copies to system clipboard automatically
set guioptions+=a

" Turn off toolbars, scrollbars, and native tabs
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=b
set guioptions-=e

" mimicing some of tmux functionality
" <C-Space> works in GUI, for term it's usually <Nul> or ^@ 
nnoremap <C-Space>s <cmd>terminal<CR>
nnoremap <C-Space>v <cmd>vert terminal<CR>
nnoremap <C-Space>t <cmd>tabnew <Bar> terminal ++curwin<CR>
tnoremap <C-Space>s <cmd>terminal<CR>
tnoremap <C-Space>v <cmd>vert terminal<CR>

" ==============
" :h gui_mac.txt
" ==============

" 'gui_macvim' is not standard it's defined by macvim, gui_mac is detected as 0 
if has('gui_macvim') && has('gui_running')
	set lines=59
	set columns=239
	set tabpagemax=100
	call chdir(fnameescape(expand("~/.vim")))
  nnoremap <F12> :set fullscreen!<CR>
  set macmeta
	set macthinstrokes
	" when using vim ft things like !=# get mangled
	set nomacligatures
	" use this if using zsh to get OSC escape codes to use with 'autoshelldir'
	" https://apple.stackexchange.com/questions/139807/what-does-update-terminal-cwd-do-in-the-terminal-of-os-x
	" Will also work with Bash but I just copied it to my .bashrc to be portable
	" let $TERM_PROGRAM='Apple_Terminal'
	
	set shell=/usr/local/bin/bash -l
	set autoshelldir
endif
