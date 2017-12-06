" install Plug if missing. taken from here:
" https://www.reddit.com/r/vim/comments/54spzr/vim_config_portability/d84o661
let pluginstall=system("[ -e ~/.vim/autoload/plug.vim ] ; echo $?")
if pluginstall != 0
  let temp=system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
  so ~/.vim/autoload/plug.vim
endif

" list of plugins 
call plug#begin('~/.vim/plugged')
  " file system navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " linter
  Plug 'w0rp/ale'

  " git stuff
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " tags
  Plug 'ludovicchabant/vim-gutentags'

  " snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim'

  " decoration stuff
  Plug 'AssailantLF/vim-active-numbers'

  " text navigation
  Plug 'thinca/vim-visualstar'

  " debug
  Plug 'joonty/vdebug', { 'on': 'VdebugStart' }

  " script runner
  Plug 'thinca/vim-quickrun'

  " language support
  Plug 'sheerun/vim-polyglot'

  " misc
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'

  " color schemes
  Plug 'vladgor/gruvbox'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'tpope/vim-vividchalk'
  Plug 'w0ng/vim-hybrid'
  Plug 'AlessandroYorba/Alduin'
  Plug 'nanotech/jellybeans.vim'
  Plug 'pbrisbin/vim-colors-off'
call plug#end()

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
  setlocal statusline+=\ \ \ \ fzf\ 
  setlocal statusline+=%#SignColumn#
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()


"---
" UltiSnips
"---
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-j>"


"---
" QuickRun
"---
nnoremap <leader>q :QuickRun<cr>
vnoremap <leader>q :QuickRun<cr>


"---
" Ale
"---
" wow it's cpu consuming, so check only on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'php': ['php', 'phpcs', 'phpmd'],
\   'scss': ['scsslint'],
\}
let g:ale_php_phpcs_standard = 'Drupal'
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '>>'


"---
" Gutentags
"---
let g:gutentags_cache_dir = '~/.tags/'
let g:gutentags_project_root = ['.gutctags']
let g:gutentags_project_info = [{'type': 'php', 'file': 'index.php'}]


"---
" Vdebug
"---
let g:vdebug_options = {}
let g:vdebug_options['path_maps'] = {"/var/www/drupalvm/drupal/web": "/home/pppp/vagrant/pure/drupal/web"}