augroup FILETYPE_ALIASES
  autocmd!
  autocmd BufNewFile,BufRead *.module,*.inc,*.install,*.profile,*.theme set filetype=php
  autocmd BufNewFile,BufRead *.info set filetype=dosini
  autocmd BufNewFile,BufRead *.tpl.php set filetype=phtml
augroup END
