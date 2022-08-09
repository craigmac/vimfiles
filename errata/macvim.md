# Macvim specific notes

## has('macvim\_gui') vs has('gui\_running')

Curiously, `mvim` the CLI app will report true for `:echo has('macvim_gui')`,
so guarding settings/options in a rc behind `if has('macvim_gui')` is not
foolproof enough.

If for example you run Terminal.app emulator and have termguicolors set like
this:

```vim
if has('macvim_gui')
    set termguicolors
endif
```

You're going to get wrong colours, because Terminal.app only supports 256
colours. This is because even when using CLI `mvim` it reports as having
`macvim_gui`. I guess this is because you can call `:gui` from the CLI to start
a gui session, so that kind of makes sense for that case.

To really guard macvim.app (GUI) settings, what you should do is:

```vim
if has('macvim_gui') && has('gui_running')
    " stuff here only runs when actual GUI is running, not mvim CLI from
    " /usr/local/bin/mvim which is just a symlink to something like:
    " /usr/local/Cellar/macvim/8.2-172_1/bin/mvim (if you've install macvim via
    " Homebrew with `brew install macvim`
endif
```

## Setting up /bin/zsh :terminal in MacVim.app GUI

There are a few unexpected things about using `:terminal` under the MacVim GUI.

### Call /bin/zsh correctly

macOS does things differently with the zsh startup files. Long story short:
we want to call zsh as a login shell, just like Terminal.app does on every new
window instance. The only time Terminal.app doesn't is when you call `zsh`
directly yourself from inside a running zsh session. The history of this, and
the same odd behaviour applies to `bash` as well, is unknown.

To emulate starting a fresh Terminal.app with `:terminal` we need to setup the
`shell` option correctly. 

In your `gvimrc`, for example, `$HOME/.vim/gvimrc` put:

```vim
if has('macvim_gui') && has('gui_running')
  set shell=/bin/zsh\ -l
endif
```

This will ensure that we mimic the default behaviour of Terminal.app.

### Set $TERM\_PROGRAM

MacVim.app `:terminal` does not set the `$TERM_PROGRAM` env variable.
Terminal.app sets this to `Apple\_Terminal` by default.  This is important
because there's a check in `/etc/zshrc` to source `/etc/zshrc_$TERM_PROGRAM`
and if `$TERM_PROGRAM` is empty, then it never gets sourced.

Why source this file? Well, you can open the file itself and see: it provides
features like OSC 7 escape sequence that emits when a directory is changed. If
this file is sourced, when you change a directory inside a `:terminal` instance
the `:pwd` of non-terminal buffers in the windows change.

Enable this behaviour with `set autoshelldir` in your vimrc/gvimrc.

To make sure `$TERM_PROGRAM` is set correctly, add the following to your
gvimrc:

```vim
if has('macvim_gui') && has('gui_running')
  set shell=/bin/zsh\ -l
  set $TERM_PROGRAM=Apple_Terminal
endif
```

## $PATH issues 

MacVim defaults to sourcing value of `$SHELL` for it's startup env. This may
cause issues for you depending on what zshrc/bashrc files you want to source as
part of your env. To check what MacVim GUI sees your `$PATH` as, run (from
within MacVim GUI) `:!env | grep -i path`. For myself the `$PATH` value was not
what I expected, as it put macOS system paths first, causing things like `:!ruby
-v` to report 2.6, instead of the expected 3.0.4 I installed with `brew install
ruby@3.0.4`.

So there are two things we need to fix:

1. Initial startup env for MacVim GUI. This is controlled by macOS 'defaults' database system. We can alter that by starting a Terminal.app session and telling MacVim that it's startup env will be "/bin/zsh -l" by doing:

```sh
defaults write org.vim.MacVim MMLoginShellCommand "/bin/zsh"
defaults write org.vim.MacVim MMLoginShellArgument "-l"
```

2. The second thing we'll need to do is alter how shell commands are run, for
   example when you do `:!which ruby`. This is controlled by two options,
   `shell` and `shellcmdflag`. Depending on how your zshrc files are setup,
   you may need to tweak these. By default, `:!` commands don't run as
   'interactive' shell sessions, meaning interactive shell scripts configs like
   `~/.zshrc` don't get sourced! For me, I set the following values to get what
   I needed to run `:!which ruby` and have it report the correct version:

```vim
set shell=/bin/zsh\ -l
set shellcmdflag=-ic
```

Again, this may not work for you, it depends on how your zsh startup scripts are
setup. If you are still using Bash (/bin/bash), MacVim _DOES_ add a `-l`
according to the docs, so you should be okay in that regard.

To see the difference, run `:terminal` and then run `which ruby` manually in
the new terminal buffer. Mine now reports `/usr/local/opt/ruby@3.0/bin/ruby`.

" vim: set tw=80:
