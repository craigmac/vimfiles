vim9script

# Returns winnr of created popup window
export def ShowAtCursor(text: any): number
	return popup_atcursor(CleanCR(text), {
		border: [],
		borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
		filter: "PopupFilter",
		filtermode: 'n',
		mapping: 0,
		padding: [0, 1, 0, 1],
		pos: "botleft"
	})
enddef

def PopupFilter(winid: number, key: string): bool
    if key == "\<Space>"
        win_execute(winid, "normal! \<C-d>\<C-d>")
        return true
    endif
    if key == "j"
        win_execute(winid, "normal! \<C-d>")
        return true
    endif
    if key == "k"
        win_execute(winid, "normal! \<C-u>")
        return true
    endif
    if key == "\<ESC>"
        popup_close(winid)
        return true
    endif
    return true
enddef

# Returns a string or a list of strings with <CR>'s stripped
def CleanCR(text: any): any
	if type(text) == v:t_string
		return trim(text, "\<CR>", 2)
	elseif type(text) == v:t_list
		return text->mapnew((_, v) => trim(v, "\<CR>", 2))
	endif
	return text
enddef

# Usage:
# call popup#FilterMenu("Title of Popup", ["choice one", "choice two", "choice three"],
#						(res, key) => {
#							echo res
#							if key == "\<C-x>" | echo 'C-x' pressed | endif
#						},
#						(winid) => { 
#							# this is the optional 'Setup' param to call with winid to setup local
#							# options, highlighting, etc.
#							win_execute(winid, 'syntax match SomeHLGroup "^regex")
#						})
# TODO: a settings: dict<any> parameter here would be nicer, like:
# def FilterMenu(itemsToFilter: list<dict<any>>, settings: <dict<any>>)
# settings dict would be:
# { 
#		title: <string>, 
#		callback: func(any, string), 
#		on_load: func(number) = null_function,
#		closeOnBackspace: bool = false
# }
export def FilterMenu(title: string, items: list<any>, Callback: func(any, string), 
											Setup: func(number) = null_function, close_on_bs: bool = false)
	if empty(prop_type_get('FilterMenuMatch'))
		highlight! default link FilterMenuMatch Constant
		prop_type_add('FilterMenuMatch', {
			highlight: "FilterMenuMatch", 
			override: true, 
			priority: 1000 
		})
	endif

	var prompt = ""  # string we are fuzzy matching against
	# TODO: make this changeable? really should be a settings dict param 
	var hint = ">>> type to filter <<<"
	var items_dict: list<dict<any>>

	# Dealing with 'items' parameter
	# TODO: I don't get this part, why not just make 'items' parameter
	# list<dict<any>> and remove items_dict altogether and check here
	# for len(items[0]) < 1
	if len(items) < 1
		items_dict = [{text: ""}]
	elseif items[0]->type() != v:t_dict
		# if first element of list is not a dict, then turn all them into dicts
		items_dict = items->mapnew((_, v) => {
			return {text: v}
		})
	else
		items_dict = items
	endif

	var filtered_items: list<any> = [items_dict]

	# TODO: remove this completely and put in script scope?
	def Printify(itemsAny: list<any>, props: list<any>): list<any>
		if itemsAny[0]->len() == 0 | return [] | endif
		if itemsAny->len() > 1
			return itemsAny[0]->mapnew((idx, v) => {
				return {
					text: v.text, 
					props: itemsAny[1][idx]->mapnew((_, c) => {
						return {
							col: v.text->byteidx(c) + 1, 
							length: 1, 
							type: 'FilterMenuMatch'
						}
					})
				}
			})
		else
			return itemsAny[0]->mapnew((_, v) => { return { text: v.text } })
		endif
	enddef

	var height = min([&lines - 6, items->len()])
	var pos_top = ((&lines - height) / 2) - 1
	var winid = popup_create(Printify(filtered_items, []), {
		title: $" {title}: {hint} ",
		line: pos_top,
		minwidth: (&columns * 0.6)->float2nr(),
		maxwidth: (&columns - 5),
		minheight: height,
		maxheight: height,
		border: [],
		borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
		drag: 0,
		wrap: 1,
		cursorline: false,
		padding: [0, 1, 0, 1],
		mapping: 0,
		filter: (id, key) => {
			if key == "\<ESC>"
				popup_close(id, -1)
			elseif ["\<CR>", "\<C-x>", "\<C-v>", "\<C-t>"]->index(key) > -1
				&& filtered_items[0]->len() > 0
				popup_close(id, { idx: getcurpos(id)[1], key: key })
			elseif key == "\<Tab>" || key == "\<C-n>"
				var ln = getcurpos(id)[1]
				win_execute(id, "normal! j")
				if ln == getcurpos(id)[1] | win_execute(id, "normal! gg") | endif
			elseif key == "\<S-tab>" || key == "\<C-p>"
				var ln = getcurpos(id)[1]
				win_execute(id, "normal! k")
				if ln == getcurpos(id)[1] | win_execute(id, "normal! G") | endif
			elseif key != "\<cursorhold>" && key != "\<ignore>"
				if key == "\<C-u>" && !empty(prompt)
					prompt = ""
					filtered_items = [items_dict]
				elseif (key == "\<C-h>" || key == "\<BS>")
					if empty(prompt) && close_on_bs  # optional param, default false
						popup_close(id, {idx: getcurpos(id)[1], key: key})
						return true
					endif
					prompt = prompt->strcharpart(0, prompt->strchars() - 1)
					if empty(prompt)
							filtered_items = [items_dict]
					else
							filtered_items = items_dict->matchfuzzypos(prompt, {key: "text"})
					endif
				elseif key =~ '\p'
					prompt ..= key
					filtered_items = items_dict->matchfuzzypos(prompt, {key: "text"})
				endif
				popup_settext(id, Printify(filtered_items, []))
				popup_setoptions(id, {title: $" {title}: {prompt ?? hint} "})
			endif
			return true
		},  # filter key done
		callback: (id, result) => {
			if result->type() == v:t_number
				if result > 0
					Callback(filtered_items[0][result - 1], "")
				endif
			else
					Callback(filtered_items[0][result.idx - 1], result.key)
			endif
		}
	})

	win_execute(winid, "setlocal nonumber cursorline cursorlineopt=both")
	if Setup != null_function
		Setup(winid)
	endif
enddef
