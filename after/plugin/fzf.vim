" https://github.com/junegunn/fzf (provides API for fzf.vim and `:FZF`)
" https://github.com/junegunn/fzf.vim (provides commands like `:Buffers`)

if !exists('g:loaded_fzf')
  " set up some alternative keybindings in fzf wasn't loaded and finish here
  nnoremap <Leader>f :<C-u>find **/*
  nnoremap <Leader>b :<C-u>buffer <C-z><S-Tab>
  finish
endif

" NOTES:
" * bang (!) versions of commands, like `:GitFiles!` open in fullscreen.
" * each command internally calls `fzf#wrap` from main junegunn/fzf repo,
"   so read docs there for options.
" * store global config in `g:fzf_vim` dictionary

" init of dict is required before assigning any key=value pairs to it
let g:fzf_vim = {}

" show preview on <C-/> but hide it by default, shows on right at 50% width
let g:fzf_vim.preview_window = [ 'hidden,right,50%', 'ctrl-y' ]

" define an options array for preferences to pass to fzf#vim#files or any others
let s:my_options = ['--layout=reverse', '--info=inline']

" override fzf builtin `:Files` command with a version that accepts an optional
" directory argument to run fzf in, and sets our preferences 
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({ 'options': s:my_options }), <bang>0)

command! -bang -nargs=0 Buffers
  \ call fzf#vim#buffers(fzf#vim#with_preview({ 'options': s:my_options }), <bang>0)

" `:Files $LOCALAPPDATA` will run in given directory, after env var is expanded
nnoremap <Leader>f <Cmd>Files!<CR>

" last used buffer, target of `:b #`, is listed first and selected
nnoremap <Leader>b <Cmd>Buffers!<CR>

" all user commands, there's no `:FzfLua` to show fzf.vim builtin commands
nnoremap <Leader>F <Cmd>Commands!<CR>

" on Windows, it requires perl executable be installed, nvim's fzf-lua does not
if has('win32') && executable('perl')
	nnoremap <Leader><F1> <Cmd>Helptags!<CR>
endif

" `:RG` (variant of `:Rg`) relaunches rg on every keystroke for 'live grep'
nnoremap <Leader>/ <Cmd>RG!<CR>

" equivalent to fzf-lua's `:Oldfiles`
nnoremap <Leader>o <Cmd>History!<CR>

" cmdline history
nnoremap <Leader>: <Cmd>History:!<CR>

