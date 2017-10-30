" current colorscheme
colorscheme gruvbox
let g:gruvbox_syntax_highlighting = 0
set background=dark

if !has('nvim')
  set t_Co=256
end

if has("gui_running")
  " turns off toolbar, menu and left scrollbar
  set guioptions-=T
  set guioptions-=m
  set guioptions-=L
  set guioptions+=c   " use console dialogs instead of popup dialogs for simple choices
  set guioptions+=b   " turns bottom scrollbar on
  set guioptions-=e   " turns on text tabs
  set guifont=CtrlD 11 " font for gui version
endif

set number   " shows line numbers
set hidden   " doesn't let to unload buffer when it's closed
set nowrap   " turns word wrapping off
set showbreak=->   " shows this symbol at the beginning of wrapped lines
set history=50   " saves 50 lines in command line history
set expandtab   " replaces tabulation with spaces
"
" smart tabbing that takes into account 'shiftwidth', 'tabstop'
" and 'softtabstop' options
set smarttab
set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=2   " tabulation size
set shiftwidth=2   " size of indentation when entering << or >>
set autoindent   " takes indentation info from previous line
set cpoptions+=I   " do not delete indentation from empty line when cursor is moved
set cindent   " applies indentation rules for c
set copyindent   " copy the previous indentation on autoindenting

set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set path+=** " search files recursively
set colorcolumn=80   " higlights specified column
set ignorecase   " ignores case when searching
set hlsearch   " highlights search results
set incsearch   " jumps to search results
set smartcase   " be case sensitive only when there is at least one uppercase symbol in pattern
set visualbell   " blinks instead of beeping
set showmatch   " highlights opening and closing brackets
set wildmode=list:longest " nice autocompletion in command line
set autoread   " updates content when file is changed from the outside
set whichwrap=<,>,[,],h,l   " doesn't stop cursor at the end of line
set autowrite   " saves file when moving to another
set encoding=utf8   " sets default encoding
set termencoding=utf8   " sets terminal encoding
set fileencodings=utf8,cp1251,koi8r   " sets list of possible encodings
set showcmd   " turns on autocomplete in command line
set showmode   " displays the current mode
set undolevels=1024   " determines size of undo-history
set virtualedit=all   " allows to move cursor in empty space
set completeopt=menuone,menu,longest   " sets complete menu options
set list   " displays special symbols like eol or whitespace
set listchars=tab:··,trail:_,eol:¬   " sets what symbols vim will show
set lazyredraw   " turns on lazy redraw on completing scripts

" custom directories for storing backup, swap and undo files
set backup
set writebackup
set undofile   " writes undo history in file
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

augroup common
  autocmd!
  " restores cursor position in file on load
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe"normal g`\"" |
        \ endif
  " saves a document on lost focus
  "autocmd FocusLost * :wa
augroup end

" tree-like netrw style
let g:netrw_liststyle = 3

" live substitution
if exists('&inccommand')
  set inccommand=split
endif

" use ack for vimgrep
if executable('ack')
  set grepprg=ack
endif

set laststatus=2   " constantly displays status line
set noruler   " do not display the cursor position at the bottom right corner

" statusbar format
function! SetActiveStatusline()
  setlocal statusline=
  setlocal statusline+=%#TermCursor#
  setlocal statusline+=\ \ \ \ %{StatusLineFugitive()}\ 
  setlocal statusline+=%#SignColumn#
  setlocal statusline+=\ %f
  setlocal statusline+=\ %y
endfunction

function! SetBlurredStatusline()
  setlocal statusline=
  setlocal statusline+=%#Folded#
  setlocal statusline+=\ \ \ \ %{StatusLineFugitive()}\ 
  setlocal statusline+=%#LineNr#
  setlocal statusline+=\ %f
  setlocal statusline+=\ %y
endfunction

autocmd BufEnter,FocusGained,VimEnter,WinEnter * call SetActiveStatusline()
autocmd FocusLost,WinLeave * call SetBlurredStatusline()
