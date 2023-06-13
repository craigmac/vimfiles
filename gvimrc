" GUI settings - see `:h gui.txt` for common stuff, `:h gui-macvim` for MacVim

if has('mac') && has('gui_running')
  " MacVim.app - have to check both above because 'mvim' can also be TUI
  cd $HOME/.vim
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
else
  " gVim stuff only here
  echomsg '[gvimrc]: detected as running non-macvim GUI (probably gVim?)'
endif

" Non GUI-specific settings
set tabpagemax=100
" default is `set guioptions=egmrL`
set guioptions-=e | " remove native gui tabline, use `set tabline` instead
set guioptions-=r | " remove right hand scrollbar
set guioptions-=L | " remove left hand scrollbar when window is vert split
set guioptions+=P | " visual mode selections (w mouse or keys) copied to + register

" Remove from right click menu
silent! aunmenu PopUp.Undo
silent! aunmenu PopUp.Paste
silent! aunmenu PopUp.Select\ Word
silent! aunmenu PopUp.Select\ Sentence
silent! aunmenu PopUp.Select\ Paragraph
silent! aunmenu PopUp.Select\ Line
silent! aunmenu PopUp.Select\ Block
silent! aunmenu PopUp.Select\ Blockwise
silent! aunmenu PopUp.Select\ All
