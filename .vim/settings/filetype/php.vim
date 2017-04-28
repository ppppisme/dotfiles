let g:ale_php_phpmd_ruleset = 'cleancode,codesize,design,unusedcode'

setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal iskeyword+=$

vnoremap <buffer> <leader>d "dyodpm(<c-r>d);<esc>$
