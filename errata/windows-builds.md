# Building Gvim from source on Windows 10

## Requirements

- Visual Studio Build Tools 2022 (VS2022)

## Environment

- Windows Terminal (using Canary but any should do)
- winget
- pwsh (using 7.5.x)

## Reference documents

in vim source repo:

```
vim/src/INSTALLpc.txt
vim/src/Make_mvc.mak
```

## Build steps

Vim comes with it's own batch files that end up calling typical `vcvars*`
batch files that VS2022 provides, and sets up paths for `nmake` and Microsoft
Visual Studio compiler (MSVC).

Most of these vim batch files requires `vswhere.exe` can be found on PATH, 
so either add it to user path or set `VSWHERE` variable in the batch file
being used to the absolute path where `vswhere.exe` is found. On my system:

`'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe'`

The `msvc-latest.bat` sets the `VSWHERE` variable if it is unset to:
`%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe` which
is pretty much where it always is, so no worries there.

For Python support while building with MSVC, we need a Python installed from
www.python.org, choose the "Windows Installer".

```ps1
cd vim/src
./msvc-latest.bat x64
nmake -f Make_mvc.mak
    GUI=yes MODIFIED_By='C.D. MacEachern' SOUND=no CSCOPE=no NETBEANS=no DEBUG=no
```

See `vim/src/feature.h` for list of optional features. You can set defines
on command line like `nmake -f Make_mvc.mvc "DEFINES=-DEMACS_TAGS"` so
you don't have to modify the feature.h source code.

Any DLLs for 64bit vim on 64-bit Windows should be either:

- be copied to `C:\Windows\System32`
- or copied to same folder as `gvim.exe` itself, something like
`C:\Program Files\Vim\vim91`

## Installing after building from source

We must first create a `vim91` sub-directory in the Vim git directory
that contains the directories `src` and `runtime`.

```cmd
copy runtime\* vim91
xcopy /s runtime\* vim91
```

Then copy the needed binaries into `vim91`:

```cmd
copy src\*.exe vim91
copy src\tee\tee.exe vim91
copy src\xxd\xxd.exe vim91
```

To get 'Edit with Vim' menus you need 32 and 64 bit versions of `gvimext.dll`,
and should be put in the `vim91\GvimExt32\` and `vim91\GvimExt64\` folders.

First build the 32 bit version then:

```cmd
mkdir vim91\GvimExt32
copy src\GvimExt\gvimext.dll vim91\GvimExt32
```

Next, nmake clean the 32 bit version and build the 64 bit version, then:

```cmd
mkdir vim91\GvimExt64
copy src\GvimExt\gvimext.dll vim91\GvimExt64
```

Now copy `gettext` and `iconv` DLLs into the the `vim91` directory.

Download from [https://github.com/mlocati/gettext-iconv-windows/releases](gettext-iconv).
Both 32 and 64 bit versions are needed.

Download `gettextX.X.X.X-iconvX.XX-shared-{32,64}.zip`, extract DLLs and place them
as follows:

```text
vim91\
    |   libintl-8.dll
    |   libiconv-2.dll
    |   libgcc_s_sjlj-1.dll     (only for 32-bit)
    |
    + GvimExt32\
    |   libintl-8.dll
    |   libiconv-2.dll
    |   libgcc_s_sjlj-1.dll
    |
    ` GvimExt64\
        libintl-8.dll
        libiconv-2.dll
```

The DLLs in the `vim91` should be the same bitness with the (g)vim.exe.

Now, move the whole `vim91` directory into the `C:\Program Files\Vim` directory,
removing any `vimNN` folder already there using the `uninstall.exe` app in it's
directory.

Next, change directory into the `vim91` directory in its new location at
`C:\Program Files\Vim\vim91` and run the `install.exe` app.
