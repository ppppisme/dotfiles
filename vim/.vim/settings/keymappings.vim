" shifting between windows
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

" automatically indent pasted text
nnoremap p pmz`[v`]=`z

nnoremap Y y$

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

" use ctrl-p and ctrl-n in ex mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

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

" insert <cr> after and before current line
nnoremap <leader>o mzo<esc>0D`z
nnoremap <leader>O mzO<esc>0D`z
inoremap <c-j> <esc>mzo<esc>0D`za
inoremap <c-k> <esc>mzO<esc>0D`za

nnoremap \ ,

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>ss :Search<cr>
nnoremap <leader>sw :silent! grep! <cword> \| copen<CR><C-l>
vnoremap <leader>sw :call SearchVisual()<cr>

" fzf.vim
nnoremap <c-p> :FzfFiles<cr>
nnoremap <leader>b :FzfBuffers<cr>
nnoremap <leader>f :FzfTags<cr>
nnoremap <leader>m :FzfHistory<cr>
