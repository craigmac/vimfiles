" GUI settings - see `:h gui.txt` for common stuff, `:h gui-macvim` for MacVim

if has('mac') && has('gui_running')
  " MacVim.app - have to check both above because 'mvim' can also be TUI
  set macmeta
  " NOTES:
  " `:h macvim-login-shell`, since $SHELL is /bin/zsh by default it only gets
  " set to: 
  " /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:
  " /Library/Apple/usr/bin:/Users/cmaceach/.cargo/bin
  "
  " And we are missing all our .zshrc_local PATH stuff, to fix this set
  " user default MMLoginShellArgument to `"-l"` (if bash is used, this is
  " default). In a terminal use the `defaults` command to change to:
  "
  " TLDR: make sure to run in Terminal.app, to use zsh correctly on macOS:
  " `defaults write org.vim.MacVim MMLoginShellArgument "-l"`
endif

set tabpagemax=100

" default is `egmrLtT`
"
" set guioptions-=e | " remove native gui tabline, use `tabline` instead of
set guioptions-=r | " remove right hand scrollbar
set guioptions-=L | " remove left hand scrollbar when window is vert split
set guioptions+=P | " visual mode selections (w mouse or keys) copied to + register
set guioptions-=t | " remove tearoff menus
set guioptions-=T | " remove toolbar
set guioptions-=m | " remove menubar
