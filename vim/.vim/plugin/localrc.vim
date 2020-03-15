if exists('g:loaded_localrc')
  finish
endif

let g:loaded_localrc = 1

let s:config_filename = '.vimrc.local'

function! s:Find(...)
  let l:home_directory = expand('~')
  let l:project_path = getcwd()

  while l:project_path !=# l:home_directory && l:project_path !=# '/'
    let l:config_path = l:project_path . '/' . s:config_filename

    if filereadable(l:config_path)
      return l:config_path
    endif

    let l:project_path = fnamemodify(l:project_path, ':h')
  endwhile

  return ''
endfunction

function! s:Init(...)
  execute 'edit ' . getcwd() . '/' . s:config_filename
endfunction

function! s:Execute(...)
  let l:config_path = s:Find()

  if l:config_path ==# ''
    return
  end

  source `=l:config_path`
endfunction

augroup plugin-localrc
  autocmd!

  autocmd BufNewFile,BufReadPost * call s:Execute()
augroup END

command! LocalRcInit call s:Init()
