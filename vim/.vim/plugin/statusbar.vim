if exists("g:loaded_statusbar")
  finish
endif

let g:loaded_statusbar = 1

function! SetActiveStatusline()
  setlocal statusline=
  setlocal statusline+=%#StatusLinePrefix#
  setlocal statusline+=\ :::\ 
  setlocal statusline+=%#StatusLine#
  setlocal statusline+=\ %f
  setlocal statusline+=\ %y
endfunction

function! SetBlurredStatusline()
  setlocal statusline=
  setlocal statusline+=%#StatusLineNCPrefix#
  setlocal statusline+=\ :::\ 
  setlocal statusline+=%#StatusLineNC#
  setlocal statusline+=\ %f
  setlocal statusline+=\ %y
endfunction

autocmd BufEnter,FocusGained,VimEnter,WinEnter * call SetActiveStatusline()
autocmd FocusLost,WinLeave * call SetBlurredStatusline()
