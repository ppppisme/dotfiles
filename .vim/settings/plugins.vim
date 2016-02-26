
" list of plugins {{{
call plug#begin('~/.vim/plugged')
" file system navigation
	Plug 'scrooloose/NERDTree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'tacahiroy/ctrlp-funky'
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
	Plug 'szw/vim-ctrlspace'
" decoration stuff
	Plug 'bling/vim-airline'
	Plug 'lilydjwg/colorizer'
	" Plug 'mhinz/vim-startify'
	Plug 'kien/rainbow_parentheses.vim'
	Plug 'myusuf3/numbers.vim'
" organiser features
	Plug 'TaskList.vim'
	Plug 'aaronbieber/vim-quicktask'
	Plug 'duff/vim-scratch'
" auto completion
	Plug 'ervandew/supertab'
	Plug 'Valloric/YouCompleteMe'
" python
	Plug 'davidhalter/jedi-vim'
" text navigation
	Plug 'majutsushi/tagbar'
	Plug 'wincent/ferret'
	Plug 'rhysd/clever-f.vim'
	Plug 'justinmk/vim-sneak'
	Plug 'thinca/vim-visualstar'
" script runner
	Plug 'thinca/vim-quickrun'
" text objects
	" Plug 'wellle/targets.vim'
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-function'
	Plug 'kana/vim-textobj-entire'
	Plug 'glts/vim-textobj-comment'
	Plug 'michaeljsmith/vim-indent-object'
" misc
	Plug 'tpope/vim-commentary'
	Plug 'Raimondi/delimitMate'
	Plug 'matchit.zip'
	Plug 'tpope/vim-dispatch'
	Plug 'tpope/vim-repeat'
	Plug 'xolox/vim-shell'
	Plug 'xolox/vim-misc'
	Plug 'tpope/vim-surround'

" testing
call plug#end()
"}}}

" plugins settings {{{
"---
"SuperTab
"---
let g:SuperTabDefaultCompletionType = "context"

"---
"Jedi
"---
let g:jedi#popup_on_dot = 0

"---
"Sneak
"---
let g:sneak#streak = 1
let g:sneak#s_next = 0

"---
"YankRing
"---
"let g:yankring_replace_n_pkey = "<F7>"
"let g:yankring_replace_n_nkey = "<F8>"
"let g:yankring_share_between_instances = 1

"---
"CtrlSpace
"---
let g:ctrlspace_symbols = {
	\ "cs":      "#",
	\ "tab":     "TAB",
	\ "all":     "ALL",
	\ "file":    "FILE",
	\ "tabs":    "-",
	\ "c_tab":   "+",
	\ "load":    "|::|",
	\ "save":    "[::]",
	\ "zoom":    "*",
	\ "s_left":  "[",
	\ "s_right": "]",
	\ "bm":      "BM",
	\ "help":    "?",
	\ "iv":      "-",
	\ "ia":      "*",
	\ "im":      "+",
	\ "dots":    "..."
	\ }


"---
"UltiSnips
"---
let g:UltiSnipsExpandTrigger = "<C-s>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-j>"


"---
"Syntastic
"---
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let b:syntastic_mode = "active"
let g:syntastic_loc_list_height = 4


"---
"YouCompleteMe
"---
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_filepath_completion_use_working_dir = 1


"---
"Airline
"---
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_detect_iminsert = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_z = "[0x%04B],%#__accent_bold# %l%#__restore__#/%v (%p%%)"
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V(lw)',
  \ '' : 'V(bw)',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
"
"---
"Ctrlp
"---
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = '~/.vim/ctrlp/'
let g:ctrlp_max_depth = 10
let g:ctrlp_working_path_mode = 'crw'
let g:ctrlp_extensions = ['tag','mixed']
let g:ctrlp_funky_multi_buffers = 1

"---
"Startify
"---
" let g:startify_list_order = ['files', 'bookmarks', 'sessions']
" let g:startify_bookmarks = [$MYVIMRC]
" let g:startify_session_autoload = 1
" let g:startify_session_dir = '~/.vim/sessions'
" let g:startify_session_persistence = 1

" let g:startify_custom_header = [
" 		\'  \__   \__/  \__   \__/  \__   \__/  \__   \__/  \__   \__/  \__    ',
"         \'__   \__/  \__   \__/  \__   \__/  \__   \__/  \__   \__/  \__   \__/ ',
"         \'  \__/  \     \__/  \     \__/  \     \__/  \     \__/  \     \__/  \ ',
"         \'__/     /   __/     /                           __/     /   __/     / ',
"         \'  \__   \__/  \__   \     \  / | |\/|          /  \__   \__/  \__   \_',
"         \'     \__/  \     \__/      \/  | |  | 7.4      \     \__/  \     \__/ ',
"         \'   __/     /   __/                             /   __/     /   __/    ',
"         \'__/  \__   \__/  \__    __    __    __    __   \__/  \__   \__/  \__  ',
"         \'  \     \__/  \     \__/  \     \__/  \     \__/  \     \__/  \     \_',
"         \'  /   __/     /   __/     /   __/     /   __/     /   __/     /   __/ ',
"         \'  \__/  \__   \__/  \__   \__/  \__   \__/  \__   \__/  \__   \__/  \_',
" 		\'',
" 		\'',
" 		\ ]

"---
"Tagbar
"---
let g:tagbar_width = 40

"---
"Shell
"---
let g:shell_mappings_enabled = 0

"---
"GitGutter
"---
let g:gitgutter_enabled = 0


"---
"Ferret
"---
let g:FerretMap = 1
let g:FerretDispatch = 1
let g:FerretHlsearch = 0


"---
"NERDTree
"---
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1


"---
"Rainbow parentheses
"---
augroup rainbow_parentheses
	autocmd!
	autocmd VimEnter * RainbowParenthesesToggle
	autocmd Syntax * RainbowParenthesesLoadRound
	autocmd Syntax * RainbowParenthesesLoadSquare
	autocmd Syntax * RainbowParenthesesLoadBraces
augroup end
"}}}
