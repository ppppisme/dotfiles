syntax on
filetype plugin indent on

let mapleader = ","

" {{{ USER FUNCTIONS
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
" }}}

" {{{ PLUGINS
set packpath=~/.config/nvim

"---
" ale
"---
" wow it's cpu consuming, so check only on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '>>'
let g:ale_fix_on_save = 1

"---
" surround
"---
let g:surround_indent = 0
" }}}

" {{{ GENERAL
set background=dark
colorscheme gruvoff

if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guioptions-=L
  set guioptions+=c
  set guioptions+=b
  set guioptions-=e
  set guifont=Hack\ 12
endif

set hidden
set nowrap
set showbreak=->
set history=50
set expandtab
set smarttab
set shiftround
set tabstop=2
set shiftwidth=2
set autoindent
set copyindent
set cinkeys=

set path=.,,
set wildmenu
set wildmode=list,full

set pastetoggle=<F2>
set backspace=indent,eol,start
set colorcolumn=80
set ignorecase
set hlsearch
set incsearch
set smartcase
set visualbell t_vb=
set showmatch
set autoread
set autowrite
set virtualedit=all
set completeopt=menuone,menu,longest
set list
set listchars=tab:··,trail:_,eol:¬
set lazyredraw

set spelllang=en,ru

set updatetime=100

set backup
set writebackup
set undofile
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

augroup common
  autocmd!
  " restores cursor position in file on load
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe"normal g`\"" |
augroup end

" tree-like netrw style
let g:netrw_liststyle = 3

" live substitution
if exists('&inccommand')
  set inccommand=split
endif

if executable('ack')
  set grepprg=ack
endif

set laststatus=2
set noruler

" highlight merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}

" {{{ MAPPINGS
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

nnoremap <leader>vv :vi $MYVIMRC<cr>

inoremap jk <esc>

nmap / /\v
nmap ? ?\v

nmap <space> :
nnoremap \ ,

nnoremap <leader>e :e <C-r>=expand('%:h')<cr>/
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>stw :call StripTrailingWhitespace()<cr>

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>ss :Search<cr>
nnoremap <leader>sw :silent! grep! <cword> \| copen<CR><C-l>
vnoremap <leader>sw :call SearchVisual()<cr>

nnoremap <leader>f :find 
nnoremap <leader>F :find **/*
nnoremap <leader>b :buffer 

nnoremap <leader><leader> :e ~/.vim/minisnip/_
" }}}
