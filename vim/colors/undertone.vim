" Vim colour file
" Maintainer: Billy Brown <druidofluhn@gmail.com>

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="undertone"

highlight clear Normal
set background&
highlight clear

" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg 
 	
" Uncomment and complete the commands you want to change from the default.

"hi Cursor		
"hi CursorIM	
"hi Directory	
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
"hi VertSplit	
"hi Folded		
"hi FoldColumn	
"hi MoreMsg		
"hi NonText		
"hi Question	
"hi SpecialKey	
"hi StatusLine	
"hi StatusLineNC	
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

hi Normal       cterm=none                  ctermfg=white       ctermbg=black

" syntax highlighting groups
hi Comment      cterm=none                  ctermfg=darkgrey    ctermbg=black
hi Constant	    cterm=none                  ctermfg=grey        ctermbg=black
hi Identifier   cterm=bold                  ctermfg=white       ctermbg=black
hi Statement	cterm=bold                  ctermfg=white       ctermbg=black
hi PreProc	    cterm=none                  ctermfg=white       ctermbg=black
hi Type		    cterm=bold                  ctermfg=white       ctermbg=black
hi Special	    cterm=bold                  ctermfg=white       ctermbg=black
hi Underlined	cterm=underline             ctermfg=white       ctermbg=black
hi Ignore		cterm=none                  ctermfg=white       ctermbg=black
hi Error		cterm=bold,italic,underline ctermfg=white       ctermbg=black
hi Todo		    cterm=bold,italic           ctermfg=white       ctermbg=black

hi Conceal      cterm=none                  ctermfg=white       ctermbg=black
hi IncSearch    cterm=italic                ctermfg=white       ctermbg=black
hi LineNr       cterm=none                  ctermfg=darkgrey    ctermbg=black
hi MatchParen   cterm=underline             ctermfg=white       ctermbg=black
hi ModeMsg      cterm=none                  ctermfg=grey        ctermbg=black
hi Search	    cterm=italic                ctermfg=white       ctermbg=black
hi SpellBad     cterm=underline             ctermfg=black       ctermbg=grey
hi SpellCap     cterm=underline             ctermfg=black       ctermbg=grey
hi SpellLocal   cterm=underline             ctermfg=black       ctermbg=grey
hi SpellRare    cterm=underline             ctermfg=black       ctermbg=grey
hi StatusLine   cterm=none                  ctermfg=black       ctermbg=white
hi StatusLineNC cterm=none                  ctermfg=black       ctermbg=grey
hi Title        cterm=bold                  ctermfg=white       ctermbg=black
hi Underlined   cterm=underline
hi VertSplit    cterm=none                  ctermfg=grey        ctermbg=grey
hi Visual       cterm=none                  ctermfg=white       ctermbg=darkgrey
