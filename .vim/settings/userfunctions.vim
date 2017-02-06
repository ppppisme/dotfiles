function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Taken from here:
" https://gist.github.com/manasthakur/5afd3166a14bbadc1dc0f42d070bd746
function! Search()
  let grep_term = input("Search for: ")
  if !empty(grep_term)
    execute 'silent! grep!' grep_term | copen
  endif
  redraw!
endfunction

command! Search call Search()
