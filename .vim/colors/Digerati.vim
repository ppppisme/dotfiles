" Maintainer:	Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:  October 05 2008

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "digerati"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#4f4f4f
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen guifg=#77b4c7 guibg=#4f4f4f
  hi Pmenu 		guifg=#404040 guibg=#dcdcdc
  hi PmenuSel 	guifg=#ff3b77 guibg=#93b5bf
endif

" General colors
hi Cursor 		guifg=#f0f0f0 guibg=#ff3b77 gui=none
hi Normal 		guifg=#f0f0f0 guibg=#444444 gui=none
hi NonText 		guifg=#606060               gui=none
hi LineNr 		guifg=#a0a0a0 guibg=#303030 gui=none
hi StatusLine 	guifg=#444444 guibg=#e0e0e0 gui=none
hi StatusLineNC guifg=#303030 guibg=#606060 gui=none
hi VertSplit 	guifg=#444444 guibg=#333333 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#ffffff guibg=NONE	gui=bold
hi Visual		guifg=#ffffff guibg=#b8b89f gui=none
hi SpecialKey	guifg=#808080 guibg=bg gui=none
hi CursorLineNr guifg=#ff3b77 gui=none
hi SignColumn  guibg=#2d2d2d

" Syntax highlighting
hi Comment 		guifg=#808080 gui=none
hi Todo 		guifg=#cdff00 gui=none
hi Boolean      guifg=#cdff00 gui=none
hi String 		guifg=#cdff00 gui=none
hi Identifier 	guifg=#cdff00 gui=none
hi Function 	guifg=#ffffff gui=bold
hi Type 		guifg=#77b4c7 gui=none
hi Statement 	guifg=#77b4c7 gui=none
hi Keyword		guifg=#ff3b77 gui=none
hi Constant 	guifg=#ff3b77 gui=none
hi Number		guifg=#ff3b77 gui=none
hi Special		guifg=#ff3b77 gui=none
hi PreProc 		guifg=#b8b89f gui=none

" Code-specific colors
hi pythonOperator guifg=#77b4c7 gui=none
hi htmlEndTag guifg=#ffffff gui=none 
hi htmlLink guifg=#ff3b77 gui=underline
