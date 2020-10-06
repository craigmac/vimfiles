# Git package management reminders

## Fresh install

```
rm -rf ~/.vim
git clone https://github.com/craigmac/vim ~/.vim
cd ~/.vim
git submodule init
git submodule update
```

## Install New Package

```
cd ~/.vim/pack/git-managed/opt
git submodule add https://github.com/ctrlp/ctrlp.vim
echo 'packadd! ctrlp.vim' >> ~/.vim/vimrc
```

I put everything in opt directory so I must explicity load what I want
in vimrc file.

`packadd!` command means it will only load it if --no-plugins arg was not
given in Vim's arglist at startup. Always use the '!' and just forget about
it.

## Install New Package that auto-starts (no 'packadd' needed)

```
cd ~/.vim/pack/third-party/start
git submodule add https://github.com/ctrlp/ctrlp.vim
```

Disadvantage is that you can't load/unload on demand, it is always
loaded.

## Updating packages - (refreshing already installed packages)

```
cd ~/.vim
git submodule update --remote --merge
```
## Update single package

```
cd ~/.vim/pack/git-managed/opt/plug-foo
git pull origin master
```

## Replicating the repository on a machine

```
git clone --recursive https://github.com/craigmac/vimfiles ~/.vim
```

## Removing packages

```
cd ~/.vim
git submodule deinit pack/third-party/opt/fzf
git rm -r pack/completion/opt/fzf
rm -r .git/modules/pack/third-party/opt/fzf
```

Or you could just leave them in opt and not load them in
vimrc, which essentially is removing them from use and loading.
