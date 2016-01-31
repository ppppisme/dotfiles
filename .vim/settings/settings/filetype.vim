
augroup FILETYPE
	autocmd!
	autocmd FileType cpp,c,hpp,h source $VIM/settings/filetype/cpp.vim
	autocmd FileType python source $VIM/settings/filetype/python.vim
	autocmd FileType vim source $VIM/settings/filetype/vim.vim
	autocmd FileType html,css source $VIM/settings/filetype/htmlcss.vim
	autocmd FileType text source $VIM/settings/filetype/text.vim
	autocmd FileType markdown source $VIM/settings/filetype/markdown.vim
augroup END
