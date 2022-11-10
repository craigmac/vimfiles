set tabstop=2
set shiftwidth=2
set expandtab

if exists("b:undo_ftplugin")
	let b:undo_ftplugin ..= " | setl ts< sw< et<"
else
	let b:undo_ftplugin = "setl ts< sw< et<"
endif

