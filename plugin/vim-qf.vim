vim9script

# open current item in (s)plit, (v)ertical, (t)ab, (o)pen and come back,
# (O)pen and close loc/qf window, (p)review
g:qf_mapping_ack_style = 1

nnoremap <Leader>q <Plug>(qf_qf_toggle)
nnoremap <Leader>l <Plug>(qf_log_toggle)

augroup my.augroup.quickfix | au!
autocmd FileType qf {
	nnoremap <buffer> dd :.Reject<CR>
	xnoremap <buffer> d :Reject<CR>
}
augroup END
