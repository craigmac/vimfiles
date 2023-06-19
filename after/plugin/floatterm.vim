if !get(g:, 'loaded_floaterm') | finish | endif

nnoremap <leader>ts <Cmd>FloatermNew --wintype=split --height=10 zsh<CR>
nnoremap <leader>tv <Cmd>FloatermNew --wintype=vsplit --width=0.4 zsh<CR>
nnoremap  <Cmd>FloatermToggle zsh<CR>
tnoremap  <Cmd>FloatermToggle zsh<CR>

" FloatermNew! will run <cmd> as child of shell so when quit it
" goes back to shell
if !executable('lazygit') | finish | end
nnoremap <Leader>gg <Cmd>FloatermNew --width=1.0 --height=1.0 lazygit<CR>

if !executable('ranger') | finish | end
nnoremap <Leader>rr <Cmd>FloatermNew --width=1.0 --height=1.0 ranger<CR>

" create a term with --name=repl first
xnoremap <Leader><CR> :FloatermSend --name=repl<CR>
