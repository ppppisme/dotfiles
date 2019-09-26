" Taken from here: http://stackoverflow.com/a/6271254
function! GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Taken from here:
" https://gist.github.com/manasthakur/5afd3166a14bbadc1dc0f42d070bd746
function! Search(...)
  let default_text = get(a:, 1, '')
  let grep_term = input("Search for: ", default_text)

  if !empty(grep_term)
    execute 'silent! grep!' grep_term | copen
  endif
  redraw!
endfunction

function! SearchVisual()
  call Search("'" . escape(GetVisualSelection(), ".+*?=/$^[](){}|'\"") . "'")
endfunction

" Taken from here: https://stackoverflow.com/a/9464929
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! FindProject(...)
  let l:config_dir_name = a:1

  let l:home_directory = expand('~')
  let l:project_path = getcwd()
  while l:project_path !=# l:home_directory && l:project_path !=# '/'
    let l:vimrc_path = l:project_path . '/' . l:config_dir_name
    if filereadable(l:vimrc_path) || isdirectory(l:vimrc_path)
      return l:project_path
    endif

    let l:project_path = fnamemodify(l:project_path, ':h')
  endwhile

  return getcwd()
endfunction

command! Search call Search()
command! SearchVisual call SearchVisual()
command! GetSyntax call SynStack()
