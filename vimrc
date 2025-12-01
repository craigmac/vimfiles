vim9script
# Debian 13:  `sudo apt get install vim-gtk3`          => 9.1.1244
# Windows 10: `winget install vim.vim --source winget` => 9.1.1882

# must be set now, see `:h go-M` for why
set guioptions-=M

source $MYVIMDIR/scripts/neovim_defaults.vim

# Variables `:h eval.txt` {{{1
g:mapleader = " "
g:netrw_banner = 0
g:markdown_fenced_languages = [ 'vim', 'lua', 'bash', 'ps1', 'python' ]
# support folding all: functions, heredocs, augroups, vim9 stuff when using `fdm=syntax`
g:vimsyn_folding = 'acefhiHlmpPrt'
# don't highlight strings inside of comments in vim filetypes
g:vimsyn_comment_strings = false
# allow function, heredoc, and if/do/for folding with `fdm=syntax` in &ft == 'sh'
g:sh_fold_enabled = 7

# get full vim version like '9.1.1882' for display, e.g., in &titlestring
var ver = split(string(v:version), '\zs') # => ['9', '0', '1']
var patch = strpart(string(v:versionlong), 3)
g:full_version = printf("%s.%s.%s", ver[0], ver[-1], patch)
g:titlestring = printf('%s %s [%s]', v:progname, g:full_version, getcwd())

# Options `:h :set` {{{1
set diffopt+=followwrap,algorithm:minimal
set exrc
# the default of 20 messes with 'equalalways' setting
set helpheight=0
# enforce modern assumption that split windows open to the right or down
set splitbelow splitright
set sidescrolloff=2
set tabclose=uselast
# don't leave `*.un~` files in working directories
set undodir-=.
set undofile 
set visualbell

# UI and Special characters
&guifont = has('win32') ? 'Cascadia_Mono:h14:cANSI:qDRAFT' : 'Adwaita Mono 14'
# 'eob' char is not in modern editors and `set number` makes it irrelevant
set fillchars=eob:\ ,fold:\ ,foldinner:\ ,foldopen:▼,foldclose:▶,foldsep:\ 
# 'lastline' is archaic and not needed, same with truncations
set fillchars+=diff:\ ,lastline:\ ,vert:│,trunc:\ ,truncrl:\ 
if has('patch-9.1.1883') | set fillchars+=tpl_vert:│ | endif
# 'extends' & 'precedes' chars aren't used in modern editors, remove them.
# these characters are higlighted by `hl-NonText`
set listchars=eol:¶,extends:\ ,precedes:\ 
# visualize whitespace characters. these are higlighted using `hl-SpecialKey`
set listchars+=space:·,trail:█,nbsp:_,tab:→\ 
# allow '[3/782]' rather than default '[3/>99]'
set maxsearchcount=999
# current mode indicator is handled in custom `&statusline` instead
set noshowmode
set number
# 'round' is common now but across OS/fonts/emulator settings is riskier
set pumborder=single

# Completing/Finding
set autocomplete
set complete=o^10,.^10,w^5,b^5
set completeopt=menuone,popup,fuzzy,noselect
set completepopup=highlight:Pmenu,border:single,shadow:on
set completefuzzycollect=keyword,files,whole_line
set findfunc=g:FindGitFiles
# ignorecase unless we use a capital letter in the search
set ignorecase smartcase
# the default of 0 means no maximum, and tends to gets in the way
set pumheight=5
set spelloptions=camel
set spellsuggest=fast,5,timeout:1000
# allow cursor to move into empty space when doing visual block selections
set virtualedit=block
# use `<C-z>` as 'expand' in macro/mappings, <Tab> doesn't work there
set wildcharm=<C-z>
set wildignore+=*.swp,*~,*.bak,*.o,*.obj,.DS_Store,.netrwh
set wildignore+=.git/,.node_modules/,.cache/,tmp/
set wildmode=noselect:lastused,full
set wildoptions=fuzzy,pum,tagfile,exacttext

# no wrap, but if toggled on these options apply
set nowrap
set breakindent
set breakindentopt=sbr
set linebreak
set nojoinspaces
set showbreak=↳\ 
set smoothscroll

