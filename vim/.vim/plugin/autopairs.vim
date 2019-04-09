if exists('g:loaded_autopairs') || &cp
    finish
endif
let g:loaded_autopairs = 1

if !exists('g:autopairs_pairs')
  let g:autopairs_pairs = {
        \ '[': ']',
        \ '{': '}',
        \ '(': ')',
        \ '"': '"',
        \ "'": "'",
        \ '`': '`'
        \ }
endif

function! s:handle(char)
  if a:char == getline(".")[col(".") - 1]
    return "\<C-o>l"
  endif

  return repeat(a:char, 2) . "\<Left>"
endfunction

function! s:close(closing_char)
  if a:closing_char == getline(".")[col(".") - 1]
    return "\<Right>"
  endif

  return a:closing_char
endfunction

function! s:open(opening_char, closing_char)
    return a:opening_char . a:closing_char . "\<Left>"
endfunction

for opening_char in keys(g:autopairs_pairs)
  let closing_char = g:autopairs_pairs[opening_char]

  if closing_char == opening_char
    execute 'inoremap <expr><silent>' . opening_char
          \ . " <SID>handle('" . substitute(closing_char, "'", "''", 'g') . "')"

    continue
  endif

  execute 'inoremap <expr><silent>' . opening_char
        \ . " <SID>open('" . opening_char . "', '" . closing_char . "')"
  execute 'inoremap <expr><silent>' . closing_char
        \ . " <SID>close('" . closing_char . "')"
endfor
