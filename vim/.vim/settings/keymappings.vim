" shifting between windows
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

" break string in two
nnoremap K i<cr><esc>k$l

" editing and sourcing vimrc
nnoremap <leader>vv :vi $MYVIMRC<cr>

" getting over old habits
inoremap jk <esc>

inoremap <esc> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <right> <nop>

" handle regexp very magically
nmap / /\v
nmap ? ?\v

" maps the spacebar to colon
nmap <space> :

nnoremap <leader><space> :nohlsearch<CR>

" switch current working directory to where current file is
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" clear trailing whitespaces
nnoremap <leader>stw :call StripTrailingWhitespace()<cr>

nnoremap \ ,

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>ss :Search<cr>
nnoremap <leader>sw :silent! grep! <cword> \| copen<CR><C-l>
vnoremap <leader>sw :call SearchVisual()<cr>

nnoremap <leader>e :e <C-r>=expand('%:h')<cr>/

" fzf.vim
nnoremap <c-p> :FzfFiles<cr>
nnoremap <leader>f :FzfTags<cr>
nnoremap <leader>m :FzfHistory<cr>
