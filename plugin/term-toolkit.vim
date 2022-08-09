vim9script

# buffer-toggle.vim {{{1
# Move later to autoloads
# toggle a terminal buffer

if !has('gui_running') | finish | endif

var term_toggle_bufnr: number = 0
var term_toggle_winnr: number = 0
var term_toolkit_term_cmd: string = get(g:, 'term_toolkit_term_cmd', 'bash')
var term_toggle_size = 10

# TODO: move to absolute bottom of the screen, for example if you are currently
# in middle of 3 :split buffers, do winmove to furthest down you can go to open
# it there, rather than opening between 2 and 3 buffers.
export def TermToggle()
  # TODO: consider tabpage we are in. Per tabpage term buffers (1 per tabpage)
  if win_gotoid(term_toggle_winnr) # term buf in a window, hide the buf
    term_toggle_size = winheight(0)
    # TODO: How to account for 'hidden' variable variations that affect 'close'
    close # hide the buffer
  else # no term in a window, try to fetch existing buffer first or create one for a new terminal 
    try
      execute 'sbuffer ' .. term_toggle_bufnr
      execute 'resize ' .. term_toggle_size
    catch
      execute 'terminal ++close ++rows=' .. term_toggle_size .. ' ' .. term_toolkit_term_cmd
      term_toggle_bufnr = bufnr()
    endtry
    term_toggle_winnr = win_getid()  # set new winnr for new term
    term_toggle_size = winheight(0)  # save new toggle size
  endif
enddef
defcompile

if !exists('g:term_toggle_no_keymaps')
	if has('gui_running')
		nnoremap <silent> <M-`> <Cmd>call TermToggle()<CR>
		tnoremap <silent> <M-`> <C-w>:call TermToggle()<CR>
	else
		nnoremap <silent> ` <Cmd>call TermToggle()<CR>
		tnoremap <silent> ` <C-w>:call TermToggle()<CR>
	endif
endif

# vi: fdm=marker:nowrap:ft=vim:fdl=1:list
