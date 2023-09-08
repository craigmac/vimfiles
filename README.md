# Vim setup

## Runtime path explained

https://learnvimscriptthehardway.stevelosh.com/chapters/42.html

## Replicating the whole setup on new machine

```sh
git clone --recursive git@github.com:craigmac/vimfiles ~/.vim
```

## Adding package

```sh
git submodule add <url>
```

## Update single package or all packages

```sh
cd ~/.vim/pack/third-part/opt/vim-foo
git pull origin master
```

```sh
git submodule foreach git pull origin master
```

## Removing package

```sh
cd ~/.vim
git submodule deinit pack/third-party/opt/vim-foo
git rm -rf pack/third-party/opt/vim-foo
rm -r .git/modules/pack/opt/vim-foo
```
