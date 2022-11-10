" GUI specific settings for Vim 9+ 

" macvim opt key sends stupid ê for <M-j>, so just forward them to <M-{hjkl>
" CAUTION: turning these on with MacVim breaks 'set macmeta', so keep them off
" if using MacVim and let the macmeta setting handle the conversion. " map è <M-h>
" map ê <M-j>
" map ë <M-k>
" map ì <M-l>


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

" ==============
" :h gui_mac.txt
" ==============

" 'gui_macvim' is not standard it's defined by macvim, gui_mac is detected as 0 
if has('gui_macvim') && has('gui_running')
	" don't use macvim gui label, use default vim settting
	set guitablabel=
	" turn off macOS things
	let macvim_hig_shift_movement = 0
	let macvim_skip_cmd_opt_movement = 1
	colorscheme macvim
	set tabpagemax=100
	call chdir(fnameescape(expand("~/.vim")))
	nnoremap <F12> :set fullscreen!<CR>
	" <C-v> <M-h> will still print 'è', but MacVim will convert it to <M-h>, so
	" you can bind to <M-..> keystrokes without having to bind weird chars
	set macmeta
	set macthinstrokes
	" when using vim ft things like !=# get mangled
	set nomacligatures
	" use if using zsh to get OSC escape codes to use with 'autoshelldir'
	" https://apple.stackexchange.com/questions/139807/what-does-update-terminal-cwd-do-in-the-terminal-of-os-x
	" Will also work with Bash but I just copied it to my .bashrc to be portable
	let $TERM_PROGRAM='Apple_Terminal'
	set autoshelldir
endif
