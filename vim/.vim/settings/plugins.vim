" install Plug if missing. taken from here:
" https://www.reddit.com/r/vim/comments/54spzr/vim_config_portability/d84o661
let pluginstall = system("[ -e ~/.vim/autoload/plug.vim ] ; echo $?")
if pluginstall != 0
  let temp = system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
  so ~/.vim/autoload/plug.vim
endif

call plug#begin('~/.vim/plugged')
  " file system navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " linter
  Plug 'w0rp/ale'

  " git stuff
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " snippets
  Plug 'joereynolds/vim-minisnip'

  " text navigation
  Plug 'thinca/vim-visualstar'

  " debug
  Plug 'joonty/vdebug', { 'on': 'VdebugStart' }

  " language support
  Plug 'sheerun/vim-polyglot'

  " project
  Plug 'vladgor/vim-project-finder'

  " misc
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'

  " color schemes
  Plug 'vladgor/vim-gruvoff'
call plug#end()

let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'
let g:gitgutter_sign_column_always = '|'

"---
" fzf.vim
"---
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Comment'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Comment'],
      \ 'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
  " Override statusline as you like
  setlocal statusline=%#TermCursor#
  setlocal statusline+=\ fzf\ 
  setlocal statusline+=%#StatusLine#
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()


"---
" Ale
"---
" wow it's cpu consuming, so check only on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '>>'


"---
" Vdebug
"---
let g:vdebug_options = {}
let g:vdebug_options['path_maps'] = {"/var/www/drupalvm/drupal/web": "/home/pppp/vagrant/adci/drupal/web"}