# bars and lines
var parts = [
  "%( %{% toupper(mode() == '' ? 'b' : mode()) .. ' │' %}%)",
  "%( %<%f%)",
  "%( %{% &modified && &buftype != 'terminal' ? '±' : '' %}%)",
  "%( %{% !&modifiable && &buftype != 'terminal' ? '!±' : '' %}%)",
  "%( %{% &readonly ? '[RO]' : '' %}%)",
  "%( %{% &previewwindow ? '[PRV]' : '' %}%)",
  "%( %a%)",
  "%=",
  "%( %{% reg_recording() != '' ? printf('@%s', reg_recording()) : '' %}%)",
  "%( %{% &showcmdloc == 'statusline' ? '%S' : '' %}%)",
  "%( %{% exists('b:keymap_name') ? '<' .. b:keymap_name .. '>' : '' %}%)",
  "%( %{% &fenc != 'utf-8' ? &fenc : '' %}%)",
  # "%-16.( %l↓%L %v→%{% virtcol('$') - 1 %}%)",
  #"%-10.( %l↓%L%)%6.( %v→%{% virtcol('$') - 1 %}%)",
  "%12.( %l↓%L%)%6.( %v→%{% virtcol('$') - 1 %}%)",
  "%5( %p%%%)",
  "%( %{% &filetype .. ' ' %}%)",        
]
&statusline = join(parts, '')
&titlestring = g:titlestring

# Keymaps {{{1
nnoremap <Leader>w <Cmd>update<CR>
nnoremap <Leader><Space> <Cmd>buffer #<CR>
nnoremap <Leader><CR> <Cmd>source %<CR>
nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <expr><Leader>e exists('g:loaded_netrw') && exists('w:netrw_rexlocal') ? '<Cmd>Rex<CR>' : '<Cmd>Ex<CR>'
nnoremap zS <Cmd>echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <expr> j (&wrap && v:count == 0) ? 'gj' : 'j'
nnoremap <expr> k (&wrap && v:count == 0) ? 'gk' : 'k'
nnoremap <Leader>vp <Cmd>tabedit $MYVIMDIR/plugged<CR>
nnoremap <Leader>vr <Cmd>tabedit $VIMRUNTIME<CR>
nnoremap <Leader>t <Cmd>split $MYVIMDIR/todo.txt<CR>

# `n` goes forward, `N` goes backwards - regardless of search start direction
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

# explicitly target the system clipboard (`./gvimrc` overrides to `"*` versions)
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

# vim-only, unix-only trick to write current buffer with sudo
if !has('win32') | cnoremap w!! w !sudo tee > /dev/null % | endif
cnoremap <expr> <C-p> wildmenumode() ? '<C-p>' : '<Up>'
cnoremap <expr> <C-n> wildmenumode() ? '<C-n>' : '<Down>'
# retain ability to use cmdline history keys Up/Down even if wildmenu open
cnoremap <expr> <Up> wildmenumode() ? '<C-e><Up>' : '<Up>'
cnoremap <expr> <Down> wildmenumode() ? '<C-e><Down>' : '<Down>'

tnoremap <C-]><C-]> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>

# repeat last command on visual lines
xnoremap . :normal .<CR>

# tab/s-tab selects from &autocomplete pmenu if it's open,
# <C-e><Tab> to close menu and insert tab or <C-v><Tab> to skip trigger
inoremap <silent><expr> <Tab>   pumvisible() ? '<C-n>' : '<Tab>'
inoremap <silent><expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'

# cf. `:h scroll-smooth`, may have unforseen consequences
execute 'map <C-u> ' .. repeat('<C-y>', 15)
execute 'map <C-d> ' .. repeat('<C-e>', 15)

# Autocommands `:h autocommand-events` {{{1
# so we can easily add to them anywhere using `:au {augroup-name} ...`
augroup my.augroup.cursorline.on | autocmd! | augroup END
augroup my.augroup.cursorline.off | autocmd! | augroup END
augroup my.augroup.colors | autocmd! | augroup END
augroup my.augroup.cmdline | autocmd! | augroup END
augroup my.augroup.bufwritepre | autocmd! | augroup END

au my.augroup.cursorline.on WinEnter,BufEnter,InsertLeave * setl cursorline
au my.augroup.cursorline.off WinLeave,BufLeave,InsertEnter * setl nocursorline

# create missing dirs on save, like neovim's `:w ++p`
au my.augroup.bufwritepre BufWritePre * {
  if &modifiable && !isdirectory(expand("%:p:h"))
    mkdir(expand("%:p:h"), "p")
  endif
}

# BUG: still causing major lag on Windows TUI
# au my.augroup.cmdline CmdlineChanged : {
#   if !has('win32') | wildtrigger() | endif
#   # skip lagging `:!` on Windows, you can always hit <Tab> to manually trigger it
#   var ln = getcmdline()
#   if ln !~ '^!' | wildtrigger() | endif
# }

# Functions {{{1
# NOTE: if 'wildtrigger' is on this may run on each cmdline keystroke to `:find`
def g:FindGitFiles(arg: string, cmdcomplete: bool): list<string>
  if empty(g:filescache)
    # -z flags means NUL separated, to avoid stray ^M chars from Windows
    var getfilescmd = printf('git ls-files %s', has('win32') ? '-z' : '')  
    g:filescache = systemlist(getfilescmd)
  endif
  return g:filescache->filter((i, fname) => fname =~? arg)
