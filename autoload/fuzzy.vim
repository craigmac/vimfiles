vim9script

import autoload 'popup.vim'

export def Buffer()
	popup.FilterMenu("Buffers",
		getbufinfo({'buflisted': 1})->mapnew((_, v) => {
				return {bufnr: v.bufnr, text: (v.name ?? $'[{v.bufnr}: No Name]')}
		}),
		(res, key) => {
			if key == "\<C-t>"
				execute $":tab sb {res.bufnr}"
			elseif key == "\<C-x>"
				execute $":sb {res.bufnr}"
			elseif key == "\<C-v>"
				execute $":vert sb {res.bufnr}"
			else
				execute $":b {res.bufnr}"
			endif
		},
		(winid) => {
			win_execute(winid, 'syntax match FilterMenuDirectorySubtle "^.*\(/\|\\\)"')
			highlight! default link FilterMenuDirectorySubtle Comment
		})
enddef

export def MRU()
	popup.FilterMenu("MRU",
		v:oldfiles->copy()->filter((_, v) => {
			return filereadable(expand(v)) &&
			expand(v)->stridx(expand("$VIMRUNTIME")) == -1
		}),
		(res, key) => {
			if key == "\<c-t>"
				execute $":tab e {res.text}"
			elseif key == "\<c-j>"
				execute $":split {res.text}"
			elseif key == "\<c-v>"
				execute $":vert split {res.text}"
			else
				execute $":e {res.text}"
			endif
		},
		(winid) => {
			win_execute(winid, 'syntax match FilterMenuDirectorySubtle "^.*\(/\|\\\)"')
			highlight! def link FilterMenuDirectorySubtle Comment
		})
enddef

export def GitFile(path: string = "")
	if !empty(path)
		execute $"tcd {path}"
	endif
	popup.FilterMenu("Git File", systemlist('git ls-files'),
	(res, key) => {
		if key == "\<C-t>"
			execute $":tab e {res.text}"
		elseif key == "\<C-x>"
			execute $":split {res.text}"
		elseif key == "\<C-v>"
			execute $":vert split {res.text}"
		else
			execute $":e {res.text}"
		endif
	},
	(winid) => {
		win_execute(winid, 'syntax match FilterMenuDirectorySubtle "^.*\(/\|\\\)"')
		highlight! def link FilterMenuDirectorySubtle Comment
	})
enddef

export def Colorscheme()
	popup.FilterMenu("Colorscheme", getcompletion("", "color"),
		(res, key) => { execute $":colorscheme {res.text}" },
		(winid) => {
			win_execute(winid, $'syntax match FilterMenuColorscheme "^{g:colors_name}$"')
			highlight! def link FilterMenuColorscheme Statement
		})
enddef

export def Template()
	var path = $"{fnamemodify($MYVIMRC, ':p:h')}/templates/"
	var ft = getbufvar(bufnr(), '&filetype')
	var ft_path = path .. ft
	var tmpls = []
	if !empty(ft) && isdirectory(ft_path)
		tmpls = mapnew(readdirex(ft_path, (e) => e.type == 'file'), (_, v) => $"{ft}/{v.name}")
	endif
	if isdirectory(path)
		extend(tmpls, mapnew(readdirex(path, (e) => e.type == 'file'), (_, v) => v.name))
	endif
	popup.FilterMenu("Template", tmpls,
		(res, key) => {
			append(line('.'), readfile($"{path}/{res.text}"))
			if getline('.') =~ '^\s*$'
				del _
			else
				normal! j^
			endif
		})
enddef

export def Session()
	popup.FilterMenu("Session", map(glob($'{g:vimdata}/sessions/*', 1, 1),
		(_, v) => fnamemodify(v, ":t")),
		(res, key) => { execute $':%%bd | source {g:vimdata}/sessions/{res.text}' })
enddef

