" helptoc plugin proposed at https://github.com/vim/vim/pull/10446

" default regex is to match bash prompts: ^\w\+@\w\+:\f\+\$\s
" but we need zsh prompt matching on macos:
if !has('mac') | finish | endif

let g:helptoc = {'shell_prompt': '^%\s\+'}
