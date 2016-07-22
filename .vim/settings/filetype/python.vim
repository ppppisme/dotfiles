
nnoremap <buffer> <F10> :!python %<cr>
inoremap <buffer> <F10> <esc>:!python %<cr>:startinsert<cr>

setlocal iskeyword-=#
let g:syntastic_python_checkers = ['pyflakes']  " 'flake8',

" python-tags stuff -------------- {{{
function! UpdateTags()
	:w
	call xolox#misc#os#exec({'command': 'ctags -R --sort=yes --python-kinds=-cifmv --language-force=python .', 'async': 1})

	execute":redraw!"
	echohl StatusLine | echo"Python tags updated" | echohl None
endfunction
" }}}
"
noremap <buffer> <F2> :call UpdateTags()<cr>
inoremap <buffer> <F2> <esc>:call UpdateTags()<cr>:startinsert<cr>