export def Bookmark()
	popup.FilterMenu("Bookmark",
	readfile($'{g:vimdata}/bookmarks.json')->join()->json_decode()->mapnew((_, v) => {
		return {text: $"{v.name} ({v.file})", file: v.file, line: v.line, col: v.col}
	}),
	(res, key) => {
		if key == "\<C-x>"
			execute $"split {res.file}"
		elseif key == "\<C-v>"
			execute $"vert split {res.file}"
		elseif key == "\<C-t>"
			execute $"tabe {res.file}"
		else
			execute $"confirm e {res.file}"
		endif
		execute $":{res.line}"
		execute $"normal! {res.col}|"
	},
	(winid) => {
		win_execute(winid, 'syntax match FilterMenuDirectorySubtle "(.*)$"')
		highlight! def link FilterMenuDirectorySubtle Comment
	})
enddef

export def File(path: string = "")
	var sep = has("win32") ? '\' : '/'
	var opath = path ?? expand("%:p:h")
	if !isdirectory(opath)
		opath = getcwd()
	endif
	var files = readdirex(opath, (d) => d.type =~ '\%(dir\|linkd\)$')->map((_, v) => {
		return {text: $"{v.name}{sep}", name: v.name, path: opath}
		}) + readdirex(opath, (d) => d.type =~ '\%(file\|link\)$')->map((_, v) => {
		return {text: v.name, name: v.name, path: opath}
		})
	if empty(files)
		files = [{text: "", name: "", path: opath}]
	endif
	popup.FilterMenu(pathshorten(opath), files, (res, key) => {
		if (key == "\<bs>" || key == "\<c-h>") && isdirectory(fnamemodify(res.path, ':p:h:h'))
			File($"{fnamemodify(res.path, ':p:h:h')}")
		elseif isdirectory($"{res.path}{sep}{res.name}")
			File($"{res.path}{res.path[-1] == sep ? '' : sep}{res.name}")
		elseif key == "\<C-x>"
			execute $"split {res.path}{sep}{res.name}"
		elseif key == "\<C-v>"
			execute $"vert split {res.path}{sep}{res.name}"
		elseif key == "\<C-t>"
			execute $"tabedit {res.path}{sep}{res.name}"
		else
			execute $"confirm e {res.path}{sep}{res.name}"
		endif
		},
		(winid) => {
			win_execute(winid, $"syntax match FilterMenuDirectory '^.*{sep->escape('\\')}'")
			highlight! def link FilterMenuDirectory Directory
		},
		true)
enddef

export def Filetype()
	popup.FilterMenu("Filetype", getcompletion("", "filetype"),
		(res, key) => {
			execute $":set ft={res.text}"
		})
enddef

export def Highlight()
	var hl = hlget()->mapnew((_, v) => {
		if v->has_key("cleared")
			return {text: $"xxx {v.name} cleared", name: v.name,
			value: $"highlight! {v.name}"}
		elseif v->has_key("linksto")
			return {text: $"xxx {v.name} links to {v.linksto}", name: v.name,
			value: $"highlight! link {v.name} {v.linksto}"}
		else
			var ctermfg = v->has_key('ctermfg') ? $' ctermfg={v.ctermfg}' : ''
			var ctermbg = v->has_key('ctermbg') ? $' ctermbg={v.ctermbg}' : ''
			var cterm = v->has_key('cterm') ? $' cterm={v.cterm->keys()->join(",")}' : ''
			var guifg = v->has_key('guifg') ? $' guifg={v.guifg}' : ''
			var guibg = v->has_key('guibg') ? $' guibg={v.guibg}' : ''
			var gui = v->has_key('gui') ? $' gui={v.gui->keys()->join(",")}' : ''
			return {text: $"xxx {v.name}{ctermfg}{ctermbg}{cterm}{guifg}{guibg}{gui}",
			name: v.name,
			value: $"highlight! {v.name}{ctermfg}{ctermbg}{cterm}{guifg}{guibg}{gui}"}
		endif
	})
	popup.FilterMenu("Highlight", hl, 
		(res, key) => { feedkeys($":{res.value}") },
		(winid) => {
			win_execute(winid, $"syntax match FilterMenuHiLinksTo '\\(links to\\)\\|\\(cleared\\)'")
			highlight! def link FilterMenuHiLinksTo Comment
			for h in hl
				win_execute(winid, $"syntax match {h.name} '^xxx\\ze {h.name}'")
			endfor
		})
enddef
