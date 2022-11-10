setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal list

if exists("b:undo_ftplugin")
	let b:undo_ftplugin ..= " | setl et< sw< sts< ts< list<"
else
	let b:undo_ftplugin = "setl et< sw< sts< ts< list<"
endif

