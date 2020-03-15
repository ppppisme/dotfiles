" https://github.com/romainl/vim-cool/issues/9

if exists("g:loaded_resethl")
  finish
endif

let g:loaded_resethl = 1

noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

function! HlSearch()
  let s:pos = match(getline('.'), @/, col('.') - 1) + 1

  if s:pos != col('.')
    call StopHL()
  endif
endfunction

function! StopHL()
  if !v:hlsearch || mode() isnot 'n'
    return
  endif

  silent call feedkeys("\<Plug>(StopHL)", 'm')
endfunction

augroup SearchHighlight
  autocmd!
  autocmd CursorMoved * call HlSearch()
  autocmd InsertEnter * call StopHL()
augroup end
