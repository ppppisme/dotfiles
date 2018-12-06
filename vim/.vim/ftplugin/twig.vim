if exists("b:did_ftplugin_twig")
  finish
endif

let b:did_ftplugin_twig = 1

setlocal comments=s:{#,ex:#}
setlocal commentstring={#%s#}
setlocal formatoptions+=tcqln
" setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

" matchit
let b:match_words = ''
let b:twigMatchWords = [
            \ ['block', 'endblock'],
            \ ['for', 'endfor'],
            \ ['macro', 'endmacro'],
            \ ['if', 'elseif', 'else', 'endif'],
            \ ['set', 'endset'],
            \ ['embed', 'endembed']
            \]
for s:element in b:twigMatchWords
    let s:pattern = ''
    for s:tag in s:element[:-2]
        if s:pattern != ''
            let s:pattern .= ':'
        endif
        let s:pattern .= '{%\s*\<' . s:tag . '\>\s*\%(.*=\)\@![^}]\{-}%}'
    endfor
    let s:pattern .= ':{%\s*\<' . s:element[-1:][0] . '\>\s*.\{-}%}'
    let b:match_words .= ',' . s:pattern
endfor

" if exists("b:did_ftplugin_twig")
"   let b:undo_ftplugin .= "|setlocal comments< formatoptions<"
" else
"   let b:undo_ftplugin = "setlocal comments< formatoptions<"
" endif
