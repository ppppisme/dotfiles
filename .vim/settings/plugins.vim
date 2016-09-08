" list of plugins {{{
call plug#begin('~/.vim/plugged')

" file system navigation
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-grepper'

" linter
Plug 'scrooloose/syntastic'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" buffer navigation
Plug 'tpope/vim-unimpaired'

" decoration stuff
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'

" organiser features
Plug 'duff/vim-scratch'

" auto completion
Plug 'ervandew/supertab'
if has("nvim")
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" python
Plug 'davidhalter/jedi-vim'

" text navigation
Plug 'thinca/vim-visualstar'

" script runner
Plug 'thinca/vim-quickrun'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" language support
Plug 'sheerun/vim-polyglot'

" misc
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'matchit.zip'
Plug 'vladgor/metal-vim-rising'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'vladgor/itg_flat_vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'wombat256.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'tpope/vim-vividchalk'
Plug 'w0ng/vim-hybrid'

" new themes
Plug 'AlessandroYorba/Sierra'
Plug 'AlessandroYorba/Alduin'

call plug#end()
"}}}


" plugins settings {{{
"---
"Grepper
"---
nnoremap <leader>g :Grepper<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)


"---
"SuperTab
"---
let g:SuperTabDefaultCompletionType = "context"


"---
"Jedi
"---
let g:jedi#popup_on_dot = 0


"---
"deoplete
"---
let g:deoplete#enable_at_startup = 1


"---
"UltiSnips
"---
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-j>"


"---
"Syntastic
"---
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let b:syntastic_mode = "active"
let g:syntastic_loc_list_height = 4


"---
"QuickRun
"---
nnoremap <leader>q :QuickRun<cr>
vnoremap <leader>q :QuickRun<cr>


"---
"Ctrlp
"---
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = '~/.vim/ctrlp/'
let g:ctrlp_max_depth = 10
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_extensions = ['tag','mixed']
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_custom_ignore = '\v\.(o|git|hg|svn)$'

nnoremap <leader>f :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMRU<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>


"---
"Scratch
"---
nnoremap gs :Sscratch<cr>


"---
"Lightline
"---

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'fugitive' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
"}}}
