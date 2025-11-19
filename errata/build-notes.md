# Building Vim/Nvim from Source Notes

One section for each platform:

* GNU/Linux
* macOS
* Windows

## GNU/Linux {{{1

Tested on Linux Mint 21, should work on Ubuntu/Debian as well.

Huge version build with python3 interpreter and lua interpreter linked
statically (no external `.so` files - they are linked into the executable).

### First build {{{2

```sh
mkdir ~/src && cd ~/src
apt install \
	git \
	make \
	clang \
	libtool-bin \
	python3 \
	libpython3-dev \
	lua5.1 \
	liblua5.1-dev \
	libxt-dev \
	libgtk-3-0-dev \
	libgtk-3
git clone https://github.com/vim/vim
cd vim/src
./configure \
	--with-features=huge \
	--enable-python3interp \
	--enable-cscope \
	--enable-luainterp \
	--enable-fail-if-missing \
	--with-compiledby=craig 
make
sudo make install
```

### Subsequent builds {{{2

```sh
cd ~/src/vim && git pull
cd src
make clean && make distclean
make
sudo make install
```

## macOS {{{1

Tested on macOS Monterey 12.3.1

### Preparation {{{2

* Install homebrew.
* Install xcode command line tools
* vim configure script needs to find correct location for these on your $PATH,
  so add proper PATH values to your ~/.zshrc:

```bash
xcode-select --install
brew install python ruby cmake
echo '$(brew --prefix)/bin:$PATH' >> ~/.zshrc
```

My path when building (which works):

```bash
echo $PATH
/Library/Ruby/Gems/2.6.0/bin:/usr/local/opt/ruby@3.0/bin:/usr/local/opt/node@12/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Applications/CMake.app/Contents/bin
```

### First build on macOS {{{2

All interpreters enabled, no GUI.

```bash
mkdir ~/git && cd ~/git
git clone https://github.com/vim/vim
cd vim/src
./configure --with-features=huge --enable-python3interp --enable-cscope --enable-fail-if-missing --with-compiledby=craig@MBP --with-python3-config-dir=$(python3-config --config)
# errors without sudo here for xxd tool during build, maybe others
sudo make
sudo make install
```

### Subsequent builds {{{2

```bash
cd ~/git/vim/src
git pull
sudo make distclean
sudo make
sudo make install
```

### Removal {{{2

```bash
cd ~/git/vim/src
make uninstall
```

# vi: tw=80 fdm=marker foldlevel=1
