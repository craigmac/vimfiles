vim9script noclear
# NOTE: sourcing this file manually will apply everything to THIS buffer! 
# It shouldn't be sourced manually, just save it when modified

# for gq operator: https://github.com/psf/black/issues/700
setlocal formatprg=black\ --quiet\ --fast\ -
setlocal include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
# Better, includes word boundaries with \< and \> to avoid false positives
# TODO: upstream PR for this with examples
setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
setlocal includeexpr=PyInclude(v:fname)

# See this legendary explanation: https://vi.stackexchange.com/a/13456/5369
augroup my_python
	autocmd! * <buffer>
	# not working correctly.
	autocmd BufWritePre <buffer> {
		var view = winsaveview()
		silent! :%!black --quiet --fast -
		winrestview(view)
	}
	# any window-local options should be set in here
	autocmd BufWinEnter <buffer> setlocal list
augroup END

# TODO: multispace?

# from https://youtu.be/Gs1VDYnS-Ac?t=1509
# Setup include search
# :verbose set include? => ^\s*\(from\|import\) set in
# $VIMRUNTIME/filetype/python.vim
#
# Default value will match
# import argparse
# import wikiquote
#
# But not these:
# import conv.metrics
# from conv import conversion as conv
#
# Default includeexpr shipped with $VIMRUNTIME/ftplugin/python.vim
# substitute(
#	substitute(
#	  substitute(v:fname,b:grandparent_match,b:grandparent_sub,''),
#		b:parent_match,b:parent_sub,''),
#		  b:child_match,b:child_sub,'g')
#
# Better, tack onto the original
# setlocal includeexpr=^\s*\*(from\|import\) 
# set start of match here with \zs
# setlocal includeexpr+=\zs
# A group of 1+ non-whitespace characters, followed by a whitespace character,
# \s, but as few as possible \{-}. This group occurs 0 or more times, *.
# setlocal includeexpr+=\(\S\+\s\{-}\)*
# previous group appears right before, \ze (:h \ze) end of line or a space and
# 'as'
# setlocal includeexpr+=\ze\($\| as\)
#
# Full unquoted version, for / search
# ^\s*\(from\|import\)\s*\zs\(\S\+\s\{-}\)*\ze\($\| as\)
# becomes when backslashed more here to work
# setlocal include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
# setlocal includeexpr=PyInclude(v:fname)
 
# Case 1:
# import foo.bar
# match: /foo.bar/
#
# Case 2:
# from foo import bar as foo
# match: /foo import bar/
# In python this match could actually be a function and not a module,
# so we want to interpret the match as either:
# /foo import bar/, OR
# foo/bar.py foo.py
# For this one we want to split the string on 'import'
if !exists("*PyInclude")
	def PyInclude(fname: string): string
		# Will leave us with an array of either:
		# Case 1 => [foo.bar]
		# Case 2 => [foo, bar]
		var parts = split(fname, ' import ')
		# Case 1 => foo.bar
		# Case 2 => foo (bar is index 1)
		var left_join = parts[0]
		# Case 2: [foo, bar] (two parts to the array)
		if len(parts) > 1
		var right_join = parts[1] # bar
		var joined = join([left_join, right_join], '.') # foo.bar
		# Replace literal dot with a literal /, globally in the string and add .py
		var filepath = substitute(joined, '\.', '/', 'g') . '.py'
		# If we can find it using the new string, then we return because we are done
		var found = glob(filepath, 1)
		if len(found)
			return found
		endif
		endif
		# Case 1: [foo.bar], just replace literal dot with literal /, and add .py
		return substitute(left_join, '\.', '/', 'g') . '.py'
	enddef
endif

# reset values set here if for some reason &ft is changed from 'python'
b:undo_ftplugin = "setlocal formatprg< include< define< includeexpr<"
