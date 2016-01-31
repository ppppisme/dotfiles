
nnoremap <buffer> <F10> :!python %<cr>
inoremap <buffer> <F10> <esc>:!python %<cr>:startinsert<cr>

setlocal completeopt-=preview
"setlocal omnifunc=jedi#completions
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 2

let g:gitgutter_enabled = 1

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
