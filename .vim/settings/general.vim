

if has("nvim")
	" fixes clipboard issue
	set pastetoggle=<f6>
endif

" turns syntax highlighting on
syntax on
filetype plugin indent on

set exrc   " reads from .vimrc, .exrc and .gvimrc in the current directory
set secure " disables shell and write commands in local .vimrc

" updates content when ile is changed from the outside
set autoread

" current colorscheme
colorscheme gruvbox
set background=dark
set t_Co=256

if has("gui_running")
	" turns off toolbar, menu and left scrollbar
	set guioptions-=T
	set guioptions-=m
	set guioptions-=L

	set guioptions+=c   	" use console dialogs instead of popup dialogs for simple choices
	set guioptions+=b   	" turns bottom scrollbar on
	set guioptions-=e   	" turns on text tabs

	" if (has("win32"))
	" 	set renderoptions=type:directx
	" endif
	set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11  " font for gui version
	set cursorline   	" highlights current line
	" colorscheme gruvbox
	" set background=dark
	set nocursorline
endif

set number   " shows line numbers
set hidden   " doesn't let unload buffer when it's closed
let mapleader = ","   " remap <leader> key to comma

set nowrap   " turns word wrapping off
set textwidth=80   " max width of text inserted

set history=50   " saves 50 lines in command line history
"set expandtab   " replaces tabulation with spaces
"
" smart tabbing that takes into account 'shiftwidth', 'tabstop'
" and 'softtabstop' options
set smarttab

set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=4   " tabulation size
set shiftwidth=4   " size of indentation when entering << or >>


set autoindent   " takes indentation info from previous line

set cpoptions+=I   " do not delete indentation from empty line when cursor is moved
set cindent   " applies indentation rules for c
"set smartindent   " turns on 'smart indents'
set copyindent   " copy the previous indentation on autoindenting
set backspace=indent,eol,start   " allow backspacing over everything in insert mode


set colorcolumn=80   " higlights specified column

set ignorecase   " ignores case when searching
set hlsearch   " highlights search results
set incsearch   " jumps to search results
set smartcase   " be case sensitive only when there is at least one uppercase symbol in pattern

set visualbell   " blinks instead of beeping

set showmatch   " highlights opening and closing brackets

set laststatus=2   " constantly displays status line
set ruler   " constantly shows cursor position
set rulerformat=%(%l,%c\ %p%%%)   " sets format of ruler

set wildmenu   " nice autocompletion in command line

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
