" https://github.com/Donaldttt/fuzzyy

if !get(g:, 'loaded_fuzzyy') | finish | endif

nnoremap <silent> <Leader>f <Cmd>FuzzyFiles<CR>
nnoremap <silent> <Leader><F1> <Cmd>FuzzyHelps<CR>
nnoremap <silent> <Leader>/ <Cmd>FuzzyGrep<CR>
nnoremap <silent> <Leader>b <Cmd>FuzzyBuffers<CR>

let g:fuzzyy_menu_matched_hl = 'Search'
let g:fuzzyy_dropdown = 1
