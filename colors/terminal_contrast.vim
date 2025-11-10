" colors/terminal_contrast.vim
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "terminal_contrast"

set notermguicolors

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=none    ctermbg=none    cterm=none
hi Cursor          ctermfg=none    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=0       cterm=none
hi LineNr          ctermfg=7       ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=7       ctermbg=none    cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=none    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=none    ctermbg=8    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=8    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=0    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=none    ctermbg=none    cterm=none
hi Search          ctermfg=15      ctermbg=8       cterm=none
hi IncSearch       ctermfg=none    ctermbg=none    cterm=none
hi CurSearch       ctermfg=none    ctermbg=7

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=none    ctermbg=8    cterm=none
hi StatusLineNC    ctermfg=none    ctermbg=8    cterm=none
hi WildMenu        ctermfg=none    ctermbg=0    cterm=none
hi Question        ctermfg=none    ctermbg=0    cterm=none
hi Title           ctermfg=none    ctermbg=0    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=0    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=0    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=none    ctermbg=0    cterm=none
hi Visual          ctermfg=none    ctermbg=0    cterm=none
hi VisualNOS       ctermfg=none    ctermbg=0    cterm=none
hi NonText         ctermfg=none    ctermbg=0    cterm=none

hi Todo            ctermfg=none    ctermbg=none    cterm=none
hi Underlined      ctermfg=none    ctermbg=8    cterm=none
hi Error           ctermfg=none    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=none    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=6       ctermbg=none    cterm=none
hi String          ctermfg=9       ctermbg=none    cterm=none
hi StringDelimiter ctermfg=0       ctermbg=none    cterm=none
hi Character       ctermfg=9       ctermbg=none    cterm=none
hi Number          ctermfg=9       ctermbg=none    cterm=none
hi Boolean         ctermfg=9       ctermbg=none    cterm=none
hi Float           ctermfg=9       ctermbg=none    cterm=none
                                   
hi Identifier      ctermfg=15      ctermbg=none    cterm=none
hi Function        ctermfg=3       ctermbg=none    cterm=none
                                   
" --------------------------------
" Language constructs              
" --------------------------------
hi Statement       ctermfg=15      ctermbg=none    cterm=none
hi Conditional     ctermfg=15      ctermbg=none    cterm=none
hi Repeat          ctermfg=6       ctermbg=none    cterm=none
hi Label           ctermfg=6       ctermbg=none    cterm=none
hi Operator        ctermfg=6       ctermbg=none    cterm=none
hi Keyword         ctermfg=6       ctermbg=none    cterm=none
hi Exception       ctermfg=6       ctermbg=none    cterm=none
hi Comment         ctermfg=2       ctermbg=none    cterm=none
                                   
hi Special         ctermfg=6       ctermbg=none    cterm=none
hi SpecialChar     ctermfg=6       ctermbg=none    cterm=none
hi Tag             ctermfg=6       ctermbg=none    cterm=none
hi Delimiter       ctermfg=6       ctermbg=none    cterm=none
hi SpecialComment  ctermfg=6       ctermbg=none    cterm=none
hi Debug           ctermfg=6       ctermbg=none    cterm=none
                                   
" ----------                       
" - C like -                       
" ----------                       
hi PreProc         ctermfg=9       ctermbg=none    cterm=none
hi Include         ctermfg=15      ctermbg=none    cterm=none
hi Define          ctermfg=6       ctermbg=none    cterm=none
hi Macro           ctermfg=6       ctermbg=none    cterm=none
hi PreCondit       ctermfg=6       ctermbg=none    cterm=none
                                   
hi Type            ctermfg=none    ctermbg=none    cterm=none
hi StorageClass    ctermfg=6       ctermbg=none    cterm=none
hi Structure       ctermfg=13      ctermbg=none    cterm=none
hi Typedef         ctermfg=0       ctermbg=none    cterm=none
                                   
" --------------------------------
" Diff                             
" --------------------------------
hi DiffAdd         ctermfg=6       ctermbg=none    cterm=none
hi DiffChange      ctermfg=6       ctermbg=none    cterm=none
hi DiffDelete      ctermfg=6       ctermbg=none    cterm=none
hi DiffText        ctermfg=6       ctermbg=none    cterm=none
                                   
" --------------------------------
" Completion menu                  
" --------------------------------
hi Pmenu           ctermfg=6       ctermbg=none    cterm=none
hi PmenuSel        ctermfg=6       ctermbg=none    cterm=none
hi PmenuSbar       ctermfg=6       ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=6       ctermbg=none    cterm=none
                                   
" --------------------------------
" Spelling                         
" --------------------------------
hi SpellBad        ctermfg=0       ctermbg=none    cterm=none
hi SpellCap        ctermfg=0       ctermbg=none    cterm=none
hi SpellLocal      ctermfg=0       ctermbg=none    cterm=none
hi SpellRare       ctermfg=0       ctermbg=none    cterm=none
                                   
"---------------------------------
" Specific settings
"---------------------------------
hi EndOfBuffer     ctermfg=none    ctermbg=none
