let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_php_phpcs_args = "--standard=Drupal"

set tags+=~/.tags/drupal750

setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal iskeyword+=$

vnoremap <buffer> <leader>d "dyodebug(<c-r>d);<esc>$

augroup FILETYPE
  autocmd!
  autocmd BufWritePost *.module,*.inc silent !ctags -R --language-force=php
augroup END

call textobj#user#plugin('function', {
      \   'code': {
      \     'pattern': ['\v(^\/\*\*\n(\s*\*.+\n)+\s\*\/)?^function.+\n?\{', '\v^}.*\n(\s*\n)?'],
      \     'select-a': 'af',
      \     'select-i': 'if',
      \   },
      \ })