enddef
defcompile
# empty it on startup and re-source, leaving cmdline should empty it too
g:filescache = []
# <afile> expands to `:h cmdline-char`
au my.augroup.cmdline CmdlineLeave * {
  if expand("<afile>") == ':'
    g:filescache = []
  endif
}

# Ex-Commands {{{1
# set tabpage directory to path of current buffer
command! Cd <Cmd>tcd %:h<CR>
# WARN: can/will mess up custom whitespace alignments! squeeze 2+ spaces to 1
command! SqueezeWhiteSpace <Cmd>%s/\v\s{2,}/ /gce<CR>
# squeeze 2+ empty lines into one empty line
command! SqueezeNewLines <Cmd>%s/\v\n{3,}/\n\n/gce<CR>

# Packages {{{1
packadd netrw
packadd nohlsearch
packadd hlyank

plug#begin()
  Plug 'tpope/vim-unimpaired' | Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dispatch'   | Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'    | Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'  | Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/vim-easy-align'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'romainl/vim-qf'
plug#end()

# Colors {{{1
# match 'One Half Light' background
hi! Normal guibg=NONE guifg=NONE ctermfg=NONE ctermbg=NONE
hi! link Pmenu Normal
hi! link PmenuExtra Normal
hi! PmenuBorder guibg=NONE
hi! PmenuMatch guibg=NONE
hi! PmenuKind guibg=NONE
hi! CursorLine cterm=NONE gui=NONE
hi! CursorLineNr cterm=NONE gui=NONE

# Windows 10+ {{{
# Windows native-build of Vim doesn't support terminfo lookup via database, because it is not built
# against ncurses like cygwin/msys2 vim builds are.
#
# `set term=win32` - vim default on Windows native vim.exe in Windows Terminal.
# `set term=vtpcon` - nvim default for same situation. More features builtin.
#
# builtin support for Windows Terminal features.
# builtin vim terminfo entry. 

# no '+termresponse' feature so we can't use `t_RB` for instance to have vim query for background
# colour, and there's no '+terminfo' so we can't just set it to 'xterm-256color' and have something somewhat sane

if has('win32')
  # set location where `winget` installs python3 and use pwsh.exe
  set shell=pwsh
  var local_programs = expand('$LOCALAPPDATA/Programs')
  # https://github.com/ShayHill/article_install_vim_in_windows?tab=readme-ov-file#the-python-launcher
  execute 'set pythonthreehome=' .. local_programs .. "/Python/Python313"
  execute 'set pythonthreedll=' .. local_programs .. "/Python/Python313/python313.dll"
endif

# ref. `:h term.txt` and `:h win32-term`
if has('win32') && !has('gui_running')
  # assuming here we are using Windows Terminal
  if &term == 'win32'
    # add more terminal capabilities that aren't in builtin 'win32' terminfo
    # (B)racketed paste (E)nable/(D)isable
    &t_BE = "\e[?2004h"
    &t_BD = "\e[?200l"
    # (P)aste (S)tart/(E)nd markers
    &t_PS = "\e[200~"
    &t_PE = "\e[201~"
    # (f)ocus event tracking (e)nable/(d)isable
    # if garbage shows up on screen when Vim starts this isn't supported
    &t_fe = "\e[?1004h"
    &t_fd = "\e[?1004l"
    execute "set <FocusGained>=\e[I"
    execute "set <FocusLost>=\e[O"
  endif
endif

# Workshop {{{1

# au my.augroup.colors ColorScheme * call ColorSchemeSettings()

def ColorSchemeSettings()
  hi! link Pmenu Normal
  hi! link PmenuExtra Normal
  hi! PmenuBorder guibg=NONE
  hi! PmenuMatch guibg=NONE
  hi! PmenuKind guibg=NONE
  hi! CursorLine cterm=NONE gui=NONE
  hi! CursorLineNr cterm=NONE gui=NONE
  # `:h hl-User1..9` choose colours that work against `hl-StatusLine`
  hi! User1 guifg=Black ctermfg=232
  hi! User2 guifg=White guibg=Red
  hi! User3 guifg=Black guibg=Green
  hi! User4 guifg=Black guibg=Yellow
  hi! User5 guifg=White guibg=Blue
  hi! User6 guifg=Black guibg=Magenta
  hi! User7 guifg=Black guibg=Cyan
  hi! User8 guifg=White ctermfg=231
enddef

set background=light
colorscheme wildcharm
ColorSchemeSettings()

# vi: et sw=2 sts=-1 tw=80 fdm=marker
