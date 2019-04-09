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

inoremap ( ()<c-o>h
inoremap { {}<c-o>h
inoremap [ []<c-o>h

nnoremap <leader>e :e <C-r>=expand('%:h')<cr>/
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>stw :call StripTrailingWhitespace()<cr>

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>ss :Search<cr>
nnoremap <leader>sw :silent! grep! <cword> \| copen<CR><C-l>
vnoremap <leader>sw :call SearchVisual()<cr>

nnoremap <c-p> :FzfFiles<cr>
nnoremap <leader>m :FzfHistory<cr>
