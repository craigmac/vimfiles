" GUI settings - see `:h gui.txt` for common stuff, `:h gui-macvim` for MacVim

" for MacVim.app we have to check both because 'mvim' can also be TUI
if has('mac') && has('gui_running')
  set macmeta
  set guioptions+=k | " macvim recommended when its 'smooth resize' option is on
endif

set tabpagemax=100

" default is `egmrLT` ('t' also but that's removed in $VIMRUNTIME/defaults.vim)
" remove from defaults
set guioptions-=e | " don't use GUI-native tabpages, use `tabline` instead
set guioptions-=m | " don't use gui menu, e.g., File, Edit, Tools, etc.
set guioptions-=g | " don't grey out disabled menus (no effect if menu off)
set guioptions-=r | " remove right hand scrollbar
set guioptions-=L | " remove left hand scrollbar when window is vert split
set guioptions-=T | " remove toolbar (clickable icons like cut/paste/etc.)

function! s:WindowsGvimColors() abort
  " see `:h win32-colors`
  hi! Normal guibg=Sys_Window guifg=Sys_WindowText
endfunction

" windows 32/64 and in GUI - ref. `:h gui_w32.txt` for Windows specific stuff
" NOTE: Windows has no concept of the "+ register so we need adjustments
if (has('win32') || has('win64')) && has('gui_running')
  set guioptions+=! | " run `:!` in `:term` not a separate cmd.exe window
  set guioptions+=a | " (a)utoselect: copy visual selections to register *
  nnoremap <Leader>y "*y
  xnoremap <Leader>y "*y
  nnoremap <Leader>p "*p
  xnoremap <Leader>p "*p
  nnoremap <Leader>P "*P
  xnoremap <Leader>P "*P
  " HACK: gvim will say these are invalid colors until fully started
  " so guard calling it right now, and setup autocmd to run our colours later
  if v:vim_did_enter 
    call s:WindowsGvimColors()
  else
    augroup my.augroup.VimEnter | autocmd!
    autocmd VimEnter * ++once ++nested call s:WindowsGvimColors()
  endif
endif

" gvim defaults to ~ which always messes me up and causes huge lag with fzf
cd $MYVIMDIR

" resize to allow 100 chars width visible in a buffer
set columns=125
" {N} rows high
set lines=38
" only used when 'm' is in 'guioptions'
set winaltkeys=no

" turn off blinking cursor in all modes by setting (a)ll modes to 0 ms blinktime
set guicursor+=a:blinkon0

