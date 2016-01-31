" itg_flat for VIM
" Port of the theme-itg-flat Sublime Text theme with some minor tweaks. Credit for the original theme goes to @itsthatguy (https://github.com/itsthatguy/theme-itg-flat)
" Green/Blue - #92e4c0, LightGray - #606A74, Yellow - #DDC96D, Red - #D1605E, LightGreen #B5DC64, White - #e0e0e0, BG - #282A31

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
set t_Co=256
let colors_name = "itg_flat"

"hi String		Constant
"hi Character	Constant
"hi Number		Constant
"hi Boolean		Constant
"hi Float		Number
"hi Function	Identifier
"hi Conditional	Statement
"hi Repeat		Statement
"hi Label		Statement
"hi Operator	Statement
"hi Keyword		Statement
"hi Exception	Statement
"hi Include		PreProc
"hi Define		PreProc
"hi Macro		PreProc
"hi PreCondit	PreProc
"hi StorageClass	Type
"hi Structure	Type
"hi Typedef		Type
"hi Tag		Special
"hi SpecialChar	Special
"hi Delimiter	Special
"hi SpecialComment	Special
"hi Debug		Special
hi ColorColumn	    guifg=#e4e4e4    ctermfg=254    guibg=#cc4040   ctermbg=252    	gui=none    cterm=none
hi Comment	    	guifg=#606a74    ctermfg=240    gui=none   		cterm=none
hi Constant	    	guifg=#92e4c0    ctermfg=115    gui=none    	cterm=none
hi Cursor	   	 	guibg=#5276c0    ctermbg=255    guifg=#ffffff   ctermfg=242    	gui=none    cterm=none
hi CursorLine					   	 ctermfg=none   guibg=#404040   ctermbg=237    	gui=none    cterm=none
hi CursorLineNr     guifg=#92e4c0    gui=bold
hi Directory	    guifg=#ddc96d    ctermfg=33    	gui=none    	cterm=none
hi Folded	    	guibg=#262626    ctermbg=235    guifg=#8a8a8a   ctermfg=245    	gui=none    cterm=none
hi Function	    	guifg=#bce225    ctermfg=167    gui=none    	cterm=none
hi Identifier	    guifg=#e0e0e0    ctermfg=254    gui=none    	cterm=none
hi LineNr	    	guifg=#606a74    ctermfg=240    gui=none    	cterm=none
hi MatchParen 		guibg=#30323b    ctermbg=236    guifg=#00afff   ctermfg=39
hi MoreMsg          guifg=#d1605e
hi NonText	    	guibg=bg         ctermbg=235    guifg=#606a74   ctermfg=167    	gui=none    cterm=none
hi Normal	    	guifg=#e4e4e4    ctermfg=254    guibg=#282a31   ctermbg=234    	gui=none    cterm=none
hi Number	    	guifg=#92e4c0    ctermfg=115    gui=none    	cterm=none
hi Operator			guifg=#d1605e
hi Parameters		guifg=#e3a12d
hi ParametersBrackets guifg=#e0e0e0
hi Pmenu 			guibg=#30323b    guifg=fg
hi PmenuSbar 		guibg=#404040  	 guifg=bg
hi PmenuSel 		guibg=#5276c0	 guifg=#122637
hi PreProc	    	guifg=#d1605e    ctermfg=167    gui=none    	cterm=none
hi Search			guibg=#d66967	 ctermbg=187	guifg=#882f24	ctermfg=0 		gui=underline
hi SignColumn       guifg=fg         guibg=bg
hi Special	    	guifg=#e0e0e0    ctermfg=254    gui=none    	cterm=none
hi SpecialKey	    guifg=#444444    ctermfg=247    gui=none    	cterm=none
hi Statement	    guifg=#92e4c0    ctermfg=115    gui=none    	cterm=none
hi StatusLine	    guibg=#30323b    ctermbg=237    guifg=#e0e0e0   ctermfg=254    	gui=none    cterm=none
hi StatusLineNC	    guibg=#30323b    ctermbg=237    guifg=#e0e0e0   ctermfg=254    	gui=none    cterm=none
hi StorageClass	    guifg=#bdb76b    ctermfg=250    gui=none    	cterm=none
hi String	    	guifg=#ddc96d    ctermfg=185    gui=none    	cterm=none
hi Title	    	guifg=#e0e0e0    ctermfg=254    gui=none    	cterm=none
hi Todo	    		guifg=#d1605e    ctermfg=226    guibg=bg        cterm=none
hi Type	    		guifg=#d1605e    ctermfg=115    gui=none    	cterm=none
hi Underlined	    guifg=#80a0ff    ctermfg=89    	gui=underline   cterm=underline
hi VertSplit	    guibg=#2D2F36    ctermbg=236    guifg=#585858   ctermfg=240    	gui=none    cterm=none
hi Visual	    	guifg=#f0e68c    ctermfg=255    guibg=#6b8e23   ctermbg=242    	gui=none    cterm=none

"syntastic
hi SyntasticErrorSign     guibg=#d1605e    guifg=#532726
hi SyntasticWarningSign   guibg=#ddc96d    guifg=#413a1d
hi SyntasticStyleErrorSign    guibg=#d1605e    guifg=#532726
hi SyntasticStyleWarningSign  guibg=#ddc96d    guifg=#413a1d

"gitgutter
hi GitGutterAdd            guifg=#9bbe54
hi GitGutterChange         guifg=#ddc96d
hi GitGutterDelete         guifg=#d1605e
hi GitGutterChangeDelete   guifg=#d1605e
"

"airline
hi AirlineN1        guibg=#5276c0    guifg=#122637  gui=none
hi AirlineN2        guibg=#305091    guifg=#122637
hi AirlineN3        guibg=#222327

hi AirlineI1        guibg=#d1605e    guifg=#532726  gui=none
hi AirlineI2        guibg=#99312f    guifg=#290909

hi AirlineR1        guibg=#ddc96d    guifg=#413a1d  gui=none
hi AirlineR2        guibg=#ad962b    guifg=#413a1d

hi AirlineV1        guibg=#9bbe54    guifg=#334117
hi AirlineV2        guibg=#6e8d30    guifg=#334117

hi AirlineIA        guibg=#222327    guifg=#414247

"startify
hi StartifyBracket  guifg=#606a74
hi StartifyFile     guifg=#ddc96d
hi StartifyFooter   guifg=#5276c0
hi StartifyHeader   guifg=#d1605e
hi StartifyNumber   guifg=#d1605e
hi StartifyPath     guifg=#606a74
"hi StartifySection
"hi StartifySelect  
hi StartifySlash    guifg=#606a74
"hi StartifySpecial


