let g:phpactorInitialCwd=FindProject('.git')

nnoremap <buffer>g] :call phpactor#GotoDefinition()<cr>
nnoremap <buffer><leader>rr :call phpactor#ContextMenu()<cr>
nnoremap <buffer><leader>rt :call phpactor#Transform()<cr>
vnoremap <buffer><leader>re :call phpactor#ExtractMethod()<cr>

" generate getter for class field that is on current line
nnoremap <buffer><leader>rg md02w"gyef$l"fyt;GOpublic function getf(): g{}<ESC>Oreturn $this->f;<ESC>2k03W3lgUl<ESC>0`d

setlocal omnifunc=phpactor#Complete

let g:ale_fixers = {
      \   'php': [
      \       'php_cs_fixer',
      \   ],
      \}

let g:ale_php_phpmd_executable = 'phpmd'
let g:ale_php_phpmd_ruleset = 'unusedcode,cleancode,codesize'
let g:ale_php_phpmd_suffixes = 'php,module,inc,theme,install,profile,theme'

let g:ale_php_phpcs_use_global = 0
let g:ale_php_cs_fixer_use_global = 1

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal iskeyword+=$
