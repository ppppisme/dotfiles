
noremap <F4> :NERDTreeToggle<cr>
inoremap <F4> <esc>:NERDTreeToggle<cr>

" shifting between windows
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

" highlight last inserted text
nnoremap gV `[v`]

nnoremap Y y$


" break string in two
nnoremap K i<cr><esc>k$l

" editing and sourcing vimrc
nnoremap <leader>vv :vi $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

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

" complete whole filenames with a quicker shortcut key in insert mode
inoremap <C-f> <C-x><C-f>

" insert <cr> after and before current line
nnoremap <leader>o mpo<esc>0D`p
nnoremap <leader>O mpO<esc>0D`p
inoremap <c-j> <esc>mpo<esc>0D`pa
inoremap <c-k> <esc>mpO<esc>0D`pa


" ctrlp shortcuts
nnoremap <leader>f :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMRU<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" scratch window
nnoremap gs :Sscratch<cr>

" quickrun
nnoremap <leader>q :QuickRun<cr>
vnoremap <leader>q :QuickRun<cr>

nnoremap \ ,

cmap w!! w !sudo tee > /dev/null %
