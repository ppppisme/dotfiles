set background=dark
colorscheme gruvoff

if !has('nvim')
  set t_Co=256
end

if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guioptions-=L
  set guioptions+=c
  set guioptions+=b
  set guioptions-=e
  set guifont=CtrlD 11
endif

set relativenumber
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
set cpoptions+=I
set cindent
set copyindent

set backspace=indent,eol,start
set path+=**
set colorcolumn=80
set ignorecase
set hlsearch
set incsearch
set smartcase
set visualbell
set showmatch
set wildmode=list:longest
set autoread
set whichwrap=<,>,[,],h,l
set autowrite
set encoding=utf8
set termencoding=utf8
set fileencodings=utf8
set showcmd
set showmode
set undolevels=1024
set virtualedit=all
set completeopt=menuone,menu,longest
set list
set listchars=tab:··,trail:_,eol:¬
set lazyredraw

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

function! SetActiveStatusline()
  setlocal statusline=
  setlocal statusline+=%#StatusLinePrefix#
  setlocal statusline+=\ :::\ 
  setlocal statusline+=%#StatusLine#
  setlocal statusline+=\ %f
  setlocal statusline+=\ %y
  setlocal statusline+=%=%{StatusLineFugitive()}\ \ 
endfunction

function! SetBlurredStatusline()
  setlocal statusline=
  setlocal statusline+=%#StatusLineNCPrefix#
  setlocal statusline+=\ :::\ 
  setlocal statusline+=%#StatusLineNC#
  setlocal statusline+=\ %f
  setlocal statusline+=\ %y
  setlocal statusline+=%=%{StatusLineFugitive()}\ \ 
endfunction

autocmd BufEnter,FocusGained,VimEnter,WinEnter * call SetActiveStatusline()
autocmd FocusLost,WinLeave * call SetBlurredStatusline()
