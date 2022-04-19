" vim: set foldmethod=indent foldlevel=1 textwidth=100 filetype=vim :
" Author: C.D. MacEachern <craigm@fastmail.com> vim 7.4+ config file.
" Last Modified: 2020-09-17
" local.vim -- utility functions that I use

function! utils#SwitchSourceHeader() abort
  " Switch between cpp/.h files
  if &ft ==# 'cpp'
    if (expand('%:e') ==# 'cpp')
      find %:t:r.h
    else
      find %:t:r.cpp
    endif
  endif
endfunction

function! utils#StripTrailingWhitespaces() abort
    " Don't touch binary files or diff files
    if !&binary && &filetype !=# 'diff'
        let _s=@
        %s/\s\+$//e
        " restore last search to last search register, ignore above one
        let @/=_s
    endif
endfunction

function! utils#UpdateLastModified() abort
    " Looks for 'modified:' in first 10 lines and updates time. Called on
    " Bufwrite for *.vim in after/ftplugin. Saves pos and restores it too.
    if &filetype ==# 'vim'
      let l:winview = winsaveview()
      if exists('*strftime')
        silent! execute '1,10s/Modified:.*/Modified: ' . strftime('%Y-%m-%d') . '/'
        call winrestview(l:winview)
      else
        " Windows version using python3 fallback
        if has('python3')
py3 << EOF
import vim
from datetime import date
now = date.today()
newtime = now.strftime("%Y-%m-%d")
cb = vim.current.buffer
first_ten_lines = cb[1:10]
for line in first_ten_lines:
  if 'Modified:' in line:
    line.replace('Modified:', 'Modified: {}'.format(newtime))
EOF
        else
          echoerr 'Cannot update last modified time on this file because no python3 detected'
        endif
      endif
    endif
endfunction

" Modified from github/milkypostman/vim-togglelist
function! s:GetBufferList() abort
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! utils#JekyllOpenDevx() abort
  " Requires 'devx' as &pwd for '%:.' to work correctly with forming the final URL to open
  if !getcwd() =~ 'devx' 
    echoerr 'Command only works when &pwd is "devx"'
    return
  endif
  let relpath = expand('%:.')
        \ ->substitute('_ver_', '', '')
        \ ->substitute('^docs', '', '')
        \ ->substitute('\.md$', '/', '')

  " cases:
  " docs/_ver_6.14/path/to/file
  " docs/release-details/file-with-version-6.8.md
  let newversion = relpath->matchstr('\d\.\d\d\?')

  " When relpath = version/path/to/topic we need to drop leading \d\.\d\d\? dir, otherwise we end
  " up with 6.15/6.15/path/to/file. We only check up to first / to limit to first folder.
  let newpath = newversion .. relpath->substitute('\d\.\d\d\?/', '', '')

  " any version 6.14 and over requires localhost only
  let host = str2float(newversion) >= 6.14 ? 'http://localhost:4000' : 'https://developer-staging.youi.tv/'

  let finalurl = host .. newpath
  " TODO: make more robust, calling os-specific open like netrw does,
  " like xdg-open on Linux
  execute "silent! !open " . finalurl
  redraw!
endfunction

function! utils#Redir(cmd) abort
  let output = execute(a:cmd)
  botright split +enew
  setlocal nobuflisted nonumber norelativenumber buftype=nofile bufhidden=wipe noswapfile
  nnoremap <buffer> q :bwipeout!<CR>
  call setline(1, split(output, "\n"))
endfunction

" NOTES: false positives currently for .zip/.pdf/.html links because we
" chop at the first period found (to remove the .md)
function! utils#MarkdownInclude() abort
  " finds:
  " '/snippets/target-platform-before-start'
  " '/cpp/platform-roku/roku-cloud-solution/'
  " '/rn/develop/focus-management/#why-we-need-focus'
  " '(../windows/)
  " echom 'Using include value of: ' .. &include
  let l:fname = matchstr(getline('.')->trim(), &include)
  if empty(l:fname) 
    return 
  endif 

  " echom 'l:fname after trim() and include match = ' .. l:fname

  " split any #foo so we can jump to that spot in the file if it exists
  let l:fname_ahref = split(l:fname, '#')
  let l:fname = l:fname_ahref[0]
  try
    let l:ahref = l:fname_ahref[1]
  catch /E684/
    let l:ahref = 0
  endtry

  " echom 'l:fname_ahref if found in include match = ' .. l:ahref

  " trim any trailing / so we can use suffixesadd to add .md
  let l:fname = substitute(l:fname, '/$', '', '')
  " trim leading / as well
  let l:fname = substitute(l:fname, '^/', '', '')

  " echom 'l:fname after leading and trailing "/" removed = ' .. l:fname

  " TODO: 
  " now get what version folder we want to start search in
  " from the buffer name we are in, hardcoded right now for 6.15 only
  let l:search_path = '/Users/cmaceach/git/devx/docs/_ver_' .. '6.15' .. '/**'

  " echom 'using l:search_path of : ' .. l:search_path

  execute 'edit ' .. findfile(l:fname .. &suffixesadd, l:search_path)

  " try jumping to href tag if one was found
  if !empty(l:ahref)
    " remove dashes in the line, which are used in the url,
    let l:ahref = substitute(l:ahref, '-\+', ' ', 'g')
    call search('^#\+\s*' .. l:ahref, 'w')
  endif
endfunction

" Background here: https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86
" with help from https://github.com/teoljungberg

function! utils#CCR()
    let cmdline = getcmdline()
    let filter_stub = '\v\C^((filt|filte|filter) .+ )*'
    command! -bar Z silent set more|delcommand Z
    if getcmdtype() !~ ':'
        return "\<CR>"
    endif
    if cmdline =~ filter_stub . '(ls|files|buffers)$'
        " like :ls but prompts for a buffer command
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number|l|li|lis|list)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ filter_stub . '(\%)*(#|nu|num|numb|numbe|number|l|li|lis|list)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ filter_stub . '(cli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil cc\<Space>"
    elseif cmdline =~ filter_stub . '(lli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil ll\<Space>"
    elseif cmdline =~ filter_stub . 'old'
        " like :oldfiles but prompts for an old file to edit
        set nomore
        return "\<CR>:Z|e #<"
    elseif cmdline =~ filter_stub . 'changes'
        " like :changes but prompts for a change to jump to
        set nomore
        return "\<CR>:Z|norm! g;\<S-Left>"
    elseif cmdline =~ filter_stub . 'ju'
        " like :jumps but prompts for a position to jump to
        set nomore
        return "\<CR>:Z|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ filter_stub . 'marks'
        " like :marks but prompts for a mark to jump to
        return "\<CR>:norm! `"
    elseif cmdline =~ '\v\C^undol'
        " like :undolist but prompts for a change to undo
        return "\<CR>:u "
    elseif cmdline =~ '\v\C^tabs'
        set nomore
        return "\<CR>:Z| tabnext\<S-Left>"
    elseif cmdline =~ '^\k\+$'
        " handle cabbrevs gracefully
        " https://www.reddit.com/r/vim/comments/jgyqhl/nightly_hack_for_vimmers/
        return "\<C-]>\<CR>"
    else
        return "\<CR>"
    endif
endfunction


function! utils#SynGroup() abort
  " Outputs both the name of the syntax group, AND the translated syntax
  " group of the character the cursor is on.
  " line('.') and col('.') return the current position
  " synID(...) returns a numeric syntax ID
  " synIDtrans(l:s) translates the numeric syntax id l:s by following highlight links
  " synIDattr(l:s, 'name') returns the name corresponding to the numeric syntax ID
  " example output:
  " vimMapModKey -> Special
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') .. ' -> ' .. synIDattr(synIDtrans(l:s), 'name')
endfunction

" TODO: convert back to vimscript
" export def Grep(...args: list<string>): string
"   # Based on: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
"   #
"   # 'expandcmd' allows us to do :Grep 'leader' % and have % expanded to current
"   # file like default :grep cmd does
"   #
"   return system(join([&grepprg] + [expandcmd(join(args))]))
" enddef

" export def Make(): string
"   # TODO: works for simple cases but I will need to escape more I think to get
"   # things like makeprg value of :compiler liquid to work correctly.
"   return system(expandcmd(&makeprg))
" enddef

 " OLD: I use vim-qf functions now
" export def ToggleQuickfixList()
 "  var qwinid = getqflist({'winid': 0}).winid
 "  if qwinid > 0
 "    cclose
 "  else
 "    botright copen 10
 "  endif
" enddef

" # OLD: I use vim-qf functions now
" export def ToggleLocationList()
 "  # Tries to toggle open/close location list for current window,
 "  # if no loclist exists then just ignore error stating such
 "  var lwinid = getloclist(0, {'winid': 0}).winid
 "  if lwinid > 0
 "    lclose
 "  else
 "    try
 "      botright lopen 10
 "    catch /E776/
 "      echohl WarningMsg
 "      echo 'Window has no associated location list.'
 "      echohl None
 "      return
 "    endtry
 "  endif
" enddef
"
" export def JekyllOpen()
"   if !getcwd() =~ 'youi-platform-docs'
"     echoerr 'Command currently only works when &pwd is ~/git/hbo/youi-platform-docs'
"     return
"   endif

" 	# TODO: Review how this will work with new site, if we just use 'latest'
" 	# docset, e.g., docs/latest/rn/guides/crash-reporting.md
"   var topicpath = expand('%:.') # docs/_ver_6.16/rn/guides/crash-reporting.md
" 		->substitute('_ver_', '', '') # docs/6.16/rn/guides/crash-reporting.md
" 		->substitute('^docs', '', '') # /6.16/rn/guides/crash-reporting.md
" 		->substitute('\.md$', '/', '') # /6.16/rn/guides/crash-reporting/

" 	# echom topicpath

" 	var host = 'https://docs.hbo.com'

"   var finalurl = host .. topicpath
"   execute "silent! !open " .. finalurl
" 	redraw!
" enddef
"
