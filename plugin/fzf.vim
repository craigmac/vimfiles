vim9script
# https://github.com/junegunn/fzf
# https://github.com/junegunn/fzf.vim

# NOTES:
# * bang (!) versions open in fullscreen.
# * each command internally calls fzf#wrap from main junegunn/fzf repo,
#   so read docs there for options
# * all config stored in g:fzf_vim = {}

# requires initialization before assigning any config values to it
g:fzf_vim = {}

# show preview on <C-/> but hide it by default, shows on right at 50% width
g:fzf_vim.preview_window = ['hidden,right,50%', 'ctrl-y']

# define an options array for preferences to pass to fzf#vim#files or any others
var my_options = ['--layout=reverse', '--info=inline']
command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({ 'options': my_options }), <bang>0)
# fuzzy find all the available fzf commands
nnoremap <Leader>F <Cmd>Commands<CR>

nnoremap <Leader>f <Cmd>Files<CR>
nnoremap <Leader>b <Cmd>Buffers<CR>
# requires perl, neovim fzf-lua does not
if executable('perl')
	nnoremap <Leader><F1> <Cmd>Helptags!<CR>
endif
# RG variant relaunches rg on every keystroke for 'live grep'
nnoremap <Leader>/ <Cmd>RG<CR>
# same as Oldfiles on fzf-lua, it's using :oldfiles list
nnoremap <Leader>o <Cmd>History<CR>
# command history of :
nnoremap <Leader>: <Cmd>History:<CR>

