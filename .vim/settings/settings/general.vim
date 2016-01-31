
" turns syntax highlighting on
syntax on
filetype plugin indent on

" enables the reading of .vimrc, .exrc and .gvimrc
" in the current directory.
set exrc

" turns off shell and write commands in ".vimrc"
" and ".exrc" in the current directory
set secure

" updates content when ile is changed from the outside
set autoread

if has("gui_running")
	" turns off toolbar, menu and left scrollbar
	set guioptions-=T
	set guioptions-=m
	set guioptions-=L

	" use console dialogs instead of popup dialogs for simple choices
	set guioptions+=c

	" turns bottom scrollbar on
	set guioptions+=b

	" turns on text tabs
	set guioptions-=e

	" if (has("win32"))
	" 	set renderoptions=type:directx
	" endif
	"font for gui version
	set guifont=Consolas_for_Powerline_FixedD:h10,Consolas:h13,
endif

" current colorscheme
let g:gruvbox_italic = 0
let g:gruvbox_bold = 0
colorscheme gruvbox

" $-mode of text changing
"set cpoptions+=$
"
" autoupdate current directory
autocmd BufEnter * silent! lcd %:p:h

" shows line numbers
set number

" doesn't let unload buffer when it's closed
set hidden

" remap <leader> key to comma
let mapleader = ","

" turns word wrapping off
set nowrap

" max width of text inserted
set textwidth=80

" sets window size
set lines=80
set columns=200

" saves 50 lines in command line history
set history=50

" constantly shows cursor position
set ruler

" replaces tabulation with spaces
"set expandtab

" smart tabbing that takes into account 'shiftwidth', 'tabstop'
" and 'softtabstop' options
set smarttab

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" tabulation size
set tabstop=4

" size of indentation when entering << or >>
set shiftwidth=4

" takes indent info from previous line
set autoindent

" do not delete indentation from empty line when cursor is moved
set cpoptions+=I

" applies indentation rules for c
set cindent

" turns on 'smart indents'
"set smartindent

" copy the previous indentation on autoindenting
set copyindent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" no need to write 'g' flag when substituiting
set gdefault

" higlights specified column
set colorcolumn=80

" ignores case when searching
set ignorecase

" highlights search results
set hlsearch

" jumps to search results
set incsearch

" blinks instead of beeping
set visualbell

" highlights opening and closing brackets
set showmatch

" sets format of ruler
set rulerformat=%(%l,%c\ %p%%%)

" nice autocompletion in command line
set wildmenu
set wildmode=list:longest,full

" doesn't stop cursor at the end of line
set whichwrap=<,>,[,],h,l

" saves file when moving to another one
set autowrite

" sets default encoding
set encoding=utf8

" sets terminal encoding
set termencoding=utf8

" sets list of possible encodings
set fileencodings=utf8,cp1251,koi8r

" turns on autocomplete in command line
set showcmd

" displays the current mode
set showmode

" highlights current line
set cursorline
" set cursorcolumn
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" sets max number of opened tabs
set tabpagemax=10

" uses alt as it's supposed to be used (not to open win menu)
set winaltkeys=yes

" what to save when :mkview is called
set sessionoptions+=resize,winpos

" determines size of undo-history
set undolevels=1024

" constantly displays status line
set laststatus=2

" allows to move cursor in empty space
set virtualedit=all

" writes undo history in file
set undofile

" sets complete menu options
set completeopt=menuone,menu,longest

" displays special symbols like eol or whitespace
set list

" sets what symbols vim will show
set listchars=tab:··,trail:_,eol:¬

" turns on lazy redraw on completing scripts
set lazyredraw

" for russian keyboard layouts {{{
set keymap=russian-jcukenwin
cmap <silent> <C-S-Space> <C-^>
imap <silent> <C-S-Space> <C-^><Esc>
nmap <silent> <C-S-Space> a<C-^><Esc>

set iminsert=0
set imsearch=0
set iskeyword=@,48-57,_,192-255
language ctype Russian_Russia.1251
"}}}

" saves swapfiles in vim74/swapfiles/
set backup
set writebackup
set backupdir=$VIMRUNTIME/backupfiles/
set directory=$VIMRUNTIME/swapfiles/
set undodir=$VIMRUNTIME/undofiles/

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
