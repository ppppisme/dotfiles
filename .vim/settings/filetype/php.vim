
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_php_phpcs_args = "--standard=Drupal"

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

augroup FILETYPE
	autocmd!
	autocmd BufWritePost *.module,*.inc silent !ctags -R --language-force=php
augroup END
