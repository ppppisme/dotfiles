"set tags+=$VIMRUNTIME\tags\cpp
"set tags+=$VIMRUNTIME\tags\c

let g:gitgutter_enabled = 1

autocmd FileType c,h,hpp au BufWinEnter * set filetype=cpp

" highlights lines when it's longer than 80 symbols
" let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)

" cpp-tags stuff -------------- {{{
function! UpdateTags()
	:w
	call xolox#misc#os#exec({'command': 'ctags -R --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q --language-force=C++ .', 'async': 1})
	execute":redraw!"
	echohl StatusLine | echo"C/C++ tags updated" | echohl None
endfunction

"au FileType c,h,cpp,hpp au BufWinEnter * exe"cscope add" . Cscope_Find_DB()
" }}}

noremap <buffer> <F2> :call UpdateTags()<cr>
inoremap <buffer> <F2> <esc>:call UpdateTags()<cr>:startinsert<cr>

noremap <buffer> <F8> :Errors
inoremap <buffer> <F8> <esc>:Errors :startinsert<cr>

noremap <buffer> <F9> :!make<cr>:!exe/main.exe<cr>
inoremap <buffer> <F9> <esc>:!make<cr>:!exe/main.exe<cr>

noremap <buffer> <F10> :!g++ -o ./exe/test % && exe/test<cr>
inoremap <buffer> <F10> <esc>:!g++ -o ./exe/test % && exe/test<cr>
