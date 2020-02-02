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

command! GetSyntax call SynStack()
