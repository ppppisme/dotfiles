
" don't minimize when pressing <c-z>
nnoremap <C-z> <nop>
inoremap <C-z> <nop>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

map <C-S-V> <C-v>

noremap <F2> :w<cr>
inoremap <F2> <esc>:w<cr>l:startinsert<cr>

noremap <S-F2> :w!<cr>
inoremap <s-F2> <esc>:w!<cr>l:startinsert<cr>

noremap <F4> :NERDTreeToggle<cr>
inoremap <F4> <esc>:NERDTreeToggle<cr>

noremap <F5> :TagbarToggle<cr>
inoremap <F5> <esc>:TagbarToggle<cr>

noremap <C-q> :q<cr>
inoremap <C-q> <esc>:q<cr>
noremap <C-S-q> :q!<cr>
inoremap <C-S-q> <esc>:q!<cr>


" shifting between windows
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

" highlight last inserted text
nnoremap gV `[v`]


" editing and sourcing vimrc
nnoremap <leader>ov :vi $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" getting over old habits
inoremap jk <esc>

inoremap <esc> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <right> <nop>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" handle regexp very magically
nmap / /\v
nmap ? ?\v

" tabshifting
noremap <C-Tab> gt
inoremap <C-Tab> <esc>gt
noremap <C-S-Tab> gT
inoremap <C-S-Tab> <esc>gT

" saves time; maps the spacebar to colon
nmap <space> :

" startify
nnoremap <leader>st :Startify<cr>

" sessions handling
nnoremap <leader>ss :SSave<cr>
nnoremap <leader>sl :SLoad<cr>
nnoremap <leader>sd :SDelete<cr>

inoremap <C-Space> <C-X><C-O><C-P>

nnoremap <leader><space> :nohlsearch<CR>

" switch current working directory to where current file is
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" clear trailing whitespaces
nnoremap <leader>stw :call StripTrailingWhitespace()<cr>

" insert-mode bindings for basic actions
inoremap <C-v> <esc>"+pli

" quicktask shortcut
nnoremap <leader>tt :QTInit<cr>

" complete whole filenames with a quicker shortcut key in insert mode
inoremap <C-f> <C-x><C-f>

inoremap <C-cr> <cr><esc>O

" insert <cr> after and before current line
nnoremap <C-cr> mpo<esc>0D`p
nnoremap <C-s-cr> mpO<esc>0D`p

" ctrlp shortcuts
nnoremap <leader>f :CtrlPFunky<cr>
nnoremap <leader>m :CtrlPMRU<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" scratch window
nnoremap gs :Sscratch<cr>

" quickrun
nnoremap <leader>q :QuickRun<cr>
vnoremap <leader>q :QuickRun<cr>

" ferret
nmap <leader>aa <Plug>(FerretAck)
nmap <leader>as <Plug>(FerretAckWord)

nnoremap \ ,

cmap w!! w !sudo tee > /dev/null %
